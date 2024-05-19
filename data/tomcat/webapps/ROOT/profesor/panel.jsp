<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="opciones row">
    
         <div class="span2">
            <a class="btn" href='<s:url value="/profesor/profesores"/>' title='<s:text name="manages.ma"/> <s:text name="professors"/>'>
                <div class="image-container">
                    <img alt="" src='<s:url value="/img/profesores.png"/>'>
                </div>	    
                <span><s:text name="professors"/></span>
            </a>
        </div>
        <div class="span2">
            <a class="btn" href='<s:url value="/profesor/alumnos"/>' title='<s:text name="manages.ma"/> <s:text name="students"/>'>
                <div class="image-container">
                    <img alt="" src='<s:url value="/img/alumnos.png"/>'>
                </div>
                <span><s:text name="students"/></span>
            </a>
        </div>
        <div class="span2">
            <a class="btn" href='<s:url value="/profesor/esquemas"/>' title='<s:text name="manages.ma"/> <s:text name="schemes"/>'>
                <div class="image-container">
                    <img alt="" src='<s:url value="/img/esquemas.png"/>'>
                </div>
                <span><s:text name="schemes"/></span>
            </a>
        </div>
        <div class="span2">
            <a class="btn" href='<s:url value="/profesor/ejercicios"/>' title='<s:text name="manages.ma"/> <s:text name="exercises"/>'>
                <div class="image-container">
                    <img alt="" src='<s:url value="/img/ejercicios.png"/>'>
                </div>
                <span><s:text name="exercises"/></span>
            </a>
        </div>
        <div class="span2">
            <a class="btn" href='<s:url value="/profesor/practicas"/>' title='<s:text name="manages.fe"/> <s:text name="practices"/>'>
                <div class="image-container">
                    <img alt="" src='<s:url value="/img/practicas.png"/>'>
                </div>
                <span><s:text name="practices"/></span>
            </a>
        </div>
        <div class="span2">
            <a class="btn" href='<s:url value="/profesor/entregas"/>' title='<s:text name="manages.fe"/> <s:text name="solutions"/>'>
                <div class="image-container">
                    <img alt="" src='<s:url value="/img/entregas.png"/>'>
                </div>
                <span><s:text name="solutions"/></span>
            </a>
        </div>
        <div class="span2">
            <a class="btn" href='<s:url value="/profesor/repasos"/>' title='<s:text name="manages.fe"/> <s:text name="reviews"/>'>
                <div class="image-container">
                    <img alt="" src='<s:url value="/img/repasos.png"/>'>
                </div>
                <span><s:text name="revisions"/></span>
            </a>
        </div>
    </div>

    <div class="row top-buffer">
        <div class="span8">
            <div id="usuario-conectados" class="caja">
                <div class="header">
                    <span class="icon-user"></span> <s:text name="users.connected"/>
                </div>
                <div class="content">
                    <table id="tablaUsuariosConectados" cellpadding="0" cellspacing="0"></table>		
                </div>
            </div>
        </div>
        <div class="accordion span4 cambioCurso" id="accordion2">
            <div class="accordion-group">
                <div class="accordion-heading">
                    <a class="accordion-toggle btn" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                        <i class="icon-calendar"></i> <s:text name="course.change"/>
                    </a>
                </div>
                <div id="collapseOne" class="accordion-body collapse">
                    <div class="accordion-inner">
                        <s:text name="course.change.info"/>
                        <div class="form-actions">
                            <!-- Button to trigger modal -->
                            <a href="#cambioCursoModal" role="button" class="btn btn-danger btn-block" data-toggle="modal"><s:text name="course.change"/></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row top-buffer-compact"></div>

    <!-- Modal confirmar cambio de curso -->
    <div id="cambioCursoModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="cambioCursoModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 id="cambioCursoModalLabel"><s:text name="course.change"/></h4>
        </div>
        <div class="modal-body">
            <div id="mensaje"></div>
            <p class="texto"><s:text name="course.change.confirm"/></p>
        </div>
        <div class="modal-footer">
            <button id="cerrarBtn" class="btn" data-dismiss="modal" aria-hidden="true"><s:text name="cancel"/></button>
            <button id="cambioCursoBtn" class="btn btn-primary"><s:text name="course.change"/></button>
        </div>
    </div>

    <!-- Modal reactivar práctica para alumno -->
    <div id="reactivarSesionModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="reactivarSesionModal" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3><s:text name="sesion.restart"/></h3>
            <h4></h4>
        </div>
        <div class="modal-body">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th></th>
                        <th><s:text name="sesion.restart.sid"/></th>
                        <th><s:text name="sesion.restart.pid"/></th>
                        <th><s:text name="sesion.restart.pname"/></th>
                        <th><s:text name="sesion.restart.delivery"/></th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
                <tfoot>
                <div id="sinPractica" class="alert alert-info hide">
                    <p><s:text name="sesion.nopractica"/></p>
                </div>
                <div id="sinSeleccion" class="alert alert-error hide">
                    <p><s:text name="sesion.noselect"/></p>
                </div>
                </tfoot>
            </table>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal"><s:text name="cancel"/></button>
            <button id="restartBtn" class="btn btn-danger"><s:text name="sesion.restart.btn"/></button>
        </div>
    </div>

    <!-- Modal reinciar success -->
    <div id="reactivarSuccessModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="reactivarSuccessModal" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4><s:text name="sesion.restart.success.title"/></h4>
        </div>
        <div class="modal-body success">
            <p><s:text name="sesion.restart.success"/></p>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal"><s:text name="close"/></button>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {

            // Tabla de usuarios conectados    
            $("#tablaUsuariosConectados").jqGrid({
                url: "usuariosConectadosRows",
                datatype: "json",
                altRows: true,
                hoverrows: false,
                autowidth: true,
                forceFit: true,
                height: 'auto',
                deepempty: true,
                loadonce: true,
                colNames: ['Usuario', 'Profesor', 'Alumno', 'Repaso', 'Práctica', 'Últ. actividad', 'Reactivar'],
                colModel: [
                    {name: 'cuasi', key: true, align: "center", sortable: true},
                    {name: 'profesor', width: 40, align: "center", sortable: false, search: false, formatter: 'habilitadoFormatter'},
                    {name: 'alumno', width: 40, align: "center", sortable: false, search: false, formatter: 'habilitadoFormatter'},
                    {name: 'repaso', width: 40, align: "center", sortable: false, search: false, formatter: 'habilitadoFormatter'},
                    {name: 'practica', width: 40, align: "center", sortable: false, search: false, formatter: 'habilitadoFormatter'},
                    {name: 'lastactivity', width: 80, align: "center", search: false, sortable: true},
                    {name: 'activarsession', width: 40, align: "center", search: false, sortable: false, formatter: activarSesionFormatter}
                ],
                multiselect: false,
                beforeSelectRow: function() {
                    return false;
                },
                gridComplete: function() {
                    $('span[id^="Activate"]').click(function() {
                        //Recuperamos la cuasi
                        var cuasi = $("#" + this.id).closest('tr').find('td').eq(0).html();
                        //Realizamos la peticion ajax
                        $.getJSON(
                                'practicasFinalizadasJSON',
                                {
                                    cuasi: cuasi
                                },
                        function(data) {
                            $('#reactivarSesionModal').find('h4').html(data['alumno']);
                            $('#reactivarSesionModal').find('tbody').html("");
                            if (!$('#sinPractica').hasClass('hide')) {
                                $('#sinPractica').addClass('hide');
                            }
                            if ($('#restartBtn').hasClass('hide')) {
                                $('#restartBtn').removeClass('hide');
                            }
                            if (!$('#sinSeleccion').hasClass('hide')) {
                                $('#sinSeleccion').addClass('hide');
                            }
                            if (!$.isEmptyObject(data['practicasFinalizadas'])) {
                                $('#reactivarSesionModal').find('tbody').before("<input type='hidden' name='cuasi' value='" + cuasi + "'>");
                                $.each(data['practicasFinalizadas'], function(index, element) {
                                    var tableContent = "<tr> \
                                                    <td><input type='radio' name='numSesion' value='" + index + "'></td> \\n\
                                                    <td>" + index + "</td> \
                                                    <td>" + element[0] + "</td> \
                                                    <td>" + element[1] + "</td> \
                                                    <td>" + element[2] + "</td> \
                                                  </tr>";
                                    $('#reactivarSesionModal').find('tbody').append(tableContent);
                                });
                            } else {
                                $('#sinPractica').removeClass('hide');
                                $('#sinPractica').fadeIn('slow');
                                $('#restartBtn').addClass('hide');
                            }
                        });
                    });
                    $('#restartBtn').click(function() {
                        if (!$('#sinSeleccion').hasClass('hide')) {
                            $('#sinSeleccion').addClass('hide');
                        }
                        if (typeof $('input[name="numSesion"]:checked').val() !== "undefined") {
                            //Recuperamos los datos a enviar
                            var cuasi = $('#reactivarSesionModal').find('input[name="cuasi"]').val();
                            var alumno = $('#reactivarSesionModal').find('h4').html();
                            var idSesion = $('input[name="numSesion"]:checked').val();
                            var idPractica = $('input[name="numSesion"]:checked').closest('tr').find('td').eq(2).html();
                            $.getJSON(
                                    'reiniciarSesionJSON',
                                    {
                                        cuasi: cuasi,
                                        idPractica: idPractica
                                    },
                            function() {
                                var texto = $('#reactivarSuccessModal').find('.modal-body p').html();
                                texto = texto.replace('{0}', alumno);
                                texto = texto.replace('{1}', idSesion);
                                $('#reactivarSuccessModal').find('.modal-body p').html(texto);
                                $('#reactivarSesionModal').modal('hide');
                                $('#reactivarSuccessModal').modal('show');
                            }
                            );
                        } else {
                            $('#sinSeleccion').removeClass('hide');
                            $('#sinSeleccion').fadeIn('slow');
                        }
                    });
                }
            }).jqGrid('filterToolbar', {
                searchOnEnter: false,
                defaultSearch: "cn"
            });

            // Ancho fluido de tabla jqgrid de usuarios conectados
            $(window).bind('resize', function() {
                if (grid = $('.ui-jqgrid-btable:visible')) {
                    grid.each(function(index) {
                        gridId = $(this).attr('id');
                        gridParentWidth = $('#gbox_' + gridId).parent().width();
                        $('#gbox_' + gridId).find("table.ui-jqgrid-htable").width(gridParentWidth);
                        $('#' + gridId).setGridWidth(gridParentWidth);
                    });
                }
            }).trigger('resize');

            $('#cambioCursoModal').on('hidden', function() {
                $('#mensaje').empty().removeAttr("class");
                $('#cambioCursoModal .texto').show();
                $("#cambioCursoBtn").show();
                $("#cerrarBtn").text("<s:text name="cancel"/>");

            });

            $("#cambioCursoBtn").click(function() {
                $.post('<s:url value="/profesor/cambiarCurso"/>', function(data) {
                    if (data.error != null) {
                        $('#mensaje').removeAttr("class")
                                .text(data.error)
                                .addClass("alert alert-error");
                    }
                    else {
                        $('#mensaje').removeAttr("class")
                                .text(data.info)
                                .addClass("alert alert-success");

                        $('#cambioCursoModal .texto').hide();
                        $("#cambioCursoBtn").hide();
                        $("#cerrarBtn").text("<s:text name="close"/>");
                    }
                }, "json");
            });
        });

        function activarSesionFormatter(cellvalue, options, rowObject) {
            //Hay que mirar si es profesor o alumno
            if (rowObject[2] == true) {
                return '<span id="' + cellvalue + '" class="icon-refresh" data-toggle="modal" data-target="#reactivarSesionModal"></span>';
            } else {
                return '&nbsp;';
            }
        }
    </script>