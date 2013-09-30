<%@ page import="foliosaaa.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" maxlength="50" value="${usuarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidop', 'error')} ">
	<label for="apellidop">
		<g:message code="usuario.apellidop.label" default="Apellidop" />
		
	</label>
	<g:textField name="apellidop" maxlength="50" value="${usuarioInstance?.apellidop}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidom', 'error')} ">
	<label for="apellidom">
		<g:message code="usuario.apellidom.label" default="Apellidom" />
		
	</label>
	<g:textField name="apellidom" maxlength="50" value="${usuarioInstance?.apellidom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="usuario.user.label" default="User" />
		
	</label>
	<g:textField name="user" value="${usuarioInstance?.user}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="usuario.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${usuarioInstance?.password}"/>
</div>

