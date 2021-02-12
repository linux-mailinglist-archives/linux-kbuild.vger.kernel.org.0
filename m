Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5273231993F
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 05:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbhBLEmI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 23:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhBLEmG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 23:42:06 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA696C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Feb 2021 20:41:26 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id gx20so4679415pjb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Feb 2021 20:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3WNMt5XR+692WIpXHZivWGdM4xBg7M/kL8/oPyqVZG4=;
        b=qaQ5JWYqNNgsWrAMQwM8o2jl8EI0jJR2snb9qPJvnTXgING1a+YDGz4nusTevahy80
         kWwJ8PR+3Xbj7JFAtYCUuqkzUUc12Y/7Pta24nOyz6mjnVappjZrdflJ3JuSm4bYIQOW
         w3FYTt1q83kY+ycLunbpsWg7ALI12ARzJcgferXPxk4uZ3euWCv1PPExNynfikwGKhiv
         MXEt0dgmQ1sAOktW+4niEDh8HTnY43T2cepdVJL1v7+atSnoexSzs98yz40ZSeThDsYr
         hcbjqWHeBSWXMS1uURtgLlrKaQ0dN3V36yQpSeQQGbIzqapNOylA7gm3ah6LiqEaozAP
         RZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3WNMt5XR+692WIpXHZivWGdM4xBg7M/kL8/oPyqVZG4=;
        b=VwXNOfeo1zyVMcsv9uWE2c+y0vdmcRA7fjSLNBlvI3vIilHBaE4lvxsPdLfGoDyTtu
         NdwneHfkL1MPLc/HgTITwCnoGObJg6v0TD70+PEFVMno0A7kKtcPBseuOxO8qG13SUDa
         u9AGU28D8t5n5aP+VhsPr9xMsUr38OgXDXaCtWw7E7YDNGlzeSC6u5Xj1BJVvzc/NKAo
         dO00LAHTQxJ+cHReFU/Dx7euaD8GEhHjpbw+YCbYl1wZJRK/2SeLtv8ITx3OVxXaLaKE
         u+VEksh5sib18fa867KMHBir/WQrHXgzKxwRiCImZV2DTEj08bK1ssWPluk2Ki1MCa/b
         5RHg==
X-Gm-Message-State: AOAM5314hqlQTRsU5fgFNAxU5rQ0bKC0E+Dy1F02t70eEh2qe7djp6gm
        NArJWiKFz8xSOPi5REU3mX1prQ==
X-Google-Smtp-Source: ABdhPJyd9z/0E7cIiRh5X4uMlSbgcHzZSG/VIra3j3yOYbbXcYBEgVNzBzpdHejP7k0epZ2ItDg0Nw==
X-Received: by 2002:a17:902:b094:b029:e3:a2f:4681 with SMTP id p20-20020a170902b094b02900e30a2f4681mr1370874plr.69.1613104886229;
        Thu, 11 Feb 2021 20:41:26 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id h11sm7316176pfr.201.2021.02.11.20.41.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 20:41:25 -0800 (PST)
Date:   Fri, 12 Feb 2021 10:11:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH V7 1/3] kbuild: Add generic rule to apply fdtoverlay
Message-ID: <20210212044123.7i6kzgekoddqufko@vireshk-i7>
References: <cover.1612955268.git.viresh.kumar@linaro.org>
 <44dad578df8a848fc378cd358f03b071f44c9a5b.1612955268.git.viresh.kumar@linaro.org>
 <CAK7LNARa8GzhhvZWV_KAW=MC0DRcSsfPsQ-KTBRRpbBgBqY=ig@mail.gmail.com>
 <CAL_JsqKHUG6VvvpQ18YdzsOA_gZ59gFsc2tUzt1SxKHsO2A03g@mail.gmail.com>
 <CAK7LNAQH8hVwqGF+82j=38gi7VaixLhYS-K1uT1wdX4t07pJ6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQH8hVwqGF+82j=38gi7VaixLhYS-K1uT1wdX4t07pJ6Q@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 12-02-21, 12:07, Masahiro Yamada wrote:
> BTW, I do not know how to use overlay.
> Do we apply overlay in the build time?

Ideally it can be applied at both build time and runtime, but we
haven't allowed the runtime way until now in kernel. This patchset is
all about applying it at build time.

> If so, I do not know what the benefit of overlay is.
> Or is this just for build testing?

For now the main benefit of using them is that we can keep stuff in
separate files without including each other. For example a primary
board may or may not have an extension board connected to it.

Without overlays we will have this many dtbs for this simple case:
1. primary.dtb
2. extension.dtb
3. primary-includes-extension.dtb

With overlays we will have the first two. Now the same extension can
be applied to lots of boards and multiple extensions can be applied to
the same primary board. This just complicates the process of managing
dtbs.

> I just thought this was done in the boot time,
> for example, in U-Boot or something.

Yes, bootloader can do it as well.

-- 
viresh
