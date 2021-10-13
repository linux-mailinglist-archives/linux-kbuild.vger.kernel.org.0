Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9142A42B251
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Oct 2021 03:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhJMBnm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 21:43:42 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:47469 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbhJMBnl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 21:43:41 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 19D1f2cT032406;
        Wed, 13 Oct 2021 10:41:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 19D1f2cT032406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634089263;
        bh=R7m4FOJaxwF5u6woKIjKGg6BVz0jl0+g2IHcSsMR7kM=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=IR7juhxMMMlPCHjJPP8bSlqp3i88p66RoD6KFVwDC5I5s0OhXzMpDYIh7iIoGEY5e
         kDjpAEmA7NZkuzX12DDB6G+cv4ay4U06sAwtbKQ9gD+TUzHp/FqKdw1THYT9zl4spl
         fy3FdeLxouegAbSOfzd/5g3+EaD3HywJBgAshvQvny/jnIJ9qjc4mmagSDs9L1BmWC
         rH+6MmFINfVSSlRnQ48H2253usCkwW7YUMc30NiCacG45b7g2/E9eoXGnC1fhZPhw7
         L+CZOY/kZ2aV1aI4q0sY+O3kGB8XNkAq+rxHChrASAsj8by6E7hOUfPysphV/IwT5U
         GYwAZz45abieg==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id oa4so982727pjb.2;
        Tue, 12 Oct 2021 18:41:02 -0700 (PDT)
X-Gm-Message-State: AOAM532jYs8xfLimceD7WTR6TFdBA61hlffO76NsrnJZhpG48N522lY5
        1IHrtuBJvfM1zlqaSCRgi3FEAh++yn6w54ghk3g=
X-Google-Smtp-Source: ABdhPJy6mWJwsP++gd10Dm+UA5Xg8dGCwy4UaPvVicmimh/YjoUeAlqE9n2ux3BdEYnlB+0La6Pd/qMb5eyWBh5uwco=
X-Received: by 2002:a17:90b:4c86:: with SMTP id my6mr10019901pjb.77.1634089261793;
 Tue, 12 Oct 2021 18:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211007185900.2801788-1-nicolas@fjasle.eu> <CAK7LNASDu7RK0vLtx1991abx880DtQHK+U2FK3qKbH5Kcz3ipw@mail.gmail.com>
 <YWVHV8v3m+L+BH9s@fjasle.eu>
In-Reply-To: <YWVHV8v3m+L+BH9s@fjasle.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 13 Oct 2021 10:40:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQu6XeHRu-F2UT_uHYUVxGczp5x946wwrPDataPZPKXZA@mail.gmail.com>
Message-ID: <CAK7LNAQu6XeHRu-F2UT_uHYUVxGczp5x946wwrPDataPZPKXZA@mail.gmail.com>
Subject: Re: [PATCH] initramfs: Check timestamp to prevent broken cpio archive
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        =?UTF-8?Q?Thomas_K=C3=BChnel?= <thomas.kuehnel@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 12, 2021 at 5:29 PM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> On Tue, Oct 12, 2021 at 11:02:33AM +0900, Masahiro Yamada wrote:
> > Date: Tue, 12 Oct 2021 11:02:33 +0900
> > From: Masahiro Yamada <masahiroy@kernel.org>
> > To: Nicolas Schier <nicolas@fjasle.eu>
> > Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbu=
ild
> >  mailing list <linux-kbuild@vger.kernel.org>, Thomas K=C3=BChnel
> >  <thomas.kuehnel@avm.de>
> > Subject: Re: [PATCH] initramfs: Check timestamp to prevent broken cpio
> >  archive
> > Message-ID: <CAK7LNASDu7RK0vLtx1991abx880DtQHK+U2FK3qKbH5Kcz3ipw@mail.g=
mail.com>
> >
> > On Fri, Oct 8, 2021 at 3:59 AM Nicolas Schier <nicolas@fjasle.eu> wrote=
:
> > >
> > > Cpio format reserves 8 bytes for an ASCII representation of a time_t =
timestamp.
> > > While 2106-02-07 06:28:15 (time_t =3D 0xffffffff) is still some years=
 in the
> > > future, a poorly chosen date string for KBUILD_BUILD_TIMESTAMP, conve=
rted into
> > > seconds since the epoch, might lead to exceeded cpio timestamp limits=
 that
> > > results in a broken cpio archive.  Add timestamp checks to prevent ov=
errun of
> > > the 8-byte cpio header field.
> >
> > Out of curiosity, how did you figure out
> > "2106-02-07 06:28:15" was the overflow point?
> > Is it affected by leap seconds?
> >
> >
> > I got ffff816f
> >
> >
> > $ printf "%x"  $(date -d'2106-02-07 06:28:15'  +%s)
> > ffff816f
>
> You have a local time zone offset of -9h?
> I just did
>
> $ TZ=3DUTC date -d@$((0xffffffff))
> Sun Feb  7 06:28:15 UTC 2106
>
> I should have mentioned the time zone info in the commit message.
>


Ah, time zone!

Right, my time zone is JST (+09:00).

And, thanks for the update.





>
>
> > > My colleague Thomas K=C3=BChnel discovered the behaviour, when we acc=
identally fed
> > > SOURCE_DATE_EPOCH to KBUILD_BUILD_TIMESTAMP as is: some timestamps (e=
.g.
> > > 1607420928 =3D 2021-12-08 10:48:48) will be interpreted by `date` as =
a valid date
> > > specification of science fictional times (here: year 160742).  Even t=
hough this
> > > is bad input for KBUILD_BUILD_TIMESTAMP, it should not break the init=
ramfs
> > > cpio format.
> > >
> > > Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> > > Cc: Thomas K=C3=BChnel <thomas.kuehnel@avm.de>
> > > ---
> > >  usr/gen_init_cpio.c | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >
> > > diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
> > > index 03b21189d58b..983dcdd35925 100644
> > > --- a/usr/gen_init_cpio.c
> > > +++ b/usr/gen_init_cpio.c
> > > @@ -320,6 +320,12 @@ static int cpio_mkfile(const char *name, const c=
har *location,
> > >                 goto error;
> > >         }
> > >
> > > +       if (buf.st_mtime > 0xffffffff) {
> > > +               fprintf(stderr, "%s: Timestamp exceeds maximum cpio t=
imestamp, clipping.\n",
> > > +                       location);
> > > +               buf.st_mtime =3D 0xffffffff;
> > > +       }
> > > +
> > >         filebuf =3D malloc(buf.st_size);
> > >         if (!filebuf) {
> > >                 fprintf (stderr, "out of memory\n");
> > > @@ -551,6 +557,17 @@ int main (int argc, char *argv[])
> > >                 }
> > >         }
> > >
> > > +       /*
> > > +        * Timestamps after 2106-02-07 06:28:15 have an ascii hex tim=
e_t
> > > +        * representation that exceeds 8 chars and breaks the cpio he=
ader
> > > +        * specification.
> > > +        */
> > > +       if (default_mtime > 0xffffffff) {
> > > +               fprintf(stderr, "ERROR: Timestamp 0x%08x too large fo=
r cpio format\n",
> > > +                       default_mtime);
> > > +               exit(1);
> > > +       }
> > > +
> > >         if (argc - optind !=3D 1) {
> > >                 usage(argv[0]);
> > >                 exit(1);
> > > --
> > > 2.30.1
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
> --
> epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
> =E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
>      -- frykten for herren er opphav til kunnskap --



--=20
Best Regards
Masahiro Yamada
