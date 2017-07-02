<!DOCTYPE html>
<html lang="es">

    <?php

        // Definimos una constante que utilizaremos para asegurarnos
        // que solo se accedarán a las secciones a través del index
        define('SECURE', true);

		//Definimos una constante con la ruta de las imagenes
        define('IMAGEN', "img/pokemons/");
		
		
        // Definimos el directorio en el cual colocaremos las secciones
        // Tenerlo en una variable separada facilita modificaciones futuras
        $sectionsDir = './secciones/';


        // Hay varias maneras en las que podemos organizar la lista de secciones y la lista de enlaces
        // En esta oportunidad veremos una manera de combinar ambas listas en un solo array
        $sectionList = [

            // El identificador que utilizaremos como parámetro $_GET
            'acerca_de' => [

                // El titulo que pondremos en cada página antes de cargar el contenido
                'page_title' => 'Acerca de Pokemon GO',

                // El nombre del enlace que aparece en el menu
                'link_name' => 'Acerca de',

            ],

            'pokemons' => [
                'page_title' => 'Lista de pokemones',
                'link_name' => 'Pokemones',
            ],

            'trivia' => [
                'page_title' => 'Trivia pokemon!',
                'link_name' => 'trivia'
            ],
			
            'upload' => [
                'page_title' => 'Cargá tu pokemon!',
                'link_name' => 'upload'
            ],
			
			'ataques' => [
                'page_title' => 'POO',
                'link_name' => 'ataques'
            ],

            'not_found' => [
                'page_title' => 'Oops! Página no encontrada!',
            ]

        ];

        // Si no esta vacio el parametro de la URL, lo utilizamos
        // De lo contrario, la sección por defecto será 'acerca_de'
        $urlParam = !empty($_GET['seccion']) ? $_GET['seccion'] : 'acerca_de';

        // Si la sección existe en nuestra lista, la utilizamos
        // De lo contrario, utilizamos la sección 'not_found'
        $sectionToLoad = isset($sectionList[$urlParam]) ? $urlParam : 'not_found';

    ?>

    <head>
        <meta charset="UTF-8">
        <title>Prueba php</title>

        <!--CSS-->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/styles.css">

        <!-- JS-->
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </head>

    <body>

        <header>
            <div class="container-fluid">
                <a href="#" class="pull-left"><img src="img/logo.png" width="100" alt="logo" class="img-responsive center-block"></a>
            </div>
        </header>

        <nav class="navbar navbar-default fullwidth">
            <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">

                            <?php

                                // Para cada seccion
                                foreach ($sectionList as $section => $data) {

                                    // Si la seccion no contempla un enlace (como es el caso de not_found), salteamos esta vuelta del loop
                                    if ( !isset($data['link_name']) ) continue;

                                    // De lo contrario, mostramos el link correspondiente
                                    echo '<li><a href="?seccion=' . $section . '&pokemon=&estado=error">' . $data['link_name'] . '</a></li>';

                                }

                            ?>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
        </nav>

        <div class="container mb-20">
            <h1 class="titulos poketext center-block">
                <!-- La siguiente es una manera de mostrar strings con PHP sin utilizar echo -->
                <?= $sectionList[$sectionToLoad]['page_title'] ?>
            </h1>
        </div>
		
        <div class="container">	
            
            <?php 
                // Concatenamos la variable que contiene el directorio de nuestras secciones, con la variable que contiene la seccion a cargar
                // Tambien concatenamos la extensión '.php' porque estamos cargando un archivo individual
                require($sectionsDir . $sectionToLoad . '.php');
            ?>

        </div>

        <div class="container-fluid plr-0">
            <footer class="pokefooter">
                <h4 class="text-center">Pokemon Go.</h4>
            </footer>
        </div>
        
        <script type="text/javascript">
			$(document).on('click', '#close-preview', function(){ 
				$('.image-preview').popover('hide');
				// Hover befor close the preview
				$('.image-preview').hover(
					function () {
					   $('.image-preview').popover('show');
					}, 
					 function () {
					   $('.image-preview').popover('hide');
					}
				);    
			});

			$(function() {
				// Create the close button
				var closebtn = $('<button/>', {
					type:"button",
					text: 'x',
					id: 'close-preview',
					style: 'font-size: initial;',
				});
				closebtn.attr("class","close pull-right");
				// Set the popover default content
				$('.image-preview').popover({
					trigger:'manual',
					html:true,
					title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
					content: "Eso no es una imágen",
					placement:'bottom'
				});
				// Clear event
				$('.image-preview-clear').click(function(){
					$('.image-preview').attr("data-content","").popover('hide');
					$('.image-preview-filename').val("");
					$('.image-preview-clear').hide();
					$('.image-preview-input input:file').val("");
					$(".image-preview-input-title").text("Buscar"); 
				}); 
				// Create the preview image
				$(".image-preview-input input:file").change(function (){     
					var img = $('<img/>', {
						id: 'dynamic',
						width:250,
						height:200
					});      
					var file = this.files[0];
					var reader = new FileReader();
					// Set preview image into the popover data-content
					reader.onload = function (e) {
						$(".image-preview-input-title").text("Cambiar");
						$(".image-preview-clear").show();
						$(".image-preview-filename").val(file.name);            
						img.attr('src', e.target.result);
						$(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
					}        
					reader.readAsDataURL(file);
				});  
			});
		</script>

    </body>
</html>