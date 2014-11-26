//
//  ViewController.swift
//  DelegationExample
//
//  Created by Romaniuk Sergey on 26.11.14.
//  Copyright (c) 2014 Romaniuk Sergey. All rights reserved.
//

import UIKit


// ViewController соответствует протоколу DataEnteredDelegate (т.е в нем реализован метод userDidEnterInformation который необходимо реализовать по требованию протокола DataEnteredDelegate см. SecViewController)

class ViewController: UIViewController, DataEnteredDelegate {

    
    @IBOutlet var dataLabel: UILabel! = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//    функция userDidEnterInformation для соответствия протоколу DataEnteredDelegate
    
    func userDidEnterInformation(info: NSString) {
        
        dataLabel.text = info
        
    }
//   при переходу с ViewController на SecViewController если идентиф перехода(segue) равен showSecondVC то...
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSecondVC"{
            
    // получаем доступ к SecViewController...
    // In a storyboard-based application, you will often want to do a little preparation before navigation,
    //  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //      Get the new view controller using segue.destinationViewController.
    //      Pass the selected object to the new view controller.
    // }
            
            let secondVC:SecViewController = segue.destinationViewController as SecViewController
            // и устанавливаем его свойство delegate  = self (ViewController) т.е. становимся его делегатом.
            secondVC.delegate = self
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

