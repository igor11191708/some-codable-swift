# SomeCodable
## Subsidiary package

### SomeEncodable
A type that can encode itself to an external representation from different types.

```swift
         struct User: Encodable{
             let name: String
         }
        let arr : [SomeEncodable] = [
            .init(User(name: "User")), 640, 20.65, "DPMSolverMultistep"
        ]
        
        if let encode = try? JSONEncoder().encode(arr){
            let str = String(decoding: encode, as: UTF8.self)
            print(str)
        }
```
*[{"name":"User"},640,20.65,"DPMSolverMultistep"]*

```swift
        struct User: Encodable{
             let name: String
         }
        let dic : [String: SomeEncodable] = [
            "data" : .init(User(name: "User")), "width" : 640, "num_inference_steps" : 20.65
        ]
        
        if let encode = try? JSONEncoder().encode(dic){
            let str = String(decoding: encode, as: UTF8.self)
            print(str)
        }

```

*{"width":640,"data":{"name":"User"},"num_inference_steps":20.65}*
