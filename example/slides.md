!SLIDE

# Introducing slidedown

!SLIDE

# Why?

!SLIDE

# Write slides in Markdown

!SLIDE

    # Slide title
    
    !SLIDE
    
    ## A good point
    
    !SLIDE
    
    > This is the coolest thing ever.

!SLIDE

# Syntax Highlighting

!SLIDE

    @@@ ruby
    # A rack app
    proc {
      [200, { 'Location' => '/' },
        "You are being redirected to /"
      ]
    }
    @@@

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

!SLIDE code

@@@ js
function() {
  if (1 == 2) {
    return "This is silly."
  }
}
@@@