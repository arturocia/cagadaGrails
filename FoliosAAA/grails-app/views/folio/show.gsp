
<%@ page import="mx.com.amiba.foliosaaa.Folio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'folio.label', default: 'Folio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-folio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-folio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list folio">
			
				<g:if test="${folioInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="folio.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${folioInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${folioInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="folio.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${folioInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${folioInstance?.archivo}">
				<li class="fieldcontain">
					<span id="archivo-label" class="property-label"><g:message code="folio.archivo.label" default="Archivo" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${folioInstance?.institucion}">
				<li class="fieldcontain">
					<span id="institucion-label" class="property-label"><g:message code="folio.institucion.label" default="Institucion" /></span>
					
						<span class="property-value" aria-labelledby="institucion-label"><g:link controller="institucion" action="show" id="${folioInstance?.institucion?.id}">${folioInstance?.institucion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${folioInstance?.id}" />
					<g:link class="edit" action="edit" id="${folioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
