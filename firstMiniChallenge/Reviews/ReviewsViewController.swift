

import UIKit

class ReviewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //Array of Reviews
    var reviews:[String] =
        [
            "This lady is amazing. She knows what she is doing and she is great at it. She asked us our interests and set up the whole trip based our interests. She knows the city very well. She is definetely the right guide for anyone. I would definitely recommend her."
            , "This guide is the best guide that you can get. She is the best at what she does. She knows her city quite well. Her knowledge about the monuments of the city is very deep. She has definitely earned by recommendation."
            , "Not a bad guide. She does seem like a she knows a lot about the city but it was hard for me understand her at time. May be she needs to work on her english a bit."
        ]
    var nameOfReviewers:[String] = ["Janet Ghelani", "Jane Moreano", "Amber Abdullah"]
    var ratings:[Double] = [4.0, 4.5, 3.5]
    var imageNames:[String] = ["Janet", "Jane", "Amber"]
    
    //Properties for ReView Body
    var fontSize = 13
    
    @IBAction func closeReview(_ sender: Any) {
        //self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //print("counter is " + String(reviews.count))
        return reviews.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        //Properties for Name of the Reviewer
        cell.nameOfTheReviewer.text = nameOfReviewers[indexPath.row]
        cell.nameOfTheReviewer.preferredMaxLayoutWidth = UITableViewAutomaticDimension
        
        //Properties for Review Body
        cell.reviewBody.text = reviews[indexPath.row]
        cell.reviewBody.font = cell.reviewBody.font.withSize(CGFloat(fontSize))
        cell.reviewBody.numberOfLines = 0
    
        //Properties for Star Ratings
        cell.starRatings.rating = ratings[indexPath.row]
        cell.starRatings.filledColor = UIColor.blue
        cell.starRatings.filledBorderColor = UIColor.blue
        cell.starRatings.emptyBorderColor = UIColor.blue
        cell.starRatings.emptyBorderWidth = 0.25
        
        //Properties  for User Image
        cell.userImage.image = UIImage(named: imageNames[indexPath.row])
        
        // Properties for Cell
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        
        //tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
