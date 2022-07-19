import UIKit

//Test to get data into an array, with each line of data separated by commas (columns)

func csv(data: String) -> [String] {
    var result: [String] = []
    result = data.components(separatedBy: "\n")
//    for row in rows {
//        let columns = row.components(separatedBy: ";")
//        result.append(columns)
//    }
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
print(csvRows[73])
