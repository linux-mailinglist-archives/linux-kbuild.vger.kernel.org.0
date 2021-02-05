Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5F4311716
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 00:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhBEXZN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 18:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhBEJ4a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 04:56:30 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC35DC0617A9
        for <linux-kbuild@vger.kernel.org>; Fri,  5 Feb 2021 01:55:48 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id m12so3329648pjs.4
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Feb 2021 01:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bdqbiOx96ZjGlvDj89re9Lv5tP/labX2E5OeezghzzA=;
        b=sNaAZVhr4ZWW+HvhkEvCK60kufSKBpL0okB1oVoFhRQkODNHmvla3bL0n2655cHakn
         ahzuSLumkW1g3503AJBqLhhmenG6CeT1aGphN4VUpWBUClFCcOktfkfnMTx35wKd6m9J
         XRMjl762BKyK2T/YM4iB/Af3qwLr91UqEYGIDdodum1nbUPKkvO7VlSygMg8aya62mZf
         H4waAizinttR319yw3YGqLnR9D9ubjjjmv1Ee6TqWJnUkClEAr0CZNt69r5RgEKIYBwI
         WOVmzJ36sjEd0O2ssh2fPxjX3O1ke4RkPfbKPm96OlymIEkLyspIqNOembEfhX19nKiF
         esbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bdqbiOx96ZjGlvDj89re9Lv5tP/labX2E5OeezghzzA=;
        b=DTKaChw2f1Pwa8SWPnVCoLxjUz7+KtN0ZjCYUk6wQia3YaVJdZg8eUYGc3avBSttNM
         +xm8ySlH/1u+pHYBPwyBLUv28sTPIkTtMtKb+YpRb8c0lmp6RG83A91DAnu9BsLAHfTd
         4kCEKVNJAGJ2McR57TtNCMYZwcqrlFO6Igi0WcqxPcnlIeCy/mbDzb4Hkyw+etu2n0FQ
         BoZ6LKdMUSKjV6//REiIqaTZKkzcrzNW8ZPhgyZJq8bcg+psXlRCNZDfglz5JVeXcabG
         PFq9nLfwzD6QatfNHv+a2O5swxa10bya62czHwrKR2V6KBkWkLHwG+uVf+rcgatdz/O+
         VA9Q==
X-Gm-Message-State: AOAM530M/tGEYNSohzAgv89BsyB1ePKmTiepML/EExZ6XzlZhRixKzQ2
        yu/9hlhSc2n24PXATuoZU/Pv8g==
X-Google-Smtp-Source: ABdhPJx4IP8HYF4plUaQ5oiiOkbrrvWNIgSboohs8FGAMUWfvXRdAYb53lVFHPh4GcbyTOWtUPEKGQ==
X-Received: by 2002:a17:90a:1503:: with SMTP id l3mr3338386pja.41.1612518948404;
        Fri, 05 Feb 2021 01:55:48 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id i14sm3035535pfk.28.2021.02.05.01.55.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2021 01:55:47 -0800 (PST)
Date:   Fri, 5 Feb 2021 15:25:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210205095545.woevnkxg3ar7ctys@vireshk-i7>
References: <cover.1611904394.git.viresh.kumar@linaro.org>
 <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
 <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
 <CAMuHMdWUMcMcJxnC+oML8P0+r72_+d6RWGY50dOWCUECdJGWPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWUMcMcJxnC+oML8P0+r72_+d6RWGY50dOWCUECdJGWPA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 05-02-21, 10:41, Geert Uytterhoeven wrote:
> Hi Viresh,
> 
> On Fri, Feb 5, 2021 at 10:25 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 05-02-21, 10:02, Geert Uytterhoeven wrote:
> > > Thanks for your patch
> > > (which I only noticed because it appeared in dt-rh/for-next ;-)
> > >
> > > On Fri, Jan 29, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > Add support for building DT overlays (%.dtbo). The overlay's source file
> > > > will have the usual extension, i.e. .dts, though the blob will have
> > >
> > > Why use .dts and not .dtso for overlays?
> > > Because you originally (until v5) had a single rule for building .dtb
> > > and .dtbo files?
> >
> > I am fine with doing that as well if Rob and David agree to it. Rob
> > did suggest that at one point but we didn't do much about it later on
> > for some reason.
> >
> > FWIW, this will also require a change in the DTC compiler.
> 
> Care to explain why? I've been using .dtsi for ages in
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

I don't see you building them anywhere, they aren't added to the
Makefile ever. What am I missing ?

actually none of the dtso's were added to any makefile in that branch.

Anyway, the DTC needs to know how to treat the dtso format and it will
error out currently with unknown format kind of errors.

Below email [1] have some information on the kind of changes required
here. Also note that we had to do similar changes for dtbo earlier
[2].

-- 
viresh

[1] https://lore.kernel.org/lkml/CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com/
[2] https://lore.kernel.org/lkml/30fd0e5f2156665c713cf191c5fea9a5548360c0.1609926856.git.viresh.kumar@linaro.org/
