import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!

    func configure(with viewModel: CountryCellViewModel) {
        nameLabel.text = viewModel.countryName
        regionLabel.text = "Region: \(viewModel.region)"
        capitalLabel.text = "Capital: \(viewModel.capital)"
        codeLabel.text = "Code: \(viewModel.code)"
    }
}

