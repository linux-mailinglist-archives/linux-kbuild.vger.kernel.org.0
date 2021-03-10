Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B1E3340AD
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 15:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbhCJOrz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 09:47:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232587AbhCJOre (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 09:47:34 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C60C061760
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Mar 2021 06:47:33 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id ha17so986602pjb.2
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Mar 2021 06:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8nVZpKJm2G6+Tv7qEZM8ArWrPGc3bpG+Vuw50VmO88I=;
        b=eQlbtSKvzf6Q3pni9+l7ILEa82jE+wshQl7wH51lNSRPAIB0Qc775lX3Lt318vPD5h
         3XURESeHLeIAu+V+Dy3be1VAhbl83ApgEcitA/Mb/HnMmohUZDqKKlfcTJHV3rwVRJuV
         lGKnU2l3jtmopQUmNhaMAMPwI/Cjqo3zI/AdZrDELkTm5dUGO7FYaWaboTYU9ALoHL2e
         cRiAQZB5bXboDLWFFxi2PDMWf5tzgbZ959Mf2AnR5o2g4Ln+OxBZ4zUoRLkQZi+Fx36q
         9x1VbQagNu1mWERibggsYy1gM9D+rX2Mnbj1S8gysYoBZFr+ZrGRE4mfcxMcSMeYn4+x
         v0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8nVZpKJm2G6+Tv7qEZM8ArWrPGc3bpG+Vuw50VmO88I=;
        b=sgtLjE1MObKihLunKVtiYj4935LJdVN/AwupxmBXVU9N7olijVEfmniuwdB6mmfdYD
         zgNWmuhTURWOQ5EDBBJdTEpKoqmDChRcpcYE3p1D1rr0S6SZeE2BkvjtACLn7Y8ffx0L
         zRLqrDbSMZ/JTN6tNKCJy+dKHPOB+7+9X4bDJ+jqcwvq51+CALwbAj8MDS+mY5ErsQWU
         eXOx37apzK+h+7BocAIo1V/BPi1wYLD2RKwET6aU+YhQ5qSNF1YVLgzMJgIJj68cwBe0
         1Sjym6/pJjgyhi6oyJfTqBiPpC7lyNUBJPhdHapAhVXvzcNGJrTybstIQrblNRlCapHF
         ps0A==
X-Gm-Message-State: AOAM5334r5j5rrkKlSR728ZOQPOaGgyosFddVx343BEoHsuF4CKIjXXe
        /UxcWy+KuHP2iv7eRS1TcvURhFj00lrSfg==
X-Google-Smtp-Source: ABdhPJz7dbYYNajcNZrCQEb9vKEqZ/ETsqcIUxAHyzXK6nFl5z6rJM5ybX2hKbGuEbqa5Z4Df+dG5A==
X-Received: by 2002:a17:90a:e7cc:: with SMTP id kb12mr1218121pjb.31.1615387653515;
        Wed, 10 Mar 2021 06:47:33 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id s15sm16561363pfe.108.2021.03.10.06.47.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Mar 2021 06:47:32 -0800 (PST)
Date:   Wed, 10 Mar 2021 20:17:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
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
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
Message-ID: <20210310144730.5ipzeailoj6nno5h@vireshk-i7>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10-03-21, 20:24, Masahiro Yamada wrote:
> On Wed, Mar 10, 2021 at 2:35 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index bc045a54a34e..59e86f67f9e0 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -339,7 +339,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
> >
> >  quiet_cmd_dtc = DTC     $@
> >  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> > -       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> > +       $(DTC) -I dts -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
> 
> Even without "-I dts",
> 
>    inform = guess_input_format(arg, "dts");
> 
> seems to fall back to "dts" anyway,

I missed this TBH.

> but I guess you wanted to make this explicit, correct?

That can be a reason now :)

> I will drop the ugly -O.
> https://patchwork.kernel.org/project/linux-kbuild/patch/20210310110824.782209-1-masahiroy@kernel.org/

But if we are going to depend on DTC to guess it right, then we
shouldn't add -I at all..

> I will queue it to linux-kbuild/fixes.
> 
> 
> 
> >                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> >                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> >         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> > @@ -347,9 +347,13 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
> >  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
> >         $(call if_changed_dep,dtc)
> >
> > +# Required for of unit-test files as they can't be renamed to .dtso
> 
> If you go with *.dtso, I think you will rename
> all *.dts under the drivers/ directory.
> 
> What is blocking you from making this consistent?

The unit-test dts files are designed differently (we have had lots of
discussion between Frank and David on that) and they aren't purely
overlay or base files. They are designed to do some tricky testing and
renaming them to .dtso won't be right, we are just reusing them to do
static (build time) testing as well.

I think it would be better if we can drop the existing %.dtbo rule
here (i.e. dtbo from .dts) and do some magic in unit-test's Makefile,
so it is localised at least instead of it here.

Any ideas for that ?
 
-- 
viresh
