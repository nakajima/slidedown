!SLIDE

# Introducing slidedown

!SLIDE

# Why?

!SLIDE

# Write slides in Markdown

!NOTES

# You can even include notes

!SLIDE

    # Slide title
    
    !SLIDE
    
    ## A good point
    
    !SLIDE
    
    > This is the coolest thing ever.

!SLIDE

# Syntax Highlighting

!SLIDE

<pre>
  @@@ ruby
      # A rack app
      proc {
        [200, { 'Location' => '/' },
          "You are being redirected to /"
        ]
      }
  @@@
</pre>

!SLIDE

# Becomes...

!SLIDE code

@@@ ruby
    # A rack app
    proc {
      [200, { 'Location' => '/' },
        "You are being redirected to /"
      ]
    }
@@@

!SLIDE

<pre>
  @@@ js
      // Some JavaScript
      function() {
        if (1 == 2) {
          return "This is silly."
        }
      }
  @@@
</pre>

!SLIDE

# Becomes...

!SLIDE code

@@@ js
    // Some JavaScript
    function() {
      if (1 == 2) {
        return "This is silly."
      }
    }
@@@

!SLIDE

# A CSS test...

!SLIDE

@@@ css
    #fizz {
      color: #ffa;
    }

    .foo {
      text-decoration: underline;
    }
@@@

!SLIDE

# An ERb test...

!SLIDE

@@@ html+erb
    <h1>A test</h1>
    <p>
      <%= @foo.bar(:fizz => 'buzz') %>
    </p>
@@@