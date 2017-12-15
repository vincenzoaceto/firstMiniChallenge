

import UIKit

class ReviewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var reviews:[String] = ["THE SOFTWARE IS PROVIDED \"AS IS\" WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE", "Review 2", "Review 3"]
    var nameOfReviewers:[String] = ["Janet Ghelani", "Jane Moreano", "Amber Abdullah"]
    var ratings:[Double] = [3.6, 4.2, 4.7]
    var imageNames:[String] = ["Janet", "Jane", "Amber"]
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        cell.nameOfTheReviewer.text = nameOfReviewers[indexPath.row]
        cell.reviewBody.text = reviews[indexPath.row]
        cell.reviewBody.font = cell.reviewBody.font.withSize(13)
        cell.reviewBody.preferredMaxLayoutWidth = UITableViewAutomaticDimension
        cell.reviewBody.numberOfLines = 0
        
        cell.starRatings.rating = ratings[indexPath.row]
        cell.userImage.image = UIImage(named: imageNames[indexPath.row])
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        
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
