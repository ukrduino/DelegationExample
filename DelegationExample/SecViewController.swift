//
//  SecViewController.swift
//  DelegationExample
//
//  Created by Romaniuk Sergey on 26.11.14.
//  Copyright (c) 2014 Romaniuk Sergey. All rights reserved.
//

import UIKit
        // Определяем протокол DataEnteredDelegate т.е. класс который будет соответвовать данному протоколу должен...
protocol DataEnteredDelegate {
        // реализовать в себе данную функцию
    func userDidEnterInformation(info:NSString)
    
}

class SecViewController: UIViewController {

    @IBOutlet var dataTextField: UITextField! = UITextField()
    
        // определение свойства delegate данного класа по протоколу DataEnteredDelegate т.е. кто будет делегатьм???
    var delegate:DataEnteredDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendData(sender: AnyObject) {

        // если делегат определен т.е. он не nil
        if (delegate != nil) {
            // берем текст из текстового поля...
            let information:NSString = dataTextField.text
            // запускаем в делегате (у нас это будет ViewController) функцию userDidEnterInformation и передаем в нее текст...
            delegate!.userDidEnterInformation(information)
            // потом закрываем данный SecViewController
            self.navigationController?.popViewControllerAnimated(true)
    
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
