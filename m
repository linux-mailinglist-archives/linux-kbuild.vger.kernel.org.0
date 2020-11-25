Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9122C4152
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Nov 2020 14:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbgKYNnU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Nov 2020 08:43:20 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47041 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbgKYNnU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Nov 2020 08:43:20 -0500
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0APDh6pQ004097;
        Wed, 25 Nov 2020 22:43:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0APDh6pQ004097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606311786;
        bh=Xr9kKa1yy2aEd8Z8mSK6Pod0JXKPYiwqr/gCQAQT6Lk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HcmLiYlqEqyEO+xcSDxfv2S2tGX4N3ptJppIcINadM4hs6TWzL+2nFiXeCPCK0wXt
         E2WL0ffgr0n+uUypn1M3CWCHCMISFl1Q5PPxg0MjUlG3CuhjoncZA+xgeODYVg/5Wp
         c///hqN9AmHr5SvZbq4DT3HIWI2vSi1Jtle7zz+pUfl5kQVszJOSxsGlOThBg/48M5
         1GoJgHcZT8aCJezsLe1JunAhZ5BUR2/2oWzIelNcnTQSnUmvIINEBpYNyly/TaTBZC
         qO8Ue6V70SkNOID/Nx3OrCdKaXE7km8AHVBADIZuQmMEgmbjZNJsjitT55JfOUNNPp
         uNJLd/QINT7TA==
X-Nifty-SrcIP: [209.85.210.181]
Received: by mail-pf1-f181.google.com with SMTP id w187so2366902pfd.5;
        Wed, 25 Nov 2020 05:43:06 -0800 (PST)
X-Gm-Message-State: AOAM532pU9v07HAGvN9+/870L8gnZPfqXLLejGZsjedYsv4jLTZ+VWc4
        QH7xDnS16NRuZa5UNdx2QYQKuwfITXKw5K8XldA=
X-Google-Smtp-Source: ABdhPJwU0PSewhXq0VykOVGsOJ7FU08lEC/5fD477srKgaQTsRsFk7QzUdiWYG8B+QmRUCoNJUDWTiodYEMQG5TblpM=
X-Received: by 2002:a62:e519:0:b029:197:bcec:7c0c with SMTP id
 n25-20020a62e5190000b0290197bcec7c0cmr3229396pff.63.1606311785520; Wed, 25
 Nov 2020 05:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20201103054425.59251-1-chao.wang@ucloud.cn> <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
 <20201123150452.GA68187@MacBook-Pro-2>
In-Reply-To: <20201123150452.GA68187@MacBook-Pro-2>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Nov 2020 22:42:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNASH7Pj9eUdxF-sp1_Ap+uA9jEtsXa--pUDDw_pNVLtviA@mail.gmail.com>
Message-ID: <CAK7LNASH7Pj9eUdxF-sp1_Ap+uA9jEtsXa--pUDDw_pNVLtviA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add extra-y to targets-for-modules
To:     WANG Chao <chao.wang@ucloud.cn>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 12:05 AM WANG Chao <chao.wang@ucloud.cn> wrote:
>
> On 11/23/20 at 02:23P, Masahiro Yamada wrote:
> > On Tue, Nov 3, 2020 at 3:23 PM WANG Chao <chao.wang@ucloud.cn> wrote:
> > >
> > > extra-y target doesn't build for 'make M=...' since commit 6212804f2d78
> > > ("kbuild: do not create built-in objects for external module builds").
> > >
> > > This especially breaks kpatch, which is using 'extra-y := kpatch.lds'
> > > and 'make M=...' to build livepatch patch module.
> > >
> > > Add extra-y to targets-for-modules so that such kind of build works
> > > properly.
> > >
> > > Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
> > > ---
> > >  scripts/Makefile.build | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index ae647379b579..0113a042d643 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -86,7 +86,7 @@ ifdef need-builtin
> > >  targets-for-builtin += $(obj)/built-in.a
> > >  endif
> > >
> > > -targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > > +targets-for-modules := $(extra-y) $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > >
> > >  ifdef need-modorder
> > >  targets-for-modules += $(obj)/modules.order
> > > --
> > > 2.29.1
> > >
> >
> > NACK.
> >
> > Please fix your Makefile.
> >
> > Hint:
> > https://patchwork.kernel.org/project/linux-kbuild/patch/20201123045403.63402-6-masahiroy@kernel.org/
> >
> >
> > Probably what you should use is 'targets'.
>
> I tried with 'targets' and 'always-y'. Both doesn't work for me.
>
> I narraw it down to the following example:
>
> cat > Makefile << _EOF_
> obj-m += foo.o
>
> ldflags-y += -T $(src)/kpatch.lds
> always-y += kpatch.lds
>
> foo-objs += bar.o
>
> all:
>         make -C /lib/modules/$(shell uname -r)/build M=$(PWD)
> clean:
>         make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
> _EOF_
>
> Take a look into scripts/Makefile.build:488:
>
> __build: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
>          $(if $(KBUILD_MODULES), $(targets-for-modules)) \
>          $(subdir-ym) $(always-y)
>         @:
>
> 'always-y' is built after 'targets-for-modules'. This makes
> 'targets-for-modules' fails because kpatch.lds isn't there.


Heh, you rely on the targets built from left to right,
and you have never thought Make supports the parallel option -j.


You need to specify the dependency if you expect objects
are built in the particular order.

However, in this case, using ldflags-y looks wrong
in the first place.

The linker script is used when combining the object
as well as the final link of *.ko


> For 'targets', in case of OOT, does not seem to be useful.
>
> What change do you suggest to make to fix this kind of Makefile?
>
> Thanks,
> WANG Chao



-- 
Best Regards
Masahiro Yamada
