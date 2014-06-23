import XCTest

import SwiftTK

typealias STC = SwiftTKCollection

class SwiftTKCollectionTests: XCTestCase
{
    func testEachArray()
    {
        var indices: Int[] = []
        var values: Int[] = []
        
        STC.each([10, 40, 20, 30]) { (i, v) in
            indices.append(i)
            values.append(v)
        }
        
        XCTAssertEqualObjects(indices, [0, 1, 2, 3])
        XCTAssertEqualObjects(values, [10, 40, 20, 30])
    }
    
    func testEachHash()
    {
        var keys: String[] = []
        var values: Int[] = []
        
        STC.each(["a": 10, "b": 40, "c": 20, "d": 30]) { (i, v) in
            keys.append(i)
            values.append(v)
        }
        
        XCTAssertTrue(Swift.contains(keys, "a") &&
            Swift.contains(keys, "b") &&
            Swift.contains(keys, "c") &&
            Swift.contains(keys, "d"))
        XCTAssertTrue(Swift.contains(values, 10) &&
            Swift.contains(values, 40) &&
            Swift.contains(values, 20) &&
            Swift.contains(values, 30))
    }
}
