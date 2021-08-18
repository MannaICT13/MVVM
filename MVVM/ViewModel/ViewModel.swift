//
//  ViewModel.swift
//  MVVM
//
//  Created by Sharetrip-iOS on 18/08/2021.
//

import Foundation

class ViewModel {
    
    var userData = [UserModel]()
    
    var numberOfRows: Int {
        return userData.count
    }
    
    func loadData(handler: @escaping (Bool)->()) {
        ApiService.apiInstance.jsonHandler { (user) in
            self.userData = user
            if self.userData.count > 0 {
                handler(true)
            } else {
                handler(false)
            }
        }
    }
    
    func getUserInfoText(using index: Int) -> String {
        return self.userData[index].name
    }
}
