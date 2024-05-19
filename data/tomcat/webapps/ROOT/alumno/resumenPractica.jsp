<%@taglib uri="/struts-tags" prefix="s"%>

<script language="javascript">
    $(document).ready(function() {
	$(".content textarea").each(function(index, elem){
	    console.log(elem);
	    CodeMirror.fromTextArea(document.getElementById($(elem).attr("id")), {
		mode: "text/x-sql",
		readOnly: true,
		indentWithTabs: true,
		indentUnit: 4,
		lineNumbers: true
	    });
	});
    });
</script>

<div class="navbar-practica navbar navbar-googlenav">
    <div class="navbar-inner">
	<img class="pull-left logo-practica" src="<s:url value="/img/practica.png"/>" alt="">
	<h5 class="navbar-text pull-left"><s:text name="practice.summary"/> <s:property value="practicaActiva.practica.nombre"/></h5>
	<div class="btn-toolbar pull-right">
	    <div class="btn-group">		
		<a href='<s:url value="/alumno/ejercicio"/>' class="btn"><span class="icon-chevron-left"></span> <s:text name="exercises.return"/></a>		
	    </div>
	    <div class="btn-group">		
		<a id="descargarResumen" href="printResumen" class="btn btn-primary"><span class="icon-print icon-white"></span> <s:text name="summary.download"/></a>		
	    </div>
	</div>
    </div>
</div>

<s:iterator value="practicaActiva.practica.ejercicioPracticas" status="stat" var="ejercicioPractica">	
    <s:if test="realizacionPractica.respuestas.get(#ejercicioPractica.ejercicio.id) != null">
	<s:if test="realizacionPractica.respuestas.get(#ejercicioPractica.ejercicio.id).correcta">
	    <s:set var="title" value="%{getText('correct')}"/>
	    <s:set var="class" value="'correct'"/>
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

    <div class="row ejercicio-resumen top-buffer-compact">
	<div class="span12">
	    <div class="caja <s:property value='#class'/>">
		<div class="header">
		    <s:text name="exercise"/> <s:property value='#stat.count'/> - <s:property value="#title" />
		</div>
		<s:set var="respuestaEjercicio" value="realizacionPractica.respuestas.get(#ejercicioPractica.ejercicio.id)"/>
		<s:if test="#respuestaEjercicio != null">
		    <div class="content">		    
			<s:textarea id="query%{#stat.count}" value="%{#respuestaEjercicio.query}" theme="simple"/>		    	    
		    </div>
		</s:if>	
	    </div>	    
	</div>
    </div>
    
</s:iterator>