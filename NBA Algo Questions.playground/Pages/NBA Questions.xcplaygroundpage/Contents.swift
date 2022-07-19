
import Foundation

func nbaFinalsCsvToString(data: String) -> [String] {
    var result: [String] = []
    result = data.components(separatedBy: "\n")
    return result
}

func readDataFromNbaFinalsCSV(fileName: String, fileType: String) -> String? {
    guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
    else {
        return nil
    }
    do {
        var contents = try String(contentsOfFile: filepath, encoding: .utf8)
        contents = removeEmptyRows(file: contents)
        return contents
    } catch {
        print("File Read Error for file \(filepath)")
        return nil
    }
}

func removeEmptyRows(file: String) -> String {
    var cleanFile = file
    cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
    cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
    return cleanFile
}

var nbaCsvData = readDataFromNbaFinalsCSV(fileName: "nba_finals", fileType: "csv")
nbaCsvData = removeEmptyRows(file: nbaCsvData!)
let nBAFinalsCsvRows = nbaFinalsCsvToString(data: nbaCsvData!)

//For STRUCT AND DICTIONARY:
struct NBAFinals {
    
    var year: String
    var champ: String
    var loser: String
    var wVsL: String
    var mvp: String? = nil
    
    init(inputArray: [String]) {
        
        year = inputArray[0]
        champ = inputArray[1]
        loser = inputArray[2]
        wVsL = inputArray[3]
        
        if inputArray.count == 5 {
            mvp = inputArray[4]
        }
    }
}

var nBAFinalsDict: [String: NBAFinals] = [:]

for words in nBAFinalsCsvRows {
    if words.isEmpty {
        continue
    }
    let wordArray = words.components(separatedBy: ",")
    
    let nBAFinals = NBAFinals(inputArray: wordArray)
    
    nBAFinalsDict[nBAFinals.year] = nBAFinals
}


//*********** Question Number 1 **************
//Write a function that takes as an argument a year and returns the winner of the NBA finals that year.

func findNBAChampByYear(year: Int) -> String? {
    let foundChamp = nBAFinalsDict[String(year)]
    return foundChamp?.champ
}
findNBAChampByYear(year: 1965)

func findNBAChampByYear2(year: String) -> String? {
    nBAFinalsDict[year]?.champ
}


//*********** Question Number 2 **************
//Write a function that takes as an argument a team name and returns an array of all of the years the team has won the NBA finals.

func findChampionshipYearsPerTeam(team: String) -> [String] {
    var championshipYears: [String] = [team]
    for (key, value) in nBAFinalsDict {
        if value.champ.contains(team)   {
            championshipYears.append(key)
        }
    }
    print(championshipYears)
    return championshipYears.sorted()
}
findChampionshipYearsPerTeam(team: "Knicks")


//*********** Question Number 3 **************
//Which teams have made it to the NBA finals but have never won?

func finalsTeamsNeverWon() -> [String] {
    var winnersSet: Set<String> = []
    var losersSet: Set<String> = []
    var finalsTeamsThatNeverWon: [String] = []
    
    for (_, value) in nBAFinalsDict {
        winnersSet.insert(value.champ)
        losersSet.insert(value.loser)
    }
    
    for loser in losersSet {
        
        if winnersSet.contains(loser) {
            continue
        } else {
            finalsTeamsThatNeverWon.append(loser)
        }
    }
    return finalsTeamsThatNeverWon
}
finalsTeamsNeverWon()


//*********** Question Number 4 **************
//Print out a ranking of who has won the MVP more than once, by times won, e.g. this output:
//    - 6 times: Michael Jordan

func findMVPWinnerCounts(dict: [String: NBAFinals]) {
    var basketballMVPCounts: [String: Int] = [:]
    
    for (_, value) in dict {
        
        if basketballMVPCounts.isEmpty {
            basketballMVPCounts[value.mvp!] = 1
            continue
        }
        if basketballMVPCounts[value.mvp!] == nil {
            basketballMVPCounts[value.mvp!] = 1
        } else {
            basketballMVPCounts[value.mvp!]! += 1
        }
    }
    print(basketballMVPCounts)
}
findMVPWinnerCounts(dict: nBAFinalsDict)
