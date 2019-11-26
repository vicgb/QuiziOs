//
//  CeldaPersonalizada.swift
//  p4_Quiz903
//
//  Created by G903 on 21/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import UIKit

/* Vamos a personalizar la celda para que no sea algo predefinido */
class CeldaPersonalizada: UITableViewCell {

    @IBOutlet weak var imagenCelda: UIImageView!
    
    @IBOutlet weak var preguntaCelda: UILabel!
    
    @IBOutlet weak var autorCelda: UILabel! 
    
    @IBOutlet weak var favouriteCelda: UILabel!
}
