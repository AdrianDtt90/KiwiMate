<?php
session_start();

function accessPoint($user_id, $token)
{
  if(!verifyFormToken($user_id, $token, 600))
  {
    manageUser($user_id);
    return generateFormToken($user_id);
  }
  
  return $token;
}

function generateFormToken($user_id) {
 
   $token = md5(uniqid(microtime(), true));
 
   $token_time = time();
   $_SESSION['csrf'][$user_id.'_token'] = array('token'=>$token, 'time'=>$token_time);
 
   return $token;
}

function verifyFormToken($user_id, $token, $delta_time=0) {

	if(!isset($_SESSION['csrf'][$user_id.'_token'])) {
		return false;
	}

	if ($_SESSION['csrf'][$user_id.'_token']['token'] !== $token) {
		return false;
	}

	if($delta_time > 0){
	$token_age = time() - $_SESSION['csrf'][$user_id.'_token']['time'];
		if($token_age >= $delta_time){
			return false;
		}
	}

	//reset token time
	$_SESSION['csrf'][$user_id.'_token']['time'] = time();
	return true;
}

function logout() {
  session_unset();
  session_destroy();
}

?>