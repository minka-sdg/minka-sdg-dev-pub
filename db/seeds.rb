# frozen_string_literal: true

site = Site.find_or_create_by(name: 'Site', url: 'http://localhost:3000')
user = User.create(login: 'admin', password: 'passwd', password_confirmation: 'passwd', email: 'email@domain.com', site: site)
SiteAdmin.create(user: user, site: site)
