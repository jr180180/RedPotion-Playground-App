# schema "0001 initial" do

#   # Examples:
#   #
#   # entity "Person" do
#   #   string :name, optional: false
#   #
#   #   has_many :posts
#   # end
#   #
#   # entity "Post" do
#   #   string :title, optional: false
#   #   string :body
#   #
#   #   datetime :created_at
#   #   datetime :updated_at
#   #
#   #   has_many :replies, inverse: "Post.parent"
#   #   belongs_to :parent, inverse: "Post.replies"
#   #
#   #   belongs_to :person
#   # end

# end


schema "0001 initial" do
  entity "MyModel" do
    # Define anything you want to here
    string :name, optional: false
    integer32 :something_else, default: 5
    integer32 :id, optional: false

    # These are special CDQ properties that get populated automatically.
    # They are not required, but are very helpful.
    datetime :created_at
    datetime :updated_at
  end
end