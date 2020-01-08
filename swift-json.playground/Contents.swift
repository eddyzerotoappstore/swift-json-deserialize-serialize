import PlaygroundSupport
import UIKit
PlaygroundPage.current.needsIndefiniteExecution = true

struct Todo: Codable {
    let userId : Int
    let id : Int
    let title : String
    let completed : Bool
}

func getTodo() {
    // Check URL is valid
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        // Check data is not nil
        guard let data = data else { return }

        do {
            let todo = try JSONDecoder().decode(Todo.self, from: data)
            print(todo.userId)
            print(todo.id)
            print(todo.title)
            print(todo.completed)
        } catch {
            print("error!")
        }
    }.resume()
}

getTodo()
