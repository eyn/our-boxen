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

	include virtualbox
	include wget

	ruby::version { '1.9.2': }

	ruby::gem { "bundler for 2.0.0":
	  gem          => 'bundler',
	  version      => '~> 1.2.0',
	  ruby => "2.0.0",
	}

	ruby::gem { "bundler for 1.9.2":
	  gem          => 'bundler',
	  version      => '~> 1.2.0',
	  ruby => "1.9.2",
	}

	ruby::local { '/opt/veewee':
	  version => '1.9.2'
	}

	file{ "/opt/veewee":
		ensure => "directory",
		owner  => "${boxen_user}",
	    group  => "staff",
	    mode   => 750,
	}

	exec { "clone_veewee":
    	command => "/usr/bin/git clone https://github.com/jedi4ever/veewee.git /opt/veewee",
    	creates => "/opt/veewee/README.md"
	}

	file{"/opt/veewee/README.md":
		mode=>0644,
		require => Exec["clone_veewee"]
	}
	
	# Run an installed gem
	exec { '/opt/boxen/rbenv/versions/1.9.2/bin/bundle install':
	  cwd     => "/opt/veewee",
	  require => [Ruby::Gem['bundler for 1.9.2'], File['/opt/veewee/README.md']]
	}




}