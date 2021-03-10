Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FF533380A
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 10:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhCJJAE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 04:00:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhCJI7l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 03:59:41 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B702CC061760
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Mar 2021 00:59:40 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so10468612wml.2
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Mar 2021 00:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Numor//xklH37BH1apB8OWJTxrcnrW9V5SsOFLfaiS0=;
        b=C/ZuH1eryK9mb4HJf+c0Jss6Nk4Cr32zDnRnQsHusqPeZq/00fhMxgUI8gNpfMjMeR
         XxQ6aG5htj73IvULLG3i92OuMLnO8y33KUnGcAT9tVG+g94WWWdjnH/aK7X1rfmxjBg+
         g9M/hWFhKlR5MJUafzxQAe//C3+P8car6lQk/6gWhx86fAY4vQq+OFlPfUsxbdarrwrO
         n7RUfeDA0E3sPwu0pi4Po6KOEr95nbZzll8VvcN7SX/EFrbwkAHmFwLfZAilAkBBgMv4
         JvMn0PalYHRjVVDBPENIjvoDsabqGE8KZhuXzhIdNhKAnvDyiSfvOP1TFpnRvrcV8cDZ
         Jksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Numor//xklH37BH1apB8OWJTxrcnrW9V5SsOFLfaiS0=;
        b=Kg2/hyBQuTvV/HjKUJlUlI7xlzYh8a8CeraG6w0L7MtPr1gAfpZstflJWTXXYFixI8
         QWf7ohxbDQnO2eEtp9GiJSIlNz3GU6CNA5zycuH+y7ABb/aVZ5Sh35Bj2lXIOFp4RFIj
         pEqJphihC5iszsKPAdBhR3yGHRhYyp98EdobgFgrOcoZB3ds5pDqK1BOq8Njcvrl5Pfp
         umMccBcxh4wy/ckIE+EIw2X+3ODzCAqyf2Cr9VQlF0IUR4UPCB//JlrIRhkV60+u1Of9
         jkXrhv8xnjELsGbGmQF7EPQV4Ng53KsDtQ21Ov8MJypGIqsO+JZjtqeeqHxm9s7fAXdZ
         rqlQ==
X-Gm-Message-State: AOAM532/FWM/+uazweu7UoDFr90FcxtjGIi4QWta7QRxLQ6RY7Nw/2pz
        X1NEEiura8YkfKPX+p+4Dn9JZA==
X-Google-Smtp-Source: ABdhPJxcuOIPUhMTUvr75q0rGDKEEBQHgxwWTHrS1arnd6JQKcQs+QGdoqcE3fNdGGMvy9ZGv+qnnQ==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr2219008wmc.161.1615366779478;
        Wed, 10 Mar 2021 00:59:39 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id h20sm7942228wmm.19.2021.03.10.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 00:59:38 -0800 (PST)
Date:   Wed, 10 Mar 2021 08:59:37 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, arnd@kernel.org
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 08/21] clk: clkdev: Ignore suggestion to use gnu_printf()
 as it's not appropriate here
Message-ID: <20210310085937.GF4931@dell>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-9-lee.jones@linaro.org>
 <161307142704.1254594.1986201109191269158@swboyd.mtv.corp.google.com>
 <20210212093620.GG4572@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210212093620.GG4572@dell>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 12 Feb 2021, Lee Jones wrote:

> On Thu, 11 Feb 2021, Stephen Boyd wrote:
> 
> > Quoting Lee Jones (2021-01-26 04:45:27)
> > > Fixes the following W=1 kernel build warning(s):
> > > 
> > >  drivers/clk/clkdev.c: In function ‘vclkdev_alloc’:
> > >  drivers/clk/clkdev.c:173:3: warning: function ‘vclkdev_alloc’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
> > > 
> > > Cc: Russell King <linux@armlinux.org.uk>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/clk/clkdev.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> > > index 0f2e3fcf0f19f..5e5f25d568724 100644
> > > --- a/drivers/clk/clkdev.c
> > > +++ b/drivers/clk/clkdev.c
> > > @@ -153,6 +153,11 @@ struct clk_lookup_alloc {
> > >         char    con_id[MAX_CON_ID];
> > >  };
> > >  
> > > +#pragma GCC diagnostic push
> > > +#ifndef __clang__
> > > +#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
> > > +#endif
> > 
> > Can this be some macro banished to compiler.h?
> 
> This is probably a question for Arnd.

UPDATE: Arnd and I are working on a solution for this.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
