<?php
header("Access-Control-Allow-Origin: *");

class Hosts {
    public static function getHosts($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      $search = '';
      if(isset($post['search']))
        $search = '%' . $post['search'] . '%';

      $stmt = $mysqli->prepare("SELECT h.id, h.title, h.place, h.content, h.contact, h.price, h.likes, h.comments, h.imagesProduct 
                                FROM hosts h
                                WHERE 
                                  h.title LIKE ?
                                OR
                                  h.content LIKE ?
                                OR
                                  ? = ''
                                ORDER BY title DESC
                                LIMIT ?");
      $stmt->bind_param('sssi', $search, $search, $search, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayHosts = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayHosts, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("hosts" => $arrayHosts);
    }


    public static function seeMore($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      $amount = $post['amount'];
      $search = '';
      if(isset($post['search']))
        $search = '%' . $post['search'] . '%';

      $stmt = $mysqli->prepare("SELECT h.id, h.title, h.place, h.content, h.contact, h.price, h.likes, h.comments, h.imagesProduct 
                                FROM hosts h
                                WHERE 
                                  h.title LIKE ?
                                OR
                                  h.content LIKE ?
                                OR
                                  ? = ''
                                ORDER BY title DESC
                                LIMIT ?,?");
      $stmt->bind_param('sssii', $search, $search, $search, $amount, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayHosts = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayHosts, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("hosts" => $arrayHosts);
    }

}

?>