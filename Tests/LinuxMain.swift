import XCTest
@testable import TodoApplicationTestSuite
@testable import TodoWebTestSuite

XCTMain([
    testCase(TodoApplicationTests.allTests),
    testCase(TodoWebTests.allTests),
])
