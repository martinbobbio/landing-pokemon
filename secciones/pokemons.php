<?php 
	
    // Solo permitimos acceder a esta sección desde el index
    if (!defined('SECURE')) die('Acceso denegado.');
	
	include ("conexion.php");
	
	$consulta = mysqli_query($conexion,'SELECT IMAGENES.IMAGE, ESPECIES.NOMBRE, TIPOS.NOMBRE AS TIPO FROM IMAGENES INNER JOIN ESPECIES ON IMAGENES.ESPECIES_ID = ESPECIES.ID INNER JOIN ESPECIES_TIPOS ON ESPECIES_TIPOS.ESPECIES_ID = ESPECIES.ID INNER JOIN TIPOS ON ESPECIES_TIPOS.TIPOS_ID = TIPOS.ID');
	
	while($resultados = mysqli_fetch_assoc($consulta)){
		
		echo '<div class="col-xs-16 col-md-3">
                <div class="thumbnail">
                    <img src="pokemones/'.$resultados['NOMBRE'].'/'.$resultados['IMAGE'].'" alt="'.$resultados['NOMBRE'].'" class="img-responsive">
                    <div class="caption">
                        <h4>'.ucwords ($resultados['NOMBRE']).'</h4>
						<h6 style = "color:black;font-weight:bold">'.ucwords ($resultados['TIPO']).'</h6>
                    </div>
					<p class="scrollable">'.file_get_contents("pokemones/".$resultados['NOMBRE']."/descripcion.txt").'</p>
                </div>
            </div>';
			
			
	}


	/*
	$directorio = opendir("pokemones");
		
		while($nombre = readdir($directorio)){
		if($nombre != "." && $nombre != ".." && $nombre != "batman"){
			
			$directorio2 = opendir("pokemones/".$nombre);
			
				while($imagen = readdir($directorio2)){
				if($imagen != "." && $imagen != ".." && $imagen!= "descripcion.txt"){	
		
		if(file_exists("pokemones/".$nombre)){
		
        echo '
            <div class="col-xs-16 col-md-3">
                <div class="thumbnail">
                    <img src="pokemones/'.$nombre.'/'.$imagen.'" alt="'.$nombre.'" class="img-responsive">
                    <div class="caption">
                        <h4>'.ucwords ($nombre).'</h4>
                    </div>
					<p class="scrollable">'.file_get_contents("pokemones/".$nombre."/descripcion.txt").'</p>
                </div>
            </div>
        ';
    }
	}
	}
	}
	}
	*/



