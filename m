Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55B084A7AB8
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Feb 2022 23:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347748AbiBBWCw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Feb 2022 17:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347729AbiBBWCv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Feb 2022 17:02:51 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FF5C061714
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Feb 2022 14:02:51 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d1so432336plh.10
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Feb 2022 14:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ECaOy1T2k4+rTCdYBSi87MWLS+gUoT2Ik7Zjco3xvDE=;
        b=OEMBwPrvQNPtg00fqc58e+O7P+ks/6XVgwHTnL4WGfVFPWsXrZ60raAX5RLwekwDjI
         ZaN4hs9hqL64qKDcH1iqR6kyK1tjPr/755d0v/BUj3Hmt7WHxlowHaIhfGumew3ENKXW
         tW2/pYjZPh/28hmP12Tyd0CLDdAXLGDyX2Fyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ECaOy1T2k4+rTCdYBSi87MWLS+gUoT2Ik7Zjco3xvDE=;
        b=VrLlw5OJzJ0e2m43UvHJLzj+ns2nDWYbFhdVpkHcvn+S0d/0CDg5XZipE7VjXyg0WA
         IY/xvD9nfPZYGi46D0NbZVigCtr8ojDm5LySXRTZLweJ6OUfWDB2H6gRCHWm9a61KU2o
         xKqUI+vo4T/KEZab3so+QArzGjbWZMJziX4V90qoUT4D58ODJkMUuGWgrdSRDVKaNCc0
         lQ/sb6iIQ1THl5OpPCdFgrYj2DQ2Ms1Hn6aioszZFYgbNvwSXbHhi3/afXzwNMJEHzic
         kxA8FTaqVovKh11Gllm2tdXuDiNGsqDhQpoL4iHRJVVrzxklX7R47qVxxnzFch7yBAQS
         YN8A==
X-Gm-Message-State: AOAM533Y87d+dUjEdVdo5WNGElNAKYaY5j7lp/b3V442i2icjRU6w7P8
        5I2FF5UmS25VXJMWFoPkIXFXwQ==
X-Google-Smtp-Source: ABdhPJzNmSeKdn9TfTjv7P+ZuQp13MUOT0sY08UE2HypvMu3QGzZpnSBshzGXR/ynD7EMIbzNUbq3w==
X-Received: by 2002:a17:903:183:: with SMTP id z3mr33174467plg.127.1643839370759;
        Wed, 02 Feb 2022 14:02:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a13sm27967620pfv.97.2022.02.02.14.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 14:02:50 -0800 (PST)
Date:   Wed, 2 Feb 2022 14:02:49 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 4/5] Makefile: Enable -Warray-bounds
Message-ID: <202202021320.ED0050E32@keescook>
References: <20210818081118.1667663-1-keescook@chromium.org>
 <20210818081118.1667663-5-keescook@chromium.org>
 <20220202160903.GA2337834@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202160903.GA2337834@roeck-us.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 02, 2022 at 08:09:03AM -0800, Guenter Roeck wrote:
> On Wed, Aug 18, 2021 at 01:11:17AM -0700, Kees Cook wrote:
> > With the recent fixes for flexible arrays and expanded FORTIFY_SOURCE
> > coverage, it is now possible to enable -Warray-bounds. Since both
> > GCC and Clang include -Warray-bounds in -Wall, we just need to stop
> > disabling it.
> > 
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Co-developed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  Makefile | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index a4aca01a4835..af22b83cede7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1072,7 +1072,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
> >  
> >  # We'll want to enable this eventually, but it's not going away for 5.7 at least
> >  KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
> > -KBUILD_CFLAGS += -Wno-array-bounds
> >  KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
> >  
> >  # Another good warning that we'll want to enable eventually
> 
> alpha:defconfig:
> 
> In function '__memset',
>     inlined from '__bad_pagetable' at arch/alpha/mm/init.c:79:2:
> ./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>    37 |                         return __builtin_memset(s, c, n);
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
> In function '__memset',
>     inlined from '__bad_page' at arch/alpha/mm/init.c:86:2:
> ./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>    37 |                         return __builtin_memset(s, c, n);
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
> In function '__memset',
>     inlined from 'paging_init' at arch/alpha/mm/init.c:256:2:
> ./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>    37 |                         return __builtin_memset(s, c, n);

Ugh, these all appear to be the same "gcc thinks a literal is an offset
from NULL" problem Arnd described:

https://lore.kernel.org/linux-hardening/CAK8P3a1CT+-3J7Ufv9TQwRiV4i_+FF=-+phwSjWafyGuPfG+AA@mail.gmail.com

What's annoying is that these values, if stored in a variable, aren't
treated that way:
https://pastebin.ubuntu.com/p/ZjZR2tzRpx/

I guess having a common way to convert from an integer (or literal) into
a void * that GCC doesn't freak out about would be generally nice.

-Kees

-- 
Kees Cook
