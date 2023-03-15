import Foundation

struct ItemModel: Identifiable, Codable{
    let id : String = UUID().uuidString
    let title : String
    let isCompleted : Bool
}
