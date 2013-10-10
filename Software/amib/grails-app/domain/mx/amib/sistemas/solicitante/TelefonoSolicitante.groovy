package mx.amib.sistemas.solicitante

import mx.amib.sistemas.solicitante.catalogo.TipoTelefono;

class TelefonoSolicitante {

	String lada
	String telefono
	String extension
	Solicitante solicitante
	TipoTelefono tipoTelefono

	static belongsTo = [Solicitante, TipoTelefono]

	static mapping = {
		table 't306_t_telefonosolicitante'
		
		lada column: 'nu_lada'
		telefono column: 'nu_telefono'
		extension column: 'nu_extension'
		
		solicitante column: 'id_301_solicitante'
		tipoTelefono column: 'id_307_tipotelefono'
		
		version false
	}

	static constraints = {
		lada nullable: true, maxSize: 6
		telefono maxSize: 50
		extension nullable: true, maxSize: 6
	}
}
