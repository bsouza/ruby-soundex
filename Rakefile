task :default => [:test]

task :test do
  Dir['test/*_test.rb'].each do |file|
    puts "--------------------------------------------------"
    puts "--- Running test: #{file}"
    puts "--------------------------------------------------"
    system "ruby -rminitest/colorize #{file}"
    puts "\n\n\n"
  end
end