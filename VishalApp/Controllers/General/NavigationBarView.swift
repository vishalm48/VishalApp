//
//  NavigationViewController.swift
//  VishalApp
//
//  Created by Vishal M on 01/12/22.
//

import UIKit

class NavigationBarView: UIViewController {
   
  public var cellTextInProfile:[String] = ["My Profile","MyVideos"]
    private let profileTable:UITableView = {
        
        let table = UITableView()
        table.register(NavigationBarCells.self, forCellReuseIdentifier: NavigationBarCells.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileTable.backgroundColor = .cyan
        title = "MyProfile"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(profileTable)
        profileTable.delegate = self
        profileTable.dataSource = self
        dataLog()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileTable.frame = view.bounds
    }
  
    }

extension NavigationBarView:UITableViewDelegate,UITableViewDataSource,protocolForLogin{
    func log(dataLog: String) {
        print(dataLog)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTextInProfile.count
    }
    private func tableView(_ tableView: UITableView, heightForCell section: Int) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = profileTable.dequeueReusableCell(withIdentifier:NavigationBarCells.identifier, for: indexPath) as? NavigationBarCells
        
        cell?.backgroundColor = .cyan
        cell?.textLabel?.text = cellTextInProfile[indexPath.row]
        cell?.textLabel?.font = .boldSystemFont(ofSize: 16)
        return cell!
        
        //        cell?.cellTextProfile = cellTextInProfile[indexPath.row]
        // return cell!
    }
    
    func saveLogInfo(){

        let loginDetail = UserDefaults.standard.value(forKey: "Log Out")
        
            if loginDetail != nil{
                self.cellTextInProfile.append( UserDefaults.standard.value(forKey: "Log Out") as! String)
            
    }
}

    func dataLog(){
        
        if LoginClass.isLoggedIn == true {
           saveLogOut()
            //cellTextInProfile.append("Log Out")
            }
    else{
            
        cellTextInProfile.append("Log In")
        }
        
        profileTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let a : String = cellTextInProfile[indexPath.row]
        let b : String = "My Profile"
        let c : String = "MyVideos"
        let d : String = "Log in"
        let e : String = "Log Out"
          if(a.caseInsensitiveCompare(b) == .orderedSame){
              let vc = MyProfileClass()
              self.navigationController?.pushViewController(vc, animated: true)
          }
        
        if(a.caseInsensitiveCompare(c) == .orderedSame){
            let vc = DownloadViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if(a.caseInsensitiveCompare(d) == .orderedSame){
      
            let vc = LoginClass()
            self.navigationController?.pushViewController(vc, animated: true)
           
        }
        
        if(a.caseInsensitiveCompare(e) == .orderedSame){
      
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
    
}
