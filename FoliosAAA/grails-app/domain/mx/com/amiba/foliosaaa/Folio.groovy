package mx.com.amiba.foliosaaa

class Folio {
    
	
	Institucion institucion

	Date fecha
	Integer numero
	Byte [] cagada
	
    static constraints = {
		fecha nullable:true 
		numero nullable:true ,maxSize:6
    }
}
