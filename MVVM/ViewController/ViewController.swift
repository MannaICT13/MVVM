//
//  ViewController.swift
//  MVVM
//
//  Created by Sharetrip-iOS on 18/08/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var userTV: UITableView!
    
    let vm = ViewModel()
    
    //MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        loadData()
    }
    
    //MARK:- Initial setup
    private func initialSetup() {
        userTV.delegate = self
        userTV.dataSource = self
        userTV.register(UINib(nibName: "UserTVCell", bundle: nil), forCellReuseIdentifier: "UserTVCell")
        
    }
    
    //MARK:- API Calls
    fileprivate func loadData() {
        vm.loadData() {[weak self] (isSuccess) in
            if isSuccess {
                DispatchQueue.main.async {
                    self?.userTV.reloadData()
                }
            }
        }
    }
}

//MARK:- Tableview Delegate and Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTV.dequeueReusableCell(withIdentifier: "UserTVCell") as! UserTVCell
        cell.config(userInfoText: vm.getUserInfoText(using: indexPath.row))
        return cell
    }
}
