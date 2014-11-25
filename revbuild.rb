#!/usr/bin/env ruby

coords = {
  '000' => 'Lab Facility Number 493',
  '001' => 'The Lab',
  '002' => 'Rusty pit',
  '006' => 'Stone loop',
  '010' => 'Tri-gem room',
  '011' => 'The Clockwork Corridor',
  '043' => 'Second tomb',
  '051' => 'Ouroboros tunnel',
  '076' => 'Road room',
  '100' => 'Sub-bot research room',
  '103' => 'Ancient Ruins',
  '104' => 'Ancient section',
  '128' => 'The Defense Network (second area)',
  '157' => 'Laser room',
  '185' => 'The Paired Gem Room',
  '192' => 'Stone Room',
  '218' => 'The Church',
  '232' => 'Kent Falls room',
  '241' => 'The Searchlight Room',
  '245' => 'Cake loop',
  '258' => 'The Nazca Room',
  '277' => 'The Radio Lab',
  '291' => 'Sanctuary',
  '304' => 'Lighthouse basement',
  '314' => 'The Pi Room',
  '316' => 'Winter room',
  '317' => 'Mover room',
  '355' => 'Murtaugh\'s Communication Room',
  '378' => 'Ziggurat',
  '399' => 'The Stalagmite Room',
  '404' => 'Error room',
  '411' => 'Escher room',
  '442' => 'The Pit',
  '452' => 'The Statue',
  '461' => 'The Sewers',
  '462' => 'Lighthouse digouts',
  '472' => 'The Listeners Room',
  '523' => 'The Twins Room',
  '529' => 'Basement section',
  '541' => 'Observation center',
  '550' => 'Lighthouse dungeon',
  '551' => 'Brick room',
  '552' => 'The Root',
  '553' => 'The Root (second area)',
  '555' => 'The Loop (Submachine Universe)|The Loop',
  '580' => 'The End Ruins',
  '596' => 'Exit',
  '601' => 'The Zero Depths',
  '613' => 'The Void',
  '614' => 'The Void (second area)',
  '628' => 'The Study',
  '642' => 'The Clockwork Room',
  '666' => 'Hell',
  '672' => 'New Basement',
  '690' => 'Looping traps',
  '712' => 'The Watch Station',
  '728' => 'Lucky Room',
  '731' => 'Escape from Jay Is Games Room',
  '747' => 'Corridor',
  '757' => 'The Defense Network',
  '770' => 'Tomb trap',
  '777' => 'The Barracks',
  '800' => 'The ship',
  '806' => 'Cliffs',
  '815' => 'Lost plane',
  '837' => 'UVB-76 room',
  '859' => 'The Collector\'s Room',
  '875' => 'Prison cells',
  '888' => 'Cube Loop',
  '902' => 'The Vista',
  '917' => 'The Looping Sphere',
  '923' => 'Solitary Confinement',
  '947' => 'The Gem Harvester',
  '966' => 'Altar',
  '987' => 'The Broken Clock Room',
  '992' => 'Excavation site'
}

# starting the mediawiki table off
puts '{| class="article-table sortable"
!Name
!data-sort-type="text"|Coords
!data-sort-type="number"|REV size
|-
'

coords.each do |coord, name|
  url = "http://www.mateuszskutnik.com/submachine/subnet_data/#{coord}.swf"
  rev_size = IO.popen(['curl', url, '-sr 4-7']).read.unpack('L<')[0]

  puts "|[[#{name}]]\n"
  puts "|#{coord}\n"
  puts "|#{rev_size}\n"
  puts "|-\n"
end

# ending the table
puts '|}'
