Recurly Ruby Client App Demo
==================

[Recurly](http://recurly.com) makes subscription billing easy.  This project is a sample application that demonstrates how to use Recurly's [Ruby Client Library](http://github.com/recurly/recurly-client-ruby).

Usage
-----

Please see the [documentation](http://support.recurly.com/faqs/api/ruby-client) and
[support forums](http://support.recurly.com/discussions) for more information.


Ruby Client Library Installation
--------------------------------

This App depends on the Recurly Client Library which can be installed as a gem or a plugin. Your choice.

**Gem Installation:**

    gem install recurly --source=http://gemcutter.org
    
**Plugin Installation:**

    script/plugin install git@github.com:recurly/recurly-client-ruby.git


Authentication
--------------

The Recurly Ruby Client App requires a username and password to connect.  We recommend creating a user just for your API.  Please see the [Authentication](http://support.recurly.com/faqs/api/authentication) documentation for more information.

Create a file in your Rails app at __/config/initializers/recurly_config.rb__ with contents like:

    Recurly.configure do |c|
      c.username = 'api@yourcompany.com'
      c.password = 'super_secret_password'
    end


API Documentation
-----------------

Please see the [Recurly API](http://support.recurly.com/faqs/api/) for more information.

