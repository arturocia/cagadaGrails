package mx.amib.sistemas.solicitud

import mx.amib.sistemas.solicitud.catalogo.TipoDocumento;

class DocumentoAnexo {

	TipoDocumento t405CTipodoc
	Solicitud t401TSolicitud

	static hasMany = [t403TArchivodocanexos: ArchivoDocumentoAnexo]
	static belongsTo = [Solicitud, TipoDocumento]

	static mapping = {
		version false
	}
}
