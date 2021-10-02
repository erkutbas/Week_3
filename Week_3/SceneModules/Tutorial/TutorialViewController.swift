//
//  TutorialViewController.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

class TutorialViewController: BaseViewController<TutorialViewModel> {
    
    private var pageViewController: UIPageViewController!
    private var index = 0
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addPageViewController()
        setViewControllers()
    
    }
    
    private func addPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.dataSource = self
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        
        NSLayoutConstraint.activate([
            
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }
    
    private func setViewControllers() {
        pageViewController.setViewControllers([GenericImageContainerViewBuilder.build(with: viewModel.getItem(at: 0))], direction: .forward, animated: true, completion: nil)
        pageViewController.didMove(toParent: self)
    }
    
    private func getViewController(at index: Int) -> UIViewController {
        return GenericImageContainerViewBuilder.build(with: viewModel.getItem(at: index))
    }
    
}

extension TutorialViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let controller = viewController as? GenericImageContainer else { return nil }
        var index = controller.viewModel.getIndex()
        
        if index == 0 { return nil }

        index -= 1
        
        return getViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let controller = viewController as? GenericImageContainer else { return nil }
        var index = controller.viewModel.getIndex()
        
        index += 1
        
        if index == viewModel.getItemCount() { return nil }
        
        return getViewController(at: index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewModel.getItemCount()
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
