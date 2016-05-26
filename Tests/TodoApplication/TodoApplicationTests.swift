import XCTest
import TodoStore
@testable import TodoApplication

class TodoApplicationTests: XCTestCase {
    let inMemory = TodoInMemoryStore()
    lazy var app: TodoApplication = TodoApplication(store: self.inMemory)

    func testCreateTodo() {
        do {
            try app.createTodo(title: "do dishes", done: false)
            XCTAssertEqual(try app.getAllTodos().count, 1)
        } catch {
            XCTFail()
        }
    }
}

extension TodoApplicationTests {
    static var allTests: [(String, (TodoApplicationTests) -> () throws -> Void)] {
        return [
            ("testCreateTodo", testCreateTodo),
        ]
    }
}
