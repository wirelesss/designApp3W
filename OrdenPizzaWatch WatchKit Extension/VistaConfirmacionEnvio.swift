//
//  VistaConfirmacionEnvio.swift
//  OrdenPizzaWatch
//
//  Created by Rodrigo on 27/11/16.
//  Copyright © 2016 Rodrigo Hernandez. All rights reserved.
//

import WatchKit
import Foundation


class VistaConfirmacionEnvio: WKInterfaceController {
    var contexto:InfoPizza?
    
    @IBOutlet var infoPedido: WKInterfaceLabel!

    func showResult(){
        infoPedido.setText(contexto?.getOrdenOut())
    }
    
    @IBAction func bEnvioACocinar() {
        prepararCambioVentana()
        let textoIn:NSMutableString = NSMutableString(string: "..Su pizza\r\n")
        textoIn.append("en preparación")
        self.contexto?.lastMessage = textoIn as String
        WKInterfaceController.reloadRootControllers(withNames: ["IdentificadorIniciarOrdenPizza"], contexts: [contexto!])
    }
    
    func prepararCambioVentana() {
        self.setTitle("")
        if(contexto != nil){
            contexto!.reset()
        }
    }
    
    
    override init () {
        super.init ()
        self.setTitle("Cancelar")
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // obtener contexto - ini
        contexto = context as! InfoPizza!
        // obtener contexto - fin
        
        contexto!.printOut()
        
        showResult()
        
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
