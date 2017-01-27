#!/usr/bin/env ruby

require 'rmagick'
class Combiner
  include Magick

  def self.combine
    beech = Image.read("beech.png").first
    # beech = beech.crop(0, 0, beech.columns, beech.columns)
    dualung = Image.read("dualung.png").first
    # dualung = dualung.crop(0, 0, dualung.columns, dualung.columns)
    redwood = Image.read("redwood.png").first
    # redwood = redwood.crop(0, 0, redwood.columns, redwood.columns)

    images = [beech, dualung, redwood]

    image = ImageList.new

    rows = 6.times.map do |r|
      18.times.map do |i|
        (i + r).even? ? beech : ((i / (r + 1)).even? ? dualung : redwood)
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

    image.append(true).write("cutting_board.jpg")
  end
end

Combiner.combine
