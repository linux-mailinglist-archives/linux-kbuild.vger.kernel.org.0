Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0FB719E129
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Apr 2020 00:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgDCWpF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Apr 2020 18:45:05 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44456 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgDCWpF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 18:45:05 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so3335581plr.11
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2020 15:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dh/YzwcmTNEGeHjfzHpzt3+RVjAmlGCyq1UYQzxyT7s=;
        b=OKwXzGMXRPUowM4ABa1P1uclRN312qDo0rkVMaxCnf//bzaQk0hTNa4VSw7AKcTaMe
         NBvdo/yL8y3JSLsBpOZkG4L0cy6JcxsIOqb2KZQUghuixheFfu9xWqNHpqzTvApWeK6n
         rGHvNIf6rcWOjII10ibRZ/BMIG0fZJkQ5Tg2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dh/YzwcmTNEGeHjfzHpzt3+RVjAmlGCyq1UYQzxyT7s=;
        b=b64iwGeW/iSVQxhGbkTAWjk4eb7MMlCuddanhTG1xELWY4XwxK62kRyX7GccqI5h5M
         SiiiLfS2XEZlxmPwuxsIDDhJTOWEgsUg+/2nl4LOlnqqjNvy9LdnqxrGdNdRAU9ZDu/z
         kCzcFsnjMk3EpUDWn5qHpS/GFxijqBbCc/soM3UwXcYnhyyL3/f9hOPR6tMxpRe0KV9/
         kioVbqszyP2l+QhJr0RMNAZ4mn3Lq8KN5JCSzpaBeD4h9PuLXuKiIJy+gS1kBhKKK96k
         mEiCaBVRVdYGgPDASFO+uqOOE9q+P2IegqOjl37AG4q8KEM5YWbhS0u5h0ckdqD/a/b/
         fSSQ==
X-Gm-Message-State: AGi0PuYGKt9r2zzqtCRsOZHCvH5rzSHpTvO9ir62DXY8T37vnr3qozlk
        A+lPoVoHjxnUTJyLE9rSkv5LxA==
X-Google-Smtp-Source: APiQypLzpCCsWiQ/lFaeewHX9vuuuIEqsKxPFJbCGqChBNQwRFmwfICRd70XwZr6HeooQ2rNiYBH/A==
X-Received: by 2002:a17:90a:9b17:: with SMTP id f23mr12281284pjp.118.1585953902199;
        Fri, 03 Apr 2020 15:45:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o14sm6399628pfh.147.2020.04.03.15.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 15:45:01 -0700 (PDT)
Date:   Fri, 3 Apr 2020 15:45:00 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] kbuild: do not pass $(KBUILD_CFLAGS) to
 scripts/mkcompile_h
Message-ID: <202004031544.FEFA2BF@keescook>
References: <20200403212459.13914-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403212459.13914-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 04, 2020 at 06:24:59AM +0900, Masahiro Yamada wrote:
> scripts/mkcompile_h uses $(CC) only for getting the version string.
> 
> I suspected there was a specific reason why the additional flags were
> needed, and dug the commit history. This code dates back to at least
> 2002 [1], but I could not get any more clue.

I would be alarmed to find it changing the version string with flags. ;)

> Just get rid of it.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=29f3df7eba8ddf91a55183f9967f76fbcc3ab742
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> 
>  init/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/init/Makefile b/init/Makefile
> index 30aa8ab11120..d45e967483b2 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
>  	@$($(quiet)chk_compile.h)
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
>  	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
> -	"$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)" "$(LD)"
> +	"$(CONFIG_PREEMPT_RT)" "$(CC)" "$(LD)"
> -- 
> 2.17.1
> 

-- 
Kees Cook
