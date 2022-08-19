//
//  GitRepoDataFetcher.swift
//  GitRepoDataFetcher
//
//  Created by Govind Solanki on 2022-08-18.
//

import Foundation

public class GitRepoDataFetcher {
    
    // MARK: Static methods
    // ========================
    public static func getDataOf(plateform: Platform , org: String,completionHandler: @escaping (GitHubRepoModel?) -> Void , failedWithError: @escaping (String) -> Void ) {
        let urlString = "https://api.github.com/search/repositories?q=\(plateform.rawValue)+org:\(org)"
        WebServices.shared.hitGetDataApi(url: urlString) { (data: GitHubRepoModel?) in
            completionHandler(data)
        } failedWithError: { error in
            failedWithError(error)
        }
    }
}
