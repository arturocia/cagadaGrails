
<%@ page import="mx.amib.sistemas.sepomex.catalogo.EntidadFederativa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entidadFederativa.label', default: 'EntidadFederativa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entidadFederativa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-entidadFederativa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clave" title="${message(code: 'entidadFederativa.clave.label', default: 'Clave')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'entidadFederativa.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="vigente" title="${message(code: 'entidadFederativa.vigente.label', default: 'Vigente')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${entidadFederativaInstanceList}" status="i" var="entidadFederativaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${entidadFederativaInstance.id}">${fieldValue(bean: entidadFederativaInstance, field: "clave")}</g:link></td>
					
						<td>${fieldValue(bean: entidadFederativaInstance, field: "nombre")}</td>
					
						<td><g:formatBoolean boolean="${entidadFederativaInstance.vigente}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${entidadFederativaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
