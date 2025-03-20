import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!

    func configure(with country: Country) {
        nameLabel.text = country.name
        regionLabel.text = "Region: \(country.region)"
        capitalLabel.text = "Capital: \(country.capital)"
        codeLabel.text = "Code: \(country.code)"
    }
}

