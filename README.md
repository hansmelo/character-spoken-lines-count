# character-spoken-lines-count

Usage
-----

```bash
git clone git@github.com:hansmelo/character-spoken-lines-count.git
cd character-spoken-lines-count
bundle
ruby bin/count-character-spoken.rb
```

You can to order the result, You pass parameter and order, like examples:

```bash
ruby bin/count-character-spoken.rb -p character -o asc
ruby bin/count-character-spoken.rb -p character -o desc
ruby bin/count-character-spoken.rb -p count -o asc
ruby bin/count-character-spoken.rb -p count -o desc
```

Running tests
-------------

Simply run:

```bash
rake test
```
GEMS
-------------

Nokogiri: lib facilitates read and parse of XML files.
