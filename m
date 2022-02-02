Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40A14A7AE0
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Feb 2022 23:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347820AbiBBWMR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Feb 2022 17:12:17 -0500
Received: from mail-pg1-f172.google.com ([209.85.215.172]:40550 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238337AbiBBWMQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Feb 2022 17:12:16 -0500
Received: by mail-pg1-f172.google.com with SMTP id q132so637110pgq.7
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Feb 2022 14:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IN96kNo2GoNx6nkpd6g9ql6wx8bZFK4D4L/u8xLTqHk=;
        b=ej/qevWE55BwyYZAXm1T0tW77I6BR+pgBZLQqwDsccA6kqiKb7YAvfuUfaQyWsL1Ai
         /T4UVWIC54A24aTN/Xx4DHVPRbe7+orJaGeZRp/7flklRyCiklGorONYLFy9aDc0+15+
         Y5A2LZpA/DQBFe6DDcKyQywjhl55JM5GgfkDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IN96kNo2GoNx6nkpd6g9ql6wx8bZFK4D4L/u8xLTqHk=;
        b=MUAnxrbUc5P9jqv5ch0qjpoGvM0TfyhnijANWt/h+JLsiKQNx1Caevfc8eQ+Gz/IT0
         nqIyXGEeffTSC5wOKNVEQ7LSfeXecZUBKWD7tf9NWlFyfQYafqEOUYkEt2F2bU/m7uKl
         hwS6WR8/R+efi2hKAEaaBYTPFFSQZsHg5Y0ro0TxxCZa6867rVJSf+cZ7wKie1wPoQms
         8eJAhuNuywHmnD0HzeNdmro8GSeKjL5Jff4IvrvXaJ8I4mlS69fL0izQ76rVe8FpC0Do
         gNwDNka0vTakEs3L0AT34s7Zkgoie8BQbbaqM+Ne3ALS9v68pJNXtwBz/I+dFBuLxYlx
         VQkA==
X-Gm-Message-State: AOAM530SoLTzBtkzL8jP+IH6jWrtXj7sddVuBUwG1fzyoCiDmtpK+VBo
        2YXmhgb7KUWK+igHMGiuFOQfAQ==
X-Google-Smtp-Source: ABdhPJwlVFChYEmq5VaZf5imvLjciEamNSjwDq0IsZQ+oI4+zA9/JblaMbVaWQmXiL7zU9bTnDK2/g==
X-Received: by 2002:a63:5242:: with SMTP id s2mr25560468pgl.435.1643839876557;
        Wed, 02 Feb 2022 14:11:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c17sm28402108pfv.68.2022.02.02.14.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 14:11:16 -0800 (PST)
Date:   Wed, 2 Feb 2022 14:11:15 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 4/5] Makefile: Enable -Warray-bounds
Message-ID: <202202021409.2AA6A4246@keescook>
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

Ah! With Arnd and Nathan's help, I saw:
https://lore.kernel.org/all/20210912160149.2227137-3-linux@roeck-us.net/
which is solving the same problem (just manifested through different
diagnostics). The same solution works here. I'll get the patches sent...

-- 
Kees Cook
