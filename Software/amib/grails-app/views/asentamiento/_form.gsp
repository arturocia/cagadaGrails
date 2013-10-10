<%@ page import="mx.amib.sistemas.sepomex.catalogo.Asentamiento" %>



<div class="fieldcontain ${hasErrors(bean: asentamientoInstance, field: 'clave', 'error')} ">
	<label for="clave">
		<g:message code="asentamiento.clave.label" default="Clave" />
		
	</label>
	<g:textField name="clave" maxlength="4" value="${asentamientoInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asentamientoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="asentamiento.nombre.label" default="Nombre" />
		
	</label>
	<g:textArea name="nombre" cols="40" rows="5" maxlength="255" value="${asentamientoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asentamientoInstance, field: 'conjuntoSepomex', 'error')} ">
	<label for="conjuntoSepomex">
		<g:message code="asentamiento.conjuntoSepomex.label" default="Conjunto Sepomex" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${asentamientoInstance?.conjuntoSepomex?}" var="c">
    <li><g:link controller="sepomex" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sepomex" action="create" params="['asentamiento.id': asentamientoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sepomex.label', default: 'Sepomex')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: asentamientoInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="asentamiento.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${mx.amib.sistemas.sepomex.catalogo.Municipio.list()}" optionKey="id" required="" value="${asentamientoInstance?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: asentamientoInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="asentamiento.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${asentamientoInstance?.vigente}" />
</div>

