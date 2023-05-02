//
//  PhotoCollectionApiManager.swift
//  Photo Album
//
//

import Foundation

class ApiManager {
    
    func fetchData(handler: @escaping ([Details]) -> Void)
    {
        let urlString = "https://test.dev-fsit.com/api/image-list"
        let url = URL(string: urlString)
        let defaultSession = URLSession(configuration: .default)
        let dataTask = defaultSession.dataTask(with: url!) {
            (data: Data?, response: URLResponse?,error: Error?) in
            
            if(error != nil)
            {
                print(error!)
                return
            }
            
            do
            {
                let json = try JSONDecoder().decode(PhotoCollectionModel.self, from: data!)
                handler(json.data)
            }
            catch
            {
                print(error)
                return
            }
            
            
        }
        dataTask.resume()
    }
}
