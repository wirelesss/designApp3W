//
//  InfoPizza.swift
//  OrdenPizzaWatch
//
//  Created by Rodrigo on 23/11/16.
//  Copyright © 2016 Rodrigo Hernandez. All rights reserved.
//

import WatchKit

// Clase contenedora de la información de 
// preparación de una Pizza a la Orden o a la medida
class InfoPizza: NSObject {
    var lastMessage:String = ""
    
    // Tamaño Pizza
    var intSizePizza:Int=0
    var arrSizePizza:[String] = [
        "Chica",
        "Mediana",
        "Grande"]
    
    // Tipo Masa
    var intTypeMass:Int=0
    var arrTypeMass:[String] = [
        "Delgada",
        "Crujiente",
        "Gruesa"]
    
    // Tipo Queso
    var intTypeCheese:Int=0
    var arrTypeCheese:[String] = [
        "Mozzarella",
        "Cheddar",
        "Parmesano",
        "Sin Queso"]
    
    var dicIngredients:Dictionary<String,Bool> = Dictionary()
    var countIngredients:Int = 0
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
    
    // Tipo de Salsa
    var dicTypeSauce:Dictionary<String,Bool> = Dictionary()
    var countTypeSauce:Int = 0
    var arrTypeSauce:[String] = [
        "Queso",
        "Tomate",
        "Inglesa",
        "Mostaza"
        ]
        
    init(iniciando:String){
        print("init... \(iniciando)")
        for i:Int in 0 ..< arrIngredients.count {
            dicIngredients[ arrIngredients[i] ] = false
        }
        for i:Int in 0 ..< arrTypeSauce.count {
            dicTypeSauce[ arrTypeSauce[i] ] = false
        }
    }
    
    func reset(){
        print("reset...")
        
        intSizePizza=0
        intTypeMass=0
        intTypeCheese=0
        countIngredients=0
        countTypeSauce=0
        for i:Int in 0 ..< arrIngredients.count {
            dicIngredients[ arrIngredients[i] ] = false
        }
        for i:Int in 0 ..< arrTypeSauce.count {
            dicTypeSauce[ arrTypeSauce[i] ] = false
        }
        
    }
    
    func printOut(){
        // cargar info en UIs - ini
        NSLog("Tamaño Pizza: \(intSizePizza)")
        NSLog("Tipo Masa: \(intTypeMass)")
        NSLog("Tipo Queso: \(intTypeCheese)")
        for (key, value) in dicIngredients {
            NSLog("dicIngredients: \(key) -> \(value)")
        }
        NSLog("total ingredientes seleccionados: \(countIngredients)")
        for (key, value) in dicTypeSauce {
            NSLog("dicTypeSauce: \(key) -> \(value)")
        }
        NSLog("total salsas seleccionadas: \(countTypeSauce)")
        // cargar info en UIs - fin
        // cargar info en UIs - ini
        /* 
        Codigo en Controller:
        -------------------------
        NSLog("Tamaño Pizza: \(contexto?.intSizePizza)")
        NSLog("Tipo Masa: \(contexto?.intTypeMass)")
        NSLog("Tipo Queso: \(contexto?.intTypeCheese)")
        for (key, value) in (contexto?.dicIngredients)! {
            NSLog("dicIngredients: \(key) -> \(value)")
        }
        for (key, value) in (contexto?.dicTypeSauce)! {
            NSLog("dicTypeSauce: \(key) -> \(value)")
        }
        */
        // cargar info en UIs - fin
        
    }
    
    func getOrdenOut()->String{
        var strDescripcion:String? = ""
        var strIngredientes:String? = ""
        strDescripcion = "Tamaño:\n -\(arrSizePizza[intSizePizza])\n" +
            "Masa:\n -\(arrTypeMass[intTypeMass])\n" +
            "Queso:\n -\(arrTypeCheese[intTypeCheese])\n" +
        "Ingredientes:\n"
        
        // Ingredientes
        var count:Int = 0
        for (key, value) in dicIngredients {
            if value {
                count += 1
                if count < countIngredients{
                    strIngredientes = strIngredientes! + " -\(key),\n"
                }
                else{
                    strIngredientes = strIngredientes! + " -\(key)"
                }
            }
        }
        strDescripcion = strDescripcion! + strIngredientes!
        return strDescripcion!
    }

}
