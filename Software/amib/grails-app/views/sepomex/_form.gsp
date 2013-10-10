<%@ page import="mx.amib.sistemas.sepomex.catalogo.Sepomex" %>



<div class="fieldcontain ${hasErrors(bean: sepomexInstance, field: 'codigoPostal', 'error')} ">
	<label for="codigoPostal">
		<g:message code="sepomex.codigoPostal.label" default="Codigo Postal" />
		
	</label>
	<g:textField name="codigoPostal" maxlength="5" value="${sepomexInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sepomexInstance, field: 'asentamiento', 'error')} required">
	<label for="asentamiento">
		<g:message code="sepomex.asentamiento.label" default="Asentamiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="asentamiento" name="asentamiento.id" from="${mx.amib.sistemas.sepomex.catalogo.Asentamiento.list()}" optionKey="id" required="" value="${sepomexInstance?.asentamiento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sepomexInstance, field: 'ciudad', 'error')} required">
	<label for="ciudad">
		<g:message code="sepomex.ciudad.label" default="Ciudad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ciudad" name="ciudad.id" from="${mx.amib.sistemas.sepomex.catalogo.Ciudad.list()}" optionKey="id" required="" value="${sepomexInstance?.ciudad?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sepomexInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="sepomex.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${sepomexInstance?.vigente}" />
</div>

