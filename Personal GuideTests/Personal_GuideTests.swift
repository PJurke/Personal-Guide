//
//  Personal_GuideTests.swift
//  Personal GuideTests
//
//  Created by Philip Jurke on 06.01.24.
//

import XCTest

import SwiftData
@testable import Personal_Guide

@MainActor
final class Personal_GuideTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Tests that the value "LifeAspect.Unknown" (from old app versions) is correctly decoded as .general
    func testLegacyLifeAspectDecoding() throws {
        
        // Given: JSON data representing an old stored value
        let json = "\"LifeAspect.Unknown\"".data(using: .utf8)!
        
        // When: We decode it using the updated LifeAspect type
        let decoder = JSONDecoder()
        let decodedAspect = try decoder.decode(LifeAspect.self, from: json)
        
        // Then: It should be interpreted as .general
        XCTAssertEqual(decodedAspect, .general, "Legacy 'Unknown' value should be decoded as '.general'")
    }
    
    /// Tests the SwiftData migration plan execution from V1 to V2
    func testSchemaMigrationV1toV2() throws {
        
        // Given: A temporary file URL
        let url = URL(fileURLWithPath: NSTemporaryDirectory().appending(UUID().uuidString + ".sqlite"))
        
        // SAFETY: Cleanup
        defer {
            try? FileManager.default.removeItem(at: url)
            try? FileManager.default.removeItem(at: url.deletingPathExtension().appendingPathExtension("sqlite-shm"))
            try? FileManager.default.removeItem(at: url.deletingPathExtension().appendingPathExtension("sqlite-wal"))
        }
        
        // 1. Setup V1 Container and add data
        do {
            let v1Schema = Schema(versionedSchema: PersonalGuideSchemaV1.self)
            let v1Config = ModelConfiguration(
                schema: v1Schema,
                url: url,
                cloudKitDatabase: .none
            )
            let v1Container = try ModelContainer(for: v1Schema, configurations: v1Config)
            let v1Context = v1Container.mainContext
            
            let goalV1 = PersonalGuideSchemaV1.LifeGoal(name: "Test Goal", aspect: .general, isAchieved: false)
            v1Context.insert(goalV1)
            try v1Context.save()
        }
        
        // 2. Perform Migration to V2
        let v2Schema = Schema(versionedSchema: PersonalGuideSchemaV2.self)
        let v2Config = ModelConfiguration(
            schema: v2Schema,
            url: url,
            cloudKitDatabase: .none
        )
        
        let v2Container = try ModelContainer(
            for: v2Schema,
            migrationPlan: PersonalGuideMigrationPlan.self,
            configurations: v2Config
        )
        
        // 3. Verify V2 Data
        let v2Context = v2Container.mainContext
        let descriptor = FetchDescriptor<LifeGoal>()
        let v2Goals = try v2Context.fetch(descriptor)
        
        XCTAssertEqual(v2Goals.count, 1)
        XCTAssertEqual(v2Goals.first?.name, "Test Goal")
    }

}
