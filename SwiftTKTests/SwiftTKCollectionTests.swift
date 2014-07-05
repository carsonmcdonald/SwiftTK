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
    
    func testMapArray()
    {
        let result: String[] = STC.map([10, 40, 20, 30]) { (v) in
            return "\(v)"
        }
        
        XCTAssertEqualObjects(result, ["10", "40", "20", "30"])
    }

    func testMapHash()
    {
        let result: String[] = STC.map(["a": 10, "b": 40, "c": 20, "d": 30]) { (k, v) in
            return "\(k) == \(v)"
        }
        
        XCTAssertTrue(Swift.contains(result, "a == 10") &&
            Swift.contains(result, "b == 40") &&
            Swift.contains(result, "c == 20") &&
            Swift.contains(result, "d == 30"))
    }
    
    func testReduceArray()
    {
        let result_int: Int = STC.reduce([10, 40, 20, 30], start: 100) { (m, v) in
            return m + v
        }
        
        XCTAssertEqualObjects(result_int, 200)
        
        let result_str: String = STC.reduce(["10", "40", "20", "30"], start: "") { (m, v) in
            return "\(m) \(v)"
        }
        
        XCTAssertEqualObjects(result_str, " 10 40 20 30")
    }
    
    func testFindArray()
    {
        let result_found: Int! = STC.find([1, 6, 5, 10, 9]) { (v) in
            return v % 2 == 0
        }
        
        XCTAssertEqualObjects(result_found, 6)
        
        let result_not_found: Int! = STC.find([1, 5, 9]) { (v) in
            return v % 2 == 0
        }
        
        XCTAssertEqualObjects(result_not_found, nil)
    }
    
    func testFilterArray()
    {
        let result: Int[] = STC.filter([1, 6, 5, 10, 9]) { (v) in
            return v % 2 == 0
        }
        
        XCTAssertEqualObjects(result, [6, 10])
    }
    
    func testWhereHash()
    {
        var input: Array<Dictionary<String, String>> = []
        
        input.append(["org": "Acme", "device": "anvil",  "price": "1.50"])
        input.append(["org": "Acme", "device": "spoon",  "price": "3.00"])
        input.append(["org": "Foo",  "device": "bar",    "price": "7.20"])
        input.append(["org": "Acme", "device": "shovel", "price": "0.75"])
        
        var predicate: Dictionary<String, String> = ["org": "Acme"]

        let result_one: Array<Dictionary<String, String>> = STC._where(input, predicate: predicate)

        var expected_result: Array<Dictionary<String, String>> = []
        
        expected_result.append(["org": "Acme", "device": "anvil",  "price": "1.50"])
        expected_result.append(["org": "Acme", "device": "spoon",  "price": "3.00"])
        expected_result.append(["org": "Acme", "device": "shovel", "price": "0.75"])
        
        XCTAssertEqualObjects(result_one, expected_result)
    }
    
    func testFindWhereHash()
    {
        var input: Array<Dictionary<String, String>> = []
        
        input.append(["org": "Acme", "device": "anvil",  "price": "1.50"])
        input.append(["org": "Acme", "device": "spoon",  "price": "3.00"])
        input.append(["org": "Foo",  "device": "bar",    "price": "7.20"])
        input.append(["org": "Acme", "device": "shovel", "price": "0.75"])
        
        var predicate: Dictionary<String, String> = ["org": "Acme"]
        
        let result_one: Dictionary<String, String>? = STC.findWhere(input, predicate: predicate)
        
        XCTAssertEqualObjects(result_one, ["org": "Acme", "device": "anvil",  "price": "1.50"])
        
        predicate = ["nothing": "Acme"]
        
        let result_two: Dictionary<String, String>? = STC.findWhere(input, predicate: predicate)
        
        XCTAssertNil(result_two)
    }
    
    func testRejectArray()
    {
        let result: Int[] = STC.reject([1, 6, 5, 10, 9]) { (v) in
            return v % 2 == 0
        }
        
        XCTAssertEqualObjects(result, [1, 5, 9])
    }
}
