
Pod::Spec.new do |s|


  s.name         = "AZSafariCollectionViewLayout"
  s.version      = "0.1.0"
  s.summary      = "AZSafariCollectionViewLayout is replica of safari browser history page layout"

  s.description  = <<-DESC
	AZSafariCollectionViewLayout is replica of safari browser history page layout. very easy to use, IBInspectable are given for easy integration.
    DESC

  s.homepage     = "https://github.com/AfrozZaheer/AZSafariCollectionViewLayout"

  s.platform         = :ios, "9.3"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }


  s.author       = { "AfrozZaheer" => "afrozezaheer@gmail.com" }

  s.source       = { :git => "https://github.com/AfrozZaheer/AZSafariCollectionViewLayout.git" }

  s.source_files = 'Source/**/*.{swift}'

end
