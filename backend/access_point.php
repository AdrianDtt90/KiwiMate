<?php
header("Access-Control-Allow-Origin: *");
$_POST = json_decode(file_get_contents('php://input'), true);

require_once __DIR__ . '/Functions/auth.php';
require_once __DIR__ . '/Functions/publisher.php';
require_once __DIR__ . '/Functions/kiwilikes.php';
require_once __DIR__ . '/Functions/regions.php';
require_once __DIR__ . '/Functions/profile.php';
require_once __DIR__ . '/Functions/chats.php';
require_once __DIR__ . '/Functions/notifications.php';


require_once __DIR__ . '/Functions/buysells.php';
require_once __DIR__ . '/Functions/events.php';
require_once __DIR__ . '/Functions/hosts.php';
require_once __DIR__ . '/Functions/jobs.php';
require_once __DIR__ . '/Functions/places.php';

function accessPoint($section, $service)
{
	try {
		echo json_encode($section::$service($_POST));
	} catch (Exception $e) {
		echo json_encode(array("status" => "Error", "error" => "Acceso denegado."));
	}
}

if(isset($_POST['user_id']) && isset($_POST['accessToken']))
{
	require_once __DIR__ . '/Facebook/autoload.php';
	require_once __DIR__ . '/Facebook/Facebook.php';

	$user_id = $_POST['user_id'];
	$accessToken = $_POST['accessToken'];
	
	$fb = new Facebook\Facebook([
	  'app_id' => '1275764792516077',
	  'app_secret' => '5e319c453ae387c757f3d32bc3df6dee',
	  'default_graph_version' => 'v2.8'
	]);

	try {
	  // Returns a `Facebook\FacebookResponse` object
	  $response = $fb->get('/me?fields=id,name', $accessToken);
	} catch(Facebook\Exceptions\FacebookResponseException $e) {
		echo json_encode(array("status" => "Error", "error" => 'Graph returned an error: ' . $e->getMessage()));
	  exit;
	} catch(Facebook\Exceptions\FacebookSDKException $e) {
		echo json_encode(array("status" => "Error", "error" => 'Facebook SDK returned an error: ' . $e->getMessage()));
	  exit;
	}

	$user = $response->getGraphUser();

	if($user->getProperty('id') == $user_id)
		accessPoint($_POST['section'], $_POST['service']);
	else
		echo json_encode(array("status" => "Error", "error" => "Acceso denegado."));
}
else
	echo json_encode(array("status" => "Error", "error" => "Error de acceso."));

?>