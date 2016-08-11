//
//  TutorialViewController.h
//  Prototipo
//
//  Created by Rodrigo Maicá on 8/10/16.
//  Copyright © 2016 Rodrigo Maicá. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController

@property  NSUInteger pageIndex;
@property  NSString *txtTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblScreenLabel;

@end
