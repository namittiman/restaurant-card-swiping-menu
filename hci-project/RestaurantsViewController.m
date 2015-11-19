//
//  RestaurantsViewController.m
//  hci-project
//
//  Created by Namit Sharma on 11/10/15.
//  Copyright © 2015 Namit Sharma. All rights reserved.
//

#import "RestaurantsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RestaurantsViewController ()
{
    NSMutableArray *restaurants;
}
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;



@end

@implementation RestaurantsViewController
@synthesize myCollectionView;
@synthesize searchResults;
@synthesize searchBar;
@synthesize isFiltered;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myCollectionView.delegate = self;
    self.myCollectionView.dataSource = self;
    searchBar.delegate = (id)self;
    
    
    
    
    restaurants = [[NSMutableArray alloc] init];
    Restaurant *r;
    Item * i;
    
    //********************************************
    r = [[Restaurant alloc] init];
    r.name = @"Cholanad Restaurant";
    r.filename = @"cholanad";
    r.notes = @"Indian";
    r.rating = 5.0;
    
    r.menu_items = [[NSMutableArray alloc] init ];
    r.categories = [[NSMutableArray alloc] initWithObjects:@"All",@"Appetizers",@"Entrees",@"Drinks", nil ];
    
    
    i = [[Item alloc]init];
    i.name = @"Medhu Vadai";
    i.photo_filename = @"medhu-vadai";
    i.notes = @"Fried Lentil donuts";
    i.spicy = 2;
    i.veg = YES;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Lamb Kofta";
    i.photo_filename = @"lamb-kofta";
    i.notes = @"Meatballs stuffed with lamb meat.";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Chicken Puff";
    i.photo_filename = @"chicken-puff";
    i.notes = @"A rich, creamy chicken sauce is rolled in croissants and baked to form delicious puffs";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Samosa Chat";
    i.photo_filename = @"samosa-chat";
    i.notes = @"Samosa on curried chickpeas, added with sev, drizzled with chaat masala and tangy - salty chutneys";
    i.spicy = 3;
    i.veg = YES;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Masala Dosa";
    i.photo_filename = @"masala-dosa";
    i.notes = @"Crispy thin crepe or pan cake made from rice batter and black lentils and with yummy mashed potatoes";
    i.spicy = 2;
    i.veg = YES;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Cauliflower Bezule";
    i.photo_filename = @"cauliflower-bezule";
    i.notes = @"Cauliflower fried in a chili-spiked batter and then sauteed in a tangy-spicy combination of aromatic ingredients.";
    i.spicy = 3;
    i.veg = YES;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Egg and greens mini rollups";
    i.photo_filename = @"Egg&greens-mini-rollups";
    i.notes = @"Vegetables and eggs rolled in a fried thin bread";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Haryali kabab";
    i.photo_filename = @"haryali-kabab";
    i.notes = @"Boneless chicken pieces are marinated in the mixture of Curd, Spinach and Mint Leaves and grilled in oven.";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Lamb chops";
    i.photo_filename = @"lamb-chops";
    i.notes = @"Lamb Chops Mildly flavored with cheese & herbs,marinated ; roasted in Tandoor";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Pan Seared Shrimp";
    i.photo_filename = @"pan-seared-shrimp";
    i.notes = @"Crispy shrimps fried with green chillies and tangy masala";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Sarkara Pongal";
    i.photo_filename = @"Sarkara-pongal";
    i.notes = @"Sweetened Rice pudding, flavoured with cardamom & cashew nuts ";
    i.spicy = 1;
    i.veg = YES;
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Soft Shell Crab";
    i.photo_filename = @"soft-shell-crab";
    i.notes = @"Crab meat with cinnamon, cloves and lentils made as koftas, tossed in chettinad sauce;";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Tandoori Chicken";
    i.photo_filename = @"tandoori-chicken";
    i.notes = @"Chicken marinated in yogurt and seasoned with the spice mixture tandoori masala";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Thai infused Fish";
    i.photo_filename = @"thai-infused-fish";
    i.notes = @"Whole Fish (Pomfret/ Red Snapper/ Pompano per availability) wrapped in banana leaf, cooked in tamarind, Plated on Pulao Rice";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"South Indian Thali";
    i.photo_filename = @"thali";
    i.notes = @"Kadai Vegetable Masala, Spiced baby EggPlant curry, Saag Aloo, Seasonal Veg Poriyal, Yellow Dhal, Sambar, Rasam, Raita, Basmati Rice, Roti & Papad, Gulab Jamun";
    i.spicy = 2;
    i.veg = YES;
    i.category = @"Entrees";
    [r.menu_items addObject:i];
   
    i = [[Item alloc]init];
    i.name = @"Mango Lassi";
    i.photo_filename = @"mango-lassi";
    i.notes = @"Yogurt-based drink with flavor of mango";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Drinks";
    [r.menu_items addObject:i];
    
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
    //********************************************
    
    r = [[Restaurant alloc] init];
    r.name = @"Olive Garden";
    r.filename = @"olivegarden-logo";
    r.notes = @"Italian";
    
    r.menu_items = [[NSMutableArray alloc] init ];
    r.categories = [[NSMutableArray alloc] initWithObjects:@"All",@"Appetizers", @"Soups", @"Entrees",@"Desserts", nil ];

    i = [[Item alloc]init];
    i.name = @"Italian Cheese Stuffed Meatballs";
    i.photo_filename = @"italian-cheese-stuffed-meatballs";
    i.notes = @"Meatballs stuffed with mozzarella, provolone and parmesan cheeses in marinara sauce. Served with our warm, crisp breadstick crostini.";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Breadstick Pepperoni Pizza";
    i.photo_filename = @"breadstick-pepperoni-pizza";
    i.notes = @"Breadstick crust topped with smoked mozzarella cheese, giant pepperoni and marinara. Baked fresh in our pizza oven.";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Cheese Stuffed Mushrooms";
    i.photo_filename = @"cheese-stuffed-mushrooms";
    i.notes = @"Baked with clams, parmesan, romano, mozzarella and herb breadcrumbs";
    i.spicy = 2;
    i.veg = YES;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Spicy Calamari";
    i.photo_filename = @"spicy-calamari";
    i.notes = @"Spicy calamari, lightly breaded and fried with cherry pepper slices and red pepper flakes. Served with parmesan-peppercorn sauce and marinara";
    i.spicy = 3;
    i.veg = YES;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Spicy Shrimp Scampi Fitta";
    i.photo_filename = @"spicy-shrimp";
    i.notes = @"Lightly breaded and fried, tossed with garlic and a spicy cherry pepper sauce.";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Crispy Risotto Bites";
    i.photo_filename = @"crispy-risotto-bites";
    i.notes = @"A bite-sized blend of Italian cheeses and rice, lightly fried and served with marinara sauce. ";
    i.spicy = 2;
    i.veg = YES;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Lasagna Fritta";
    i.photo_filename = @"lasagna-fritta";
    i.notes = @"Fried parmesan-breaded lasagna, topped with parmesan cheese and marinara sauce, with creamy alfredo.";
    i.spicy = 2;
    i.veg = YES;
    i.category = @"Appetizers";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Zuppa Toscana Soup";
    i.photo_filename = @"zuppa-toscana-soup";
    i.notes = @"Spicy sausage, fresh kale and russet potatoes in a creamy broth. ";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Soups";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Pasta e Fagioli Soup";
    i.photo_filename = @"pasta-bean-fagioli";
    i.notes = @"White and red beans, ground beef, tomatoes and pasta in a savory broth. ";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Soups";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Chicken and Gnocchi Soup";
    i.photo_filename = @"chicken-n-gnocchi";
    i.notes = @"This satisfying soup is made in our kitchens everyday with roasted chicken, traditional Italian potato dumplings, onion, celery, carrots and spinach. It isn't as rich as a chowder, but it's also not a true broth";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Soups";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Minestrone Soup";
    i.photo_filename = @"minestrone";
    i.notes = @"Hearty vegetables like spinach, zucchini, carrots and celery simmer with northern beans and shell pasta in a light tomato broth.";
    i.spicy = 2;
    i.veg = YES;
    i.category = @"Soups";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Citrus Chicken Sorrento";
    i.photo_filename = @"citrus-chicken-sorretto";
    i.notes = @"Tender, grilled chicken breast in a citrus honey glaze, inspired by the Italian city of Sorrento, famous for its lemon groves. Served with lightly seasoned vegetables and artichokes.";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Ravioli di Portabello";
    i.photo_filename = @"ravioli-deportabello";
    i.notes = @"Ravioli filled with portobello mushrooms, topped with a creamy, smoked cheese and sun-dried tomato sauce. ";
    i.spicy = 2;
    i.veg = YES;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Grilled Chicken Caesar Salad";
    i.photo_filename = @"grilled-chicken-caeser-salad";
    i.notes = @"Grilled chicken over fresh romaine in a classic Caesar dressing topped with shaved romano cheese and baked parmesan cheese crisps. Served with your choice of homemade soup.";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Chicken Cacciatorie & Cheese Manicotti";
    i.photo_filename = @"chicken-cacclatorie";
    i.notes = @"Baked manicotti filled with ricotta and asiago cheeses, topped with grilled chicken and a slow-cooked sauce of bell peppers, mushrooms, onions and tomatoes.";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Chicken Scampi";
    i.photo_filename = @"chicken-scampi";
    i.notes = @"Bell peppers and red onions sautéed with chicken tenderloins in a creamy scampi sauce. Served over angel hair pasta. ";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Chicken Parmigiana";
    i.photo_filename = @"chicken-parmigiana";
    i.notes = @"Two lightly fried parmesan-breaded chicken breasts are smothered with Olive Garden’s homemade marinara sauce and melted Italian cheeses. We serve our Chicken Parmigiana with a side of spaghetti for dinner.";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Eggplant Parmigiana";
    i.photo_filename = @"eggplant-parmigiana";
    i.notes = @"Lightly fried, topped with homemade marinara and melted mozzarella. Served with a side of spaghetti.";
    i.spicy = 2;
    i.veg = YES;
    i.category = @"Entrees";
    [r.menu_items addObject:i];


    i = [[Item alloc]init];
    i.name = @"Fettucine Alfredo";
    i.photo_filename = @"fettucine-alfredo";
    i.notes = @"chefs make it in house throughout the day with parmesan cheese, heavy cream, and garlic.";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Chicken Alfredo";
    i.photo_filename = @"chicken-alfredo";
    i.notes = @"Homemade sauce combines simple, fresh ingredients like butter, cream and parmesan cheese to make a rich topping to our fettuccine pasta. Then it is topped with tender, sliced grilled chicken.";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Cheese Ravioli";
    i.photo_filename = @"cheese-ravioli";
    i.notes = @"Filled with a blend of indulgent Italian cheeses, topped with your choice of homemade marinara or meat sauce and melted mozarella";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Entrees";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Pumpkin Cheesecake";
    i.photo_filename = @"pumpkin-cheesecake";
    i.notes = @"Pumpkin Cheesecake is topped with caramel and ginger cookie crumbles.";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Desserts";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Seasonal Sicilian Cheesecake";
    i.photo_filename = @"sicilian-cheesecake";
    i.notes = @"Our ricotta cheesecake features a shortbread cookie crust and is topped with raspberry drizzle and crumbled almond biscotti.";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Desserts";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Black Tie Mousse Cake";
    i.photo_filename = @"blacktie-mousse-cake";
    i.notes = @"Rich layers of chocolate cake, dark chocolate cheesecake and creamy custard mousse. ";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Desserts";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Chocolate Mousse Cake";
    i.photo_filename = @"chocolate-mousse-cake";
    i.notes = @"Rich chocolate brownie topped with a layer of creamy chocolate mousse. ";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Desserts";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Dolcini";
    i.photo_filename = @"dolcinni";
    i.notes = @"Piccoli Dolci "little dessert treats", layered with cake, mousse, pastry creams and berries. ";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Desserts";
    [r.menu_items addObject:i];

    [restaurants addObject:r];
    
    //********************************************

    r = [[Restaurant alloc] init];
    r.name = @"IHOP";
    r.filename = @"IHOP-logo";
    r.notes = @"American, Breakfast";
    
    r.menu_items = [[NSMutableArray alloc] init ];
    r.categories = [[NSMutableArray alloc] initWithObjects:@"All",@"Pancakes", @"Omelettes", @"Frenchtoasts",@"Waffles", @"Burgers and Salads", nil ];
    
    i = [[Item alloc]init];
    i.name = @"Caramel BonBon pancakes";
    i.photo_filename = @"caramel-bonbon-pancakes";
    i.notes = @"These buttermilk pancakes are layered with dulce de leche cream then topped with a drizzle of caramel sauce and whipped topping";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Pancakes";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"Raspberry Pancakes";
    i.photo_filename = @"raspberry-pancakes";
    i.notes = @"buttermilk pancakes filled with sweet white chocolate chips, crowned with lush raspberry topping, a drizzle of cream cheese icing and finished with fluffy whipped topping";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Pancakes";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Red Velvet Pancakes";
    i.photo_filename = @"redvelvet-pancakes";
    i.notes = @"4 rich red velvet pancakes topped with cream cheese icing & dusted with powdered sugar";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Pancakes";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"Strawberry Pancakes";
    i.photo_filename = @"strawberry-pancakes";
    i.notes = @"Four pancakes filled with fresh slices of banana, then crowned with cool strawberries, more fresh banana slices and creamy whipped topping.";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Pancakes";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"Bacon Temptation Omelette";
    i.photo_filename = @"bacon-temptation-omelette";
    i.notes = @"Hickory-smoked chopped bacon, a creamy cheese sauce, Jack and Cheddar cheeses and fresh, diced tomatoes on top.";
    i.spicy = 2;
    i.veg = NO;
    i.category = @"Omelettes";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Big Steak Omelette";
    i.photo_filename = @"big-steak-omelette";
    i.notes = @"Tender and tasty strips of steak, hash browns, fresh green peppers, onions, mushrooms, tomatoes and Cheddar cheese";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Omelettes";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Banana Bread Frenchtoast";
    i.photo_filename = @"bananabread-frenchtoast";
    i.notes = @"Banana bread with cinnamon bits is dipped in our vanilla French toast batter, then grilled and topped with caramel sauce, powdered sugar and whipped topping.";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Frenchtoasts";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Banana Nutella Crepes";
    i.photo_filename = @"banana-nutella-crepes";
    i.notes = @"Four delicate crepes topped with Nutella The Original Hazelnut Spread & freshly sliced bananas.";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Frenchtoasts";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Strawberry Banana Frenchtoast";
    i.photo_filename = @"strawberry-banana-toast";
    i.notes = @"Six French toast triangles, topped with cool strawberries, fresh banana slices and crowned with whipped topping.";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Frenchtoasts";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Stuffed Frenchtoast";
    i.photo_filename = @"stuffed-frenchtoast";
    i.notes = @"Warm cinnamon raisin French toast is stuffed with sweet cream filling, then topped with your choice of strawberry vanilla, peach vanilla or glazed strawberries.";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Frenchtoasts";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Bananas and Cream Belgian Waffle";
    i.photo_filename = @"bananas-belgian-waffle";
    i.notes = @"Thick and crisp Belgian waffle topped with caramel cream, sliced fresh bananas, honey-roasted pecans and finished with a dusting of powdered sugar";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Waffles";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Chicken and Pumpkin Spice Waffle";
    i.photo_filename = @"chicken-and-pumpkin-waffle";
    i.notes = @"Belgian waffle is made with real pumpkin, topped with pumpkin spice sugar and candied pecans and served with all white meat crispy chicken";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Waffles";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Pumpkin Spice Waffle";
    i.photo_filename = @"pumpkin-spice-waffle";
    i.notes = @"Belgian waffle is made with real pumpkin, sprinkled with pumpkin spice sugar and whipped topping.";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Waffles";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Pumpkin Waffle Sundae";
    i.photo_filename = @"pumpkin-waffle-sundae";
    i.notes = @"Pumpkin Waffle served with Sundae";
    i.spicy = 1;
    i.veg = YES;
    i.category = @"Waffles";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Roasted Turkey Fixings";
    i.photo_filename = @"roasted-turkey-fixings";
    i.notes = @"Roasted turkey breast, cornbread stuffing, mashed potatoes and lingonberries.";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Burgers and Salads";
    [r.menu_items addObject:i];

    i = [[Item alloc]init];
    i.name = @"Philly Cheese Burger";
    i.photo_filename = @"philly-cheese-burger";
    i.notes = @"Grilled Philly steak and onions, then topped with melted American cheese on a perfectly grilled roll";
    i.spicy = 3;
    i.veg = NO;
    i.category = @"Burgers and Salads";
    [r.menu_items addObject:i];

    [restaurants addObject:r];

    //********************************************
    
    r = [[Restaurant alloc] init];
    r.name = @"Pho Vietnam";
    r.filename = @"2";
    r.notes = @"Vietnamese";
    r.rating = 3.3;
    
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
    //********************************************
    
    r = [[Restaurant alloc] init];
    r.name = @"Sushi Iwa";
    r.filename = @"3";
    r.notes = @"Asian, Sushi, Thai";
    r.rating = 2.3;
    
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
    //********************************************
    
    
    r = [[Restaurant alloc] init];
    r.name = @"The Palace International";
    r.filename = @"4";
    r.notes = @"African, Caribbean, Vegetarian";
    r.rating = 1.3;
    
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
    //********************************************
    
    
    r = [[Restaurant alloc] init];
    r.name = @"Sunrise Biscuit Kitchen";
    r.filename = @"5";
    r.notes = @"American, Breakfast";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
    //********************************************
    
    
    r = [[Restaurant alloc] init];
    r.name = @"One Restaurant";
    r.filename = @"6";
    r.notes = @" American, International";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
    //********************************************
    
    
    r = [[Restaurant alloc] init];
    r.name = @"The Cowfish Sushi Burger Bar";
    r.filename = @"7";
    r.notes = @"Burger, Sushi, Fusion";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
    //********************************************
    
    
    r = [[Restaurant alloc] init];
    r.name = @"Lantern";
    r.filename = @"8";
    r.notes = @" Asian, Japanese, Thai";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
    //********************************************
    
    
    r = [[Restaurant alloc] init];
    r.name = @"Dame's Chicken & Waffles";
    r.filename = @"9";
    r.notes = @"Vietnamese";
    r.menu_items = [[NSMutableArray alloc] init ];
    
    i = [[Item alloc]init];
    i.name = @"r0-1";
    i.photo_filename = @"r0-1";
    i.notes = @"r0-1";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-2";
    i.photo_filename = @"r0-2";
    i.notes = @"r0-2";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-3";
    i.photo_filename = @"r0-3";
    i.notes = @"r0-3";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-4";
    i.photo_filename = @"r0-4";
    i.notes = @"r0-4";
    [r.menu_items addObject:i];
    
    i = [[Item alloc]init];
    i.name = @"r0-5";
    i.photo_filename = @"r0-5";
    i.notes = @"r0-5";
    [r.menu_items addObject:i];
    
    [restaurants addObject:r];
    
    //********************************************
    
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.myCollectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    int rCount;
    if(self.isFiltered)
        rCount = searchResults.count;
    else
        rCount = restaurants.count;
    
    return rCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RestaurantCollectionViewCell *cell = (RestaurantCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 8;
    
    Restaurant *current;
    if(isFiltered)
    {
        current = [searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        current = [restaurants objectAtIndex:indexPath.row];
    }
    
    
    
    //Set the cell outlets
    cell.imageView.image = [UIImage imageNamed:current.filename];
    cell.restaurantNameLabel.text = [current name];
    //[cell.notes setText:[current notes]];
    //[cell.cuisine setText:[current cuisine]];
    [cell.rating setText:[NSString stringWithFormat:@"%1.1f",current.rating]];
    int red,green,blue; //current.rating is between 1 to 5 say
    
    //the lower the rating the lower the green , the higher the red
    green= 24+(current.rating/(5-1))*(164-24); //24 164
    red= 164-green;
    
    cell.rating.backgroundColor = [UIColor colorWithRed:red/256.0 green:green/256.0 blue:24/256.0 alpha:1.0];
    //[cell.location setText:[current location] ];
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"sequeToSwipe"])
    {
        RestaurantCollectionViewCell  *cell = (RestaurantCollectionViewCell *) sender;
        NSIndexPath *indexPath = [self.myCollectionView indexPathForCell:cell];
        SwipeViewController *svc = (SwipeViewController*)[segue destinationViewController];
        Restaurant *r = [[Restaurant alloc] init];
        
        if(isFiltered)
        {
            r = [searchResults objectAtIndex:[indexPath row]];
        }
        else
        {
            r = [restaurants objectAtIndex:[indexPath row]];
        }

        NSLog(r.name);
        svc.r = r;
    }
}

#pragma mark - searchBar

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    //NSLog(@"searchBar ... text.length: %d", text.length);
    
    if(text.length == 0)
    {
        self.isFiltered = FALSE;
        //[searchBar resignFirstResponder];
        //[self searchBarCancelButtonClicked:searchBar];
    }
    else
    {
        isFiltered = true;
        searchResults = [[NSMutableArray alloc] init];
        
        for (Restaurant* r in restaurants)
        {
            if ([r.name rangeOfString:text options:NSCaseInsensitiveSearch].location != NSNotFound)
            {
                [searchResults addObject:r];
            }
            
        }
    }
    
    [self.myCollectionView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //User hit Search button on Keyboard
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text=@"";
    
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
    isFiltered = FALSE;
    [self.myCollectionView reloadData];
}


@end
