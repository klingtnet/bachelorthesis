<?php

	$apiUri = "http://api.spreadshirt.net/api/v1/"
	$username = "Username";
	$password = "Password";
	$userId = "123456";
//@\ding{202}@//   $login = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'.
	  '<login xmlns="http://api.spreadshirt.net"/>'.
	  '	<username>"%s"</username>'.
	  '	<password>"%s"</password>'.
	  '</login>';
	$login = sprintf($login, $username, $password);

	$curlHandler = curl_init($apiUri . "sessions");
	curl_setopt($curlHandler, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($curlHandler, CURLOPT_POST, 1);
	curl_setopt($curlHandler, CURLOPT_POSTFIELDS, $login);
	curl_setopt($curlHandler, CURLOPT_HEADER, true);
	$response = curl_exec($curlHandler);

	$header_size = curl_getinfo($curlHandler, CURLINFO_HEADER_SIZE);
	$header = parseHTTPHeader(substr($response, 0, $header_size));
	$sessionId = preg_replace('/.*\//',"",$header['Location']); 
	curl_close($curlHandler);

	$resourceUri = $apiUri . "users/" . $userId . "/products";
	$authHeader = getAuthentificationHeader("GET", $resourceUri, $sessionId);

	$parameters = array("mediaType"=>"json");
	$query = http_build_query($parameters);
	$curlHandler = curl_init($resourceUri . "?" . $query);
	curl_setopt($curlHandler, CURLOPT_HTTPHEADER, $authHeader);
	curl_setopt($curlHandler, CURLOPT_RETURNTRANSFER, TRUE);
	curl_setopt($curlHandler, CURLOPT_HEADER, true);
	$response = curl_exec($curlHandler);

	$header_size = curl_getinfo($curlHandler, CURLINFO_HEADER_SIZE);
	$products = json_decode(substr($response, $header_size));
	curl_close($curlHandler);

	public function getAuthentificationHeader($methodName, $uri, $sessionId) {
		$apiKey = "123456789";
		$secret = "987654312";
		$time = time()*1000;

		$data = "$method $url $time";
		$sig = sha1("$data $secret");

		return array("Authorization: SprdAuth apiKey=\"$apiKey\", data=\"$data\", sig=\"$sig\", sessionId=\"$sessionId\"");
	}

	function parseHTTPHeader($header) 
	{
		$parsedHeader = array();
		$exploded = explode("\r\n", $header);
		foreach($exploded as $line) 
		{
		    if(!empty($line)) 
			{
		        $tmp = explode(":", $line, 2);
		        if(isset($tmp[1])) 
				{
		            $parsedHeader[$tmp[0]] = trim($tmp[1]);
		        }
		    }
		}

		return $parsedHeader;
	}
	
?>
