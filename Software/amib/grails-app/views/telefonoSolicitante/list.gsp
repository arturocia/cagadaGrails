
<%@ page import="mx.amib.sistemas.solicitante.TelefonoSolicitante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoSolicitante.label', default: 'TelefonoSolicitante')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-telefonoSolicitante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-telefonoSolicitante" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="lada" title="${message(code: 'telefonoSolicitante.lada.label', default: 'Lada')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'telefonoSolicitante.telefono.label', default: 'Telefono')}" />
					
						<g:sortableColumn property="extension" title="${message(code: 'telefonoSolicitante.extension.label', default: 'Extension')}" />
					
						<th><g:message code="telefonoSolicitante.solicitante.label" default="Solicitante" /></th>
					
						<th><g:message code="telefonoSolicitante.tipoTelefono.label" default="Tipo Telefono" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${telefonoSolicitanteInstanceList}" status="i" var="telefonoSolicitanteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${telefonoSolicitanteInstance.id}">${fieldValue(bean: telefonoSolicitanteInstance, field: "lada")}</g:link></td>
					
						<td>${fieldValue(bean: telefonoSolicitanteInstance, field: "telefono")}</td>
					
						<td>${fieldValue(bean: telefonoSolicitanteInstance, field: "extension")}</td>
					
						<td>${fieldValue(bean: telefonoSolicitanteInstance, field: "solicitante")}</td>
					
						<td>${fieldValue(bean: telefonoSolicitanteInstance, field: "tipoTelefono")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${telefonoSolicitanteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
