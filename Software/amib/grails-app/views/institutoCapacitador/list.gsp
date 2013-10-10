
<%@ page import="mx.amib.sistemas.solicitud.catalogo.InstitutoCapacitador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institutoCapacitador.label', default: 'InstitutoCapacitador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-institutoCapacitador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-institutoCapacitador" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'institutoCapacitador.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="vigente" title="${message(code: 'institutoCapacitador.vigente.label', default: 'Vigente')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${institutoCapacitadorInstanceList}" status="i" var="institutoCapacitadorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${institutoCapacitadorInstance.id}">${fieldValue(bean: institutoCapacitadorInstance, field: "nombre")}</g:link></td>
					
						<td><g:formatBoolean boolean="${institutoCapacitadorInstance.vigente}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${institutoCapacitadorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
