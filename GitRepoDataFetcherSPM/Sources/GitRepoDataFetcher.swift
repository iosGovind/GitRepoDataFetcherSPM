//
//  GitRepoDataFetcher.swift
//  GitRepoDataFetcher
//
//  Created by Govind Solanki on 2022-08-18.
//

import Foundation

public class GitRepoDataFetcher {
    
    public static func getDataOf(plateform: Platform , org: String,completionHandler: @escaping (GitHubRepoModel?) -> Void , failedWithError: @escaping (String) -> Void ) {
        let webServices = WebServices.shared
        webServices.getRepoInfo(plateform: plateform, org: org) { retrivedData in
            completionHandler(retrivedData)
        } failedWithError: { error in
            failedWithError(error)
        }
    }
}
