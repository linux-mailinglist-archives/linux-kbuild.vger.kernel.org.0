Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AB933414B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 16:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhCJPRD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 10:17:03 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:44306 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhCJPQ3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 10:16:29 -0500
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 12AFFu1r027275;
        Thu, 11 Mar 2021 00:15:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 12AFFu1r027275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615389357;
        bh=am2Rpw5u8k0GIO0ZLg2v0XmZ9MepkJ5+FWoX6aHGHrg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=omk4UADYKMUBJp6sKf4ci7fLuozdTe1T8IbBNiZN8iRYtBY8oBmnLlFtFjf4xPEE6
         DwIe+nRz9c3lGa3wU5oGcBxkzGvCj0M5zmsVSEHua3Y4svzgfPFqNF9+z5NXhku3+X
         OGcW7z+DR2j2WxBdBZisf84pibabaW7943coE9hC7lJTdQ4ErHNTd8YTOoim8TShTE
         JxRZ5tKK9GDuC7+8ZVZYT5zuJn3zjJd9pMlQNL7x915kr2HQjzcZZNIkYH8grOEbh6
         AlpUnGF4muniT+wJJEnWiBm4Ch8skGp4EIEECvbFjSveaqWSoDU3xuwWzywK9Nvfz5
         b9ER/3jsOHw5w==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id w7so5134653pll.8;
        Wed, 10 Mar 2021 07:15:57 -0800 (PST)
X-Gm-Message-State: AOAM5332I8lcl20RjJSQWBByeCN80apI9+tGcRGLvO4T6uBSq6cfeqtD
        riqYjtZxtGa+iSLwvRxYTdk5+0GL36Lclodt0EU=
X-Google-Smtp-Source: ABdhPJzNL9Y7K7R8TM5hJNqul6boslcL1ISkBronua4FGzwGMDlgaXULaU+Le+9O8ODXuyx5G/jdokhFvmarIVgUi5c=
X-Received: by 2002:a17:902:8ec9:b029:e6:c5e:cf18 with SMTP id
 x9-20020a1709028ec9b02900e60c5ecf18mr3249695plo.47.1615389356374; Wed, 10 Mar
 2021 07:15:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1615354376.git.viresh.kumar@linaro.org> <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com> <20210310144730.5ipzeailoj6nno5h@vireshk-i7>
In-Reply-To: <20210310144730.5ipzeailoj6nno5h@vireshk-i7>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 11 Mar 2021 00:15:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARKdZT+UdCVmZ1_P3T07yT2Ra34rzMf2RwMvkj7hVkfDg@mail.gmail.com>
Message-ID: <CAK7LNARKdZT+UdCVmZ1_P3T07yT2Ra34rzMf2RwMvkj7hVkfDg@mail.gmail.com>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source files
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 11:47 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 10-03-21, 20:24, Masahiro Yamada wrote:
> > On Wed, Mar 10, 2021 at 2:35 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > > index bc045a54a34e..59e86f67f9e0 100644
> > > --- a/scripts/Makefile.lib
> > > +++ b/scripts/Makefile.lib
> > > @@ -339,7 +339,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
> > >
> > >  quiet_cmd_dtc = DTC     $@
> > >  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> > > -       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> > > +       $(DTC) -I dts -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> >
> > Even without "-I dts",
> >
> >    inform = guess_input_format(arg, "dts");
> >
> > seems to fall back to "dts" anyway,
>
> I missed this TBH.
>
> > but I guess you wanted to make this explicit, correct?
>
> That can be a reason now :)
>
> > I will drop the ugly -O.
> > https://patchwork.kernel.org/project/linux-kbuild/patch/20210310110824.782209-1-masahiroy@kernel.org/
>
> But if we are going to depend on DTC to guess it right, then we
> shouldn't add -I at all..
>
> > I will queue it to linux-kbuild/fixes.
> >
> >
> >
> > >                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> > >                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> > >         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> > > @@ -347,9 +347,13 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
> > >  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
> > >         $(call if_changed_dep,dtc)
> > >
> > > +# Required for of unit-test files as they can't be renamed to .dtso
> >
> > If you go with *.dtso, I think you will rename
> > all *.dts under the drivers/ directory.
> >
> > What is blocking you from making this consistent?
>
> The unit-test dts files are designed differently (we have had lots of
> discussion between Frank and David on that) and they aren't purely
> overlay or base files. They are designed to do some tricky testing and
> renaming them to .dtso won't be right, we are just reusing them to do
> static (build time) testing as well.


I still do not understand.

If they are not overlay files, why
do you need to have them suffixed with .dtbo?

".dts -> .dtb" should be enough.

Why do you need to do ".dts  -> .dtbo" ?




> I think it would be better if we can drop the existing %.dtbo rule
> here (i.e. dtbo from .dts) and do some magic in unit-test's Makefile,
> so it is localised at least instead of it here.
>
> Any ideas for that ?

I do not know.

My impression is you are doing something fishy.




-- 
Best Regards
Masahiro Yamada
