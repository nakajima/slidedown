# slidedown

Generate slides with Markdown

## Usage

Write your talk.

    !SLIDE
    
    # This is my talk
    
    !SLIDE
    
    ## I hope you enjoy it
    
    !SLIDE code
    
        def foo
          :bar
        end
    
    !SLIDE
    
    Google is [here](http://google.com)
    
    !SLIDE
    
    # Questions?

Generate the output:

    $ slidedown my-talk.md

### Custom Styles

To add custom styles to your slides, just create stylesheets in the same directory as your presentation markdown file:

    | - presentation-directory
      | - slides.md
      | - styles.css

The additional styles will be added to your generated slides.

## Navigation

Give your presentation!

* left, right arrows to navigate through slides
* esc to go home

## Syntax Highlighting

For Ruby:

    @@@ ruby
        def foo
          :bar
        end
    @@@

For Javascript

    @@@ js
        function foo() {
          return 'bar';
        }
    @@@

For ERb:

    @@@ rhtml
        <%= @post.created_at.to_s(:fancy) %>
    @@@

### Requirements

* Nokogiri
* makers-mark
* pygments (for syntax highlighting)

## Todo

* Other means of navigation besides left/right keys
* Vertical view of all slides in a row
* Generate PDFs (maybe via cucumber)
* Stop making Nokogiri sad when parsing out snippets

## Contributors

* Pat Nakajima
* Dan Croak

(c) Copyright 2009 Pat Nakajima

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
