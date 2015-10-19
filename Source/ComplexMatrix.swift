// Copyright (c) 2014–2015 Mattt Thompson (http://mattt.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Accelerate

public struct ComplexMatrix {
    
    public let rows: Int
    public let columns: Int
    public var elements: [Complex]
    
    /// Construct a Matrix from an array of elements in row-major order--elements in the same row are next to each other.
    public init(rows: Int, columns: Int, elements: [Complex]) {
        assert(rows * columns == elements.count)
        self.rows = rows
        self.columns = columns
        self.elements = elements
    }
    
    /// Construct a Matrix of `rows` by `columns` with every element initialized to `repeatedValue`.
    public init(rows: Int, columns: Int, repeatedValue: Complex) {
        self.rows = rows
        self.columns = columns
        self.elements = [Complex](count: rows * columns, repeatedValue: repeatedValue)
    }
    
    /// Construct a Matrix from an array of rows
    public init(_ contents: [[Complex]]) {
        let m: Int = contents.count
        let n: Int = contents[0].count
        let repeatedValue = Complex(real: 0.0, imag: 0.0)
        
        self.init(rows: m, columns: n, repeatedValue: repeatedValue)
        
        for (i, row) in contents.enumerate() {
            elements.replaceRange(i*n..<i*n+min(m, row.count), with: row)
        }
    }
    
    public subscript(row: Int, column: Int) -> Complex {
        get {
            assert(indexIsValidForRow(row, column: column))
            return elements[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column))
            elements[(row * columns) + column] = newValue
        }
    }
    
    public func real() -> Matrix<Double> {
        let Xr = Matrix<Real>(rows: self.rows, columns: self.columns, elements: self.elements.map({(x) in x.real}))
        return Xr
    }
    
    public func imag() -> Matrix<Double> {
        let Xi = Matrix<Real>(rows: self.rows, columns: self.columns, elements: self.elements.map({(x) in x.imag}))
        return Xi
    }
    
    public func magnitude() -> Matrix<Double> {
        let Xmag = Matrix<Real>(rows: self.rows, columns: self.columns, elements: self.elements.map({(x) in x.magnitude}))
        return Xmag
    }
    
    public func phase() -> Matrix<Double> {
        let Xmag = Matrix<Real>(rows: self.rows, columns: self.columns, elements: self.elements.map({(x) in x.phase}))
        return Xmag
    }
    
    private func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
}

