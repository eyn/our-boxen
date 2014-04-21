class people::James {
	include adobe_reader
	include arduino
	include chrome
	include dropbox
	include fitbit
	include googledrive
	include iterm2
	include iterm2::colors::solarized_dark
	include kindle
	include lastpass
	include skype
	include sonos
	include spotify
	include sublime_text_2
	include vagrant
	vagrant::box { 'wheezy64/virtualbox_puppet': 
		source => 'http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-puppet.box'
	}

	include vitualbox
	include wget

}