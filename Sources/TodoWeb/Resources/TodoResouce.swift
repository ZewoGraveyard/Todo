import TodoDomain
import TodoApplication
import TodoMapping
import Zewo
import Resource

let recovery = RecoveryMiddleware { error in
    switch error {
    case TodoApplicationError.todoNotFound:
        return Response(status: .notFound)
    default:
        return Response(status: .internalServerError)
    }
}

let todoResource = Resource(middleware: recovery, mediaTypes: [JSONMediaType()]) { todo in
    todo.index { _ in
        let todos = try app.getAllTodos()
        return Response(content: ["todos": todos.content])
    }

    todo.create(content: TodoDetails.self) { _, details in
        let todo = try app.createTodo(title: details.title, done: details.done)
        return Response(content: todo)
    }

    todo.show { _, id in
        let todo = try app.getTodo(id: id)
        return Response(content: todo)
    }

    todo.update(content: TodoDetails.self) { _, id, details in
        let todo = try app.updateTodo(id: id, title: details.title, done: details.done)
        return Response(content: todo)
    }

    todo.destroy { _, id in
        try app.removeTodo(id: id)
        return Response(status: .noContent)
    }
}
