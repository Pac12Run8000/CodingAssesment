import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var viewModel: CountryViewModel?
//    private var viewModel = CountryViewModel()
//    private var viewModel = CountryViewModel(dataProvider: MockDataProvider())

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")

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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell,
                  let cellViewModel = viewModel?.viewModelForCell(at: indexPath.row) else {
                fatalError("CountryCell not found")
            }
            
            cell.configure(with: cellViewModel)
            return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126 // Adjust as needed
    }
}
