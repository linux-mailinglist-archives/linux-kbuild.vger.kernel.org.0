Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E72D37AE64
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 18:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbfG3QuE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 12:50:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33310 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfG3QuE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 12:50:04 -0400
Received: by mail-wm1-f67.google.com with SMTP id h19so45713808wme.0;
        Tue, 30 Jul 2019 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4ipmrrzG/Wk902fPLix62FvHSEpdXBNMCXbDCZqAWVI=;
        b=iCS8VdiXv5dvB40PdsUMjPQ2r/6DFhIRl1/6h6nMSnw7SicbhW/B2PpIzRLUwHzPTk
         xzcg3rGUDwK1nTo8cTLCYG++iHESxmG5g5etBxeUfywlEiPIecVEqYdZVkBFj4wh8wvk
         DLhfLnhoGN9oh/Bogdh+cxG8LWG2YGoI61bd0xOhjrGj4eImYSgu7hu53jbAfMWq7Nwa
         zUhYvIkmB1isVog/2Aoxp1gjVSe4uoo7gH1OwfjUsGODv8X29G/gyBkl93O7gfLmRux2
         I8YQrQQ73xhv5bVjDW+/0m/rA6V2jVl/wj2og2wz4yq0WtpZCZPXD6LYt2DfB2JKsaFE
         VtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4ipmrrzG/Wk902fPLix62FvHSEpdXBNMCXbDCZqAWVI=;
        b=bptthMXcnBXQlndkIsmmhCTreah6JX41UV5DcB+e1YqzmiN926L4T65sY0yYdVxo0Q
         B/opPoD5TVtJeVR5dSvLIcKgMBIdWIRC3cHwGsqucMV/AOo3lj9j1yDjuzmtZk514xDT
         UuPbOHsXPRCJUAM2jdtHbEdIFBEmny2j1V4V0fQv6CQVzTJKKdsPodsBkKleeqEnnNTx
         o99RIgfTkbC5hZUKZXFBPj2ncVQxo92wcFYw0Ivmt58fvV8TvsT1KZ3fwufCg6z8D+YN
         byNjFspmrpLkmlok9FQfFuQOXRpCoIkhjQaoo6tjIlLCzTEj+Bu3/9dYdxsRh4iaSOeX
         QEzw==
X-Gm-Message-State: APjAAAUG0cR05kMZdAQdaiKNDzRdRAHkXIVx9EnTLC15jT3SVrlQ24DK
        68c9qKKHRntX0CMQF+ljWcY=
X-Google-Smtp-Source: APXvYqx53BXhI6xLQVg7kXYcO+LqqdQYlGDiCiNdNYt7Excd/gWehlgxRdpeYiAbEi74JMDGSNAXsA==
X-Received: by 2002:a7b:c149:: with SMTP id z9mr109567197wmi.0.1564505401952;
        Tue, 30 Jul 2019 09:50:01 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id v15sm63218486wrt.25.2019.07.30.09.50.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 09:50:01 -0700 (PDT)
Date:   Tue, 30 Jul 2019 09:49:59 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Peter Smith <peter.smith@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] kbuild: Check for unknown options with cc-option
 usage in Kconfig and clang
Message-ID: <20190730164959.GA129059@archlinux-threadripper>
References: <20190730164803.45080-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730164803.45080-1-swboyd@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 30, 2019 at 09:48:03AM -0700, Stephen Boyd wrote:
> If the particular version of clang a user has doesn't enable
> -Werror=unknown-warning-option by default, even though it is the
> default[1], then make sure to pass the option to the Kconfig cc-option
> command so that testing options from Kconfig files works properly.
> Otherwise, depending on the default values setup in the clang toolchain
> we will silently assume options such as -Wmaybe-uninitialized are
> supported by clang, when they really aren't.
> 
> A compilation issue only started happening for me once commit
> 589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
> CLANG_FLAGS") was applied on top of commit b303c6df80c9 ("kbuild:
> compute false-positive -Wmaybe-uninitialized cases in Kconfig"). This
> leads kbuild to try and test for the existence of the
> -Wmaybe-uninitialized flag with the cc-option command in
> scripts/Kconfig.include, and it doesn't see an error returned from the
> option test so it sets the config value to Y. Then the Makefile tries to
> pass the unknown option on the command line and
> -Werror=unknown-warning-option catches the invalid option and breaks the
> build. Before commit 589834b3a009 ("kbuild: Add
> -Werror=unknown-warning-option to CLANG_FLAGS") the build works fine,
> but any cc-option test of a warning option in Kconfig files silently
> evaluates to true, even if the warning option flag isn't supported on
> clang.
> 
> Note: This doesn't change cc-option usages in Makefiles because those
> use a different rule that includes KBUILD_CFLAGS by default (see the
> __cc-option command in scripts/Kbuild.incluide). The KBUILD_CFLAGS
> variable already has the -Werror=unknown-warning-option flag set. Thanks
> to Doug for pointing out the different rule.
> 
> [1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
> Cc: Peter Smith <peter.smith@linaro.org>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  Makefile                | 1 +
>  scripts/Kconfig.include | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 9be5834073f8..517d0a3f6539 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -536,6 +536,7 @@ KBUILD_AFLAGS	+= $(CLANG_FLAGS)
>  export CLANG_FLAGS
>  endif
>  
> +

Not sure it's worth sending a v4 for but I don't think this should be
there.
