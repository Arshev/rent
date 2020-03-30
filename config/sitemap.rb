# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://amigorent.ru"
SitemapGenerator::Sitemap.sitemaps_path = 'shared/'
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  # #
  # Examples:
  #
  # Add '/articles'
  #
    add cars_path, :priority => 0.7, :changefreq => 'daily'
    add abouts_path, :priority => 0.3, :changefreq => 'weekly'
    add root_path, :priority => 0.7, :changefreq => 'daily'
    add faqs_path, :priority => 0.3, :changefreq => 'weekly'
    add prices_path, :priority => 0.7, :changefreq => 'daily'
    add contacts_path, :priority => 0.3, :changefreq => 'weekly'
    add bookings_path, :priority => 0.3, :changefreq => 'weekly'
  #
  # Add all articles:
  #
    Car.find_each do |car|
      add car_path(car), :lastmod => car.updated_at
    end
end
