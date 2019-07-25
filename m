Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8353A744CB
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 07:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390368AbfGYFTC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 01:19:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36846 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387743AbfGYFTC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 01:19:02 -0400
Received: by mail-wm1-f68.google.com with SMTP id g67so39336337wme.1;
        Wed, 24 Jul 2019 22:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zlgmxtIQ7tw41jxv7w9g9WF1aiWMMHCySIjrTiYaOHk=;
        b=dSjKX1JIzZpnMlaFrh/CO3sdeaVScMLkt8Wx+AlIAVKvl/cC9tct2KdsImmkW2kK1c
         Uoi1pJiVxVcmh9qJaPousCT4W1abaso1QjQ8CGPpjmkBy1q+VdmItT1cGDIV5qJQNuMK
         6StjQnuultYYg738hoHRY+RnV7K+dJS2sTNXNOPcQKzGAZwbVDITpXqLeQzDZ9ZIngGQ
         ok6zdVLvDMhwdUMf+VTVUYO1/tgknhfwoHTnX9QJ0HNoWqR+2wnftXk0ewN93AiDw1u7
         YpEOpuXfYhqByOG0VaKiMmsPBeCuUz4t6FtUK4I9glUfGMMj7rhfMk6JW7mu+18W2zYV
         ANkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zlgmxtIQ7tw41jxv7w9g9WF1aiWMMHCySIjrTiYaOHk=;
        b=emuRvVvNGS7m8/z7BWSxFmvyxv67eye947h4Qb83zmHzfnEZ7RJs+cyv0nZrXDy/wh
         rs28fyjMLgWV+coTj0bbWSwgwmfAkCz2lgRLXz45JU1ywwxRRNjs4zHPWY0HiyLOqw3o
         9xm3QD2DkiLWGpApRpoTn1rbhT3JXVwKvpw0uvbrRHOj/jz4iWlwNFPvJU+NzFwaPQ2c
         k8FAmNz4/vl2c5RAG9iQtgPAHSoOh+IHIqPk1dHxeHut+XWal3U7EOPdrPf2uN0AS6hp
         WYae8btAgBr0Kw85ZE8VmKR0dkk5XbN2i4od5HFGRBl1UDqp12stgDHFDqxkMLygciCt
         eQZw==
X-Gm-Message-State: APjAAAUXtQGf0cG3FGAOt4w6M3O92ubaHsf/A1A1EdzE6SdC5e1SC7n5
        u0WixVqDgub2Mg5fbEQVOdw=
X-Google-Smtp-Source: APXvYqzuOOt6YOCN7JO4S9XH2013CNl3EfIISfBoeapn/uzHYRi3v9wg/nKnHCsAyhxiKfdChltkJg==
X-Received: by 2002:a1c:a514:: with SMTP id o20mr79531810wme.149.1564031939881;
        Wed, 24 Jul 2019 22:18:59 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id e19sm64916988wra.71.2019.07.24.22.18.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 22:18:58 -0700 (PDT)
Date:   Wed, 24 Jul 2019 22:18:57 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Peter Smith <peter.smith@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] kbuild: Check for unknown options with cc-option and
 clang in Kbuild
Message-ID: <20190725051857.GA53904@archlinux-threadripper>
References: <20190724235030.131144-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724235030.131144-1-swboyd@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Stephen,

Was the second Kbuild in the subject line supposed to be Kconfig?

On Wed, Jul 24, 2019 at 04:50:30PM -0700, Stephen Boyd wrote:
> If the particular version of clang a user has doesn't enable
> -Werror=unknown-warning-option by default, even though it is the
> default[1], then make sure to pass the option to the Kconfig cc-option

Hmmm interesting, I did not even know that was possible... Is that a
clang configuration option or an out of tree patch? Looks like it has
been on by default since clang 3.2: https://godbolt.org/z/mOmusu

> command so that testing options from Kconfig files works properly.
> Otherwise, depending on the default values setup in the clang toolchain
> we will silently assume options such as -Wmaybe-uninitialized are
> supported by clang, when they really aren't.
> 
> This issue only started happening for me once commit 589834b3a009
> ("kbuild: Add -Werror=unknown-warning-option to CLANG_FLAGS") was
> applied on top of commit b303c6df80c9 ("kbuild: compute false-positive
> -Wmaybe-uninitialized cases in Kconfig"). This leads kbuild to try and

Prior to 589834b3a009, how did cc-option work at all if
-Wunknown-warning-option wasn't enabled by default? I assume that clang
would just eat any unknown flags while returning zero so it looked like
the flag was supported?

> test for the existence of the -Wmaybe-uninitialized flag with the
> cc-option command in scripts/Kconfig.include, and it doesn't see an
> error returned from the option test so it sets the config value to Y.

It might be worth explicitly saying somewhere in here that clang will
not error on unknown flags without -Werror + -Wunknown-warning-option.

> Then the makefile tries to pass the unknown option on the command line
> and -Werror=unknown-warning-option catches the invalid option and breaks
> the build.
> 
> Note: this doesn't change the cc-option tests in Makefiles, because
> those use a different rule that includes KBUILD_CFLAGS by default, and
> the KBUILD_CFLAGS already has -Werror=unknown-warning-option. Thanks to
> Doug for pointing out the different rule.
> 
> [1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
> Cc: Peter Smith <peter.smith@linaro.org>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> Change-Id: I3bb69d45bb062d1306acbf19bc0adfb60f706442

I assume that shouldn't be there?

Overall, seems okay to me (took me a sec to understand the bug,
certainly a very specific one). It might make sense to explicitly add
somewhere in the commit message that this syncs cc-option behavior
between Kconfig and Kbuild as a whole, as I didn't understand that at
first. Thanks for the triage and sorry for the breakage!

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
