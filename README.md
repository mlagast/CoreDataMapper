# CoreDataMapper
CoreDataMapper is a framework based on ObjectMapper. It's written in Swift that makes it easy for you to convert your CoreData objects to and from JSON.

# Features:
- Mapping JSON to CoreData objects

# The Basics
Create MapContext with NSManagedObjectContext and EntityName:
```swift
let mapperContext = CoreDataMapContext(managedObjectContext: managedObjectContext, entityName: entityName)
let mapper = Mapper<T>(context: mapperContext) # T is kind of NSManagedObjectModel and implements Mappable
let result = mapper.map(JSON: jsonObject) # jsonObject is kind of [String : Any]
```

# References
[ObjectMapper repository](https://github.com/Hearst-DD/ObjectMapper/)
