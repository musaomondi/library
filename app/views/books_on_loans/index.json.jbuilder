json.array!(@books_on_loans) do |books_on_loan|
  json.extract! books_on_loan, :id, :book_id, :user_id
  json.url books_on_loan_url(books_on_loan, format: :json)
end
