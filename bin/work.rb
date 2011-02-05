#!/usr/bin/env ruby
# The term-workspace command line utility

options1 = {
:profile => "Defaule",
:geometry=>"165x54+0+0",
:tabs => [
  {
    :title   => "vim",
    :command => "vim"
  },
  {
    :title   => "app",
    :dir     => "./app",
    :command => "vim"
  },
  {
    :title   => "app",
    :dir     => "./app/styles",
    :command => "vim"
  },
  {
    :title   => "app",
    :dir     => "./spec",
    :command => "vim"
  },
  {},
  {
    :title   => "app",
    :command => "rails c"
  }
]
}
options2 = {
  :profile  => "Small",
  :geometry => "91x28+10000+10000",
  :tabs => [
    {:command => "autotest"},
    {:command => "compass watch"},
    {:command => "rails s"}
  ]
}

def open_gterm_window(options)
  args = []
  args <<= "--profile=\"#{options[:profile]}\"" unless options[:profile].nil?
  args <<= "--geometry=#{options[:geometry]}"  unless options[:geometry].nil?
  
  options[:tabs].each do |tab|
    args <<= "--tab"
    args <<= "--title=\"#{tab[:title]}\""     unless tab[:title].nil?
    args <<= "--command=\"bash -c \\\"#{tab[:command].gsub("\"", "\\\"")}\\\"\"" unless tab[:command].nil?
    args <<= "--working-directory=\"#{File.expand_path(tab[:dir])}\"" unless tab[:dir].nil?
  end unless options[:tabs].nil?
  s = "gnome-terminal #{[args].join(" ")}"
  puts s
  puts `#{s}`
end

[options1, options2].each do |options|
  open_gterm_window options
end

begin
  args = []
  args <<= "--geometry=165x54+0+0"
  profileSelect = ["--tab", "--profile=Default"]

  args <<= [profileSelect, "--title=vim",    "--command=vim", "--active"]
  args <<= [profileSelect, "--title=app",    "--working-directory=\"#{File.expand_path('./app/')}\"", "--command=vim"]
  args <<= [profileSelect, "--title=styles", "--working-directory=\"#{File.expand_path('./app/stylesheets')}\"", "--command=vim"]
  args <<= [profileSelect, "--title=spec",   "--working-directory=\"#{File.expand_path('./spec/')}\"", "--command=vim"]
  args <<= [profileSelect, "--title=term"]
  args <<= [profileSelect, "--title=rails-console", "--command=\"./script/rails c\""]

  s = "gnome-terminal #{[args].join(" ")}"
  puts s
  puts `#{s}`
end unless true

begin
  args = []

  args <<= "--geometry=91x28+13300+800"
  profileSelect = "--tab-with-profile=Small"

  args += [profileSelect]*3

  `gnome-terminal #{[args].join(" ")}`
end unless true
