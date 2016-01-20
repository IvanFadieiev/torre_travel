20.times do |i|
  comments = Comment.create(
    name: "test_user#{i + 1}",
    email: "post#{i + 1}@test.com",
    body: "#{i + 1} good :thumbsup::thumbsup::thumbsup:"
    )
  comments2 = Comment.create(
    name: "test_user#{i*2 + 1}",
    email: "post#{i*2 + 1}@test.com",
    body: ":thumbsup::thumbsdown::ok_hand::v::clap::smile::relaxed::heart_eyes::weary::sob::rage::sunglasses::smiling_imp::sunny::umbrella::cloud::ocean::foggy:"
    )
end
5.times do
  housing = TorreTravel.create(
    housing: :chelet,
    distance_m: '300',
    price: '500',
    description: 'good chelet',
    description_es: 'good chelet',
    address: 'Spain',
    reserved: :unreserv
    )
end
5.times do
  housing = TorreTravel.create(housing: :bungalo,
    distance_m: '300',
    price: '800',
    description: 'good bungalo',
    description_es: 'good bungalo',
    address: 'Spain',
    reserved: :unreserv
    )
end
5.times do
  housing = TorreTravel.create(
    housing: :flat,
    distance: :first_line,
    price: '800',
    description: 'good flat 1line',
    description_es: 'good flat 1line',
    address: 'Spain',
    reserved: :unreserv
    )
end
5.times do
  housing = TorreTravel.create(
    housing: :flat,
    distance: :second_line,
    price: '600',
    description: 'good flat 2line',
    description_es: 'good flat 2line',
    address: 'Spain',
    reserved: :unreserv
    )
end
5.times do
  housing = TorreTravel.create(
    housing: :house,
    distance_m: '500',
    price: '1500',
    description: 'good house',
    description_es: 'good house',
    address: 'Spain',
    reserved: :unreserv
    )
end
