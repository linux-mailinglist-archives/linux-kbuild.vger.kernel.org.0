Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0ED133CD4A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 06:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235460AbhCPF2G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 01:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbhCPF1v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 01:27:51 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B7EC06174A
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Mar 2021 22:27:49 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id l2so21865262pgb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Mar 2021 22:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mEGvwxRSdX+26sKEJTAJbfC9LfjSTi3jGS6oVQZmyNk=;
        b=WtvR0nXW3kcC1fRrCCtKU9xDoW3LofQamKx3fyUgUsvQSa5fIaGYKGS6C2y6/9NMHP
         l7TYFRgQcmus88lAVg69rz7MrmU+nzkN6faSJLaGwD/pXbAbRiSTaoCyoBiKVcaNXUeY
         5REkP5L+isnaaxVetMBlrtysFZ0GKPqBSYblFGqCOZYYhp80Ny0E9whVhWkh56A0NajZ
         deI81soxE+VXCFLhAVqZRBDS+0lv/VDA0jGEnq1MVPlV+ZgsW7y3NP8GIjRaBMNUjDg0
         XmTe9MDGaT+4eqL9HjiEVdZKKlq/VU0XIUQmqi3MmLVnRm/I6kDAYKbNrBb9a+1SjbOG
         17pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mEGvwxRSdX+26sKEJTAJbfC9LfjSTi3jGS6oVQZmyNk=;
        b=gGhj2HmDr99tAda5N4uo3Tif+3tAnuL8t2ZWEGXqtUmzxGbt5LsnDhPrRQGncbZMlY
         xqzUqBmz86RcpURH9+rFPUrDnhTWvj9IL4fG7Iv6OyxERGfWKPxqJqlPuOBU8qU6Toqc
         Mh7+pKwlKrUy104HyGbH39mSRYP4QozcR0kjd6VmSsoxv6rfPxWjvNLZ/Djv8np8IEuW
         WR+4ev7rkNqoOiT4Ol5fcQN1pfg1UpjDRivTEpUCSncV3DuiG+MgFRx+IjEDEieZ6lXq
         7CmRRWsETSEd7VDk8Wtl317ny5Np6PifrXlvGRCfiCdSVPWDW6VDpRosYU8dBr9uUT+M
         Xi8g==
X-Gm-Message-State: AOAM531gIWoG/XSPQf4IhqRyJvXlUl+JbsW1IGFKcG0p5g6wXPM5N16G
        xy1LglRczXgHZCwtqptVvPjguA==
X-Google-Smtp-Source: ABdhPJzeD/97kt/QC9gJzyL77V0bTiQSzKV1/quclmYq2PBmLQg+t9KRE9wkB8ZFNLzfp2L5Hy1zsQ==
X-Received: by 2002:a65:63d6:: with SMTP id n22mr2376938pgv.393.1615872469248;
        Mon, 15 Mar 2021 22:27:49 -0700 (PDT)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id q4sm15207633pfq.103.2021.03.15.22.27.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Mar 2021 22:27:48 -0700 (PDT)
Date:   Tue, 16 Mar 2021 10:57:43 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
Message-ID: <20210316052743.aysh4sooz4s7rwqq@vireshk-i7>
References: <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7>
 <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
 <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
 <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
 <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
 <CAK7LNASHHNmZJ4FXz4Q5-UMEbSSyb_aG+kmfhJQZtCgkSZ_GAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASHHNmZJ4FXz4Q5-UMEbSSyb_aG+kmfhJQZtCgkSZ_GAQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 16-03-21, 02:43, Masahiro Yamada wrote:
> On Mon, Mar 15, 2021 at 3:40 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 14-03-21, 20:16, Frank Rowand wrote:
> > What about doing this then in unittest's Makefile instead (which I
> > already suggested earlier), that will make everything work just fine
> > without any other changes ?
> >
> > +# Required for of unittest files as they can't be renamed to .dtso
> > +$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> > +       $(call if_changed_dep,dtc)
> 
> If those rules are only needed by drivers/of/unittest-data/Makefile,
> they should not be located in scripts/Makefile.lib.

Right, this is exactly what I suggested.

> But how can we fix drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a779*.dts
> if these are doing bad things.
> They seem to be overlay files even though the file name suffix is .dts
> 
> $ find drivers -name '*.dts'
> drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
> drivers/staging/mt7621-dts/gbpc2.dts
> drivers/staging/mt7621-dts/gbpc1.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts

For all the above files, even if they are really overlay files, we
won't use fdtoverlay tool to apply them to some base dtb and so if we
leave them as is, i.e. .dts->.dtb, it won't break anything.

The problem only happens if someone wants to generate .dtbo for them
instead and then they should be named .dtso as we won't allow .dts ->
.dtbo conversion there.

-- 
viresh
