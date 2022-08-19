
import Foundation

// MARK: - GitHubRepoModel
 public  struct GitHubRepoModel: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
public struct Item: Codable {
    let name: String?
    let itemPrivate: Bool
    let itemDescription: String?
    let language: String?

    enum CodingKeys: String, CodingKey {
        case name
        case itemPrivate = "private"
        case language
        case itemDescription = "description"
    }
}
