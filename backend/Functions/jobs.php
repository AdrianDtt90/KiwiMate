<?php
header("Access-Control-Allow-Origin: *");

class Jobs {
    public static function getJobs($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      $search = '';
      if(isset($post['search']))
        $search = '%' . $post['search'] . '%';

      $stmt = $mysqli->prepare("SELECT id, title, type, date, content, contact, image, user_id 
                                FROM jobs 
                                WHERE 
                                  title LIKE ?
                                OR
                                  type LIKE ?
                                OR
                                  content LIKE ?
                                OR
                                  ? = ''
                                ORDER BY DATE(date) DESC
                                LIMIT ?");
      $stmt->bind_param('ssssi', $search, $search, $search, $search, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayJobs = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayJobs, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("jobs" => $arrayJobs);
    }


    public static function seeMore($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      $amount = $post['amount'];
      $search = '';
      if(isset($post['search']))
        $search = '%' . $post['search'] . '%';

      $stmt = $mysqli->prepare("SELECT id, title, type, date, content, contact, image, user_id 
                                FROM jobs 
                                WHERE 
                                  title LIKE ?
                                OR
                                  type LIKE ?
                                OR
                                  content LIKE ?
                                OR
                                  ? = ''
                                ORDER BY DATE(date) DESC
                                LIMIT ?,?");
      $stmt->bind_param('ssssii', $search, $search, $search, $search, $amount, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayJobs = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayJobs, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("jobs" => $arrayJobs);
    }


    public static function addJob($post) {
        include 'conection.php';

        //Variable
        $user_id = $post['user_id'];
        $title = $post['title'];
        $type = $post['type'];
        $content = $post['content'];
        $contact = $post['contact'];
        $image = $post['image'];

        $mysqli->autocommit(FALSE);

        $all_query_ok = true;

        $stmt = $mysqli->prepare("INSERT INTO `jobs`(`title`, `type`, `date`, `content`, `contact`, `image`, `user_id`)     VALUES (?, ?, CURDATE(), ?, ?, ?, ?)");
        $stmt->bind_param('sssssi', $title, $type, $content, $contact, $image, $user_id);
        $stmt->execute() ? null : $all_query_ok = false;

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Trabajo insertado exitosamente."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al insertar insertar el trabajo."
          );
        }
    }


    public static function deleteJob($post) {
        include 'conection.php';

        //Variable
        $job_id = $post['job_id'];

        $mysqli->autocommit(FALSE);

        $all_query_ok = true;

        $stmt = $mysqli->prepare("DELETE FROM `jobs` WHERE id = ?");
        $stmt->bind_param('i', $job_id);
        $stmt->execute() ? null : $all_query_ok = false;

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Trabajo eliminado exitosamente."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al insertar eliminar el trabajo."
          );
        }
    }

}


?>