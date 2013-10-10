<%@ page import="mx.amib.sistemas.solicitud.catalogo.ModalidadCapacitacion" %>



<div class="fieldcontain ${hasErrors(bean: modalidadCapacitacionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="modalidadCapacitacion.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${modalidadCapacitacionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: modalidadCapacitacionInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="modalidadCapacitacion.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${modalidadCapacitacionInstance?.vigente}" />
</div>

