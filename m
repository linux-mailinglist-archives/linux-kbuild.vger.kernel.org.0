Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A4832C1ED
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378653AbhCCTbF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:31:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242413AbhCCL0W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 06:26:22 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7BCC061797
        for <linux-kbuild@vger.kernel.org>; Wed,  3 Mar 2021 02:54:08 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id ba1so13842606plb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Mar 2021 02:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=17qLkzVR4fDScPfY7vZjF5kcukiEHoAp19Fn4XkGuPo=;
        b=u/CYVeOPKhDtW43/XVvuz7gk0ggCNlXYO/BohYk/i1Shlw8TnXQ8mPpl7cncGlo0qd
         JH214uUjMbyZuFyBP/T3DsBTPOqdjdvZa445Nojt9SVx+7UwdW/pggOapqTesPf1RgTL
         GB1916qdkRtWPfrOZ9JHRRHm6+Ri+rgizJzdsTtlnBS8SpM5C5eTxL97oa3m+uv6V6Cw
         TYWNNPByPf5bP9t9Zj+WpQ7gl1H7up7IWrkzZZUaF4HMxl4/6UJ1Bv0wm7bT9piwN6UV
         StCMWw0BGvH9f2WaQsnf40E6OUIzafuMudkNhgAzSM5cLh01ajDOwuE6Fk/NUJgnDfaF
         zWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=17qLkzVR4fDScPfY7vZjF5kcukiEHoAp19Fn4XkGuPo=;
        b=cHuKmtk1vSsiz+5DbtO/kNBu8fKDedJi1ILBEATMPT5MgImPRCl+qr4hP4p/XPGpkx
         IKNTCttZfco5qs83guU4m2711We1g212Lj7Ru2I4smbbI6EjxRmFtExHt2dMIa+441uE
         7X/eP6IwxGYVXK/hxy3/+LrpP1YkJU/gREdV99ifXOU6b5O09g4zWCGsRwHDDza1lSa9
         HT7nlnHjGxjjwuWUInIHwYhaUZJlaDMxUJLTF2nZdEBjLv0spF0V/lvb0ZQJpD25WOdy
         xlysKEx1/YaZ0rOAfJpd8PFT2pFxvLLO1wYAh6XLM1CX4gkeOEiHfEGep1VDKz5bFp67
         UlfA==
X-Gm-Message-State: AOAM533P55vLq8GpI70HjAmQBJCMLku6zQTa8PZ3BckUPqle4fuO+Dgi
        nnVfLX9xgNpvswxdg6tCQORFcA==
X-Google-Smtp-Source: ABdhPJzhVZkcz7rWsr6j7MUmAYxKMm1V1EPTGHBCQ6bpz6KHLvxj7xlfX+AsSykXzna+hQyUBcaAtA==
X-Received: by 2002:a17:90a:be09:: with SMTP id a9mr9023080pjs.219.1614768847836;
        Wed, 03 Mar 2021 02:54:07 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id b26sm20454717pfo.1.2021.03.03.02.54.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Mar 2021 02:54:07 -0800 (PST)
Date:   Wed, 3 Mar 2021 16:24:04 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210303105404.w2nramurt5teuvpd@vireshk-i7>
References: <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
 <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
 <CAMuHMdWUMcMcJxnC+oML8P0+r72_+d6RWGY50dOWCUECdJGWPA@mail.gmail.com>
 <20210205095545.woevnkxg3ar7ctys@vireshk-i7>
 <CAMuHMdXKT3LD3ojMJEg-oHsEKO5TN5P1BTJMyf2fYkhnC8PU=Q@mail.gmail.com>
 <20210205210814.GA3707622@robh.at.kernel.org>
 <02728dac-5666-9c2b-bd46-9c2eabbb2ed8@gmail.com>
 <20210303052125.uh32ndnu5d6mem7c@vireshk-i7>
 <CAMuHMdVJYNf+QQNPSmBvt3njEECY1SJHA9jLAESrTnVuD0cfWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVJYNf+QQNPSmBvt3njEECY1SJHA9jLAESrTnVuD0cfWA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 03-03-21, 11:44, Geert Uytterhoeven wrote:
> Hi Viresh,
> 
> On Wed, Mar 3, 2021 at 6:21 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 24-02-21, 19:32, Frank Rowand wrote:
> > > I overlooked this and mistakenly thought that the move to .dtbo also
> > > involved changing to .dtso.  My bad.
> > >
> > > My favorite color here is to use .dtso for the source file that will
> > > be compiled to create a .dtbo.
> > >
> > > Linus has already accepted patch 4/6 to 5.12-rc1, so changing to .dtso
> > > will require another patch.
> >
> > Looks like this is what many people desire, lets do it and make it a
> > standard even if it wasn't followed earlier.
> >
> > What about this ?
> 
> Thanks, looks good to me, and works for me, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks.

> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -337,7 +337,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
> >
> >  quiet_cmd_dtc = DTC     $@
> >  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> > -       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> > +       $(DTC) -I dts -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> >                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> >                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> >         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> > @@ -348,6 +348,9 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
> >  $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> >         $(call if_changed_dep,dtc)
> >
> > +$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
> > +       $(call if_changed_dep,dtc)
> > +
> >  overlay-y := $(addprefix $(obj)/, $(overlay-y))
> >
> >  quiet_cmd_fdtoverlay = DTOVL   $@
> > @@ -373,6 +376,9 @@ endef
> >  $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
> >         $(call if_changed_rule,dtc,yaml)
> >
> > +$(obj)/%.dt.yaml: $(src)/%.dtso $(DTC) $(DT_TMP_SCHEMA) FORCE
> 
> I'm wondering if "dt.yaml" should be changed to "dto.yaml" (here and in
> the existing rule earlier in Makefile.lib), to avoid issues if both foo.dts and
> foo.dtso exist? Unlikely, but it might happen...

I will let Rob answer that :)

> > I had to keep the original line as is:
> >
> >  $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> >
> > to support the unittest stuff as there are no dtso files there. There
> > are few things we can do here:
> >
> > - Don't follow the dtso/dtbo convention for unittest, build files as
> >   dtb only and everything will continue to work I suppose as
> >   fdtoverlay won't complain.
> >
> > - Keep the above line in Makefile, this doesn't sound right, isn't it
> >   ?
> >
> > - Make .dts links for unittest file, maybe from the Makefile itself.
> >
> > - Something else ?
> 
> Rename unittest .dts files to .dtso where applicable?

They are used for some runtime tests, we are reusing them to do this
testing as well, so renaming them is out of the question I believe.

-- 
viresh
