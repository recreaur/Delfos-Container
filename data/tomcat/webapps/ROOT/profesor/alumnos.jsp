<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form action="getAlumnos" class="ui-filters">
    <table>
	<thead>
	    <tr>
		<th>
		    <i class="icon-filter"></i>
		</th>
		<th>
		    <input id="filtro_dni" name="filtro_dni" type="text"/>
		</th>
		<th>
		    <input id="filtro_cuasi" name="filtro_cuasi" type="text"/>
		</th>
		<th>
		    <input id="filtro_apellidos" name="filtro_apellidos" type="text"/>
		</th>
		<th>
		    <input id="filtro_nombre" name="filtro_nombre" type="text"/>	    
		</th>
		<th>
		    <input id="filtro_usuario.email" name="filtro_usuario.email" type="text"/>
		</th>
		<th class="select">
		    <select id="filtroeq_habilitado" name="filtroeq_habilitado">
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

<table id="alumnosTable" class="scroll" cellpadding="0" cellspacing="0"></table>

<!-- Modal exportar alumnos -->
<div id="exportarAlumnosWarningModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="exportarAlumnosWarningModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="exportarAlumnosWarningModalLabel"><s:text name="warning"/></h4>
    </div>
    <div class="modal-body">
	<p class="texto"><s:text name="student.export.info"/></p>
    </div>
</div>

<!-- Modal importar alumnos -->
<div id="importarAlumnosModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="importarAlumnosModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="importarAlumnosModalLabel"><s:text name="import"/> <s:text name="students"/></h4>
    </div>
    <div class="modal-body">
	<div id="mensaje"></div>
	<div class="texto">
	    <p><s:text name="student.import.info"/></p>
	    <p><s:text name="student.import.format"/></p>
	    <s:textarea id="importFormat" value="%{getText('student.import.info.example')}" theme="simple" />
	</div>
    </div>
    <div class="modal-footer">
	<button id="importar" type="submit" class="btn btn-primary"><i class="icon-upload icon-white"></i> <s:text name='import'/></button>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {	
	
	var queryEditor;
	
	$('#importarAlumnosModal').on('shown', function () {
	    if(!queryEditor){
		queryEditor = CodeMirror.fromTextArea(document.getElementById('importFormat'), {
		    mode: 'text/x-sh',
		    readOnly: true,	
		    lineNumbers: true
		});
	    }	    
	});
	
	$('#importarAlumnosModal').on('hidden', function () {
	    $('#mensaje').empty().removeAttr("class");
	});
	
	new AjaxUpload('importar', {
	    action: 'importarAlumnos',
	    name: 'ficheroAlumnos',
	    autoSubmit: true,
	    responseType: "json",
	    onSubmit: function(file, extension) {
	    },
	    onComplete: function(file, response) {		
		if(response.error != null){
		    $('#mensaje').removeAttr("class")
			.text(response.error)
			.addClass("alert alert-error");
		}
		else {
		    var msgSubidos = response.info + " <s:text name='students.imported'/>";
		    if (response.info == "1") {
			msgSubidos = response.info + " <s:text name='student.imported'/>"
		    }
		    $('#mensaje').removeAttr("class")
			.text(msgSubidos)
			.addClass("alert alert-success");
		}		
		
		$("#alumnosTable").trigger("reloadGrid");
	    }
	});

	// Tabla
	$("#alumnosTable").initJqGridTable({
	    url: 'getAlumnos?' + $('form.ui-filters').formSerialize(),
	    colNames: ['<s:text name="dni"/>', '<s:text name="cuasi"/>', '<s:text name="surname"/>', '<s:text name="name"/>', '<s:text name="email"/>', '<s:text name="enabled"/>'],
	    colModel: [
		{name: 'dni', index: 'dni', width: 12, editable: true, editoptions: {size: 10}, editrules:{required: true}},
		{name: 'cuasi', index: 'cuasi', key: true, width: 13, editable: true, editoptions: {size: 10}, editrules:{required: true}},
		{name: 'apellidos', index: 'apellidos', width: 20, editable: true, editoptions: {size: 10}, editrules:{required: true}},
		{name: 'nombre', index: 'nombre, apellidos', width: 20, editable: true, editoptions: {size: 10}, editrules:{required: true}},
		{name: 'email', index: 'email', width: 25, sortable: false, editable: true, editoptions: {size: 10}},
		{name: 'habilitado', index: 'habilitado, apellidos', width: 10, align: "center", editable: true, edittype: "checkbox", editoptions: {value: "true:false"}, formatter: 'habilitadoFormatter'}
	    ],
	    rowList: [10, 20, 30, 50, 100, 1000],
	    sortname: 'apellidos',
	    editurl: 'crudAlumno',
	    caption: '<s:text name="students"/>',
	    loadComplete: function() {
		$("option[value=1000]").text('<s:text name="all"/>');
	    }
	}, {
	    afterShowForm: function(form) {
		var cuasi = $("#cuasi");
		if (cuasi.val() != "") {
		    cuasi.attr("disabled", "disabled").addClass("disabled");
		} else {
		    cuasi.removeAttr("disabled").removeClass("disabled");
		}
		$("input:text:visible:not(:disabled):first").focus();
		$(":checkbox, :radio", form).uniform();
		form.closest('div.ui-jqdialog').center();
	    }
	});

	$("#alumnosTable")
	    .navSeparatorAdd("#alumnosTablePaginator", {})
	    .navButtonAdd('#alumnosTablePaginator', {
		caption: "",
		buttonicon: "icon-upload",
		position: "last",
		title: '<s:text name="import"/> <s:text name="students"/>',
		onClickButton: function() {
		    $('#importarAlumnosModal').modal();
		}
	    })
	    .navButtonAdd('#alumnosTablePaginator', {
		caption: "",
		buttonicon: "icon-download-alt",
		position: "last",
		title: '<s:text name="export"/> <s:text name="students"/>',
		onClickButton: function() {
		    s = $("#alumnosTable").getGridParam('selarrrow');
		    if (s.toString() == "")
			$("#exportarAlumnosWarningModal").modal();
		    else
			window.location = "exportarAlumnos?alumnos=" + encodeURIComponent(s.toString());
		}
	    });
    });
</script>