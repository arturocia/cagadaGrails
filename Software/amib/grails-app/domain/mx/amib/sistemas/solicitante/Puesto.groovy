package mx.amib.sistemas.solicitante


class Puesto {

	String empresa
	Date inicio
	Date termino
	String puesto
	Solicitante solicitante

	static belongsTo = [Solicitante]

	static mapping = {
		table 't303_t_puesto'
		
		empresa column: 'tx_empresa'
		inicio column: 'fh_inicio'
		termino column: 'fh_termino'
		puesto column: 'tx_puesto'
		
		solicitante column: 'id_301_solicitante'
		
		version false
	}

	static constraints = {
		empresa maxSize: 100
		termino nullable: true
		puesto maxSize: 100
	}
}
