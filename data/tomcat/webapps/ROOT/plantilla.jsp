<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
	<title><s:text name="application.title"/> - <tiles:insertAttribute name="title" ignore="true" /></title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Last-Modified" content="0">
	<meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="icon" href='<s:url value="/favicon.ico"/>' type="image/x-icon">
	<link rel="shortcut icon" href='<s:url value="/favicon.ico"/>'>
	
	<s:if test="#devMode">
	    <link href="<s:url value="/css/bootstrap.css"/>" rel="stylesheet">
	    <link href="<s:url value="/css/jquery-ui-1.10.0.custom.css"/>" rel="stylesheet">
	    <link href="<s:url value="/css/todc-bootstrap.css"/>" rel="stylesheet">
	    <link href="<s:url value="/css/select2.css"/>" rel="stylesheet">	
	    <link href="<s:url value="/css/ui.jqgrid.css"/>" rel="stylesheet">
	    <link href="<s:url value="/css/jqGrid.overrides.css"/>" rel="stylesheet">
	    <link href="<s:url value="/css/codemirror.css"/>" rel="stylesheet">	
	    <link href="<s:url value="/css/application.css"/>" rel="stylesheet">
	</s:if>
	<s:else>
	    <link href="<s:url value="/css/aplicacionbd.min.css"/>" rel="stylesheet">
	</s:else>
	
	<s:if test="#devMode">
	    <script type="text/javascript" src='<s:url value="/js/jquery-1.9.1.min.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/jquery-ui-1.10.2.custom.min.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/jquery.form.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/bootstrap.min.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/select2.min.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/jquery.jqGrid.src.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/jquery.jqGrid.util.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/i18n/grid.locale-es.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/codemirror-compressed.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/jquery.uniform.min.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/jquery.countdown.min.js"/>'></script>
	    <script type="text/javascript" src='<s:url value="/js/ajaxupload.3.6.js"/>'></script>
	</s:if>
	<s:else>
	    <script type="text/javascript" src='<s:url value="/js/aplicacionbd.min.js"/>'></script>
	</s:else>
	
	
	<script type="text/javascript">jQuery.ajaxSettings.traditional = true;</script>
	
	<!-- Gradientes en IE9 -->
	<!--[if gte IE 9]>
	<style type="text/css">
	    .ui-state-default,
	    .ui-state-highlight {
	     filter: none !important;
	    }
	</style>
	<![endif]-->	
    </head>
    <body>	
	<div id="wrap">
	    <tiles:insertAttribute name="navbar" />

	    <div class="container">
		<tiles:insertAttribute name="tabs" ignore="true"/> 
		<tiles:insertAttribute name="body" />
	    </div>
	    <div id="push"></div>
	</div>
	<div id="footer">
	    <div class="container">
		<a href="http://www.unirioja.es" target='_blank'><img id="logoFooter" src="<s:url value='/img/ur.png'/>" alt="Unirioja logo" height="30"/></a>
		<div style="float: right; padding: 4px 0px; margin-top: -9px; margin-left: -64px;">Diego Díez <br/>TFG 2013</div>
	    </div>
	</div>
    </body>
</html>
