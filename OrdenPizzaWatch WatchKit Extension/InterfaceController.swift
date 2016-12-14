//
//  InterfaceController.swift
//  OrdenPizzaWatch WatchKit Extension
//
//  Created by Rodrigo on 23/11/16.
//  Copyright © 2016 Rodrigo Hernandez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var contexto:InfoPizza?

    @IBOutlet var lastMessage: WKInterfaceLabel!
    
    @IBAction func bIniciarOrden() {
        let valorContexto = InfoPizza(iniciando:"InterfaceController")
        pushController(withName: "IdentificadorSizePizza", context: valorContexto)
    }
    
    override init () {
        super.init ()
        self.setTitle("Cancelar")
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Vista de Inicio, sin titulo boton Cancelar
        self.setTitle("")
        
        // obtener contexto - ini
        contexto = context as! InfoPizza!
        // obtener contexto - fin
        
        // cargar info en UIs - ini        
        if(contexto != nil){
            self.lastMessage.setText(contexto?.lastMessage)
            contexto!.printOut()
        }
        else{
            self.lastMessage.setText("")
            
        }
        // cargar info en UIs - fin
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
