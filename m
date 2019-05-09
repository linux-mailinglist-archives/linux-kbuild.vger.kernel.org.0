Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65BD4188CC
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 13:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbfEILQI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 07:16:08 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:32854 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfEILQI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 07:16:08 -0400
Received: by mail-ed1-f68.google.com with SMTP id n17so1696292edb.0;
        Thu, 09 May 2019 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UPaMTbGBAsT6MAj85/KAQ3pnNP8+Ywa1sYLkG9tRh0U=;
        b=e36NmfKK1Q+xKcssJu2+wuDvqREJs+LTcpqhc5ZXD/AQfJgp6t6RPRp/WjzCJXXy85
         NAnqOk2ghTeL2UXgyDUDLfgMYUXqhsMq6zBYmAioMjvJD8piWz9ZBi+d4wHRdohVUEmO
         OHvJ7Fz9hIYbGgMjdHIh9mER2vSOG6afXNt3brvI6eHmYncfhjJWnEpskicLA2UbgoYO
         Ut3izz6iShPzGCYwyMCbv47wGeGeumRl6ZNklzYOBg7jbZAw1Tvsl/+EUtBB/zHR+wjC
         YmfqWfyJty9nEUCwL/C49/QCFdQB50ryizN3T++q5YuKlm8xVmDW7QjUaHKA7CoCol6p
         eMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UPaMTbGBAsT6MAj85/KAQ3pnNP8+Ywa1sYLkG9tRh0U=;
        b=I4QwM0BFLan4GzLGu+18WjXn/kHapA8HOrDxHbWl0+hg6eAgD0wy+rtaY15h2gwAYR
         3QGsV7tNuffXk7bM9lYdr9E/tGtWF0oVPtkmf47p5jfkw6U+JnK1BCK78GunoOFR7Ss4
         LPwp3bFqKIQjGo2ysNcdLveWUj2Q4ysN6qpQ2ECO3tcJFgeL0FylLLLiBrKB/T6sRFl9
         OboK6Z8ngbEy38llh+MmOGlU5mrGpicz19VY0cCJnDGu8H/J4l+D43jAGbOdrRufkkcX
         0Uqt0tXp11fmOyKIlpreaS/WjCm96wyFwqxVvGJIL1NqMDJ/sj0s+BNZYfjdD/+SAZZW
         ZGkA==
X-Gm-Message-State: APjAAAWqn7jSbd0hSGGot+ASMes9+baX+An6gsllhnWUh77rdxOJa55v
        RXbRpURV/AXcp1VY7lvIsk8=
X-Google-Smtp-Source: APXvYqyH9OVEhU+BQuPcbC2fejiDP/0nb5aAezZRgD2ecLWGLiSbNJrDSag0NFD79lK3+kQIskrajg==
X-Received: by 2002:a17:906:7d43:: with SMTP id l3mr2700308ejp.81.1557400566396;
        Thu, 09 May 2019 04:16:06 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id p1sm276507ejf.40.2019.05.09.04.16.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 09 May 2019 04:16:05 -0700 (PDT)
Date:   Thu, 9 May 2019 04:16:03 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux@googlegroups.com,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
Message-ID: <20190509111603.GB32696@archlinux-i9>
References: <20190509064549.1302-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509064549.1302-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 09, 2019 at 03:45:49PM +0900, Masahiro Yamada wrote:
> This flag is documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option switch.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index c71ffb6f55b5..3f5e8a0f4561 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -841,7 +841,7 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  KBUILD_CFLAGS += -Wdeclaration-after-statement
>  
>  # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
> -KBUILD_CFLAGS += $(call cc-option,-Wvla)
> +KBUILD_CFLAGS += -Wvla
>  
>  # disable pointer signed / unsigned warnings in gcc 4.0
>  KBUILD_CFLAGS += -Wno-pointer-sign
> -- 
> 2.17.1
> 
