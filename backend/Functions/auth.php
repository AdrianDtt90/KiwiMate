<?php
header("Access-Control-Allow-Origin: *");

class Auth {
    public static function manageUser($post) {
        include 'conection.php';

        //Variable
        $user_id = $post['user_id'];

        $mysqli->autocommit(FALSE);
        $all_query_ok = true;

        $stmt = $mysqli->prepare("SELECT s.id, s.username, s.name, s.image, s.about, s.contact
                                    FROM users s
                                    WHERE s.id = ?");
        $stmt->bind_param('i', $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        $exist = $result->num_rows;
        $row = $result->fetch_assoc();

        if($exist == 0)
        {
          $username = (isset($_POST['username'])) ? $_POST['username'] : 'Anonimous';
          $name = (isset($_POST['name'])) ? $_POST['name'] : 'Anonimous';
          $image = (isset($_POST['image'])) ? $_POST['image'] : 'https://image.flaticon.com/icons/png/128/149/149071.png';
          $about = (isset($_POST['about'])) ? $_POST['about'] : '----';
          $contact = (isset($_POST['contact'])) ? $_POST['contact'] : '----';

          $stmt = $mysqli->prepare("INSERT INTO users(id, username, name, image, about, contact, city_id) VALUES (?,?,?,?,?,?,4)");
          $stmt->bind_param('isssss', $user_id, $username, $name, $image, $about, $contact);
          $stmt->execute() ? null : $all_query_ok = false;
        }

        $all_query_ok ? $resultadoCommit = $mysqli->commit() : $resultadoCommit = !$mysqli->rollback();

        $stmt->close();
        $mysqli->close();

        if($resultadoCommit) {
          return array(
            "status" => "OK", 
            "resultText" => "Inicio de sesion exitoso."
          );
        }
        else
        {
          return array(
            "status" => "Error", 
            "resultText" => "Error en el inicio de sesion."
          );
        }
    }
}


?>