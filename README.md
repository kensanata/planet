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

You need to get [Planet
Jupiter](https://alexschroeder.ch/cgit/planet-jupiter/about/). I
linked `jupiter.pl` in `home/alex/bin/jupiter` and this `bin`
directory is in my `PATH`.

In the scripts below you'll note that I also add Perlbrew's `bin` path
to my `$PATH` variable because I use Perlbrew to install the latest
Perl. If you can run Jupiter using your system Perl, then there's no
need for this.

My `crontab` calls two scripts every four hours. The first one updates
the cache and the second one generates the HTML.

```text
10 */4 *   *   *     /home/alex/bin/planet-update
40 */4 *   *   *     /home/alex/bin/planet-html
```

`planet-update` does the following:

```bash
#!/bin/sh
PATH=$PATH:/home/alex/perl5/perlbrew/perls/perl-5.32.0/bin
cd /home/alex/planet
jupiter --log=warn update indie.opml osr.opml other.opml alex.opml podcast.opml podcast-fr.opml jdr.opml
```

`planet-html` does the following:

```bash
#!/bin/sh
PATH=$PATH:/home/alex/perl5/perlbrew/perls/perl-5.32.0/bin
cd ~/planet

jupiter html indie.html indie-template.html indie.xml indie.rss indie.opml \
&& mv indie.html ~/campaignwiki.org/indie/index.html \
&& cp indie.xml ~/campaignwiki.org/indie/feed.xml \
&& cp indie.opml ~/campaignwiki.org/indie/

jupiter html osr.html osr-template.html osr.xml osr.rss osr.opml \
&& mv osr.html ~/campaignwiki.org/osr/index.html \
&& cp osr.xml ~/campaignwiki.org/osr/feed.xml \
&& cp osr.opml ~/campaignwiki.org/osr/

jupiter html rpg.html rpg-template.html rpg.xml rpg.rss indie.opml osr.opml other.opml \
&& mv rpg.html ~/campaignwiki.org/rpg/index.html \
&& cp rpg.xml ~/campaignwiki.org/rpg/feed.xml \
&& cp indie.opml osr.opml other.opml ~/campaignwiki.org/rpg/

jupiter html alex.html alex-template.html alex.xml alex.rss alex.opml \
&& mv alex.html ~/alexschroeder.ch/blogs/index.html \
&& cp alex.xml ~/alexschroeder.ch/blogs/feed.xml \
&& cp alex.opml ~/alexschroeder.ch/blogs/

jupiter html podcast.html podcast-template.html podcast.xml podcast.rss podcast.opml \
&& mv podcast.html ~/campaignwiki.org/podcast/index.html \
&& cp podcast.xml ~/campaignwiki.org/podcast/feed.xml \
&& cp podcast.opml ~/campaignwiki.org/podcast/

jupiter html podcast-fr.html podcast-fr-template.html podcast-fr.xml podcast-fr.rss podcast-fr.opml \
&& mv podcast-fr.html ~/campaignwiki.org/podcast-fr/index.html \
&& cp podcast-fr.xml ~/campaignwiki.org/podcast-fr/feed.xml \
&& cp podcast-fr.opml ~/campaignwiki.org/podcast-fr/

jupiter html jdr.html jdr-template.html jdr.xml jdr.rss jdr.opml \
&& mv jdr.html ~/campaignwiki.org/jdr/index.html \
&& cp jdr.xml ~/campaignwiki.org/jdr/feed.xml \
&& cp jdr.opml ~/campaignwiki.org/jdr/
```
