class SongsWorker
  include Sidekiq::Worker
  require "csv"

  def perform(file_path)
    CSV.foreach(file_path, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end
