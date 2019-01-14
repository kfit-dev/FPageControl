Pod::Spec.new do |s|
  s.name             = 'FPageControl'
  s.version          = '0.4.0'
  s.summary          = 'Custom Page Control for Fave'

  s.description      = <<-DESC
Custom UIPageControl for Fave
                       DESC

  s.homepage         = 'https://github.com/Berdikhan/FPageControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Berdikhan' => 'berdikhan@gmail.com' }
  s.source           = { :git => 'https://github.com/Berdikhan/FPageControl.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'FPageControl/*'

end
