# Packaging (Data Structure) 📦

>I'm currently developing an chat based app and I found a problem. 
>I have an chat UI with a load more messages button, I want to show only 30 messages at the beginning and load more when press this button. I have an array with all the messages received from the server and other with the messages showed in the screen. 
>Every time when I press the button, I need to go thorugh all messages array, get the next 30 messages and... blablabla. It's tedious and boring.

Packaging provides a simple way to get messages (for example) as a packages. You only need to init with the size of package, put all the messages and get it.

It's really simple, packaging gets you *x* messages starting from the last messages.

## Example (Run tests)

### Getting messages from the server order from oldest to newest
```Objective-C
  self.queue = [[Packaging alloc] initWithSizeOfPackages:6];
  for (int i = 0; i < 22; i++) {
    [self.queue addElement:[NSNumber numberWithInt:i]];
  }
  //self.queue = @[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
    
```

```Objective-C
	NSArray *arr = [self.queue getPackage]; // @[16,17,18,19,20,21]
    arr = [self.queue getPackage]; // @[10,11,12,13,14,15]
    arr = [self.queue getPackage]; // @[4,5,6,7,8,9]
    arr = [self.queue getPackage]; // @[0,1,2,3] 
```
  

## Installation

### Manual
Drag and drop or copy Source Folder into your project.

##Getting started
  
  1. Import library
  ```Objective-C
  #import "Packaging.h"
  ```
 
  2. Create Packaging
  ```Objective-C
  ///@interface
  @property (nonatomic, strong) Packaging *queue;
  
  ///-(void)viewDidLoad
  self.queue = [[Packaging alloc] initWithSizeOfPackages:6];
  ```
 
  3. Insert content
  ```Objective-C
  [self.queue addElement:message];
  ```
  or
  ```Objective-C
  [self.queue addElements:@[message1...messageN]];
  ```
    
  4. Get package
  ```Objective-C
  [self.queue getPackage];
  ```
  
### Optional
  * Change size Of package
  
  ```Objective-C
  self.queue.sizeOfPackage = 2;
  [self.queue getPackage]; //@[foo, bar]
  ```
  
  * Check if the next package will contain less than size of Package.
  
  ```Objective-C
  if ([self.queue lessThanSizeOfPackage]) {
    self.addMoreMessagesButton.enabled = NO;
    self.addMoreMessagesButton.alpha = 0;
  }
  ```
  
  
## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b Pack-new-feature`
3. Commit your changes: `git commit -am 'Add new feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request 👌

## Credits
 - Joan Molinas ([mail](joanmramon@gmail.com))

## License

Packaging is available under the MIT license.

