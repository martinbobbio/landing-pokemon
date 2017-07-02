<?php 

class Ataque {
	
	private $pataque;
	private $pdefensa;
	private $nombre;
	
	public function __construct ($nombre,$pataque,$pdefensa){
		
		$this->nombre = $nombre;
		$this->pataque = $pataque;
		$this->pdefensa = $pdefensa;
			
	}
	
	public function getNombre(){
		
		return $this->nombre;
		}
		
	public function getPA(){
		
		return $this->pataque;
		}
		
	public function getPD(){
		
		return $this->pdefensa;
		}
	
}


?> 