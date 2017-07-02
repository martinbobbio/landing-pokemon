<?php
    // Solo permitimos acceder a esta sección desde el index
    if (!defined('SECURE')) die('Acceso denegado.');
	   
	require ("pokemones.php");

	$pos = array_rand($pokemons,1);
	$correcto = $_GET['pokemon'];
	$mensaje1 = "Bien!";
	$boton = "Intenta devuelta";
	
	for($i=0;$i<sizeof($pokemons);$i++){
		if($correcto==$pokemons[$i][2]){
			$pokemon = $pokemons[$i];
			$mensaje2 = $pokemon[1];
			}
		}
	
	if($_GET['estado'] != "success"){
		$pokemon = $pokemons[$pos];
		$mensaje1 = "Mal!";
		$mensaje2 = "???";
		$boton = "Resolver";
		}
	
?>

	<div class="text-center" id="trivia">
		<img src="<?php echo IMAGEN.$pokemon[0]; ?>" alt="" class="pokemon <?php echo $_GET['estado'];?>" />
		<img src="img/trivia.png" alt="trivia"  class="pull-left"/>
		<p class="txtpoke fs100"><?= $mensaje1 ?></p>
		<p class="txtpoke"><?= $mensaje2 ?></p>
		
		<form action="secciones/procesar.php" method="post">
			<div class="form-group">
				<label for="pokemon">Nombre del pokemón</label>
				<input type="text" class="form-control" name="pokemon" id="pokemon" placeholder="¿Quién es?">
			</div>
			<input type="hidden" name="_token" value="<?= $pokemon[2] ?>"/>
			<button type="submit" class="btn btn-default"><?= $boton ?></button>
		</form>
	</div>
	
	
	
	
	
