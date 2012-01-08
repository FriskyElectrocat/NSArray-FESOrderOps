# NSArray+FESOrderOps Category

This is a simple category on NSArray to provide a few ordering operations. The basic
premise is that you don't always want to sequentially work through an array's contents.

Most of these methods were written during film production where rendering a sequence
of frames sequentially (say 1-100) was not ideal. Being able to start work on frames
across the entire sequence would allow the artist to gauge more readily if the entire
render job should continue or if it needed to be stopped and corrected. If the job was
fine after the first few frames finish and are checked then the remainder of the frames
could continue and the rendered sequence would fill in as frames finished. 

But that's not why you're here, on to the category.

## Ordering your NSArray

The category adds the following to NSArray:

    @interface NSArray (FESOrderOps)
    - (NSArray *)fes_shuffle;
    - (NSArray *)fes_halfOrder;
    - (NSArray *)fes_dice;
    - (NSArray *)fes_rollWithPowerOfTwo:(int)power;
    - (NSArray *)fes_roll;
    @end
    
### fes_shuffle:

A basic Fisher-Yates Shuffle using the `arc4random_uniform(3)` function
for psuedorandom values. Returns a new NSArray with the new order. While not
strictly putting an array in a known order this is included for completeness
incase the user does want to shuffle, say for a deck of cards.
See [wikipedia](http://en.wikipedia.org/wiki/Fisher–Yates_shuffle) for more information.

### fes_halfOrder:

Takes the half-way point of an array, and then keeps taking the half-way point until 
the array is exhausted.  Returns a new NSArray with the new order.

### fes_dice:

Takes the first and last element of the array and then runs fes_halfOrder: on the 
remainder. This provides a slightly faster glimpse of the bounds of a sequence of
operations than a pure `halfOrder:` would. Returns an NSArray with the new order.

### fes_rollWithPowerOfTwo:

Starts at 0 position and _rolls_ across the array selecting values at a specified
interval that is a power of two (2). When the source array is no longer long enough
to allow that size of a _roll_ it will step down to the next power of two until the
list is exhausted. Returns an NSArray with the new order.

### fes_roll:

Uses `fes_rollWithPowerOfTwo:` to return a _roll_ with a power of five (5)
for an initial _roll_ size of 32. Consider this the default parameter version 
of `fes_rollWithPowerOfTwo:`. Returns an NSArray with the new order.

## License

This code is under the MIT license:

_Copyright © 2012 Dan Weeks/Frisky Electrocat Studio_

_Permission is hereby granted, free of charge, to any person obtaining a copy_
_of this software and associated documentation files (the “Software”), to deal_
_in the Software without restriction, including without limitation the rights_
_to use, copy, modify, merge, publish, distribute, sublicense, and/or sell_
_copies of the Software, and to permit persons to whom the Software is_
_furnished to do so, subject to the following conditions:_

_The above copyright notice and this permission notice shall be included in_
_all copies or substantial portions of the Software._

_THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR_
_IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,_
_FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE_
_AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER_
_LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,_
_OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN_
_THE SOFTWARE._

## The Future

While this is pretty straight forward I know more work can go into this. Blocks for one
would be nice. This version is a straight port from Python code that I have used for 
quite a while.