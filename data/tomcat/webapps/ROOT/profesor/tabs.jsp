<%@taglib uri="/struts-tags" prefix="s"%>

<div class="gestion-tabs">
    <ul class="nav nav-tabs nav-tabs-google">
        <s:url var="url" />
        <li><a href='<s:url value="/profesor/"/>'><s:text name="panel"/></a></li>
        <li class="<s:if test="#url.endsWith('profesores')">active</s:if>"><a href='<s:url value="/profesor/profesores"/>'><s:text name="professors"/></a></li>
        <li class="<s:if test="#url.endsWith('alumnos')">active</s:if>"><a href='<s:url value="/profesor/alumnos"/>'><s:text name="students"/></a></li>  
        <li class="<s:if test="#url.endsWith('esquemas')">active</s:if>"><a href='<s:url value="/profesor/esquemas"/>'><s:text name="schemes"/></a></li>
        <li class="<s:if test="#url.endsWith('ejercicios')">active</s:if>"><a href='<s:url value="/profesor/ejercicios"/>'><s:text name="exercises"/></a></li>
        <li class="<s:if test="#url.endsWith('practicas') || #url.endsWith('ejerciciosPractica')">active</s:if>"><a href='<s:url value="/profesor/practicas"/>'><s:text name="practices"/></a></li>
        <li class="<s:if test="#url.endsWith('entregas')">active</s:if>"><a href='<s:url value="/profesor/entregas"/>'><s:text name="solutions"/></a></li>
        <li class="<s:if test="#url.endsWith('repasos')">active</s:if>"><a href='<s:url value="/profesor/repasos"/>'><s:text name="revisions"/></a></li>
    </ul>
</div>