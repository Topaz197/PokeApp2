//
//  myNewPizzaAppTests.swift
//  myNewPizzaAppTests
//
//  Created by Anthony Rodriguez on 8/21/17.
//  Copyright © 2017 Anthony Rodriguez. All rights reserved.
//

import XCTest
@testable import myNewPizzaApp

class myNewPizzaAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testConvertFromCtoF()
    {
        let vm = ViewModel()
        XCTAssertEqual(vm.changeCtoF(temp: 29), 84)
    }
    
    func testConvertFromCtoF_Fail()
    {
        let vm = ViewModel()
        XCTAssertFalse(vm.changeCtoF(temp: 29) == 90)
    }
    
    func testConvertFromFtoC()
    {
        let vm = ViewModel()
        XCTAssertEqual(vm.changeFtoC(temp: 84), 29)
    }
    
    func testConvertFromFtoC_Fail()
    {
        let vm = ViewModel()
        XCTAssertFalse(vm.changeFtoC(temp: 84) == 10)
    }
    
    func testNetworkCall()
    {
        let expect = expectation(description: "I got Mew")
        Networking.callApi(url: "http://pokeapi.co/api/v2/pokemon/\(151)/"){
            (pokemon, error) in
            XCTAssertEqual(pokemon?.name, "mew")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10){ (error) in
            guard error == nil else{
                print(error!.localizedDescription)
                XCTFail()
                return
            }
        }
    }
    
    func testNetworkCall_Fail()
    {
        let expect = expectation(description: "I got Mew")
        Networking.callApi(url: "http://pokeapi.co/api/v2/pokemon/\(151)/"){
            (pokemon, error) in
            XCTAssertNotEqual(pokemon?.name, "charizard")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10){ (error) in
            guard error == nil else{
                print(error!.localizedDescription)
                XCTFail()
                return
            }
        }
    }
}
