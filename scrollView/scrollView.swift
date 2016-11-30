//
//  scrollView.swift
//  scrollView
//
//  Created by Pham Ngoc Hai on 11/28/16.
//  Copyright © 2016 pnh. All rights reserved.
//

import UIKit

class scrollView: UIViewController , UIScrollViewDelegate   {
    @IBOutlet weak var pageController: UIPageControl!
     var frontScrollView: [UIScrollView] = []
    
    var pageImages: [String] = []
    var first = false
    @IBOutlet weak var scrollView: UIScrollView!
    var  photo = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImages = ["shop1-0.jpg", "shop1-1.jpg", "shop1-2.jpg"]
        pageController.currentPage = 0
        pageController.numberOfPages = pageImages.count
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2.0
          }
    
   

    override func viewDidLayoutSubviews() {
        if (!first){
            first = true
        let pageScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSize(width: pageScrollViewSize.width * CGFloat(pageImages.count), height: 0)
        for i in 0 ..< pageImages.count {
            print(i)
            let imgView = UIImageView(image: UIImage(named: pageImages[i] + ".jpg"))
            imgView.frame = CGRect(x: (CGFloat(i) * scrollView.frame.size.width), y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
            imgView.contentMode = .scaleAspectFit
            
            //            scrollView.backgroundColor = UIColor.red
            
            self.scrollView.addSubview(imgView)
        }
        }
    }
    
    @IBAction func onChaneg(_ sender: Any) {
        scrollView.contentOffset = CGPoint(x: CGFloat(pageController.currentPage) * scrollView.frame.size.width, y: 0)
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let pageWidth = scrollView.frame.size.width
    let page = Int(floor((self.scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
    if (pageController.currentPage != page)
    {
  //  frontScrollView[pageController.currentPage].zoomScale = 1
        print(page)
        print(self.scrollView.contentOffset.x)
        print(pageWidth)
        print(scrollView.frame.size.width)
    pageController.currentPage = page
    }
}


//    func tapImg(gestrue: UITapGestureRecognizer)
//    {
//        let position =  gestrue.location(in: photo)
//        zoomRectForScale(scale: scrollView.zoomScale * 1.5, centre: position)
//        
//    }
//    
//    func doubleTap(gestrue: UITapGestureRecognizer)
//    {
//        let position =  gestrue.location(in: photo)
//        zoomRectForScale(scale: scrollView.zoomScale * 0.5, centre: position)
//        
//    }
//    
//    func zoomRectForScale(scale: CGFloat, centre: CGPoint)
//    {
//        var zoomRect = CGRect()
//        let scrollViewSize = scrollView.bounds.size
//        zoomRect.size.width = scrollViewSize.width / scale
//        zoomRect.size.height = scrollViewSize.height / scale
//        zoomRect.origin.x = centre.x - (zoomRect.size.width / 2.0)
//        zoomRect.origin.y = centre.y - (zoomRect.size.height / 2.0)
//        print(zoomRect)
//        scrollView.zoom(to: zoomRect, animated: true)
//        
//        
//        
//        
//    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photo
    }
    
    
    
}







