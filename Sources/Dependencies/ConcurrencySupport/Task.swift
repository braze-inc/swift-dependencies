@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
extension Task where Failure == Never {
  /// An async function that never returns.
  public static func never() async throws -> Success {
    for await element in AsyncStream<Success>.never {
      return element
    }
    throw _Concurrency.CancellationError()
  }
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
extension Task where Success == Never, Failure == Never {
  /// An async function that never returns.
  public static func never() async throws {
    for await _ in AsyncStream<Never>.never {}
    throw _Concurrency.CancellationError()
  }
}
