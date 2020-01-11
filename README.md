# Planet Jupiter Configurations

These are the configurations and themes I use for
[Old School RPG Planet](https://campaignwiki.org/osr/),
[Indie RPG Planet](https://campaignwiki.org/indie/),
and the all-in-one [RPG Planet](https://campaignwiki.org/rpg/).

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

You need to get [Planet Jupiter](https://alexschroeder.ch/cgit/planet-jupiter/about/).
I linked `jupiter.pl` in `home/alex/bin/jupiter` and this `bin`
directory is in my `PATH`.

My `crontab` calls two scripts every four hours. The first one updates
the cache and the second one generates the HTML.

```text
10 */4 *   *   *     /home/alex/bin/planet-update
40 */4 *   *   *     /home/alex/bin/planet-html
```

`planet-update` does the following:

```bash
#!/bin/sh
cd /home/alex/planet
jupiter update indie.opml osr.opml other.opml
```

`planet-html` does the following:

```bash
#!/bin/sh
cd ~/planet

jupiter html indie.html indie.opml \
&& mv indie.html ~/campaignwiki.org/indie/index.html \
&& cp indie.opml ~/campaignwiki.org/indie/

jupiter html osr.html osr.opml \
&& mv osr.html ~/campaignwiki.org/osr/index.html \
&& cp osr.opml ~/campaignwiki.org/osr/

jupiter html rpg.html indie.opml osr.opml other.opml \
&& mv rpg.html ~/campaignwiki.org/rpg/index.html \
&& cp indie.opml osr.opml other.opml ~/campaignwiki.org/rpg/
```

