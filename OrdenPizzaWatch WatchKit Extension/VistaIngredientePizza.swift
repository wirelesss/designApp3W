//
//  VistaIngrediente1.swift
//  OrdenPizzaWatch
//
//  Created by Rodrigo on 27/11/16.
//  Copyright © 2016 Rodrigo Hernandez. All rights reserved.
//

import WatchKit
import Foundation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}



class VistaIngredientePizza: WKInterfaceController {
    var contexto:InfoPizza?
    var cancelSegue:Bool = false
    
    @IBAction func bSiguiente() {
        if prepararContexto(){
            pushController(withName: "IdentificadorConfirmacionEnvio", context: contexto)
        }
        else{
            var dicBotones:Dictionary<String,String> = Dictionary<String,String>()
            dicBotones[ "Cancelar" ] = "Volver"
            let arrStyleMensaje:Array<WKAlertActionStyle> = [WKAlertActionStyle.cancel]
            mostrarMensaje(arrStyleMensaje,titulo: "Error",mensaje: "Por favor\nseleccione\nalguna opción",tituloBotonInfoWarn: dicBotones )
        }
    }
    
    func auxMostrarMensaje(_ actionStyle: WKAlertActionStyle) {
        switch actionStyle {
        case .default:
            print("OK")//OK
        case .cancel:
            print("Cancelar")//Cancel
        case .destructive:
            print("Abortar")//Destructive
        }
    }
    
    func mostrarMensaje(
        _ arrTipoMensaje:Array<WKAlertActionStyle>,
        titulo:String,
        mensaje:String,
        tituloBotonInfoWarn:Dictionary<String,String>){
        
        var arrWKAlertAction:[WKAlertAction] = []
        var okAction : WKAlertAction
        var cancelAction : WKAlertAction
        var abortAction : WKAlertAction
        /* Puede ser mas de una opcion al mismo tiempo */
        for tipoMensaje in arrTipoMensaje{
            switch tipoMensaje {
                case .default://OK
                    okAction = WKAlertAction(title: tituloBotonInfoWarn["OK"]!,
                        style: WKAlertActionStyle.default) { () -> Void in
                            self.auxMostrarMensaje(WKAlertActionStyle.default)
                    }
                    arrWKAlertAction.append(okAction)
                case .cancel://Cancelar
                    cancelAction = WKAlertAction(title: tituloBotonInfoWarn["Cancelar"]!,
                        style: WKAlertActionStyle.cancel) { () -> Void in
                            self.auxMostrarMensaje(WKAlertActionStyle.cancel)
                    }
                    arrWKAlertAction.append(cancelAction)
                case .destructive://Abortar
                    abortAction = WKAlertAction(title: tituloBotonInfoWarn["Abortar"]!,
                        style: WKAlertActionStyle.destructive) { () -> Void in
                            self.auxMostrarMensaje(WKAlertActionStyle.destructive)
                    }
                    arrWKAlertAction.append(abortAction)
            }
        }
        /* Motrar multiples acciones (botones)
            presentAlertControllerWithTitle(titulo,
                message: mensaje,
                preferredStyle: WKAlertControllerStyle.Alert,
                actions: [okAction, cancelAction, abortAction])
        */
        if arrWKAlertAction.count>0 {
            presentAlert(withTitle: titulo,
                message: mensaje,
                preferredStyle: WKAlertControllerStyle.alert,
                actions: arrWKAlertAction)
        }
    }
    
    func prepararContexto()->Bool{
        let totRows:Int = self.tableView.numberOfRows
        var countIngredients:Int = 0
        for i in 0 ... totRows-1 {
            let rowController:IngredientRow  = self.tableView.rowController(at: i) as! IngredientRow
            let resultadoBool:Bool = rowController.switchValueRow
            contexto?.dicIngredients[(contexto?.arrIngredients[i])!] = resultadoBool
            if resultadoBool{
                countIngredients += 1
            }
        }
        self.contexto?.countIngredients = countIngredients
        
        if countIngredients==0 {
            return false
        }
        else{
            return true
        }
    }
    
    @IBOutlet var tableView: WKInterfaceTable!
    
    /*
    // In InterfaceController
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        // You may want to set the context's identifier in Interface Builder and check it here to make sure you're returning data at the proper times
        
        // Return data to be accessed in ResultsController
        let totRows:Int = self.tableView.numberOfRows
        var countIngredients:Int = 0
        for i in 0 ... totRows-1 {
            let rowController:IngredientRow  = self.tableView.rowControllerAtIndex(i) as! IngredientRow
            let resultadoBool:Bool = rowController.switchValueRow
            contexto?.dicIngredients[(contexto?.arrIngredients[i])!] = resultadoBool
            if resultadoBool{
                countIngredients++
            }
        }
        if countIngredients==0 {
            cancelSegue = true
            self.shouldPerformSegueWithIdentifier(segueIdentifier, sender: nil)
        }
        self.contexto?.countIngredients = countIngredients
        return self.contexto
    }

    
    override func shouldPerformSegueWithIdentifier(identifier: String,sender: AnyObject?) -> Bool {
        return true
    }
*/
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // obtener contexto - ini
        contexto = context as! InfoPizza!
        // obtener contexto - fin
        
        // cargar info en UIs - ini
        if(contexto?.countIngredients == 0){
            setupTable(true)
        }
        else{
            setupTable(false)
        }
        contexto!.printOut()
        // cargar info en UIs - fin
        
        // Configure interface objects here.
    }


    func setupTable(_ initializeData:Bool) {
        tableView.setNumberOfRows((contexto?.arrIngredients.count)!, withRowType: "IdentIngredientRow")
        for i in stride(from: 0, to: (contexto?.arrIngredients.count)!, by: 1){
            if let row = tableView.rowController(at: i) as? IngredientRow {
                row.swIngredient.setTitle((contexto?.arrIngredients[i])!)
                if initializeData{
                    row.swIngredient.setOn(false)
                }
                else{
                    row.swIngredient.setOn(
                        (contexto?.dicIngredients[
                            (contexto?.arrIngredients[i])!
                            ])!
                    )
                }
            }
        }
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
