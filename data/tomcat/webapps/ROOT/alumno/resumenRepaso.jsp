<%@taglib uri="/struts-tags" prefix="s"%>

<!-- Modal confirmar salir de la aplicacion -->
<div id="confirmarTerminarRepasoModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="confirmarTerminarRepasoModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="confirmarTerminarRepasoModalLabel"><s:text name="revision.finish.title"/></h4>
    </div>
    <div class="modal-body">
	<div class="texto"><s:text name="revision.finish.info"/></div>
    </div>
    <div class="modal-footer">
	<button class="btn" data-dismiss="modal" aria-hidden="true"><s:text name="no"/></button>
	<a class="btn btn-primary" href='<s:url value="abandonarRepaso"/>' ><s:text name="yes"/></a>
    </div>
</div>

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

	$("#terminar").click(function(event) {
	    event.preventDefault();
	    $("#confirmarTerminarRepasoModal").modal();	    
	});
    });
</script>

<div class="navbar-practica navbar navbar-googlenav">
    <div class="navbar-inner">
	<img class="pull-left logo-repaso" src="<s:url value="/img/repaso2.png"/>" alt="">
	<h5 class="navbar-text pull-left"><s:text name="revision.summary"/></h5>
	<div class="btn-toolbar pull-right">
	    <div class="btn-group">		
		<a href='<s:url value="/alumno/ejercicioRepaso"/>' class="btn"><span class="icon-chevron-left"></span> <s:text name="exercises.return"/></a>		
	    </div>
	    <div class="btn-group">		
		<a href='<s:url value="/alumno/printResumenRepaso"/>' title='<s:text name="summary.download"/>' class="btn"><span class="icon-print"></span> <s:text name="summary.download"/></a>		
	    </div>
	    <div class="btn-group">
		<button id="terminar" class="btn btn-danger"><s:text name="revision.finish.title"/></button>		
	    </div>
	</div>
    </div>
</div>
	    
<s:iterator value="ejercicios" status="stat">		    
    <s:if test="alumnoEjerciciosRepaso.get(#stat.count)!=null">
	<s:if test="alumnoEjerciciosRepaso.get(#stat.count).correcta">
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
		<s:if test="alumnoEjerciciosRepaso.get(#stat.count) != null">
		    <div class="content">		    
			<s:textarea id="query%{#stat.count}" value="%{alumnoEjerciciosRepaso.get(#stat.count).respuesta}" theme="simple"/>		    	    
		    </div>
		</s:if>	
	    </div>	    
	</div>
    </div>
</s:iterator>
	    
<div class="row top-buffer-compact"></div>