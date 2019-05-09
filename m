Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A136E188D0
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 13:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfEILRU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 07:17:20 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46919 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfEILRU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 07:17:20 -0400
Received: by mail-ed1-f65.google.com with SMTP id f37so1640229edb.13;
        Thu, 09 May 2019 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2nIigV5TR8x4tHhR3SJX/hUWkQOnlKIL+CzfaALFov0=;
        b=FQqEstsrkVoqWttZOTEuU8uS4dnpXTDXROEUco1FuQiFf8Sn+gntxGDgYSxpVM94pf
         GrGoehF4dPBpJfCs7IOxo/SsFCR+gPoJLAT60DK7Fwb2uOPNt61IUjqM67luZ3gT4mUT
         Xv8aQywWoUEGWvHULWcgey01YzkDZXaMphzr7noXOf33+anhSxn9PfwiRUis5oEtSM4s
         VWvr5xW+xwagL+PiVf4CEPi4YjL4QwfrhFqbCWrhNiadv063t8fyzwhrrmFh1uQ5pokI
         oLiPDi9YlIcwXuDDjIUDnd0AmrwEeUZKAtvmvKD0jGrvu9MNP+rVqveDLHQFyPXsWNVR
         64bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2nIigV5TR8x4tHhR3SJX/hUWkQOnlKIL+CzfaALFov0=;
        b=uEPH7WqYdOWLg53EhyhhSYM8/vf1kBPc5kXtN0nW3w9Uh6f14hDcgm6AO/llEDdJAO
         qFVGJ6GB2Yd+aaaAnpfQisUdAfbIalurWcoenPJIm5RDIcrVy5RDZhV7G0IARUyfJXaP
         /05eusIqLmL6SzArQzKRYgNraTdDdBhNi90/NwTzuyV/l9DgPVeUV+BrPjEK6bwggL+n
         yKyfFSpK6oPieGbu8eZjlv9hcSeXdMlG8Ub65hT72xpm9Bv5P+7AOHrN8z0MkNePNrg3
         VfV/tlkR+sIEQ6xQ66aa1fGjKTugiMSZKB41iHJV3MqvCXzO65iaRqzo35pAZr9dPkq+
         q3kg==
X-Gm-Message-State: APjAAAX+QPbwNk2wh9ICsFhQekZ0RssBvaNmopJxYVwoBTqk+Q1xwR/4
        nZbosHsP2zOSJB5JtPkFhTI=
X-Google-Smtp-Source: APXvYqxqJ2OffmfB/odr94F5eG9BZIMpzr19lXjsKV4Avk819YsAHlZhfpVmg1Yqfk8tOMjhuWvXkg==
X-Received: by 2002:a05:6402:1644:: with SMTP id s4mr2926119edx.182.1557400637986;
        Thu, 09 May 2019 04:17:17 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id g7sm271929ejl.73.2019.05.09.04.17.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 09 May 2019 04:17:17 -0700 (PDT)
Date:   Thu, 9 May 2019 04:17:15 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux@googlegroups.com,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add some extra warning flags unconditionally
Message-ID: <20190509111715.GC32696@archlinux-i9>
References: <20190509064635.1445-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509064635.1445-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 09, 2019 at 03:46:35PM +0900, Masahiro Yamada wrote:
> These flags are documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option / cc-disable-warning switches.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
>  scripts/Makefile.extrawarn | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 523c4cafe2dc..3ab8d1a303cd 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -23,15 +23,16 @@ warning-  := $(empty)
>  warning-1 := -Wextra -Wunused -Wno-unused-parameter
>  warning-1 += -Wmissing-declarations
>  warning-1 += -Wmissing-format-attribute
> -warning-1 += $(call cc-option, -Wmissing-prototypes)
> +warning-1 += -Wmissing-prototypes
>  warning-1 += -Wold-style-definition
> -warning-1 += $(call cc-option, -Wmissing-include-dirs)
> +warning-1 += -Wmissing-include-dirs
>  warning-1 += $(call cc-option, -Wunused-but-set-variable)
>  warning-1 += $(call cc-option, -Wunused-const-variable)
>  warning-1 += $(call cc-option, -Wpacked-not-aligned)
>  warning-1 += $(call cc-option, -Wstringop-truncation)
> -warning-1 += $(call cc-disable-warning, missing-field-initializers)
> -warning-1 += $(call cc-disable-warning, sign-compare)
> +# The following turn off the warnings enabled by -Wextra
> +warning-1 += -Wno-missing-field-initializers
> +warning-1 += -Wno-sign-compare
>  
>  warning-2 := -Waggregate-return
>  warning-2 += -Wcast-align
> @@ -39,8 +40,8 @@ warning-2 += -Wdisabled-optimization
>  warning-2 += -Wnested-externs
>  warning-2 += -Wshadow
>  warning-2 += $(call cc-option, -Wlogical-op)
> -warning-2 += $(call cc-option, -Wmissing-field-initializers)
> -warning-2 += $(call cc-option, -Wsign-compare)
> +warning-2 += -Wmissing-field-initializers
> +warning-2 += -Wsign-compare
>  warning-2 += $(call cc-option, -Wmaybe-uninitialized)
>  warning-2 += $(call cc-option, -Wunused-macros)
>  
> -- 
> 2.17.1
> 
