import Foundation

struct Matrix {
    
    private var mat: [[Int]]
    private var row: Int
    private var col: Int
    
    init(row: Int, col: Int) {
        let array = Array(repeating: 0, count: col)
        mat = Array(repeating: array, count: row)
        
        self.row = row
        self.col = col
    }
    
    subscript(_ row: Int, _ col: Int) -> Int? {
        get {
            return validate(row, col) ? mat[row][col] : nil
        }
        set {
            if newValue != nil && validate(row, col) {
                mat[row][col] = newValue!
            }
        }
    }
    
    private func validate(_ row: Int, _ col: Int) -> Bool {
        return row >= 0 && row < self.row && col >= 0 && col < self.col
    }
    
    static func test() {
        var m = Matrix(row: 5, col: 5)
        print("\(m[3, 3] ?? -1)")

        m[3, 3] = 5
        print("\(m[3, 3] ?? -1)")
    }
}
