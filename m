Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF492DBB1B
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Dec 2020 07:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgLPGQC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 01:16:02 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42618 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgLPGQC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 01:16:02 -0500
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0BG6F2b9021987;
        Wed, 16 Dec 2020 15:15:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0BG6F2b9021987
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608099302;
        bh=WjYvYBHitWTl78hIJ3zpsk8+geyugv5xaYAU/C+Iltk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Al75i2o+35o7BMmAxrL4DX8/JLEG5aqVScYUXhGnKAgiufOCvlEoF/biQbXoIEnqT
         4g4qwZiIE9XUHzuaRedq3NTOFOZLgrhiSJrCXFRH63DSSPiC2OCTPShQl7KC7i5mhJ
         Ls5O1rupTGM0kgYOgIOrF16nCB7Wf7Niw2QbTNOn1zgTItD4kvcw1jD9wi4UUjfrve
         H9t3mVWQYKgFRUI7TH8SQM11hD8CZeVnjPH9mlYuKk1GjeMFrgW+ccnjnWAz7Md84Z
         VAVkbRgqW/+GsoDyMXRbQlAMjF0XU6xLrACYTQpngh13MWge5yaeU7L0Wtc0yO/pQr
         0YG3W8Yjzlo4g==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id w1so1089097pjc.0;
        Tue, 15 Dec 2020 22:15:02 -0800 (PST)
X-Gm-Message-State: AOAM532xL1sruQbDny+Mw4elEVVD333lUyUl8ZrEumRpdXljQvBVsfvk
        wini5MkozGQkzgD7Rsr0OYY5rDGpoykYTcoSTc8=
X-Google-Smtp-Source: ABdhPJzMbOqtMu4h/lRssX+FuNaooydGLAxY5ciJFVepXuyQsojuWJBbLcE0reF1NdmjyDJauqav0v+sBjipNmwvP0s=
X-Received: by 2002:a17:902:9b91:b029:db:f003:c5eb with SMTP id
 y17-20020a1709029b91b02900dbf003c5ebmr18091027plp.1.1608099301714; Tue, 15
 Dec 2020 22:15:01 -0800 (PST)
MIME-Version: 1.0
References: <20201103054425.59251-1-chao.wang@ucloud.cn> <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
 <20201123150452.GA68187@MacBook-Pro-2> <CAK7LNASH7Pj9eUdxF-sp1_Ap+uA9jEtsXa--pUDDw_pNVLtviA@mail.gmail.com>
 <20201208092035.GA96434@MacBook-Pro-2.local> <20201208143117.GA3333762@wtfbox.lan>
In-Reply-To: <20201208143117.GA3333762@wtfbox.lan>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 16 Dec 2020 15:14:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=wdCObfX3x8CQmXf8HsrKAjz+v+XVUCxVg63pxy8MXg@mail.gmail.com>
Message-ID: <CAK7LNAS=wdCObfX3x8CQmXf8HsrKAjz+v+XVUCxVg63pxy8MXg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add extra-y to targets-for-modules
To:     Artem Savkov <artem.savkov@gmail.com>
Cc:     WANG Chao <chao.wang@ucloud.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Joe Lawrence <joe.lawrence@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 8, 2020 at 11:31 PM Artem Savkov <artem.savkov@gmail.com> wrote:
>
> On Tue, Dec 08, 2020 at 05:20:35PM +0800, WANG Chao wrote:
> > Sorry for the late reply.
> >
> > On 11/25/20 at 10:42P, Masahiro Yamada wrote:
> > > On Tue, Nov 24, 2020 at 12:05 AM WANG Chao <chao.wang@ucloud.cn> wrote:
> > > >
> > > > On 11/23/20 at 02:23P, Masahiro Yamada wrote:
> > > > > On Tue, Nov 3, 2020 at 3:23 PM WANG Chao <chao.wang@ucloud.cn> wrote:
> > > > > >
> > > > > > extra-y target doesn't build for 'make M=...' since commit 6212804f2d78
> > > > > > ("kbuild: do not create built-in objects for external module builds").
> > > > > >
> > > > > > This especially breaks kpatch, which is using 'extra-y := kpatch.lds'
> > > > > > and 'make M=...' to build livepatch patch module.
> > > > > >
> > > > > > Add extra-y to targets-for-modules so that such kind of build works
> > > > > > properly.
> > > > > >
> > > > > > Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
> > > > > > ---
> > > > > >  scripts/Makefile.build | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > > > > index ae647379b579..0113a042d643 100644
> > > > > > --- a/scripts/Makefile.build
> > > > > > +++ b/scripts/Makefile.build
> > > > > > @@ -86,7 +86,7 @@ ifdef need-builtin
> > > > > >  targets-for-builtin += $(obj)/built-in.a
> > > > > >  endif
> > > > > >
> > > > > > -targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > > > > > +targets-for-modules := $(extra-y) $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > > > > >
> > > > > >  ifdef need-modorder
> > > > > >  targets-for-modules += $(obj)/modules.order
> > > > > > --
> > > > > > 2.29.1
> > > > > >
> > > > >
> > > > > NACK.
> > > > >
> > > > > Please fix your Makefile.
> > > > >
> > > > > Hint:
> > > > > https://patchwork.kernel.org/project/linux-kbuild/patch/20201123045403.63402-6-masahiroy@kernel.org/
> > > > >
> > > > >
> > > > > Probably what you should use is 'targets'.
> > > >
> > > > I tried with 'targets' and 'always-y'. Both doesn't work for me.
> > > >
> > > > I narraw it down to the following example:
> > > >
> > > > cat > Makefile << _EOF_
> > > > obj-m += foo.o
> > > >
> > > > ldflags-y += -T $(src)/kpatch.lds
> > > > always-y += kpatch.lds
> > > >
> > > > foo-objs += bar.o
> > > >
> > > > all:
> > > >         make -C /lib/modules/$(shell uname -r)/build M=$(PWD)
> > > > clean:
> > > >         make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
> > > > _EOF_
> > > >
> > > > Take a look into scripts/Makefile.build:488:
> > > >
> > > > __build: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
> > > >          $(if $(KBUILD_MODULES), $(targets-for-modules)) \
> > > >          $(subdir-ym) $(always-y)
> > > >         @:
> > > >
> > > > 'always-y' is built after 'targets-for-modules'. This makes
> > > > 'targets-for-modules' fails because kpatch.lds isn't there.
> > >
> > >
> > > Heh, you rely on the targets built from left to right,
> > > and you have never thought Make supports the parallel option -j.
> >
> > You're right. I missed that.
> >
> > >
> > >
> > > You need to specify the dependency if you expect objects
> > > are built in the particular order.
> > >
> > > However, in this case, using ldflags-y looks wrong
> > > in the first place.
> > >
> > > The linker script is used when combining the object
> > > as well as the final link of *.ko
>
> We want linker script to be used on both those steps, otherwise modpost
> fails.


In that case, does the following work?
(untested)



diff --git a/kmod/patch/Makefile b/kmod/patch/Makefile
index e017b17..02d4c66 100644
--- a/kmod/patch/Makefile
+++ b/kmod/patch/Makefile
@@ -12,7 +12,9 @@ endif

 obj-m += $(KPATCH_NAME).o
 ldflags-y += -T $(src)/kpatch.lds
-extra-y := kpatch.lds
+targets += kpatch.lds
+
+$(obj)/$(KPATCH_NAME).o: $(obj)/kpatch.lds

 $(KPATCH_NAME)-objs += patch-hook.o output.o





>
> It looks like the right thing to do here is leave ldflags-y in, get rid
> of always-y/extra-y altogether and specify our linker script as a
> dependency for the object.
>
> > I don't have a clean fix to kpatch right now.
> >
> > I'm looping kpatch forks in. They're also looking at this right now:
> >
> > https://github.com/dynup/kpatch/pull/1149
> >
> > Thanks
> > WANG Chao
> >
> > >
> > >
> > > > For 'targets', in case of OOT, does not seem to be useful.
> > > >
> > > > What change do you suggest to make to fix this kind of Makefile?
> > > >
> > > > Thanks,
> > > > WANG Chao
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
> > >
> >
>
> --
> Regards,
>   Artem Savkov



-- 
Best Regards
Masahiro Yamada
