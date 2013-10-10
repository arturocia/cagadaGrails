
<%@ page import="mx.amib.sistemas.solicitante.Puesto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'puesto.label', default: 'Puesto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-puesto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-puesto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list puesto">
			
				<g:if test="${puestoInstance?.empresa}">
				<li class="fieldcontain">
					<span id="empresa-label" class="property-label"><g:message code="puesto.empresa.label" default="Empresa" /></span>
					
						<span class="property-value" aria-labelledby="empresa-label"><g:fieldValue bean="${puestoInstance}" field="empresa"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoInstance?.termino}">
				<li class="fieldcontain">
					<span id="termino-label" class="property-label"><g:message code="puesto.termino.label" default="Termino" /></span>
					
						<span class="property-value" aria-labelledby="termino-label"><g:formatDate date="${puestoInstance?.termino}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoInstance?.puesto}">
				<li class="fieldcontain">
					<span id="puesto-label" class="property-label"><g:message code="puesto.puesto.label" default="Puesto" /></span>
					
						<span class="property-value" aria-labelledby="puesto-label"><g:fieldValue bean="${puestoInstance}" field="puesto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoInstance?.inicio}">
				<li class="fieldcontain">
					<span id="inicio-label" class="property-label"><g:message code="puesto.inicio.label" default="Inicio" /></span>
					
						<span class="property-value" aria-labelledby="inicio-label"><g:formatDate date="${puestoInstance?.inicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${puestoInstance?.solicitante}">
				<li class="fieldcontain">
					<span id="solicitante-label" class="property-label"><g:message code="puesto.solicitante.label" default="Solicitante" /></span>
					
						<span class="property-value" aria-labelledby="solicitante-label"><g:link controller="solicitante" action="show" id="${puestoInstance?.solicitante?.id}">${puestoInstance?.solicitante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${puestoInstance?.id}" />
					<g:link class="edit" action="edit" id="${puestoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
