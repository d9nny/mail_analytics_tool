# Analytics App

## About
Implement a web application in Ruby that:

1. Can receive web hooks from Mandrill (Llirdnam)
2. Processes the web hook data and stores it into a suitable data store
3. Displays the following statistics
	- Total number of emails sent
	- Total number of emails opened
	- Total number of clicks
	- Open rate per email type
	- Click rate per email type

## Usage

Clone this repo to your local machine and run bundle
```sh
$ git clone 
$ bundle install
```

To run the app locally, run
```sh
$ shotgun
```
and navigate to http://localhost:9393 in your browser. Then start 'llirdam'.

## llirdnam
llirdnam is an application that mimicks Mandrill's webhook events for local testing.

### Development
1. Install this to your `$GOPATH`.
2. Run `go run llirdnam-master\ 2/listener/listener.go` in one cmd tab.
3. Run `go run llirdnam-master\ 2/llirdnam/llirdnam.go http://localhost:4000` in another tab.
4. Look at the output of the listener to see the amazing output of llirdnam.

### Generating binaries
1. Install and configure [gox](https://github.com/mitchellh/gox)
2. Run `gox -osarch="linux/amd64 windows/amd64 darwin/amd64"` in the directory of the go app you want to compile.
3. Move the binaries to the right place.

## Testing

To run the unit and feature tests, please navigate to the root directory and run: 
```sh
$ rspec
```

## Notes

Didn't manage to catch the data from Llirdnam.
