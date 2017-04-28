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

open class SwiftMime {

    open static let sharedManager = SwiftMime()

    fileprivate var typeForExtension = [String: String]()
    fileprivate var extensionForType = [String: String]()

    fileprivate init() {
        loadTypesFile("types")
    }

    open func define(_ extensionsForType: [String: [String] ]) {
        for (type, extensions) in extensionsForType {
            for ext in extensions {
                typeForExtension[ext] = type
            }
            extensionForType[type] = extensions[0]
        }
    }

    fileprivate func loadTypesFile(_ filePath: String) {
        do {
            let path =  Bundle(for: type(of: self)).path(forResource: filePath, ofType: "json") ?? ""
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let object = json as? [String: [String]] {
                // json is a dictionary
                define(object)
            }
        } catch {
             assert(true, (error.localizedDescription))
        }
    }

    open class func mime(_ path: String) -> String? {
        let newPath = path.replacingOccurrences(of: ".*[\\.\\/\\\\]", with: "", options: .regularExpression)

        let ext = newPath.lowercased()
        return SwiftMime.sharedManager.typeForExtension[ext]
    }

    open class func ext(_ mimeType: String) -> String? {
        return SwiftMime.sharedManager.extensionForType[mimeType]
    }
}
