//
//  WebServices.swift
//  GitRepoDataFetcher
//
//  Created by Govind Solanki on 2022-08-18.
//

import Foundation

class WebServices {
    // MARK: Shared instance
    // =================
    static let shared = WebServices()
    private init(){}
    
    // MARK: Member methods
    // =================
    func hitGetDataApi<R: Decodable>(url:String, completionHandler: @escaping (R?) -> Void , failedWithError: @escaping (String) -> Void ){
        
        guard let uRL =  URL(string: url) else {return}
        var request = URLRequest(url: uRL , cachePolicy: .reloadIgnoringCacheData)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let  error = error {
                failedWithError(error.localizedDescription)
            }
            guard let data = data else{ return }
            do{
                let decoder = JSONDecoder()
                if #available(iOS 10.0, *) {
                    decoder.dateDecodingStrategy = .iso8601
                } else {
                    // Fallback on earlier versions
                }
                let parsedData = try decoder.decode(R.self, from: data)
                completionHandler(parsedData)
            }
            catch (let error) {
                failedWithError(error.localizedDescription)
            }
        }.resume()
    }
}
