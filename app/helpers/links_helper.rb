module LinksHelper

  def url_takes_a_bath(url)
    URI.parse(url).host[/(?:www\.)?(.*)/,1]
  end

end
