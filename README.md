# Talkgh SMS Client Library for Ruby

This is a Ruby client library for the Talkgh, you'll need to signup at [talkgh] to get started.


* [Requirements](#requirements)
* [Installation](#installation)
* [Usage](#usage)
* [License](#license)

## Requirements

Talkgh ruby client library requires ruby version...

```bash
'>= 2.1.0'
```
## Installation

To install library using Rubygems:

    gem install talkgh

Alternatively you can clone the repository:

    git clone git@github.com/victronix/talkgh-ruby.git

## Usage

Begin by requiring the talkgh library:

```ruby
require 'talkgh'
```

Then create a client object with your api token:

```ruby
client = Talkgh::Client.new(api_token: 'YOUR-API-TOKEN')
```

### Send an SMS
You can now use the client object to send an SMS.

```ruby

message = 'Hello world!'.encode(Encoding::ISO_8859_1)

response = client.sms.send(
    sender: 'SENDER-NAME',
    des:    'NUMBER',
    mess:   message
)

if response.code == '0000'
  puts "Sent message successfully"
else
  puts "Error: #{response.code}"
end
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

[talkgh]: https://talkgh.com
[license]: LICENSE.txt
