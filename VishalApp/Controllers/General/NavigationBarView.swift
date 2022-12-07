//
//  NavigationViewController.swift
//  VishalApp
//
//  Created by Vishal M on 01/12/22.
//

import UIKit

class NavigationBarView: UIViewController {

  public var cellTextInProfile:[String] = ["My Profile","MyVideos","Log in","Logout"]
    
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
        profileTable.dataSource =  self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileTable.frame = view.bounds
    }
  
    }

extension NavigationBarView:UITableViewDelegate,UITableViewDataSource{
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
//
//        cell?.cellTextProfile = cellTextInProfile[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let a : String = cellTextInProfile[indexPath.row]
        let b : String = "My Profile"
        let c : String = "MyVideos"
        let d : String = "Log in"
        let e : String = "Logout"
        
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
            let vc = ClassForProfileCells()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
