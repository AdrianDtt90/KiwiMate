<?php
header("Access-Control-Allow-Origin: *");

class Places {
    public static function getPlaces($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      $search = '';
      if(isset($post['search']))
        $search = '%' . $post['search'] . '%';

      $stmt = $mysqli->prepare("SELECT p.id, p.name, p.thumb, p.type, p.address, p.content, p.rate, p.x, p.y, p.letter 
                                FROM places p
                                WHERE 
                                  p.name LIKE ?
                                OR
                                  p.content LIKE ?
                                OR
                                  ? = ''
                                ORDER BY name DESC
                                LIMIT ?");
      $stmt->bind_param('sssi', $search, $search, $search, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayPlaces = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayPlaces, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("places" => $arrayPlaces);
    }


    public static function seeMore($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      $amount = $post['amount'];
      $search = '';
      if(isset($post['search']))
        $search = '%' . $post['search'] . '%';

      $stmt = $mysqli->prepare("SELECT p.id, p.name, p.thumb, p.type, p.address, p.content, p.rate, p.x, p.y, p.letter 
                                FROM places p
                                WHERE 
                                  p.name LIKE ?
                                OR
                                  p.content LIKE ?
                                OR
                                  ? = ''
                                ORDER BY name DESC
                                LIMIT ?,?");
      $stmt->bind_param('sssii', $search, $search, $search, $amount, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayPlaces = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayPlaces, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("places" => $arrayPlaces);
    }

}

?>