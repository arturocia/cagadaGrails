package foliosaaa

class Usuario {

	String nombre
	String apellidop
	String apellidom
	String user
	String password
    static constraints = {
			 
		nombre nullable:true,maxSize:50
		apellidop nullable:true,maxSize:50
		apellidom nullable:true,maxSize:50
		user nullable:true, unique:true
	    password nullable:true,minSize:8
             
			 
    }
}
