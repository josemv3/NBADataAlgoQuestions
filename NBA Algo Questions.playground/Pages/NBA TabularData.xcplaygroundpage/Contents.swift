//: [Previous](@previous)

import UIKit
import TabularData

//Couldnt get this to work.

//let filepath = URL(string: Bundle.main.path(forResource: "nba_finals", ofType: "csv")!)

//let data = try Data(contentsOf: filepath!)

func readDataFromCSV()-> Data!{
        guard let filepath = Bundle.main.path(forResource: "nba_finals", ofType: "csv")
            else {
                return nil
        }
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .utf8)
            return Data(contents.utf8)
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
let data = readDataFromCSV()
var CSVReading = CSVReadingOptions(nilEncodings: [], ignoresEmptyLines: false, usesQuoting: false)

var table = try! DataFrame(csvData: data!)


let summary = table.summary()

print(summary)

//let data =
//"""
//Year,Winner,Loser,Score,MVP
//2019,Toronto Raptors,Golden State Warriors,4-2,Kawhi Leonard
//2018,Golden State Warriors,Cleveland Cavaliers,4-0,Kevin Durant
//2017,Golden State Warriors,Cleveland Cavaliers,4-1,Kevin Durant
//2016,Cleveland Cavaliers,Golden State Warriors,4-3,LeBron James
//2015,Golden State Warriors,Cleveland Cavaliers,4-2,Andre Iguodala
//2014,San Antonio Spurs,Miami Heat,4-1,Kawhi Leonard
//2013,Miami Heat,San Antonio Spurs,4-3,LeBron James
//2012,Miami Heat,Oklahoma City Thunder,4-1,LeBron James
//2011,Dallas Mavericks,Miami Heat,4-2,Dirk Nowitzki
//2010,Los Angeles Lakers,Boston Celtics,4-3,Kobe Bryant
//2009,Los Angeles Lakers,Orlando Magic,4-1,Kobe Bryant
//2008,Boston Celtics,Los Angeles Lakers,4-2,Paul Pierce
//2007,San Antonio Spurs,Cleveland Cavaliers,4-0,Tony Parker
//2006,Miami Heat,Dallas Mavericks,4-2,Dwyane Wade
//2005,San Antonio Spurs,Detroit Pistons,4-3,Tim Duncan
//2004,Detroit Pistons,Los Angeles Lakers,4-1,Chauncey Billups
//2003,San Antonio Spurs,New Jersey Nets,4-2,Tim Duncan
//2002,Los Angeles Lakers,New Jersey Nets,4-0,Shaquille O'Neal
//2001,Los Angeles Lakers,Philadelphia 76ers,4-1,Shaquille O'Neal
//2000,Los Angeles Lakers,Indiana Pacers,4-2,Shaquille O'Neal
//1999,San Antonio Spurs,New York Knicks,4-1,Tim Duncan
//1998,Chicago Bulls,Utah Jazz,4-2,Michael Jordan
//1997,Chicago Bulls,Utah Jazz,4-2,Michael Jordan
//1996,Chicago Bulls,Seattle SuperSonics,4-2,Michael Jordan
//1995,Houston Rockets,Orlando Magic,4-0,Hakeem Olajuwon
//1994,Houston Rockets,New York Knicks,4-3,Hakeem Olajuwon
//1993,Chicago Bulls,Phoenix Suns,4-2,Michael Jordan
//1992,Chicago Bulls,Portland Trail Blazers,4-2,Michael Jordan
//1991,Chicago Bulls,Los Angeles Lakers,4-1,Michael Jordan
//1990,Detroit Pistons,Portland Trail Blazers,4-1,Isiah Thomas
//1989,Detroit Pistons,Los Angeles Lakers,4-0,Joe Dumars
//1988,Los Angeles Lakers,Detroit Pistons,4-3,James Worthy
//1987,Los Angeles Lakers,Boston Celtics,4-2,Magic Johnson
//1986,Boston Celtics,Houston Rockets,4-2,Larry Bird
//1985,Los Angeles Lakers,Boston Celtics,4-2,Kareem Abdul-Jabbar
//1984,Boston Celtics,Los Angeles Lakers,4-3,Larry Bird
//1983,Philadelphia 76ers,Los Angeles Lakers,4-0,Moses Malone
//1982,Los Angeles Lakers,Philadelphia 76ers,4-2,Magic Johnson
//1981,Boston Celtics,Houston Rockets,4-2,Cedric Maxwell
//1980,Los Angeles Lakers,Philadelphia 76ers,4-2,Magic Johnson
//1979,Seattle SuperSonics,Washington Bullets,4-1,Dennis Johnson
//1978,Washington Bullets,Seattle SuperSonics,4-3,Wes Unseld
//1977,Portland Trail Blazers,Philadelphia 76ers,4-2,Bill Walton
//1976,Boston Celtics,Phoenix Suns,4-2,Jo Jo White
//1975,Golden State Warriors,Washington Bullets,4-0,Rick Barry
//1974,Boston Celtics,Milwaukee Bucks,4-3,John Havlicek
//1973,New York Knicks,Los Angeles Lakers,4-1,Willis Reed
//1972,Los Angeles Lakers,New York Knicks,4-1,Wilt Chamberlain
//1971,Milwaukee Bucks,Baltimore Bullets,4-0,Lew Alcindor
//1970,New York Knicks,Los Angeles Lakers,4-3,Willis Reed
//1969,Boston Celtics,Los Angeles Lakers,4-3,Jerry West
//1968,Boston Celtics,Los Angeles Lakers,4-2,
//1967,Philadelphia 76ers,San Francisco Warriors,4-2,
//1966,Boston Celtics,Los Angeles Lakers,4-3,
//1965,Boston Celtics,Los Angeles Lakers,4-1,
//1964,Boston Celtics,San Francisco Warriors,4-1,
//1963,Boston Celtics,Los Angeles Lakers,4-2,
//1962,Boston Celtics,Los Angeles Lakers,4-3,
//1961,Boston Celtics,St. Louis Hawks,4-1,
//1960,Boston Celtics,St. Louis Hawks,4-3,
//1959,Boston Celtics,Minneapolis Lakers,4-0,
//1958,St. Louis Hawks,Boston Celtics,4-2,
//1957,Boston Celtics,St. Louis Hawks,4-3,
//1956,Philadelphia Warriors,Fort Wayne Pistons,4-1,
//1955,Syracuse Nationals,Fort Wayne Pistons,4-3,
//1954,Minneapolis Lakers,Syracuse Nationals,4-3,
//1953,Minneapolis Lakers,New York Knickerbockers,4-1,
//1952,Minneapolis Lakers,New York Knickerbockers,4-3,
//1951,Rochester Royals,New York Knickerbockers,4-3,
//1950,Minneapolis Lakers,Syracuse Nationals,4-2,
//1949,Minneapolis Lakers,Washington Capitols,4-2,
//1948,Baltimore Bullets,Philadelphia Warriors,4-2,
//1947,Philadelphia Warriors,Chicago Stags,4-1,
//""".data(using: .utf8)!
//
//let table = try! DataFrame(csvData: data)
//
//let summary = table.columns
