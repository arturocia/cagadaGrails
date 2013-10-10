
<%@ page import="mx.amib.sistemas.solicitante.Puesto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'puesto.label', default: 'Puesto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-puesto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-puesto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="empresa" title="${message(code: 'puesto.empresa.label', default: 'Empresa')}" />
					
						<g:sortableColumn property="termino" title="${message(code: 'puesto.termino.label', default: 'Termino')}" />
					
						<g:sortableColumn property="puesto" title="${message(code: 'puesto.puesto.label', default: 'Puesto')}" />
					
						<g:sortableColumn property="inicio" title="${message(code: 'puesto.inicio.label', default: 'Inicio')}" />
					
						<th><g:message code="puesto.solicitante.label" default="Solicitante" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${puestoInstanceList}" status="i" var="puestoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${puestoInstance.id}">${fieldValue(bean: puestoInstance, field: "empresa")}</g:link></td>
					
						<td><g:formatDate date="${puestoInstance.termino}" /></td>
					
						<td>${fieldValue(bean: puestoInstance, field: "puesto")}</td>
					
						<td><g:formatDate date="${puestoInstance.inicio}" /></td>
					
						<td>${fieldValue(bean: puestoInstance, field: "solicitante")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${puestoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
