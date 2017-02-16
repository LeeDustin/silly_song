//
//  helperFunctionsTests.swift
//  Silly Song
//
//  Created by Marwan Alani on 2017-02-15.
//  Copyright © 2017 Marwan Alani. All rights reserved.
//

import XCTest
@testable import Silly_Song

class helperFunctionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /***********
     shortNameFromName Tests
     ***********/
    func testShortNameFromNameEmpty() {
        let testInput = ""
        XCTAssertEqual(shortNameFromName(name: testInput), "") // Empty input => empty output
    }
    
    func testShortNameFromNameSpaces() {
        let testInput = "  "
        XCTAssertEqual(shortNameFromName(name: testInput), "  ") // Spaces input => same spaces output
    }
    
    func testShortNameFromNameAllConsonants() {
        let testInput = "qwrtp"
        XCTAssertEqual(shortNameFromName(name: testInput), "") // All consonants input => empty output
    }
    
    func testShortNameFromNameAllVowels() {
        let testInput = "aouie"
        XCTAssertEqual(shortNameFromName(name: testInput), "aouie") // All lower case vowels input => unchanged input
    }
    
    func testShortNameFromNameUppercase() {
        let testInput = "AOUIE"
        XCTAssertEqual(shortNameFromName(name: testInput), "aouie") // All upper case vowels input => all lower case input
    }
    
    func testShortNameFromNameNumbers() {
        let testInput = "12345"
        XCTAssertEqual(shortNameFromName(name: testInput), "12345") // 12345 => 12345
    }
    
    func testShortNameFromNameJenny() {
        let testInput = "Jenny"
        XCTAssertEqual(shortNameFromName(name: testInput), "enny") // Jenny => enny
    }
    
    func testShortNameFromNamePeter() {
        let testInput = "Peter"
        XCTAssertEqual(shortNameFromName(name: testInput), "eter") // Peter => eter
    }
    
    /***********
     lyricsFromName Tests
     ***********/
    func testLyricsFromNameEmptyTemplate() {
        let template = ""
        let name = "Anna"
        XCTAssertEqual(lyricsForName(lyricsTemplate: template, fullName: name), "")
    }
    
    func testLyricsFromNameEmptyName() {
        let template = "<FULL_NAME> and <SHORT_NAME>."
        let name = ""
        XCTAssertEqual(lyricsForName(lyricsTemplate: template, fullName: name), "")
    }
    
    func testLyricsFromNameStaticTemplate() {
        let template = "A template that doesn't use a name"
        let name = "John"
        XCTAssertEqual(lyricsForName(lyricsTemplate: template, fullName: name), "A template that doesn't use a name")
    }
    
    func testLyricsFromNameAnna() {
        let template = "<FULL_NAME> and <SHORT_NAME>."
        let name = "Anna"
        XCTAssertEqual(lyricsForName(lyricsTemplate: template, fullName: name), "Anna and anna.")
    }
    
    func testLyricsFromNameJohn() {
        let template = "<FULL_NAME> and <SHORT_NAME>."
        let name = "John"
        XCTAssertEqual(lyricsForName(lyricsTemplate: template, fullName: name), "John and ohn.")
    }
}
