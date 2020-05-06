Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275291C7633
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2020 18:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729558AbgEFQZW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 12:25:22 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:62032 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729341AbgEFQZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 12:25:22 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 046GP61e028339;
        Thu, 7 May 2020 01:25:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 046GP61e028339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588782307;
        bh=rq69QzS6nlj/kgKXQgJKnWEQ+bYqfWhhoP80dDaszRc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Az/G5MBn0oyNTBjj4AxjqqsJqGgqWI18xwcUbGnqdyl/g/Z25t2VwxuY69u1jDENo
         K9sxP0r1jMKQNkQZuIW1u7AW/f8Dkg6fQAUajAW/q/a1u3bnW+Kd/AEctu/WA6ed6b
         SLxyEU0bsoJJrJuCbcloVrX2bKit8J3ZMJq3Bd7lI0F4xRbO3l5una52xG+oTWJKpb
         KJ9H0tFljp35e3iPiA0f2GXyyRY+0ryNIafbzrjfHalNFvybkgTRCZPn5F3cGWSGL5
         NGoO07MGTgMkkzh9nmrgln0VP6KB3Sfks4/mBMlluAnsx7fNgkXs41xqrBNDRBAJz+
         pp0U9V82V1iAg==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id c24so710323uap.13;
        Wed, 06 May 2020 09:25:06 -0700 (PDT)
X-Gm-Message-State: AGi0Puas2aD5aSc9pVsqjVS9ueclDz4jL3YvYJZ1okgKemwFSKTu4e2S
        eK40x8357pRlolaHPJsMSjfwOhmis9QDiovrgg8=
X-Google-Smtp-Source: APiQypJqmfuIuGzAsi/SVJfoQ1bvOYPU2yoQHrHm0uw6i1E0zrLfQQcykbn5vorW8hI7P4L685FYmQ9D9HJlIb6c+6w=
X-Received: by 2002:ab0:cd:: with SMTP id 71mr7499076uaj.109.1588782305667;
 Wed, 06 May 2020 09:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <cd20b888-7f3d-e7ff-8096-2cc8305a5107@gmail.com>
 <CAK7LNAR5TsnUn2n2nDFHywQyqCT7si840yE2nyuxx70AYj+nDQ@mail.gmail.com> <01279bfe-95a3-dbdb-3785-bd2d92dc4f95@gmail.com>
In-Reply-To: <01279bfe-95a3-dbdb-3785-bd2d92dc4f95@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 7 May 2020 01:24:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNASKHb5QzD-5d7Vam9t4C1U64_2tTk7eVAmK2oDVquy0MA@mail.gmail.com>
Message-ID: <CAK7LNASKHb5QzD-5d7Vam9t4C1U64_2tTk7eVAmK2oDVquy0MA@mail.gmail.com>
Subject: Re: Proper use for linking foo.o_shipped after 69ea912fda74 ("kbuild:
 remove unneeded link_multi_deps")?
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 7, 2020 at 1:03 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 5/6/2020 7:37 AM, Masahiro Yamada wrote:
> > On Wed, May 6, 2020 at 1:45 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >>
> >> Hi Masahiro, Michal,
> >>
> >> While updating our systems from 4.9 to 5.4, we noticed that one of the
> >> kernel modules that we build, which is done by linking an object that we
> >> pre-compile out of Kbuild stopped working.
> >>
> >> I bisected it down to:
> >>
> >> commit 69ea912fda74a673d330d23595385e5b73e3a2b9 (refs/bisect/bad)
> >> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> Date:   Thu Oct 4 13:25:19 2018 +0900
> >>
> >>     kbuild: remove unneeded link_multi_deps
> >>
> >>     Since commit c8589d1e9e01 ("kbuild: handle multi-objs dependency
> >>     appropriately"), $^ really represents all the prerequisite of the
> >>     composite object being built.
> >>
> >>     Hence, $(filter %.o,$^) contains all the objects to link together,
> >>     which is much simpler than link_multi_deps calculation.
> >>
> >>     Please note $(filter-out FORCE,$^) does not work here. When a single
> >>     object module is turned into a multi object module, $^ will contain
> >>     header files that were previously included for building the single
> >>     object, and recorded in the .*.cmd file. To filter out such headers,
> >>     $(filter %.o,$^) should be used here.
> >>
> >>     Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >>
> >> and the linker now fails with the following:
> >>
> >> mkdir -p /home/florian/dev/lkm/.tmp_versions ; rm -f
> >> /home/florian/dev/lkm/.tmp_versions/*
> >>
> >>   WARNING: Symbol version dump ./Module.symvers
> >>            is missing; modules will have no dependencies and modversions.
> >>
> >> make -f ./scripts/Makefile.build obj=/home/florian/dev/lkm
> >> (cat /dev/null;   echo kernel//home/florian/dev/lkm/hello.ko;) >
> >> /home/florian/dev/lkm/modules.order
> >>   ld -m elf_x86_64  -z max-page-size=0x200000    -r -o
> >> /home/florian/dev/lkm/hello.o
> >> ld: no input files
> >> make[1]: *** [scripts/Makefile.build:492: /home/florian/dev/lkm/hello.o]
> >> Error 1
> >> make: *** [Makefile:1530: _module_/home/florian/dev/lkm] Error 2
> >>
> >> and here are some steps to reproduce this:
> >>
> >> Kbuild:
> >> obj-m   := hello.o
> >> hello-y := test.o_shipped
> >>
> >> test.c can be a simple hello world, and you can compile it using a
> >> standard Kbuild file first, and then move test.o as test.o_shipped.
> >
> >
> >
> > Why don't you do like this?
> >
> > obj-m   := hello.o
> > hello-y := test.o
>
> I tried it in the original environment where it failed, not my contrived
> test case, and this did not work, as we really need test.o and
> test.o_shipped to be separate objects, doing what you suggest results in
> a circular dependency.


I do not understand why you are trying to link *.o_shipped
directly to the module.


Did you notice the following code in scripts/Makefile.lib ?

quiet_cmd_shipped = SHIPPED $@
cmd_shipped = cat $< > $@

$(obj)/%: $(src)/%_shipped
        $(call cmd,shipped)




*_shipped should be copied to *
before the use.



> To me this is a regression, as it used to work and now it does not, thus
> we should be fixing it, any idea about how we go about it without doing
> a plain revert?


In fact, a patch exists.

https://patchwork.kernel.org/patch/11318691/

It allows you to link whatever file name to a module,
but please read the comments from Christoph and Greg.


In this case, your Makefile is doing strange.

I'd recommend to fix your Makefile.



>
> Thank you!
> --
> Florian



-- 
Best Regards
Masahiro Yamada
