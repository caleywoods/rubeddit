Factory.define :user do |u|
  u.email 'test@test.com'
  u.password 'letmein'
end

Factory.define :link do |l|
  l.id '1'
  l.title 'Reddit'
  l.url 'http://reddit.com'
  l.user_id '1'
end
