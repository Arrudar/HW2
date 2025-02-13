# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"

# Generate models and tables, according to the domain model.
# TODO!
puts "Done!"

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
new_studio = Studio.new
new_studio["name"] = "Warner Bros"
new_studio.save
#
warner_bros = Studio.create(name: "Warner Bros")

batman_begins = warner_bros.movies.create(title: "Batman Begins", year_released: 2005, rated: "PG-13")
dark_knight = warner_bros.movies.create(title: "The Dark Knight", year_released: 2008, rated: "PG-13")
dark_knight_rises = warner_bros.movies.create(title: "The Dark Knight Rises", year_released: 2012, rated: "PG-13")

#
christian_bale = Actor.create(name: "Christian Bale")
michael_caine = Actor.create(name: "Michael Caine")
liam_neeson = Actor.create(name: "Liam Neeson")
katie_holmes = Actor.create(name: "Katie Holmes")
gary_oldman = Actor.create(name: "Gary Oldman")
heath_ledger = Actor.create(name: "Heath Ledger")
aaron_eckhart = Actor.create(name: "Aaron Eckhart")
maggie_gyllenhaal = Actor.create(name: "Maggie Gyllenhaal")
tom_hardy = Actor.create(name: "Tom Hardy")
joseph_gordon_levitt = Actor.create(name: "Joseph Gordon-Levitt")
anne_hathaway = Actor.create(name: "Anne Hathaway")

#
#batman = Movie.find_by({ "title" => "Batman Begins" })
#christian = Actor.find_by({ "name" => "Christian Bale" })

# Add roles dynamically using associations.
batman_begins.roles.create(actor: christian_bale, character_name: "Bruce Wayne")
batman_begins.roles.create(actor: michael_caine, character_name: "Alfred")
batman_begins.roles.create(actor: liam_neeson, character_name: "Ra's Al Ghul")
batman_begins.roles.create(actor: katie_holmes, character_name: "Rachel Dawes")
batman_begins.roles.create(actor: gary_oldman, character_name: "Commissioner Gordon")

# Add roles for The Dark Knight
dark_knight.roles.create(actor: christian_bale, character_name: "Bruce Wayne")
dark_knight.roles.create(actor: heath_ledger, character_name: "Joker")
dark_knight.roles.create(actor: aaron_eckhart, character_name: "Harvey Dent")
dark_knight.roles.create(actor: michael_caine, character_name: "Alfred")
dark_knight.roles.create(actor: maggie_gyllenhaal, character_name: "Rachel Dawes")

# Add roles for The Dark Knight Rises
dark_knight_rises.roles.create(actor: christian_bale, character_name: "Bruce Wayne")
dark_knight_rises.roles.create(actor: gary_oldman, character_name: "Commissioner Gordon")
dark_knight_rises.roles.create(actor: tom_hardy, character_name: "Bane")
dark_knight_rises.roles.create(actor: joseph_gordon_levitt, character_name: "John Blake")
dark_knight_rises.roles.create(actor: anne_hathaway, character_name: "Selina Kyle")

#new_role = Role.new
#new_role["movie_id"] = 1
#new_role["actor_id"] = 1
#new_role["character_name"] = "Bruce Wayne"
#new_role.save

#new_role = Role.new
#new_role["movie_id"] = 1
#new_role["actor_id"] = 2
#new_role["character_name"] = "Alfred"
#new_role.save

#new_role = Role.new
#new_role["movie_id"] = 1
#new_role["actor_id"] = 3
#new_role["character_name"] = "Ra's Al Ghul"
#new_role.save

#new_role = Role.new
#new_role["movie_id"] = 1
#new_role["actor_id"] = 4
#new_role["character_name"] = "Rachel Dawes"
#new_role.save

#new_role = Role.new
#new_role["movie_id"] = 1
#new_role["actor_id"] = 5
#new_role["character_name"] = "Commissioner Gordon"
#new_role.save

puts "Studios: #{Studio.all.count}" 
puts "Movies: #{Movie.all.count}" 
puts "Roles: #{Role.all.count}" 
puts "Actors: #{Actor.all.count}" 

# Prints a header for the movies output
puts ""
puts ""
puts "Movies"
puts "======"
puts ""


# Query the movies data and loop through the results to display the movies output.
# TODO!

# Query all movies
movies = Movie.includes(:studio)

# Loop through each movie and display its details
for movie in movies
  # Read each movie's attributes
  title = movie.title
  year_released = movie.year_released
  rated = movie.rated
  studio_name = movie.studio&.name || "[Studio Missing]" # Handle missing studios

  # Display the movie details
  puts "#{title.ljust(25)} #{year_released} #{rated.ljust(10)} #{studio_name}"
end

puts ""

movies.each do |movie|
    puts "Movie: #{movie.title}, Studio ID: #{movie.studio_id}, Studio Name: #{movie.studio&.name || 'None'}"
  end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!


# Query all movies with their roles and actors preloaded
movies = Movie.includes(roles: :actor)

# Loop through each movie and display its cast
for movie in movies
  # Safeguard for missing movies (shouldn't happen if data is correct)
  if movie.nil?
    puts "[Movie Missing]"
    next # Skip to the next iteration if the movie is missing
  end

  # Loop through each role in the current movie
  for role in movie.roles
    # Safeguard for missing actors or character names gracefully
    actor_name = role.actor&.name || "[Actor Missing]"
    character_name = role.character_name || "[Character Missing]"

    # Display the cast details for this role in the current movie
    puts "#{movie.title.ljust(25)} #{actor_name.ljust(20)} #{character_name}"
  end

  # Add spacing between movies for readability (optional)
end