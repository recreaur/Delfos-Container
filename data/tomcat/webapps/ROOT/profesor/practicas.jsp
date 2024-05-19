<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<form action="getPracticas" class="ui-filters">
    <table>
	<thead>
	    <tr>
		<th>
		    <i class="icon-filter"></i>
		</th>
		<th>
		    <s:textfield key="filtroeq_id" theme="simple" />
		</th>
		<th>
		    <input id="filtro_nombre" name="filtro_nombre" type="text" />
		</th>
		<th class="select">
		    <select id="filtroeq_sesion" name="filtroeq_sesion">
			<option selected="selected" value="">&nbsp;</option>
			<s:iterator value="sesionesPracticas">
			    <option value="<s:property/>"><s:property/></option>
			</s:iterator>
		    </select>
		</th>
		<th>
		    
		</th>
		<th class="select">
		    <select id="filtroeq_visible" name="filtroeq_visible">
			<option selected="selected" value="">&nbsp;</option>
			<option value="true"><s:text name="yes"/></option>
			<option value="false"><s:text name="no"/></option>
		    </select>
		</th>
		<th>
		    
		</th>
	    </tr>
	</thead>
    </table>    
    <input type="submit" style="display: none" />
</form>
	    
<table id="practicasTable" cellpadding="0" cellspacing="0"></table>

<script type="text/javascript">
    $(document).ready(function() {
	
	var iniciado;
	
	$(document).on("click", "#visible", function() {
	    if ($('#visible').is(':checked') && !$("#tr_duracion").length) {
		var duracion = $('<tr rowpos="4" class="FormData" id="tr_duracion"><td class="CaptionTD ui-widget-content">Duración <span title="Campo obligatorio" class="required">*</span></td><td style="white-space: pre;" class="DataTD ui-widget-content">&nbsp;<input type="text" id="duracion" name="duracion" class="FormElement" style="width:40px;margin-right:10px;"> minutos</td></tr>');
		$("#tr_visible").after(duracion);
		$("#duracion").focus();
	    }
	    if (!$('#visible').is(':checked'))
		$("#tr_duracion").remove();
	});

	// Tabla	
	$("#practicasTable").initJqGridTable({
	    url: 'getPracticas?' + $('form.ui-filters').formSerialize(),
	    colNames: ['ID', '<s:text name="name"/>', '<s:text name="session"/>', '<s:text name="exercises"/>', '<s:text name="visible"/>','<s:text name="duration"/>'],
	    colModel: [
		{name: 'id', index: 'id', key: true, align: 'center', width: 5, editable: false},
		{name: 'nombre', index: 'nombre', width: 40, editable: true, editoptions: {size: 10}, editrules: {required: true}},
		{name: 'numsesion', index: 'numsesion, id', align: 'center', width: 8, editable: true, editoptions: {size: 10}, editrules: {required: true, integer: true}},
		{name: 'ejercicios', align: 'center', width: 8, sortable: false, formatter: 'enlaceEjerciciosPracticaFormatter'},
		{name: 'visible', index: 'visible', align: 'center', width: 8, editable: true, edittype: "checkbox", editoptions: {value: "true:false"}, formatter: 'visibilidadFormatter'},
		{name: 'duracion', align: 'center', width: 31, sortable: false, formatter: 'duracionPracticaFormatter'}
	    ],
	    rowList: [10, 20, 30, 50, 100],
	    sortname: 'id',	    
	    editurl: 'crudPractica',
	    caption: '<s:text name="practices"/>',
	    loadComplete: function() {
		if(!iniciado){
		<s:if test="editar!=null">
		    $("#practicasTable").jqGrid('editGridRow', <s:property value="editar"/>);
		</s:if>
		    iniciado = true;
		}
		$('div.practice-countdown').each(function(index, elem){
		    $(elem).countdown({
			until: +$(elem).text(), 
			format: 'dhmS',
			onExpiry: function(){
			    $("#practicasTable").trigger("reloadGrid");
			}
		    });
		});
	    },
	    ondblClickRow: function(id) {
		$('#practicasTable').jqGrid('editGridRow', id);
	    }
	},{
	    onClose: function() {
		$("#tr_duracion").remove();
	    },
	    onComplete: function() {
		$("#tr_duracion").remove();
	    }
	});
    });
</script>