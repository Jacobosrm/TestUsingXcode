//
//  ViewController.swift
//  JR-Controls and TextViews
//
//  Created by Jacobo Ramirez on 13/04/23.
//

import UIKit

class ViewController: UIViewController {

//OUTLETS
    
    
    @IBOutlet weak var myFirstButton: UIButton!
    @IBOutlet weak var myFirstPickerView: UIPickerView!
    @IBOutlet weak var myFirstPageControl: UIPageControl!
    @IBOutlet weak var myFirstSegmentedControl: UISegmentedControl!
    
    
//    Variables
    
    private let myPickerViewArray = ["Jacobo", "Sebastian", "Ramirez", "Mendizabal"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        BUTTONS
        myFirstButton.setTitle("Hola", for: .normal)
        myFirstButton.backgroundColor = .cyan
        myFirstButton.setTitleColor(.blue, for: .normal)
        
//        PICKERS
        myFirstPickerView.backgroundColor = .darkGray
        myFirstPickerView.dataSource = self
        myFirstPickerView.delegate = self
        
//        PAGES CONTROLS
        myFirstPageControl.numberOfPages = myPickerViewArray.count
        myFirstPageControl.currentPageIndicatorTintColor = .blue
        myFirstPageControl.pageIndicatorTintColor = .black
        
//        SEGMENTED CONTROLS
        
        myFirstSegmentedControl.removeAllSegments()
        
        for (index, value) in myPickerViewArray.enumerated(){
            
            myFirstSegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        
        
        
        
        
    }
    
//    ACTIONS

    @IBAction func pressedMyFirstButton(_ sender: UIButton) {
        
        if myFirstButton.backgroundColor == .cyan {
            myFirstButton.backgroundColor = .gray
        }else{
            myFirstButton.backgroundColor = .cyan
        }
    }
    
    
    @IBAction func slideMyFirstPageControl(_ sender: UIPageControl) {
        
        myFirstPickerView.selectRow(myFirstPageControl.currentPage, inComponent: 0, animated: true)
        
        let varString = myPickerViewArray[myFirstPageControl.currentPage]
        myFirstButton.setTitle(varString, for: .normal)
        
        myFirstSegmentedControl.selectedSegmentIndex = myFirstPageControl.currentPage
    }
    
    
    @IBAction func selectMyFirstSegmentControl(_ sender: UISegmentedControl) {
        
        myFirstPickerView.selectRow(myFirstSegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let varString = myPickerViewArray[myFirstSegmentedControl.selectedSegmentIndex]
        myFirstButton.setTitle(varString, for: .normal)
        
        myFirstPageControl.currentPage = myFirstSegmentedControl.selectedSegmentIndex
    }
    
    
} // END OF CLASS VIEW CONTROLLER

// EXTENS

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let varString = myPickerViewArray[row]
        myFirstButton.setTitle(varString, for: .normal)
        
        myFirstPageControl.currentPage = row
        
        myFirstSegmentedControl.selectedSegmentIndex = row
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    
    
    
    
}

