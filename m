Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A23E2B7120
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 22:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgKQVw2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 16:52:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgKQVw1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 16:52:27 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CEFC0613CF
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 13:52:26 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f18so16909869pgi.8
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 13:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4XjG60ocQx4PkwGgrAEoZIyPUhnxDgPZrMBdqiIZG+4=;
        b=FumCDSzaVj4k7q4V2p0oNKAIKu0GYbAFc2SyCI1aqTxJUFpFoUH6T8PWWxOryTG19/
         Q1zlGV6Di3ZGEwaZIfQcQ4NcdAXg07SmAHCYzmm4aemVr6P+UEqs5yTGo761PszGobNa
         LiUwMgr6+SbWyc3qbTPN/Ai3ee1ReodEOFMas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4XjG60ocQx4PkwGgrAEoZIyPUhnxDgPZrMBdqiIZG+4=;
        b=MOHjHHyHikYUFXLtXB3bXGnu+6fUY7KrAeScgWmLTrNUE7O3FcZkHS7aLB9m/uuhGz
         l5tB7HPE34dlsGVnrKcoxkSg1wCRAZCiKYnNlkfaA2DnegivIvr7u4Rf763IMC4ksZwB
         2dGqI0snE/ft4vV4EEGo81XWFmYR+hZ2037AacwELdkI6S2b05yfNaubr2sf9EIkNfyI
         fAGeELgF8cPTNBbEky/D01lmz7N7snHtAP/1wiRoX+n2/A7scugnX+6yZXTorvM0BQ3x
         rfL1KJOV+pR1aBsrQHOpTlLTBDbXo0cEiJERf2VSop5EgZL4xmQwjRvM6qxJVcYW61xq
         vIpQ==
X-Gm-Message-State: AOAM532XZ/YHeshU9FeHekZcVnPS1+t+IN/eL3cCmfBYkyFGBhfgGkPR
        UukKp1dBDamDljLRYHp8hfwgVA==
X-Google-Smtp-Source: ABdhPJwx/GwY1vsKuE+ZykhwdU5XFj+Q/8T4Jjrzzd8kbh1afM17NqsLxZ988EMini1U8GWrTVGnNg==
X-Received: by 2002:a63:1445:: with SMTP id 5mr5119858pgu.357.1605649945756;
        Tue, 17 Nov 2020 13:52:25 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b29sm1039089pgn.87.2020.11.17.13.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 13:52:24 -0800 (PST)
Date:   Tue, 17 Nov 2020 13:52:23 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
Message-ID: <202011171351.728E1194EF@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113195553.1487659-1-natechancellor@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 13, 2020 at 12:55:52PM -0700, Nathan Chancellor wrote:
> Currently, '--orphan-handling=warn' is spread out across four different
> architectures in their respective Makefiles, which makes it a little
> unruly to deal with in case it needs to be disabled for a specific
> linker version (in this case, ld.lld 10.0.1).
> 
> To make it easier to control this, hoist this warning into Kconfig and
> the main Makefile so that disabling it is simpler, as the warning will
> only be enabled in a couple places (main Makefile and a couple of
> compressed boot folders that blow away LDFLAGS_vmlinx) and making it
> conditional is easier due to Kconfig syntax. One small additional
> benefit of this is saving a call to ld-option on incremental builds
> because we will have already evaluated it for CONFIG_LD_ORPHAN_WARN.
> 
> To keep the list of supported architectures the same, introduce
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN, which an architecture can select to
> gain this automatically after all of the sections are specified and size
> asserted. A special thanks to Kees Cook for the help text on this
> config.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Looks good to me. With the other suggestions from the thread added,
please consider it:

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
