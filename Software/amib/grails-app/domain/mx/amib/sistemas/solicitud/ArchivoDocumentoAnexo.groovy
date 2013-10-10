package mx.amib.sistemas.solicitud

class ArchivoDocumentoAnexo {

	byte[] blDocanexo
	String txTipo
	DocumentoAnexo t402TDocanexo

	static belongsTo = [DocumentoAnexo]

	static mapping = {
		version false
	}

	static constraints = {
		txTipo maxSize: 16
	}
}
