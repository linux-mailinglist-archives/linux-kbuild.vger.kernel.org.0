Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0AB3107D8
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 10:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhBEJ22 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 04:28:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbhBEJZw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 04:25:52 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E4BC0617AA
        for <linux-kbuild@vger.kernel.org>; Fri,  5 Feb 2021 01:25:10 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id u11so3234460plg.13
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Feb 2021 01:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s43rqcddTJ2FeEIu7EODes4JBPptootjcXSiKSYA+pM=;
        b=nKGabKVcenfJ68yBGA4Cc1EN4/QAYBP1kedi7EXt1QRkZDCnBMYkya7hIRNrT8vu4y
         6z2Tk4LrWTYqOQ1StYLP0NWwJDlx85r+FMLu7oLT5AqrmYIzrl16EolcnA6/wBM3qc19
         4EUXCz22M7XJeLIgUgJvDoZc/jMrm49M5u3YYQskhWxBegoWFG0cZiYyEjxmMbhFX+co
         pYzejteh+Coolv2koO0iFHp1PcpbEsMNj+yc2nkpxtvEAM1SbyR+TjpGdLek60Dg7TKy
         /AGB+2Na4B7b6vqtN0WPukvqwUSz3IQaafy9ZA4o4QzlzAzG78qK19HJWa24rjkoAE0w
         VoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s43rqcddTJ2FeEIu7EODes4JBPptootjcXSiKSYA+pM=;
        b=fGWVWhaf8nF+ZgrfLZogFw97Llf77q2EmlAgHvoOkt7ybsVZPhHgALwLlgP2ZRDV88
         502J5Wye02xO7eqM+LQHbY3ncw7Sh5cnmxG4J1m9Hm33pMc1ZCvojMw0bD6LjgE/zmWy
         HRSsFsv/4zRSAgslqaxfaPU09JlHWItgyURlV3gdfGMFoaOu1DPKVT7qWmpKrzxpfBzE
         0kFLS2Aa4sByJ0i1HJZsdNUlY2sOMe8Zxpt6p2wwUiHBt1PIggOQKLQxiUVIdf+r3x1F
         tsJeDsP0jU95c+0wZfVoksVf8+03sagGUd1wOmkYKuFsB3LlV8RQ3Jd++AI1hcrLsi8W
         OAGg==
X-Gm-Message-State: AOAM533RvF95dgjRePu/Bc4GmiY8x9wk0FXT6wNxLGBdLAHuTDUKbx6p
        a3qG0oGAlkIqh5Aoceo7igus1Q==
X-Google-Smtp-Source: ABdhPJwfTj6udKE++Vdr5D1T2JL/RACP9w/++Lia17Nb/xJ1InWWnOvdZVtkzaWin1IaH1TkWgonlg==
X-Received: by 2002:a17:90a:470b:: with SMTP id h11mr3314883pjg.186.1612517109869;
        Fri, 05 Feb 2021 01:25:09 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id 141sm8685022pfa.65.2021.02.05.01.25.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2021 01:25:09 -0800 (PST)
Date:   Fri, 5 Feb 2021 14:55:07 +0530
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
Message-ID: <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
References: <cover.1611904394.git.viresh.kumar@linaro.org>
 <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 05-02-21, 10:02, Geert Uytterhoeven wrote:
> Hi Viresh,
> 
> Thanks for your patch
> (which I only noticed because it appeared in dt-rh/for-next ;-)
> 
> On Fri, Jan 29, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > Add support for building DT overlays (%.dtbo). The overlay's source file
> > will have the usual extension, i.e. .dts, though the blob will have
> 
> Why use .dts and not .dtso for overlays?
> Because you originally (until v5) had a single rule for building .dtb
> and .dtbo files?

I am fine with doing that as well if Rob and David agree to it. Rob
did suggest that at one point but we didn't do much about it later on
for some reason.

FWIW, this will also require a change in the DTC compiler.

-- 
viresh
