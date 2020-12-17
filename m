Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7F82DD112
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Dec 2020 13:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgLQMF1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Dec 2020 07:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgLQMF0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Dec 2020 07:05:26 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F74CC061794;
        Thu, 17 Dec 2020 04:04:46 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ga15so37478292ejb.4;
        Thu, 17 Dec 2020 04:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=crgc6wkW4VempU5HmP4qXbD9FhDUqY6/D2yW3tVCEpE=;
        b=ocvqyBVcSEZ4mad25E6EkZ6kLnzZwNRW0cKPcHsQjrRLUZx27Ftm3xJnR5uQky5OH0
         FTHtXTwbWcnmuxlPnFC2bo+PqEc9VMlHnNcKGuZM3F4e50w08hPAFPiPSvrI+okDvFsN
         WnHRqgi+JylDSSdJpz7YgjF2tXLqdEUFjRIFUIG8DcGJTIajdnM17/mIjOHs+6vXlzyO
         wOW8rdcnZ6nAVfXCf0dy0wvCpGlbY1PXXC/saHaRMXnD226FmqbFptnVR7wpQy9T/qPI
         bYZP69Ss4eBjbqJ2HDisDrOm1+E8bC+t90W6wQsOQ1OyjVAXrzGHRoUQrYNWoOtvmlbP
         qQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=crgc6wkW4VempU5HmP4qXbD9FhDUqY6/D2yW3tVCEpE=;
        b=nPCTJyl7D8122KB6p33Ys9zN8WxANLKWiXb4TrkSsQnCwpo4vUWYLLptS2KTVg2gCn
         DKGXARvFznfYYB9sGbadD6xnS72cRH108R+bHYEWgOeNlkXD3Mc47yG/tXwLzdPEd0aI
         cQaYT0RPC9CZOIfiSVdUcNDOz7uHq1uvMPSzZVt9IubdmvQix73bl7A+aaEqqAeeNAEJ
         xX+GrGFG2IKh7Jts/kEM2iVvxD731qFpZLZ3Ff9ZwPnKiZ9Awqs6//YZPhSdjeFrKsOt
         q8U9Ow8+1xn26Fsnat5yobGbCiGPzAavr9e1xdkFRx3hrs5xDHFsqW9duARPk+hMNSnn
         c2gQ==
X-Gm-Message-State: AOAM530GgYG6Qm+4IJDn5G8kANywTrTU+i+1W0RPBXqO2A9+eDV4j1mq
        sEoJ3ZnvqmshxQo1OBA/FvI=
X-Google-Smtp-Source: ABdhPJwlphTNHge0FDRXyyhVNuVGNHR9mskoXZZ0eJ90S+7VNcLKQwCm4kRHGSKQXZC5ggerQKse7g==
X-Received: by 2002:a17:906:31c2:: with SMTP id f2mr36000767ejf.518.1608206685065;
        Thu, 17 Dec 2020 04:04:45 -0800 (PST)
Received: from localhost (176-74-128-122.netdatacomm.cz. [176.74.128.122])
        by smtp.gmail.com with ESMTPSA id ci20sm3540303ejc.26.2020.12.17.04.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 04:04:44 -0800 (PST)
Date:   Thu, 17 Dec 2020 13:04:43 +0100
From:   Artem Savkov <artem.savkov@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        WANG Chao <chao.wang@ucloud.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] kbuild: add extra-y to targets-for-modules
Message-ID: <20201217120443.GA739639@sparkplug.usersys.redhat.com>
References: <20201103054425.59251-1-chao.wang@ucloud.cn>
 <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
 <20201123150452.GA68187@MacBook-Pro-2>
 <CAK7LNASH7Pj9eUdxF-sp1_Ap+uA9jEtsXa--pUDDw_pNVLtviA@mail.gmail.com>
 <20201208092035.GA96434@MacBook-Pro-2.local>
 <20201208143117.GA3333762@wtfbox.lan>
 <CAK7LNAS=wdCObfX3x8CQmXf8HsrKAjz+v+XVUCxVg63pxy8MXg@mail.gmail.com>
 <f2d1888b-5b8e-a513-61c7-f41fc3f3f7a3@redhat.com>
 <CAK7LNATmfzt0kTF0BWkSRaZV3p01mvN4OSGPZsCp+KHghCWf0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNATmfzt0kTF0BWkSRaZV3p01mvN4OSGPZsCp+KHghCWf0Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 17, 2020 at 05:26:07PM +0900, Masahiro Yamada wrote:
> On Thu, Dec 17, 2020 at 8:04 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
> >
> > On 12/16/20 1:14 AM, Masahiro Yamada wrote:
> > > On Tue, Dec 8, 2020 at 11:31 PM Artem Savkov <artem.savkov@gmail.com> wrote:
> > >>
> > >> On Tue, Dec 08, 2020 at 05:20:35PM +0800, WANG Chao wrote:
> > >>> Sorry for the late reply.
> > >>>
> > >>> On 11/25/20 at 10:42P, Masahiro Yamada wrote:
> > >>>> On Tue, Nov 24, 2020 at 12:05 AM WANG Chao <chao.wang@ucloud.cn> wrote:
> > >>>>>
> > >>>>> On 11/23/20 at 02:23P, Masahiro Yamada wrote:
> > >>>>>> On Tue, Nov 3, 2020 at 3:23 PM WANG Chao <chao.wang@ucloud.cn> wrote:
> > >>>>>>>
> > >>>>>>> extra-y target doesn't build for 'make M=...' since commit 6212804f2d78
> > >>>>>>> ("kbuild: do not create built-in objects for external module builds").
> > >>>>>>>
> > >>>>>>> This especially breaks kpatch, which is using 'extra-y := kpatch.lds'
> > >>>>>>> and 'make M=...' to build livepatch patch module.
> > >>>>>>>
> > >>>>>>> Add extra-y to targets-for-modules so that such kind of build works
> > >>>>>>> properly.
> > >>>>>>>
> > >>>>>>> Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
> > >>>>>>> ---
> > >>>>>>>   scripts/Makefile.build | 2 +-
> > >>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>>>>>
> > >>>>>>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > >>>>>>> index ae647379b579..0113a042d643 100644
> > >>>>>>> --- a/scripts/Makefile.build
> > >>>>>>> +++ b/scripts/Makefile.build
> > >>>>>>> @@ -86,7 +86,7 @@ ifdef need-builtin
> > >>>>>>>   targets-for-builtin += $(obj)/built-in.a
> > >>>>>>>   endif
> > >>>>>>>
> > >>>>>>> -targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > >>>>>>> +targets-for-modules := $(extra-y) $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> > >>>>>>>
> > >>>>>>>   ifdef need-modorder
> > >>>>>>>   targets-for-modules += $(obj)/modules.order
> > >>>>>>> --
> > >>>>>>> 2.29.1
> > >>>>>>>
> > >>>>>>
> > >>>>>> NACK.
> > >>>>>>
> > >>>>>> Please fix your Makefile.
> > >>>>>>
> > >>>>>> Hint:
> > >>>>>> https://patchwork.kernel.org/project/linux-kbuild/patch/20201123045403.63402-6-masahiroy@kernel.org/
> > >>>>>>
> > >>>>>>
> > >>>>>> Probably what you should use is 'targets'.
> > >>>>>
> > >>>>> I tried with 'targets' and 'always-y'. Both doesn't work for me.
> > >>>>>
> > >>>>> I narraw it down to the following example:
> > >>>>>
> > >>>>> cat > Makefile << _EOF_
> > >>>>> obj-m += foo.o
> > >>>>>
> > >>>>> ldflags-y += -T $(src)/kpatch.lds
> > >>>>> always-y += kpatch.lds
> > >>>>>
> > >>>>> foo-objs += bar.o
> > >>>>>
> > >>>>> all:
> > >>>>>          make -C /lib/modules/$(shell uname -r)/build M=$(PWD)
> > >>>>> clean:
> > >>>>>          make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
> > >>>>> _EOF_
> > >>>>>
> > >>>>> Take a look into scripts/Makefile.build:488:
> > >>>>>
> > >>>>> __build: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
> > >>>>>           $(if $(KBUILD_MODULES), $(targets-for-modules)) \
> > >>>>>           $(subdir-ym) $(always-y)
> > >>>>>          @:
> > >>>>>
> > >>>>> 'always-y' is built after 'targets-for-modules'. This makes
> > >>>>> 'targets-for-modules' fails because kpatch.lds isn't there.
> > >>>>
> > >>>>
> > >>>> Heh, you rely on the targets built from left to right,
> > >>>> and you have never thought Make supports the parallel option -j.
> > >>>
> > >>> You're right. I missed that.
> > >>>
> > >>>>
> > >>>>
> > >>>> You need to specify the dependency if you expect objects
> > >>>> are built in the particular order.
> > >>>>
> > >>>> However, in this case, using ldflags-y looks wrong
> > >>>> in the first place.
> > >>>>
> > >>>> The linker script is used when combining the object
> > >>>> as well as the final link of *.ko
> > >>
> > >> We want linker script to be used on both those steps, otherwise modpost
> > >> fails.
> > >
> > >
> > > In that case, does the following work?
> > > (untested)
> > >
> > >
> > >
> > > diff --git a/kmod/patch/Makefile b/kmod/patch/Makefile
> > > index e017b17..02d4c66 100644
> > > --- a/kmod/patch/Makefile
> > > +++ b/kmod/patch/Makefile
> > > @@ -12,7 +12,9 @@ endif
> > >
> > >   obj-m += $(KPATCH_NAME).o
> > >   ldflags-y += -T $(src)/kpatch.lds
> > > -extra-y := kpatch.lds
> > > +targets += kpatch.lds
> > > +
> > > +$(obj)/$(KPATCH_NAME).o: $(obj)/kpatch.lds
> > >
> > >   $(KPATCH_NAME)-objs += patch-hook.o output.o
> > >
> >
> > Hi Masahiro,
> >
> > Yeah this is more or less what Artem came up with:
> > https://github.com/dynup/kpatch/pull/1149
> >
> > though we hadn't added kpatch.lds to targets.  Is there documentation
> > somewhere on what effect "targets" has for out-of-tree builds?
> >
> > Thanks,
> >
> > -- Joe
> >
> 
> 
> Please try the rebuild without changing any source code.
> 
> If kpatch.lds is needlessly rebuilt, you need to add
> it to 'targets'.
> 
> 
> In linux-next, this is documented.
> 
> Documentation/kbuild/makefile.rst:
> 
>         Any target that utilizes if_changed must be listed in $(targets),
>         otherwise the command line check will fail, and the target will
>         always be built.

Ah yes, it did rebuild every time. Thank you for the pointer.

-- 
 Artem
