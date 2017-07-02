<?php 
	
	include ("entidades/clases/pokemon.php");
	include ("entidades/clases/ataque.php");

	$pikachu = new Pokemon("Pikachu","Pedro",300);
	$charizard = new Pokemon("Charizard","Juan",500);
	$ataqueTrueno = new Ataque("Trueno",150,50);
	$ataqueFuego = new Ataque("Fuego",250,75);
	
	echo "La vida de ".$pikachu->getEspecie()." es ".$pikachu->getVida()."<br>";
	echo "La vida de ".$charizard->getEspecie()." es ".$charizard->getVida()."<br>";
	
	$pikachu->aprender($ataqueTrueno);
	$charizard->aprender($ataqueFuego);
	
	$pikachu->atacar($ataqueTrueno,$charizard)->atacar($ataqueTrueno,$charizard);
	$charizard->atacar($ataqueFuego,$pikachu);
	
	echo "Pikachu ataco 2 veces a charizard<br>";
	echo "La vida de ".$charizard->getEspecie()." es ".$charizard->getVida()."<br>";
	echo "Charizard ataco a pikachu<br>";
	echo "La vida de ".$pikachu->getEspecie()." es ".$pikachu->getVida()."<br>";
	
	

?>