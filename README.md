# view_server
## Description

Sometimes when working on a remote server you want to view data in a local app like Excel. It can be very teadious because you have to save the data into a file then copy it using scp. Then afterward opening it with the app of your choice. If you have to do this many times a day it can really slow down your workflow.
With the view\_server it's very easy to view a file.

Sometimes you also need to copy text into your clipboard from the remote server. The view\_server can help you with that.

## Installation

    gem install view_server

## Usage

### Show file

Start the server on your local machine. At the moment only OS X is supported.

    view_server

Now open a ssh session to the remote server and create a reverse tunnel to your local machine:

    ssh -R 10021:localhost:10021 username@remoteserver.com

Then install the gem on the remote server:

    gem install view_server

Then on the irb console on the remote server:

    require 'view_server'

    ViewServer::Client.new.server.show <<EOF, 'csv'
    1,2
    3,4
    EOF

This will open Excel with a spreadsheet filled with the data defined in the here document.

The last paramenter of the show method represents the file extension of the temporary file that will be created before being opened on your local computer.

There is also a command line utility to that you can use.

    echo  -e "1,2\n2,3" | show -e csv

### Clipboard support

On the remote server you can copy to the local clipboard:

    ls | cbcopy

You can also paste to the remote server:

    cbpaste > file.txt

## Simplifying the ssh command

It can be teadious to add the -R parameter each time that you want to ssh to the remote server.
In order to create the tunnel automaticaly you can add this at the end of your ~/.ssh/config

    Host * !*github* !*bitbucket*
    RemoteForward 10021 localhost:10021

The first line tells ssh to create the tunnel for all ssh connection except for github and bitbucket.

Now each time that you connect to a remote server with ssh the tunnel will be made, to need to add the -R option.

## TODO

Adding tests

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
=======
view\_server
