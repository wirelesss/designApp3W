//
//  IngredientRow.swift
//  OrdenPizzaWatch
//
//  Created by Rodrigo on 27/11/16.
//  Copyright © 2016 Rodrigo Hernandez. All rights reserved.
//

import WatchKit

class IngredientRow: NSObject {
    var switchValueRow:Bool = false
    
    @IBAction func valueChanged(_ value: Bool) {
        switchValueRow = value
        // or
        // valueSw = self.swIngredient ? true : false
        // or to do any action in same line without "if"
        // value ? label.setText("Switch is on") : label.setText("Switch is off")
    }
    
    @IBOutlet weak var swIngredient: WKInterfaceSwitch!
    
}
