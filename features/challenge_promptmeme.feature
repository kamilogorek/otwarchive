@collections @challenges @promptmemes
Feature: Prompt Meme Challenge
  In order to have an archive full of works
  As a humble user
  I want to create a prompt meme and post to it
  
  Scenario: Creating a prompt meme has different instructions from a gift exchange
  
  Given I am logged in as "mod1"
    And I have standard challenge tags setup
  When I set up Battle 12 promptmeme collection
  Then I should see "Setting Up The Battle 12 Prompt Meme"
  Then I should see prompt meme options

  Scenario: Create a prompt meme

  Given I am logged in as "mod1"
    And I have standard challenge tags setup
  When I create Battle 12 promptmeme
  Then Battle 12 prompt meme should be correctly created
  
  Scenario: User can see a prompt meme

  Given I have Battle 12 prompt meme fully set up
    And I am logged in as "myname1"
  When I go to the collections page
  Then I should see "Battle 12"
  
  Scenario: Prompt meme is in list of open challenges
  
  Given I have Battle 12 prompt meme fully set up
    And I am logged in as "myname1"
  #When I go to "Battle 12" collection's page
  #  And I follow "Profile"
  #Then show me the page
  When I view open challenges
  Then I should see "Battle 12"
  
  Scenario: User can see profile descriptions
  
  Given I have Battle 12 prompt meme fully set up
    And I am logged in as "myname1"
  When I go to "Battle 12" collection's page
  When I follow "Profile"
  Then I should see Battle 12 descriptions
  
  Scenario: Sign up for a prompt meme
  
  Given I have Battle 12 prompt meme fully set up
  And I am logged in as "myname1"
  When I go to "Battle 12" collection's page
  Then I should see "Sign Up"
  When I sign up for Battle 12 with combination A
  Then I should see "Signup was successfully created"
    And I should see "Prompts (2)"
  
  Scenario: Sign up for a prompt meme and miss out some fields

  Given I have Battle 12 prompt meme fully set up
    And I am logged in as "myname1"
  When I sign up for "Battle 12" with missing prompts
  Then I should see "Request must have exactly 1 fandom tags. You currently have none."
  When I fill in the missing prompt
  Then I should see "Signup was successfully created"
  
  Scenario: View signups in the dashboard
  
  Given I have Battle 12 prompt meme fully set up
    And I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  When I am on my user page
  Then I should see "My Signups (1)"
  When I follow "My Signups (1)"
  Then I should see "Battle 12"
  #  And I should see "Edit"
  #  And I should see "Delete"
  
  Scenario: View individual prompt
  
  Given I have Battle 12 prompt meme fully set up
    And I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  When I view my signup for "Battle 12"
  Then I should see "Request 1"
    And I should see "Request 2"
  Then show me the page
  When I follow "Request 1"
  Then I should see "Request 1"
    And I should not see "Request 2"
  
  Scenario: Edit individual prompt via signup show
  
  Given I have Battle 12 prompt meme fully set up
    And I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  When I view my signup for "Battle 12"
  When I follow "Request 1"
  When I follow "Edit"
  Then show me the page
  
  Scenario: Edit individual prompt via signup edit
  
  Given I have Battle 12 prompt meme fully set up
    And I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  When I edit my signup for "Battle 12"
  When I follow "Request 1"
  Then show me the page
  
  Scenario: Add one new prompt to existing signup
  
  Given I have Battle 12 prompt meme fully set up
    And I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  Then show me the page
  
  Scenario: Sort prompts by date
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  And I am logged in as "myname2"
  When I sign up for Battle 12 with combination B
  When I view prompts for "Battle 12"
    And I follow "Sort by date"
  Then I should see "Something else weird"
  
  Scenario: Sort prompts by fandom
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  And I am logged in as "myname2"
  When I sign up for Battle 12 with combination B
  When I view prompts for "Battle 12"
    And I follow "Sort by fandom"
  Then I should see "Something else weird"
  
  Scenario: Claim a prompt and view claims on main page and user page
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination B
  And I am logged in as "myname4"
  And I claim a prompt from "Battle 12"
  Then I should see a prompt is claimed
  
  Scenario: Mod can view signups
  
  Given I have Battle 12 prompt meme fully set up
  Given everyone has signed up for Battle 12
  When I am logged in as "mod1"
    And I go to "Battle 12" collection's page
    And I follow "Prompts (8)"
  Then I should see correct signups for Battle 12
  
  Scenario: Sign up with both prompts anon
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination B
  Then I should see "Signup was successfully created"
  
  Scenario: Sign up with neither prompt anon
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  Then I should see "Signup was successfully created"
  
  Scenario: Sign up with one anon prompt and one not
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination C
  Then I should see "Signup was successfully created"
  
  Scenario: Mod deletes a signup that doesn't fit the challenge rules
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  When I am logged in as "mod1"
  When I delete the signup by "myname1"
  Then I should see "Challenge signup was deleted."
  #  And "myname1" should be emailed
  
  Scenario: Mod deletes a prompt that doesn't fit the challenge rules
  # This needs javascript refactoring first, and to make a non-js version of editing individual prompts within signups
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination C
  When I am logged in as "mod1"
  #When I delete the prompt by "myname1"
  #Then I should see "Prompt was successfully deleted"
  #  And "myname1" should be emailed
  
  Scenario: User can fulfill a claim
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination B
  And I am logged in as "myname4"
  And I claim a prompt from "Battle 12"
  When I fulfill my claim
  Then my claim should be fulfilled
  
  Scenario: Claims count should be correct
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination B
  And I am logged in as "myname4"
  And I claim a prompt from "Battle 12"
  When I fulfill my claim
  When I am on my user page
  Then I should see "My Claims (0)"
  
  Scenario: Claim shows as fulfilled to another user
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination B
  And I am logged in as "myname4"
  And I claim a prompt from "Battle 12"
  When I fulfill my claim
  When I am logged in as "myname1"
  When I go to "Battle 12" collection's page
    And I follow "Claims"
  Then I should see "Secret!" within "#fulfilled_claims"
    And I should not see "Secret!" within "#unfulfilled_claims"
  When I follow "Prompts ("
    And I follow "Show Claims"
  Then I should not see "Claimed by: (Anonymous)"
  When I follow "Show Filled"
  Then I should see "Claimed by: (Anonymous) (Filled)"
    
  Scenario: Prompts are counted up correctly
  
  Given I have Battle 12 prompt meme fully set up
  
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination A
  Then I should see "Prompts (2)"
  When I am logged in as "myname2"
  When I sign up for Battle 12 with combination B
  Then I should see "Prompts (4)"
  
  Scenario: Claims are shown to mod
  
  Given I have Battle 12 prompt meme fully set up
  Given everyone has signed up for Battle 12
  When I claim a prompt from "Battle 12"
  When I close signups for "Battle 12"
  Then claims are shown
  
  Scenario: Claims are hidden from ordinary user
  
  Given I have Battle 12 prompt meme fully set up
  Given everyone has signed up for Battle 12
  When I claim a prompt from "Battle 12"
  When I close signups for "Battle 12"
  When I am logged in as "myname4"
  Then claims are hidden
  
  Scenario: User cannot delete someone else's claim
  
  Given I have Battle 12 prompt meme fully set up
  Given everyone has signed up for Battle 12
  When I claim a prompt from "Battle 12"
  When I am logged in as "myname1"
  When I go to "Battle 12" collection's page
    And I follow "Claims"
  Then I should not see "Delete"
  
  Scenario: User can delete their own claim from the collection claims list
  
  Given I have Battle 12 prompt meme fully set up
  Given everyone has signed up for Battle 12
  When I claim a prompt from "Battle 12"
  When I go to "Battle 12" collection's page
    And I follow "Claims"
  When I follow "Delete"
  Then I should see "Your claim was deleted."
  When I go to "Battle 12" collection's page
    And I follow "Claims"
  Then I should not see "Delete"
  
  Scenario: User can delete their own claim from the user claims list
  
  Given I have Battle 12 prompt meme fully set up
  Given everyone has signed up for Battle 12
  When I claim a prompt from "Battle 12"
  When I am on my user page
    And I follow "My Claims"
  Then I should see "Delete"
  When I follow "Delete"
  Then I should see "Your claim was deleted."
  When I go to "Battle 12" collection's page
    And I follow "Claims"
  Then I should not see "Delete"
  
  Scenario: Prompt is deleted after response has been posted
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination B
    And I am logged in as "myname4"
    And I claim a prompt from "Battle 12"
  When I fulfill my claim
  When I am logged in as "myname1"
    And I delete my signup for "Battle 12"
  Then I should see "Challenge signup was deleted."
  When I view the work "Fulfilled Story"
  Then I should see "This work is part of an ongoing challenge and will be revealed soon! You can find details here: Battle 12"
    And I should not see "Stargate Atlantis"
  When I am logged in as "myname4"
    And I view the work "Fulfilled Story"
  Then I should see "This work is part of an ongoing challenge and will be revealed soon! You can find details here: Battle 12"
    And I should see "Stargate Atlantis"
    
  Scenario: User can't claim the same prompt twice
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination B
    And I am logged in as "myname4"
    And I claim a prompt from "Battle 12"
    And I view prompts for "Battle 12"
  Then I should see "Already claimed by you"

  Scenario: User edits existing work to fulfill claim
  
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination B
    And I am logged in as "myname4"
    And I claim a prompt from "Battle 12"
    And I post the work "Existing Story"
    And I edit the work "Existing Story"
    And I check "Battle 12 (Anonymous) -  - Stargate Atlantis"
    And I press "Post without preview"
  Then I should see "Battle 12"
  When I follow "Anonymous"
  Then I should see "Mystery work"
    And I should not see "Not fulfilled yet"
  When I reveal works for "Battle 12"
  When I view the work "Existing Story"
    And I follow "Anonymous"
  Then I should see "Response posted on"
    
  Scenario: User edits existing work in another collection to fulfill claim
  
  Given I have Battle 12 prompt meme fully set up
    And I have a collection "Othercoll"
  When I am logged in as "myname1"
  When I sign up for Battle 12 with combination B
    And I am logged in as "myname4"
    And I claim a prompt from "Battle 12"
    And I post the work "Existing Story" in the collection "Othercoll"
    And I edit the work "Existing Story"
    And I check "Battle 12 (Anonymous) -  - Stargate Atlantis"
    And I press "Post without preview"
  Then I should see "Battle 12"
    And I should see "Othercoll"
    
  Scenario: User claims two prompts in one challenge and fulfills one of them
  Given I have Battle 12 prompt meme fully set up
  When I am logged in as "myname2"
  When I sign up for Battle 12 with combination B
  # 1st prompt SG-1, 2nd prompt SGA
  When I am logged in as "myname1"
    And I claim a prompt from "Battle 12"
    # SGA as it's in reverse order
    And I claim a prompt from "Battle 12"
    # SG-1
    And I view prompts for "Battle 12"
  When I start to fulfill my claim
  # this next line shouldn't be needed - there's still a bug somewhere
    And I uncheck "Battle 12 (Anonymous) -  - Stargate SG-1 - Alternate Universe - High School, Something else weird"
    And I press "Preview"
    And I press "Post"
  When I view the work "Fulfilled Story"
  Then I should see "Stargate Atlantis"
    And I should not see "Stargate SG-1"
  When I follow "Anonymous" within "p"
  Then I should see "Stargate Atlantis"
    And I should not see "Stargate SG-1"
  
  Scenario: User claims two prompts in one challenge and fufills both of them at once
  # TODO
  
  Scenario: User claims two prompts in different challenges and fulfills both of them at once
  # TODO

  Scenario: Sign up for several challenges and see My Signups are sorted
  
  Given I have Battle 12 prompt meme fully set up
  When I set up a basic promptmeme "Battle 13"
  When I set up an anon promptmeme "Battle 14" with name "anonmeme"
  When I am logged in as "prolific_writer"
  When I sign up for "Battle 12" fixed-fandom prompt meme
  When I sign up for "Battle 13" many-fandom prompt meme
  When I sign up for "Battle 14" many-fandom prompt meme
  When I am on my user page
    And I follow "My Signups"
  # Then 14 should be the last signup in the table
  # Then show me the page

  Scenario: User is participating in a prompt meme and a gift exchange at once, clicks "Post to fulfill" on the prompt meme and sees the right boxes ticked
  
  Given I have Battle 12 prompt meme fully set up
    And everyone has signed up for Battle 12
  Given I have created the gift exchange "My Gift Exchange"
    And I have opened signup for the gift exchange "My Gift Exchange"
    And everyone has signed up for the gift exchange "My Gift Exchange"
    And I have generated matches for "My Gift Exchange"
    And I have sent assignments for "My Gift Exchange"
  When I am logged in as "myname3"
    And I claim a prompt from "Battle 12"
  When I start to fulfill my claim
  Then the "Battle 12 (myname4) -  - Stargate Atlantis" checkbox should be checked
    And the "My Gift Exchange (myname2)" checkbox should not be checked
    And the "Battle 12 (myname4) -  - Stargate Atlantis" checkbox should be disabled
    And the "My Gift Exchange (myname2)" checkbox should be disabled
    
  Scenario: User posts to fulfill direct from Post New
  Given I have Battle 12 prompt meme fully set up
    And everyone has signed up for Battle 12
  When I am logged in as "myname3"
    And I claim a prompt from "Battle 12"
    And I follow "Post New"
  Then the "Battle 12 (myname4) -  - Stargate Atlantis" checkbox should not be checked
    And the "Battle 12 (myname4) -  - Stargate Atlantis" checkbox should not be disabled
  
  Scenario: User is participating in a prompt meme and a gift exchange at once, clicks "Post to fulfill" on the prompt meme and then changes their mind and fulfills the gift exchange instead
  Given I have Battle 12 prompt meme fully set up
    And everyone has signed up for Battle 12
  Given I have created the gift exchange "My Gift Exchange"
    And I have opened signup for the gift exchange "My Gift Exchange"
    And everyone has signed up for the gift exchange "My Gift Exchange"
    And I have generated matches for "My Gift Exchange"
    And I have sent assignments for "My Gift Exchange"
  When I am logged in as "myname3"
    And I claim a prompt from "Battle 12"
  When I start to fulfill my claim
  When I check "My Gift Exchange (myname2)"
    And I uncheck "Battle 12 (myname4) -  - Stargate Atlantis"
    And I press "Post without preview"
  Then I should not see "This work is part of an ongoing challenge and will be revealed soon! You can find details here: My Gift Exchange"
    And I should see "Battle 12"

  #As a maintainer I can delete whole signups
##Its prompts disappear from the collection
##As a prompter the signup disappears from my dashboard

#As a maintainer I can delete signups after a story has been posted for them
##The story stays part of the collection, is accessible and no longer has the "In response to a prompt by: testy" line.
##As the story author I can edit the story normally.

#As maintainer I deleted a challenge which had already two claimed and one fulfilled prompts
##As a user I now can't access "My Signups" and "My Claims" (500)
##The story fulfilling a prompt, remains accessible and in the collection, it retains the "In response to a prompt by: testy" line. Clicking on "testy" in that line sends me to the collection dashboard showing the "What challenge did you want to work with?" error message.
##Completely deleting the collection, removed the collection and the prompt line from the story. As a user I can now again access "MY Signups" and "My Claims".
    
  Scenario: All the rest of the unrefactored stuff

  Given I have Battle 12 prompt meme fully set up
  Given everyone has signed up for Battle 12
  When I am logged in as "myname4"
  When I claim a prompt from "Battle 12"
  When I close signups for "Battle 12"
  When I am logged in as "myname4"
  When I fulfill my claim
  
  # mod claims a prompt

  When I am logged in as "mod1"
  When I claim a prompt from "Battle 12"
  Then I should see "New claim made."
  
  # mod can still see claims even though it's anonymous

    And I should see "Unfulfilled Claims"
    And I should see "mod" within "#unfulfilled_claims"
    And I should see "myname4" within "#unfulfilled_claims"
    And I should see "Stargate Atlantis" within "#unfulfilled_claims"
    And I should see "Alternate Universe - Historical" within "#unfulfilled_claims"
    And I should not see "Alternate Universe - Historical" within "#fulfilled_claims"
    And I should see "Stargate Atlantis" within "#fulfilled_claims"
    And I should see "myname4" within "#fulfilled_claims"
  
  # mod posts a fic
  
  When I am on my user page
  Then I should see "My Claims (1)" 
  When I follow "My Claims"
  Then I should see "Your Claims"
    And I should not see "In Battle 12"
    And I should see "Writing For" within "#claims_table"
    And I should see "myname4" within "#claims_table"
  When I follow "Post To Fulfill"
    And I fill in "Work Title" with "Fulfilled Story-thing"
    And I select "Not Rated" from "Rating"
    And I check "No Archive Warnings Apply"
    And I fill in "content" with "This is an exciting story about Atlantis, but in a different universe this time"
  When I press "Preview"
    And I press "Post"
  Then I should see "Work was successfully posted"
  
  # fic shows what prompt it is fulfilling when mod views it
  
  When I view the work "Fulfilled Story-thing"
  Then I should see "In response to a prompt by: myname4"
    And I should see "Fandom: Stargate Atlantis"
    And I should see "Anonymous" within ".byline"
    And I should see "For myname4"
    And I should not see "mod1" within ".byline"
    And I should see "Alternate Universe - Historical"
  
  # mod's claim is completed
  
  When I am on my user page
  Then I should see "My Claims (0)"
  When I go to "Battle 12" collection's page
    And I follow "Claims"
  Then I should see "mod1" within "#fulfilled_claims"
    And I should not see "mod1" within "#unfulfilled_claims"
  
  # mod can see claims
  
  When I follow "Prompts"
    And I follow "Show Claims"
  Then I should not see "Claimed by: myname4"
    And I should not see "Claimed by: mod1"
    And I should not see "Claimed by: (Anonymous)"
  When I follow "Show Filled"
  Then I should see "Claimed by: myname4"
    And I should see "Claimed by: mod1"
    And I should not see "Claimed by: (Anonymous)"

  # users can't see claims

  When I follow "Log out"
    And I am logged in as "myname4"
  When I go to "Battle 12" collection's page
    And I follow "Prompts (8)"
    And I follow "Show Claims"
    And I follow "Show Filled"
  Then I should not see "Claimed by: myname4"
    And I should not see "Claimed by: mod1"
    And I should see "Claimed by: (Anonymous)"
  
  # TODO: check that claims can't be viewed

  # check that completed ficlet is unrevealed

  When I view the work "Fulfilled Story-thing"
  Then I should not see "In response to a prompt by: myname4"
    And I should not see "Fandom: Stargate Atlantis"
    And I should not see "Anonymous"
    And I should not see "mod1"
    And I should not see "For myname4"
    And I should not see "Alternate Universe - Historical"
    And I should see "This work is part of an ongoing challenge and will be revealed soon! You can find details here: Battle 12"

  # make challenge revealed but still anon

  When I am logged in as "mod1"
  When I go to "Battle 12" collection's page
    And I follow "Settings"
    And I uncheck "Is this collection currently unrevealed?"
    And I press "Submit"
  Then I should see "Collection was successfully updated"
  # 2 stories are now revealed, so notify the prompters/recipients
    And 2 emails should be delivered
  

  # check ficlet is visible but anon

  When I am logged in as "myname4"
  When I view the work "Fulfilled Story-thing"
  Then I should see "In response to a prompt by: myname4"
    And I should see "Fandom: Stargate Atlantis"
    And I should see "Collections: Battle 12"
    And I should see "Anonymous" within ".byline"
    And I should see "For myname4"
    And I should not see "mod1" within ".byline"
    And I should see "Alternate Universe - Historical"

  # make challenge un-anon

  When I am logged in as "mod1"
  When I go to "Battle 12" collection's page
    And I follow "Settings"
    And I uncheck "Is this collection currently anonymous?"
    And I press "Submit"
  Then I should see "Collection was successfully updated"
  # TODO: Figure out if this is actually right, or if it's covered by the earlier 2 emails. Also, they shouldn't be anon any more
  Then 2 emails should be delivered

  # user can now see claims

  When I am logged in as "myname4"
  When I go to "Battle 12" collection's page
    And I follow "Prompts (8)"
    And I follow "Show Claims"
  Then I should not see "Claimed by: myname4"
    And I should not see "Claimed by: mod1"
    And I should not see "Claimed by: (Anonymous)"
  When I follow "Show Filled"
  Then I should see "Claimed by: myname4"
    And I should see "Claimed by: mod1"
    And I should not see "Claimed by: (Anonymous)"
    
  # user claims an anon prompt

  When I go to "Battle 12" collection's page
    And I follow "Prompts (8)"
  When I press "Claim"
  Then I should see "New claim made."

  # check that anon prompts are still anon on the claims index 
  
    And I should not see "myname2"
    And I should see "Claims (3)"
    
  # check that anon prompts are still anon on the prompts page
  
  When I follow "Prompts"
  Then I should not see "myname2" within "#main"
  
  # check that anon prompts are still anon on the user claims index
  When I am on my user page
    And I follow "My Claims"
  Then I should not see "myname2"
  
  # check that anon prompts are still anon on the claims show
  When I follow "Anonymous"
  Then I should not see "myname2"
    And I should see "Anonymous"
  
  # TODO: check that anon prompts are still anon on the fulfilling work
  
  # check that claims show as fulfilled
  
  When I follow "Log out"
    And I am logged in as "myname4"
    And I go to the collections page
    And I follow "Battle 12"
    And I follow "Claims"
  Then I should see "mod1" within "#fulfilled_claims"
    And I should see "myname4" within "#fulfilled_claims"
  
  # make another claim and then fulfill from the post new form
  When I follow "Prompts ("
  Then I should see "Claim"
  When I press "Claim"
  Then I should see "New claim made"
  When I follow "Post New"
  When I fill in the basic work information for "Existing work"
    And I check "Battle 12 (Anonymous)"
    And I press "Preview"
  Then I should see "Draft was successfully created"
    And I should see "In response to a prompt by: Anonymous"
    # TODO: Figure out why there are still two emails
    And 2 emails should be delivered
    # TODO: Figure this out
  #  And I should see "Collections:"
   # And I should see "Battle 12"
  When I view the work "Existing work"
  Then I should find "draft"
    
  # work left in draft so claim is not yet totally fulfilled
  When I go to "Battle 12" collection's page
    And I follow "Claims"
  Then I should see "myname4" within "#fulfilled_claims"
    And I should see "Response posted on"
    And I should see "Not yet approved"
  When I follow "Response posted on"
  Then I should see "Existing work"
    And I should find "draft"
  When I am on my user page
    And I follow "My Drafts"
    And all emails have been delivered
  Then I should see "Existing work"
    And "Issue 2259" is fixed
    
  # post the draft and it is then fulfilled
  When I follow "Post Draft"
  Then 1 email should be delivered
  Then I should see "Your work was successfully posted"
    And I should see "In response to a prompt by: Anonymous"
  When I go to "Battle 12" collection's page
    And I follow "Claims"
  Then I should see "myname4" within "#fulfilled_claims"
    And I should see "Response posted on"
    # TODO: Figure this out
  #  And I should not see "Not yet approved"
  When I follow "Response posted on"
  Then I should see "Existing work"
    And I should not find "draft"
    
  # fulfill a claim from an existing work
  When I am logged in as "myname1"
    And I go to "Battle 12" collection's page
    And I follow "Prompts ("
  Then I should see "Claim"
  When I press "Claim"
  Then I should see "New claim made"
  When I post the work "Here's one I made earlier"
    And I edit the work "Here's one I made earlier"
    And I check "Battle 12 (Anonymous)"
    And I press "Preview"
  Then I should find "draft"
    And I should see "In response to a prompt by: Anonymous"
    # TODO: Figure this out
  #  And I should see "Collections:"
   # And I should see "Battle 12"
  When I press "Update"
  Then I should see "Work was successfully updated"
    And I should not find "draft"
    And I should see "In response to a prompt by: Anonymous"
  #TODO: Figure this one out, too
  #Then I should see "Collections:"
  #  And I should see "Battle 12"
    
  # work not left in draft so claim is fulfilled
  When I go to "Battle 12" collection's page
    And I follow "Claims"
  Then I should see "myname1" within "#fulfilled_claims"
    And I should see "Response posted on"
    And I should see "Not yet approved"
