
<%@ page import="mx.amib.sistemas.sepomex.catalogo.Asentamiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asentamiento.label', default: 'Asentamiento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-asentamiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asentamiento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clave" title="${message(code: 'asentamiento.clave.label', default: 'Clave')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'asentamiento.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="asentamiento.municipio.label" default="Municipio" /></th>
					
						<g:sortableColumn property="vigente" title="${message(code: 'asentamiento.vigente.label', default: 'Vigente')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${asentamientoInstanceList}" status="i" var="asentamientoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${asentamientoInstance.id}">${fieldValue(bean: asentamientoInstance, field: "clave")}</g:link></td>
					
						<td>${fieldValue(bean: asentamientoInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: asentamientoInstance, field: "municipio")}</td>
					
						<td><g:formatBoolean boolean="${asentamientoInstance.vigente}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${asentamientoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>