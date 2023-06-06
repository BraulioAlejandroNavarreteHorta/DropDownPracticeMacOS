//
//  ReciboVC.swift
//  dropDown
//
//  Created by Braulio Alejandro Navarrete Horta on 25/05/23.
//

import Cocoa

class ReciboVC: NSViewController {
    var materia:String?
    var imagen:String?
    var color:String?
    
    
    @IBOutlet weak var lblTitulo: NSTextField!
    
    @IBOutlet weak var imgImagen: NSImageView!
    
    @IBOutlet var fondo: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fondo.wantsLayer = true
        
        lblTitulo.stringValue = materia!
        setearColor()
        imgImagen.image = NSImage(named: imagen!)
        
    }
    
    func setearColor(){
        switch color!{
        case "red":
            fondo.layer?.backgroundColor = NSColor.red.cgColor
            break
        case "blue":
            fondo.layer?.backgroundColor = NSColor.blue.cgColor
            break;
        case "green":
            fondo.layer?.backgroundColor = NSColor.green.cgColor
            break;
        default :
            break
        }
    }
    
}
