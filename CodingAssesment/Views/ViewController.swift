import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    
    let countries: [Country] = [
        Country(name: "Canada", region: "North America", capital: "Ottawa", code: "CAN"),
        Country(name: "Germany", region: "Europe", capital: "Berlin", code: "DEU"),
        Country(name: "Japan", region: "Asia", capital: "Tokyo", code: "JPN"),
        Country(name: "Brazil", region: "South America", capital: "Brasília", code: "BRA")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        
        // Assuming you have a Country model, configure the cell
        let country = countries[indexPath.row]
        cell.configure(with: country)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126  // Set this to your preferred height
    }



}

