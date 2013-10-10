
<%@ page import="mx.amib.sistemas.solicitante.Solicitante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitante.label', default: 'Solicitante')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-solicitante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-solicitante" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'solicitante.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'solicitante.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="nombrePila" title="${message(code: 'solicitante.nombrePila.label', default: 'Nombre Pila')}" />
					
						<g:sortableColumn property="rfc" title="${message(code: 'solicitante.rfc.label', default: 'Rfc')}" />
					
						<g:sortableColumn property="curp" title="${message(code: 'solicitante.curp.label', default: 'Curp')}" />
					
						<g:sortableColumn property="correoElectronicoPersonal" title="${message(code: 'solicitante.correoElectronicoPersonal.label', default: 'Correo Electronico Personal')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${solicitanteInstanceList}" status="i" var="solicitanteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${solicitanteInstance.id}">${fieldValue(bean: solicitanteInstance, field: "apellidoPaterno")}</g:link></td>
					
						<td>${fieldValue(bean: solicitanteInstance, field: "apellidoMaterno")}</td>
					
						<td>${fieldValue(bean: solicitanteInstance, field: "nombrePila")}</td>
					
						<td>${fieldValue(bean: solicitanteInstance, field: "rfc")}</td>
					
						<td>${fieldValue(bean: solicitanteInstance, field: "curp")}</td>
					
						<td>${fieldValue(bean: solicitanteInstance, field: "correoElectronicoPersonal")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${solicitanteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
