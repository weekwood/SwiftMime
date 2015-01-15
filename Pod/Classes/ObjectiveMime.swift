//
//  ObjectiveMime.swift
//  ObjectiveMime
//
//  Created by di wu on 1/12/15.
//
//

import Foundation

private let sharedInstance = ObjectiveMime()

public class ObjectiveMime{

    var types = [NSString: NSString]()
    var extensions = [NSString: NSString]()

    public class var sharedManager : ObjectiveMime {
        sharedInstance.load("mime")
        sharedInstance.load("node")
        return sharedInstance
    }

    func define(map: NSDictionary){

        for type in map{
            var exts: NSArray = type.value as NSArray
            if(exts.count == 0){
                println(type)
            }
            for var index = 0;index < exts.count; ++index {
                self.types[exts[index] as NSString] = type.key as? NSString
            }

            self.extensions[type.key as NSString] = exts[0] as? NSString;
        }
    }

    func load(filePath: String){
        let path =  NSBundle(forClass: object_getClass(self)).pathForResource(filePath, ofType: "types")
        var possibleContent = NSString(contentsOfFile:path!, encoding: NSUTF8StringEncoding, error: nil)
        var lines = NSArray()
        let map = NSMutableDictionary()
        if let content = possibleContent {
             lines = content.componentsSeparatedByString("\n")
        }
        for line in lines{
            if line.hasPrefix("#"){
                continue
            }
            var fields: NSArray = line.stringByReplacingOccurrencesOfString("\\s+", withString:" ", options: .RegularExpressionSearch, range: NSMakeRange(0, line.length)).componentsSeparatedByString(" ")
            if fields.firstObject?.length>0 {
                map[fields.firstObject as NSString] = fields.subarrayWithRange(NSMakeRange(1, fields.count-1))
            }
        }
        self.define(map)

    }

    public func lookupType(path: NSString) -> NSString{
        let newPath = path.stringByReplacingOccurrencesOfString(".*[\\.\\/\\\\]", withString: "", options: .RegularExpressionSearch, range: NSMakeRange(0, path.length))
        var ext: NSString = newPath
        ext = ext.lowercaseString
        return self.types[ext]!
    }

    public func lookupExtension(mimeType: NSString) -> NSString{
        return self.extensions[mimeType]!
    }
}
