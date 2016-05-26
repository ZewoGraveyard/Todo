import TodoApplication
import TodoStore

let inMemory = TodoInMemoryStore()
let app = TodoApplication(store: inMemory)
