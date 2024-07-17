# Kanbam Board

### Ruby and rails versions
* Ruby version: 3.3.0
* Rails version: 7.1.3.2

### Database
* PostgreSQL

## Sortable and related gems info
Following this youtube [video](https://www.youtube.com/watch?v=OZWhN4Gtjos&ab_channel=SupeRails). This allows the cards and columns to be sorted and for this data to be stored on the database.

* Sortablejs-rails gem version: [1.15.0](https://github.com/itmammoth/rails_sortable)
* Ranked-model gem: [0.4.9](https://github.com/brendon/ranked-model)
* Requestjs-rails gem: [0.0.11](https://github.com/rails/requestjs-rails)

## Nested forms 

### For board creation
Following this youtube [video](https://www.youtube.com/watch?v=7JNRZLTRDCc&ab_channel=Deanin). This is a stimulus controller that allows for columns to be added or removed when a new board is created. Info for nested forms in stimulus is [here](https://www.stimulus-components.com/docs/stimulus-rails-nested-form). It is essentially the same as the video, but the video explains it better. 

### For comments
This [tutorial](https://dev.to/jamgar/how-to-create-a-comment-and-reply-system-in-ruby-on-rails-10ld) was followed to create the nested forms required for comments and replies. 

### For likes 
This [tutorial](https://medium.com/swlh/how-to-add-a-simple-like-button-to-your-rails-6-application-c1040999dc2) was followed to create likes. 

## Subscribers
Users can subsrcibe to other boards. The assocaition is a have many through association through the other_boards model. The model contains the subscriber (user) id and kanban_board_id. 



