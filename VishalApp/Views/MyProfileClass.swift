//
//  MyProfileClass.swift
//  VishalApp
//
//  Created by Vishal M on 06/12/22.
//

import UIKit

class MyProfileClass: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
         setMyImage()
        view.addSubview(addButton)
    }
    
    
    let myImage:UIImageView = {
        let myImage = UIImageView()
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.image = UIImage(systemName: "person")
        myImage.backgroundColor = .blue
        myImage.layer.borderWidth = 1
        myImage.layer.masksToBounds = false
        myImage.layer.borderColor = UIColor.black.cgColor
        myImage.layer.cornerRadius = 30
        myImage.clipsToBounds = true
        return myImage
    }()
    
    func setMyImage(){
        view.addSubview(myImage)

        myImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        myImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 80).isActive = true
        myImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140).isActive = true

    }
    
    let addButton:UIButton = {
        let profileButton = UIButton()
        
        profileButton.frame = CGRectMake(100, 205,200, 30)
        profileButton.setTitle("Add Photo", for: .normal)
        profileButton.setTitleColor(UIColor .black, for: .normal)
        profileButton.backgroundColor = UIColor.blue
        profileButton.tag = 1
        profileButton.addTarget(self, action: #selector(addPhotoButton), for: .touchUpInside)
        profileButton.layer.cornerRadius = 6.0
        profileButton.layer.borderWidth = 2
        profileButton.layer.borderColor = UIColor.black.cgColor
        
        return profileButton
    }()
    
    @objc func addPhotoButton(){
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imageController, animated: true,completion: nil)
    }
   
   
}
extension MyProfileClass:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        myImage.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.dismiss(animated: true,completion: nil)
    }
}
