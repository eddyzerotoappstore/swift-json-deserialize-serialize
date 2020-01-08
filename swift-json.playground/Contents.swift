import UIKit

struct Todo: Codable {
    let userId : Int
    let id : Int
    let title : String
    let completed : Bool
}

let myTodo = Todo(userId: 1, id: 1, title: "Finish json swift tutorial", completed: false)

let encoder = JSONEncoder()
// Output formatting is optional, just so it looks good in console
encoder.outputFormatting = .prettyPrinted

let data = try encoder.encode(myTodo)
print(String(data: data, encoding: .utf8)!)
