//
//  ImagenControl.swift
//  p4_Quiz903
//
//  Created by G903 on 19/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//  Función para descargarnos en caché una imagen, a través de una URL.

import UIKit

/* Para que cada imagen se almacene en el diccionario para poder acceder, ya que las imagenes van cambiando. Para hacer que llame directamente al constructor, se cambia : por = y se mete al final () */



var cacheImage = [URL: UIImage]()


/* Una funcion que, dada una URL te descarga la imagen asociada. Es necesaria ya que en el JSON te dan una URL, no la foto  */

func descargaImage(url: URL) -> UIImage? {
    
    
    /* Si la foto ya esta en la cache, no hace falta que ejecute el metodo*/
    
    if let  img = cacheImage[url]{
        return img
    }
    
    /* Si no está, la descargo*/
    if let data = try? Data(contentsOf: url),
        let img = UIImage(data: data){
        /* La guardo en cache */
        cacheImage[url] = img
        return img
        
    }
        
        
    /* Si no funciona, devuelve la foto "error"*/
    return UIImage(named: "error")!
    
}




