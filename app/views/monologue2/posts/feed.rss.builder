xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title Monologue2::Config.site_name
    xml.description Monologue2::Config.meta_description
    xml.link root_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description raw(post.content)
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link Monologue2::Config.site_url + post.full_url
        xml.guid Monologue2::Config.site_url + post.full_url
      end
    end
  end
end