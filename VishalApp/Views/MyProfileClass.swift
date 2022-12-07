//
//  MyProfileClass.swift
//  VishalApp
//
//  Created by Vishal M on 06/12/22.
//

import UIKit

class MyProfileClass: UIViewController {
  
    let topView:UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My Profile"
        setUpTopView()
        setMyImage()
    }
    func setUpTopView(){
        view.addSubview(topView)
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    let myImage:UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.image = UIImage(systemName: "person")
       
        return myImage
    }()
    
    func setMyImage(){
        view.addSubview(myImage)
        
        myImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
    }

    }
    

