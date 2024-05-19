<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form action="getEsquemas" class="ui-filters">
    <table>
	<thead>
	    <tr>
		<th>
		    <i class="icon-filter"></i>
		</th>
		<th>
		    <input id="filtro_nombre" name="filtro_nombre" type="text" />
		</th>
		<th class="select">
		    <select id="filtro_sgbd" name="filtro_sgbd">
			<option selected="selected" value="">&nbsp;</option>
			<option value="access">Access</option>
			<option value="mysql">MySQL</option>
			<option value="oracle">Oracle</option>					
			<option value="sqlserver">SQL Server</option>
		    </select>
		</th>
		<th>
		    <input id="filtro_host" name="filtro_host" type="text" />
		</th>
		<th>
		    <input id="filtrocn_puerto" name="filtrocn_puerto" type="text" />
		</th>
		<th>
		    <input id="filtro_esquema" name="filtro_esquema" type="text" />
		</th>
		<th>
		    
		</th>
	    </tr>
	</thead>
    </table>
    <input type="submit" style="display: none" />
</form>

<table id="esquemasTable" cellpadding="0" cellspacing="0"></table>

<!-- Modal para subir esquemas -->
<div id="subirEsquemasModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="subirEsquemasModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="subirEsquemasModalLabel"><s:text name="upload.pdf.title"/></h4>
    </div>
    <div class="modal-body">
	<div id="mensaje"></div>
	<div id="esquema" class="texto"></div>
	<div class="texto"><s:text name="upload.pdf.info"/></div>
    </div>
    <div class="modal-footer">
	<button id="subir" type="submit" class="btn btn-primary"><i class="icon-upload icon-white"></i> <s:text name="upload.pdf.title"/></button>
    </div>
</div>

<!-- Modal aviso seleccionar esquema -->
<div id="seleccionarEsquemaWarningModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="seleccionarEsquemaWarningModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="seleccionarEsquemaWarningModalLabel"><s:text name="warning"/></h4>
    </div>
    <div class="modal-body">
	<p class='texto'><s:text name='scheme.select.pdf'/></p>
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
    
	$("#subirEsquemasModal").on("hidden", function(){
	    $('#esquema').empty();
	    $('#mensaje').empty();
	    $('#mensaje').removeAttr("class");
	    $('#subir').removeAttr("alt");
	});
    
	var uploadPDF = new AjaxUpload('subir', {
	    action: 'subirPDF',
	    name: 'ficheroPDF',
	    autoSubmit: true,
	    responseType: "json",
	    onSubmit: function(file, extension) {
		$("#comprobandoModal").modal();
	    },
	    onComplete: function(file, response) {
		if(response.error != null){
		    $('#mensaje').removeAttr("class")
			.text(response.error)
			.addClass("alert alert-error");
		}
		else {
		    $('#mensaje').removeAttr("class")
			.text(response.info)
			.addClass("alert alert-success");
		}
		
		$('#comprobandoModal').modal("hide");
		$("#esquemasTable").trigger("reloadGrid");
	    }
	});

	// Tabla
	$("#esquemasTable").initJqGridTable({
	    url: 'getEsquemas?' + $('form.ui-filters').formSerialize(),
	    colNames: ['ID', '<s:text name="name"/>', '<s:text name="sgbd"/>', 'Host', '<s:text name="port"/>', '<s:text name="scheme"/>', '<s:text name="username"/>', '<s:text name="password"/>', 'PDF'],
	    colModel: [
		{name: 'id', index: 'id', key: true, hidden: true},
		{name: 'nombre', index: 'nombre', width: 30, editable: true, editoptions: {size: 10}, editrules:{required: true}},
		{name: 'sgbd', index: 'sgbd', width: 10, editable: true, edittype: "select", editoptions: {value: {"": "&nbsp;", "Access": "Access", "MySQL": "MySQL", "Oracle": "Oracle", "SQL Server": "SQL Server"}}, editrules:{required: true}},
		{name: 'host', index: 'host', width: 20, editable: true, editoptions: {size: 10}, editrules: {edithidden: true}},
		{name: 'puerto', index: 'puerto', width: 10, editable: true, editoptions: {size: 10}, editrules: {edithidden: true, integer: true}},
		{name: 'esquema', index: 'esquema', width: 20, editable: true, editoptions: {size: 10}, editrules: {edithidden: true, required: true}},
		{name: 'user', hidden: true, editable: true, editoptions: {size: 10}, editrules: {edithidden: true}},
		{name: 'password', hidden: true, editable: true, editoptions: {size: 10}, editrules: {edithidden: true}},
		{name: 'pdf', width: 10, editable: false, align: 'center', sortable: false, formatter: 'enlaceDescripcionEsquemaFormatter'}
	    ],
	    rowList: [10, 20, 30, 50, 100],
	    sortname: 'sgbd',
	    editurl: 'crudEsquema',
	    caption: '<s:text name="scheme"/>',
	    loadComplete: function() {
		$(document).on('click', '.esquemaSubirPdfBtn', function() {
		    var id = $(this).attr("alt");
		    var esquema = $('#esquemasTable').getCell(id, "nombre");
		    $("#esquema").append($("<h4>" + esquema + "</h4>"));
		    uploadPDF.setData({'id': id});
		    $("#subirEsquemasModal").modal();
		    return false;
		});
	    }
	}, {
	    closeAfterAdd: true,
	    closeAfterEdit: true,
	    reloadAfterSubmit: true,
	    processData: '<s:text name="processing"/>',
	    height: 'auto',
	    top: 0,
	    left: 0,
	    onclickSubmit: function(params, posdata) {
		$("#comprobandoModal").modal();
		return {};
	    },
	    afterSubmit: function(response, postdata) {
		$("#comprobandoModal").modal("hide");
		var respuesta = $.parseJSON(response.responseText);
		return [respuesta.error == null, respuesta.error];
	    }	    
	});

	$("#esquemasTable")
		.navSeparatorAdd("#esquemasTablePaginator", {})
		.navButtonAdd('#esquemasTablePaginator', {
		    caption: "",
		    buttonicon: "icon-upload",
		    position: "last",
		    title: '<s:text name="upload.pdf.desc.title"/>',
		    onClickButton: function() {
			var tablaEsquemas = $('#esquemasTable'),
			    selRowId = tablaEsquemas.jqGrid('getGridParam', 'selrow'),
			    nombre = tablaEsquemas.jqGrid('getCell', selRowId, 'nombre'),
			    id = tablaEsquemas.jqGrid('getCell', selRowId, 'id');
		    
			if (!selRowId) {
			    $("#seleccionarEsquemaWarningModal").modal();
			}
			else {
			    $("#esquema").append($("<h4>" + nombre + "</h4>"));
			    uploadPDF.setData({'id': id});
			    $("#subirEsquemasModal").modal();
			}
		    }
	});

    });
</script>

