<?php
header("Access-Control-Allow-Origin: *");

class Profile {

    public static function getUserProfile($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];

      $stmt = $mysqli->prepare("SELECT u.id, u.username, u.name, u.image, u.about, u.contact, u.city_id, c.name as city,
                              (SELECT COUNT(1) FROM kiwi_x_entity ke WHERE ke.user_id = u.id) AS amount_kiwis
                              FROM users u
                                JOIN cities c 
                                    ON u.city_id = c.id
                              WHERE u.id = ?");
      $stmt->bind_param('i', $user_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayUser = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayUser, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("users" => $arrayUser);
    }

    public static function getUserProfileById($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];
      $user_id2 = $post['id'];

      $stmt = $mysqli->prepare("SELECT u.id, u.username, u.name, u.image, u.about, u.contact, u.city_id, c.name as city, c.region, (CASE WHEN f.id IS NOT NULL THEN 'Y' ELSE 'N' END) as follow, (SELECT COUNT(1) FROM kiwi_x_entity ke WHERE ke.user_id = u.id) AS amount_kiwis
                                FROM users u 
                                  JOIN cities c 
                                    ON u.city_id = c.id
                                  LEFT JOIN follow f 
                                    ON  f.user_id_2 = u.id AND f.user_id_1 = ?
                                WHERE u.id = ?");
      $stmt->bind_param('ii', $user_id, $user_id2);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayUser = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayUser, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("users" => $arrayUser);
    }

    public static function changeAbout($post) {
        include 'conection.php';

        //Variable
        $user_id = $post['user_id'];
        $about = $post['about'];

        $mysqli->autocommit(FALSE);

        $all_query_ok = true;

        $stmt = $mysqli->prepare("UPDATE users 
                                  SET about = ?
                                  WHERE id = ?");
        $stmt->bind_param('si', $about, $user_id);
        $stmt->execute() ? null : $all_query_ok = false;

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Perfil actualizada exitosamente."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al actualizar el perfil."
          );
        }
    }


    public static function updateFollow($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];
      $user_id2 = $post['user_id2'];

      $mysqli->autocommit(FALSE);
      $all_query_ok = true;

      $stmt = $mysqli->prepare("SELECT id, user_id_1, user_id_2
                                FROM follow f
                                WHERE user_id_1 = ? AND user_id_2 = ?");
      $stmt->bind_param('ii', $user_id, $user_id2);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $exist = $resultado->num_rows;
      $row = $resultado->fetch_assoc();

      $follow;
      if($exist == 0)
      {
        $stmt = $mysqli->prepare("INSERT INTO `follow`(`user_id_1`, `user_id_2`) VALUES (?,?)");
        $stmt->bind_param('ii', $user_id, $user_id2);
        $stmt->execute() ? null : $all_query_ok = false;

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $follow = 'Y';
      }
      else
      {
        $stmt = $mysqli->prepare("DELETE FROM `follow` WHERE user_id_1 = ? AND user_id_2 = ?");
        $stmt->bind_param('ii', $user_id, $user_id2);
        $stmt->execute() ? null : $all_query_ok = false;

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $follow = 'N';
      }

      $stmt->close();
      $mysqli->close();

      if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Kiwi actualizado exitosamente.",
            "follow" => $follow
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al actualizar el kiwi."
          );
        }
    }


    public static function changeContact($post) {
        include 'conection.php';

        //Variable
        $user_id = $post['user_id'];
        $contact = $post['contact'];

        $mysqli->autocommit(FALSE);

        $all_query_ok = true;

        $stmt = $mysqli->prepare("UPDATE users 
                                  SET contact = ?
                                  WHERE id = ?");
        $stmt->bind_param('si', $contact, $user_id);
        $stmt->execute() ? null : $all_query_ok = false;

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Perfil actualizada exitosamente."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al actualizar el perfil."
          );
        }
    }



    public static function getMyFollowers($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];

      $stmt = $mysqli->prepare("SELECT u.id as user_id, u.name, u.image, c.name as city, c.region
                                FROM follow f 
                                  JOIN users u 
                                      ON  u.id = f.user_id_2
                                    JOIN cities c 
                                      ON c.id = u.city_id
                                WHERE f.user_id_1 = ?");
      $stmt->bind_param('i', $user_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayFollowers = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayFollowers, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("followers" => $arrayFollowers);
    }


    public static function getFollowersById($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['id'];

      $stmt = $mysqli->prepare("SELECT u.id as user_id, u.name, u.image, c.name as city, c.region
                                FROM follow f 
                                  JOIN users u 
                                      ON  u.id = f.user_id_2
                                    JOIN cities c 
                                      ON c.id = u.city_id
                                WHERE f.user_id_1 = ?");
      $stmt->bind_param('i', $user_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayFollowers = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayFollowers, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("followers" => $arrayFollowers);
    }
}


?>