Pod::Spec.new do |s|
s.name           = 'LazySwift'
s.version        = '0.2.2'
s.summary        = "Swift extensions for lazy coding."
s.homepage       = "https://github.com/VladasZ/LazySwift"
s.author         = { 'Vladas Zakrevskis' => '146100@gmail.com' }
s.source         = { :git => 'https://github.com/VladasZ/LazySwift.git', :tag => s.version }
s.ios.deployment_target = '8.0'
s.source_files   = 'Sources/**/*.swift'
s.license        = 'MIT'
end
