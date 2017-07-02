<?php
	
	require ("../pokemones.php");
	
	header("Location: ../index.php?seccion=trivia&pokemon=".$_POST['_token']."&estado=error");	
	
	$respuesta = ucwords(strtolower($_POST['pokemon']));
	$hash = $_POST['_token'];
	
	for($i=0;$i<sizeof($pokemons);$i++){
		
		if ($respuesta == $pokemons[$i][1]){
			$index = $i;
			}
		
		}
	if ($hash == $pokemons[$index][2]){
				header("Location: ../index.php?seccion=trivia&pokemon=".$_POST['_token']."&estado=success");	
				}else{
					header("Location: ../index.php?seccion=trivia&pokemon=".$_POST['_token']."&estado=error");
					}
	
	
	
?>