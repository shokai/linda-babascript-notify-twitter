Linda BabaScript notify Twitter
===============================
Tweet BabaScript query with RocketIO::Linda

* https://github.com/shokai/linda-babascript-notify-twitter
* watch tuple ["notifications", baba_script_code] in the tuplespace "takumibaba"
* then write tuple ["twitter", "tweet", baba_script_code]


Dependencies
------------
- Ruby 1.8.7 ~ 2.0.0
- [BabaScript](https://github.com/masuilab/babascript)
- [Linda Twitter](https://github.com/shokai/linda-twitter)
- [LindaBase](https://github.com/shokai/linda-base)


Install Dependencies
--------------------

Install Rubygems

    % gem install bundler foreman
    % bundle install


Run
---

set ENV var "LINDA_BASE", "LINDA_SPACE" and "LINDA_SPACE_TWEET"

    % export LINDA_BASE=http://linda.example.com
    % export LINDA_SPACE=test
    % export LINDA_SPACE_TWEET=tweet
    % bundle exec ruby linda-babascript-notify-twitter.rb


oneline

    % LINDA_BASE=http://linda.example.com LINDA_SPACE=test LINDA_SPACE_TWEET=tweet bundle exec ruby linda-babascript-notify-twitter.rb


Install as Service
------------------

for launchd (Mac OSX)

    % sudo foreman export launchd /Library/LaunchDaemons/ --app linda-babascript-notify -u `whoami`
    % sudo launchctl load -w /Library/LaunchDaemons/linda-babascript-notify-twitter-1.plist


for upstart (Ubuntu)

    % sudo foreman export upstart /etc/init/ --app linda-babascript-notify -d `pwd` -u `whoami`
    % sudo service linda-babascript-notify start
