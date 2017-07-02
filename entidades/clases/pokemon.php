<?php 

class Pokemon{
	
	private $nombre;
	private $especie;
	private $vida;
	private $ataque;
	
	public function __construct ($especie,$nombre,$vida){

		$this->especie = $especie;		
		$this->nombre = $nombre;
		$this->vida = $vida; 
		
	}
	
	public function atacar (Ataque $ataque, Pokemon $pokemon){
		
		$pokemon->vida = $pokemon->vida - $ataque->getPA() + $ataque->getPD();
		
		return $pokemon;
		
	}
	
	public function aprender (Ataque $ataque){
		
		$ataque = $ataque->getNombre();
		
	}
	
	public function getVida(){
		
		return $this->vida;
		}
		
	public function getEspecie(){
		
		return $this->especie;
		}
	
}


?> 