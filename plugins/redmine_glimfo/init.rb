require 'redmine'

Redmine::Plugin.register :redmine_glimfo do
  name 'Glimfo Branding Plugin'
  author 'Glimfo Engineering'
  description 'Customizations and branding overrides for Glimfo Projects'
  version '1.0.0'
  url 'https://projects.glimfo.com'
  author_url 'https://glimfo.com'
  
  # Ensure our plugin loads after others if needed
  requires_redmine version_or_higher: '5.0.0'
end

# In a real scenario, this plugin uses Deface or standard Redmine View Hooks
# to inject custom HTML, override the login screen layout, or modify the footer.
#
# Example of a View Hook:
# class GlimfoLayoutHook < Redmine::Hook::ViewListener
#   def view_layouts_base_html_head(context = {})
#     stylesheet_link_tag('custom', :plugin => 'redmine_glimfo')
#   end
# end
