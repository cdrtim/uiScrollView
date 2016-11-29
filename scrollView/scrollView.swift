//
//  scrollView.swift
//  scrollView
//
//  Created by Pham Ngoc Hai on 11/28/16.
//  Copyright © 2016 pnh. All rights reserved.
//

import UIKit

class scrollView: UIViewController , UIScrollViewDelegate   {
    
    @IBOutlet weak var sld_setZoomScale: UISlider!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var  photo = UIImageView()
    override func viewDidLoad() {
        //        UIScrollViewDelegate
        super.viewDidLoad()
        let imgView = UIImageView(image: UIImage(named: "shop1-5.jpg"))
        imgView.frame = CGRect(x: 0, y: 0, width:imgView.frame.size.width , height: imgView.frame.size.height)
        imgView.contentMode = .scaleToFill
        
        
        imgView.isUserInteractionEnabled = true
        imgView.isMultipleTouchEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImg(gestrue:)))
        tap.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tap)
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap(gestrue:)))
        doubleTap.numberOfTapsRequired = 2
        tap.require(toFail: doubleTap)
        imgView.addGestureRecognizer(doubleTap)
        
        
        
        photo = imgView
        scrollView.contentSize = CGSize(width: imgView.frame.size.width, height: imgView.frame.size.height)
        self.scrollView.minimumZoomScale = 0.5
        self.scrollView.maximumZoomScale = 2.0
        self.scrollView.addSubview(imgView)
        
        
       
        
        
        
    }
    
    @IBAction func setZoomScale(_ sender: UISlider) {
        sender.maximumValue = 2.0
        sender.minimumValue = 0.5
//        sender.value = 0.5
        let scale = CGFloat(sender.value)
        print(scale)
        scrollView.setZoomScale(scale, animated: true)
    
    }
    
    
    
    func tapImg(gestrue: UITapGestureRecognizer)
    {
        let position =  gestrue.location(in: photo)
        zoomRectForScale(scale: scrollView.zoomScale * 1.5, centre: position)
        
    }
    
    func doubleTap(gestrue: UITapGestureRecognizer)
    {
        let position =  gestrue.location(in: photo)
        zoomRectForScale(scale: scrollView.zoomScale * 0.5, centre: position)
        
    }
    
    func zoomRectForScale(scale: CGFloat, centre: CGPoint)
    {
        var zoomRect = CGRect()
        let scrollViewSize = scrollView.bounds.size
        zoomRect.size.width = scrollViewSize.width / scale
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.origin.x = centre.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = centre.y - (zoomRect.size.height / 2.0)
        print(zoomRect)
        scrollView.zoom(to: zoomRect, animated: true)
        
        
        
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photo
    }
    

    
}







