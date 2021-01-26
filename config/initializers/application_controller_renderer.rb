# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end
WillPaginate::ViewHelpers.pagination_options = {
  :class          => 'pagination',
  :previous_label => '&laquo;前へ',
  :next_label     => '次へ&raquo;',
  :inner_window   => 4, # links around the current page
  :outer_window   => 1, # links around beginning and end
  :separator      => ' ', # single space is friendly to spiders and non-graphic browsers
  :param_name     => :page,
  :params         => nil,
  :renderer       => 'WillPaginate::ViewHelpers::LinkRenderer',
  :page_links     => true,
  :container      => true
}
