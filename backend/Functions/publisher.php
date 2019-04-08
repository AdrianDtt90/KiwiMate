<?php
header("Access-Control-Allow-Origin: *");

class Publisher {
    public static function publishPost($post) {
        include 'conection.php';

        //Variable
        $user_id = $post['user_id'];
        $date = $post['date'];
        $content = $post['content'];
        $image = $post['image'];

        $mysqli->autocommit(FALSE);

        $all_query_ok = true;

        $stmt = $mysqli->prepare("INSERT INTO `posts`(`user_id`, `date`, `content`) VALUES (?,?,?)");
        $stmt->bind_param('iss', $user_id, $date, $content);
        $stmt->execute() ? null : $all_query_ok = false;

        $post_id = $mysqli->insert_id;

        $stmt = $mysqli->prepare("INSERT INTO `image_x_post`(`post_id`, `image`) VALUES (?,?)");
        $stmt->bind_param('is', $post_id, $image);
        $stmt->execute() ? null : $all_query_ok = false;


        //add notification to participates post
        $stmt = $mysqli->prepare("SELECT f.user_id_1
                                FROM follow f
                                WHERE f.user_id_2 = ?");
        $stmt->bind_param('i', $user_id);
        $stmt->execute();
        $resultado = $stmt->get_result();

        while ($fila = $resultado->fetch_assoc()) {
          $stmt = $mysqli->prepare("INSERT INTO `notifications`(`action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES ('new','post',?,?,?,'N',CURDATE())");
          $stmt->bind_param('iii', $post_id, $fila['user_id_1'], $user_id);
          $stmt->execute() ? null : $all_query_ok = false;
        }


        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Post subido exitosamente."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al subir el post."
          );
        }
    }

    public static function postList($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      
      $stmt = $mysqli->prepare("SELECT p.id, p.user_id, p.date, p.content, u.username, u.image as imageProfile, ip.image as imagePost 
                                FROM posts p
                                    JOIN users u
                                        ON u.id = p.user_id
                                    LEFT JOIN image_x_post ip
                                        ON ip.post_id = p.id
                                ORDER BY DATE(p.date) DESC, p.id DESC
                                LIMIT ?");
      $stmt->bind_param('i', $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayPosts = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayPosts, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("posts" => $arrayPosts);
    }


    public static function seeMore($post) {
      include 'conection.php';

      //Variable
      $limit = $post['limit'];
      $amount = $post['amount'];

      $stmt = $mysqli->prepare("SELECT p.id, p.user_id, p.date, p.content, u.username, u.image as imageProfile, ip.image as imagePost 
                                FROM posts p
                                    JOIN users u
                                        ON u.id = p.user_id
                                    LEFT JOIN image_x_post ip
                                        ON ip.post_id = p.id
                                ORDER BY DATE(p.date) DESC, p.id DESC
                                LIMIT ?,?");
      $stmt->bind_param('ii', $amount, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayPosts = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayPosts, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("posts" => $arrayPosts);
    }


    public static function postListByUser($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];
      if(isset($post['id']))
        $user_id = $post['id'];

      $limit = $post['limit'];

      $stmt = $mysqli->prepare("SELECT p.id, p.user_id, p.date, p.content, u.username, u.image as imageProfile, ip.image as imagePost 
                                FROM posts p
                                    JOIN users u
                                        ON u.id = p.user_id
                                    LEFT JOIN image_x_post ip
                                        ON ip.post_id = p.id
                                WHERE u.id = ?
                                ORDER BY DATE(p.date) DESC, p.id DESC
                                LIMIT ?");
      $stmt->bind_param('ii', $user_id, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayPosts = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayPosts, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("posts" => $arrayPosts);
    }


    public static function seeMoreByUser($post) {
      include 'conection.php';

      //Variable
      $user_id = $post['user_id'];
      $limit = $post['limit'];
      $amount = $post['amount'];

      $stmt = $mysqli->prepare("SELECT p.id, p.user_id, p.date, p.content, u.username, u.image as imageProfile, ip.image as imagePost 
                                FROM posts p
                                    JOIN users u
                                        ON u.id = p.user_id
                                    LEFT JOIN image_x_post ip
                                        ON ip.post_id = p.id
                                WHERE u.id = ?
                                ORDER BY DATE(p.date) DESC, p.id DESC
                                LIMIT ?,?");
      $stmt->bind_param('iii', $user_id, $amount, $limit);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayPosts = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayPosts, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("posts" => $arrayPosts);
    }


    public static function getPostById($post) {
      include 'conection.php';

      //Variable
      $post_id = $post['post_id'];

      $stmt = $mysqli->prepare("SELECT p.id, p.user_id, p.date, p.content, u.username, u.image as imageProfile, ip.image as imagePost 
                                FROM posts p
                                    JOIN users u
                                        ON u.id = p.user_id
                                    LEFT JOIN image_x_post ip
                                        ON ip.post_id = p.id
                                WHERE p.id = ?
                                ORDER BY DATE(p.date) DESC, p.id DESC");
      $stmt->bind_param('i', $post_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayPosts = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayPosts, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("posts" => $arrayPosts);
    }

    public static function insertComment($post) {
        include 'conection.php';

        //Variable
        $user_id = $post['user_id'];
        $post_id = $post['post_id'];
        $comment = $post['comment'];
        $owner_id = $post['owner_id'];

        $mysqli->autocommit(FALSE);

        $all_query_ok = true;

        $stmt = $mysqli->prepare("INSERT INTO `comment_x_post`(`user_id`, `post_id`, `comment`, `image`, `date`) VALUES (?,?,?,'',CURDATE())");
        $stmt->bind_param('iis', $user_id, $post_id, $comment);
        $stmt->execute() ? null : $all_query_ok = false;


        if($owner_id != $user_id)
        {
          //add notification to post owner
          $stmt = $mysqli->prepare("SELECT n.id
                                      FROM notifications n
                                      WHERE action = 'comment' AND n.entity = 'post' AND n.entity_id = ? AND n.user_id = ?");
          $stmt->bind_param('ii', $post_id, $owner_id);
          $stmt->execute();
          $result = $stmt->get_result();

          $exist = $result->num_rows;

          if($exist == 0)
          {
            $stmt = $mysqli->prepare("INSERT INTO `notifications`(`action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES ('comment_to_owner','post',?,?,?,'N',CURDATE())");
            $stmt->bind_param('iii', $post_id, $owner_id, $user_id);
            $stmt->execute() ? null : $all_query_ok = false;
          }
        }


        //add notification to participates post
        $stmt = $mysqli->prepare("SELECT p.user_id
                                FROM comment_x_post p 
                                WHERE p.post_id = ? AND p.user_id <> ?
                                AND 0 = (SELECT COUNT(1)
                                        FROM notifications n
                                        WHERE n.entity_id = p.post_id 
                                        AND n.user_id = p.user_id
                                        AND entity = 'post'
                                        AND action = 'comment'
                                        AND viewed = 'N')");
        $stmt->bind_param('ii', $post_id, $user_id);
        $stmt->execute();
        $resultado = $stmt->get_result();

        while ($fila = $resultado->fetch_assoc()) {
          $stmt = $mysqli->prepare("INSERT INTO `notifications`(`action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES ('comment_notice','post',?,?,?,'N',CURDATE())");
          $stmt->bind_param('iii', $post_id, $fila['user_id'], $user_id);
          $stmt->execute() ? null : $all_query_ok = false;
        }


        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Comentario subido exitosamente."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error al subir el comentario."
          );
        }
    }


    public static function getCommentsPost($post) {
      include 'conection.php';

      //Variables
      $post_id = $post['post_id'];

      $stmt = $mysqli->prepare("SELECT c.id, c.user_id, c.post_id, c.comment, c.image as imagePost, c.date, u.name, u.image
                                FROM comment_x_post c
                                    JOIN users u
                                        ON u.id = c.user_id
                                WHERE c.post_id = ?
                                ORDER BY DATE(c.date), c.id");
      $stmt->bind_param('i', $post_id);
      $stmt->execute();
      $resultado = $stmt->get_result();

      $arrayComments = array();
      while ($fila = $resultado->fetch_assoc()) {
        array_push($arrayComments, $fila);
      }

      $stmt->close();
      $mysqli->close();

      return array("comments" => $arrayComments);
    }


    public static function deletePost($post) {
      include 'conection.php';

      //Variable
      $post_id = $post['post_id'];

      $mysqli->autocommit(FALSE);

      $all_query_ok = true;


      $stmt = $mysqli->prepare("DELETE FROM `image_x_post` WHERE post_id = ?");
      $stmt->bind_param('i', $post_id);
      $stmt->execute() ? null : $all_query_ok = false;

      $stmt = $mysqli->prepare("DELETE FROM `comment_x_post` WHERE post_id = ?");
      $stmt->bind_param('i', $post_id);
      $stmt->execute() ? null : $all_query_ok = false;

      $stmt = $mysqli->prepare("DELETE FROM `posts` WHERE id = ?");
      $stmt->bind_param('i', $post_id);
      $stmt->execute() ? null : $all_query_ok = false;

      $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

      $stmt->close();
      $mysqli->close();

      if($resultadoCommit) {
        return array(
          "status" => "OK", 
          "resultText" => "Publicación eliminada exitosamente."
        );
      }
      else 
      {
        return array(
          "status" => "Error", 
          "resultText" => "Error al insertar eliminar la Publicación."
        );
      }
    }

}


?>