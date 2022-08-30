//
//  ViewController.swift
//  ViewsOutletsActions
//
//  Created by Renato on 30/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var botao: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func runSomething(_ sender: UIButton) {
        print("runSomething")
    }
    

    @IBAction func botao1(_ sender: Any) {
        print("Botão1")
    }
    
    @IBAction func doSomething(_ sender: UIButton) {
        print("doSomething")
    }
    
    @IBAction func change(_ sender: Any) {
    }
}

