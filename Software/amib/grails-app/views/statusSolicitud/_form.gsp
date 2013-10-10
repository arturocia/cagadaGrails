<%@ page import="mx.amib.sistemas.solicitud.catalogo.StatusSolicitud" %>



<div class="fieldcontain ${hasErrors(bean: statusSolicitudInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="statusSolicitud.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${statusSolicitudInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusSolicitudInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="statusSolicitud.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${statusSolicitudInstance?.vigente}" />
</div>

