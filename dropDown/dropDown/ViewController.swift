//
//  ViewController.swift
//  dropDown
//
//  Created by Braulio Alejandro Navarrete Horta on 24/05/23.
//

import Cocoa

class ViewController: NSViewController, NSComboBoxDelegate, NSComboBoxDataSource {
    
    @IBOutlet weak var cmbLista: NSComboBox!
    
    @IBOutlet weak var cmbImagenes: NSComboBox!
    
    @IBOutlet weak var cmbColor: NSComboBox!
    
    let items = ["MACOSX", "SERVIDORES", "REDES", "MAUI", "RELIGION"]
    let colores = ["red", "blue", "green"]
    let imagenes = ["17004", "challenger", "finder"]
    
    var materia = ""
    var imagen = ""
    var color = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //vista1.isHidden = true
        
        cmbLista.delegate = self
        cmbImagenes.delegate = self
        cmbColor.delegate = self
        
        cmbLista.dataSource = self
        cmbImagenes.dataSource = self
        cmbColor.dataSource = self
        
        
        //Codigo de VergOzi ForOzi
        /*
        for x in 0...items.count-1
        {
            cmbLista.addItem(withObjectValue: items[x])
        }
         */
        
        //Mismo que un for pero en una linea
        items.map { cmbLista.addItem(withObjectValue: $0) }
        imagenes.map { cmbImagenes.addItem(withObjectValue: $0) }
        colores.map { cmbColor.addItem(withObjectValue: $0) }
        
        
        
        
        
    }
    
    
    @IBAction func valores(_ sender: Any) {
        materia = cmbLista.stringValue
        imagen = cmbImagenes.stringValue
        color = cmbColor.stringValue
        performSegue(withIdentifier: "cambiar", sender: self)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "cambiar" {
            let destination = segue.destinationController as! ReciboVC
            destination.materia = materia
            destination.imagen = imagen
            destination.color = color
        }
    }
    
    
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return items.count
        return imagen.count
        return colores.count
    }
     
    
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        if let comboBox = notification.object as? NSComboBox{
            let selectedIndex = comboBox.indexOfSelectedItem
            let selectedValue = items[selectedIndex]
            print("Valor Seleccionado: \(selectedValue)")
            
        }
    }
    
    func clearAndAddItems() {
        cmbLista.usesDataSource = false
        cmbLista.isEditable = false
        cmbLista.removeAllItems()
    }
    
    
    
     
    
     

}

