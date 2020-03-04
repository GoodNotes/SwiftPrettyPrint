//
//  SinglelineFormatterTests.swift
//  SwiftPrettyPrintTests
//
//  Created by Yusuke Hosonuma on 2020/03/03.
//

@testable import SwiftPrettyPrint
import XCTest

class SinglelineFormatterTests: XCTestCase {
    let formatter = SinglelineFormatter()

    override func setUp() {}

    override func tearDown() {}

    func testArrayString() {
        let array: [String] = [#""Hello""#, #""World""#]

        XCTAssertEqual(formatter.arrayString(elements: array),
                       #"["Hello", "World"]"#)
    }

    func testDictionaryString() {
        let keysAndValues: [(String, String)] = [
            ("2", #""Two""#),
            ("1", #""One""#),
        ]

        XCTAssertEqual(formatter.dictionaryString(keysAndValues: keysAndValues),
                       #"[1: "One", 2: "Two"]"#) // sorted
    }

    func testObjectString() {
        let fields: [(String, String)] = [
            ("name", #""pochi""#),
            ("age", "4"),
        ]

        XCTAssertEqual(formatter.objectString(typeName: "Dog", fields: fields),
                       #"Dog(name: "pochi", age: 4)"#)
    }
}
