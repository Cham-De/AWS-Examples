## Creating a bucket

```
aws s3 mb s3://prefixes-test-clds
```
## Creating a folder
```
aws s3api put-object --bucket prefixes-test-clds --key examples/
```

## Creating several folders
```
aws s3api put-object --bucket prefixes-test-clds --key Lorem.ipsum.dolor.sit.amet/.consectetur.adipiscing.elit/.Ut.interdum.tincidunt.erat/.eu.euismod.purus.pulvinar.non/.Proin.consequat.diam.vitae.mi.ultrices.elementum/.Vestibulum.vitae.justo.vel.nunc.rhoncus.blandit/.Etiam.metus.augue/.aliquet.quis.enim.id/.efficitur.varius.augue/.Proin.sit.amet.mauris.maximus.odio.volutpat.vulputate.non.sed.orci/.Morbi.eros.nulla/.rutrum.a.tellus.sollicitudin/.vehicula.finibus.lorem/.Donec.vulputate.mauris.vitae.turpis.accumsan/.in.ornare.metus.porta/.Mauris.lectus.dolor/.rutrum.vitae.rhoncus.facilisis/.feugiat.quis.lectus/.Sed.facilisis.erat.nec.turpis.suscipit.feugiat/.Mauris.at.porta.quam/.sit.amet.viverra.augue/.Aliquam.est.dolor/.eleifend.non.mauris.ac/.pellentesque.rutrum.lorem/.Donec.hendrerit.orci.eu.augue.pellentesque/.pellentesque.molestie.leo.pharetra/.Proin.finibus.dictum.risus.a.posuere/.Fusce.ultrices.viverra.consequat/.Aliquam.eget.efficitur.augue/.et.aliquam.mauris/.Vestibulum.turpis.est/.iaculis.ut.arcu.a/.molestie.ultrices.nunc/.Nulla.condimentum.ipsum.augue/hello/
```
