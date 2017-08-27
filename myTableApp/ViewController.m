//
//  ViewController.m
//  myTableApp
//
//  Created by Dragos Bercea  on 11/5/16.
//  Copyright © 2016 Dragos Bercea . All rights reserved.
//

#import "ViewController.h"

#define TAG_BUTTON_ADD 1
#define TAG_BUTTON_SUBTRACT 2

@interface ViewController ()
@property (strong,nonatomic) UIView *myView; // do I need this?
@property (nonatomic,strong) UILabel* numDisplay;
@end

@implementation ViewController

// the array that will contain the data values for the list:
// an NSArray is static array where the sized is always the same
NSArray *data;

int myNum = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // add some values to the array, which will then be displayed on the table:
//    data = [NSArray arrayWithObjects: @"Foo", @"B ar",@"Alice",@"Bob",@"Objective-c",nil];
    
//    This is also from my attempt to try and place three buttons at the bottom of the screen:
//    UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Button1"];

    /**
    Displaying the current state of the number on the screen:
    **/
    CGRect resultFrame = CGRectMake(170, 10, 20, 100); // create the frame for the display
    _numDisplay = [[UILabel alloc] initWithFrame:resultFrame]; // initialize it
    _numDisplay.text = [NSString stringWithFormat:@"%i\n",myNum]; // set the text to the initial myNum value
    
    /**
     For the buttons that add and subtract from myNum:
     **/
    
    // the add button:
    CGRect buttonFrameAdd = CGRectMake(130, 200, 20, 20);
    
    UIButton* buttonAdd = [UIButton buttonWithType:UIButtonTypeRoundedRect];//[[UIButton alloc] initWithFrame: buttonFrameAdd];
    
    buttonAdd.frame = buttonFrameAdd;
    
    [buttonAdd setTitle: @"+" forState:UIControlStateNormal];
    
    buttonAdd.tag = TAG_BUTTON_ADD;
    
    [buttonAdd addTarget:self action: @selector(modifyNumber:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonAdd setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    // the subtract button:
    CGRect buttonFrameSubtract = CGRectMake(220, 200, 20, 20);
    
    UIButton *buttonSubtract = [[UIButton alloc] initWithFrame:buttonFrameSubtract];
    
    buttonSubtract.tag = TAG_BUTTON_SUBTRACT;
    
    [buttonSubtract setTitle: @"-" forState:UIControlStateNormal];
    
    [buttonSubtract addTarget:self action: @selector(modifyNumber:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonSubtract setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    // add the buttons and the UILabel (display) to the view:
    [self.view addSubview:buttonSubtract];
    [self.view addSubview:buttonAdd];

    [self.view addSubview:_numDisplay];

    
}

// the action listener for both add and subtract:
-(void) modifyNumber:(UIButton*) sender  {
    
    if (sender.tag == TAG_BUTTON_ADD) {
        myNum++;
        NSString *myNumAsNSString = [NSString stringWithFormat:@"%i",myNum];
        _numDisplay.text = myNumAsNSString;
    }
    
    if (sender.tag == TAG_BUTTON_SUBTRACT) {
        myNum--;
        NSString *myNumAsNSString = [NSString stringWithFormat:@"%i",myNum];
        _numDisplay.text = myNumAsNSString;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// determines how many rows there will be in the table:
- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}



// This method will be called everytime a row in the table is displayed:
// returns a pointer to UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"Prototype cells";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    return cell;
}

@end
