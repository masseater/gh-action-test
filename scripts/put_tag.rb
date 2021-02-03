target = ARGV[0]
major, minor, patch = `git tag -l | sort -V`.split("\n").last.delete('v').split('.').map(&:to_i)
next_tag = ''
case target
when 'build'
  next_tag = "v#{major}.#{minor}.#{patch + 1}"
when 'minor'
  next_tag = "v#{major}.#{minor + 1}.#{patch}"
when 'major'
  next_tag = "v#{major + 1}.#{minor}.#{patch}"
else
  puts target
end
puts next_tag
