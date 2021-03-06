// Copyright © 2015 Venture Media Labs.
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

import XCTest
import Upsurge

class RealArrayTests: XCTestCase {
    func testDescription() {
        let emptyRealArray: RealArray = []
        XCTAssertEqual(emptyRealArray.description, "[]")

        let realArray: RealArray = [1.0, 2.0, 3.0]
        XCTAssertEqual(realArray.description, "[1.0, 2.0, 3.0]")
    }

    func testCopy() {
        let a: RealArray = [1, 2, 3]
        let b = a.copy()
        b[0] = 4
        XCTAssertEqual(a[0], 1.0)
        XCTAssertEqual(b[0], 4.0)
    }

    func testSwap() {
        var a: RealArray = [1, 2, 3]
        var b: RealArray = [4]
        swap(&a, &b)

        XCTAssertEqual(a.count, 1)
        XCTAssertEqual(b.count, 3)
        XCTAssertEqual(a[0], 4.0)
        XCTAssertEqual(b[0], 1.0)
    }
}
