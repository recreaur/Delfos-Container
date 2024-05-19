<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="detalles-ejercicios-practica">
    <span><i class="icon-list-alt"></i> <s:text name="details"/></span>
    <span class="divisor">|</span>
    <span><s:text name="name"/>:</span>
    <span><s:property value="practica.nombre"/></span>
    <span class="divisor">|</span>
    <span><s:text name="session"/>:</span>
    <span><s:property value="practica.numsesion"/></span>
    <span class="divisor">|</span>
    <span><s:text name="visible"/>:</span>
    <span>
	<s:if test="practica.visible"> <s:text name="yes"/></s:if>
	<s:else> <s:text name="no"/></s:else>
    </span>

    <a href="practicas?editar=<s:property value='practica.id'/>" class="btn btn-primary"><s:text name="practice.modify"/></a>
</div>

<table id="ejerciciosPracticaTable" cellpadding="0" cellspacing="0"></table>

<form action="getEjerciciosDisponibles" class="ui-filters">    
    <table>
	<thead>
	    <tr>
		<th>
		    <i class="icon-filter"></i>
		</th>
		<th>
		    
		</th>
		<th>
		    <select id="filtroeq_esquema" name="filtroeq_esquema">
			<option selected="selected" value="">&nbsp;</option>
			<s:iterator value="esquemas">
			    <option value="<s:property value='id'/>"><s:property value='nombre'/></option>
			</s:iterator>
		    </select>
		</th>
		<th>
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
		<th>
		    <select id="filtro_dificultad" name="filtro_dificultad">
			<option selected="selected" value="">&nbsp;</option>
			<option value="facil"><s:text name="easy"/></option>
			<option value="media"><s:text name="medium"/></option>					
			<option value="dificil"><s:text name="hard"/></option>
		    </select>
		</th>
		<th>
		    <select id="filtroeq_sesion" name="filtroeq_sesion">
			<option selected="selected" value="">&nbsp;</option>
			<s:iterator value="sesionesConEjercicios">
			    <option value="<s:property/>"><s:property/></option>
			</s:iterator>
		    </select>
		</th>
		<th>
		    <select id="filtroeq_visible" name="filtroeq_visible">
			<option selected="selected" value="">&nbsp;</option>
			<option value="true"><s:text name="yes"/></option>
			<option value="false"><s:text name="no"/></option>
		    </select>
		</th>
	    </tr>
	</thead>
    </table>
    <s:hidden name="idpractica" value="%{practica.id}"/>
    <input type="submit" style="display: none" />
</form>
	    
<table id="ejerciciosDisponiblesTable" cellpadding="0" cellspacing="0"></table>

<div id="avisoModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="avisoModalLabel" aria-hidden="true" style="width: 300px;">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="avisoModalLabel"><s:text name="warning"/></h4>
    </div>
    <div class="modal-body">
	<p class='texto'></p>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
	
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
	
	// Obtiene los ids de ejercicioPractica correspondientes a los ids de ejercicios en una práctica
	function getEjercicioPracticaIdsFromEjercicioIds(ejerciciosIds){
	    var grid = $("#ejerciciosPracticaTable"),
		ejerciciosPracticaIds = [];
	    $(ejerciciosIds).each(function(index, elem){
		ejerciciosPracticaIds.push(grid.jqGrid('getCell', elem, 'idEjercicioPractica'));
	    });
	    return ejerciciosPracticaIds;
	}
	
	function destroyQueryEditor(){
	    if(queryEditor) queryEditor.toTextArea();
	}
	
	$('#avisoModal').on('hidden', function () {
	    $('#avisoModal .texto').empty().removeAttr("class").addClass("texto");
	});
	
	// Tabla ejercicios de práctica
	$("#ejerciciosPracticaTable").initJqGridTable({
	    url: 'getEjerciciosPractica?idpractica=<s:property value="practica.id"/>',
	    colNames: ['ID <s:text name="exercise"/>', 'ID EjercicioPractica', '<s:text name="number"/>', '<s:text name="scheme"/>', '<s:text name="practice"/>', '<s:text name="statement"/>', '<s:text name="sql.query.solution"/>', '<s:text name="difficulty"/>', '<s:text name="session"/>', '<s:text name="visible"/>'],
	    colModel: [
		{name: 'id', key: true, hidden: true},
		{name: 'idEjercicioPractica', hidden: true, sortable: false},		
		{name: 'numero', index: 'numero', width: 5, align: 'center', editable: false, sortable: false, formatter: 'numeroEjercicioPracticaFormatter'},					
		{name: 'esquema',  width: 18, editable: true, edittype: "select", sortable: false, editoptions: {value: ":&nbsp;<s:iterator value='esquemas'><s:property value='id'/>:<s:property value='nombre'/>;</s:iterator>".replace(/;$/, "")}},
		{name: 'practica', align: 'center', width: 18, editable: false, sortable: false, formatter: "practicasFormatter", cellattr: celdaPracticasAttr},
		{name: 'enunciado', width: 33, editable: true, sortable: false, edittype: "textarea", editoptions: {rows: "2", cols: "40"}},
		{name: 'query', hidden: true, editable: true, editrules: {edithidden: true}, edittype: "textarea", editoptions: {rows: "4", cols: "40"}},
		{name: 'dificultad', align: 'center', width: 10, editable: true, sortable: false, edittype: "select", editoptions: {value: ":;facil:<s:text name='easy'/>;media:<s:text name='medium'/>;dificil:<s:text name='hard'/>"}, formatter: 'select'},
		{name: 'numsesion', align: 'center', width: 8, editable: true, sortable: false, editoptions: {size: 10}},
		{name: 'visible', align: 'center', width: 8, editable: true, sortable: false, edittype: "checkbox", editoptions: {value: "true:false"}, formatter: 'visibilidadFormatter'}
	    ],
	    rowNum: 9999,
	    rowList: [],
	    pgbuttons: false,
	    pginput: false,
	    sortname: 'numero',
	    editurl: 'crudEjercicio',
	    caption: '<s:text name="exercises"/>',
	    loadComplete: function() {
		$('.tooltip.in').remove();
		$('.tooltipcell').tooltip({container : "body", placement : "top", animation: false});
	    }
	}, {
	    viewPagerButtons: false, // Debido al editor codemirror
	    closeAfterAdd: true,
	    closeAfterEdit: true,
	    reloadAfterSubmit: true,
	    processData: '<s:text name="processing"/>',
	    width: 900,
	    resize: false,
	    beforeInitData: function(form) {
		// Elimino el posible editor codemirror anterior
		destroyQueryEditor();
	    },
	    afterShowForm: function(form) {
		$("select", form).select2({'minimumResultsForSearch': 99, width: "220px"});
		$(":checkbox, :radio", form).uniform();		
		$('#tr_numsesion').hide();
		initQueryEditor();
		form.closest('div.ui-jqdialog').center();			
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
	    }
	}, {}, {
	    add: false,
	    edit: true,
	    view: false,
	    del: false,
	    search: false
	});

	$("#ejerciciosPracticaTable").jqGrid('sortableRows', {
	    placeholder: "ui-widget-content jqgrow ui-row-ltr ui-sortable-placeholder",
	    start: function(event, ui) {
		$('.tooltipcell').tooltip("destroy");
		var cabeceras = ui.helper.closest(".ui-jqgrid-bdiv").prev().find(".ui-jqgrid-labels").children("th");
		ui.placeholder.children("td").html("<div class='placeholder-dashed-box'>Mover aquí</div>");
		ui.helper.children("td").each(function(index) {
		    $(this).css("maxWidth", $(cabeceras.get(index)).width());
		});
	    },
	    stop: function(event, ui){
		$('.tooltipcell').tooltip({container : "body", placement : "top", animation: false});
	    }
	});

	$("#ejerciciosPracticaTable")
		.navSeparatorAdd("#ejerciciosPracticaTablePaginator", {})
		.navButtonAdd('#ejerciciosPracticaTablePaginator', {
		    caption: "",
		    buttonicon: "icon-remove",
		    position: "last",
		    title: 'Desvincular ejercicios de la práctica',
		    onClickButton: function() {
			var s = $("#ejerciciosPracticaTable").getGridParam('selarrrow');
			if (s.toString() == "") {
			    $('#avisoModal .texto').text("<s:text name='select.exercises.unlink'/>");
			    $('#avisoModal').modal();
			} else {
			    $.getJSON("delEjercicios", {
				idpractica: <s:property value="practica.id"/>,
				ejercicios: getEjercicioPracticaIdsFromEjercicioIds(s)

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
				
				$("#ejerciciosDisponiblesTable").trigger("reloadGrid");
				$("#ejerciciosPracticaTable").trigger("reloadGrid");
			    });

			}
		    }
		})
		.navSeparatorAdd("#ejerciciosPracticaTablePaginator", {})
		.navButtonAdd('#ejerciciosPracticaTablePaginator', {
		    caption: "",
		    buttonicon: "icon-pin",
		    position: "last",
		    title: 'Guardar orden de ejercicios',
		    onClickButton: function() {
			$("#ejerciciosPracticaTable").resetSelection();
			var s = $("#ejerciciosPracticaTable").getDataIDs();
			
			if (s.toString() == "") {
			    $('#avisoModal .texto').text("<s:text name='select.exercises.save.order.error'/>");
			    $('#avisoModal').modal();
			}
			else {
			    $.getJSON("ordEjercicios", {
				idpractica: <s:property value="practica.id"/>,
				ejercicios: getEjercicioPracticaIdsFromEjercicioIds(s)

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
				
				$("#ejerciciosPracticaTable").trigger("reloadGrid");
			    });
			}
		    }
		});	

	// Tabla ejercicios disponibles	
	$("#ejerciciosDisponiblesTable").initJqGridTable({
	    url: 'getEjerciciosDisponibles?idpractica=<s:property value="practica.id"/>',
	    colNames: ['ID', '<s:text name="number"/>', '<s:text name="scheme"/>', '<s:text name="practice"/>', '<s:text name="statement"/>', 'SQL', '<s:text name="difficulty"/>', '<s:text name="session"/>', '<s:text name="visible"/>'],
	    colModel: [
		{name: 'id', index: 'id', key: true, hidden: true, sortable: false},	
		{name: 'numero', width: 5, align: 'center', editable: false, sortable: false},		
		{name: 'esquema', width: 18, editable: true, edittype: "select", editoptions: {value: ":&nbsp;<s:iterator value='esquemas'><s:property value='id'/>:<s:property value='nombre'/>;</s:iterator>".replace(/;$/, "")}},
		{name: 'practica', align: 'center', width: 18, editable: false, sortable: false, formatter: "practicasFormatter", cellattr: celdaPracticasAttr},
		{name: 'enunciado', width: 33, sortable: false, editable: true, edittype: "textarea", editoptions: {rows: "2", cols: "40"}},
		{name: 'query', hidden: true, editable: true, editrules: {edithidden: true}, edittype: "textarea", editoptions: {rows: "4", cols: "40"}},
		{name: 'dificultad', align: 'center', width: 10, editable: true, edittype: "select", editoptions: {value: ":;facil:<s:text name='easy'/>;media:<s:text name='medium'/>;dificil:<s:text name='hard'/>"}, formatter: 'select'},
		{name: 'numsesion', align: 'center', width: 8, editable: true, editoptions: {size: 10}},
		{name: 'visible', align: 'center', width: 8, editable: true, edittype: "checkbox", editoptions: {value: "true:false"}, formatter: 'visibilidadFormatter'}
	    ],
	    rowList: [10, 20, 30, 50, 100],
	    sortname: 'id',
	    editurl: 'crudEjercicio',
	    caption: '<s:text name="exercises"/> disponibles para añadir a la práctica',
	    loadComplete: function() {
		$('.tooltip.in').remove();
		$('.tooltipcell').tooltip({container : "body", placement : "top", animation: false});
	    },
	    onSelectRow: function(rowid, status) {
		$.uniform.update();
		if (!status){
		    $("#ejerciciosDisponiblesTable").setCell(rowid, "numero", null, "");
		}		    
		var rowarray = $("#ejerciciosDisponiblesTable").getGridParam('selarrrow');
		var records = $("#ejerciciosPracticaTable").getGridParam('records');
		for (i = 0; i < rowarray.length; i++) {
		    var id = rowarray[i];
		    $("#ejerciciosDisponiblesTable").setCell(id, "numero", i + 1 + records, "marcado");
		}
	    }
	}, {
	    viewPagerButtons: false, // Debido al editor codemirror
	    closeAfterAdd: true,
	    closeAfterEdit: true,
	    reloadAfterSubmit: true,
	    processData: '<s:text name="processing"/>',
	    width: 900,
	    resize: false,
	    beforeInitData: function(form) {
		// Elimino el posible editor codemirror anterior
		destroyQueryEditor();
	    },
	    afterShowForm: function(form) {
		$("select", form).select2({'minimumResultsForSearch': 99, width: "220px"});
		$(":checkbox, :radio", form).uniform();
		initQueryEditor();
		form.closest('div.ui-jqdialog').center();			
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
	    }
	}, {}, {
	    add: false,
	    edit: true,
	    view: false,
	    del: false,
	    search: false
	});

	$("#ejerciciosDisponiblesTable")
		.navSeparatorAdd("#ejerciciosDisponiblesTablePaginator", {})
		.navButtonAdd('#ejerciciosDisponiblesTablePaginator', {
		    caption: "",
		    buttonicon: "icon-link",
		    position: "last",
		    title: 'Vincular ejercicios a la práctica',
		    onClickButton: function() {
			var s = $("#ejerciciosDisponiblesTable").getGridParam('selarrrow');
			if (s.toString() == "") {
			    $('#avisoModal .texto').text("<s:text name='select.exercises.link'/>");
			    $('#avisoModal').modal();
			} else {
			    $.getJSON("addEjercicios", {
				idpractica: <s:property value="practica.id"/>,
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
				
				$("#ejerciciosDisponiblesTable").trigger("reloadGrid");
				$("#ejerciciosPracticaTable").trigger("reloadGrid");
			    });

			}
		    }
		});

    });
</script>