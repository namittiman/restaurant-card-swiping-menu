//
//  DraggableViewBackground.m
//  testing swiping
//
//  Created by Richard Kim on 8/23/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//

#import "DraggableViewBackground.h"

@implementation DraggableViewBackground{
    NSInteger cardsLoadedIndex; //%%% the index of the card you have loaded into the loadedCards array last
    NSMutableArray *loadedCards; //%%% the array of card loaded (change max_buffer_size to increase or decrease the number of cards this holds)
    
    UIButton* menuButton;
    UIButton* messageButton;
    UIButton* checkButton;
    UIButton* xButton;
}
//this makes it so only two cards are loaded at a time to
//avoid performance and memory costs
static const int MAX_BUFFER_SIZE = 2; //%%% max number of cards loaded at any given time, must be greater than 1
static const float CARD_HEIGHT = 444; //%%% height of the draggable card
static const float CARD_WIDTH = 394; //%%% width of the draggable card

@synthesize exampleCardLabels; //%%% all the labels I'm using as example data at the moment
@synthesize allCards;//%%% all the cards
@synthesize r;
@synthesize currentItemIndex;
@synthesize myShortList;




- (id)initWithFrame:(CGRect)frame andRestaurant:(Restaurant*)R withCategory:(int)current_category_index andShortList:(MyShortList*) myActualShortList;
{
    self = [super initWithFrame:frame];
    if (self) {
        [super layoutSubviews];
        [self setupView];
        self.r = R;
        self.myShortList=myActualShortList;
        //setting the exampleCardLabels as per current_category_index
        exampleCardLabels = [[NSMutableArray alloc] init];
        
        //This is where we decode what to the exampleCardLabels from r.menu_items
        for (int i=0; i<r.menu_items.count; i++)
        {
            
            //We Filter according to category selected and by what already has been swiped out (considering only what has been swiped right for now)
            
            Item *item = (Item*)[r.menu_items objectAtIndex:i];
            
            if ([[item category] isEqualToString:[r.categories objectAtIndex:current_category_index]] || current_category_index==0)
            {
                
                //whats already in the shortlist
                bool isPresent = false;
                
                for (int j=0; j<self.myShortList.menu_items.count; j++)
                {
                    if ([item.name isEqualToString:[[self.myShortList.menu_items objectAtIndex:j] name]])
                        isPresent = true;
                }
                if (!isPresent) {
                    [exampleCardLabels addObject:item];
                }
            }
            
        }

        loadedCards = [[NSMutableArray alloc] init];
        allCards = [[NSMutableArray alloc] init];
        cardsLoadedIndex = 0;
        currentItemIndex = 0;
        [self loadCards];
    }
    return self;
}

//%%% sets up the extra buttons on the screen
-(void)setupView
{
    
    self.backgroundColor = [UIColor colorWithRed:.92 green:.93 blue:.95 alpha:1]; //the gray background colors
    /*menuButton = [[UIButton alloc]initWithFrame:CGRectMake(17, 34, 22, 15)];
    [menuButton setImage:[UIImage imageNamed:@"menuButton"] forState:UIControlStateNormal];
    messageButton = [[UIButton alloc]initWithFrame:CGRectMake(284, 34, 18, 18)];
    [messageButton setImage:[UIImage imageNamed:@"messageButton"] forState:UIControlStateNormal];
    xButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 485, 59, 59)];
    [xButton setImage:[UIImage imageNamed:@"xButton"] forState:UIControlStateNormal];
    [xButton addTarget:self action:@selector(swipeLeft) forControlEvents:UIControlEventTouchUpInside];
    checkButton = [[UIButton alloc]initWithFrame:CGRectMake(200, 485, 59, 59)];
    [checkButton setImage:[UIImage imageNamed:@"checkButton"] forState:UIControlStateNormal];
    [checkButton addTarget:self action:@selector(swipeRight) forControlEvents:UIControlEventTouchUpInside];
    //[self addSubview:menuButton];
    //[self addSubview:messageButton];
    //[self addSubview:xButton];
    //[self addSubview:checkButton];*/
}

//%%% creates a card and returns it.  This should be customized to fit your needs.
// use "index" to indicate where the information should be pulled.  If this doesn't apply to you, feel free
// to get rid of it (eg: if you are building cards from data from the internet)
-(DraggableView *)createDraggableViewWithDataAtIndex:(NSInteger)index
{
    DraggableView *draggableView = [[DraggableView alloc]initWithFrame:CGRectMake(10, 102, CARD_WIDTH, CARD_HEIGHT)];

    Item *current_item = (Item*)[exampleCardLabels objectAtIndex:index];
    [draggableView.image setImage:[UIImage imageNamed: current_item.photo_filename ]];
    [draggableView.item_name_label setText:current_item.name];
    [draggableView.spice_image setImage:[UIImage imageNamed:[ NSString stringWithFormat:@"spicy%d",current_item.spicy ]]];
    
    draggableView.delegate = self;
    return draggableView;
}

//%%% loads all the cards and puts the first x in the "loaded cards" array
-(void)loadCards
{
    if([exampleCardLabels count] > 0) {
        NSInteger numLoadedCardsCap =(([exampleCardLabels count] > MAX_BUFFER_SIZE)?MAX_BUFFER_SIZE:[exampleCardLabels count]);
        //%%% if the buffer size is greater than the data size, there will be an array error, so this makes sure that doesn't happen
        
        //%%% loops through the exampleCardsLabels array to create a card for each label.  This should be customized by removing "exampleCardLabels" with your own array of data
        for (int i = 0; i<[exampleCardLabels count]; i++) {
            DraggableView* newCard = [self createDraggableViewWithDataAtIndex:i];
            [allCards addObject:newCard];
            
            if (i<numLoadedCardsCap) {
                //%%% adds a small number of cards to be loaded
                [loadedCards addObject:newCard];
            }
        }
        
        //%%% displays the small number of loaded cards dictated by MAX_BUFFER_SIZE so that not all the cards
        // are showing at once and clogging a ton of data
        for (int i = 0; i<[loadedCards count]; i++) {
            if (i>0) {
                [self insertSubview:[loadedCards objectAtIndex:i] belowSubview:[loadedCards objectAtIndex:i-1]];
            } else {
                [self addSubview:[loadedCards objectAtIndex:i]];
            }
            cardsLoadedIndex++; //%%% we loaded a card into loaded cards, so we have to increment
        }
    }
}

//%%% action called when the card goes to the left.
// This should be customized with your own action
-(void)cardSwipedLeft:(UIView *)card;
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    currentItemIndex++;
    
    [loadedCards removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"
    
    if (cardsLoadedIndex < [allCards count]) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;//%%% loaded a card, so have to increment count
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];
    }
}

#warning include own action here!
//%%% action called when the card goes to the right.
// This should be customized with your own action
-(void)cardSwipedRight:(UIView *)card
{
    //do whatever you want with the card that was swiped
    //    DraggableView *c = (DraggableView *)card;
    //Take the item at currentItemIndex and add it to the MyshortList object
    // the object will be passed to various places
    
    Item *current_item = (Item*)[exampleCardLabels objectAtIndex:currentItemIndex];
    Item *i = [[Item alloc]init];
    i.name = current_item.name;
    i.photo_filename= current_item.photo_filename;
    i.notes =   current_item.notes;
    i.category  =   current_item.category;
    
    [myShortList.menu_items addObject:i];
    
    currentItemIndex++;
    
    [loadedCards removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"
    
    if (cardsLoadedIndex < [allCards count]) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        [loadedCards addObject:[allCards objectAtIndex:cardsLoadedIndex]];
        cardsLoadedIndex++;//%%% loaded a card, so have to increment count
        [self insertSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedCards objectAtIndex:(MAX_BUFFER_SIZE-2)]];
    }

}

//%%% when you hit the right button, this is called and substitutes the swipe
-(void)swipeRight
{
    DraggableView *dragView = [loadedCards firstObject];
    dragView.overlayView.mode = GGOverlayViewModeRight;
    [UIView animateWithDuration:0.2 animations:^{
        dragView.overlayView.alpha = 1;
    }];
    [dragView rightClickAction];
}

//%%% when you hit the left button, this is called and substitutes the swipe
-(void)swipeLeft
{
    DraggableView *dragView = [loadedCards firstObject];
    dragView.overlayView.mode = GGOverlayViewModeLeft;
    [UIView animateWithDuration:0.2 animations:^{
        dragView.overlayView.alpha = 1;
    }];
    [dragView leftClickAction];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
