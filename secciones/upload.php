<?php 
	
    // Solo permitimos acceder a esta sección desde el index
    if (!defined('SECURE')) die('Acceso denegado.');

 ?>
 <div class="container">
	 <div class="row">
		 <div class="col-xs-6 col-xs-offset-3">
			 
			 <form action="upload.php" method="POST" enctype="multipart/form-data">
				  <div class="form-group">
					<input type="text" class="form-control" id="nombrePokemon" placeholder="Ingrese nombre del pokemon" name="nombre">
				</div>
				<div class="input-group image-preview">
					<input type="text" class="form-control image-preview-filename" disabled="disabled">
					<span class="input-group-btn">
						
						<button type="button" class="btn btn-default image-preview-clear" style="display:none;">
							<span class="glyphicon glyphicon-remove"></span> Limpiar
						</button>

						<div class="btn btn-default image-preview-input">
							<span class="glyphicon glyphicon-folder-open"></span>
							<span class="image-preview-input-title">Buscar</span>
							<input type="file" accept="image/png, image/jpeg, image/gif" name="foto"/> 
						</div>
					</span>
				</div>
				<br />
				<div class="form-group">
					<label for="descripcion">Descripción del pokemon</label>
					<textarea name="descripcion" id="descripcion" cols="30" rows="10" class="form-control"></textarea>
				</div>
				<button type="submit" class="btn btn-default">Cargar</button>
			</form>
		 </div>
	 </div>
 </div>
 <br />