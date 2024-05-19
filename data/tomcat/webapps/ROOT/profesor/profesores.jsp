<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form action="getProfesores" class="ui-filters">
    <table>
	<thead>
	    <tr>
		<th>
		    <i class="icon-filter"></i>
		</th>
		<th>
		    <input id="filtro_cuasi" name="filtro_cuasi" type="text"/>
		</th>
		<th>
		    <input id="filtro_usuario.email" name="filtro_usuario.email" type="text"/>
		</th>
	    </tr>
	</thead>
    </table>
    <input type="submit" style="display: none" />
</form>

<table id="profesoresTable" cellpadding="0" cellspacing="0"></table>

<script type="text/javascript">
    $(document).ready(function() {	
	
	// Tabla
	$("#profesoresTable").initJqGridTable({
	    url: 'getProfesores?' + $('form.ui-filters').formSerialize(),
	    colNames: ['<s:text name="cuasi"/>', '<s:text name="email"/>'],
	    colModel: [
		{name: 'cuasi', index: 'cuasi', key: true, width: 30, editable: true, editoptions: {size: 10}, editrules:{required: true}},
		{name: 'email', index: 'email', width: 70, sortable: false, editable: true, editoptions: {size: 10}}
	    ],
	    sortname: 'cuasi',
	    editurl: 'crudProfesor',
	    caption: '<s:text name="professors"/>'
	},{
	    afterShowForm: function(form) {
		var cuasi = $("#cuasi");
		if (cuasi.val() != "") {
		    cuasi.attr("disabled", "disabled").addClass("disabled");
		} else {
		    cuasi.removeAttr("disabled").removeClass("disabled");
		}
		$("input:text:visible:not(:disabled):first").focus();
		$("select", form).select2({'minimumResultsForSearch': 99, width: "220px"});
		form.closest('div.ui-jqdialog').center();
	    }
	});

    });
</script>