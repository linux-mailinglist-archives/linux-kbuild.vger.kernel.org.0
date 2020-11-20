Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4911D2BB7A5
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Nov 2020 21:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgKTUnR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Nov 2020 15:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728320AbgKTUnR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Nov 2020 15:43:17 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105F6C061A04
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 12:43:17 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 131so8996301pfb.9
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 12:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i55oAU3/0ChRWnSy8Vy2lsf5/3oQQZ1SpwWH7R5fDAQ=;
        b=GpFB8JoFYlzs5IPt1A4zHefiujfDAb4Aupd2Gt8XWPGlHwTgyLSPZ69lnmpG8AcDUI
         P5TQWbT45S+7ZLN8NYpqb8spc1x7xM2RTsvR4yoBcsZ8FoV3W56Xp36fdQTbZm5G+EPS
         8sdwQfqqqLt9BxwKajipmRGH3q24bpLwIUoOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i55oAU3/0ChRWnSy8Vy2lsf5/3oQQZ1SpwWH7R5fDAQ=;
        b=mcVUcEJyqn95E4F5+bd5nQ0HS0DPR+ZGBmdngaHmHtros1K3mP6bJdyT1InffD94fu
         A4/iiILkD+6Zh4suU9vb00/xvdWY+H0N+CEw/EvZz6QTt1Bt+z19cxwGColuiDtRYNdn
         sloKsyuE2FlBxxO7WKhHrrmsSI/1VtLEh2Za9pYrytn4BjW+lR+qrLNOhntsyBBxDBzS
         jZvr3zpLcBIYC3NV/VkGtQTStYxr9Sp8LETA5VaD9dPRe3fo0kGR+i1kA1TaGy2XCdQY
         W4SJ9FRM/ZN8O1RTppOzCqP+fn376sSsd4JmWzGWEvJy9Qfg8U3c3RNEjP3YEwOurI9K
         xTiA==
X-Gm-Message-State: AOAM5334xJc1EJnOS6EmUQGlVmoXIGsX/ze15d0XdECFsTrxJWr9q4Ud
        Imq2ToXRsclTno7BOCXvroQgzQ==
X-Google-Smtp-Source: ABdhPJwImKJNbu1EQwiGGAUktKiLdCpi1F8qQGza+VZgx7A7t3fyRz/FVTV1hNGkrOLQAws/XjLW2g==
X-Received: by 2002:a17:90b:e08:: with SMTP id ge8mr12659157pjb.29.1605904996598;
        Fri, 20 Nov 2020 12:43:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l133sm4882417pfd.112.2020.11.20.12.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 12:43:15 -0800 (PST)
Date:   Fri, 20 Nov 2020 12:43:14 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 02/17] kbuild: add support for Clang LTO
Message-ID: <202011201241.B159562D7@keescook>
References: <20201118220731.925424-1-samitolvanen@google.com>
 <20201118220731.925424-3-samitolvanen@google.com>
 <CAKwvOdnYTMzaahnBqdNYPz3KMdnkp=jZ4hxiqkTYzM5+BBdezA@mail.gmail.com>
 <CABCJKucj_jUwoiLc35R7qFe+cNKTWgT+gsCa5pPiY66+1--3Lg@mail.gmail.com>
 <202011201144.3F2BB70C@keescook>
 <20201120202935.GA1220359@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120202935.GA1220359@ubuntu-m3-large-x86>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 20, 2020 at 01:29:35PM -0700, Nathan Chancellor wrote:
> On Fri, Nov 20, 2020 at 11:47:21AM -0800, Kees Cook wrote:
> > On Fri, Nov 20, 2020 at 08:23:11AM -0800, Sami Tolvanen wrote:
> > > Changing the ThinLTO config to a choice and moving it after the main
> > > LTO config sounds like a good idea to me. I'll see if I can change
> > > this in v8. Thanks!
> > 
> > Originally, I thought this might be a bit ugly once GCC LTO is added,
> > but this could be just a choice like we're done for the stack
> > initialization. Something like an "LTO" choice of NONE, CLANG_FULL,
> > CLANG_THIN, and in the future GCC, etc.
> 
> Having two separate choices might be a little bit cleaner though? One
> for the compiler (LTO_CLANG versus LTO_GCC) and one for the type
> (THINLTO versus FULLLTO). The type one could just have a "depends on
> CC_IS_CLANG" to ensure it only showed up when needed.

Right, that's how the stack init choice works. Kconfigs that aren't
supported by the compiler won't be shown. I.e. after Sami's future
patch, the only choice for GCC will be CONFIG_LTO_NONE. But building
under Clang, it would offer CONFIG_LTO_NONE, CONFIG_LTO_CLANG_FULL,
CONFIG_LTO_CLANG_THIN, or something.

(and I assume  CONFIG_LTO would be def_bool y, depends on !LTO_NONE)

-- 
Kees Cook
