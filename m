Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305088F5E8
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2019 22:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730834AbfHOUpe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Aug 2019 16:45:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45691 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728728AbfHOUpe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 16:45:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id q12so3338009wrj.12;
        Thu, 15 Aug 2019 13:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yBHfcOCLhEZEgiS1wNnrpED7tumOdTFuVcM72sYIykA=;
        b=RLXGMztPpA27QQt0Q1aeQLsC2QSLynuTBnC46mtrUOVcDbubxFFJaS2iYvqLtRMWiS
         4cqII7dIyKXAT4f8DmCedVI8RTT6E40oSqZu+w9+f5Up0zMTr7jBFpq8i8o4dyzjKTNH
         XxQYQbBrXCKR4O4LG5GOfwJRjZXJITY4QrGAj3mchxTC8dDPX3DGoVP5T5dXzcEqC1nw
         1BtKsrH8M/5cth9BIiWdjmEHUXCbF46DTlu7ltmVkXsS2cUBn+aAwCBIlrJhh9ngvB/U
         Ekgb1RpxcU5CXM0qtfwkkj0g5SZyfT2pO8C+swgPPhCqflruLYmQsDo0bT6tEEJc+woF
         cNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yBHfcOCLhEZEgiS1wNnrpED7tumOdTFuVcM72sYIykA=;
        b=Qz1xd04RARBXoosh3/VMyA5X+uf9xMmrYomg7oWx2ML6NTdSxxwNhN6Fx9D9NewoHy
         M+v5M9cwJbqEKvb0eEWPgWX+b7QcTZuhM+ILksrTBo9921btdRtNZdXejFdBMp87VC9R
         I9s4y+LaOsB9v1JI9KsKbJNXOwUVpuXXFq0AgSPvvDmEXYZwjpEBVoNjqp/YfQVfOYwM
         8Of9sUBlk2dNN1FYnamJA1OtInQOoWb3xKLVLZcRPyNBERc4GvC24B/IP2FhPVmLH/LT
         UqGgGqcZTtEbSyGsaxZ2gJy+4nr3Xag7KSE0myPLJ1l2Ol5Mh8by1o2AX3ffgsF4w03a
         KsUA==
X-Gm-Message-State: APjAAAUBgRxR0tqVq0CN4zjI8BFs5vw/alix2z7fPmgK+vN2PrwOGjjP
        kGnrg0YTWHtxSJF4Luujngk=
X-Google-Smtp-Source: APXvYqwGPFszbkKhk6KbckuE91eygj7h1ydMQX92G7HtFC0FyLEk+BwpzEVL1oeXUGC68jW+xHK+Rg==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr7145390wrn.37.1565901931948;
        Thu, 15 Aug 2019 13:45:31 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id c15sm11375926wrb.80.2019.08.15.13.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2019 13:45:31 -0700 (PDT)
Date:   Thu, 15 Aug 2019 13:45:29 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        joe@perches.com, miguel.ojeda.sandonis@gmail.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
Message-ID: <20190815204529.GA69414@archlinux-threadripper>
References: <20190815182029.197604-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815182029.197604-1-nhuck@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 15, 2019 at 11:20:29AM -0700, 'Nathan Huckleberry' via Clang Built Linux wrote:
> Clang is updating to support -Wimplicit-fallthrough on C
> https://reviews.llvm.org/D64838. Since clang does not
> support the comment version of fallthrough annotations
> this update causes an additional 50k warnings. Most
> of these warnings (>49k) are duplicates from header files.
> 
> This patch is intended to be reverted after the warnings
> have been cleaned up.
> 
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
>  Makefile                   | 4 ++++
>  scripts/Makefile.extrawarn | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 1b23f95db176..93b9744e66a2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -846,7 +846,11 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  KBUILD_CFLAGS += -Wdeclaration-after-statement
>  
>  # Warn about unmarked fall-throughs in switch statement.
> +# If the compiler is clang, this warning is only enabled if W=1 in
> +# Makefile.extrawarn
> +ifndef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
> +endif
>  
>  # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
>  KBUILD_CFLAGS += -Wvla
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index a74ce2e3c33e..e12359d69bb7 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -30,6 +30,9 @@ warning-1 += $(call cc-option, -Wunused-but-set-variable)
>  warning-1 += $(call cc-option, -Wunused-const-variable)
>  warning-1 += $(call cc-option, -Wpacked-not-aligned)
>  warning-1 += $(call cc-option, -Wstringop-truncation)
> +ifdef CONFIG_CC_IS_CLANG
> +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)

Shouldn't this be warning-1?

> +endif
>  # The following turn off the warnings enabled by -Wextra
>  warning-1 += -Wno-missing-field-initializers
>  warning-1 += -Wno-sign-compare
> -- 
> 2.23.0.rc1.153.gdeed80330f-goog
> 

I am still not a huge fan of the CONFIG_CC_IS_CLANG ifdefs but I don't
really see a much cleaner way to get around this. Some that come to
mind:

* Leave Makefile alone and add

KBUILD_CFLAGS += -Wno-implicit-fallthrough

in the CONFIG_CC_IS_CLANG section of scripts/Makefile.extrawarn

* Revert commit bfd77145f35c ("Makefile: Convert -Wimplicit-fallthrough=3
to just -Wimplicit-fallthrough for clang") for the time being and just
rely on adding -Wimplicit-fallthrough to KCFLAGS for testing.

Regardless:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
