<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:actionmessage />
<s:actionerror />

<div class="alert">
    <s:text name="password.retrieve.info"/>
</div>
<s:form action="peticionRecordar" cssClass="form-boxed form-horizontal">    
    <fieldset>
	<legend><s:text name="password.retrieve"/></legend>	
	<s:textfield key="username" />
	<s:textfield key="email" />
	<div class="form-actions">
	    <s:submit button="true"
		cssClass="btn btn-primary" 
		value="%{getText('submit')}"
		data-loading-text="Enviando..."/>
	</div>
    </fieldset>
</s:form>