import Foundation

struct Constants {
    
    struct Url {
        static let scheme = "https"
        static let hostGist = "gist.githubusercontent.com"
        static let pathGist = "/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
    }
    
    struct Storyboard {
        static let main = "Main"
    }
    
    struct ViewControllerIdentifiers {
        static let viewController = "ViewController"
        static let countryCellNibName = "CountryCell"
        static let CellForCellReuseIdentifier = "CountryCell"
    }
    
    struct Errors {
        static let viewControllerNotFound = "ViewController not found in Storyboard"
        static let countryCellNotFound = "CountryCell not found"
    }
}

