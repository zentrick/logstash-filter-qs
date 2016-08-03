# logstash-filter-qs

Parses a query string into a hash.

## Config

```
filter {
  qs {
    source => "source_key"            # Key for query string. Required.
    destination => "destination_key"  # Key for output. Default: "query".
    match => "^(foo|ba[rz])$"         # Regexp to filter keys. Optional.
    multi => true                     # Values as arrays. Default: false.
  }
}
```

## Maintainer

[Tim De Pauw](https://github.com/timdp)

## License

MIT
