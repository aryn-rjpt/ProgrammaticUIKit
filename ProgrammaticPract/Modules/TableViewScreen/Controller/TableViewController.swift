import UIKit

struct Cells {
    static let videoCell = "CustomTableViewCell"
}


class TableViewController: UIViewController {

    var tableView = UITableView() 
    
    func fetchData() -> [Video] {
           let video1 = Video(image: UIImage(named: "test")!, title: "No Storyboards")
           let video2 = Video(image: UIImage(named: "test")!, title: "5 Soft Skills For Developers")
           let video3 = Video(image: UIImage(named: "test")!, title: "What's New in Xcode 11")
           let video4 = Video(image: UIImage(named: "test")!, title: "Patreon Revamp")
           let video5 = Video(image: UIImage(named: "test")!, title: "How I Got a Raise. $60k - $100k")
           let video6 = Video(image: UIImage(named: "test")!, title: "Shake Gesture")
           let video7 = Video(image: UIImage(named: "test")!, title: "2019 State of Salaries")
           let video8 = Video(image: UIImage(named: "test")!, title: "How to Build Your App Wirelessly")
           let video9 = Video(image: UIImage(named: "test")!, title: "Swift News 70")
           let video10 = Video(image: UIImage(named: "test")!, title: "The 90/90 Rule")
           
           return [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10]
    }
    
    var videos: [Video] = []
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        title = "Some videos "
        
        
        
        configTableView()
        
        videos = fetchData()
        
        

    }
    
    func configTableView() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = .yellow
        
        // set delegates
        setTableViewDelegates()
        
        // set row height
        tableView.rowHeight = 100
        
        // register cells
        tableView.register(CustomTableViewCell.self , forCellReuseIdentifier:  Cells.videoCell)
        
        // set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! CustomTableViewCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
    
    
}
