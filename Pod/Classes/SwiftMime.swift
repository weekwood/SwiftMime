//
//  SwiftMime.swift
//  SwiftMime
//
//  Created by di wu on 1/12/15.
//
//  License
//  Copyright (c) 2015 Di Wu
//  Released under an MIT license: http://opensource.org/licenses/MIT

import Foundation

public class SwiftMime {

    public static let sharedManager = SwiftMime()

    private var typeForExtension = [String: String]()
    private var extensionForType = [String: String]()

    private init() {
        loadTypesFile(filePath: "mime")
        loadTypesFile(filePath: "node")
    }

    public func define(extensionsForType: [String: [String]]) {
        for (type, extensions) in extensionsForType {
            for ext in extensions {
                typeForExtension[ext] = type
            }
            extensionForType[type] = extensions[0]
        }
    }

    private func loadTypesFile(filePath: String) {
        let path =  Bundle(for: object_getClass(self)).path(forResource: filePath, ofType: "types")
        guard let content = try? NSString(contentsOfFile:path!, encoding: String.Encoding.utf8.rawValue) else { return }

        var extensionsForType = [String: [String]]()
        let lines = content.components(separatedBy: "\n")
        for line in lines {
            if line.hasPrefix("#") {
                continue
            }
            
            let fields = line.replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression).components(separatedBy: " ")
            
            if let type = fields.first , !type.isEmpty && fields.count > 1 {
                extensionsForType[type] = Array(fields[1 ..< fields.count])
            }
        }
        define(extensionsForType: extensionsForType)
    }

    public func lookupType(path: String) -> String? {
        let newPath = path.replacingOccurrences(of: ".*[\\.\\/\\\\]", with: "", options: .regularExpression)

        let ext = newPath.lowercased()
        return typeForExtension[ext]
    }

    public func lookupExtension(mimeType: String) -> String? {
        return extensionForType[mimeType]
    }
}