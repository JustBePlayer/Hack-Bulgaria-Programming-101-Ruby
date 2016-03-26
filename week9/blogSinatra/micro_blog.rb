require "sinatra"
require "sqlite3"

# Open a database


# Create a database
SQLite3::Database.new( "blogtest.db" ) do |db|
  db.execute("
  	CREATE TABLE IF NOT EXISTS microposts(
  		id INTEGER PRIMARY KEY,
  		name VARCHAR(100),
  		content TEXT
  		);
  	")

end

#db = SQLite3::Database.new "microposts.db"

class Post

	attr_reader :id, :name, :content
	def initialize(id, name, content)
		@id, @name, @content = id, name,content
	end

end
BLOGPOSTS = []
RAND_ID = 1
get "/" do
	#BLOGPOSTS.map(&:name).join(',')
	#@posts = BLOGPOSTS
	db = SQLite3::Database.new "blogtest.db"
	query = db.execute("
		SELECT * FROM microposts; 
		")
	@posts = []
	query.each {|q| @posts << Post.new(*q)}
	erb :list_posts
end

get "/new" do
	erb :create
end

get "/:id" do
	#if post.any? { |foo| foo.id == params[:id].to_i }
		#BLOGPOSTS.find {|foo| foo.id == params[:id].to_i}.name
	#else
		#"Emi nema"
	#end
	db = SQLite3::Database.new "blogtest.db"
	db.execute("select name from microposts where id=#{params[:id].to_i};").flatten.first

end

delete "/:id" do |id|
	#BLOGPOSTS.delete { |del| del.id == id.to_i }
	#BLOGPOSTS.select { |del| del.id == id.to_i }.each do |del|
	#	BLOGPOSTS.delete(del)
	#end

	db = SQLite3::Database.new "blogtest.db"
	db.execute("delete from microposts where id=#{id} ")
	redirect "/"


end

get "/delete/:id" do
	@id = params[:id].to_i
	erb :delete 
end



post "/new" do 
	BLOGPOSTS << Post.new(RAND_ID, params[:name], params[:content])

	db = SQLite3::Database.new "blogtest.db"

	last = db.execute("select max(id) from microposts;").flatten.first
	db.execute("INSERT INTO microposts(id, name, content) VALUES(#{last + 1},'#{params[:name]}', '#{params[:content]}')")
	RAND_ID += 1
	redirect "/"
end






