//
//  Quiz_model.swift
//  p4_Quiz903
//
//  Created by G903 on 18/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import UIKit

/* Creamos un tipo para que swift entienda el JSON */
/* Referencias a otras estructuras */

struct QuizItem: Codable{
    let id: Int
    let question: String
    let answer: String
    let author: Author?
    let attachment: Attachment?
    let favourite: Bool
    let tips: [String]
    
    struct Author: Codable{
        let isAdmin: Bool?
        let username: String
        let photo: Attachment?
        

    }
    
    struct Attachment: Codable{
        let filename: String
        let mime: String
        let url: URL?
    }
}

/* Esta clase será la encargada de asignar a la variable quizzes el array formado por todos los items (que ya hemos definido anteriormente su estructura) y para descargar los datos de la URL. */


class Quiz_model{
    
    let TOKEN = "021f2a6435874ececfbd"
    
    
    /* Descarga datos de la Web y los mete en la variable quizzes*/
    var quizzes = [QuizItem]()
    
    
    /* Funcion de descarga del JSON de la URL. Se ejecuta cuando se carga la App*/
    func descargaJSON(){
        
        let Stringurl = "https://quiz.dit.upm.es/api/quizzes/random10wa?token=021f2a6435874ececfbd"
        
        /* guard es como un if. Si no funciona, devuelve por consola "Mal asunto" */
        guard let url = URL(string: Stringurl) else {
            
           print("Mal asunto")
        return
            
        }
        
        
       /* Se mete un do-catch porque el metodo Data() lanza excepciones. Por eso habrá que poner un try dela te para que intente ejecutar ese metodo y si no, lance un error */
        do{
            
             /* Un tipo Data es un buffer de bytes -> Util para cuando te descargas algo de Internet */
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            
            let quizzesDescargados = try decoder.decode([QuizItem].self, from : data)
            
            self.quizzes = quizzesDescargados
            
            
            /*Para que saque el contenido del JSON como un String*/
            //let JSONCont = String(data: data, encoding: .utf8)
            //print(JSONCont)
            
        }catch{ //Hay que mirarlo en las transparencias
            print("Lo que te estás descargando me da a mi que no vale")
        }
    }
}
