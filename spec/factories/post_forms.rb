FactoryBot.define do
  factory :post_form do
    title { 'タイトル' }
    content { '投稿内容' }
    shooting_date { '2023-01-01' }
    latitude { '35.000' }
    longitude { '135.000' }
  end

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
