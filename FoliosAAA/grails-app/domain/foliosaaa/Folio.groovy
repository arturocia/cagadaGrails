package foliosaaa

class Folio {
    
	SubFolio subFolio
	static hasMany = [unstituciones:Institucion]
	Date fecha
	Integer numero
	Byte[] pdf
	
    static constraints = {
		fecha nullable:true 
		numero nullable:true ,maxSize:6
    }
}
