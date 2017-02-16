#!/usr/bin/swift

//
//  main.swift
//  MySecondScript
//
//  Created by Ginny Pennekamp on 2/15/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation

// Command Line
let arguments = CommandLine.arguments
//Filemanager
let fileManager = FileManager.default

var dirName = ""

if arguments.count == 1 {
    print("I need your name.")
    exit(0)
} else {
    dirName = arguments[1]
}

// Filemanager
print("Give me another name:")

let otherName = readLine()
let path = "/Users/Ginny/Desktop/\(dirName)/"

if let otherName = otherName {
    let filePath = path.appending(otherName)
    
    // check to see that the directory doesn't already exist
    guard !fileManager.fileExists(atPath: filePath) else {
        print("File or Directory already exists as path: \(filePath)")
        exit(0)
    }
    
    // create the new directory
    do {
        try FileManager.default.createDirectory(atPath: filePath, withIntermediateDirectories: true, attributes: nil)
    } catch {
        print("Directory \(dirName) was not created: \(error)")
        exit(0)
    }
}
