<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:actionmessage />
<s:actionerror />

<s:form action="peticionLogin" cssClass="form-boxed form-horizontal">
    <fieldset>
	<legend><s:text name="login.data"/></legend>	
	<s:textfield key="username" />
	<div class="explained-field">
	    <s:password key="password"/>
	    <span class="field-explain help-inline">
		<s:a action="recordar"><s:text name="password.forgot"/></s:a>
	    </span>
	</div>	
	<div class="form-actions">
	    <s:submit button="true"
		cssClass="btn btn-primary" 
		value="%{getText('login')}"/>	    
	</div>	
    </fieldset>
</s:form>


