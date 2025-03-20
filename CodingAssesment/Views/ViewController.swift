import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var viewModel: CountryViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.ViewControllerIdentifiers.countryCellNibName, bundle: nil), forCellReuseIdentifier: Constants.ViewControllerIdentifiers.CellForCellReuseIdentifier)

        viewModel?.onDataUpdated = { [weak self] in
            self?.tableView.reloadData()
        }

        viewModel?.fetchCountries() // Fetch API data
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ViewControllerIdentifiers.CellForCellReuseIdentifier, for: indexPath) as? CountryCell,
                  let cellViewModel = viewModel?.viewModelForCell(at: indexPath.row) else {
            fatalError(Constants.Errors.countryCellNotFound)
            }
            
            cell.configure(with: cellViewModel)
            return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126 // Adjust as needed
    }
}
