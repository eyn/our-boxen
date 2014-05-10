class people::reducingwip {

	include adobe_reader
	include arduino
	include chrome
	include dropbox
	include fitbit
	include googledrive
	include kindle
	include lastpass
	include skype
	include sonos
	include spotify
	include sublime_text_2
	include vagrant
	include iterm2::stable
	include virtualbox
	include wget
	include packer
	#include mercurial
  include bazaar
  include android_file_transfer
  include kindle 
	package { "go":
    ensure => present
  }

  package { "mercurial":
    ensure => present
  }

  file { "/opt/go":
    ensure => 'directory'
  }
  
  exec { "gox":
    environment => ["GOPATH=/opt/go"],
    command => "go get github.com/mitchellh/gox",
    creates => "/opt/go/bin/gox",
    require => [File['/opt/go'], Package["go"]]
  }

	git::config::global { 'user.name':
  		value  => 'James Moore'
	}

	git::config::global { 'user.email':
  		value  => 'james.moore@cantab.net'
	}


	vagrant::box { 'wheezy64/virtualbox': 
		source => 'http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-puppet.box'
	}

	vagrant::box {'SaucySalamander/virtualbox':
		source => 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-puppet.box'
	}

  ruby::version { '1.9.2': }

  ruby_gem { 'rails for v1.9.2':
    gem    => 'rails',
    version => "~> 4.0.0",
    ruby_version => '1.9.2',
    ensure => present
  }





}