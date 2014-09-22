#!/usr/bin/env ruby

require_relative 'coords.rb'

responses = {}
revs = {}

COORDS.each do |coord,name|
  responses[coord] = IO.popen("curl http://www.mateuszskutnik.com/submachine/subnet_data/#{coord}.swf -sr 4-8")
end

responses.each do |coord, response|
  revs[coord] = response.readlines[0].unpack("L<")[0]
end

output = '{| class="article-table sortable"
!Name
!data-sort-type="text"|Coords
!data-sort-type="number"|REV size
|-
'

COORDS.each do |coord,name|
  output += "|[[#{name}]]\n"
  output += "|#{coord}\n"
  output += "|#{revs[coord]}\n"
  output += "|-\n"
end

output += "|}"

puts output
