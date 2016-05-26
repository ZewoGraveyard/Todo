import TodoDomain
import ContentNegotiationMiddleware

extension Todo: ContentMappable {
    public init(mapper: Mapper) throws {
        self.id = try mapper.map(from: "id")
        self.title = try mapper.map(from: "title")
        self.done = try mapper.map(from: "done")
    }
}

extension Todo: StructuredDataConvertible {
    public var structuredData: StructuredData {
        return [
            "id": .from(id),
            "title": .from(title),
            "done": .from(done)
        ]
    }
}
