<?php
header("Access-Control-Allow-Origin: *");

class Notifications {
    public static function getNotifications($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];
      $limit = $post['limit'];

      $stmt = $mysqli->prepare("SELECT n.id, n.action, n.entity, n.entity_id, n.user_id, n.user_id_action, n.viewed, n.date,
                                u.username as username_notif, u.image as image_notif
                                FROM notifications n
                                  JOIN users u 
                                    ON u.id =  n.user_id_action
                                WHERE user_id = ?
                                ORDER BY DATE(date) DESC
                                LIMIT ?");
      $stmt->bind_param('ii', $user_id, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayNotifications = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayNotifications, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("notifications" => $arrayNotifications);
    }


    public static function seeMore($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];
      $limit = $post['limit'];
      $amount = $post['amount'];

      $stmt = $mysqli->prepare("SELECT n.id, n.action, n.entity, n.entity_id, n.user_id, n.user_id_action, n.viewed, n.date,
                                u.username as username_notif, u.image as image_notif
                                FROM notifications n
                                  JOIN users u 
                                    ON u.id =  n.user_id_action
                                WHERE user_id = ?
                                ORDER BY DATE(date) DESC
                                LIMIT ?,?");
      $stmt->bind_param('iii', $user_id, $amount, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayNotifications = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayNotifications, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("notifications" => $arrayNotifications);
    }


    public static function readNotification($post) {
        include 'conection.php';

        //Variable
        $notification_id = $post['notification_id'];

        $mysqli->autocommit(FALSE);

        $all_query_ok = true;

        $stmt = $mysqli->prepare("UPDATE notifications
                                  SET viewed = 'Y'
                                  WHERE id = ?");
        $stmt->bind_param('i', $notification_id);
        $stmt->execute() ? null : $all_query_ok = false;

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Notificación actualizada exitosamente."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al actualizar la notificación."
          );
        }
    }

}


?>