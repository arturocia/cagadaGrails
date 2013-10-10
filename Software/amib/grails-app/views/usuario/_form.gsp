<%@ page import="mx.amib.sistemas.membership.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="usuario.usuario.label" default="Usuario" />
		
	</label>
	<g:textArea name="usuario" cols="40" rows="5" maxlength="254" value="${usuarioInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'contrasena', 'error')} ">
	<label for="contrasena">
		<g:message code="usuario.contrasena.label" default="Contrasena" />
		
	</label>
	<g:textField name="contrasena" maxlength="32" value="${usuarioInstance?.contrasena}"/>
</div>

