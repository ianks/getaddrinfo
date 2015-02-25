# Gethostbyname

Get a list of host IP addresses from a name: `Gethostname.gethostname
'google.com'`

This is just a really thin wrapper around the `gethostbyname()` C function. I
got bored and wrote an C-ext for it. Turns out it is a bit faster than MRI's
implementation. Probably because mine does less. But if all you want is an
array of IP addresses, you are in luck.

```
Gethostbyname.gethostbyname       => 111 i/100ms
Socket.gethostbyname              =>  15 i/100ms
-------------------------------------------------
Gethostbyname.gethostbyname =>
  295.4 (±15.9%) i/s -       1554 in   5.391645s

Socket.gethostbyname =>
  118.5 (±16.0%) i/s -        585 in   5.099770s
```

## Is it thread-safe

Probably not. Depends on your OS; but no, it is not guaranteed like `getaddrinfo()`.

## Will you make a thread-safe version

Will I get bored again on a Tuesday evening? Possibly.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gethostbyname'
```

## Usage

```ruby
require 'gethostbyname'

Gethostbyname.gethostname 'google.com' # => ['4242.42.4242', '242.24.42']
```
