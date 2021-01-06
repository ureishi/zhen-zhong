### zhen-zhong
require 'fileutils'

### create directory
puts 'create directory...'
Dir.mkdir 'public' unless Dir.exists? 'public'
puts 'created: public'

articles = Dir.glob('./article/zz_*.png').sort.reverse.take(4)

exte = ''

4.times{
	file = articles[_1] ? articles[_1] : './not_found.png'
	
	FileUtils.cp file, "./public/zz_#{_1}.png"
}

### optimize
puts 'optimize'
`pngquant --force --ext .png --speed 1 ./public/zz_*.png`
`advpng -z -4 -i 10 ./public/zz_*.png`

puts 'finished'
