import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    private var viewModel: CountryViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = CountryViewModel(dataProvider: CountryDataManager())
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.numberOfCountries()
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        let country = viewModel.country(at: indexPath.row)
        cell.configure(with: country)  
        print("Cell height for row \(indexPath.row): \(cell.frame.height)")

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126  // Set this to your preferred height
    }



}

