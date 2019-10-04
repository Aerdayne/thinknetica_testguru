# Version initializer using SemVer gem
# Version is stored in ./semver
module TestGuru
  class Application
    VERSION = SemVer.find.to_s
  end
end