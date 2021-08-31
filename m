Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3493FC1F8
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 06:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbhHaEc0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 00:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhHaEc0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 00:32:26 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E154BC061575;
        Mon, 30 Aug 2021 21:31:31 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id t1-20020a4a54010000b02902638ef0f883so5276695ooa.11;
        Mon, 30 Aug 2021 21:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A6HQ5o35slS4lhDe1JWfagZktmq0c6Dz9wk6hg5BiZ0=;
        b=S1AT3uix9kpP6lB0S/AAIu1rvL8W7u0CXpTo6AT1UAQvTFF1eZc32VFa6EThibHYMM
         6bxwJykeKBQDzyzpIqOX5P3nPXHvLkvfOaCzCBslH9t3JTD63iFXU1LVGCWFjGWRseRi
         URyPTKZ+RVxB6+pVOZeRONNjUgJEQo34Lv8InAYOBLuDygU02WQxeyiFHrRMG/4GlBso
         ACx+Z3eAlRSIRMrPWRHAgr4Unbz49YuIzEmlqPcF2WZhfUWryB7NhEPY6YW4s8MFRC+M
         G48O4qcXi+/LAI/iQ9kbl5Fc/w3B2ouvRhuE30b2IwAcij9JYWDbcxrdmWoB9vXf9e30
         aM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=A6HQ5o35slS4lhDe1JWfagZktmq0c6Dz9wk6hg5BiZ0=;
        b=s3Bf05eqeavQEYvj/ZyhRB/F8tWj1VpoLF14jSA9qUboeHfHt8G/RdHk+83rUDhYSr
         +riNp3VssyoMdjkwgbqgB6SYwhCTLOV5vO9mr8eq/8j8d/IwBfMcycoJAAC4ICrZsn+3
         cZa5tmKGK5NXG9LJ+ajE3UrliSCbWmWcq4ILZZ0v/491+qyuOZQwiz0G6fpLKdF+QkC1
         8TV0FySZHo+nF+n8lVrendZS+GH/uxmjqQBxtMlzmQXSOxj+Fgma48+xXn7jSZO7eNYX
         +RuRtoaDKrc2wVs4F+B0eSOtmFYlgx1HgGfsfvi8fsGv/6W8Q9GDI/v5KIRevk+g7TfA
         HxcQ==
X-Gm-Message-State: AOAM533r0Yui3oxZ41hV8xPES4wJ4+PGfdXi5aEsSVWozvLknrYXw9dT
        L9mm+5HW8HCGd6wTHzeFd08=
X-Google-Smtp-Source: ABdhPJyP9AtFH1rrxT5VVjkGLMvAaFpQAPIBUMRYGg3DXcozOJRYMD4kLYHG4asggjdWIJDcdAgUGg==
X-Received: by 2002:a4a:8d97:: with SMTP id i23mr12726731ook.4.1630384291086;
        Mon, 30 Aug 2021 21:31:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y11sm3634270otg.58.2021.08.30.21.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 21:31:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 30 Aug 2021 21:31:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Keith Packard <keithp@keithp.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 4/5] Makefile: Enable -Warray-bounds
Message-ID: <20210831043128.GA2749311@roeck-us.net>
References: <20210827163015.3141722-1-keescook@chromium.org>
 <20210827163015.3141722-5-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827163015.3141722-5-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 27, 2021 at 09:30:14AM -0700, Kees Cook wrote:
> With the recent fixes for flexible arrays and expanded FORTIFY_SOURCE
> coverage, it is now possible to enable -Warray-bounds. Since both
> GCC and Clang include -Warray-bounds in -Wall, we just need to stop
> disabling it.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Co-developed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index e4f5895badb5..8e7e73a642e2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -995,7 +995,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
>  
>  # We'll want to enable this eventually, but it's not going away for 5.7 at least
>  KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
> -KBUILD_CFLAGS += $(call cc-disable-warning, array-bounds)
>  KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
>  

This patch causes 'alpha' builds to fail when trying to build an image with
gcc 11.2.

In file included from include/linux/string.h:20,
                 from include/linux/bitmap.h:11,
                 from include/linux/cpumask.h:12,
                 from include/linux/smp.h:13,
                 from include/linux/lockdep.h:14,
                 from include/linux/spinlock.h:63,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from include/linux/mm.h:10,
                 from include/linux/pagemap.h:8,
                 from arch/alpha/mm/init.c:10:
In function '__memset',
    inlined from '__bad_pagetable' at arch/alpha/mm/init.c:79:2:
arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
   37 |                         return __builtin_memset(s, c, n);
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
In function '__memset',
    inlined from '__bad_page' at arch/alpha/mm/init.c:86:2:
arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
   37 |                         return __builtin_memset(s, c, n);
      |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
In function '__memset',
    inlined from 'paging_init' at arch/alpha/mm/init.c:256:2:
arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
   37 |                         return __builtin_memset(s, c, n);

Seen in next-20210830.

Guenter
