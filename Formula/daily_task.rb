class DailyTask < Formula
  desc "Daily task runner that executes at 4 PM"
  homepage "https://github.com/shaharke/demo-mac-service"
  url "https://github.com/shaharke/demo-mac-service/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "254d1322dc9ec8bf947e037295e7ed5eaab81599c8652e8a6ef4b7ecff48ef96"
  version "1.0.0"

  def install
    bin.install "daily_task.sh"
    prefix.install "com.example.daily_task.plist"
  end

  def plist
    prefix/"com.example.daily_task.plist"
  end

  def post_install
    # Make the script executable
    system "chmod", "+x", "#{bin}/daily_task.sh"
    
    # Create log directory
    (var/"log").mkpath
  end

  def caveats
    <<~EOS
      To load the service at login:
        brew services start daily_task

      To unload the service:
        brew services stop daily_task
    EOS
  end
end 