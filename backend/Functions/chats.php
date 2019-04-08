<?php
header("Access-Control-Allow-Origin: *");

class Chats {

    public static function getChats($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];

      $stmt = $mysqli->prepare("SELECT u.id, u.username, u.name, u.image, u.about, u.contact, u.city_id, c.name as city, c.region
                                FROM users u
                                  JOIN cities c
                                    ON c.id = u.city_id
                                WHERE u.id <> ?");
      $stmt->bind_param('i', $user_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayChats = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayChats, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("chats" => $arrayChats);
    }


    public static function getUserChats($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];

      $stmt = $mysqli->prepare("SELECT ch.user_id, ch.username, ch.image, ch.city, ch.lastText, MAX(date) as date
                                FROM (SELECT DISTINCT (CASE WHEN c.user_id_1 = u.id THEN c.user_id_2 ELSE c.user_id_1 END) as user_id,
                                (CASE WHEN c.user_id_1 = u.id THEN u2.username ELSE u1.username END) as username,
                                (CASE WHEN c.user_id_1 = u.id THEN u2.image ELSE u1.image END) as image,
                                (CASE WHEN c.user_id_1 = u.id THEN CONCAT(r2.name, ' (', r2.region, ')') ELSE CONCAT(r1.name, ' (', r1.region, ')') END) as city,
                                (SELECT c2.text FROM chats c2 WHERE c.user_id_1 = u.id OR c.user_id_2 = u.id ORDER BY c2.id DESC LIMIT 1) as lastText,
                                MAX(c.time) as date
                                FROM users u 
                                  JOIN chats c 
                                      ON c.user_id_1 = u.id OR c.user_id_2 = u.id
                                    JOIN users u1 
                                      ON u1.id = c.user_id_1
                                    JOIN cities r1
                                      ON r1.id = u1.city_id
                                    JOIN users u2 
                                      ON u2.id = c.user_id_2
                                    JOIN cities r2
                                      ON r2.id = u2.city_id
                                WHERE u.id = ?
                                GROUP BY c.user_id_1, c.user_id_2) ch
                                GROUP BY ch.user_id
                                ORDER BY DATE(ch.date) DESC");
      $stmt->bind_param('i', $user_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayChats = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayChats, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("chats" => $arrayChats);
    }


    public static function getChatDetails($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];
      $user_id2 = $post['user_id2'];

      $stmt = $mysqli->prepare("SELECT u.id, u.username, u.name, u.image, u.about, u.contact, u.city_id,
                                c.user_id_sender, (case when c.user_id_sender = ? then 'sent' else 'received' end) as type,
                                c.text, c.image, c.time
                                FROM chats c
                                  JOIN users u
                                    ON c.user_id_sender = u.id
                                WHERE u.id = ? OR u.id = ?
                                ORDER BY DATE(c.time), c.id");
      $stmt->bind_param('iii', $user_id, $user_id, $user_id2);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayChats = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayChats, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("chats" => $arrayChats);
    }


    public static function updateChat($post) {
        include 'conection.php';

        //Variable
        $user_id = $post['user_id'];
        $user_id2 = $post['user_id2'];
        $content = $post['content'];

        $mysqli->autocommit(FALSE);

        $all_query_ok = true;

        $stmt = $mysqli->prepare("INSERT INTO `chats`(`user_id_1`, `user_id_2`, `user_id_sender`, `text`, `image`, `time`) VALUES (?,?,?,?,'',CURDATE())");
        $stmt->bind_param('iiis', $user_id, $user_id2, $user_id, $content);
        $stmt->execute() ? null : $all_query_ok = false;

        //add notification to participates post
        $stmt = $mysqli->prepare("SELECT DISTINCT p.user_id_2
                                FROM chats p 
                                WHERE p.user_id_1 = ? 
                                AND 0 = (SELECT COUNT(1)
                                        FROM notifications n
                                        WHERE n.entity_id = p.user_id_2 
                                        AND n.user_id = p.user_id_2
                                        AND entity = 'chats'
                                        AND action = 'message'
                                        AND viewed = 'N')");
        $stmt->bind_param('i', $user_id);
        $stmt->execute();
        $resultado = $stmt->get_result();

        while ($fila = $resultado->fetch_assoc()) {
          $stmt = $mysqli->prepare("INSERT INTO `notifications`(`action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES ('message','chat',?,?,?,'N',CURDATE())");
          $stmt->bind_param('iii', $user_id, $user_id2, $user_id);
          $stmt->execute() ? null : $all_query_ok = false;
        }

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Texto subido exitosamente."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al subir el texto."
          );
        }
    }

}


?>