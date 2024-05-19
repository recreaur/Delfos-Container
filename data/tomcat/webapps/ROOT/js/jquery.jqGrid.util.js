/* 
 * Utilidades para simplificar js de jqGrid
 */

String.prototype.endsWith = function (s) {
  return this.length >= s.length && this.substr(this.length - s.length) == s;
}

jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", ( $(window).height() - this.height() ) / 2+$(window).scrollTop() + "px");
    this.css("left", ( $(window).width() - this.width() ) / 2+$(window).scrollLeft()+($(this).hasClass("modal") ? 280 : 0) + "px");
    return this;
};

$(document).on('show', '.modal', function(){
    $(this).center();
});

jQuery.fn.initJqGridTable = function (gridoptions, editoptions, deloptions, navoptions, viewoptions) {	    
    // Creo el paginador si no se proporciona
    if(!gridoptions.pager){
	var paginator = $('<div id="' + $(this).prop("id") + 'Paginator" style="text-align:center;"></div>');
	$(this).after(paginator);
    }

    var that = this,
    gridopts = $.extend({}, {
	hidegrid: false,
	//altRows: true,
	datatype: "json",
	autowidth: true,
	forceFit: true,
	height: 'auto',
	deepempty : true,
	pager: paginator,
	rowNum: 10,
	rowList: [10, 20, 30, 50, 100],
	mtype: "POST",
	viewrecords: true,
	sortorder: "asc",
	loadonce: false,
	multiselect: true,
	multiselectWidth: 40,
	onSelectRow : function(){
	    $.uniform.update();
	},
	onSelectAll : function(){
	    $.uniform.update();
	},
	gridComplete: function(){
	    $(":checkbox, :radio").uniform();	    
	},
	ondblClickRow: function(id) {
	    if(!navoptions || navoptions.edit){
		$(that).jqGrid('editGridRow', id, editopts);
		$("#editmod" + $(that).prop("id")).center();
	    } else if(!navoptions || navoptions.view){
		$(that).jqGrid('viewGridRow', id, viewopts);
		$("#viewmod" + $(that).prop("id")).center();
	    }
	}
    }, gridoptions),

    editopts = $.extend({}, {
	datatype: "json",
	drag: false,
	resize: false,
	closeAfterAdd: true,
	closeAfterEdit: true,
	reloadAfterSubmit: true,
	processData: "Procesando...",
	height: 'auto',
	top: 0,
	left: 0,
	afterSubmit: function(response, postdata) {
	    var respuesta = $.parseJSON(response.responseText);
	    return [respuesta.error == null, respuesta.error];
	},
	onInitializeForm: function (form) {
	    $(document).on("keypress", "#" + form.attr("id") + " td.DataTD > .FormElement:not(textarea)", function (e) {
                if (e.which === $.ui.keyCode.ENTER) {
                    $("#sData", form.next()).trigger("click");
                    return false;
                }
            });	    
        },
	afterShowForm: function(form) {
	    $(":checkbox, :radio", form).uniform();
	    $("select", form).select2({'minimumResultsForSearch': 99, width: "220px"});
	    form.closest('div.ui-jqdialog').center();
	}
    }, editoptions),

    delopts = $.extend({}, {
	datatype: "json",
	drag: false,
	resize: false,
	afterSubmit: function(response, postdata) {
	    var respuesta = $.parseJSON(response.responseText);
	    if(!respuesta.usuario || !respuesta.usuario.profesor) document.location = "../login";
	    return [respuesta.error == null, respuesta.error];
	},
	afterShowForm: function(form) {	    
	    form.closest('div.ui-jqdialog').center();
	}
    }, deloptions),
    
    navopts = $.extend({}, {
	add: true,
	edit: true,
	view: false,
	del: true,
	search: false,
	refresh: true
    }, navoptions),

    viewopts = $.extend({}, {
	datatype: "json",
	drag: false,
	resize: false,
	closeOnEscape: true,    // allow the view dialog to be closed when user press ESC key
	beforeShowForm: function(form) {
	    $(":checkbox, :radio").change(function(){$.uniform.update();}).uniform();
	    form.closest('div.ui-jqdialog').center();
	}
    }, viewoptions);

    $(this).jqGrid(gridopts);

    $(":checkbox, :radio").uniform();
    $(".ui-filters select, select.ui-pg-selbox").not("#filtroeq_practica").select2({'minimumResultsForSearch': 99});
    $("select#filtroeq_practica").select2({'minimumResultsForSearch': 99, 'dropdownCssClass': 'practicas-select-dropdown'});

    $(this).extend(jQuery.jgrid.edit, editopts);

    $(this).extend(jQuery.jgrid.del, delopts);    

    $(this).navGrid("#"+$(gridopts.pager).prop("id"),
	navopts,
	editopts,   // settings for edit
	editopts,   // settings for add
	delopts,    // settings for delete 
	{   // settings for search
	    multipleSearch: true
	},
	viewopts // settings for view	
    );

    // Ancho fluido de jqgrid
    $(window).bind('resize', function() {
	if (grid = $('.ui-jqgrid-btable:visible')) {
	    grid.each(function(index) {
		gridId = $(this).attr('id');
		gridParentWidth = $('#gbox_' + gridId).parent().width();
		$('#' + gridId).setGridWidth(gridParentWidth - 2);
	    });
	}
    }).trigger('resize');
    
    // Centrado de dialogos al redimensionar la ventana
    $(window).bind('resize', function() {
	$('div.ui-jqdialog').center();
    });
    
    if($(that).closest(".ui-jqgrid").prev().is('form.ui-filters')){
	var jqgrid = $(that).closest(".ui-jqgrid"),
	    jqgridhtable = jqgrid.find(".ui-jqgrid-htable"),
	    filtersForm = $(that).closest(".ui-jqgrid").prev(),
	    tr = filtersForm.find("tr");
	// Añado la clase .ui-th-column a las celdas de los filtros
	tr.find("th").addClass("ui-th-column");
	// Añado los filtros al header de la tabla y la clase .ui-search-toolbar
	jqgrid.find(".ui-jqgrid-htable > thead").append(tr.addClass("ui-search-toolbar"));	
	// Envuelvo el header de la tabla en el form de filtros
	jqgridhtable.wrap(filtersForm);
	// Elimino el formulario original
	filtersForm.remove();
	// Envío mediante ajax de los filtros
	jqgridhtable.parent().ajaxForm({
	    beforeSerialize: function(form, options) {		
		$(that).setGridParam({url: $(form).prop("action") + "?" + $(form).formSerialize(), page: 1}).trigger("reloadGrid");
		// Cancelo el submit ya que no me interesa
		return false;
	    }
	});
    }
    
    $('form.ui-filters input:not(:checkbox), form.ui-filters select').on("change", function(){
	$(this).closest("form").submit();
    });
};

/* Formatters */

jQuery.extend($.fn.fmatter , {
    visibilidadFormatter : function(cellvalue, options, rowdata) {
	if(cellvalue==true) return '<i class="icon-eye-open icon-success">Sí</i>';
	else return '<i class="icon-eye-close icon-error">No</i>';
    }
});
jQuery.extend($.fn.fmatter.visibilidadFormatter , {
    unformat : function(cellvalue, options) {
	if(cellvalue=='Sí') return "true";
	else return "false";
    }
});

jQuery.extend($.fn.fmatter , {
    habilitadoFormatter : function(cellvalue, options, rowdata) {
	if(cellvalue==true) return '<i class="icon-ok icon-success">Sí</i>';
	else return '<i class="icon-remove icon-error">No</i>';
    }
});
jQuery.extend($.fn.fmatter.habilitadoFormatter , {
    unformat : function(cellvalue, options) {
	if(cellvalue=='Sí') return "true";
	else return "false";
    }
});

jQuery.extend($.fn.fmatter , {
    practicasFormatter : function(cellValue, options, rowdata){
	// Si pertenece a varias practicas pongo *
	return cellValue.match(",") ? "*" : cellValue;
    }
});

jQuery.extend($.fn.fmatter , {
    enlaceEjerciciosPracticaFormatter : function(cellValue, options, rowdata){
	// Genero un enlace para navegar a la edición de los ejercicios que componen la práctica
	return "<a class='btn ejerciciosPracticaBtn' href='ejerciciosPractica?id=" + rowdata[0] + "' title='Editar ejercicios de la práctica'><span class='icon-list-alt'></span>" + cellValue + "</a>";
    }
});

jQuery.extend($.fn.fmatter , {
    enlaceDescripcionEsquemaFormatter : function(cellValue, options, rowdata){
	return cellValue.length ? ("<a class='esquemaVerPdfBtn btn' href='" + cellValue + "' target='_blank'><span class='icon-zoom-in'></span> Ver</a>") : ("<a class='esquemaSubirPdfBtn btn' alt='" + rowdata[0] + "' class='subir'><span class='icon-upload'></span> Subir</a>");
    }
});

jQuery.extend($.fn.fmatter , {
    duracionPracticaFormatter : function(cellValue, options, rowdata){
	if(cellValue.length){
	    var valores = cellValue.split(";");
	    return "<div class='duracion-minutos'><span class='icon-chrono'></span> " + valores[0] + " minutos</div><div class='practice-countdown'>" + valores[1] + "</div>";
	} else {
	    return "";
	}	
    }
});

jQuery.extend($.fn.fmatter , {
    numeroEjercicioPracticaFormatter : function(cellValue, options, rowdata){
	return '<i class="icon-move" style="margin: 3px 11px 0 -25px;display:none;"></i>' + cellValue;
    }
});

jQuery.extend($.fn.fmatter , {
    enlaceAlumnoRepasoFormatter : function(cellValue, options, rowdata){
	// Genero un enlace para ver el detalle del repaso del alumno
	return "<div class='btn'><span id='details" + rowdata[0] + "' class='icon-list-alt' title='Details revision' data-toggle='modal' data-target='#alumnoRepasoModal'></span></div>";
    }
});

jQuery.extend($.fn.fmatter , {
    enlaceAlumnoEjerciciosRepasoFormatter : function(cellValue, options, rowdata){
	// Genero un enlace para ver el detalle del repaso del alumno
	return "<div class='btn'><span id='ejercicios" + rowdata[0] + "' class='icon-list-alt' title='Details exercises' data-toggle='modal' data-target='#alumnoEjerciciosRepasoModal'></span></div>";
    }
});

// Establezco el title de la celda practicas
function celdaPracticasAttr(rowId, cellValue, rawObject, cm, rdata) {
    return rdata.practica.match(",") ? ("class='tooltipcell' title='" + rdata.practica + "'") : ("");
}