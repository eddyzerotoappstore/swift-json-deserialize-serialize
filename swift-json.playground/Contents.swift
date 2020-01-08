import PlaygroundSupport
import UIKit
PlaygroundPage.current.needsIndefiniteExecution = true

struct Todo: Codable {
    let userNumber : Int
    let todoId : Int
    let todoTitle : String
    let isCompleted : Bool

  enum CodingKeys: String, CodingKey {
      case userNumber = "userId"
      case todoId = "id"
      case todoTitle = "title"
      case isCompleted = "completed"
  }
}

func getTodo() {
    // Check URL is valid
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        // Check data is not nil
        guard let data = data else { return }

        do {
            let todo = try JSONDecoder().decode(Todo.self, from: data)
            print(todo.userNumber)
            print(todo.todoId)
            print(todo.todoTitle)
            print(todo.isCompleted)
        } catch {
            print("error!")
        }
    }.resume()
}

getTodo()
