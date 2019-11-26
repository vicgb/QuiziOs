//
//  DetallesViewController.swift
//  p4_Quiz903
//
//  Created by G903 on 19/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import UIKit

/* UITextFieldDelegate -> Para asegurar que somos el delegado de los campos TextField que haya */

class DetallesViewController: UIViewController, UITextFieldDelegate {
    
    var quiz: QuizItem!
    
    @IBOutlet weak var preguntaLabel: UILabel!
    
    

    
    
    @IBOutlet weak var fotoPregunta: UIImageView!
    @IBOutlet weak var fotoAutor: UIImageView!
    
    
    @IBOutlet weak var autorLabel: UILabel!
    
 
   
    
    
    /*Vamos a hacer que se pueda introducir campo de texto dando al enter. Necesitamos un delegado*/
    @IBOutlet weak var respuestaField: UITextField!
    
    
    

    
    override func viewDidLoad(){
        super.viewDidLoad()

        preguntaLabel.text = quiz.question
        
        
        
        
        fotoPregunta.image = UIImage(named: "none")
        if let url = quiz.attachment?.url{
            fotoPregunta.image = descargaImage(url: url)
        }
        fotoPregunta.contentMode = .scaleToFill
        
        fotoAutor.image = UIImage(named: "none")
        if let url = quiz.author?.photo?.url{
            fotoAutor.image = descargaImage(url: url)
        }
        
       
        respuestaField.placeholder = "Introduce tu respuesta"
        /* Para decir que el delegado soy yo*/
        respuestaField.delegate = self
        
        autorLabel.text = quiz.author?.username
        
       
    
    }
    
    
    @IBAction func comprobarRespuesta(_ sender: UIButton) {
        let respuesta = respuestaField.text
        if respuesta == quiz.answer{
            alert(msg: "Respuesta correcta")
        }else{
            alert(msg: "Respuesta incorrecta")
        }
    }
    
    @IBAction func pulsarEnter(_ sender: UITextField) {
        
        let respuesta = respuestaField.text
        if respuesta == quiz.answer{
            alert(msg: "Respuesta correcta")
        }else{
            alert(msg: "Respuesta incorrecta")
        }
    }
    
    
   
    
    /* Para que obedezca al enter. En el storyboard hemos tenido que ir a las propiedades del TextField y ponerle un DidOnExit como propiedad a si mismo. CTRL + Arrastrar al botoncillo amarillo de arriba. Lo mismo para declararme delegado. */
    
    

}
