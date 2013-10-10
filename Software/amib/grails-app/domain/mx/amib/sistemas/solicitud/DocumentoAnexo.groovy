package mx.amib.sistemas.solicitud

import mx.amib.sistemas.solicitud.catalogo.TipoDocumento;

class DocumentoAnexo {

	TipoDocumento tipoDocumento
	Solicitud solicitud

	static hasMany = [archivoDocumentoAnexo: ArchivoDocumentoAnexo]
	static belongsTo = [Solicitud, TipoDocumento]

	static mapping = {
		table 't402_t_docanexo'
		
		tipoDocumento column: 'id_405_tipodoc'
		solicitud column: 'id_401_solicitud'
		
		version false
	}
}
