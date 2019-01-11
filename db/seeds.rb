# Add seed data here. Seed your database with `rake db:seed`
# Artist.destroy_all
# Genre.destroy_all
# ArtistGenre.destroy_all
#
# amy = Artist.create(name:"Amy")
# john = Artist.create(name:"John")
#
# rock = Genre.create(name:"rock")
# pop = Genre.create(name:"pop")
#
# ArtistGenre.create(artist_id: amy.id, genre_id: rock.id)
# ArtistGenre.create(artist_id: john.id, genre_id: pop.id)
# ArtistGenre.create(artist_id: amy.id, genre_id: pop.id)

LibraryParser.parse
