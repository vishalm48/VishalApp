//
//  LogOutClassViewController.swift
//  VishalApp
//
//  Created by Vishal M on 08/12/22.
//

import UIKit

class LogOutClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        forLogOutPopUp()
       
    }

    
    func forLogOutPopUp(){
        var refreshAlert = UIAlertController(title: "Log Out", message: "Are You Sure to Log Out ? ", preferredStyle: UIAlertController.Style.alert)
              
        refreshAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
            self.navigationController?.popToRootViewController(animated: true)
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in

            self.navigationController?.popToRootViewController(animated: true)


        }))

        present(refreshAlert, animated: true, completion: nil)
    }

}
