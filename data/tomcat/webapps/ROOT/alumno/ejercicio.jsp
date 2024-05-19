<%@taglib uri="/struts-tags" prefix="s"%>

<!-- Modal confirmar enviar práctica -->
<div id="finPeriodoPracticaModal" class="modal hide" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="finPeriodoPracticaModalLabel" aria-hidden="true">
    <div class="modal-header">	
	<h4 id="finPeriodoPracticaModalLabel"><s:text name="practice.timeout.title"/></h4>
    </div>
    <div class="modal-body">	
	<div class="texto"><p><s:text name="practice.timeout"/></p></div>
	<div class="texto"><s:text name="practice.exercises.autosent"/></div>
    </div>
    <div class="modal-footer">
	<a href='<s:url value="/alumno/"/>' class="btn btn-primary" ><s:text name="return.panel"/></a>
    </div>
</div>

<!-- Modal confirmar enviar práctica -->
<div id="confirmarTerminarPracticaModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="confirmarTerminarPracticaModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="confirmarTerminarPracticaModalLabel"><s:text name="practice.finish.title"/></h4>
    </div>
    <div class="modal-body">
	<p class="alert alert-error" style="display:none;"></p>
	<div class="texto"></div>
    </div>
    <div class="modal-footer">
	<button class="btn" data-dismiss="modal" aria-hidden="true"><s:text name="cancel"/></button>
	<button id="terminarPractica" class="btn btn-primary"><s:text name="practice.submit.confirm"/></button>
    </div>
</div>

<!-- Modal confirmar abandonar práctica -->
<div id="confirmarAbandonarPracticaModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="confirmarAbandonarPracticaModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="confirmarAbandonarPracticaModalLabel"><s:text name="practice.exit.title"/></h4>
    </div>
    <div class="modal-body">
	<div class="texto"><s:text name="practice.exit.info"/></div>
    </div>
    <div class="modal-footer">
	<button class="btn" data-dismiss="modal" aria-hidden="true"><s:text name="no"/></button>
	<a class="btn btn-primary" href='<s:url value="abandonarPractica"/>' ><s:text name="yes"/></a>
    </div>
</div>

<div class="navbar-practica navbar navbar-googlenav">
    <div class="navbar-inner">
	<img class="pull-left logo-practica" src="<s:url value="/img/practica.png"/>" alt="">
	<h5 class="navbar-text pull-left"><s:property value="practicaActiva.practica.nombre"/></h5>	
	<div class="btn-toolbar pull-right">
	    <div class="btn-group">		
		<a id="descargarResumen" href="<s:url value="resumenPractica"/>" class="btn"><s:text name="summary.see"/></a>		
	    </div>
	    <div class="btn-group">
		<button id="enviarPractica" class="btn btn-danger"><span class="icon-paperplane icon-white"></span> <s:text name="practice.submit"/></button>
		<button class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
		    <span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
		    <li><a id="abandonar" href=""><span class="icon-trash"></span> <s:text name="practice.exit.title"/></a></li>
		</ul>
	    </div>
	</div>
	<div id="practice-countdown-container" class="pull-right">
	    <div class="restante pull-left"><span class="icon-chrono"></span> Tiempo restante</div>
	    <div id="practice-countdown" class="pull-left"></div>
	</div>
    </div>
</div>

<div class="row">
    <div class="span12">
	<div class="pagination exercises-pagination">
	    <ul>
		<s:iterator value="practicaActiva.practica.ejercicioPracticas" status="stat" var="ejercicioPractica">	
		    <s:if test="realizacionPractica.respuestas.get(#ejercicioPractica.ejercicio.id) != null">
			<s:if test="realizacionPractica.respuestas.get(#ejercicioPractica.ejercicio.id).correcta">
			    <s:if test="realizacionPractica.respuestas.get(#ejercicioPractica.ejercicio.id).advertencias.empty">
				<s:set var="title" value="%{getText('correct')}"/>
				<s:set var="class" value="'correct'"/>
			    </s:if>
			    <s:else>
				<s:set var="title" value="%{getText('correct.warnings')}"/>
				<s:set var="class" value="'warning'"/>
			    </s:else>
			    
			</s:if>
			<s:else>
			    <s:set var="title" value="%{getText('incorrect')}"/>
			    <s:set var="class" value="'incorrect'"/>
			</s:else>
		    </s:if>
		    <s:else>
			<s:set var="title" value="%{getText('unsaved')}"/>
			<s:set var="class" value="'unsaved'"/>
		    </s:else>
		    
		    <li class="ej <s:property value='#class'/> <s:property value='#stat.count==num ? "actual" : ""'/>">
			<a id="ej<s:property value='#stat.count'/>" 
			   href="ejercicio?num=<s:property value='#stat.count'/>" 
			   title="<s:property value='#title'/>">			
			    <s:property value="#ejercicioPractica.numero"/>
			   <span></span>
			</a>			
		    </li>
		</s:iterator>
	    </ul>
	</div>
    </div>
</div>

<div class="row">    
    <div class="span12">
	<div id="esquema-ejercicio">
	    <div class="caja">
		<div class="header">
		    <span class="icon-database"></span> <s:text name="scheme"/>
		</div>
		<div class="content">
		    <div class="logo-sgbd">
			<img src='<s:url value="/img/%{esquema.sgbd}.png"/>' title="<s:text name="sgbd.%{esquema.sgbd}"/>" alt="<s:text name="sgbd.%{esquema.sgbd}"/>"/>
		    </div>
		    <div class="detalles-esquema">
			<p><s:property value="esquema.nombre"/></p>
			<a id="descripcionEsquema" class="btn" href='<s:property value="esquema.pdf"/>' target="_blank" title='<s:text name="scheme.view.pdf"/>'>
			    <s:text name="scheme.view.pdf"/>
			</a>
		    </div>
		</div>
	    </div>
	</div>
	<div id="enunciado-ejercicio">
	    <div class="caja">
		<div class="header">
		    <span class="icon-align-left"></span> <s:text name="statement"/>
		</div>
		<div class="content scrollable">
		    <s:property value="enunciado"/>
		</div>
	    </div>
	</div>	
    </div>
</div>

<div class="row top-buffer-compact">	
    <div id="resultado-esperado-ejercicio" class="span12">
	<div class="caja resultado-oculto">
	    <div class="toggler-header ui-state-default">
		<span class="ui-icon"></span>
		<span><s:text name="result.expected"/></span>
	    </div>
	    <div class="content query-result">
		<s:property escape="false" value="resultadoEsperado"/>
	    </div>
	</div>
    </div>
</div>

<div class="row top-buffer-compact">
    <s:set var="respuestaEjercicio" value="realizacionPractica.respuestas.get(practicaActiva.getEjercicioNumero(num).ejercicio.id)"/>
    <div id="respuesta-ejercicio" class="span12">
	<div class="caja">
	    <div class="header">
		<s:text name="answer.introduce"/>
		<s:if test="#respuestaEjercicio != null">
		    <s:if test="#respuestaEjercicio.correcta">
			<span class="alert alert-success"><s:text name="exercise.correct.saved"/><div class="triangle"></div></span>
		    </s:if>
		    <s:else>
			<span class="alert alert-error"><s:text name="exercise.incorrect.saved"/><div class="triangle"></div></span>
		    </s:else>
		</s:if>
		<s:else>
		    <span class="alert"><s:text name="exercise.unsaved" /><div class="triangle"></div></span>
		</s:else>
	    </div>
	    <div class="content">
		<s:textarea id="query-ejercicio" value="%{#respuestaEjercicio.query}" theme="simple"/>
	    </div>
	    <div class="footer">
		<div class="pull-left">
		    <button id="probar" class="btn"><span class="icon-bolt"></span> Probar</button>
		    <button id="guardar" class="btn btn-primary">Guardar</button>
		</div>
		
		<div class="keys pull-left">
		    <div><span>Ctrl+Enter</span> para probar</div>
		    <div><span>Ctrl+S</span> para guardar</div>
		</div>		
		
		<s:if test="num+1<=practicaActiva.practica.ejercicioPracticas.size()">
		    <ul class="pager pull-right">
			<li class="next"><a href="ejercicio?num=<s:property value='num+1'/>"><s:text name="exercise.next"/> <span class="icon-chevron-right"></span></a></li>
		    </ul>
		</s:if>
	    </div>	    
	</div>
	<s:iterator value="#respuestaEjercicio.advertencias" var="advertencia">
	    <div class="advertencia alert"><span class="icon-warning-sign"></span> <s:text name="advertencia.%{#advertencia}"/></div>
	</s:iterator>
    </div>
</div>

<div class="row top-buffer-compact bottom-buffer-compact">	
    <div id="resultado-obtenido-ejercicio" class="span12">
	<div class="caja resultado-oculto">
	    <div class="toggler-header ui-state-default">
		<span class="ui-icon"></span>		
		<s:text name="result.obtained"/>		
		<span id="texto-correccion"></span>
	    </div>
	    <div class="content query-result">
	    </div>
	</div>
    </div>
</div>
		
<script language="javascript">
    $(document).ready(function() {

	// Cuenta atrás para la finalización de la práctica
	$('#practice-countdown').countdown({
	    until: +<s:property value="practicaActiva.tiempoRestante"/>, 
	    format: 'dhmS',
	    onExpiry: function(){
		$("#finPeriodoPracticaModal").modal();
	    }
	});

	$('#confirmarTerminarPracticaModal').on('hidden', function() {
	    $("#confirmarTerminarPracticaModal p.alert-error").hide();
	});
    
	$("#terminarPractica").click(function(event){
	    event.preventDefault();
	    $.post("terminarPractica", {}, function(data){
		if(data.error != null){
		    $("#confirmarTerminarPracticaModal p.alert-error").html(data.error);
		    $("#confirmarTerminarPracticaModal p.alert-error").show();								
		} else {
		    document.location = data.redirect;
		}
	    }, "json");
	});

	$("#enviarPractica").click(function(event){
	    event.preventDefault();
	    $.post("mensajeConfirmarEnviarPractica", {}, function(data){
		$("#confirmarTerminarPracticaModal div.texto").html(data);
		$("#confirmarTerminarPracticaModal").modal();
	    }, "html");
	});

	$(".ej a").tooltip({container : "body", placement : "bottom", animation: false});

	var queryEditor = CodeMirror.fromTextArea(document.getElementById('query-ejercicio'), {
	    mode: "text/x-sql",
	    indentWithTabs: true,
	    indentUnit: 4,
	    lineNumbers: true,
	    autofocus: true,
	    extraKeys: {
		"Shift-Tab": "indentLess",
		"Ctrl-Enter": function() {probar();},
		"Ctrl-S": function() {guardar();}
	    }
	});
	queryEditor.setSize('auto', 250);

	$(".toggler-header")
	    .hover(function(){
		$(this).toggleClass("ui-state-hover");	    
	    })
	    .click(function(){
		$(this).parent().toggleClass("resultado-oculto");
	    });

	$("#abandonar").click(function(event) {
	    event.preventDefault();
	    $("#confirmarAbandonarPracticaModal").modal();
	});

	function ajaxCallback(data){
	    $("#resultado-obtenido-ejercicio .content").html(data.resultadoAlumno);
	    
	    var messages = {
		true : {		    
		    text	: '<s:text name="correct"/>',
		    savedText	: '<s:text name="exercise.correct.saved"/><span class="triangle"></span>',
		    alertText	: '<span class="symbol">=</span><s:text name="correct"/><span class="triangle"></span>',
		    resultClass	: 'correct',
		    alertClass	: 'alert-success'
		},
		"warning": {		    
		    text	: '<s:text name="correct.warnings"/>',
		    savedText	: '<s:text name="exercise.correct.saved"/><span class="triangle"></span>',
		    alertText	: '<span class="symbol">=</span><s:text name="correct"/><span class="triangle"></span>',
		    resultClass	: 'warning',
		    alertClass	: 'alert-success'
		},
		false : {		    
		    text	: '<s:text name="incorrect"/>',
		    savedText	: '<s:text name="exercise.incorrect.saved"/><span class="triangle"></span>',
		    alertText	: '<span class="symbol">&ne;</span><s:text name="incorrect"/><span class="triangle"></span>',
		    resultClass	: 'incorrect',
		    alertClass	: 'alert-error'
		}
	    };
	    
	    // Si se ha guardado el restultado, actualizo el paginador y el alert de estado del ejercicio
	    if (data.guardado) {
		$(".actual")
		    .removeClass(messages[true].resultClass)
		    .removeClass(messages[false].resultClass)
		    .removeClass(messages["warning"].resultClass)
		    .addClass(messages[!data.correcto ? false : (data.mensajesAdvertencias.length ? "warning" : true)].resultClass)
		    .children().attr("data-original-title", messages[!data.correcto ? false : (data.mensajesAdvertencias.length ? "warning" : true)].text);
	    
		$("#respuesta-ejercicio .header .alert")
		    .removeClass(messages[true].alertClass)
		    .removeClass(messages[false].alertClass)
		    .addClass(messages[data.correcto].alertClass)
		    .html(messages[data.correcto].savedText);
	    }
	    
	    $("#resultado-obtenido-ejercicio")
		.removeClass(messages[true].resultClass)
		.removeClass(messages[false].resultClass)
		.addClass(messages[data.correcto].resultClass);
	    
	    $("#texto-correccion")
		.removeClass(messages[true].alertClass)
		.removeClass(messages[false].alertClass)
		.addClass("alert " + messages[data.correcto].alertClass)
		.html(messages[data.correcto].alertText);
	    
	    // Elimino las advertencias anteriores si las hubiera
	    $("#respuesta-ejercicio .advertencia").remove();
	    
	    // Añado las nuevas advertencias si las hay
	    $(data.mensajesAdvertencias).each(function(index, elem){
		$("#respuesta-ejercicio").append('<div class="advertencia alert"><span class="icon-warning-sign"></span> ' + elem + '</div>');
	    });	    
	    
	    // Muestro el resultado obtenido
	    $("#resultado-obtenido-ejercicio .resultado-oculto").removeClass("resultado-oculto");	    
	}

	var probar = function(e) {
	    var button = $("#probar");
	    button.unbind("click");
	    var caption = button.html();
	    button.html("<img style='margin-top:-2px' src=<s:url value='/img/exercise-loader.gif'/> />");
	    var solucion = queryEditor.getValue();
	    var num = <s:property value="num"/>;
	    $.post(
		"probarEjercicioJSON",
		{"num": num, "solucionAlumno": solucion},
		function(data) {
		    ajaxCallback(data);
		    button.html(caption);
		    button.click(probar);
		},
		"json"
	    );
	};	

	var guardar = function() {
	    var button = $("#guardar");
	    button.unbind("click");
	    var caption = button.html();
	    button.html("<img style='margin-top:-2px' src=<s:url value='/img/exercise-loader-blue.gif'/> />");
	    var solucion = queryEditor.getValue();
	    var num = <s:property value="num"/>;
	    $.post(
		"guardarEjercicioJSON",
		{"num": num, "solucionAlumno": solucion},
		function(data) {
		    ajaxCallback(data);
		    button.html(caption);
		    button.click(guardar);
		},
		"json"
	    );
	};

	$("#probar").click(probar);
	$("#guardar").click(guardar);

    });
</script>