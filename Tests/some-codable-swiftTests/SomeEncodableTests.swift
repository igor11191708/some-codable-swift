import XCTest
@testable import some_codable_swift

final class SomeEncodableTests: XCTestCase {
    
    struct User: Encodable{
        let name: String
    }
    
    func testEncodeHeterogeneousArray() throws {
        
        let arr : [SomeEncodable] = [
            .init(User(name: "User")), 640, 20.65, "DPMSolverMultistep"
        ]
        
        let expected = "[{\"name\":\"User\"},640,20.65,\"DPMSolverMultistep\"]"
        
        
        let encode = try JSONEncoder().encode(arr)
                
        let str = String(decoding: encode, as: UTF8.self)
        
        XCTAssertEqual(expected, str)
        
    }
    
    func testEncodeHeterogeneousDictionary() throws {
        
        let dic : [String: SomeEncodable] = [
            "data" : .init(User(name: "User")),
            "width" : 640,
            "num_inference_steps" : 20.65
        ]
        
        let expected =  "{\"width\":640,\"num_inference_steps\":20.65,\"data\":{\"name\":\"User\"}}".data(using: .utf8)!
        let expectedJSON = try JSONSerialization.jsonObject(with: expected, options: []) as! NSDictionary
        
        let encode = try JSONEncoder().encode(dic)
        let encodedJSON = try JSONSerialization.jsonObject(with: encode, options: []) as! NSDictionary
        

        
        XCTAssertEqual(encodedJSON, expectedJSON)
    }
    
    func testCompareNilExpressible(){
        let someNil : [SomeEncodable] = [nil, nil, nil]
        
        XCTAssertEqual(someNil, [nil, nil, nil])
    }
    
    func testCompareBoolExpressible(){
        let someBool : SomeEncodable = true
        
        XCTAssertEqual(someBool, true)
    }
}
