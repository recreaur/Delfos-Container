<%@ taglib prefix="s" uri="/struts-tags" %>


<ul class="thumbnails opciones-alumno">
    <li class="span2">
	<div class="thumbnail">
	    <img src='<s:url value="/img/repaso2.png"/>' alt="">
	    <h3><s:text name="revision"/></h3>
	    <s:if test='repaso'>
		<a id="repaso" class="btn btn-success btn-block" href='ejercicioRepaso' title='<s:text name="revision.exercises"/>'>
		    <s:text name="revision.continue"/>
		</a>		
	    </s:if>
	    <s:else>
		<a id="repaso" class="btn btn-primary btn-block" href='ejercicioRepaso' title='<s:text name="revision.exercises"/>'>
		    <s:text name="revision.begin"/>
		</a>	    
	    </s:else>		
	</div>
    </li>

    <s:iterator value="practicas">
	<li class="span2">
	    <div class="thumbnail">
		<img src='<s:url value="/img/practica.png"/>' alt="">
		<div class="numsesion"><s:text name="session"/> <s:property value="practica.numsesion" /></div>
		<h3><s:text name="practice"/></h3>
		<s:if test='practica.id==realizacionPractica.idPractica'>
		    <a id="pr<s:property value='practica.id'/>" class="practica btn btn-success btn-block" href='practica?id=<s:property value='practica.id'/>'>
			<s:text name="practice.continue"/>
		    </a>		    
		</s:if>
		<s:else>
		    <a id="pr<s:property value='practica.id'/>" class="practica btn btn-primary btn-block" href='practica?id=<s:property value='practica.id'/>'>
			<s:text name="practice.begin"/>
		    </a>
		</s:else>
		<div class="tiempo-restante">
		    <span class="icon-chrono"></span>		    
		    <div id="pr<s:property value='practica.id'/>-practice-countdown" class="practice-countdown"></div>		    
		</div>		
	    </div>
	    <script type="text/javascript">
		$('#pr<s:property value='practica.id'/>-practice-countdown').countdown({
		    until: +<s:property value="tiempoRestante" />, 
		    format: 'dhmS',
		    onExpiry: function(){
			window.location.reload();
		    }
		});
	    </script>
	</li>
    </s:iterator>
</ul>

<!-- Modal iniciar repaso -->
<div id="iniciarRepasoModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="iniciarRepasoModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="iniciarRepasoModalLabel"><s:text name="revision.properties.title"/></h4>
    </div>
    <div class="modal-header">
	<p><s:text name="revision.properties.info"/></p>
    </div>
    <form id="iniciarRepasoForm" action="repaso" class="form-horizontal">
	<div class="modal-body">
	    <div id="mensaje"></div>	
	    <fieldset>
		<s:textfield key="maximo" label="%{getText('exercises.max')}" requiredLabel="true"/>
		<div class="control-group sesiones-minmax">
		    <s:label cssClass="control-label label-inline" for="numsesionmin" value="%{getText('session.min')}" theme="simple"/>
		    <div class="controls">
			<s:select key="numsesionmin" list="sesiones" emptyOption="true" theme="simple"/>
			<s:label id="numsesionmaxLabel" cssClass="control-label label-inline" for="numsesionmax" value="%{getText('session.max.short')}" theme="simple"/>
			<s:select cssClass="select-inline" key="numsesionmax" list="sesiones" emptyOption="true" theme="simple"/>
		    </div>		    
		</div>		
		<s:select key="esquemas" label="%{getText('schemes')}" multiple="true" list="esquemas" listKey="id" listValue="nombre" size="4" />
		<div class="control-group ">
		    <label for="dificultad" class="control-label"><s:text name="difficulty"/></label>
		    <div class="controls">
			<select multiple="multiple" id="dificultad" size="4" name="dificultad">
			    <option value="facil"><s:text name="easy"/></option>
			    <option value="media"><s:text name="medium"/></option>
			    <option value="dificil"><s:text name="hard"/></option>
			</select>
			<input type="hidden" value="" name="__multiselect_dificultad" id="__multiselect_dificultad">
		    </div>
		</div>			
	    </fieldset>
	</div>
	<div class="modal-footer">	    
	    <button id="iniciarRepasoBtn" type="submit" class="btn btn-primary pull-right" tabindex="6"><i class="icon-random icon-white"></i> <s:text name="revision.begin"/></button>
	    <button class="btn pull-right" data-dismiss="modal" aria-hidden="true"><s:text name="cancel"/></button>
	</div>
    </form>
</div>

<!-- Modal confirmar cambio de curso -->
<div id="avisoPracticaEnCursoModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="avisoPracticaEnCursoModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="avisoPracticaEnCursoModalLabel"><s:text name="warning"/></h4>
    </div>
    <div class="modal-body">
	<p><s:text name="practice.current1"/></p>
	<p><s:text name="practice.current2"/> <strong><s:property value="practicaActiva.practica.nombre"/></strong>, <s:text name="practice.current3"/> <strong><s:text name="session"/> <s:property value="practicaActiva.practica.numsesion"/></strong></p>
    </div>
    <div class="modal-footer">
	<a id="avisoPracticaEnCursoBtn" href='<s:url value="/alumno/practica"/>' class="btn btn-primary"><s:text name='practica.current.go'/></a>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {

	<s:if test='!repaso'>
	    $("#repaso").attr("href", "#iniciarRepasoModal").attr("data-toggle", "modal");
	</s:if>
	$(".sesiones-minmax select").select2({'minimumResultsForSearch': 99, 'width': '60px'});
	$("select#esquemas, select#dificultad").select2({'minimumResultsForSearch': 99, 'width': '228px'});
	
	Object.size = function(obj) {
	    var size = 0, key;
	    for (key in obj) {
		if (obj.hasOwnProperty(key)) size++;
	    }
	    return size;
	};
	
	function limpiaErrores(){
	    $('#iniciarRepasoModal .control-group.error .help-inline').remove();
	    $('#iniciarRepasoModal .control-group.error').removeClass("error");
	    $("#texto").empty();
	}
	
	$('#iniciarRepasoForm').ajaxForm({
	    dataType:  'json',
	    success : function(data){
		limpiaErrores();
		if (Object.size(data.actionErrors) || Object.size(data.fieldErrors)) {
		    $.each(data.actionErrors, function(index, value) {
			$("#mensaje").append('<p class="alert alert-error">' + value + '</p>');
		    });
		    $.each(data.fieldErrors, function(index, value) {
			if(/numsesion/.test(index)){
			    $(".sesiones-minmax .controls").append('<span class="help-inline">' + value + '</span>').closest(".control-group").addClass("error");
			} else {
			    $("#"+index).after('<span id="' + index + 'FieldError" class="help-inline">' + value + '</span>').closest(".control-group").addClass("error");
			}			
		    });
		} else {
		    document.location = "ejercicioRepaso";
		}
	    }
	});
	
	$('#iniciarRepasoModal').on('hidden', function() {
	    limpiaErrores();
	});
	
	<s:if test="practicaActiva != null">
	    $("a.practica:not(#pr<s:property value='practicaActiva.practica.id'/>)").click(function(event) {
		event.preventDefault();
		$("#avisoPracticaEnCursoModal").modal();
	    });
	</s:if>
    });
</script>