//: [Previous](@previous)

//Test for datya model, Used in NBA Questions Playground.

import Foundation

func csv(data: String) -> [String] {
    var result: [String] = []
    result = data.components(separatedBy: "\n")
    return result
}

func readDataFromCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }

func cleanRows(file:String)->String{
    var cleanFile = file
    cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
    cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
    return cleanFile
}

var data = readDataFromCSV(fileName: "nba_finals", fileType: "csv")
data = cleanRows(file: data!)
let csvRows = csv(data: data!)


//For STRUCT AND DICTIONARY:
struct NBAChampion {
    
    var champ: String
    var loser: String
    var wVL: String
    var mVP: String? = nil
}

var finalDict: [String: NBAChampion] = [:]

for words in csvRows {
    if words.isEmpty {
        continue
    }
    let wordArray = words.components(separatedBy: ",")

    if wordArray.count == 5 {
        finalDict[wordArray[0]] = NBAChampion(champ: wordArray[1], loser: wordArray[2], wVL: wordArray[3], mVP: wordArray[4])
    } else {
        finalDict[wordArray[0]] = NBAChampion(champ: wordArray[1], loser: wordArray[2], wVL: wordArray[3])
    }
}
                         
//print(finalDict["2018"])

for (key, value) in finalDict {
    if "Los Angeles Lakers" == value.champ {
        print((key),(value.champ),(value.loser),(value.wVL),(value.mVP) ?? "No MVP")
    }
}


//var dict1: [String: NBAChampion] = [
//    "1991":NBAChampion(champ: "Chicago Bulls", loser: "Lakers", WvL: "4-1"),
//    "1992":NBAChampion(champ: "Chicago Bulls", loser: "Portland", WvL: "4-2"),
//    "1993":NBAChampion(champ: "Chicago Bulls", loser: "Suns", WvL: "4-2"),
//    "1994":NBAChampion(champ: "Houston Rockets", loser: "Knicks", WvL: "4-3")
//]
//
//for (key, value) in dict1 {
//    if value.champ == "Chicago Bulls" {
//        print(key, value.loser)
//    }
//}


//var testArray: [NBAChampion] = []

//worked to make an array:
//for words in csvRows {
//    if words.isEmpty {
//        continue
//    }
//    let wordArray = words.components(separatedBy: ",")
//
//    if wordArray.count == 5 {
//        testArray.append(NBAChampion(champ: wordArray[1], loser: wordArray[2], wVL: wordArray[3], MVP: wordArray[4]))
//    } else {
//        testArray.append(NBAChampion(champ: wordArray[1], loser: wordArray[2], wVL: wordArray[3]))
//    }
//}
