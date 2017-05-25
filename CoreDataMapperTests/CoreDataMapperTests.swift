//
//  CoreDataMapperTests.swift
//  CoreDataMapperTests
//
//  Created by  Matthieu Lagast on 25/05/2017.
//  Copyright © 2017 mlagast. All rights reserved.
//

import CoreData
import ObjectMapper
import XCTest
@testable import CoreDataMapper

class CoreDataMapperTests: XCTestCase {
    let entityName:String = "User"
    var context:NSManagedObjectContext?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let bundle = Bundle(for: type(of: self))
        context = setUpInMemoryManagedObjectContext(with: bundle)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOneEntity() {
        guard let managedObjectContext = context else {
            return XCTFail("manage object context is nil")
        }
        
        let bundle = Bundle(for: type(of: self))
        guard let jsonObject = loadJSON(fromFile: "object_user", fileExtension: "json", bundle: bundle) as? [String : Any] else {
            return XCTFail("fail to load json obejct")
        }
        
        let mapperContext = CoreDataMapContext(managedObjectContext: managedObjectContext, entityName: entityName)
        let mapper = Mapper<User>(context: mapperContext)
        let result = mapper.map(JSON: jsonObject)
        
        XCTAssertNotNil(result)
        
        if let user = result {
            XCTAssertNotNil(user.name)
        }
        
        let entities = fetchEntities(forName: entityName, managedObjectContext: managedObjectContext)
        XCTAssert(entities?.count ?? 0 > 0)
    }
    
    func testManyEntities() {
        guard let managedObjectContext = context else {
            return XCTFail("manage object context is nil")
        }
        
        let bundle = Bundle(for: type(of: self))
        guard let jsonArray = loadJSON(fromFile: "objects_user", fileExtension: "json", bundle: bundle) as? [[String : Any]] else {
            return XCTFail("fail to load json obejct")
        }
        
        let mapperContext = CoreDataMapContext(managedObjectContext: managedObjectContext, entityName: entityName)
        let mapper = Mapper<User>(context: mapperContext)
        let results = mapper.mapSet(JSONArray: jsonArray)
        
        XCTAssertNotNil(results)
        
        let entities = fetchEntities(forName: entityName, managedObjectContext: managedObjectContext)
        XCTAssert(entities?.count ?? 0 == 2)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
