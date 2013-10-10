package mx.amib.sistemas.solicitante


class ArchivoFoto {

	byte[] archivo
	String tipo
	Solicitante solicitante

	static belongsTo = [Solicitante]

	static mapping = {
		table 't302_t_archivofoto'
		
		archivo column: 'bl_archivofoto'
		tipo column: 'tx_tipo'
		
		solicitante column: 'id_301_solicitante'
		
		version false
	}

	static constraints = {
		tipo maxSize: 16
	}
}
