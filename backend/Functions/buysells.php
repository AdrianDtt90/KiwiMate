<?php
header("Access-Control-Allow-Origin: *");

class BuySells {

  public static function getBuySells($post) {
    include 'conection.php';

    //Variable
    $limit = $post['limit'];
    $search = '';
    if(isset($post['search']))
      $search = '%' . $post['search'] . '%';

    $stmt = $mysqli->prepare("SELECT b.id, b.title, b.date, b.content, b.contact, b.price, b.likes, b.comments, 
                              b.image, b.user_id, u.username, u.image as imageProfile
                              FROM buysells b
                                JOIN users u  
                                  ON u.id = b.user_id
                              WHERE 
                                b.title LIKE ?
                              OR
                                b.content LIKE ?
                              OR
                                ? = ''
                              ORDER BY DATE(b.date) DESC 
                              LIMIT ?");
    $stmt->bind_param('sssi', $search, $search, $search, $limit);
    $stmt->execute();
    $resultado = $stmt->get_result();

    $arrayBuySells = array();
    while ($fila = $resultado->fetch_assoc()) {
      array_push($arrayBuySells, $fila);
    }

    $stmt->close();
    $mysqli->close();

    return array("buysells" => $arrayBuySells);
  }

  public static function seeMore($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      $amount = $post['amount'];
      $search = '';
      if(isset($post['search']))
        $search = '%' . $post['search'] . '%';

      $stmt = $mysqli->prepare("SELECT b.id, b.title, b.date, b.content, b.contact, b.price, b.likes, b.comments, 
                              b.image, b.user_id, u.username, u.image as imageProfile
                              FROM buysells b
                                JOIN users u  
                                  ON u.id = b.user_id
                              WHERE 
                                b.title LIKE ?
                              OR
                                b.content LIKE ?
                              OR
                                ? = ''
                              ORDER BY DATE(b.date) DESC 
                              LIMIT ?,?");
      $stmt->bind_param('sssii', $search, $search, $search, $amount, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayBuySells = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayBuySells, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("buysells" => $arrayBuySells);
    }

  public static function addBuySell($post) {
      include 'conection.php';

      //Variable
      $title = $post['title'];
      $content = $post['content'];
      $contact = $post['contact'];
      $price = $post['price'];
      $image = $post['image'];
      $user_id = $post['user_id'];


      $mysqli->autocommit(FALSE);

      $all_query_ok = true;

      $stmt = $mysqli->prepare("INSERT INTO `buysells`(`title`, `date`, `content`, `contact`, `price`, `image`, `user_id`) VALUES (?, CURDATE(), ?, ?, ?, ?, ?)");
      $stmt->bind_param('sssssi', $title, $content, $contact, $price, $image, $user_id);
      $stmt->execute() ? null : $all_query_ok = false;

      $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

      $stmt->close();
      $mysqli->close();

      if($resultadoCommit) {
        return array(
          "status" => "OK", 
          "resultText" => "Compra/Venta insertada exitosamente."
        );
      }
      else
      {
        return array(
          "status" => "Error", 
          "resultText" => "Error al insertar insertar la Compra/Venta."
        );
      }
    }


    public static function deleteBuySell($post) {
      include 'conection.php';

      //Variable
      $buysell_id = $post['buysell_id'];

      $mysqli->autocommit(FALSE);

      $all_query_ok = true;

      $stmt = $mysqli->prepare("DELETE FROM `buysells` WHERE id = ?");
      $stmt->bind_param('i', $buysell_id);
      $stmt->execute() ? null : $all_query_ok = false;

      $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

      $stmt->close();
      $mysqli->close();

      if($resultadoCommit) {
        return array(
          "status" => "OK", 
          "resultText" => "Compra/Venta eliminada exitosamente."
        );
      }
      else
      {
        return array(
          "status" => "Error", 
          "resultText" => "Error al insertar eliminar la Compra/Venta."
        );
      }
    }

}

?>