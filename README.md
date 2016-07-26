# bookmark_manager

## User Stories

As a User
So that I can keep track of my bookmarks
I want to see a list of links in chronological order

As a User
So that I can update my bookmarks
I want to add new links

As a User
So that I can manage my bookmarks
I want to add tags to the links

As a User
So that I can easily find my bookmarks
I want to filter the links by tag


## Domain Model


| User        | Message         |
|-------------|-----------------|
| bookmarks   |  see_link       |
| bookmarks   |  add_link       |
| bookmarks   |  add_tags       |
| bookmarks   |  filter         |

bookmarks <-- see_link --> list
bookmarks <-- add_link --> new link
bookmarks <-- add_tags --> new tags
bookmarks <-- filter --> sort tags
