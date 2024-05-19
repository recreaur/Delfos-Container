<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<ul class="breadcrumb">
  <li><a href="login">Panel</a> <span class="divider">/</span></li>
  <li class="active">Perfil</li>
</ul>

<s:actionmessage />
<s:actionerror />

<s:form action="actualizarPerfil" cssClass="form-boxed form-perfil form-horizontal">    
    <div class="perfil-group pull-left">
	<legend><s:text name="data.personal"/></legend>
	<s:textfield key="cuasi" value="%{usuario.cuasi}" disabled="true" />
	<s:if test="usuario.alumno != null">
	    <s:textfield key="dni" value="%{usuario.alumno.dni}" disabled="true" />
	    <s:textfield key="name" value="%{usuario.alumno.nombre}" disabled="true" />
	    <s:textfield key="surname" value="%{usuario.alumno.apellidos}" disabled="true" />
	</s:if>
    </div>    
    <div class="perfil-group pull-right">
	<legend><s:text name="password.current"/></legend>
	<s:password key="password" label="%{getText('password.current')}" autocomplete="off" requiredLabel="true"/>
    </div>
    <div class="perfil-group pull-right">
	<legend><s:text name="password.new"/></legend>
	<s:password key="newpassword" label="%{getText('password.new')}" autocomplete="off"/>
	<s:password key="repeatpassword" label="%{getText('password.repeat')}" autocomplete="off"/>
    </div>    
    <div class="perfil-group pull-left">
	<legend><s:text name="data.contact"/></legend>
	<s:textfield key="email" requiredLabel="true"/>
    </div>
    <div class="form-actions">
	<s:submit button="true"
	    cssClass="btn btn-primary" 
	    value="%{getText('update')}"/>
    </div>
</s:form>