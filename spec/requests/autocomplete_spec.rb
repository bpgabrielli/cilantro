require 'rails_helper'

describe 'Tag Autocompletion' do
  it 'returns 200 OK' do
    get '/api/tags/autocompletions', {term: 'ch'}
    expect(response).to be_success
  end

  it 'returns all possible tag name completions for given fragment' do
    Tag.create(title: 'cheese')
    Tag.create(title: 'chocolate')
    Tag.create(title: 'milk')
    get '/api/tags/autocompletions', {term: 'ch'}
    expect(JSON.parse(response.body)).to match_array(['cheese', 'chocolate'])
  end
end
