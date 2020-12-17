Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672282DCD9E
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Dec 2020 09:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgLQI2B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Dec 2020 03:28:01 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:45874 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgLQI2B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Dec 2020 03:28:01 -0500
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0BH8QiaC006418;
        Thu, 17 Dec 2020 17:26:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0BH8QiaC006418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608193605;
        bh=jcaLNZ1NT1WQYPfq0kRysSDeg/UOI3ok/TD4QabVH5o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PZEjpZX4q/Vx98PKPIcKvzac/iauNiBwLcjmNV1Nobc4HhjzF7bzb/0mz7qE/qyaD
         CmXdo5+x+68mgLC8h+kNEInQH0mnltzOEz8IN+3NCx6zm/hjNrpJuOKumKLT4jbSkR
         BKHlNK/C52RCWgNLrAoanOWQBMZU0iKZYNtymrJQm92MJ+KU3qD6aPrETeWiVB0IrE
         Zlb6XTFLHT+hKrD+BydaK8o9fPZXFD4yL8ycteP+sw1+wfEVAAGdJirR1dNryKRMyY
         byNX3PFyUT2DDiBWNHEwpJy9epgzlnVmSnAyfeBexWZKYEnAE3u/CHYht6LKbz1Ve5
         9Q3Hh9gR5wc0w==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id x18so8629479pln.6;
        Thu, 17 Dec 2020 00:26:44 -0800 (PST)
X-Gm-Message-State: AOAM532q6/yvBvuF7KtpOOi85B2mF4d6htqMNIlJkp210RKGJuhW4Q/x
        R4O+tEsMMSmqDhSpwbF0BwaC+fZn/U/jR68yt5g=
X-Google-Smtp-Source: ABdhPJyxwEOJhCIKr9ZHuv411/T9wbF+A/Kkwu+5u25hgnhiD+Z4n6mM9vnkQuv4PXISoA+X5+2ezfYW/qYRREcuXRY=
X-Received: by 2002:a17:90a:d18c:: with SMTP id fu12mr6790562pjb.153.1608193603736;
 Thu, 17 Dec 2020 00:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20201103054425.59251-1-chao.wang@ucloud.cn> <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
 <20201123150452.GA68187@MacBook-Pro-2> <CAK7LNASH7Pj9eUdxF-sp1_Ap+uA9jEtsXa--pUDDw_pNVLtviA@mail.gmail.com>
 <20201208092035.GA96434@MacBook-Pro-2.local> <20201208143117.GA3333762@wtfbox.lan>
 <CAK7LNAS=wdCObfX3x8CQmXf8HsrKAjz+v+XVUCxVg63pxy8MXg@mail.gmail.com> <f2d1888b-5b8e-a513-61c7-f41fc3f3f7a3@redhat.com>
In-Reply-To: <f2d1888b-5b8e-a513-61c7-f41fc3f3f7a3@redhat.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 17 Dec 2020 17:26:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNATmfzt0kTF0BWkSRaZV3p01mvN4OSGPZsCp+KHghCWf0Q@mail.gmail.com>
Message-ID: <CAK7LNATmfzt0kTF0BWkSRaZV3p01mvN4OSGPZsCp+KHghCWf0Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add extra-y to targets-for-modules
To:     Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Artem Savkov <artem.savkov@gmail.com>,
        WANG Chao <chao.wang@ucloud.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 17, 2020 at 8:04 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> On 12/16/20 1:14 AM, Masahiro Yamada wrote:
> > On Tue, Dec 8, 2020 at 11:31 PM Artem Savkov <artem.savkov@gmail.com> wrote:
> >>
> >> On Tue, Dec 08, 2020 at 05:20:35PM +0800, WANG Chao wrote:
> >>> Sorry for the late reply.
> >>>
> >>> On 11/25/20 at 10:42P, Masahiro Yamada wrote:
> >>>> On Tue, Nov 24, 2020 at 12:05 AM WANG Chao <chao.wang@ucloud.cn> wrote:
> >>>>>
> >>>>> On 11/23/20 at 02:23P, Masahiro Yamada wrote:
> >>>>>> On Tue, Nov 3, 2020 at 3:23 PM WANG Chao <chao.wang@ucloud.cn> wrote:
> >>>>>>>
> >>>>>>> extra-y target doesn't build for 'make M=...' since commit 6212804f2d78
> >>>>>>> ("kbuild: do not create built-in objects for external module builds").
> >>>>>>>
> >>>>>>> This especially breaks kpatch, which is using 'extra-y := kpatch.lds'
> >>>>>>> and 'make M=...' to build livepatch patch module.
> >>>>>>>
> >>>>>>> Add extra-y to targets-for-modules so that such kind of build works
> >>>>>>> properly.
> >>>>>>>
> >>>>>>> Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
> >>>>>>> ---
> >>>>>>>   scripts/Makefile.build | 2 +-
> >>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> >>>>>>> index ae647379b579..0113a042d643 100644
> >>>>>>> --- a/scripts/Makefile.build
> >>>>>>> +++ b/scripts/Makefile.build
> >>>>>>> @@ -86,7 +86,7 @@ ifdef need-builtin
> >>>>>>>   targets-for-builtin += $(obj)/built-in.a
> >>>>>>>   endif
> >>>>>>>
> >>>>>>> -targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> >>>>>>> +targets-for-modules := $(extra-y) $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> >>>>>>>
> >>>>>>>   ifdef need-modorder
> >>>>>>>   targets-for-modules += $(obj)/modules.order
> >>>>>>> --
> >>>>>>> 2.29.1
> >>>>>>>
> >>>>>>
> >>>>>> NACK.
> >>>>>>
> >>>>>> Please fix your Makefile.
> >>>>>>
> >>>>>> Hint:
> >>>>>> https://patchwork.kernel.org/project/linux-kbuild/patch/20201123045403.63402-6-masahiroy@kernel.org/
> >>>>>>
> >>>>>>
> >>>>>> Probably what you should use is 'targets'.
> >>>>>
> >>>>> I tried with 'targets' and 'always-y'. Both doesn't work for me.
> >>>>>
> >>>>> I narraw it down to the following example:
> >>>>>
> >>>>> cat > Makefile << _EOF_
> >>>>> obj-m += foo.o
> >>>>>
> >>>>> ldflags-y += -T $(src)/kpatch.lds
> >>>>> always-y += kpatch.lds
> >>>>>
> >>>>> foo-objs += bar.o
> >>>>>
> >>>>> all:
> >>>>>          make -C /lib/modules/$(shell uname -r)/build M=$(PWD)
> >>>>> clean:
> >>>>>          make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
> >>>>> _EOF_
> >>>>>
> >>>>> Take a look into scripts/Makefile.build:488:
> >>>>>
> >>>>> __build: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
> >>>>>           $(if $(KBUILD_MODULES), $(targets-for-modules)) \
> >>>>>           $(subdir-ym) $(always-y)
> >>>>>          @:
> >>>>>
> >>>>> 'always-y' is built after 'targets-for-modules'. This makes
> >>>>> 'targets-for-modules' fails because kpatch.lds isn't there.
> >>>>
> >>>>
> >>>> Heh, you rely on the targets built from left to right,
> >>>> and you have never thought Make supports the parallel option -j.
> >>>
> >>> You're right. I missed that.
> >>>
> >>>>
> >>>>
> >>>> You need to specify the dependency if you expect objects
> >>>> are built in the particular order.
> >>>>
> >>>> However, in this case, using ldflags-y looks wrong
> >>>> in the first place.
> >>>>
> >>>> The linker script is used when combining the object
> >>>> as well as the final link of *.ko
> >>
> >> We want linker script to be used on both those steps, otherwise modpost
> >> fails.
> >
> >
> > In that case, does the following work?
> > (untested)
> >
> >
> >
> > diff --git a/kmod/patch/Makefile b/kmod/patch/Makefile
> > index e017b17..02d4c66 100644
> > --- a/kmod/patch/Makefile
> > +++ b/kmod/patch/Makefile
> > @@ -12,7 +12,9 @@ endif
> >
> >   obj-m += $(KPATCH_NAME).o
> >   ldflags-y += -T $(src)/kpatch.lds
> > -extra-y := kpatch.lds
> > +targets += kpatch.lds
> > +
> > +$(obj)/$(KPATCH_NAME).o: $(obj)/kpatch.lds
> >
> >   $(KPATCH_NAME)-objs += patch-hook.o output.o
> >
>
> Hi Masahiro,
>
> Yeah this is more or less what Artem came up with:
> https://github.com/dynup/kpatch/pull/1149
>
> though we hadn't added kpatch.lds to targets.  Is there documentation
> somewhere on what effect "targets" has for out-of-tree builds?
>
> Thanks,
>
> -- Joe
>


Please try the rebuild without changing any source code.

If kpatch.lds is needlessly rebuilt, you need to add
it to 'targets'.


In linux-next, this is documented.

Documentation/kbuild/makefile.rst:

        Any target that utilizes if_changed must be listed in $(targets),
        otherwise the command line check will fail, and the target will
        always be built.







-- 
Best Regards
Masahiro Yamada
