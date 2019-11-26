//
//  InicioViewController.swift
//  p4_Quiz903
//
//  Created by G903 on 19/11/2019.
//  Copyright © 2019 UPM. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var InicioButton: UIButton!
    
    
    
    @IBSegueAction func empiezoQuiz(_ coder: NSCoder) -> AllTableViewController? {
        return AllTableViewController(coder: coder)
        
        let allTableViewController = AllTableViewController(coder: coder)
        
        return allTableViewController
    }
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
