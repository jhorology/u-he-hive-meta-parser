## u-he-hive-meta-parser

u-he Hive preset metadata parser.


### Build
```
    npm install
    gulp
```

### Test
```
    gulp test
```

### Installation
```
    npm install 'u-he-hive-meta-parser'
```

### Usage

```javascript
var parser = require('u-he-hive-meta-parser'),
    beautify = require('js-beautify');

var metadata = parser.parse('/Library/Audio/Presets/u-he/Hive/Acidity.h2p');
console.log(beautify(JSON.stringify(metadata), { indent_size: 2 }));
```

example output
```javascript
{
  "Author":"XenosSoundworks.com",
  "Description":"06 Plucks & Stabs\nXS Uplifting Plucks\n----------------",
  "Usage":"MW = cutoff"
}
```
