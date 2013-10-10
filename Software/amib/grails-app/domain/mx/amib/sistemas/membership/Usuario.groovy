package mx.amib.sistemas.membership

class Usuario {

	String usuario
	String contrasena
	
	static mapping = {
		table 't101_t_usuario'
		
		usuario column: 'tx_usuario'
		contrasena column: 'tx_contrasena'
		
		version false
	}

	static constraints = {
		usuario maxSize: 254
		contrasena maxSize: 32
	}
}
