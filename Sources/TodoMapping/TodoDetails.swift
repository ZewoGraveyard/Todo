import TodoDomain
import ContentNegotiationMiddleware

public struct TodoDetails {
    public let title: String
    public let done: Bool

    public init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}

extension TodoDetails: ContentMappable {
    public init(mapper: Mapper) throws {
        self.title = try mapper.map(from: "title")
        self.done = try mapper.map(from: "done")
    }
}

extension TodoDetails: StructuredDataConvertible {
    public var structuredData: StructuredData {
        return [
            "title": .from(title),
            "done": .from(done)
        ]
    }
}
