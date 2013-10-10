
<%@ page import="mx.amib.sistemas.solicitante.Solicitante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitante.label', default: 'Solicitante')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-solicitante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-solicitante" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list solicitante">
			
				<g:if test="${solicitanteInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="solicitante.apellidoPaterno.label" default="Apellido Paterno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${solicitanteInstance}" field="apellidoPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="solicitante.apellidoMaterno.label" default="Apellido Materno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${solicitanteInstance}" field="apellidoMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.nombrePila}">
				<li class="fieldcontain">
					<span id="nombrePila-label" class="property-label"><g:message code="solicitante.nombrePila.label" default="Nombre Pila" /></span>
					
						<span class="property-value" aria-labelledby="nombrePila-label"><g:fieldValue bean="${solicitanteInstance}" field="nombrePila"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.rfc}">
				<li class="fieldcontain">
					<span id="rfc-label" class="property-label"><g:message code="solicitante.rfc.label" default="Rfc" /></span>
					
						<span class="property-value" aria-labelledby="rfc-label"><g:fieldValue bean="${solicitanteInstance}" field="rfc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.curp}">
				<li class="fieldcontain">
					<span id="curp-label" class="property-label"><g:message code="solicitante.curp.label" default="Curp" /></span>
					
						<span class="property-value" aria-labelledby="curp-label"><g:fieldValue bean="${solicitanteInstance}" field="curp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.correoElectronicoPersonal}">
				<li class="fieldcontain">
					<span id="correoElectronicoPersonal-label" class="property-label"><g:message code="solicitante.correoElectronicoPersonal.label" default="Correo Electronico Personal" /></span>
					
						<span class="property-value" aria-labelledby="correoElectronicoPersonal-label"><g:fieldValue bean="${solicitanteInstance}" field="correoElectronicoPersonal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.lugarNacimiento}">
				<li class="fieldcontain">
					<span id="lugarNacimiento-label" class="property-label"><g:message code="solicitante.lugarNacimiento.label" default="Lugar Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="lugarNacimiento-label"><g:fieldValue bean="${solicitanteInstance}" field="lugarNacimiento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.genero}">
				<li class="fieldcontain">
					<span id="genero-label" class="property-label"><g:message code="solicitante.genero.label" default="Genero" /></span>
					
						<span class="property-value" aria-labelledby="genero-label"><g:fieldValue bean="${solicitanteInstance}" field="genero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.estadoCivil}">
				<li class="fieldcontain">
					<span id="estadoCivil-label" class="property-label"><g:message code="solicitante.estadoCivil.label" default="Estado Civil" /></span>
					
						<span class="property-value" aria-labelledby="estadoCivil-label"><g:fieldValue bean="${solicitanteInstance}" field="estadoCivil"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="solicitante.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:fieldValue bean="${solicitanteInstance}" field="calle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.numeroExterior}">
				<li class="fieldcontain">
					<span id="numeroExterior-label" class="property-label"><g:message code="solicitante.numeroExterior.label" default="Numero Exterior" /></span>
					
						<span class="property-value" aria-labelledby="numeroExterior-label"><g:fieldValue bean="${solicitanteInstance}" field="numeroExterior"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.esMexicanoNaturalizado}">
				<li class="fieldcontain">
					<span id="esMexicanoNaturalizado-label" class="property-label"><g:message code="solicitante.esMexicanoNaturalizado.label" default="Es Mexicano Naturalizado" /></span>
					
						<span class="property-value" aria-labelledby="esMexicanoNaturalizado-label"><g:formatBoolean boolean="${solicitanteInstance?.esMexicanoNaturalizado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.archivoFoto}">
				<li class="fieldcontain">
					<span id="archivoFoto-label" class="property-label"><g:message code="solicitante.archivoFoto.label" default="Archivo Foto" /></span>
					
						<span class="property-value" aria-labelledby="archivoFoto-label"><g:link controller="archivoFoto" action="show" id="${solicitanteInstance?.archivoFoto?.id}">${solicitanteInstance?.archivoFoto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.fechaNacimiento}">
				<li class="fieldcontain">
					<span id="fechaNacimiento-label" class="property-label"><g:message code="solicitante.fechaNacimiento.label" default="Fecha Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaNacimiento-label"><g:formatDate date="${solicitanteInstance?.fechaNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.nacionalidad}">
				<li class="fieldcontain">
					<span id="nacionalidad-label" class="property-label"><g:message code="solicitante.nacionalidad.label" default="Nacionalidad" /></span>
					
						<span class="property-value" aria-labelledby="nacionalidad-label"><g:link controller="nacionalidad" action="show" id="${solicitanteInstance?.nacionalidad?.id}">${solicitanteInstance?.nacionalidad?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.nivelEstudios}">
				<li class="fieldcontain">
					<span id="nivelEstudios-label" class="property-label"><g:message code="solicitante.nivelEstudios.label" default="Nivel Estudios" /></span>
					
						<span class="property-value" aria-labelledby="nivelEstudios-label"><g:link controller="nivelEstudios" action="show" id="${solicitanteInstance?.nivelEstudios?.id}">${solicitanteInstance?.nivelEstudios?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.puestos}">
				<li class="fieldcontain">
					<span id="puestos-label" class="property-label"><g:message code="solicitante.puestos.label" default="Puestos" /></span>
					
						<g:each in="${solicitanteInstance.puestos}" var="p">
						<span class="property-value" aria-labelledby="puestos-label"><g:link controller="puesto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.sepomex}">
				<li class="fieldcontain">
					<span id="sepomex-label" class="property-label"><g:message code="solicitante.sepomex.label" default="Sepomex" /></span>
					
						<span class="property-value" aria-labelledby="sepomex-label"><g:link controller="sepomex" action="show" id="${solicitanteInstance?.sepomex?.id}">${solicitanteInstance?.sepomex?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.solicitudes}">
				<li class="fieldcontain">
					<span id="solicitudes-label" class="property-label"><g:message code="solicitante.solicitudes.label" default="Solicitudes" /></span>
					
						<g:each in="${solicitanteInstance.solicitudes}" var="s">
						<span class="property-value" aria-labelledby="solicitudes-label"><g:link controller="solicitud" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="solicitante.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${solicitanteInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefonoSolicitante" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${solicitanteInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="solicitante.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${solicitanteInstance?.usuario?.id}">${solicitanteInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${solicitanteInstance?.id}" />
					<g:link class="edit" action="edit" id="${solicitanteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
