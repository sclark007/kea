Feature: control with bindctl
    Assorted tests using bindctl for the administration of BIND 10.

    Scenario: Removing modules
    # This test runs the original example configuration, which has
    # a number of modules. It then removes all non-essential modules,
    # and checks whether they do disappear from the list of running
    # modules (note that it 'misuses' the help command for this,
    # there is a Boss command 'show_processes' but it's output is
    # currently less standardized than 'help')
    Given I have bind10 running with configuration example.org.config

    Then remove bind10 configuration Boss/components/NOSUCHMODULE
    last bindctl output should contain Error

    bind10 module Xfrout should be running
    bind10 module Stats should be running
    bind10 module Zonemgr should be running
    bind10 module Xfrin should be running
    bind10 module Auth should be running
    bind10 module StatsHttpd should be running

    Then remove bind10 configuration Boss/components value b10-xfrout
    last bindctl output should not contain Error
    Then remove bind10 configuration Boss/components value b10-stats
    last bindctl output should not contain Error
    Then remove bind10 configuration Boss/components value b10-zonemgr
    last bindctl output should not contain Error
    Then remove bind10 configuration Boss/components value b10-xfrin
    last bindctl output should not contain Error
    Then remove bind10 configuration Boss/components value b10-auth
    last bindctl output should not contain Error
    Then remove bind10 configuration Boss/components value b10-stats-httpd
    last bindctl output should not contain Error

    bind10 module Xfrout should not be running
    bind10 module Stats should not be running
    bind10 module Zonemgr should not be running
    bind10 module Xfrin should not be running
    bind10 module Auth should not be running
    bind10 module StatsHttpd should not be running
