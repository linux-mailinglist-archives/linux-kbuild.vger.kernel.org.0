Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0785512D7E0
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Dec 2019 11:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbfLaK2H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Dec 2019 05:28:07 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:40722 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfLaK2H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Dec 2019 05:28:07 -0500
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id xBVARwPb011363;
        Tue, 31 Dec 2019 19:27:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xBVARwPb011363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1577788079;
        bh=SKqd2HWiYAuhUrskiZxzhJITENWtpPCtLPbJtA0qXLI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0k2D0yKUBflnAlvgsKjVwi17UJdPPrfQ9WzdIgNx8/1LXbovH/qKPkqAmnkwKpvz5
         PyTfrB50i2jtzGgr6RQbOjXUGVxHfGbb9LQPUsQZBniP2OmbJUqAzlpi6m6gqRLQat
         BqJ/KSGuaOi6AGeBL+UY6HO/j4tCh1A/PatYd+9JhbUfiCbTGzAhrNW7YmxQkZ/Ah2
         W/4bdCXIqxa8b6Y3o/2dLGGoCn+1fo8RxuYIji8+sIZj+7Z0wZKI/5t8Xnov42GSod
         HUEu3v5R41JUTzwnCAPbBia+Ogw1U9P37iArzA51r0X/iCOCA32SrQa4I6G5c4hVwB
         7lBcFRTZMRqKA==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id c14so10788425uaq.11;
        Tue, 31 Dec 2019 02:27:58 -0800 (PST)
X-Gm-Message-State: APjAAAXhsKb3whrY7Xtfn7MeK3UWNSZDXw4kUromuySP0PcczI62ef09
        bDaZc4zBqA0cr43AJoIykUrwwFCB4hIHzUhbpdo=
X-Google-Smtp-Source: APXvYqxWlSbUhmnqMIZZI8Wb7iQQ/woJKuNQ7RZojyHFmBAhJG3P4fTib+W/AUwVD8HgwE4AQUgy5W9CLUbSFB9J61Y=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr21100400uay.25.1577788077465;
 Tue, 31 Dec 2019 02:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20191230132006.7401-1-masahiroy@kernel.org> <CAMrEMU_5XmUmKmF99gg-RBkBAvpAbnM6G=Y0cBajcE2HMUQssg@mail.gmail.com>
In-Reply-To: <CAMrEMU_5XmUmKmF99gg-RBkBAvpAbnM6G=Y0cBajcE2HMUQssg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 31 Dec 2019 19:27:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNASh89xrM3Q2VwSgufU05prVDUz8Lo0eQC+QfmH=eFXJmg@mail.gmail.com>
Message-ID: <CAK7LNASh89xrM3Q2VwSgufU05prVDUz8Lo0eQC+QfmH=eFXJmg@mail.gmail.com>
Subject: Re: [PATCH] initramfs: fix 'bad variable name' error in gen_initramfs_list.sh
To:     Justin Capella <justincapella@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Jory A . Pratt" <anarchy@gentoo.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 31, 2019 at 12:13 AM Justin Capella <justincapella@gmail.com> wrote:
>
> I was looking at this, and in theory there are other problems that
> could arise from non-escaped characters, or things with leading
> hyphens... In general it isn't great to assume ls output will play
> nicely with the internal field separator / IFS. I think a better
> solution would be to use something like ${foo@Q} and instead of trying
> to scrape ls -l, maybe using stat, since it can be asked to print out
> the device number.

I am not sure if 'stat' is necessarily preferred over 'ls -l'.

Commit a670b0b4aed129dc11b465c1c330bfe9202023e5
says 'stat' is not standardized.

There is some room for argument
how far we should care about the portability, though.


>
> But I don't think this patch fixes the problem mentioned at all-- I
> think the problem is initfs is not a variable name on line 61:

cmd_initramfs is defined at line 46.

Look into scripts/Kbuild.include
if you want to know how if_changed works.


> $(call if_changed,initfs)
>
> https://github.com/torvalds/linux/blob/351c8a09b00b5c51c8f58b016fffe51f87e2d820/usr/Makefile#L61
>
> The Makefile and script look like more patches would be needed to fix
> mentioned issue, and I'm kind of wondering what the intent behind
> lines 31-32 is...
>
> ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
> $(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
>
> why filter nothing, why shell echo?

It does filter "", which is different from nothing.

You need to notice GNU Make handles double-quote (")
as a normal character.
There is no special meaning as it has in shell.

'echo' is used just for ripping off the double-quotes.


>
> Quoting and/or proper escaping would be needed in many other places,
> and I suspect cpio input is always regenerated...

I do not think so.

If the cpio input is regenerated,
the following log is shown.

GEN     usr/initramfs_data.cpio


I do not see it every time.


> The use of sed to
> manually escape things and suggesting using \ instead of using the
> argument terminator "--"... If weird paths with spaces and stuff are a
> requirement for the script needs some overhauling

If you find a problem in particular, a patch is welcome.

But, what you stated above comes from your misunderstanding.




> On Mon, Dec 30, 2019 at 5:21 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Prior to commit 858805b336be ("kbuild: add $(BASH) to run scripts with
> > bash-extension"), this shell script was almost always run by bash since
> > bash is usually installed on the system by default.
> >
> > Now, this script is run by sh, which might be a symlink to dash. On such
> > distros, the following code emits an error:
> >
> >   local dev=`LC_ALL=C ls -l "${location}"`
> >
> > You can reproduce the build error, for example by setting
> > CONFIG_INITRAMFS_SOURCE="/dev".
> >
> >     GEN     usr/initramfs_data.cpio.gz
> >   ./usr/gen_initramfs_list.sh: 131: local: 1: bad variable name
> >   make[1]: *** [usr/Makefile:61: usr/initramfs_data.cpio.gz] Error 2
> >
> > This is because `LC_ALL=C ls -l "${location}"` contains spaces.
> > Surrounding it with double-quotes fixes the error.
> >
> > Fixes: 858805b336be ("kbuild: add $(BASH) to run scripts with bash-extension")
> > Reported-by: Jory A. Pratt <anarchy@gentoo.org>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  usr/gen_initramfs_list.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/usr/gen_initramfs_list.sh b/usr/gen_initramfs_list.sh
> > index 0aad760fcd8c..2bbac73e6477 100755
> > --- a/usr/gen_initramfs_list.sh
> > +++ b/usr/gen_initramfs_list.sh
> > @@ -128,7 +128,7 @@ parse() {
> >                         str="${ftype} ${name} ${location} ${str}"
> >                         ;;
> >                 "nod")
> > -                       local dev=`LC_ALL=C ls -l "${location}"`
> > +                       local dev="`LC_ALL=C ls -l "${location}"`"
> >                         local maj=`field 5 ${dev}`
> >                         local min=`field 6 ${dev}`
> >                         maj=${maj%,}
> > --
> > 2.17.1
> >



-- 
Best Regards
Masahiro Yamada
