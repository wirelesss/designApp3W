//
//  VistaSizePizza.swift
//  OrdenPizzaWatch
//
//  Created by Rodrigo on 23/11/16.
//  Copyright © 2016 Rodrigo Hernandez. All rights reserved.
//

import WatchKit
import Foundation


class VistaSizePizza: WKInterfaceController{
    var contexto:InfoPizza?
    
    // In InterfaceController
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        // You may want to set the context's identifier in Interface Builder and check it here to make sure you're returning data at the proper times
        
        // Return data to be accessed in ResultsController
        return self.contexto
    }
    
    @IBOutlet var pickerView: WKInterfacePicker!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // obtener contexto - ini
        contexto = context as! InfoPizza!
        // obtener contexto - fin
        
        // cargar info en UIs - ini
        var pickerItems: [WKPickerItem] = []
        if(contexto != nil){
            print("tot arrSizePizza=\(contexto!.arrSizePizza.count)")
            for i:Int in 0 ..< contexto!.arrSizePizza.count {
                let item = WKPickerItem()
                item.title = contexto!.arrSizePizza[i]
                pickerItems.append(item)
                
            }
            self.pickerView.setItems(pickerItems)
        }
        contexto!.printOut()
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
    
    @IBAction func pickerSelectedItemChanged(_ value: Int) {
        NSLog("List Picker: \(contexto?.arrSizePizza[value]) selected")
        contexto?.intSizePizza=value
    }


}
