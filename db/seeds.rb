# coding: utf-8

puts 'Seeding the database...'

[
    { pt: 'Art', en: 'Art' },
    { pt: 'Visual Arts', en: 'Visual Arts' },
    { pt: 'Circus', en: 'Circus' },
    { pt: 'Community', en: 'Community' },
    { pt: 'Humor', en: 'Humor' },
    { pt: 'Comicbooks', en: 'Comicbooks' },
    { pt: 'Dance', en: 'Dance' },
    { pt: 'Design', en: 'Design' },
    { pt: 'Events', en: 'Events' },
    { pt: 'Fashion', en: 'Fashion' },
    { pt: 'Gastronomy', en: 'Gastronomy' },
    { pt: 'Film & Video', en: 'Film & Video' },
    { pt: 'Games', en: 'Games' },
    { pt: 'Journalism', en: 'Journalism' },
    { pt: 'Music', en: 'Music' },
    { pt: 'Photography', en: 'Photography' },
    { pt: 'Science & Technology', en: 'Science & Technology' },
    { pt: 'Theatre', en: 'Theatre' },
    { pt: 'Sport', en: 'Sport' },
    { pt: 'Web', en: 'Web' },
    { pt: 'Carnival', en: 'Carnival' },
    { pt: 'Architecture & Urbanism', en: 'Architecture & Urbanism' },
    { pt: 'Literatura', en: 'Literature' },
    { pt: 'Mobility & Transportation', en: 'Mobility & Transportation' },
    { pt: 'Environment', en: 'Environment' },
    { pt: 'Social Business', en: 'Social Business' },
    { pt: 'Education', en: 'Education' },
    { pt: 'Fiction Films', en: 'Fiction Films' },
    { pt: 'Documentary Films', en: 'Documentary Films' },
    { pt: 'Experimental Films', en: 'Experimental Films' }
].each do |name|
   category = Category.find_or_initialize_by(name_pt: name[:pt])
   category.update_attributes({
     name_en: name[:en]
   })
 end

{
  company_name: 'Pluribus Fund',
  company_logo: 'https://www.dropbox.com/s/m10p9cen53ie7fb/logothumb.png',
  host: 'pluribusfund.com',
  base_url: "http://pluribusfund.com",

  email_contact: 'contact@pluribusfund.com',
  email_payments: 'finance@pluribusfund.com',
  email_projects: 'projects@pluribusfund.com',
  email_system: 'system@pluribusfund.com',
  email_no_reply: 'no-reply@pluribusfund.com',
  facebook_url: "http://facebook.com/pluribusfund",
  facebook_app_id: '253265074820551',
  twitter_url: 'http://twitter.com/pluribusfund',
  twitter_username: "pluribusfund",
  mailchimp_url: "http://catarse.us5.list-manage.com/subscribe/post?u=ebfcd0d16dbb0001a0bea3639&amp;id=149c39709e",
  catarse_fee: '0.05',
  support_forum: 'http://support.pluribusfund.com/',
  base_domain: 'pluribusfund.com',
  uservoice_secret_gadget: 'change_this',
  uservoice_key: 'uservoice_key',
  faq_url: 'http://suporte.catarse.me/',
  feedback_url: 'http://suporte.catarse.me/forums/103171-catarse-ideias-gerais',
  terms_url: 'http://suporte.catarse.me/knowledgebase/articles/161100-termos-de-uso',
  privacy_url: 'http://suporte.catarse.me/knowledgebase/articles/161103-pol%C3%ADtica-de-privacidade',
  about_channel_url: 'http://blog.catarse.me/conheca-os-canais-do-catarse/',
  instagram_url: 'http://instagram.com/catarse_',
  blog_url: "http://blog.pluribusfund.com",
  github_url: 'http://github.com/BPluribus81',
  contato_url: 'http://support.pluribusfund.com/',
  aws_access_key: 'AKIAJFWWMSLZZLXTZABQ',
  aws_secret_key: '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',
  aws_bucket: 'Pluribus'

}.each do |name, value|
   conf = Configuration.find_or_initialize_by(name: name)
   conf.update_attributes({
     value: value
   }) if conf.new_record?
end


Channel.find_or_create_by!(name: "Channel name") do |c|
  c.permalink = "sample-permalink"
  c.description = "Lorem Ipsum"
end


OauthProvider.find_or_create_by!(name: 'facebook') do |o|
  o.key = '253265074820551'
  o.secret = 'd78913e2d408a56c1d79b71d5b0ee813'
  o.path = 'facebook'
end

puts
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts
end


puts
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

Configuration.all.each do |conf|
  a = conf.attributes
  puts "  #{a['name']}: #{a['value']}"
end

puts '---------------------------------------------'
puts 'Done!'
