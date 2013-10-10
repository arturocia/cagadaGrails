<%@ page import="mx.amib.sistemas.solicitud.Solicitud" %>



<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'folioAcreditacionEtica', 'error')} ">
	<label for="folioAcreditacionEtica">
		<g:message code="solicitud.folioAcreditacionEtica.label" default="Folio Acreditacion Etica" />
		
	</label>
	<g:field name="folioAcreditacionEtica" type="number" value="${solicitudInstance.folioAcreditacionEtica}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'matriculaAmib', 'error')} ">
	<label for="matriculaAmib">
		<g:message code="solicitud.matriculaAmib.label" default="Matricula Amib" />
		
	</label>
	<g:field name="matriculaAmib" type="number" value="${solicitudInstance.matriculaAmib}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'folioAutorizacion', 'error')} ">
	<label for="folioAutorizacion">
		<g:message code="solicitud.folioAutorizacion.label" default="Folio Autorizacion" />
		
	</label>
	<g:field name="folioAutorizacion" type="number" value="${solicitudInstance.folioAutorizacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'valorModalidadActualizacionCertificacion', 'error')} ">
	<label for="valorModalidadActualizacionCertificacion">
		<g:message code="solicitud.valorModalidadActualizacionCertificacion.label" default="Valor Modalidad Actualizacion Certificacion" />
		
	</label>
	<g:textField name="valorModalidadActualizacionCertificacion" maxlength="20" value="${solicitudInstance?.valorModalidadActualizacionCertificacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'otroInstitutoCapacitador', 'error')} ">
	<label for="otroInstitutoCapacitador">
		<g:message code="solicitud.otroInstitutoCapacitador.label" default="Otro Instituto Capacitador" />
		
	</label>
	<g:textField name="otroInstitutoCapacitador" maxlength="200" value="${solicitudInstance?.otroInstitutoCapacitador}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'datoIntermediarioInstitucion', 'error')} ">
	<label for="datoIntermediarioInstitucion">
		<g:message code="solicitud.datoIntermediarioInstitucion.label" default="Dato Intermediario Institucion" />
		
	</label>
	<g:textField name="datoIntermediarioInstitucion" maxlength="200" value="${solicitudInstance?.datoIntermediarioInstitucion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'datoIntermediarioPuesto', 'error')} ">
	<label for="datoIntermediarioPuesto">
		<g:message code="solicitud.datoIntermediarioPuesto.label" default="Dato Intermediario Puesto" />
		
	</label>
	<g:textField name="datoIntermediarioPuesto" maxlength="100" value="${solicitudInstance?.datoIntermediarioPuesto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'datoIntermediarioFechaInicioLabores', 'error')} ">
	<label for="datoIntermediarioFechaInicioLabores">
		<g:message code="solicitud.datoIntermediarioFechaInicioLabores.label" default="Dato Intermediario Fecha Inicio Labores" />
		
	</label>
	<g:datePicker name="datoIntermediarioFechaInicioLabores" precision="day"  value="${solicitudInstance?.datoIntermediarioFechaInicioLabores}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'datoIntermediarioFechaConsultaReporteCE', 'error')} ">
	<label for="datoIntermediarioFechaConsultaReporteCE">
		<g:message code="solicitud.datoIntermediarioFechaConsultaReporteCE.label" default="Dato Intermediario Fecha Consulta Reporte CE" />
		
	</label>
	<g:datePicker name="datoIntermediarioFechaConsultaReporteCE" precision="day"  value="${solicitudInstance?.datoIntermediarioFechaConsultaReporteCE}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'datoFactuacionRazonSocial', 'error')} ">
	<label for="datoFactuacionRazonSocial">
		<g:message code="solicitud.datoFactuacionRazonSocial.label" default="Dato Factuacion Razon Social" />
		
	</label>
	<g:textArea name="datoFactuacionRazonSocial" cols="40" rows="5" maxlength="254" value="${solicitudInstance?.datoFactuacionRazonSocial}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'datoFacturacionCorreoEFactura', 'error')} ">
	<label for="datoFacturacionCorreoEFactura">
		<g:message code="solicitud.datoFacturacionCorreoEFactura.label" default="Dato Facturacion Correo EF actura" />
		
	</label>
	<g:textArea name="datoFacturacionCorreoEFactura" cols="40" rows="5" maxlength="254" value="${solicitudInstance?.datoFacturacionCorreoEFactura}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'documentosAnexos', 'error')} ">
	<label for="documentosAnexos">
		<g:message code="solicitud.documentosAnexos.label" default="Documentos Anexos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${solicitudInstance?.documentosAnexos?}" var="d">
    <li><g:link controller="documentoAnexo" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="documentoAnexo" action="create" params="['solicitud.id': solicitudInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documentoAnexo.label', default: 'DocumentoAnexo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'fechaSolicitud', 'error')} required">
	<label for="fechaSolicitud">
		<g:message code="solicitud.fechaSolicitud.label" default="Fecha Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaSolicitud" precision="day"  value="${solicitudInstance?.fechaSolicitud}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'figura', 'error')} required">
	<label for="figura">
		<g:message code="solicitud.figura.label" default="Figura" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="figura" name="figura.id" from="${mx.amib.sistemas.solicitud.catalogo.Figura.list()}" optionKey="id" required="" value="${solicitudInstance?.figura?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'formaPago', 'error')} required">
	<label for="formaPago">
		<g:message code="solicitud.formaPago.label" default="Forma Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="formaPago" name="formaPago.id" from="${mx.amib.sistemas.solicitud.catalogo.FormaPago.list()}" optionKey="id" required="" value="${solicitudInstance?.formaPago?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'horarioExamen', 'error')} required">
	<label for="horarioExamen">
		<g:message code="solicitud.horarioExamen.label" default="Horario Examen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="horarioExamen" name="horarioExamen.id" from="${mx.amib.sistemas.solicitud.catalogo.HorarioExamen.list()}" optionKey="id" required="" value="${solicitudInstance?.horarioExamen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'institutoCapacitador', 'error')} required">
	<label for="institutoCapacitador">
		<g:message code="solicitud.institutoCapacitador.label" default="Instituto Capacitador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="institutoCapacitador" name="institutoCapacitador.id" from="${mx.amib.sistemas.solicitud.catalogo.InstitutoCapacitador.list()}" optionKey="id" required="" value="${solicitudInstance?.institutoCapacitador?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'modalidadActCertificacion', 'error')} required">
	<label for="modalidadActCertificacion">
		<g:message code="solicitud.modalidadActCertificacion.label" default="Modalidad Act Certificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modalidadActCertificacion" name="modalidadActCertificacion.id" from="${mx.amib.sistemas.solicitud.catalogo.ModalidadCertificacion.list()}" optionKey="id" required="" value="${solicitudInstance?.modalidadActCertificacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'modalidadCapacitacion', 'error')} required">
	<label for="modalidadCapacitacion">
		<g:message code="solicitud.modalidadCapacitacion.label" default="Modalidad Capacitacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modalidadCapacitacion" name="modalidadCapacitacion.id" from="${mx.amib.sistemas.solicitud.catalogo.ModalidadCapacitacion.list()}" optionKey="id" required="" value="${solicitudInstance?.modalidadCapacitacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'solicitante', 'error')} required">
	<label for="solicitante">
		<g:message code="solicitud.solicitante.label" default="Solicitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="solicitante" name="solicitante.id" from="${mx.amib.sistemas.solicitante.Solicitante.list()}" optionKey="id" required="" value="${solicitudInstance?.solicitante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'statusSolicitud', 'error')} required">
	<label for="statusSolicitud">
		<g:message code="solicitud.statusSolicitud.label" default="Status Solicitud" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="statusSolicitud" name="statusSolicitud.id" from="${mx.amib.sistemas.solicitud.catalogo.StatusSolicitud.list()}" optionKey="id" required="" value="${solicitudInstance?.statusSolicitud?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'tipoExamen', 'error')} required">
	<label for="tipoExamen">
		<g:message code="solicitud.tipoExamen.label" default="Tipo Examen" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoExamen" name="tipoExamen.id" from="${mx.amib.sistemas.solicitud.catalogo.TipoExamen.list()}" optionKey="id" required="" value="${solicitudInstance?.tipoExamen?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solicitudInstance, field: 'tipoServicio', 'error')} required">
	<label for="tipoServicio">
		<g:message code="solicitud.tipoServicio.label" default="Tipo Servicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoServicio" name="tipoServicio.id" from="${mx.amib.sistemas.solicitud.catalogo.TipoServicio.list()}" optionKey="id" required="" value="${solicitudInstance?.tipoServicio?.id}" class="many-to-one"/>
</div>

