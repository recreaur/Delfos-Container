<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:property value=""/>
<s:if test="true">
    <h3 class="text-error">Excepción causante del error</h3>
    <pre class="exception"><s:property value="exceptionStack"/></pre>
</s:if>
<s:else>
    <div style="margin: 0 auto;text-align: center;">
	<h2 class="text-error">Ha ocurrido un error inesperado</h2>
	<img src="<s:url value="/img/notfound.png"/>" style="margin:10px 0 30px;"/>
	<div><a href="<s:url value="/"/>" class="btn btn-primary"><span class="icon-chevron-left icon-white"></span> Ir a la página de inicio</a></div>
    </div>
</s:else>