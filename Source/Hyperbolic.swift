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

// MARK: Hyperbolic Sine

public func sinh(x: RealArray) -> RealArray {
    let results = RealArray(count: x.count, repeatedValue: 0.0)
    vvsinh(results.pointer, x.pointer, [Int32(x.count)])

    return results
}

// MARK: Hyperbolic Cosine

public func cosh(x: RealArray) -> RealArray {
    let results = RealArray(count: x.count, repeatedValue: 0.0)
    vvcosh(results.pointer, x.pointer, [Int32(x.count)])

    return results
}

// MARK: Hyperbolic Tangent

public func tanh(x: RealArray) -> RealArray {
    let results = RealArray(count: x.count, repeatedValue: 0.0)
    vvtanh(results.pointer, x.pointer, [Int32(x.count)])

    return results
}

// MARK: Inverse Hyperbolic Sine

public func asinh(x: RealArray) -> RealArray {
    let results = RealArray(count: x.count, repeatedValue: 0.0)
    vvasinh(results.pointer, x.pointer, [Int32(x.count)])

    return results
}

// MARK: Inverse Hyperbolic Cosine

public func acosh(x: RealArray) -> RealArray {
    let results = RealArray(count: x.count, repeatedValue: 0.0)
    vvacosh(results.pointer, x.pointer, [Int32(x.count)])

    return results
}

// MARK: Inverse Hyperbolic Tangent

public func atanh(x: RealArray) -> RealArray {
    let results = RealArray(count: x.count, repeatedValue: 0.0)
    vvatanh(results.pointer, x.pointer, [Int32(x.count)])

    return results
}
