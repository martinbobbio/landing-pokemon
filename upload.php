<?php
		
	$nombre = strtolower ($_POST['nombre']);
	$descripcion = $_POST['descripcion'];	
	$fotoNombre = $_FILES['foto']['name'];
	$fotoTemp = $_FILES['foto']['tmp_name'];
	
	if ($nombre != "" && $descripcion != "" && !file_exists("pokemones/".$nombre)){
		 $original = imagecreatefromjpeg($fotoTemp);
	 $ancho = imagesx($fotoTemp);
	 $alto = imagesy($fotoTemp);
	 $ancho2 = 475;
	 $alto2 = round($ancho2 * $alto/$ancho);
	 $copia = imagecreatetruecolor($ancho2,$alto2);
	 
	 imagecopyresampled(
		$copia,$original,
		0,0,0,0,
		$ancho2, $alto2,
		$ancho, $alto
		);
	imagejpeg($copia,"pokemones/".$nombre.'/'.$fotoTemp);
	
	mkdir ("pokemones/".$nombre);
	move_uploaded_file ($fotoTemp, "pokemones/".$nombre."/".$fotoNombre);
	$archivo = fopen ("pokemones/".$nombre."/descripcion.txt","a");
	fputs ($archivo , $descripcion);
	
   
	
	header("Location: index.php?seccion=pokemons");
	
	}else{
		header("Location: index.php?seccion=upload");
		}
	 
	 
	 



	
?>