import TodoDomain
import TodoApplication

public final class TodoInMemoryStore: Store {
    var todos: [Todo] = []
    public init() {}

    public func fetchAllTodos() throws -> [Todo] {
        return todos
    }

    public func saveTodo(title: String, done: Bool) throws -> Todo {
        let todo = Todo(
            id: "\(todos.count)",
            title: title,
            done: done
        )
        todos.append(todo)
        return todo
    }

    public func fetchTodo(id: String) throws -> Todo {
        let i = try index(id: id)
        return todos[i]
    }

    public func updateTodo(id: String, title: String?, done: Bool?) throws -> Todo {
        let i = try index(id: id)
        let currentTodo = todos[i]
        let newTodo = Todo(
            id: currentTodo.id,
            title: title ?? currentTodo.title,
            done: done ?? currentTodo.done
        )
        todos[i] = newTodo
        return newTodo
    }

    public func removeTodo(id: String) throws {
        let i = try index(id: id)
        todos.remove(at: i)
    }

    private func index(id: String) throws -> Int {
        guard let index = Int(id) where index >= 0 && index < todos.count else {
            throw TodoApplicationError.todoNotFound
        }
        return index
    }
}
