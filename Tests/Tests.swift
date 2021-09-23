//
//  Tests.swift
//  Tests
//
//  Created by Alexis Grigorev on 23.09.2021.
//

import XCTest

class Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        sleep(5) //avaits env started
        
        //setup
        let simpleClass = SomeClass()
        let childClass  = SomeChildClass()
        let simpleStruct = SomeStruct()
        let nsClass = SomeNSClass()

        var startNanosecs: Int64 = 0

        var simpleClassExecTime: Int64 = 0
        var childClassExecTime: Int64 = 0
        var simpleStructExecTime: Int64 = 0
        var nsClassExecTime: Int64 = 0
        let iterations: Int64 = 10_000_000
        
        //action
        startNanosecs = Date.currentNanosecs
        for _ in 1...iterations {
            _ = simpleStruct.getRandomInt()
        }
        simpleStructExecTime = Date.currentNanosecs - startNanosecs

        startNanosecs = Date.currentNanosecs
        for _ in 1...iterations {
            _ = simpleClass.getRandomInt()
        }
        simpleClassExecTime = Date.currentNanosecs - startNanosecs

        startNanosecs = Date.currentNanosecs
        for _ in 1...iterations {
            _ = childClass.getRandomInt()
        }
        childClassExecTime = Date.currentNanosecs - startNanosecs

    
        startNanosecs = Date.currentNanosecs
        for _ in 1...iterations {
            _ = nsClass.getRandomInt()
        }
        nsClassExecTime = Date.currentNanosecs - startNanosecs

        
        //assert
        XCTAssertTrue(simpleStructExecTime < childClassExecTime)
        XCTAssertTrue(childClassExecTime < nsClassExecTime)

        print("simple struct ms: \(simpleStructExecTime/1000)")
        print("simple class ms: \(simpleClassExecTime/1000)")
        print("child class ms: \(childClassExecTime/1000)")
        print("ns class ms: \(nsClassExecTime/1000)")
        
        print("-----")
        
        let simpleStructVSsimpleClass = simpleClassExecTime - simpleStructExecTime
        
        let simpleStructVSchildClass = childClassExecTime - simpleStructExecTime
        
        let cildClassVSnsObj = nsClassExecTime - childClassExecTime
            
        print("direct on struct vs direct class (compiler optimization from table to direct) on  \(iterations) iterations in ms: \n \((simpleStructVSsimpleClass)/1000)")
        print("-----")

        print("direct on struct vs table on childClass on \(iterations) iterations in ms:\n \((simpleStructVSchildClass)/1000)")
        print("-----")
        
        print("message on nsObj vs table on childClass on \(iterations) iterations in ms:\n \((cildClassVSnsObj)/1000)")
        print("-----")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
