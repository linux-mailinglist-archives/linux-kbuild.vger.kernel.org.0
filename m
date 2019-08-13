Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84DF48BC52
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 17:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729424AbfHMPA6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 11:00:58 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43385 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729691AbfHMPAz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:00:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id v12so3975626pfn.10
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 08:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dl4zVREy4GL+zTPrnysS4JlC3AXp76Unucw3J+BxEXY=;
        b=HfdlKLK7w5ckYWTiIAzA/VwjXyExjaFSKoh7zzeDJPrIWm6F5UJ3581EHNU4Zr+p/p
         LKtfzmYDqbq8e9GirSLRDUTaIGLRyk//tHb+E/npw4iLXU48CvIEHVjQdaTYHZKekBiB
         tzmV0Kwef9RmZK+5l0x0sOexOKP018DtqrLJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dl4zVREy4GL+zTPrnysS4JlC3AXp76Unucw3J+BxEXY=;
        b=YR0p7J1OsqoxTKhmrRUM7HTIk5kDVITycQOJPKFTX0njepjFhWADuJqTgePQab8/tZ
         eozek+MwIk7ZqDF1f8dQD4outfM45Oz/0N8lxS7SA8mgHL0F7pGfs4bZCXs2mKbqQY1B
         OZzFu3DY7FK44rKYWdrwzmAqhZ4hquGvIjFvEMcWcc7OMcstEJhD8vwTOuKLiGIAQGs0
         x2UwB7CkLMtueQjj6aCqgIVxt21jtM6WfR40TQ5p5/rPEZgGwwXoY2dieDLqZnHiWePx
         L+YwWyhGaTEYifw+WznlA9+7MvsKkmHQTKfkkeU2hgPa7xUAicDJDmdgalZqkZOUBFkt
         /0/g==
X-Gm-Message-State: APjAAAUw8pncYLTVKTsogwzDdcSr9iAE9FE4OGs+kVfSO2n5V9xQ0z3d
        ns52XJgZvLruqDyWSMO1X1nvvg==
X-Google-Smtp-Source: APXvYqxUaIs7z51V78IT1RtONuWfId/F36pH8j+pzIUb1yCPTkEy3q7fsBAIl1Cp3wlvwc3MDZRv/A==
X-Received: by 2002:a17:90a:9f46:: with SMTP id q6mr2558368pjv.110.1565708454954;
        Tue, 13 Aug 2019 08:00:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j15sm107632196pfr.146.2019.08.13.08.00.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 08:00:54 -0700 (PDT)
Date:   Tue, 13 Aug 2019 08:00:53 -0700
From:   Kees Cook <keescook@chromium.org>
To:     zhe.he@windriver.com
Cc:     re.emese@gmail.com, kernel-hardening@lists.openwall.com,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gcc-plugins: Enable error message print
Message-ID: <201908130755.A44C39B46@keescook>
References: <1565689489-309136-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565689489-309136-1-git-send-email-zhe.he@windriver.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 13, 2019 at 05:44:49PM +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> Instead of sliently emptying CONFIG_PLUGIN_HOSTCC which is the dependency
> of a series of configurations, the following error message would be easier
> for users to find something is wrong and what is happening.
> 
> scripts/gcc-plugins/gcc-common.h:5:22: fatal error: bversion.h:
> No such file or directory
> compilation terminated.
> 
> Now that we have already got the error message switch, let's turn it on.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>

Hi!

Yeah, this would be helpful, but unfortunately it would be very noisy
for many people who don't have the GCC plugins installed. It used to
print error messages when it was a selectable Kconfig option but now
that it is autodetected, we can't show the errors unconditionally.

I would love to have some kind of way to answer the question "why isn't
this option available?" in Kconfig. The best place for this might be in
the menuconfig search option, but I'm not sure how to wire up other
things like it.

-Kees

> ---
>  scripts/gcc-plugins/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index d33de0b..fe28cb9 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -3,7 +3,7 @@ preferred-plugin-hostcc := $(if-success,[ $(gcc-version) -ge 40800 ],$(HOSTCXX),
>  
>  config PLUGIN_HOSTCC
>  	string
> -	default "$(shell,$(srctree)/scripts/gcc-plugin.sh "$(preferred-plugin-hostcc)" "$(HOSTCXX)" "$(CC)")" if CC_IS_GCC
> +	default "$(shell,$(srctree)/scripts/gcc-plugin.sh --show-error "$(preferred-plugin-hostcc)" "$(HOSTCXX)" "$(CC)")" if CC_IS_GCC
>  	help
>  	  Host compiler used to build GCC plugins.  This can be $(HOSTCXX),
>  	  $(HOSTCC), or a null string if GCC plugin is unsupported.
> -- 
> 2.7.4
> 

-- 
Kees Cook
