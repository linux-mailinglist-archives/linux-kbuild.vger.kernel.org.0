Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569CF279626
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Sep 2020 04:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729884AbgIZCLu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Sep 2020 22:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729605AbgIZCLu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Sep 2020 22:11:50 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12409C0613CE;
        Fri, 25 Sep 2020 19:11:50 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id a4so3918654qth.0;
        Fri, 25 Sep 2020 19:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J6M1NDDexikmB6Lw4o/cJ8CAeclIPdykh7z3pVXAl2Q=;
        b=nvNxfcH8OApZmb/YwbtKanRepgVmME7DxDehCJsQcmv3aRN2nbtgOH7gU/2XWk1NLt
         6AQteyOSy7unC5wCSjkbF0S8mKk4+dHPnem2nXlfPe9NLySfGW/XXQLIjOKAwwkqqP3R
         VdZa27x+y4QZW38qcT/3uX58gcB7M040+UBwQL8AslpIc4UdlQW6wrv6FwayTJNPcsNt
         uMkW8dIanhew1xHz5128M0irh8wSlEJQEoPP+qIpyAYXEEW9z2/QZnuVlVo/VQpAtj1N
         tlRZgZu5KqwHuJ/uLSJsUd43Cpe1t6xLuiujthNDJNs/IZ1/6gf9dMl3ExMKP9mlTN37
         /fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J6M1NDDexikmB6Lw4o/cJ8CAeclIPdykh7z3pVXAl2Q=;
        b=so4z8okp23D7689h6/e3Nh3wYb/DhKY4tvZZ9bTVYui1bZZ3ZciONqyvcfay4SMifS
         52B2Y7ugfODt+CVwmmrI468O7CI+GV8IAdX91BtRYDgOay6Vffi+R1LcRuCV1zKzHOdJ
         /OUVyxF9reRldTPMUd9ZTE0uz6HqVXGd9QVgS5JmX6M3fda5v8MdhSQpGGLYdLx23eux
         rgwM8+867W1u4P5LXJuoLMceMnn0vql0VNKVjuL6qCHIc3Om92N2lcVArgAydRixeUTL
         LCCNF2sLWekNOHB0rNDf5+z2QgpMpSmastyJEf4knSqhFljCkulZTxhDuvDdUWGVCo6z
         gUkQ==
X-Gm-Message-State: AOAM530zsUnt/zjwKpv5ZE0PmQs47MsjTc/y8lAYCAhHZyYxqYiVQAgG
        m1zX+nDqLQ57xu0jeHzpeAE=
X-Google-Smtp-Source: ABdhPJwOwtE/LCPkjxOBwPq7H0BE9L/4PEQS1i9rc6sWMnCOZA75O5FKb0YGojBX44gd19IfX4tEwA==
X-Received: by 2002:aed:2308:: with SMTP id h8mr2683482qtc.65.1601086308948;
        Fri, 25 Sep 2020 19:11:48 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id r21sm3427488qtj.80.2020.09.25.19.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 19:11:47 -0700 (PDT)
Date:   Fri, 25 Sep 2020 19:11:46 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        "open list:CLANG/LLVM BUILD SUPPORT" 
        <clang-built-linux@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation/llvm: Fix clang target examples
Message-ID: <20200926021146.GA1917299@ubuntu-n2-xlarge-x86>
References: <20200925152121.20527-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925152121.20527-1-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 25, 2020 at 08:21:14AM -0700, Florian Fainelli wrote:
> clang --target=<triple> is how we can specify a particular toolchain
> triple to be use, fix the two occurences in the documentation.
> 
> Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

Thank you for the patch!

> ---
>  Documentation/kbuild/llvm.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 334df758dce3..dae90c21aed3 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -39,10 +39,10 @@ which can help simplify cross compiling. ::
>  	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
>  
>  ``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
> -``CROSS_COMPILE`` is used to set a command line flag: ``--target <triple>``. For
> +``CROSS_COMPILE`` is used to set a command line flag: ``--target=<triple>``. For
>  example: ::
>  
> -	clang --target aarch64-linux-gnu foo.c
> +	clang --target=aarch64-linux-gnu foo.c
>  
>  LLVM Utilities
>  --------------
> -- 
> 2.25.1
> 
