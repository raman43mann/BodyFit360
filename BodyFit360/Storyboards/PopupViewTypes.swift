
//
//  PopupViewTypes+.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh 
//
//


import UIKit

enum PopupSize {
    case chooseMuscle, selectedMuscle, muscleCategory, excerciseProcess, bewarePopup

    var height: CGFloat {
        switch self {
        case .chooseMuscle, .selectedMuscle: return 220
        case .muscleCategory: return 600
        case .excerciseProcess: return 350
        case .bewarePopup: return 300
        }
    }
}

enum PopupState {
    case open, closed

    func yPosition(forHeight height: CGFloat) -> CGFloat {
        return self == .open ? UIScreen.main.bounds.height - height : UIScreen.main.bounds.height
    }
}
 
class PopupViewTypes: UIView, UITableViewDelegate, UITableViewDataSource {

    struct UIConstants {
        struct TableViewCellName {
            static let tblCellIdentifier = "ExcerciseCell"
        }
    }

    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var viewPlayerControls: UIStackView!
    @IBOutlet weak var chooseMuscleLabel: UILabel!
    @IBOutlet weak var viewArrowControl: UIView!
    @IBOutlet weak var btnArrowControl: UIButton!
    @IBOutlet weak var excersieTableView: UITableView!
    @IBOutlet weak var vwChooseMuscle: UIView!
    @IBOutlet weak var vwChooseCategory: UIView!
    @IBOutlet weak var vwProgress: UIView!
  
    @IBOutlet weak var topHeadingProgress: UIView!
    @IBOutlet weak var stepSlider: StepIndicatorView!
    @IBOutlet weak var progressTitleLabel: UILabel!
    @IBOutlet weak var progressDescriptionLabel: UILabel!
    @IBOutlet weak var progressTimerLabel: UILabel!

    @IBOutlet weak var viewProgressTimerContainer: UIView!
    @IBOutlet weak var lblProgressStepCount: UILabel!
    @IBOutlet weak var btnProgressWarning: UIButton!
    @IBOutlet weak var topConstraintForPremium: NSLayoutConstraint!
    
    @IBOutlet weak var btnPremium: UIButton!
    
    @IBOutlet weak var viewBlurry: UIView!
    
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var btnPlayPause: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var btnBewareWarningTop: UIButton!
    
    @IBOutlet weak var btnBewareCrossTop: UIButton!
    
    // MARK: - Properties
    private let kCONTENT_XIB_NAME = "PopupViewTypes"
    private var excerciseList = ["Back shoulder","Front shoulder","Side shoulder","Whole shoulder"]
    private var excerciseProcessOpened = true
    var currentState: PopupState = .closed
    var popupSize: PopupSize = .chooseMuscle
    var titleChooseAnyMuscle = "Choose any muscle"
    var muscle: String? = "Selected Muscle"
    
    // MARK: - Initializers
    init(size: PopupSize) {
        let frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: size.height)
        self.popupSize = size
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: - View Setup
    private func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        guard let contentView = contentView else {
            print("Error: contentView is nil")
            return
        }
        contentView.fixInView(self)
        contentView.backgroundColor = .clear

        configureStepSlider()
        excersieTableView.register(UINib(nibName: UIConstants.TableViewCellName.tblCellIdentifier, bundle: nil), forCellReuseIdentifier: UIConstants.TableViewCellName.tblCellIdentifier)
        excersieTableView.delegate = self
        excersieTableView.dataSource = self
        updateView()
        
    }

    private func configureStepSlider() {
        stepSlider.numberOfSteps = 5
        stepSlider.currentStep = 2
        stepSlider.circleColor = .lightGray
        stepSlider.circleTintColor = .green
        stepSlider.circleStrokeWidth = 3.0
        stepSlider.circleRadius = 10.0
        stepSlider.lineColor = stepSlider.circleColor
        stepSlider.lineTintColor = stepSlider.circleTintColor
        stepSlider.lineMargin = 4.0
        stepSlider.lineStrokeWidth = 2.0
        stepSlider.displayNumbers = true
        stepSlider.showFlag = false
        stepSlider.direction = .leftToRight
    }

    // MARK: - UITableViewDataSource & UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return excerciseList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = excersieTableView.dequeueReusableCell(withIdentifier: UIConstants.TableViewCellName.tblCellIdentifier, for: indexPath) as? ExcerciseCell else {
            return UITableViewCell()
        }
        cell.excersicelabel.text = excerciseList[indexPath.row]
        cell.excercisecount.text = "\(indexPath.row + 1)"
        cell.seprator.isHidden = indexPath.row == excerciseList.count - 1
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        popupSize = .excerciseProcess
        updateView()
        animatePopup(toHeight: popupSize.height)
    }

    // MARK: - Button Actions
    @IBAction func btnArrowControl(_ sender: Any) {
        switch popupSize {
        case .selectedMuscle:
            popupSize = .muscleCategory
            updateView()
            animatePopup(toHeight: popupSize.height)
        case .muscleCategory:
            seletedMethod()
        case .excerciseProcess:
            toggleExcerciseProcessView()
        case .bewarePopup:
            popupSize = .excerciseProcess
            updateView()
            animatePopup(toHeight: popupSize.height)
        default:
            break
        }
    }

    @IBAction func btnPlayerAction(_ sender: UIButton) {
        
        if btnPrevious == sender{
           
        }else if btnPlayPause == sender{
            
        }else if btnNext == sender{
           
        }else{
            
        }
    }
    
    @IBAction func btnPremium(_ sender: UIButton) {
        viewBlurry.isHidden = true

    }

    @IBAction func btnBewareWarning(_ sender: UIButton) {
    }
    
    @IBAction func btnBewareCross(_ sender: UIButton) {
        popupSize = .excerciseProcess
        updateView()
        animatePopup(toHeight: popupSize.height)
        
    }
    @IBAction func btnProgressWarning(_ sender: UIButton) {
        popupSize = .bewarePopup
        updateView()
        animatePopup(toHeight: popupSize.height)
    }
    // MARK: - Helper Methods
    
    func seletedMethod(){
        excerciseProcessOpened = false
        toggleExcerciseProcessView()
        
        popupSize = .selectedMuscle
        updateView()
        animatePopup(toHeight: popupSize.height)
    }
    
    
    func updateView() {
            viewPlayerControls.isHidden = !(popupSize == .excerciseProcess || popupSize == .bewarePopup)
            vwProgress.isHidden = !(popupSize == .excerciseProcess || popupSize == .bewarePopup)
            vwChooseMuscle.isHidden = !(popupSize == .chooseMuscle || popupSize == .selectedMuscle)
            vwChooseCategory.isHidden = popupSize != .muscleCategory
            viewArrowControl.isHidden = !(popupSize == .selectedMuscle || popupSize == .muscleCategory || popupSize == .excerciseProcess || popupSize == .bewarePopup)
            btnArrowControl.isHidden = viewArrowControl.isHidden

            viewBlurry.isHidden = true
            stepSlider.isHidden = false
            progressTimerLabel.isHidden = false
            viewProgressTimerContainer.isHidden = false
        
            btnBewareWarningTop.isHidden = true
            btnBewareCrossTop.isHidden = true
           
            progressTitleLabel.font = UIFont.systemFont(ofSize: 17,weight: .medium)
        
            switch popupSize {
            case .chooseMuscle:
                chooseMuscleLabel.text = titleChooseAnyMuscle
                chooseMuscleLabel.font = UIFont(name: "Plus Jakarta Sans Italic", size: 20)

            case .selectedMuscle:
                chooseMuscleLabel.text = muscle
                chooseMuscleLabel.font = UIFont(name: "Plus Jakarta Sans Bold", size: 20)
                btnArrowControl.setImage(UIImage(named: BFImageNames.arrowUp), for: .normal)
                
            case .muscleCategory:
                btnArrowControl.setImage(UIImage(named: BFImageNames.arrowDown), for: .normal)
                viewBlurry.isHidden = true
                topConstraintForPremium.constant = 52
                excersieTableView.isScrollEnabled = false
                
            case .excerciseProcess:
                btnProgressWarning.isHidden = false
                lblProgressStepCount.isHidden = false
                lblProgressStepCount.text = "set\n\("1/4")"
                progressDescriptionLabel.text = "Rotate your body 10 times"
                
            case .bewarePopup:
                viewProgressTimerContainer.isHidden = true
                btnProgressWarning.isHidden = true
                lblProgressStepCount.isHidden = true
                btnBewareWarningTop.isHidden = false
                btnBewareCrossTop.isHidden = false
                
                stepSlider.isHidden = true
                progressTimerLabel.isHidden = true
                
                progressDescriptionLabel.text = "Beaware not to rotate your body too much\n\nAlways consult your medical professional to ensure it is safe and appropriate for your individual health needs."
                progressDescriptionLabel.numberOfLines = 0
                progressDescriptionLabel.font = UIFont.systemFont(ofSize: 14,weight: .regular)
          
                
            }
        }

    private func toggleExcerciseProcessView() {
        progressTitleLabel.text = muscle
        excerciseProcessOpened.toggle()
        viewPlayerControls.isHidden = !excerciseProcessOpened
        progressTitleLabel.isHidden = !excerciseProcessOpened
        topHeadingProgress.isHidden = !excerciseProcessOpened
        progressDescriptionLabel.isHidden = !excerciseProcessOpened
        btnProgressWarning.isHidden = !excerciseProcessOpened
        lblProgressStepCount.isHidden = !excerciseProcessOpened
        btnArrowControl.setImage(UIImage(named: excerciseProcessOpened ? BFImageNames.arrowDown : BFImageNames.arrowUp), for: .normal)
        animatePopup(toHeight: excerciseProcessOpened ? popupSize.height : 250)
        
        
    }

     func animatePopup(toHeight height: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            self.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - height, width: UIScreen.main.bounds.width, height: height)
        }
    }

    // Method to toggle the popup state
    func togglePopup() {
        let newState: PopupState = currentState == .closed ? .open : .closed
        UIView.animate(withDuration: 0.5) {
            self.frame.origin.y = newState.yPosition(forHeight: self.popupSize.height)
        } completion: { _ in
            self.currentState = newState
        }
    }
}

// MARK: - UIView Extension
extension UIView {
    func fixInView(_ container: UIView!) {
        self.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            self.topAnchor.constraint(equalTo: container.topAnchor),
            self.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
}

