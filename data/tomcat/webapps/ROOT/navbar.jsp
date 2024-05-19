<%@taglib uri="/struts-tags" prefix="s"%>

<!-- Modal confirmar salir de la aplicacion -->
<div id="confirmarSalirModal" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="confirmarSalirModalLabel" aria-hidden="true">
    <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="confirmarSalirModalLabel"><s:text name="application.exit.title"/></h4>
    </div>
    <div class="modal-body">
	<div class="texto"><s:text name="application.exit.info"/></div>
    </div>
    <div class="modal-footer">
	<button class="btn" data-dismiss="modal" aria-hidden="true"><s:text name="no"/></button>
	<a class="btn btn-primary" href='<s:url value="/logout"/>' ><s:text name="yes"/></a>
    </div>
</div>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
	<div class="container">
	    <a class="brand" href="<s:url value="/"/>"><img src="<s:url value="/img/aplicacionbd-logo.png"/>" alt="Aplicación BD"/></a>
	    <ul class="nav">
		<li><a href='<s:url value="/"/>'><s:text name="home"/></a></li>
		<%-- Si es profesor --%>
		<s:if test="usuario.profesor != null">
		    <li class="dropdown">
			<a href='<s:url value="/profesor"/>' class="dropdown-toggle" data-toggle="dropdown"><s:text name="professor"/> <b class="caret"></b></a>
			<ul class="dropdown-menu">
			    <li><a href='<s:url value="/profesor/"/>'><s:text name="panel"/></a></li>
			    <li class="divider"></li>
			    <li><a href='<s:url value="/perfil"/>'><s:text name="profile"/></a></li>
			    <li class="divider"></li>
			    <li><a href='<s:url value="/profesor/profesores"/>'><s:text name="professors"/></a></li>
			    <li><a href='<s:url value="/profesor/alumnos"/>'><s:text name="students"/></a></li>  
			    <li><a href='<s:url value="/profesor/esquemas"/>'><s:text name="schemes"/></a></li>
			    <li><a href='<s:url value="/profesor/ejercicios"/>'><s:text name="exercises"/></a></li>
			    <li><a href='<s:url value="/profesor/practicas"/>'><s:text name="practices"/></a></li>
			    <li><a href='<s:url value="/profesor/entregas"/>'><s:text name="solutions"/></a></li>
                            <li><a href='<s:url value="/profesor/repasos"/>'><s:text name="revisions"/></a></li>
			</ul>
		    </li>
		</s:if>

		<%-- Si es alumno --%>
		<s:if test="usuario.alumno != null && usuario.alumno.habilitado">
		    <li class="dropdown">
			<a href='<s:url value="/alumno"/>' class="dropdown-toggle" data-toggle="dropdown"><s:text name="student"/> <b class="caret"></b></a>
			<ul class="dropdown-menu">
			    <li><a href='<s:url value="/alumno/"/>'><s:text name="panel"/></a></li>
			    <li class="divider"></li>
			    <li><a href='<s:url value="/perfil"/>'><s:text name="profile"/></a></li>
			    <li class="divider"></li>
			    <li><a href='<s:url value="/alumno/ejercicioRepaso"/>'><s:text name="revision.do"/></a></li>
			    <li><a href='<s:url value="/alumno/practica"/>'><s:text name="practice.do"/></a></li>
			</ul>
		    </li>
		</s:if>

	    </ul>
	    <ul class="nav pull-right">
		<s:if test="usuario.profesor != null || (usuario.alumno != null && usuario.alumno.habilitado)">
		    <li class="logout"><a id="logout" href='<s:url value="/logout"/>' ><s:text name="logout"/></a></li>
		    </s:if>
		    <s:else>
		    <li class="login"><a href='<s:url value="/login"/>' ><s:text name="login"/></a></li>
		    </s:else>
	    </ul>
	</div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
	$("#logout").click(function(event){
	    event.preventDefault();
	    $("#confirmarSalirModal").modal();
	})
    });
</script>
		    