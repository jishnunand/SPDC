<?php
	Header("Access-Control-Allow-Origin: *");
	$myfile = fopen("E:/jishnu.txt", "a");
	$txt = "hai jishnu";
	fwrite($myfile, $txt);
	fclose($myfile);
	echo "hai";
?>