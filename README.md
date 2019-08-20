# Planet Venus Configurations

These are the configurations and themes I use for
[Old School RPG Planet]([https://campaignwiki.org/osr/),
[Indie RPG Planet]([https://campaignwiki.org/indie/),
and the all-in-one [RPG Planet]([https://campaignwiki.org/rpg/).

This all started because Google announced the sunsetting of Google+ and
the large RPG communities on Google+ started looking for places to go.
People started collecting Old School Renaissance (OSR) blogs in a big
spreadsheet and Ramanan S. transformed it into an
[OPML document](http://save.vs.totalpartykill.ca/grab-bag/osr.opml).

I had run an version of the *Old School RPG Planet* in
[2009](https://alexschroeder.ch/wiki/2009-01-09_Planet_Venus) but
shut it down in
[2013](https://alexschroeder.ch/wiki/2013-12-08_Old_School_RPG_Planet_Going_Down).
My main concern was that I had added people to the planet without their
explicit consent and I didn't want to ask
[over 300](https://alexschroeder.ch/wiki/2011-03-04_One_Page_Dungeon_Contest_Stats)
people for consent.

But with Google+ going down and me wishing for a comeback of the RPG
*blogosphere*, here I am, running the Planet again (more than one!), and
requiring the bloggers to apply for membership, thus solving the issue of
consent.

## If you ever feel like installing it all...

I have two scripts in my `~/bin`.

`bin/planet-osr`:

```
#!/bin/sh
cd /home/alex/planet
/usr/bin/python2 ~/src/venus/planet.py -x osr.ini 2>&1 | egrep -v 'ERROR:planet.runner:Error (404|500)'
true
```

`bin/planet-indie`:

```
#!/bin/sh
cd /home/alex/planet
/usr/bin/python2 ~/src/venus/planet.py -x indie.ini 2>&1 | egrep -v 'ERROR:planet.runner:Error (404|500)'
true
```

And my `crontab` has:

```
10 */4 *   *   *     /home/alex/bin/planet-osr
30 */4 *   *   *     /home/alex/bin/planet-indie
50 */4 *   *   *     /usr/bin/make --silent --file=/home/alex/planet/Makefile rpg
```

I have a copy of
[Planet Venus](https://alexschroeder.ch/cgit/venus/about/)
in my repositories as well. As you can see from the log, I make too many changes.
Sadly, it uses Python 2 instead of Python 3 and I'm unable to fix it...
