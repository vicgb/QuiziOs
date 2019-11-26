//
//  AllTableViewController.swift
//  p4_Quiz903
//
//  Created by G903 on 18/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import UIKit


class AllTableViewController: UITableViewController {

    @IBOutlet weak var refrescaQuiz: UIBarButtonItem!
    
    
    
    /* Instancia para que el TableViewController acceda a los tipos creados en Model. Necesitamos asignar el modelo creado en Quiz_model a una variable para que la tabla pueda rellenarse con sus parámetros */
    
    let quizmodel = Quiz_model()
    
   /*Este metodo lo que hace es cargar el array*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizmodel.descargaJSON()
        
        /* Para que se repinte la tabla, con los datos descargados. Tiene un problema y es que mientras se descarga, la app no responde. Lo hago async para que se ejecute en otro plano y siga funcionando */
        tableView.reloadData()
    }
    
    
   
    
    /* Aqui hay que construir la pantalla destino*/
    @IBSegueAction func mostrarDetallesQuiz(_ coder: NSCoder) -> DetallesViewController? {
        
        /*Se crea una instancia de la pantalla destino, a una variable*/
        let detallesQuiz = DetallesViewController(coder: coder)!
        
        
        
        /*Queremos "rellenar" la pantalla destino con las filas del quiz. Es importante porque te dice la fila (y por tanto el quiz) del que quieres saber todos los detalles en la pantalla siguiente. Necesitamos un seleccionador por index */
        
        let row = tableView.indexPathForSelectedRow!.row
        
        detallesQuiz.quiz =  quizmodel.quizzes[row]
        
        
        return detallesQuiz
    }
    
    
   
    
    @IBAction func refrescaQuizAction(_ sender: UIBarButtonItem) {
        
        viewDidLoad()
    }
    
    
    
    
    
    
    
    // MARK: - Table view data source

    /* ¿Cuántas secciones hay? */
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Por defecto == 1
        return 1
    }

    /* Dentro de cada sección habrá tantas celdas como items haya en el modelo */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return quizmodel.quizzes.count
    }

    /* De todas las celdas que hay, sacame la que se llame "cell" */
    /* Con el indexpath te dice el indice de la fila en la que estas */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CeldaPersonalizada
        
        let row = indexPath.row
        
        //Llamamos "quiz" a las filas de la tabla. ?????????
        let quiz = quizmodel.quizzes[row]
        
        /* Aqui le estamos asignando el valor de quiz.question a la label del titulo que hay dentro de cell */
       
        cell.preguntaCelda?.text = quiz.question
        
        /* detailTextLabel => Para el subtitulo */
        /* Esta estructura es: Valor que debería sacar ?? Valor por defecto que le metemos */
        cell.imagenCelda.contentMode = .scaleToFill
        cell.autorCelda?.text = quiz.author?.username ?? "anonimo"
        
        
        cell.imagenCelda?.image = UIImage(named: "none")
        
        cell.favouriteCelda.text = String(quiz.favourite)
        
        /* Evalúa la función descargaImage y si funciona la asigna a la variable imagen. Si no, otra cosas*/
        
        if let url = quiz.attachment?.url,
         let imagen = descargaImage(url: url){
            cell.imagenCelda?.image = imagen
        }
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
