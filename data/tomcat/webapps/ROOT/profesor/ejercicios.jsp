<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form action="getEjercicios" class="ui-filters">
    <table>
	<thead>
	    <tr>
		<th>
		    <i class="icon-filter"></i>	
		</th>
		<th>
		    <s:textfield key="filtroeq_id" theme="simple" />		
		</th>
		<th class="select">
		    <select id="filtroeq_esquema" name="filtroeq_esquema">
			<option selected="selected" value="">&nbsp;</option>
			<s:iterator value="esquemas">
			    <option value="<s:property value='id'/>"><s:property value='nombre'/></option>
			</s:iterator>
		    </select>
		</th>
		<th class="select">
		    <select id="filtroeq_practica" name="filtroeq_practica">
			<option selected="selected" value="">&nbsp;</option>
			<option value="0">Sin práctica</option>
			<optgroup label="En práctica:">
			<s:iterator value="practicasConEjercicios">
			    <option value="<s:property value="id"/>"><s:property value="nombre"/></option>
			</s:iterator>
			</optgroup>
		    </select>
		</th>
		<th>
		    <input id="filtro_enunciado" name="filtro_enunciado" type="text"/>
		</th>
		<th class="select">
		    <select id="filtro_dificultad" name="filtro_dificultad">
			<option selected="selected" value="">&nbsp;</option>
			<option value="facil"><s:text name="easy"/></option>
			<option value="media"><s:text name="medium"/></option>					
			<option value="dificil"><s:text name="hard"/></option>
		    </select>
		</th>
		<th class="select">
		    <select id="filtroeq_sesion" name="filtroeq_sesion">
			<option selected="selected" value="">&nbsp;</option>
			<s:iterator value="sesionesConEjercicios">
			    <option value="<s:property/>"><s:property/></option>
			</s:iterator>
		    </select>
		</th>
		<th class="select">
		    <select id="filtroeq_visible" name="filtroeq_visible">
			<option selected="selected" value="">&nbsp;</option>
			<option value="true"><s:text name="yes"/></option>
			<option value="false"><s:text name="no"/></option>
		    </select>
		</th>
	    </tr>
	</thead>
    </table>
    <input type="submit" style="display: none" />
</form>
		
<table id="ejerciciosTable" cellpadding="0" cellspacing="0"></table>

<!-- Modal importar ejercicios a esquema -->
<div id="importarModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="importarModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="importarModalLabel"><s:text name="upload.xml.title"/></h4>
    </div>
    <div class="modal-body form-horizontal">
	<div id="mensaje"></div>
	<p class='texto'><s:text name="upload.xml.info"/></p>
	<div class="control-group ">
	    <label for="id" class="control-label"><s:text name="scheme"/></label>
	    <div class="controls">
		<select id="id">
		    <option value="" selected="selected">&nbsp;</option>
		    <s:iterator value="esquemas">
			<option value="<s:property value='id'/>"><s:property value='nombre'/></option>
		    </s:iterator>
		</select>
	    </div>
	</div>
	<p class='texto'><s:text name="upload.xml.dtd"/></p>
	<p class='texto'>	    
	    <textarea id="dtd"><?xml version="1.0" encoding="UTF-8"?>

<!ELEMENT ejercicios (ejercicio+)>
<!ELEMENT ejercicio (enunciado,query,dificultad,numsesion,visible?)>
<!ELEMENT enunciado (#PCDATA)>
<!ELEMENT query (#PCDATA)>
<!ELEMENT dificultad (#PCDATA)>	    <!-- (facil|media|dificil) -->
<!ELEMENT numsesion (#PCDATA)>
<!ELEMENT visible (#PCDATA)></textarea>	    
	</p>
    </div>
    <div class="modal-footer">
	<button id="subir" type="submit" class="btn btn-primary"><i class="icon-upload icon-white"></i> <s:text name="upload.xml.title"/></button>
    </div>
</div>
    
<!-- Modal exportar ejercicios de esquema -->
<div id="exportarModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="exportarModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="exportarModalLabel"><s:text name="download.xml.title"/></h4>
    </div>
    <div class="modal-body form-horizontal">
	<div id="mensaje"></div>
	<p class='texto'><s:text name="download.xml.info"/></p>
	<div class="control-group ">
	    <label for="id2" class="control-label"><s:text name="scheme"/></label>
	    <div class="controls">
		<select id="id2">
		    <option value="" selected="selected">&nbsp;</option>
		    <s:iterator value="esquemas">
			<option value="<s:property value='id'/>"><s:property value='nombre'/></option>
		    </s:iterator>
		</select>
	    </div>
	</div>	
    </div>
    <div class="modal-footer">
	<button id="exportar" type="submit" class="btn btn-primary"><i class="icon-download-alt icon-white"></i> <s:text name="download"/></button>
    </div>
</div>

<div id="avisoModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="avisoModalLabel" aria-hidden="true" style="width: 300px;">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="avisoModalLabel"><s:text name="warning"/></h4>
    </div>
    <div class="modal-body">
	<p class='texto'></p>
    </div>
</div>

<div id="comprobandoModal" class="modal hide" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="comprobandoModalLabel" aria-hidden="true" style="width: 208px;">
    <div class="modal-header">	
	<h4 id="comprobandoModalLabel"><s:text name="checking"/></h4>
    </div>
    <div class="modal-body">
	<div class="progress progress-striped active">
	    <div class="bar" style="width: 100%;"></div>
	</div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
	
	var iniciado;
	
	$(".modal-body .controls select").select2({'minimumResultsForSearch': 99, width: "220px"});
	
	// Codemirror para el dtd de importar ejercicios
	var dtdEditor = CodeMirror.fromTextArea(document.getElementById('dtd'), {
	    indentWithTabs: true,
	    indentUnit: 4,	
	    lineNumbers: true,
	    readOnly: true,
	    
	});
	
	// Variable global del editor de codemirror que se encuentra construido
	var queryEditor;
	
	function initQueryEditor(){
	    queryEditor = CodeMirror.fromTextArea(document.getElementById('query'), {
		mode: "text/x-sql",
		indentWithTabs: true,
		indentUnit: 4,	
		lineNumbers: true,
		autofocus: true,
		extraKeys: {"Shift-Tab": "indentLess"}
	    });
	    queryEditor.setSize(702, 250);
	}
	
	function destroyQueryEditor(){
	    if(queryEditor) queryEditor.toTextArea();
	}
        
        function ajaxCallback(data){
            //Pongo el resultado en el div adecuado
	    $("#resultado-obtenido-ejercicio .content").html(data.resultadoEjercicio);
            //Muestro el resultado
            $("#resultado-obtenido-ejercicio .resultado-oculto").removeClass("resultado-oculto");
	}
        
        var probar = function(){
            var noinit = true;
            var button = $("#probar");
            button.unbind("click");
            var caption = button.html();
            button.html("<img style='margin-top:-2px' src=<s:url value='/img/exercise-loader.gif'/> />");
            var querySql = queryEditor.getValue();
            var esquema = $("#esquema").val();
            //Primero creamos los elementos necesarios para mostrar el resultado
            //Si no existe
            if ($("#resultado-obtenido-ejercicio").length===0) {
                var row = "<tr id='resultado-obtenido-ejercicio' class='FormData' rowpos='7'> \
                            <td colspan=2> \
                                <div class='caja resultado-oculto'> \
                                    <div class='toggler-header ui-state-default'> \
                                        <span class='ui-icon'></span> \
                                        <s:text name='result.obtained'/> \
                                        <span id='texto-correccion'></span> \
                                    </div> \
                                    <div class='content query-result'> \
                                    </div> \
                                </div> \
                            </td> \
                           </tr>";
                $("#TblGrid_ejerciciosTable").append(row);
                //Damos funcionalidad para ocultar el resultado
                $(".toggler-header")
                .hover(function(){
                    $(this).toggleClass("ui-state-hover");	    
                })
                .click(function(){
                    $(this).parent().toggleClass("resultado-oculto");
                });
                noinit = false;
            }
            //Quito la corrección si la había
            $("#texto-correccion")
            .removeClass("alert alert-error")
            .html("");
            if (querySql !== "" && esquema !== "") {
                $.post(
                    "comprobarEjercicioJSON",
                    {"esquema": esquema, "queryToTest": querySql},
                    function(data) {
                    ajaxCallback(data);
                    button.html(caption);
                    $("#probar").click(probar);
                    },
                    "json"
                );
            } else {
                if (noinit) {
                    //Ponemos un aviso del error
                    $("#texto-correccion")
                    .addClass("alert alert-error")
                    .html("<s:text name='professor.testFailed'/>");
                    //mostramos el resultado para que se vea el aviso
                    $("#resultado-obtenido-ejercicio .resultado-oculto").removeClass("resultado-oculto");
                }
                button.html(caption);
                $("#probar").click(probar);
            }
        };
	
	$('#importarModal').on('hidden', function () {
	    $('#mensaje').empty().removeAttr("class");
	});
	
	$('#importarModal').on('shown', function () {
	    dtdEditor.refresh();
	});
	
	$('#exportarModal').on('hidden', function () {
	    $('#mensaje2').empty().removeAttr("class");
	});

	$('#avisoModal').on('hidden', function () {
	    $('#avisoModal .texto').empty().removeAttr("class").addClass("texto");
	});
	
	//Asignar al boton descargar fichero xml un evento que compruebe que se ha seleccionado un esquema
	$("#exportar").click(function() {
	    var esquema = $("#id2").val();
	    if (esquema == "" || esquema == null) {
		$('#mensaje2').removeAttr("class")
		    .text('<s:text name="select.scheme.export"/>')
		    .addClass("alert alert-error");
		return false;
	    }
	    else {
		window.location = "exportarEjercicios?id2=" + esquema;
	    }
	});
	
	var uploadXML = new AjaxUpload('subir', {
	    action: 'importarEjercicios',
	    name: 'ficheroXML',
	    autoSubmit: true,
	    responseType: "json",
	    onSubmit: function(file, extension) {
		var id = $("#id").val();
		uploadXML.setData({'id': id});
		$("#comprobandoModal").modal();
	    },
	    onComplete: function(file, response) {
		if(response.error != null){
		    $('#mensaje').removeAttr("class")
			.text(response.error)
			.addClass("alert alert-error");
		} else {
		    $('#mensaje').removeAttr("class")
			.text(response.info)
			.addClass("alert alert-success");
		}
		
		$('#comprobandoModal').modal("hide");
		$("#ejerciciosTable").trigger("reloadGrid");
	    }
	});

	// Tabla	
	$("#ejerciciosTable").initJqGridTable({
	    url: 'getEjercicios?' + $('form.ui-filters').formSerialize(),
	    colNames: ['ID', '<s:text name="scheme"/>', '<s:text name="practice"/>', '<s:text name="statement"/>', '<s:text name="sql.query.solution"/>', '<s:text name="difficulty"/>', '<s:text name="session"/>', '<s:text name="visible"/>'],
	    colModel: [
		{name: 'id', index: 'id', key: true, align: 'center', width: 5, editable: false},
		{name: 'esquema', index: 'esquema, id', width: 18, editable: true, edittype: "select", editoptions: {value: ":&nbsp;<s:iterator value='esquemas'><s:property value='id'/>:<s:property value='nombre'/>;</s:iterator>".replace(/;$/, "")}, editrules:{required: true}},
		{name: 'practica', index: 'practica', align: 'center', width: 18, editable: false, sortable: false, formatter: "practicasFormatter", cellattr: celdaPracticasAttr, editrules:{required: true}},
		{name: 'enunciado', index: 'enunciado', width: 33, sortable: false, editable: true, edittype: "textarea", editoptions: {rows: "3", cols: "120"}, editrules:{required: true}},
		{name: 'query', index: 'query', hidden: true, editable: true, edittype: "textarea", editoptions: {rows: "15", cols: "120"}, editrules: {edithidden: true, required: true}},
		{name: 'dificultad', index: 'dificultad', align: 'center', width: 10, editable: true, edittype: "select", editoptions: {value: ":&nbsp;facil:<s:text name='easy'/>;media:<s:text name='medium'/>;dificil:<s:text name='hard'/>"}, formatter: 'select', editrules:{required: true}},
		{name: 'numsesion', index: 'numsesion', align: 'center', width: 8, editable: true, editoptions: {size: 10}, editrules:{required: true, integer: true}},
		{name: 'visible', index: 'visible', align: 'center', width: 8, editable: true, edittype: "checkbox", editoptions: {value: "true:false"}, formatter: 'visibilidadFormatter'}
	    ],
	    rowList: [10, 20, 30, 50, 100, 1000],
	    sortname: 'id',
	    editurl: 'crudEjercicio',
	    caption: '<s:text name="exercises"/>',	    
	    loadComplete: function() {
		$("option[value=1000]").text('Todos');
		$('.tooltip.in').remove();
		$('.tooltipcell').tooltip({container : "body", placement : "top", animation: false});
		if(!iniciado){
		<s:if test="editar!=null">
		    $("#ejerciciosTable").jqGrid('editGridRow', <s:property value="editar"/>);
		</s:if>
		    iniciado = true;
		}
	    }
	},{
	    viewPagerButtons: false, // Debido al editor codemirror
	    closeAfterAdd: true,
	    closeAfterEdit: true,
	    reloadAfterSubmit: true,
	    processData: '<s:text name="processing"/>',
	    width: 900,
	    resize: false,
            recreateForm: true,
	    beforeInitData: function(form) {
		// Elimino el posible editor codemirror anterior
		destroyQueryEditor();
	    },
	    afterShowForm: function(form) {
		$("select", form).select2({'minimumResultsForSearch': 99, width: "220px"});
		$(":checkbox, :radio", form).uniform();
		var queryEditor = initQueryEditor();
		form.closest('div.ui-jqdialog').center();
                $('<a href="#" id="probar"><span class="icon-bolt"></span>Probar</a>')
                .addClass("fm-button btn")
                .prependTo("#Act_Buttons>td.EditButton");
                $("#probar").click(probar());
	    },
	    onclickSubmit: function(params, posdata) {
		$('#comprobandoModal').modal();
		return {};
	    },
	    beforeCheckValues: function(postdata, formid, mode) {
		postdata.query = queryEditor.getValue();
	    },
	    afterSubmit: function(response, postdata) {
		$('#comprobandoModal').modal("hide");
		var respuesta = $.parseJSON(response.responseText);
		return [respuesta.error == null, respuesta.error];
	    },
	});
        
        $("#ejerciciosTable")
	    .navSeparatorAdd("#ejerciciosTablePaginator", {})
	    .navButtonAdd('#ejerciciosTablePaginator', {
		caption: "",
		buttonicon: "icon-eye-close",
		position: "last",
		title: '<s:text name="lock"/> <s:text name="exercises"/>',
		    onClickButton: function() {
			var s = $("#ejerciciosTable").getGridParam('selarrrow');
			if (s.toString() == "") {
			    $('#avisoModal .texto').text("<s:text name='select.exercises.lock'/>");
			    $('#avisoModal').modal();
			}
			else {
			    $.getJSON("bloquearEjercicios", {
				ejercicios: s
			    }, function(respuesta) {
				if (respuesta.error != null) {
				    $('#avisoModal .texto').text(respuesta.error)
					.addClass("alert alert-error");
				}
				else {
				    $('#avisoModal .texto').text(respuesta.info)
					.addClass("alert alert-success");
				}
				
				$('#avisoModal').modal();
				$("#ejerciciosTable").trigger("reloadGrid");
			    });

			}
		    }	
	    })
	    .navButtonAdd('#ejerciciosTablePaginator', {
		caption: "",
		buttonicon: "icon-eye-open",
		position: "last",
		title: '<s:text name="unlock"/> <s:text name="exercises"/>',
		onClickButton: function() {
		    var s = $("#ejerciciosTable").getGridParam('selarrrow');
		    if (s.toString() == "") {
			$('#avisoModal .texto').text("<s:text name='select.exercises.unlock'/>");
			$('#avisoModal').modal();
		    }
		    else {
			$.getJSON("desbloquearEjercicios", {
			    ejercicios: s
			}, function(respuesta) {
			    if (respuesta.error != null) {
				$('#avisoModal .texto').text(respuesta.error)
				    .addClass("alert alert-error");
			    }
			    else {
				$('#avisoModal .texto').text(respuesta.info)
				    .addClass("alert alert-success");
			    }

			    $('#avisoModal').modal();
			    $("#ejerciciosTable").trigger("reloadGrid");
			});
		    }
		}
	    })
	    .navSeparatorAdd("#ejerciciosTablePaginator", {})
	    .navButtonAdd('#ejerciciosTablePaginator', {
		caption: "",
		buttonicon: "icon-upload",
		position: "last",
		title: '<s:text name="import"/> <s:text name="exercises"/>',
		onClickButton: function() {
		    $("#importarModal").modal();
		}
	    })
	    .navButtonAdd('#ejerciciosTablePaginator', {
		caption: "",
		buttonicon: "icon-download-alt",
		position: "last",
		title: '<s:text name="export"/> <s:text name="exercises"/>',
		onClickButton: function() {
		    $("#exportarModal").modal();
		}
	    });
	
    });
</script>