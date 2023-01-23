import Dependencies
import XCTest

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
final class ActorIsolatedTests: XCTestCase {
  func testAsyncWithValue() async {
    let numbers = ActorIsolated<Set<Int>>([])

    let task1 = Task {
      await numbers.withValue {
        _ = $0.insert(1)
      }
    }
    let task2 = Task {
      await numbers.withValue {
        _ = $0.insert(2)
      }
    }
    let task3 = Task {
      await numbers.withValue {
        _ = $0.insert(3)
      }
    }

    await task1.value
    await task2.value
    await task3.value
    let value = await numbers.value
    XCTAssertEqual(value, [1, 2, 3])
  }
}
