# Set table view into editing mode

``` Swift
let rightButton = UIBarButtonItem(title: "Edit",
                                  style: .plain,
                                  target: self,
                                  action: #selector(showEditing(sender:)))
self.navigationItem.rightBarButtonItem = rightButton

// modify isEditing
@objc func showEditing(sender: UIBarButtonItem) {
    if (self.tableView.isEditing == true) {
        self.tableView.isEditing = false
        self.navigationItem.rightBarButtonItem?.title = "Done"
    } else {
        self.tableView.isEditing = true
        self.navigationItem.rightBarButtonItem?.title = "Edit"
    }
}

// call setEditing() function
@objc func showEditing(sender: UIBarButtonItem) {
    self.tableView.setEditing(!self.tableView.isEditing, animated: true)
    self.navigationItem.rightBarButtonItem?.title = self.tableView.isEditing ? "Done" : "Edit"
}
```
