//
//  ApiService.swift
//  MVVM
//
//  Created by Sharetrip-iOS on 18/08/2021.
//

import Foundation

class ApiService : NSObject{
    
    
    static let apiInstance = ApiService()
    
    func jsonHandler(handler : @escaping ([UserModel])->()){
        
        var userData = [UserModel]()
        let urlString = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: urlString)
        
        guard let urlName = url else {
            return
        }
        URLSession.shared.dataTask(with: urlName) { (data, response, error) in
            
            if let data = data{
                let decoder = JSONDecoder()
                
                do {
                    
                    let results = try decoder.decode([UserModel].self, from: data)
                    
                    for x in results{
                        userData.append(UserModel(id: x.id, name: x.name, email: x.email))
                    }
                    handler(userData)
                  
                } catch let err {
                    print(err.localizedDescription)
                    return
                }
                
                
            }else{
                return
            }
            
            
        }.resume()
        
    
    }
    
    
    
    
}
