<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style>
    .row .welcome,
    .row .tips {
	background: #FFFFFF;
	border: 1px solid #CCCCCC;
	margin-bottom: 20px;
    }
    
    .tips-header {
	background: #F5F5F5;
	padding: 10px 10px 8px 16px;
    }
    
    .tips-header img {
	width: 24px;
	margin: -6px 5px -4px 0;
    }
    
    .row div p,
    .row .welcome h4 {
	padding: 10px;
	margin: 0;
	
    } 
    
    .row .tips p,
    .row .welcome p {
	border-top: 1px solid #E5E5E5;
    }
    
    .row div p span {
	color: #B94A48;
	font-family: Courier;
    }
    
    .form-boxed {
	min-width: 418px;
	max-width: none;
    }
</style>

<div class="row">
    <div class="span6">
	<div class="welcome">
	    <h4><s:text name="welcome.text.1"/></h4>
	    <p><s:text name="welcome.text.2"/></p>
	</div>
	<s:if test="usuario == null || !usuario.alumno.habilitado">
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
	</s:if>	
    </div>
    <div class="span6">
	<div class="tips">
	    <div class="tips-header">
		<h4><img src="<s:url value="/img/info.png"/>" />Sabías que...</h4>
	    </div>
	    <s:iterator begin="1" end="7" var="cont">
		<div>
		    <div class="tip">
			<p><s:text name="tip.%{#cont}"/></p>
		    </div>	    
		</div>
	    </s:iterator>
	</div>	
    </div>    
</div>
