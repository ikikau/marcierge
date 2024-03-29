# encoding: utf-8

module ApplicationHelper

  def default_meta_tags
  {
    :title       => 'ちょっとした週末の贅沢をお届け。 | marcierge',
    # :description => 'Member login page.',
    # :keywords    => 'Site, Login, Members',
    # :separator   => "&mdash;".html_safe,
  }
  end


  #  Scripts Loader
  #-----------------------------------------------
  def view_asset(action = true, dir = 'javascripts', ext = '.js*')
    module_name = [
      controller_namespace,
      'views',
      controller_name,
      action && action_name
    ].compact * '/'

    file = "#{Rails.root}/app/assets/#{dir}/#{module_name}#{ext}"

    module_name if Dir.glob(file).any?
  end

  def view_script_tag
    script = view_asset || view_asset(false)

    raw "<script>require(['#{script}']);</script>" if script
  end

  #  Image preloader
  #-----------------------------------------------
  def image_preloader(src, options = {})
    options['data-src'] = src
    # data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==
    image_tag 'common/preloader.gif', options
  end

end
