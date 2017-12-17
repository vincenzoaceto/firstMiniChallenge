

import UIKit

class ReviewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //Array of Reviews
    var reviews:[String] =
        [
            "THE SOFTWARE IS PROVIDED \"AS IS\" WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. DONE."
            , "TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
            , "Review 3"
        ]
    var nameOfReviewers:[String] = ["Janet Ghelani", "Jane Moreano", "Amber Abdullah"]
    var ratings:[Double] = [3.6, 4.2, 4.7]
    var imageNames:[String] = ["Janet", "Jane", "Amber"]
    
    //Properties for ReView Body
    var fontSize = 13
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("counter is " + String(reviews.count))
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
        
        //Properties  for User Image
        cell.userImage.image = UIImage(named: imageNames[indexPath.row])
        
        // Properties for Cell
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
