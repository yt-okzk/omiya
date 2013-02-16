guard 'rspec', :cli => '--color --format documentation' do
  watch(/spec\/.+_spec\.rb/)
  watch(/lib\/(.+)\/.+\.rb$/) { |m| "spec/#{m[1]}_spec.rb" }
  watch(/lib\/(.+)\/.+\.rb$/) { |m| "spec/#{m[1]}_spec.rb" }
end
