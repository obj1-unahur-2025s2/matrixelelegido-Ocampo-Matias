object neo {
    var energia=100
    method esElElegido() =true
    method saltar() {
        energia=energia/2
    } 
    method vitalidad() = energia/10 
  
}

object morfeo {
    var cansado=false
    var vitalidad=8
    method esElElegido() =false
    method vitalidad() =vitalidad
    method estaCansado() =cansado 
    method saltar() {
        vitalidad-=1
        cansado= not cansado
    }  
}
object trinity {
    method vitalidad() =0
    method esElElegido() =false 
    method saltar() {

    } 
}

object nave {
    const pasajeros = #{neo,morfeo,trinity}

    method cantidadDePasajeros() =pasajeros.size() 

    method pasajeroConMayorVitalidad() = pasajeros.max({ p => p.vitalidad()})

    method pasajeroConMenorVitalidad() = pasajeros.min({ p => p.vitalidad()})

    method estaEquilibrado() = self.pasajeroConMenorVitalidad().vitalidad()*2 >= self.pasajeroConMayorVitalidad().vitalidad()

    method estaEstaElElegido() = pasajeros.any({p => p.esElElegido()})
    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    } 
    method pasajeroQueNoSonElegidos() = pasajeros.filter({p=> not p.esElElegido()})
    method acelerar() {
        self.pasajeroQueNoSonElegidos().forEach({p=> p.saltar()})
      
    } 
  
}