
<%@ page import="mx.amib.sistemas.solicitud.Solicitud" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solicitud.label', default: 'Solicitud')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-solicitud" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-solicitud" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list solicitud">
			
				<g:if test="${solicitudInstance?.folioAcreditacionEtica}">
				<li class="fieldcontain">
					<span id="folioAcreditacionEtica-label" class="property-label"><g:message code="solicitud.folioAcreditacionEtica.label" default="Folio Acreditacion Etica" /></span>
					
						<span class="property-value" aria-labelledby="folioAcreditacionEtica-label"><g:fieldValue bean="${solicitudInstance}" field="folioAcreditacionEtica"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.matriculaAmib}">
				<li class="fieldcontain">
					<span id="matriculaAmib-label" class="property-label"><g:message code="solicitud.matriculaAmib.label" default="Matricula Amib" /></span>
					
						<span class="property-value" aria-labelledby="matriculaAmib-label"><g:fieldValue bean="${solicitudInstance}" field="matriculaAmib"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.folioAutorizacion}">
				<li class="fieldcontain">
					<span id="folioAutorizacion-label" class="property-label"><g:message code="solicitud.folioAutorizacion.label" default="Folio Autorizacion" /></span>
					
						<span class="property-value" aria-labelledby="folioAutorizacion-label"><g:fieldValue bean="${solicitudInstance}" field="folioAutorizacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.valorModalidadActualizacionCertificacion}">
				<li class="fieldcontain">
					<span id="valorModalidadActualizacionCertificacion-label" class="property-label"><g:message code="solicitud.valorModalidadActualizacionCertificacion.label" default="Valor Modalidad Actualizacion Certificacion" /></span>
					
						<span class="property-value" aria-labelledby="valorModalidadActualizacionCertificacion-label"><g:fieldValue bean="${solicitudInstance}" field="valorModalidadActualizacionCertificacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.otroInstitutoCapacitador}">
				<li class="fieldcontain">
					<span id="otroInstitutoCapacitador-label" class="property-label"><g:message code="solicitud.otroInstitutoCapacitador.label" default="Otro Instituto Capacitador" /></span>
					
						<span class="property-value" aria-labelledby="otroInstitutoCapacitador-label"><g:fieldValue bean="${solicitudInstance}" field="otroInstitutoCapacitador"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.datoIntermediarioInstitucion}">
				<li class="fieldcontain">
					<span id="datoIntermediarioInstitucion-label" class="property-label"><g:message code="solicitud.datoIntermediarioInstitucion.label" default="Dato Intermediario Institucion" /></span>
					
						<span class="property-value" aria-labelledby="datoIntermediarioInstitucion-label"><g:fieldValue bean="${solicitudInstance}" field="datoIntermediarioInstitucion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.datoIntermediarioPuesto}">
				<li class="fieldcontain">
					<span id="datoIntermediarioPuesto-label" class="property-label"><g:message code="solicitud.datoIntermediarioPuesto.label" default="Dato Intermediario Puesto" /></span>
					
						<span class="property-value" aria-labelledby="datoIntermediarioPuesto-label"><g:fieldValue bean="${solicitudInstance}" field="datoIntermediarioPuesto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.datoIntermediarioFechaInicioLabores}">
				<li class="fieldcontain">
					<span id="datoIntermediarioFechaInicioLabores-label" class="property-label"><g:message code="solicitud.datoIntermediarioFechaInicioLabores.label" default="Dato Intermediario Fecha Inicio Labores" /></span>
					
						<span class="property-value" aria-labelledby="datoIntermediarioFechaInicioLabores-label"><g:formatDate date="${solicitudInstance?.datoIntermediarioFechaInicioLabores}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.datoIntermediarioFechaConsultaReporteCE}">
				<li class="fieldcontain">
					<span id="datoIntermediarioFechaConsultaReporteCE-label" class="property-label"><g:message code="solicitud.datoIntermediarioFechaConsultaReporteCE.label" default="Dato Intermediario Fecha Consulta Reporte CE" /></span>
					
						<span class="property-value" aria-labelledby="datoIntermediarioFechaConsultaReporteCE-label"><g:formatDate date="${solicitudInstance?.datoIntermediarioFechaConsultaReporteCE}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.datoFactuacionRazonSocial}">
				<li class="fieldcontain">
					<span id="datoFactuacionRazonSocial-label" class="property-label"><g:message code="solicitud.datoFactuacionRazonSocial.label" default="Dato Factuacion Razon Social" /></span>
					
						<span class="property-value" aria-labelledby="datoFactuacionRazonSocial-label"><g:fieldValue bean="${solicitudInstance}" field="datoFactuacionRazonSocial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.datoFacturacionCorreoEFactura}">
				<li class="fieldcontain">
					<span id="datoFacturacionCorreoEFactura-label" class="property-label"><g:message code="solicitud.datoFacturacionCorreoEFactura.label" default="Dato Facturacion Correo EF actura" /></span>
					
						<span class="property-value" aria-labelledby="datoFacturacionCorreoEFactura-label"><g:fieldValue bean="${solicitudInstance}" field="datoFacturacionCorreoEFactura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.documentosAnexos}">
				<li class="fieldcontain">
					<span id="documentosAnexos-label" class="property-label"><g:message code="solicitud.documentosAnexos.label" default="Documentos Anexos" /></span>
					
						<g:each in="${solicitudInstance.documentosAnexos}" var="d">
						<span class="property-value" aria-labelledby="documentosAnexos-label"><g:link controller="documentoAnexo" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.fechaSolicitud}">
				<li class="fieldcontain">
					<span id="fechaSolicitud-label" class="property-label"><g:message code="solicitud.fechaSolicitud.label" default="Fecha Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="fechaSolicitud-label"><g:formatDate date="${solicitudInstance?.fechaSolicitud}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.figura}">
				<li class="fieldcontain">
					<span id="figura-label" class="property-label"><g:message code="solicitud.figura.label" default="Figura" /></span>
					
						<span class="property-value" aria-labelledby="figura-label"><g:link controller="figura" action="show" id="${solicitudInstance?.figura?.id}">${solicitudInstance?.figura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.formaPago}">
				<li class="fieldcontain">
					<span id="formaPago-label" class="property-label"><g:message code="solicitud.formaPago.label" default="Forma Pago" /></span>
					
						<span class="property-value" aria-labelledby="formaPago-label"><g:link controller="formaPago" action="show" id="${solicitudInstance?.formaPago?.id}">${solicitudInstance?.formaPago?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.horarioExamen}">
				<li class="fieldcontain">
					<span id="horarioExamen-label" class="property-label"><g:message code="solicitud.horarioExamen.label" default="Horario Examen" /></span>
					
						<span class="property-value" aria-labelledby="horarioExamen-label"><g:link controller="horarioExamen" action="show" id="${solicitudInstance?.horarioExamen?.id}">${solicitudInstance?.horarioExamen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.institutoCapacitador}">
				<li class="fieldcontain">
					<span id="institutoCapacitador-label" class="property-label"><g:message code="solicitud.institutoCapacitador.label" default="Instituto Capacitador" /></span>
					
						<span class="property-value" aria-labelledby="institutoCapacitador-label"><g:link controller="institutoCapacitador" action="show" id="${solicitudInstance?.institutoCapacitador?.id}">${solicitudInstance?.institutoCapacitador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.modalidadActCertificacion}">
				<li class="fieldcontain">
					<span id="modalidadActCertificacion-label" class="property-label"><g:message code="solicitud.modalidadActCertificacion.label" default="Modalidad Act Certificacion" /></span>
					
						<span class="property-value" aria-labelledby="modalidadActCertificacion-label"><g:link controller="modalidadCertificacion" action="show" id="${solicitudInstance?.modalidadActCertificacion?.id}">${solicitudInstance?.modalidadActCertificacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.modalidadCapacitacion}">
				<li class="fieldcontain">
					<span id="modalidadCapacitacion-label" class="property-label"><g:message code="solicitud.modalidadCapacitacion.label" default="Modalidad Capacitacion" /></span>
					
						<span class="property-value" aria-labelledby="modalidadCapacitacion-label"><g:link controller="modalidadCapacitacion" action="show" id="${solicitudInstance?.modalidadCapacitacion?.id}">${solicitudInstance?.modalidadCapacitacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.solicitante}">
				<li class="fieldcontain">
					<span id="solicitante-label" class="property-label"><g:message code="solicitud.solicitante.label" default="Solicitante" /></span>
					
						<span class="property-value" aria-labelledby="solicitante-label"><g:link controller="solicitante" action="show" id="${solicitudInstance?.solicitante?.id}">${solicitudInstance?.solicitante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.statusSolicitud}">
				<li class="fieldcontain">
					<span id="statusSolicitud-label" class="property-label"><g:message code="solicitud.statusSolicitud.label" default="Status Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="statusSolicitud-label"><g:link controller="statusSolicitud" action="show" id="${solicitudInstance?.statusSolicitud?.id}">${solicitudInstance?.statusSolicitud?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.tipoExamen}">
				<li class="fieldcontain">
					<span id="tipoExamen-label" class="property-label"><g:message code="solicitud.tipoExamen.label" default="Tipo Examen" /></span>
					
						<span class="property-value" aria-labelledby="tipoExamen-label"><g:link controller="tipoExamen" action="show" id="${solicitudInstance?.tipoExamen?.id}">${solicitudInstance?.tipoExamen?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solicitudInstance?.tipoServicio}">
				<li class="fieldcontain">
					<span id="tipoServicio-label" class="property-label"><g:message code="solicitud.tipoServicio.label" default="Tipo Servicio" /></span>
					
						<span class="property-value" aria-labelledby="tipoServicio-label"><g:link controller="tipoServicio" action="show" id="${solicitudInstance?.tipoServicio?.id}">${solicitudInstance?.tipoServicio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${solicitudInstance?.id}" />
					<g:link class="edit" action="edit" id="${solicitudInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
