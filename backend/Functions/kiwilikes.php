<?php
header("Access-Control-Allow-Origin: *");

class KiwiLikes {
    public static function getKiwiAmount($post) {
      include 'conection.php';

      $entity = $post['entity'];
      $entity_id = $post['entity_id'];
      $user_id = $post['user_id'];

      $stmt = $mysqli->prepare("SELECT 'entity' as type, COUNT(1) AS amount
                                FROM kiwi_x_entity ke 
                                WHERE entity = ? AND entity_id = ?
                                UNION 
                                SELECT 'user' as type, COUNT(1) AS amount
                                FROM kiwi_x_entity ke 
                                WHERE entity = ? AND entity_id = ?  AND user_id = ?");
      $stmt->bind_param('sisii', $entity, $entity_id, $entity, $entity_id, $user_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayKiwis = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayKiwis, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("kiwis" => $arrayKiwis);
    }


    public static function addRemoveKiwi($post) {
      include 'conection.php';

      $entity = $post['entity'];
      $entity_id = $post['entity_id'];
      $user_id = $post['user_id'];
      $owner_id = $post['owner_id'];

      $mysqli->autocommit(FALSE);
      $all_query_ok = true;

      $stmt = $mysqli->prepare("SELECT entity, entity_id, user_id
                                FROM kiwi_x_entity ke 
                                WHERE entity = ? AND entity_id = ? AND user_id = ?");
      $stmt->bind_param('sii', $entity, $entity_id, $user_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $exist = $resultado->num_rows;
      $row = $resultado->fetch_assoc();

      if($exist == 0)
      {
        $stmt = $mysqli->prepare("INSERT INTO `kiwi_x_entity`(`entity`, `entity_id`, `user_id`) VALUES (?,?,?)");
        $stmt->bind_param('sii', $entity, $entity_id, $user_id);
        $stmt->execute() ? null : $all_query_ok = false;

        if($owner_id != $user_id)
        {
          $stmt = $mysqli->prepare("SELECT n.id
                                      FROM notifications n
                                      WHERE action = 'like' AND n.entity = ? AND n.entity_id = ? AND n.user_id = ?");
          $stmt->bind_param('sii', $entity, $entity_id, $owner_id);
          $stmt->execute();
          $result = $stmt->get_result();

          $exist = $result->num_rows;

          if($exist == 0)
          {
            $stmt = $mysqli->prepare("INSERT INTO `notifications`(`action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES ('like',?,?,?,?,'N',CURDATE())");
            $stmt->bind_param('siii', $entity, $entity_id, $owner_id, $user_id);
            $stmt->execute() ? null : $all_query_ok = false;
          }
        }


        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();
      }
      else
      {
        $stmt = $mysqli->prepare("DELETE FROM `kiwi_x_entity` WHERE entity = ? AND entity_id = ? AND user_id = ?");
        $stmt->bind_param('sii', $entity, $entity_id, $user_id);
        $stmt->execute() ? null : $all_query_ok = false;

        $stmt = $mysqli->prepare("SELECT n.id
                                    FROM notifications n
                                    WHERE action = 'like' AND n.entity = ? AND n.entity_id = ? AND n.user_id = ?");
        $stmt->bind_param('sii', $entity, $entity_id, $owner_id);
        $stmt->execute();
        $result = $stmt->get_result();

        $exist = $result->num_rows;

        if($exist > 0)
        {
          $stmt = $mysqli->prepare("DELETE FROM `notifications` WHERE action = 'like' AND entity = ? AND entity_id = ? AND user_id = ?");
          $stmt->bind_param('sii', $entity, $entity_id, $owner_id);
          $stmt->execute() ? null : $all_query_ok = false;
        }

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();
      }

      $stmt->close();
      $mysqli->close();

      if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Kiwi actualizado exitosamente."
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
}


?>