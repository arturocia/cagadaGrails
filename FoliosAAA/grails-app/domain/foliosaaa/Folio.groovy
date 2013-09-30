package foliosaaa

class Folio {
    
	
	Institucion institucion

	Date fecha
	Integer numero
	File pdf
	Byte [] cagada
	
    static constraints = {
		fecha nullable:true 
		numero nullable:true ,maxSize:6
    }
}
