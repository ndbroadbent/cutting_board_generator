#!/usr/bin/env ruby
require 'rmagick'

FILENAME = "cutting_board.jpg"

class CuttingBoardGenerator
  include Magick

  def self.generate!
    beech = Image.read("beech.png").first  #.crop(0,0,44,44)
    dualung = Image.read("dualung.png").first  #.crop(0,0,44,44)
    redwood = Image.read("redwood.png").first  #.crop(0,0,44,44)

    images = [beech, dualung, redwood]

    rows = 6.times.map do |r|
      18.times.map do |i|
        if (i + r).odd?
          beech
        elsif (i / 2).even?
          dualung
        else
          redwood
        end
      end
    end

    image = ImageList.new

    rows.each do |row|
      image_list = ImageList.new
      row.each do |image|
        image_list.push(image)
      end
      image.push image_list.append(false)
    end

    image.append(true).write(FILENAME)
  end
end

puts "Generating #{FILENAME}..."
CuttingBoardGenerator.generate!
