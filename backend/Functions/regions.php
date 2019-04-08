<?php
header("Access-Control-Allow-Origin: *");

class Regions {
    public static function getRegions($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];

      $stmt = $mysqli->prepare("SELECT c.id, c.name, c.region, u.city_id as city_id_user
                                FROM cities c
                                LEFT JOIN users u
                                    ON u.city_id = c.id AND u.id = ?
                                WHERE 1 = 1
                                ORDER BY c.name");
      $stmt->bind_param('i', $user_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayRegions = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayRegions, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("regions" => $arrayRegions);
    }


    public static function getRegionsUsers($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];

      $stmt = $mysqli->prepare("SELECT c.id, c.name, c.region, u.city_id as city_id_user, (SELECT COUNT(1) FROM users u2 WHERE u2.city_id = c.id AND u2.id <> ? ) as total_users
                                FROM cities c
                                LEFT JOIN users u
                                    ON u.city_id = c.id AND u.id = ?
                                WHERE 1 = 1
                                ORDER BY c.name");
      $stmt->bind_param('ii', $user_id, $user_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayRegions = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayRegions, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("regions" => $arrayRegions);
    }


    public static function changeRegion($post) {
        include 'conection.php';

        //Variable
        $user_id = $post['user_id'];
        $city_id = $post['city_id'];

        $mysqli->autocommit(FALSE);

        $all_query_ok = true;

        $stmt = $mysqli->prepare("UPDATE users 
                                  SET city_id = ?
                                  WHERE id = ?");
        $stmt->bind_param('ii', $city_id, $user_id);
        $stmt->execute() ? null : $all_query_ok = false;

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Region actualizada exitosamente."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al actualizar la region."
          );
        }
    }


}


?>