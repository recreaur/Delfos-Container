<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:actionmessage />
<s:actionerror />

<div class="alert">
    <p><s:text name="account.enable.info1"/></p>
    <p><s:text name="account.enable.info2"/></p>
</div>
<s:form action="peticionHabilitar" cssClass="form-boxed form-horizontal">    
    <fieldset>
	<legend><s:text name="data.personal"/></legend>		
	<s:textfield key="email" />
    </fieldset>
    <fieldset>
	<legend><s:text name="password.new"/></legend>
	<s:password key="password" label="%{getText('password.new')}" autocomplete="off"/>
	<s:password key="repeatpassword" label="%{getText('password.repeat')}" autocomplete="off"/>
    </fieldset>
    <div class="form-actions">
	<s:submit button="true"
	    cssClass="btn btn-primary" 
	    value="%{getText('submit')}"/>
    </div>
</s:form>