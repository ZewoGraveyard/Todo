import TodoDomain

public protocol Store {
    func fetchAllTodos() throws -> [Todo]
    func saveTodo(title: String, done: Bool) throws -> Todo
    func fetchTodo(id: String) throws -> Todo
    func updateTodo(id: String, title: String?, done: Bool?) throws -> Todo
    func removeTodo(id: String) throws
}

public enum TodoApplicationError: ErrorProtocol {
    case todoNotFound
}

public final class TodoApplication {
    var store: Store

    public init(store: Store) {
        self.store = store
    }

    public func getAllTodos() throws -> [Todo] {
        return try store.fetchAllTodos()
    }

    public func createTodo(title: String, done: Bool) throws -> Todo {
        return try store.saveTodo(
            title: title,
            done: done
        )
    }

    public func getTodo(id: String) throws -> Todo {
        return try store.fetchTodo(id: id)
    }

    public func updateTodo(id: String, title: String? = nil, done: Bool? = nil) throws -> Todo {
        return try store.updateTodo(
            id: id,
            title: title,
            done: done
        )
    }

    public func removeTodo(id: String) throws {
        try store.removeTodo(id: id)
    }
}
