def build_pacman_aur(resource)
  ChefSpec::Matchers::ResourceMatcher.new(:pacman_aur, :build, resource)
end

def install_pacman_aur(resource)
  ChefSpec::Matchers::ResourceMatcher.new(:pacman_aur, :install, resource)
end
