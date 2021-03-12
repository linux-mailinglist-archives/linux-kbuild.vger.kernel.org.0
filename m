Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851A33384AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 05:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhCLEbs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 23:31:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbhCLEbN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 23:31:13 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB5AC061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 20:31:13 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id y67so1014134pfb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 20:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+0fxl1GUBIYvkb1H9esSXGy99Oerip7BsfpprSNg5Qo=;
        b=MbUF26Dyag1BvcEag2jaCWzL8pKPt8ngXMDgi+IdCeASiIYHEBFT/vKySRQaO8Fyre
         n++8NIu3n9lI3kXM2IIPJNjpt5yjH/n09JQZF1JtP7WasB179CU+twTTmQsgPQROhJu8
         Q72d6owsPbXYyRY2NaKkw0D1szhfHYsnsoo0f0USh2X720eV9+XYP4WVFa5NMEbrv78N
         sTqVR2ZNXr31WIY8mHnfo22+X9fhtURFeKICZHtxTOD9isFAHkOuTE8hDCTs3nTNoqXW
         RBrQo01NogXnwz63DeLtdoecb2H1sIHsSXec4EavczroxsjR+70AlIZwfhh47CoeVH3y
         1PIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+0fxl1GUBIYvkb1H9esSXGy99Oerip7BsfpprSNg5Qo=;
        b=qH3N/GRU8k6V6Rc4pJrr8VbAKwkWKGqRaWWCTTag9vP9Oe8hQafE8gF6nEoiwLfmt7
         BFbvtBcI/xYaaWTN7coUMMD6cj7wA2Alviheqpe01pOeU8ncSz3jFZHaHcRc6JZz1eY9
         j6fLKYMIf8p56bXQFh0edB3CpSDLhSebFrO1F/oblOTJFS9en4l2dtAEr9yy5nVSHRZw
         l0a61cARlWqErH3RZ1ZfvFTiqdyc/My5pI68EJgaTScAhuB2dgR+qCntb056AId1eUIy
         6GYNUXHgfH4a68/nIsgomn+WA315qQxIz7LJGxrqXPmFliXHc9wTr1rRKkPSSaeFd2Id
         oFfw==
X-Gm-Message-State: AOAM532qRn3D3ZnVdlxzF1EDvjO1toUO5ACuQ+MB511Yymj5cj/RUVrO
        T5UMrJ+bO3bN3BuoeYQnlru65A==
X-Google-Smtp-Source: ABdhPJycj2Yx3JFFGjbXofNl4coJ6nRKpFM7PXsBffwm8Dks/f6u+dhUobPD6Ps3jWi5gcxA9WiEQQ==
X-Received: by 2002:a63:504f:: with SMTP id q15mr10280208pgl.290.1615523472771;
        Thu, 11 Mar 2021 20:31:12 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id w188sm3856245pfw.177.2021.03.11.20.31.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 20:31:12 -0800 (PST)
Date:   Fri, 12 Mar 2021 10:01:10 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V11 0/5] dt: Add fdtoverlay rule and statically build
 unittest
Message-ID: <20210312043110.hirx52ibepfrvvij@vireshk-i7>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <7211f09e-092b-d928-0c69-e2dcd1fc7c1e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7211f09e-092b-d928-0c69-e2dcd1fc7c1e@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11-03-21, 17:27, Frank Rowand wrote:
> On 3/9/21 11:35 PM, Viresh Kumar wrote:
> > Viresh Kumar (4):
> >   kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
> >   kbuild: Allow .dtso format for overlay source files
> >   of: unittest: Create overlay_common.dtsi and testcases_common.dtsi
> >   of: unittest: Statically apply overlays using fdtoverlay
> > 
> >  drivers/of/unittest-data/Makefile             | 48 ++++++++++
> >  drivers/of/unittest-data/overlay_base.dts     | 90 +-----------------
> >  drivers/of/unittest-data/overlay_common.dtsi  | 91 +++++++++++++++++++
> >  drivers/of/unittest-data/static_base_1.dts    |  4 +
> >  drivers/of/unittest-data/static_base_2.dts    |  4 +
> >  drivers/of/unittest-data/testcases.dts        | 23 ++---
> >  .../of/unittest-data/testcases_common.dtsi    | 19 ++++
> >  .../of/unittest-data/tests-interrupts.dtsi    | 11 +--
> >  scripts/Makefile.lib                          | 40 ++++++--
> >  9 files changed, 218 insertions(+), 112 deletions(-)
> >  create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
> >  create mode 100644 drivers/of/unittest-data/static_base_1.dts
> >  create mode 100644 drivers/of/unittest-data/static_base_2.dts
> >  create mode 100644 drivers/of/unittest-data/testcases_common.dtsi
> > 
> > 
> > base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
> > 
> 
> Does not apply to 5.12-rc2

I was based right over the 5.12-rc2 tag.

> because of a dependency on a patch to
> scripts/Makefile.lib.  That patch has been merged by Linus
> somewhere between -rc2 and -rc3.

git log --oneline v5.12-rc2..origin/master -- scripts/Makefile.lib

gives no results to me.

> I had a working version
> between -rc2 and -rc3 at commit e6f197677b2e

I have tried both Linus' tree and linux-next, and I don't see this
commit.

> that does have
> the required patch, so that is the version I used to test
> this series.
> 
> There is still confusion caused by the contortions that unittest
> goes through to mis-use base DTBs vs overlay DTBs, so _after_
> this series is merged by Rob, I will poke around and see if
> I can change unittest so that it does not look like it is
> mis-using DTBs and overlay DTBs.
> 
> 
> Reviewed-by: Frank Rowand <frank.rowand@sony.com>
> Tested-by: Frank Rowand <frank.rowand@sony.com>

Thanks.

-- 
viresh
