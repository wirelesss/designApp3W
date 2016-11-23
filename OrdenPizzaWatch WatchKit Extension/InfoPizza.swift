//
//  InfoPizza.swift
//  OrdenPizzaWatch
//
//  Created by Rodrigo on 23/11/16.
//  Copyright © 2016 Rodrigo Hernandez. All rights reserved.
//

import WatchKit

class InfoPizza: NSObject {
    var intSizePizza:Int=0
    var intTypeMass:Int=0
    var intTypeCheese:Int=0
    var dicIngredients:NSDictionary=NSDictionary()
    var arrIngredients:[String] = [
                    "jamón",
                    "pepperoni",
                    "pavo",
                    "salchicha",
                    "aceituna",
                    "cebolla",
                    "pimiento",
                    "piña",
                    "anchoa"]
    
    override init(){
        for var i:Int=0; i<arrIngredients.count; i++ {
            dicIngredients.setValue(i, forKey: arrIngredients[i])
        }
    }
    

}
