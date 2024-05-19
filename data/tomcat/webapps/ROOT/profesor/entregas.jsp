<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="entregas">
    <div class="info">
	<s:text name="select.solutions.info"/>
    </div>
    <div class="configuracion">		
	<label class="radio">
	    <input type="radio" name="order" id="ordenarPrimeroPorSesion" value="numsesion" checked>
	    Ordenar primero por sesión y después por apellidos
	</label>
	<label class="radio">
	    <input type="radio" name="order" id="ordenarPrimeroPorApellidos" value="apellidos">
	    Ordenar primero por apellidos y después por sesión
	</label>
    </div>
    <div class="sesiones">
	<table id="tablaSesiones" cellpadding="0" cellspacing="0"></table>		
    </div>
    <div class="acciones">
	<button id="descargar" class="btn btn-primary"><span class="icon-print icon-white"></span> <s:text name="download"/></button>
    </div>
</div>

<div id="avisoModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="avisoModalLabel" aria-hidden="true" style="width: 300px;">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="avisoModalLabel"><s:text name="warning"/></h4>
    </div>
    <div class="modal-body">
	<p class='texto'><s:text name="select.solutions.msg"/></p>
    </div>
</div>

<script language="JavaScript">
    $(document).ready(function() {

	var sesionesData = [<s:iterator value="sesiones" status="stat"><s:if test="#stat.index!=0">,</s:if> {id:<s:property value="key"/>, numsesion:<s:property value="key"/>, numentregas: <s:property value="value"/>}</s:iterator>],
	emptyMsgDiv = $('<div style="padding: 10px;font-size:13px;">No hay entregas disponibles para descargar</div>'),
		grid = $("#tablaSesiones");
	grid.jqGrid({
	    data: sesionesData,
	    loadComplete: function() {
		$(":checkbox").uniform();
		if (grid[0].p.reccount === 0) {
		    grid.hide();
		    emptyMsgDiv.show();
		} else {
		    grid.show();
		    emptyMsgDiv.hide();
		}
	    },
	    onSelectRow : function(){
	    $.uniform.update();
	    },
	    onSelectAll : function(){
		$.uniform.update();
	    },
	    datatype: "local",
	    width: 600,
	    forceFit: true,
	    height: 'auto',
	    deepempty: true,
	    colNames: ['Número de sesión', 'Número de entregas de alumnos'],
	    colModel: [
		{name: 'numsesion', key: true, width: 200, align: "center", sortable: false},
		{name: 'numentregas', width: 400, align: "center", sortable: false}
	    ],
	    multiselect: true,
	    multiselectWidth: 40
	});
	
	$(":checkbox, :radio").uniform();
	
	// place div with empty message insde of bdiv
	emptyMsgDiv.insertAfter(grid.parent());

	$("#descargar").click(function(event) {
	    event.preventDefault();
	    var ids = grid.jqGrid('getGridParam', 'selarrrow'),
		    orderVal = $(".entregas .configuracion :radio:checked").val(),
		    url = "descargarEntregas?order=" + orderVal;
	    if (!ids.length) {
		$("#avisoModal").modal();
	    } else {
		for (var i in ids) {
		    url += "&numsesion=" + ids[i];
		}
		window.location = url;
	    }
	});
    });
</script>


