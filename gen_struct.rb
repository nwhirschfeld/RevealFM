#!/usr/bin/env ruby
require 'xmlsimple'
require "erb"

include ERB::Util

# erb = ERB.new File.read "erb/main.erb"
#

$erb_cnt = 1

$path = "content"
$file = "struct.mm"

def get_icon node
	nil
        return nil if node.nil?
	node["icon"].map{|x| x["BUILTIN"] if x["BUILTIN"] } if node["icon"]
end

def has_icon node, icon
        icons = get_icon(node)
        return false if icons.nil?
        icons.include? icon
end

def compile file
  $erb_cnt += 1
  ERB.new(File.read(file), nil, nil, "_#{$erb_cnt}").result
end

@config = XmlSimple.xml_in($file, { 'KeyAttr' => 'TEXT' })



#puts compile "erb/content.erb"
puts compile "erb/main.erb"
