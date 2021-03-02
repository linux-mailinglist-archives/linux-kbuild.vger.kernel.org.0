Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8077732B307
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Mar 2021 04:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235151AbhCCB1T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Mar 2021 20:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbhCBEFb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Mar 2021 23:05:31 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A98EC06178C
        for <linux-kbuild@vger.kernel.org>; Mon,  1 Mar 2021 20:03:01 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id p5so11255851plo.4
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Mar 2021 20:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=we+6muhRQ5Jd0vJuVJtRUZjPyXgZhip/qNhUDmq8kc0=;
        b=wQGCMj/TOD3Jm9OJXIr7m4RyMOvhHQddHsfcM6T4whYeEHhi9G1+uhyGVrQ/Kt3Nl8
         HTdhniJp1r3v9sBfHQkOusHKxCK6T+njNkihr8H+1QfsxwZ2YUPyJWkpTz7Psx544+17
         swrWD/4gSaGkrJ0FZiWHSDav9IKf36FpgHeWyKXd8gVF2/u9cFHZInlIFeppnfaxzdoG
         HoApJp8+7xEsCPCBRe8jspYJrhK+LxC+RrQSor3ANW9X65SXdm9aPhVXmKdQk3K3tct+
         PouOyLpPbRvHISLErzzCjCJ4//rLjbkkgth1Ry2P/Oqcn8XBtSO7xhk5TBYssm0WBRx1
         uTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=we+6muhRQ5Jd0vJuVJtRUZjPyXgZhip/qNhUDmq8kc0=;
        b=bL1/boyHZNiBR1yryr1MTo9pzrP+fcacZbeoLNz0ZDmAIHnCKgiLRzmCPfUinM975b
         WiRIvrex0i5IUOGdp2wBzSyzbaRT+x4MAY3gl085NVPpUteuE0Q9DUvOjLQPvK0vxhKG
         lW70hwSPT3K6t5BpoxfwHa9rARa9FEPqOGLW7AabHgWIRhvXZhaQnhuO08Ata7lTNvHv
         eLqU8JdJuudL2KS6o3P3EHXKIcG3iZDE3uXTzwkmkxhc785mYhV8X3rFAixnNiCUtFb5
         cu6DicOK3SlGXhty1A+hrW95gk65UYfuoQY3W659pTgtGUcUPTnPb6S3ylnSM5praUrS
         AqtQ==
X-Gm-Message-State: AOAM533IgjXyUFZvmMV1aNf7rkdc8tJ3M8TUEfQkFvmFWKysJHda/IgP
        gAGuIHnPHFSZgQ/HIOk1u/KavA==
X-Google-Smtp-Source: ABdhPJxuKVFvecRI3AMDHLr8sIeRCXCONYFtOdEpMyByy8BgkYUlETcfUtt/vsF0h2jNvhowd6KriA==
X-Received: by 2002:a17:90b:3551:: with SMTP id lt17mr2270466pjb.89.1614657780744;
        Mon, 01 Mar 2021 20:03:00 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id z8sm1058557pjd.0.2021.03.01.20.02.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 20:03:00 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:32:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V8 0/4] dt: Add fdtoverlay rule and statically build
 unittest
Message-ID: <20210302040258.erg6mn4ykxvxhnqm@vireshk-i7>
References: <cover.1613127681.git.viresh.kumar@linaro.org>
 <20210301065625.rgo2xvr7ol2vycyf@vireshk-i7>
 <31cbc900-fad2-4838-21d2-7204f1029a81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31cbc900-fad2-4838-21d2-7204f1029a81@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 01-03-21, 21:14, Frank Rowand wrote:
> Hi Viresh,
> 
> On 3/1/21 12:56 AM, Viresh Kumar wrote:
> > On 12-02-21, 16:48, Viresh Kumar wrote:
> >> Hi,
> >>
> >> This patchset adds a generic rule for applying overlays using fdtoverlay
> >> tool and then updates unittests to get built statically using the same.
> >>
> >> V7->V8:
> >> - Patch 1 is new.
> >> - Platforms need to use dtb-y += foo.dtb instead of overlay-y +=
> >>   foo.dtb.
> >> - Use multi_depend instead of .SECONDEXPANSION.
> >> - Use dtb-y for unittest instead of overlay-y.
> >> - Rename the commented dtb filess in unittest Makefile as .dtbo.
> >> - Improved Makefile code (I am learning a lot every day :)
> > 
> > Ping!
> > 
> 
> Please respin on 5.12-rc1, and pull in the change you said
> you would make in response to my post v8 comment about the
> v7 patches.

Yes, I will do that.

I must have been more explicit about the Ping I believe. It was
more for Masahiro and Rob to see if the kbuild stuff (which is
relatively new) makes sense or not before I respin this..

-- 
viresh
