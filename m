Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5926E44DCDA
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 22:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhKKVIU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Nov 2021 16:08:20 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:55277 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhKKVIT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Nov 2021 16:08:19 -0500
Received: from leknes.fjasle.eu ([92.116.65.223]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MOzKm-1n448p2HPQ-00PJwc; Thu, 11 Nov 2021 22:04:31 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id 14D833C563; Thu, 11 Nov 2021 22:04:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1636664669; bh=E9zRL4wp69cueK3T0b6a6zpUpjWFIzefnR0viafArLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wqCnbgCpZW3hdHjlP2UnZ287DMugL2ceaJCZdLoYuRG5L1PqawgPHsvE8u7hXFO5R
         wRXvfrzb6wMfgkPEfkV5ED3cM9cXa5Om+Zr1RKIYJMlo/mGS37X3MytMQew4KiR2oj
         Q9WGLa96mzPjNr0w20xwb/3HZWfd5XyxaCfWcrwE=
Date:   Thu, 11 Nov 2021 22:04:28 +0100
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v2] scripts/config: allow "O=config-dir" option
Message-ID: <YY2FXErXArNnKwDh@fjasle.eu>
References: <20211102224041.5105-1-rdunlap@infradead.org>
 <CAK7LNAQg0Dmj03xLWvz4=Y6n6VoiOnn-hkHrR7_MTgE5obt_7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQg0Dmj03xLWvz4=Y6n6VoiOnn-hkHrR7_MTgE5obt_7w@mail.gmail.com>
X-Provags-ID: V03:K1:KEgiijC07xwaSkYU63nzWVP2XqOJppvdWCAZnjlVWeGvEHfF5is
 36Lu/X+BwO1ppBlOyVhTBuP2QgsDqzrFPAz8F1Fkt0ntFyxrYpxrArLmatV0r7I/+4TlRjU
 O05hwKcZari8f+pp+vOPnVHZprgtaqsal7vOyFGk/eYkLbMsGldCETBR/mti/pljx6EFj5f
 GZ0/QWJCPii1Qu1zRGLEg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6MitMX78nJM=:jnJ9ptHn6X+BGSmAqhyAsG
 GcPy0/UhDTKd/0CXjYXv6RiyjkRutc8FOjtNONA8NNCQWgCu/5UtJkCTNDkQNYRIN+ew0SU9r
 n7cs9wM+ZAQ08ER4eYjmmP1hg9SqFO6yKNM3spX8SPTAz2SEiVTXSQ5BF4t4QCmsNv/nhPHVt
 2taH8J//QC1mC8jr/ayEk4gjg8EttKNV368LWPyesfEhBvt8zHD42mAsB9mhqLqibkwLEaof/
 r838T12UDMzEJEvetTZtx3weSVAjpzOFnWju4KS9M0IeYKDiUbpF7VqiohTlWyoK6aZr/nnm6
 xl2gXvJnBQy4ptLHn9jfqJWAdIKy3XKUIiISxItbpXV2g9C6L6F0F5VY6aFBRhXdw9RVryYOy
 o54EW4PYw7GWmcEZ43KEKM5I69YGUWvwdio+auOwllCgRLFd5h92JHfeF7VsSkE65KlVPcD/c
 sDUVfaUAyUhRWyNSjRt80HSQxIJWwu8FoVsx7h8B3Yw2Hp6ryM7Iya59t3WxRGYPZqyNl4gP5
 BtwT4JmaMd5JNPvNnDwLwAbbXsvWmasSLFIzh27t7BLHUItZI6GNNOD0CXuh6MMOvGrcbDEVS
 xNa239AZQlcJ+tFljqBVLBdjOsXPovTtP1SmR88Pcr7gPVkH5X1ZMfar+iLO3CRoz2kT4hkoi
 LEiY5vjcGDs8xl71ctyOQxwEz+AqrwplkU39Yl1j7Ej8DUCw3YjRLMOuzSkfSwUSaxHc=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Fri, Nov 05, 2021 at 12:41:59AM +0900 Masahiro Yamada wrote:
> On Wed, Nov 3, 2021 at 7:40 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Support "O=config-dir" as the location of the .config file
> > like (some) other kernel build (make) tools do.
> >
> > Also check for the existence of the config-dir/config-file
> > and report if there is no such file instead of letting grep
> > report that there is no such file.
> >
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: Andi Kleen <ak@linux.intel.com>
> > Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> 
> Why don't you use  --file path/to/output/dir/.config ?

I did not ask for the patch, but it matches some typical situations I
experience at work.  Building kernels out-of-source w/ 'O=' but modifying
.config with the '--file' option does not feel "natural". And 'O=' in
scripts/config allows reusing make arguments (readline/bash's ESC-n ESC-.).

Having the 'O=' argument, it might allow fixing the '--refresh' option to
support out-of-source builds.

Thus, no really great points from me.

Kind regards,
Nicolas


> > v2:
> > - use 'shellcheck' and other recommendations from Nicolas
> > - move one comment from the commit description to under the "---" line
> >
> > Someone asked for this "feature" a few months ago but I don't
> > recall who it was.
> >
> >  scripts/config |   44 +++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 39 insertions(+), 5 deletions(-)
> >
> > --- linux-next-20211102.orig/scripts/config
> > +++ linux-next-20211102/scripts/config
> > @@ -37,6 +37,7 @@ commands:
> >
> >  options:
> >         --file config-file   .config file to change (default .config)
> > +       O=config-dir         Specify the directory location of the config-file
> >         --keep-case|-k       Keep next symbols' case (dont' upper-case it)
> >
> >  $myname doesn't check the validity of the .config file. This is done at next
> > @@ -124,15 +125,48 @@ undef_var() {
> >         txt_delete "^# $name is not set" "$FN"
> >  }
> >
> > -if [ "$1" = "--file" ]; then
> > -       FN="$2"
> > -       if [ "$FN" = "" ] ; then
> > +DIR=
> > +FN=
> > +
> > +while [ "$DIR" = "" ] || [ "$FN" = "" ]; do
> > +
> > +       if [ "$1" = "" ] ; then
> >                 usage
> >         fi
> > -       shift 2
> > -else
> > +       if [ "$1" = "--file" ]; then
> > +               FN="$2"
> > +               if [ "$FN" = "" ] ; then
> > +                       usage
> > +               fi
> > +               shift 2
> > +               continue
> > +       fi
> > +
> > +       optn=$1
> > +       optnlen=${#optn}
> > +       if [ "$optnlen" -gt 1 ] && [ "${optn:0:2}" = "O=" ]; then
> > +               DIR=${optn:2}
> > +               shift
> > +               if [ "$DIR" = "" ]; then
> > +                       usage
> > +               fi
> > +               continue
> > +       fi
> > +       break   # something other than --file or O=dir
> > +done
> > +
> > +if [ "$FN" = "" ]; then
> >         FN=.config
> >  fi
> > +if [ "$DIR" != "" ]; then
> > +       DIR=$DIR"/"
> > +fi
> > +FN="${DIR}${FN}"
> > +
> > +if [ ! -r "$FN" ]; then
> > +       echo "No such config file: $FN"
> > +       exit
> > +fi
> >
> >  if [ "$1" = "" ] ; then
> >         usage
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --
