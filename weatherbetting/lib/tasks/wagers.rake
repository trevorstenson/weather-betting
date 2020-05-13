require 'wager_resolver'

namespace :wagers do
  desc "Resolve wagers"
  task resolve_wagers: :environment do
    WagerResolver.resolve_wagers
  end

end
