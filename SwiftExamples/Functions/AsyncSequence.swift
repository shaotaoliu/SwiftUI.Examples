import Foundation

struct ItemSequence: AsyncSequence {
    
    typealias AsyncIterator = ItemIterator
    typealias Element = AsyncItem
    
    func makeAsyncIterator() -> ItemIterator {
        return ItemIterator()
    }
}

struct ItemIterator: AsyncIteratorProtocol {
    typealias Element = AsyncItem
    
    private var index = 0
    
    mutating func next() async throws -> AsyncItem? {
        try? await Task.sleep(nanoseconds: 100000000 * UInt64.random(in: 1...10))
        
        index += 1
        if index > 10 {
            return nil
        }
        
        return AsyncItem(id: index)
    }
    
}

struct AsyncItem {
    let id: Int
}

extension ItemSequence {
    
    func test() {
        Task {
            for try await item in ItemSequence() {
                print("\(item.id)")
            }
        }
    }
}

