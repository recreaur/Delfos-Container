<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<form action="getRepasos" class="ui-filters">
    <table>
        <thead>
            <tr>
                <th>
                    <s:textfield key="filtroeq_id" theme="simple" />
                </th>
                <th>
                    <input id="filtro_alumno" name="filtro_alumno" type="text" />
                </th>
                <th>

                </th>
                <th>

                </th>
                <th>

                </th>
                <th>

                </th>
            </tr>
        </thead>
    </table>    
    <input type="submit" style="display: none" />
</form>

<table id="repasosTable" cellpadding="0" cellspacing="0"></table>
<div id="repasosTablePaginator"></div>

<!-- Modal Detalle Repaso -->
<div id="alumnoRepasoModal" class="modal hide repaso" tabindex="-1" role="dialog" aria-labelledby="alumnoRepasoModal" aria-hidden="true">
</div>

<!-- Modal Soluciones Repaso -->
<div id="alumnoEjerciciosRepasoModal" class="modal hide repaso" tabindex="-1" role="dialog" aria-labelledby="alumnoEjerciciosRepasoModal" aria-hidden="true">
</div>

<script type="text/javascript">
    $(document).ready(function() {

        var queryeditors;

        // Tabla	
        $("#repasosTable").initJqGridTable({
            url: 'getRepasos?' + $('form.ui-filters').formSerialize(),
            colNames: ['ID', '<s:text name="student"/>', '<s:text name="date.starting"/>', '<s:text name="date.finishing"/>', '<s:text name="details"/>', '<s:text name="solutions"/>'],
            colModel: [
                {name: 'id', index: 'id', key: true, align: 'center', width: 5, editable: false},
                {name: 'alumno', index: 'alumno', width: 20, editable: false},
                {name: 'fechainicio', index: 'fechainicio', width: 10, editable: false},
                {name: 'fechafin', index: 'fechafin', width: 10, editable: false},
                {name: 'detalles', align: 'center', width: 8, sortable: false, formatter: 'enlaceAlumnoRepasoFormatter'},
                {name: 'soluciones', align: 'center', width: 8, sortable: false, formatter: 'enlaceAlumnoEjerciciosRepasoFormatter'}
            ],
            rowList: [10, 20, 30, 50, 100],
            sortname: 'id',
            caption: '<s:text name="revisions"/>',
            gridComplete: function() {

                $('[id^="details"]').click(function() {
                    var id = $('#' + this.id).closest('tr').attr('id');
                    $.getJSON("alumnoRepasoDetails", {
                        idAlumnoRepaso: id
                    }, function(respuesta) {
                        $('#alumnoRepasoModal').html("");
                        topHtml = "<div class='modal-dialog'> \
                                <div class='modal-content'> \
                                    <div class='modal-header'> \
                                        <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>";
                        bottomHtml = "</div> \
                                <div class='modal-footer'> \
                                    <div class='form-group'> \
                                        <button class='btn btn-primary' data-dismiss='modal'><s:text name='return'/></button> \
                                    </div> \
                                </div> \
                            </div>";
                        if (respuesta === null) {
                            bodyHtml = "</div> \
                                <div class='modal-body'> \
                                    <div class='alert alert-danger' role='alert'> \
                                        <s:text name='revision.detail.alert'/> \
                                    </div>";
                        } else {
                            bodyHtml = "<h4 id='titleForm'><s:text name="revision.of"/> " + respuesta.alumnoRepasoJSON[0] + "</h4> \
                            </div> \
                            <div class='modal-body large'> \
                                <legend><s:text name='student'/></legend> \
                                <div class='form-group enlinea1'> \
                                    <label for='name' class='col-sm-2 control-label'><s:text name='student'/></label> \
                                    <div class='col-sm-10'> \
                                        <input type='text' class='form-control' name='name' value='" + respuesta.alumnoRepasoJSON[0] + "' readonly> \
                                    </div> \
                                </div> \
                                <div class='form-group enlinea2'> \
                                    <label for='username' class='col-sm-2 control-label'><s:text name='username'/></label> \
                                    <div class='col-sm-10'> \
                                        <input type='text' class='form-control' name='username' value='" + respuesta.alumnoRepasoJSON[1] + "' readonly> \
                                    </div> \
                                </div> \
                                <legend><s:text name='details'/> <s:text name='revision'/></legend> \
                                <div class='form-group'> \
                                    <label for='maxnumej' class='col-sm-2 control-label'><s:text name='exercises.max'/></label> \
                                    <div class='col-sm-10'> \
                                        <input type='text' class='form-control' name='maxnumej' value='" + respuesta.alumnoRepasoJSON[2] + "' readonly> \
                                    </div> \
                                </div> \
                                <div class='form-group enlinea1'> \
                                    <label for='minnumsesion' class='col-sm-2 control-label'><s:text name='session.min'/></label> \
                                    <div class='col-sm-10'> \
                                        <input type='text' class='form-control' name='minnumsesion' value='" + respuesta.alumnoRepasoJSON[3] + "' readonly> \
                                    </div> \
                                </div> \
                                <div class='form-group enlinea2'> \
                                    <label for='maxnumsesion' class='col-sm-2 control-label'><s:text name='session.max'/></label> \
                                    <div class='col-sm-10'> \
                                        <input type='text' class='form-control' name='maxnumsesion' value='" + respuesta.alumnoRepasoJSON[4] + "' readonly> \
                                    </div> \
                                </div> \
                                <div class='form-group clearboth'> \
                                    <label for='esquemas' class='col-sm-2 control-label'><s:text name='schemes'/></label> \
                                    <div class='col-sm-10'> \
                                        <input type='text' class='form-control' name='esquemas' value='" + respuesta.alumnoRepasoJSON[5] + "' readonly> \
                                    </div> \
                                </div> \
                                <div class='form-group'> \
                                    <label for='dificultad' class='col-sm-2 control-label'><s:text name='difficulty'/></label> \
                                    <div class='col-sm-10'> \
                                        <input type='text' class='form-control' name='dificultad' value='" + respuesta.alumnoRepasoJSON[6] + "' readonly> \
                                    </div> \
                                </div> \
                                <div class='form-group enlinea1'> \
                                    <label for='fechainicio' class='col-sm-2 control-label'><s:text name='date.starting'/></label> \
                                    <div class='col-sm-10'> \
                                        <input type='text' class='form-control' name='fechainicio' value='" + respuesta.alumnoRepasoJSON[7] + "' readonly> \
                                    </div> \
                                </div> \
                                <div class='form-group enlinea2'> \
                                    <label for='fechafin' class='col-sm-2 control-label'><s:text name='date.finishing'/></label> \
                                    <div class='col-sm-10'> \
                                        <input type='text' class='form-control' name='fechafin' value='" + respuesta.alumnoRepasoJSON[8] + "' readonly> \
                                    </div> \
                                </div>";
                        }
                        $('#alumnoRepasoModal').html(topHtml + bodyHtml + bottomHtml);
                    });
                });
                
                $('[id^="ejercicios"]').click(function() {
                    var id = $('#' + this.id).closest('tr').attr('id');
                    $.getJSON("alumnoEjerciciosRepasoDetails", {
                        idAlumnoRepaso: id
                    }, function(respuesta) {
                        $('#alumnoEjerciciosRepasoModal').html("");
                        topHtml = "<div class='modal-dialog'> \
                                <div class='modal-content'> \
                                    <div class='modal-header'> \
                                        <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>";
                        bottomHtml = "</div> \
                                <div class='modal-footer'> \
                                    <div class='form-group'> \
                                        <button class='btn btn-primary' data-dismiss='modal'><s:text name='return'/></button> \
                                    </div> \
                                </div> \
                            </div>";
                        if (respuesta === null) {
                            bodyHtml = "</div> \
                                <div class='modal-body'> \
                                    <div class='alert alert-danger' role='alert'> \
                                        <s:text name='revision.exercises.alert'/> \
                                    </div>";
                        } else {
                            var numejercicios = Object.keys(respuesta.alumnoEjerciciosRepasoJSON).length;
                            bodyHtml = "<h4 id='titleForm'><s:text name='revision.exercises'/></h4> \
                                    </div> \
                                    <div class='modal-body large'> \
                                        <div class='pagination exercises-pagination'> \
                                            <ul class='nav nav-tabs' role='tablist'>";
                            for (i=0 ; i<numejercicios ; i++) {
                                if (i === 0) {
                                    bodyHtml += "<li class='ej active";
                                    if (respuesta.alumnoEjerciciosRepasoJSON[i][3]) {
                                        bodyHtml += " correct";
                                    } else {
                                        bodyHtml += " incorrect";
                                    }
                                    bodyHtml += "'>";
                                } else {
                                    bodyHtml += "<li class='ej";
                                    if (respuesta.alumnoEjerciciosRepasoJSON[i][3]) {
                                        bodyHtml += " correct";
                                    } else {
                                        bodyHtml += " incorrect";
                                    }
                                    bodyHtml += "'>";
                                }
                                bodyHtml += "   <a href='#rep" + i + "' role='tab' data-toggle='tab'> \
                                                " + (i+1) + " \
                                                <span></span> \
                                                </a> \
                                            </li>";
                            }
                            bodyHtml += "   </ul> \
                                    </div> \
                                    <div class='tab-content'>";
                            for (i=0 ; i<numejercicios ; i++) {
                                if (i === 0) {
                                    bodyHtml += "<div class='tab-pane active' id='rep" + i + "'>";
                                } else {
                                    bodyHtml += "<div class='tab-pane' id='rep" + i + "'>";
                                }
                                bodyHtml += "<div class='form-group'> \
                                        <label for='esquema' class='control-label'><s:text name='scheme'/></label> \
                                        <input type='text' class='form-control' name='esquema' value='" + respuesta.alumnoEjerciciosRepasoJSON[i][0] + "' readonly> \
                                    </div> \
                                    <div class='form-group'> \
                                        <label for='enunciado' class='control-label'><s:text name='statement'/></label> \
                                        <textarea class='form-control enunciado' name='enunciado' readonly>" + respuesta.alumnoEjerciciosRepasoJSON[i][1] + "</textarea> \
                                    </div> \
                                    <div class='form-group'> \
                                        <label for='respuesta' class='control-label'><s:text name='answer'/></label> \
                                        <textarea id='query-ejercicio" + i + "' class='form-control respuesta' name='respuesta' readonly>" + respuesta.alumnoEjerciciosRepasoJSON[i][2] + "</textarea> \
                                    </div> \
                                    <div class='form-group enlinea1'> \
                                        <label for='intentos' class='control-label'><s:text name='attempts'/></label> \
                                        <input type='text' class='form-control' name='intentos' value='" + respuesta.alumnoEjerciciosRepasoJSON[i][4] + "' readonly> \
                                    </div> \
                                    <div class='form-group enlinea2'> \
                                        <label for='duracion' class='control-label'><s:text name='duration'/></label> \
                                        <input type='text' class='form-control' name='duracion' value='" + respuesta.alumnoEjerciciosRepasoJSON[i][5] + "' readonly> \
                                    </div> \
                                    <div class='form-group clearboth'> \
                                        <label for='fechaguardado' class='control-label'><s:text name='date.completion'/></label> \
                                        <input type='text' class='form-control' name='fechaguardado' value='" + respuesta.alumnoEjerciciosRepasoJSON[i][6] + "' readonly> \
                                    </div> \
                                </div>";
                            }
                            bodyHtml += "</div>";
                        }
                        $('#alumnoEjerciciosRepasoModal').html(topHtml + bodyHtml + bottomHtml);
                        
                        queryeditors = new Array();
                        
                        for (i=0; i<$('[id^=query-ejercicio]').length; i++) {
                            var id = $('[id^=query-ejercicio]')[i].id;
                            var queryEditor = CodeMirror.fromTextArea(document.getElementById(id), {
                                mode: "text/x-sql",
                                indentWithTabs: true,
				indentUnit: 4,
				lineNumbers: true,
				autofocus: true,
                                readOnly: true
                            });
                            queryEditor.setSize('auto', 'auto');
                            queryeditors[i] = queryEditor;
			}
                        
                    });
                });
                
            }
        }, {}, {}, {edit: false, add: false, del: false, search: false});
        
        $('#alumnoRepasoModal').on("shown.bs.modal", function() {
            //$(this).css("position", "fixed");
            $(this).css("top", "10%");
            $(this).css("left", "50%");
        });
        
        $('#alumnoEjerciciosRepasoModal').on("shown.bs.modal", function() {
            //$(this).css("position", "fixed");
            $(this).css("top", "10%");
            $(this).css("left", "50%");
            for (i=0; i<$('[id^=query-ejercicio]').length; i++) {
                queryeditors[i].refresh();
            }
        });

    });

</script>