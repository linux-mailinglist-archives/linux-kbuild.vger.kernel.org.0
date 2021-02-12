Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDD9319BF2
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 10:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhBLJhH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Feb 2021 04:37:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhBLJhE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Feb 2021 04:37:04 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0123BC0613D6
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Feb 2021 01:36:23 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id z6so7069439wrq.10
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Feb 2021 01:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xV/X6S3BgTkmgChLtbDzueTb5OHb5qAxSGvZ5rKEbzM=;
        b=dnxVihN33cILJyM5Xtr0YeXxkdAQNGbBts7uYXFbgl0w14+LYLh5Ks6/89S7pROHVk
         pQiImshTjs5C12HuMu3vSgPt92W+I9zh3HMXAsEK44t5OqssK+znxN7hFQLz6ya6B/p8
         gLoR5bdXQ5vM+siyeK8O3QvpI8z1LTUOLMR9P2qYmPMIaUhZzK2CFp06J/VSC5mRPbIj
         ssFzXxElD6vS0ya6jDM5wv0ImvkG5tktHMXgbCcPcfK9Z6sf3KhAvEd+nm/CvyxaQM67
         eJQ3Y/ESW7KZdn5WbLpNA55Zxk8XjILhfPqhRLSH73ITXhLvp0oL848E8sPOAXEEjZ9X
         jxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xV/X6S3BgTkmgChLtbDzueTb5OHb5qAxSGvZ5rKEbzM=;
        b=Y2wE77Nsb8T09TMoR/pEOiwUj5EDYK5V2j8tspKbMfHcrCmLRojXSI7wdtzu36Iref
         a8sGfrDhr7VL/hgzZfQWiV3STeRj3RT/O9qjoDxXNV44XI5faeJUnuTy0z9aOW25lRXs
         2dPkBWySvfeAGVjq8WVaY5vSNFZyQW0nRR7U2/JkLDjt4OGqYMjwSbTa8tfr86XgsQqt
         zoSF9UgoRL3kIglEsZ1XkCABOi2LWzAo874hexUYQOOHm3r89G7Rly7X1+sXOW01L57a
         uEdTdgY6COxpwEehrXrPrQtvgaqiHqtkydU7rYDbvogJNleDDVA0Yf9nvtKIJ0WHlMr5
         7LwQ==
X-Gm-Message-State: AOAM532J8GfCMbGG941iZT/ZMu0EjxF2jdqfmbPVvOc20HnmhbtRuJkd
        6OGWbCG34ghSleETRfx7AuZwHA==
X-Google-Smtp-Source: ABdhPJxRZvbuMTHcgUIRA9pj2/JU5VnXZlBZVxaDHsSy9ohAmkujYELYahSSTt0hdmU4gMAfHMJrug==
X-Received: by 2002:adf:f648:: with SMTP id x8mr2316877wrp.34.1613122582683;
        Fri, 12 Feb 2021 01:36:22 -0800 (PST)
Received: from dell ([91.110.221.187])
        by smtp.gmail.com with ESMTPSA id t198sm3875628wmt.7.2021.02.12.01.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 01:36:21 -0800 (PST)
Date:   Fri, 12 Feb 2021 09:36:20 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, arnd@kernel.org
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 08/21] clk: clkdev: Ignore suggestion to use gnu_printf()
 as it's not appropriate here
Message-ID: <20210212093620.GG4572@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-9-lee.jones@linaro.org>
 <161307142704.1254594.1986201109191269158@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161307142704.1254594.1986201109191269158@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 11 Feb 2021, Stephen Boyd wrote:

> Quoting Lee Jones (2021-01-26 04:45:27)
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/clk/clkdev.c: In function ‘vclkdev_alloc’:
> >  drivers/clk/clkdev.c:173:3: warning: function ‘vclkdev_alloc’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
> > 
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/clk/clkdev.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> > index 0f2e3fcf0f19f..5e5f25d568724 100644
> > --- a/drivers/clk/clkdev.c
> > +++ b/drivers/clk/clkdev.c
> > @@ -153,6 +153,11 @@ struct clk_lookup_alloc {
> >         char    con_id[MAX_CON_ID];
> >  };
> >  
> > +#pragma GCC diagnostic push
> > +#ifndef __clang__
> > +#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
> > +#endif
> 
> Can this be some macro banished to compiler.h?

This is probably a question for Arnd.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
