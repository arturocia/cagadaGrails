<%@ page import="mx.amib.sistemas.sepomex.catalogo.Ciudad" %>



<div class="fieldcontain ${hasErrors(bean: ciudadInstance, field: 'clave', 'error')} ">
	<label for="clave">
		<g:message code="ciudad.clave.label" default="Clave" />
		
	</label>
	<g:textField name="clave" maxlength="2" value="${ciudadInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ciudadInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="ciudad.nombre.label" default="Nombre" />
		
	</label>
	<g:textArea name="nombre" cols="40" rows="5" maxlength="255" value="${ciudadInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ciudadInstance, field: 'conjuntoSepomex', 'error')} ">
	<label for="conjuntoSepomex">
		<g:message code="ciudad.conjuntoSepomex.label" default="Conjunto Sepomex" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ciudadInstance?.conjuntoSepomex?}" var="c">
    <li><g:link controller="sepomex" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sepomex" action="create" params="['ciudad.id': ciudadInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sepomex.label', default: 'Sepomex')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ciudadInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="ciudad.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${mx.amib.sistemas.sepomex.catalogo.Municipio.list()}" optionKey="id" required="" value="${ciudadInstance?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ciudadInstance, field: 'vigente', 'error')} ">
	<label for="vigente">
		<g:message code="ciudad.vigente.label" default="Vigente" />
		
	</label>
	<g:checkBox name="vigente" value="${ciudadInstance?.vigente}" />
</div>

