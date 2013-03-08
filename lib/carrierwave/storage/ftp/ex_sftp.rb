require 'net/sftp'

class Net::SFTP::Session
  def mkdir_p!(dir)
    structure = Array.new
    dir.split("/").map do |item|
      next if item.empty?
      if structure.empty? && !dir.start_with?("/")
        structure << item
      else
        structure << File.join(structure.last || "", item)
      end

      begin
        mkdir!(structure.last)
      rescue
      end
    end
  end
end