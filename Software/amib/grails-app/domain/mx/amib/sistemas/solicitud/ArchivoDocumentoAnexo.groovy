package mx.amib.sistemas.solicitud

class ArchivoDocumentoAnexo {

	byte[] archivo
	String tipo
	DocumentoAnexo documentoAnexo

	static belongsTo = [DocumentoAnexo]

	static mapping = {
		table 't403_t_archivodocanexo'
		
		archivo column: 'bl_docanexo'
		tipo column: 'tx_tipo'
		documentoAnexo column: 'id_402_docanexo'
		
		version false
	}

	static constraints = {
		tipo maxSize: 16
	}
}
