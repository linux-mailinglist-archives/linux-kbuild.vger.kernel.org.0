Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2625269793
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 23:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgINVRy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 17:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgINVRw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 17:17:52 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9499C061788
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 14:17:51 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n14so627351pff.6
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 14:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C7sgFtQoGvHj7+x9+CzUrIZAY69PKOdgVMUAIaHzDvk=;
        b=gnDqleJFU5cmc1mv/6wA2ZIagFuJ9D2lmUavjWv6EMmYdNLbqf6A5K8TJOdNg7N3FY
         mLuwcwvWwVMJQJrF2vg/ffFdc2javZdPcWINp34Ym7c19crbmYZ6x7dPhu+mEvQ/56Mt
         wXI10/4tolCDr+DmylqtpAkdoH72EKStTvyCo4DLIhzvt5QZhg6xpH43JtkExoMvKdNv
         LiH4JqsEpciJm2TR7hD6NTbttRz8qwE8OiW3LIT6n7PyHgKqCdDh80IzfCFVyqmWmdeJ
         ggSFYCBKX6oP4E5HLBAdw6dziC0aI3JUI14PFxwSd6FPjVSFMR3cn3pNJ4nX1aMKU4om
         qYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C7sgFtQoGvHj7+x9+CzUrIZAY69PKOdgVMUAIaHzDvk=;
        b=WjMfHm9xcxDXrGp9bkHv0P0QM+ww25AsF4xSeOSou76YNQq6qY9AuADiF6tAF1U5Wz
         WnPNvdXv5sK9VaDxWSIlD5fVorjwjrYD5offegRhORCpOyZBcTCia306k+/61MyQdcMg
         lYCODRpUhJsfOjxLpwI+a/fjZHLLJibrRZuEyzh5Hlj5k89WW8AE/CGFZ/hneFw1Ibs1
         osg9mXBAYSIz0s6ZxhP3/Y1LsZzGQ2nuWrBK3ViPjcwp+U+yaq19uJGCmkJUp5S2qBXn
         /K6wrbQfIxiaUvqQ0JcbOE/7v0EcL1YJmnvrKYt2yUN3vGylmudxFWtMXQ+wU/tv2rwX
         RNaA==
X-Gm-Message-State: AOAM530MlBjciLE9nZg0Iy95JDD/mPMDnZFcLeh62uRejqrViT6sJYSC
        M+Fe2oScg6OCZMpmRjtSOU+cVKe9ELq69dqFJMJjKw==
X-Google-Smtp-Source: ABdhPJxjub95+5dDKi00tb/Da2i1oajSsikg4UGw9vf1zvL6UGwb/mS50BQN7Q/j8wmacDIAUdFy2S5MHc9JZU28vt0=
X-Received: by 2002:a63:7882:: with SMTP id t124mr2686911pgc.381.1600118271305;
 Mon, 14 Sep 2020 14:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200914172750.852684-1-georgepope@google.com> <20200914172750.852684-7-georgepope@google.com>
In-Reply-To: <20200914172750.852684-7-georgepope@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 14 Sep 2020 14:17:39 -0700
Message-ID: <CAKwvOdmMAc5zhLQMr-6WvrJJ4vbzwMpav36Y6V_DBBVjf4i72g@mail.gmail.com>
Subject: Re: [PATCH 06/14] Fix CFLAGS for UBSAN_BOUNDS on Clang
To:     George-Aurelian Popescu <georgepope@google.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        David Brazdil <dbrazdil@google.com>,
        Mark Brown <broonie@kernel.org>,
        Fangrui Song <maskray@google.com>, ascull@google.com,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Marco Elver <elver@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+ kernel-dynamic-tools to help review.

On Mon, Sep 14, 2020 at 10:28 AM George-Aurelian Popescu
<georgepope@google.com> wrote:
>
> From: George Popescu <georgepope@google.com>
>
> When the kernel is compiled with Clang, UBSAN_BOUNDS inserts a brk after
> the handler call, preventing it from printing any information processed
> inside the buffer.
> For Clang -fsanitize=bounds expands to -fsanitize=array-bounds and
> -fsanitize=local-bounds, and the latter adds a brk after the handler
> call
>
> Signed-off-by: George Popescu <georgepope@google.com>
> ---
>  scripts/Makefile.ubsan | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 27348029b2b8..3d15ac346c97 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -4,7 +4,14 @@ ifdef CONFIG_UBSAN_ALIGNMENT
>  endif
>
>  ifdef CONFIG_UBSAN_BOUNDS
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
> +      # For Clang -fsanitize=bounds translates to -fsanitize=array-bounds and
> +      # -fsanitize=local-bounds; the latter adds a brk right after the
> +      # handler is called.
> +      ifdef CONFIG_CC_IS_CLANG
> +            CFLAGS_UBSAN += $(call cc-option, -fsanitize=array-bounds)

You can remove the cc-option check above; Clang has supported this
option for many releases.  (One less compiler invocation at build
time, FWIW).

You cannot remove the below cc-option; GCC only implemented that
sanitizer in the 5.0+ releases; the kernel still support GCC 4.9.

> +      else
> +            CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
> +      endif
>  endif
>
>  ifdef CONFIG_UBSAN_MISC
> --
> 2.28.0.618.gf4bc123cb7-goog
>


-- 
Thanks,
~Nick Desaulniers
