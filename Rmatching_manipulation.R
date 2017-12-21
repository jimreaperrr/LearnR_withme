#More advanced and matching manipulation 


#---------

#Capturing parts of a pattern

# Capture part between @ and . and after .
email <- capture(one_or_more(WRD)) %R% 
  "@" %R% capture(one_or_more(WRD)) %R% 
  DOT %R% capture(one_or_more(WRD))

# Check match hasn't changed
str_view(hero_contacts, email)

# Pull out match and captures
email_parts <- str_match(hero_contacts, email)  

# Print email_parts
email_parts  

# Save host
host <- email_parts[, 3]
host

#-----------


