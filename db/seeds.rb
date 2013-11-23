# coding: utf-8

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
   category = Category.find_or_initialize_by_name_pt name[:pt]
   category.update_attributes({
     name_en: name[:en]
   })
 end

[
  'confirm_backer','payment_slip','project_success','backer_project_successful',
  'backer_project_unsuccessful','project_received', 'project_received_channel', 'updates','project_unsuccessful',
  'project_visible','processing_payment','new_draft_project', 'new_draft_channel', 'project_rejected',
  'pending_backer_project_unsuccessful', 'project_owner_backer_confirmed', 'adm_project_deadline',
  'project_in_wainting_funds', 'credits_warning', 'backer_confirmed_after_project_was_closed', 
  'backer_canceled_after_confirmed', 'temporary_password'
].each do |name|
  NotificationType.find_or_create_by_name name
end

{
  company_name: 'Pluribus Fund',
  host: 'pluribusfund.com',
  base_url: "http://pluribusfund.com",
  blog_url: "http://blog.pluribusfund.com",
  email_contact: 'contact@pluribusfund.com',
  email_payments: 'finance@pluribusfund.com',
  email_projects: 'projects@pluribusfund.com',
  email_system: 'system@pluribusfund.com',
  email_no_reply: 'no-reply@pluribusfund.com',
  facebook_url: "http://facebook.com/pluribusfund",
  facebook_app_id: '173747042661491',
  twitter_username: "pluribusfund",
  mailchimp_url: "http://catarse.us5.list-manage.com/subscribe/post?u=ebfcd0d16dbb0001a0bea3639&amp;id=149c39709e",
  catarse_fee: '0.13',
  support_forum: 'http://support.pluribusfund.com/',
  base_domain: 'pluribusfund.com',
  uservoice_secret_gadget: 'change_this',
  uservoice_key: 'uservoice_key'
}.each do |name, value|
   conf = Configuration.find_or_initialize_by_name name
   conf.update_attributes({
     value: value
   })
end


Channel.find_or_create_by_name!(
  name: "Channel name",
  permalink: "sample-permalink",
  description: "Lorem Ipsum"
)


OauthProvider.find_or_create_by_name!(
  name: 'facebook',
  key: 'your_facebook_app_key',
  secret: 'your_facebook_app_secret',
  path: 'facebook'
)
