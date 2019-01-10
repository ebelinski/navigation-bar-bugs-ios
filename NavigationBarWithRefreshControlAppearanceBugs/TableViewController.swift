import UIKit

class TableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "Test"
    navigationController?.navigationBar.barTintColor = UIColor.lightGray

    // Disable one of the two following lines to eliminate the UI issues
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.isTranslucent = false

    refreshControl = UIRefreshControl()
    refreshControl?.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
  }

  @objc func didPullToRefresh(_ sender: UIRefreshControl) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // 3 second delay
      self.refreshControl?.endRefreshing()
    }
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 30
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = "Foo Bar"
    return cell
  }

}
