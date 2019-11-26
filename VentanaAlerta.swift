//
//  VentanaAlerta.swift
//  p4_Quiz903
//
//  Created by Santiago Pavón on 22/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//  Código extraido del ejemplo de clase de Alert.swift

import UIKit

extension UIViewController {
    
    func alert(msg: String, completionHandler: (() -> ())? = nil) {
        
        print("Resultado: \(msg)")
        
        let avc = UIAlertController(title: "Resultado", message: msg, preferredStyle: .alert)
        
        avc.addAction(UIAlertAction(title: "Seguir jugando",
                                    style: .default) { (action) in
                                        completionHandler?()
        })
        
        present(avc, animated: true)
    }
}



