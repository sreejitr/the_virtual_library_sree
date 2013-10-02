json.array!(@libraryebooks) do |libraryebook|
  json.extract! libraryebook, :name, :author, :genre, :abstract, :loanamount
  json.url libraryebook_url(libraryebook, format: :json)
end