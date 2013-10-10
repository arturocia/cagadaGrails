<%@ page import="mx.amib.sistemas.solicitante.Puesto" %>



<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'empresa', 'error')} ">
	<label for="empresa">
		<g:message code="puesto.empresa.label" default="Empresa" />
		
	</label>
	<g:textField name="empresa" maxlength="100" value="${puestoInstance?.empresa}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'termino', 'error')} ">
	<label for="termino">
		<g:message code="puesto.termino.label" default="Termino" />
		
	</label>
	<g:datePicker name="termino" precision="day"  value="${puestoInstance?.termino}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'puesto', 'error')} ">
	<label for="puesto">
		<g:message code="puesto.puesto.label" default="Puesto" />
		
	</label>
	<g:textField name="puesto" maxlength="100" value="${puestoInstance?.puesto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'inicio', 'error')} required">
	<label for="inicio">
		<g:message code="puesto.inicio.label" default="Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicio" precision="day"  value="${puestoInstance?.inicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'solicitante', 'error')} required">
	<label for="solicitante">
		<g:message code="puesto.solicitante.label" default="Solicitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="solicitante" name="solicitante.id" from="${mx.amib.sistemas.solicitante.Solicitante.list()}" optionKey="id" required="" value="${puestoInstance?.solicitante?.id}" class="many-to-one"/>
</div>

