Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B02429FD7
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 10:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235025AbhJLIbq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 04:31:46 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:34019 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234870AbhJLIbm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 04:31:42 -0400
Received: from leknes.fjasle.eu ([92.116.69.156]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MyK5K-1mxOs91QpY-00yfk3; Tue, 12 Oct 2021 10:29:13 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id 9B5583C081; Tue, 12 Oct 2021 10:29:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1634027351; bh=am68snXfB7H5IuTL+9C1+DTNKNWJRQXUP+hyQ0gdaeg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kyh6mFbXpJwkasvsrKwHuMPEDf3TufTfr9if4tPmi2elv1wCyqWlpCAW7n/RGghrI
         T6NzsD5VTC356kPxTuATS27x/BUxrGNPJVIMgKHXT4LWVmoROrFlo4RwQizopjwoFu
         uyiMWEAwVUaxxBpftkVGKElWB1xiA9m5aHUCcpN8=
Date:   Tue, 12 Oct 2021 10:29:11 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas =?iso-8859-1?Q?K=FChnel?= <thomas.kuehnel@avm.de>
Subject: Re: [PATCH] initramfs: Check timestamp to prevent broken cpio archive
Message-ID: <YWVHV8v3m+L+BH9s@fjasle.eu>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas =?iso-8859-1?Q?K=FChnel?= <thomas.kuehnel@avm.de>
References: <20211007185900.2801788-1-nicolas@fjasle.eu>
 <CAK7LNASDu7RK0vLtx1991abx880DtQHK+U2FK3qKbH5Kcz3ipw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASDu7RK0vLtx1991abx880DtQHK+U2FK3qKbH5Kcz3ipw@mail.gmail.com>
X-Provags-ID: V03:K1:K9UmU626uVRaYjWaRWrOX5oLbHVdTZkU3IC4CstRSP5Kvj0xzpp
 xwQl9Wo5tZl/tUrjedQFgI63chXN5UBU+bKiCP1/5HliDifazdqCGDPuVkOQUGYlAJQMoNC
 ykxdnDF6s+iU2dMm0plb4Kr0ZZlU3nOKtPfrQbVhsu2cFEITGi9XIsRrHDioDEcYdlWSPXR
 j2haRVSfm48HtAfZOim1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SoQfMTfZKGI=:dJCL+ZNxq8LkI30Hlh6nBG
 23K7rIgi1bpvDlDIcP3SZRIGH8hDVGYomz5P5Al4Ka9p4/+YZW8WZ5DG6UxR4j1N8ghL96G6G
 aFnr5EcSaySKm+aMhMgFEAnJQsEMjWMc8HQhorDAi5vb9gsx29MpTOERDrgXa3tBT4RSrAYxR
 clYq7s5h5gZhBtZBbrO9f4gb/D+ajZA2Au1Qcp0/ZE2DEHxvq3puuDCO9ZKU8IAw8rr9GEm/s
 t0wUboxLg4usNnx7egu/nlBShxqrfsAZZhZlVRWHuXX2Ww2LuS1tvYBuPCdxR7sQMhXhZO4Wy
 Z5u+luD9/xPVfBwFea6tMWQo0c4FfwOEDqiSG9WPeCy9orb4JfA/TiPHlRyQErprkXIu3sosy
 xXIq0BaD9aGa39KVH9hHZwAMQVc0f7ya1K/EIkGtjWh7BmD2QVoUj9dNFSSxymItBNdBaiTXc
 B3Iyil73nxd0IXLGfW/o4NdOTqHnMXNNQDbB2EQM6/22CB3BbPZo/GJ2uoEf2s3dLi9MlS3qW
 aBdJIiL82aHq2d0+yyRRPaj1k40zr9KFeczFmOrW0LHOWM96vQfOvpitOeZ9i4DijufBr2KCN
 paDPOyueY/TBpf7r5fH3/stxeH65znT8Qik1K4togxK2G5t95CH7z0/8Kd3wQn0IYTOTEg+IW
 SsSyZYPLin5MW2H3xufNt1v3rnlXG+HDO5r70enuADdXJAr8FaFfoFMeQLJkS6JJF7EsR2Uo2
 cqjrhOMDdzyC2v354oZJmnWFnuRSo0qnvHcUsA==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 12, 2021 at 11:02:33AM +0900, Masahiro Yamada wrote:
> Date: Tue, 12 Oct 2021 11:02:33 +0900
> From: Masahiro Yamada <masahiroy@kernel.org>
> To: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild
>  mailing list <linux-kbuild@vger.kernel.org>, Thomas Kühnel
>  <thomas.kuehnel@avm.de>
> Subject: Re: [PATCH] initramfs: Check timestamp to prevent broken cpio
>  archive
> Message-ID: <CAK7LNASDu7RK0vLtx1991abx880DtQHK+U2FK3qKbH5Kcz3ipw@mail.gmail.com>
> 
> On Fri, Oct 8, 2021 at 3:59 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
> >
> > Cpio format reserves 8 bytes for an ASCII representation of a time_t timestamp.
> > While 2106-02-07 06:28:15 (time_t = 0xffffffff) is still some years in the
> > future, a poorly chosen date string for KBUILD_BUILD_TIMESTAMP, converted into
> > seconds since the epoch, might lead to exceeded cpio timestamp limits that
> > results in a broken cpio archive.  Add timestamp checks to prevent overrun of
> > the 8-byte cpio header field.
> 
> Out of curiosity, how did you figure out
> "2106-02-07 06:28:15" was the overflow point?
> Is it affected by leap seconds?
> 
> 
> I got ffff816f
> 
> 
> $ printf "%x"  $(date -d'2106-02-07 06:28:15'  +%s)
> ffff816f

You have a local time zone offset of -9h?
I just did

$ TZ=UTC date -d@$((0xffffffff))
Sun Feb  7 06:28:15 UTC 2106

I should have mentioned the time zone info in the commit message.



> > My colleague Thomas Kühnel discovered the behaviour, when we accidentally fed
> > SOURCE_DATE_EPOCH to KBUILD_BUILD_TIMESTAMP as is: some timestamps (e.g.
> > 1607420928 = 2021-12-08 10:48:48) will be interpreted by `date` as a valid date
> > specification of science fictional times (here: year 160742).  Even though this
> > is bad input for KBUILD_BUILD_TIMESTAMP, it should not break the initramfs
> > cpio format.
> >
> > Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> > Cc: Thomas Kühnel <thomas.kuehnel@avm.de>
> > ---
> >  usr/gen_init_cpio.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
> > index 03b21189d58b..983dcdd35925 100644
> > --- a/usr/gen_init_cpio.c
> > +++ b/usr/gen_init_cpio.c
> > @@ -320,6 +320,12 @@ static int cpio_mkfile(const char *name, const char *location,
> >                 goto error;
> >         }
> >
> > +       if (buf.st_mtime > 0xffffffff) {
> > +               fprintf(stderr, "%s: Timestamp exceeds maximum cpio timestamp, clipping.\n",
> > +                       location);
> > +               buf.st_mtime = 0xffffffff;
> > +       }
> > +
> >         filebuf = malloc(buf.st_size);
> >         if (!filebuf) {
> >                 fprintf (stderr, "out of memory\n");
> > @@ -551,6 +557,17 @@ int main (int argc, char *argv[])
> >                 }
> >         }
> >
> > +       /*
> > +        * Timestamps after 2106-02-07 06:28:15 have an ascii hex time_t
> > +        * representation that exceeds 8 chars and breaks the cpio header
> > +        * specification.
> > +        */
> > +       if (default_mtime > 0xffffffff) {
> > +               fprintf(stderr, "ERROR: Timestamp 0x%08x too large for cpio format\n",
> > +                       default_mtime);
> > +               exit(1);
> > +       }
> > +
> >         if (argc - optind != 1) {
> >                 usage(argv[0]);
> >                 exit(1);
> > --
> > 2.30.1
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --
