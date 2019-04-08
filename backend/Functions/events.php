<?php
header("Access-Control-Allow-Origin: *");

class Events {

  public static function getEvents($post) {
    include 'conection.php';

    //Variable
    $limit = $post['limit'];
    $search = '';
    if(isset($post['search']))
      $search = '%' . $post['search'] . '%';

    $stmt = $mysqli->prepare("SELECT e.id, e.title, e.content, e.contact, e.address, e.date, e.image, e.user_id
                              FROM events e
                              WHERE 
                                  e.title LIKE ?
                                OR
                                  e.content LIKE ?
                                OR
                                  ? = ''
                              ORDER BY DATE(e.date) DESC
                              LIMIT ? ");
    $stmt->bind_param('sssi', $search, $search, $search, $limit);
    $stmt->execute();
    $resultado = $stmt->get_result();

    $arrayEvents = array();
    while ($fila = $resultado->fetch_assoc()) {
      array_push($arrayEvents, $fila);
    }

    $stmt->close();
    $mysqli->close();

    return array("events" => $arrayEvents);
  }

  public static function seeMore($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      $amount = $post['amount'];
      $search = '';
      if(isset($post['search']))
        $search = '%' . $post['search'] . '%';

      $stmt = $mysqli->prepare("SELECT e.id, e.title, e.content, e.contact, e.address, e.date, e.image, e.user_id
                              FROM events e
                              WHERE 
                                  e.title LIKE ?
                                OR
                                  e.content LIKE ?
                                OR
                                  ? = ''
                              ORDER BY DATE(e.date) DESC
                              LIMIT ?,?");
      $stmt->bind_param('sssii', $search, $search, $search, $amount, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayEvents = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayEvents, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("events" => $arrayEvents);
    }


    public static function addEvent($post) {
      include 'conection.php';

      //Variable
      $title = $post['title'];
      $content = $post['content'];
      $contact = $post['contact'];
      $address = $post['address'];
      $image = $post['image'];
      $user_id = $post['user_id'];
      $date = $post['date'];


      $mysqli->autocommit(FALSE);

      $all_query_ok = true;

      $stmt = $mysqli->prepare("INSERT INTO `events`(`title`, `content`, `contact`, `address`, `date`, `image`, `user_id`) VALUES (?, ?, ?, ?, ?, ?, ?)");
      $stmt->bind_param('sssssi', $title, $content, $contact, $address, $date, $image, $user_id);
      $stmt->execute() ? null : $all_query_ok = false;

      $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

      $stmt->close();
      $mysqli->close();

      if($resultadoCommit) {
        return array(
          "status" => "OK", 
          "resultText" => "Evento insertado exitosamente."
        );
      }
      else
      {
        return array(
          "status" => "Error", 
          "resultText" => "Error al insertar insertar el evento."
        );
      }
    }


    public static function deleteEvent($post) {
      include 'conection.php';

      //Variable
      $event_id = $post['event_id'];

      $mysqli->autocommit(FALSE);

      $all_query_ok = true;

      $stmt = $mysqli->prepare("DELETE FROM `events` WHERE id = ?");
      $stmt->bind_param('i', $event_id);
      $stmt->execute() ? null : $all_query_ok = false;

      $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

      $stmt->close();
      $mysqli->close();

      if($resultadoCommit) {
        return array(
          "status" => "OK", 
          "resultText" => "Evento eliminado exitosamente."
        );
      }
      else
      {
        return array(
          "status" => "Error", 
          "resultText" => "Error al insertar eliminar el evento."
        );
      }
    }

}

?>