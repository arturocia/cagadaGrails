
<%@ page import="mx.amib.sistemas.sepomex.catalogo.Municipio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'municipio.label', default: 'Municipio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-municipio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-municipio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list municipio">
			
				<g:if test="${municipioInstance?.clave}">
				<li class="fieldcontain">
					<span id="clave-label" class="property-label"><g:message code="municipio.clave.label" default="Clave" /></span>
					
						<span class="property-value" aria-labelledby="clave-label"><g:fieldValue bean="${municipioInstance}" field="clave"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municipioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="municipio.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${municipioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municipioInstance?.asentamientos}">
				<li class="fieldcontain">
					<span id="asentamientos-label" class="property-label"><g:message code="municipio.asentamientos.label" default="Asentamientos" /></span>
					
						<g:each in="${municipioInstance.asentamientos}" var="a">
						<span class="property-value" aria-labelledby="asentamientos-label"><g:link controller="asentamiento" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${municipioInstance?.ciudades}">
				<li class="fieldcontain">
					<span id="ciudades-label" class="property-label"><g:message code="municipio.ciudades.label" default="Ciudades" /></span>
					
						<g:each in="${municipioInstance.ciudades}" var="c">
						<span class="property-value" aria-labelledby="ciudades-label"><g:link controller="ciudad" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${municipioInstance?.entidadFederativa}">
				<li class="fieldcontain">
					<span id="entidadFederativa-label" class="property-label"><g:message code="municipio.entidadFederativa.label" default="Entidad Federativa" /></span>
					
						<span class="property-value" aria-labelledby="entidadFederativa-label"><g:link controller="entidadFederativa" action="show" id="${municipioInstance?.entidadFederativa?.id}">${municipioInstance?.entidadFederativa?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${municipioInstance?.vigente}">
				<li class="fieldcontain">
					<span id="vigente-label" class="property-label"><g:message code="municipio.vigente.label" default="Vigente" /></span>
					
						<span class="property-value" aria-labelledby="vigente-label"><g:formatBoolean boolean="${municipioInstance?.vigente}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${municipioInstance?.id}" />
					<g:link class="edit" action="edit" id="${municipioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
