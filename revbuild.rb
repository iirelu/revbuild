#!/usr/bin/env ruby

coords = {
  "000" => "Lab Facility Number 493",
  "001" => "The Lab",
  "002" => "The Rusty Pit",
  "006" => "The Stone Loop",
  "010" => "The Tri-Gem Room",
  "011" => "The Clockwork Corridor",
  "043" => "Second Tomb",
  "051" => "The Ouroboros Tunnel",
  "076" => "The Road Room",
  "100" => "The Sub-Bot Research Room",
  "103" => "Ancient Ruins",
  "104" => "The Ancient Section",
  "128" => "The Defense Network (second area)",
  "157" => "Laser Room",
  "185" => "The Paired Gem Room",
  "192" => "Stone Room",
  "218" => "The Church",
  "232" => "The Kent Falls Room",
  "241" => "The Searchlight Room",
  "245" => "Cake loop",
  "258" => "The Nazca Room",
  "277" => "The Radio Lab",
  "291" => "The Sanctuary",
  "304" => "Lighthouse basement",
  "314" => "The Pi Room",
  "316" => "Winter Room",
  "317" => "The Mover Room",
  "355" => "Murtaugh's Communication Room",
  "378" => "The Ziggurat",
  "399" => "The Stalagmite Room",
  "404" => "The Error Room",
  "411" => "The Escher Room",
  "442" => "The Pit",
  "452" => "The Statue",
  "461" => "The Sewers",
  "462" => "Lighthouse digouts",
  "472" => "The Listeners Room",
  "523" => "The Twins Room",
  "529" => "Basement section",
  "541" => "Observation center",
  "550" => "Lighthouse dungeon",
  "551" => "Brick room",
  "552" => "The Root",
  "553" => "The Root (second area)",
  "555" => "The Loop (SNEE)|The Loop",
  "580" => "The End Ruins",
  "596" => "Exit",
  "601" => "The Zero Depths",
  "613" => "The Void",
  "614" => "The Void (second area)",
  "628" => "The Study",
  "642" => "The Clockwork Room",
  "666" => "Hell",
  "672" => "New Basement",
  "690" => "Looping traps",
  "712" => "The Watch Station",
  "728" => "Lucky Room",
  "731" => "Escape from Jay Is Games Room",
  "747" => "The Corridor",
  "757" => "The Defense Network",
  "770" => "Tomb trap",
  "777" => "The Barracks",
  "800" => "The Ship",
  "806" => "The Cliffs",
  "815" => "The Lost Plane",
  "837" => "UVB-76 room",
  "859" => "The Collector's Room",
  "875" => "The Prison Cells",
  "888" => "Cube Loop",
  "902" => "The Vista",
  "917" => "The Looping Sphere",
  "923" => "Solitary Confinement",
  "947" => "The Gem Harvester",
  "966" => "The Altar",
  "987" => "The Broken Clock Room",
  "992" => "The Excavation Site"
}

responses = {}
revs = {}

coords.each do |coord,name|
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

coords.each do |coord,name|
  output += "|[[#{name}]]\n"
  output += "|#{coord}\n"
  output += "|#{revs[coord]}\n"
  output += "|-\n"
end

output += "|}"

puts output
