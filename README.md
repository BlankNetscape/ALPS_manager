#  -՝, ALPS manager ､´-
Divide and conquer!!

P.S. Actually ALPS is (aliases package list)

# Set-up
1. Replace script folder to convenient place. 2. Copy [path to dir] to `boot.sh` file:
```
#!/bin/bash
path="/path/to/ALPS_manager"
...
```

2. Then copy [path to **boot.sh**] to your `.bashrc`:
```
. /path/to/ALPS_manager/boot.sh
```

3. And.. `restart`

**Finally! You have ALPS**



*4. actually you should to fix  defaults ALPS.alp

Open default .alp package and configure it with your **[path]**:
```
.../ALPS_manager/alp/ALPS.alp
```
```
function alps() { [PATH]/alps_manager/alps.sh /root/scripts/alps_manager $1; }

alias alpm=". [PATH]/alps_manager/alp_master.sh /root/scripts/alps_manager"
```

# Usage
```
alps [-h/--help]
```
# Output
```
root@linux:~# alps
        _    .  ,   .           .
    *  / \_ *  / \_      _  *        *   /\'__        *
      /    \  /    \,   ((        .    _/  /  \  *'.
 .   /\/\  /\/ :' __ \_  `          _^/  ^/    `--.
    /    \/  \  _/  \-'\      *    /.' ^ _  \_   .'\  *
  /\  .-   `. \/     \ /==~=-=~=-=-;.  _/ \ -. `_/   \
 /  `-.__ ^   / .-'.--\ =-=~_=-=~=^/  _ `--./ .-'  `-
/        `.  / /       `.~-^=-=~=^=.-'      '-._ `._

                  ____ _     ___  ____
╒══════════════   |__| |     |__] [__    ══════════════╕
│░░░▒▒▒░░░▒▒▒░░   |  | |___  |    ___]   ░░▒▒▒░░░▒▒▒░░░│
├──────────────────────────────────────────────────────┤
│                  -՝, alps --help ､´-                 │
└──────────────────────────────────────────────────────┘
╒════════╤═══════════╤════════════════╤════════════════╕
│ alp ID │ alp Name  │ Alias          │ Content        │
├────────┼───────────┼────────────────┼────────────────┤
│  0001  │  ALPS     │ 01. alps()     │ 01.            │
│        │           │ 02. alps       │ 02. . /root/.. │
│        │           │ 03. alpm       │ 03. . /root/.. │
├────────┼───────────┼────────────────┼────────────────┤
│  9999  │  someStt  │ 01. showme()   │ 01.            │
│        │           │ 02. macr()     │ 02.            │
│        │           │ 03. macd()     │ 03.            │
│        │           │ 04. mon()      │ 04. ./netmod.. │
│        │           │ 05. nomon()    │ 05. ./netmod.. │
├────────┼───────────┼────────────────┼────────────────┤
│  0002  │  Basic1   │ 01. c          │ 01. clear      │
│        │           │ 02. e          │ 02. exit       │
│        │           │ 03. q          │ 03. quit       │
│        │           │ 04. h          │ 04. history    │
│        │           │ 05. la         │ 05. ls -ls     │
│        │           │ 06. g          │ 06. git clone  │
│        │           │ 07. chm        │ 07. chmod +x   │
├────────┴────┬──────┴────────────────┴────────────────┤
│  Count: 03  │ Author: TENN UN1T                      │
└─────────────┴────────────────────────────────────────┘
```
