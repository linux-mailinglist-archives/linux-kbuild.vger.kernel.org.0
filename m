Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADED020BA20
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 22:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgFZUSt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 16:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgFZUSt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:18:49 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62491C03E97A
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:18:49 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b16so5068925pfi.13
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/DjWbdB6QR6F3h1vBMYs8FI30xxDOIUG4fAHYu8nECU=;
        b=FrkG7xHDJ0hpKYFzhPGuCwru1szypTYOGi5hD5lbAfuGgT1pRq6kqZRC1RYyGXQ4Cx
         dBBF0DZ0m//3+/ZhtdALlqhCmQJr+DsmxShR47yHKzFznf60VL/beb/6bYpfKhHVdEyz
         yh40AuQXBaVxjsQclGj9K/76x2HjcqutOZc2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/DjWbdB6QR6F3h1vBMYs8FI30xxDOIUG4fAHYu8nECU=;
        b=irzXYk0Uf1k0JaAzktDJIpe70GxYGm39e5Hkwh0mGG9Q3d1ByaQuJm7HkYuUGi3FD2
         rS09gy3AoPfa7ipur20keC6AhpO7rhuujgzNOaBgo/9+u/DM4I9s8OossCWYBLadDobL
         PSrZ0R4YeM8fShvQe4WCFbZlBcyf4xWXGYaPFAUhaWSRkt4J0mxnrfv9bFj8jS5UXW2f
         ddOOdQOYeDbWxTi+XuX+US/dQPFvo56mdSlI2H0SukRoOPDc1r+xM1IA7fpRx1Cd0Mys
         0cij3cLxqc8fJvJWRQf/suCzo9o7U/PY6eA+8Zt5S7ZTTa5RRWHOuy2+jsJgz6ap5b0m
         8r6A==
X-Gm-Message-State: AOAM530Zr5sA59maf0i9/i5H5hSx+AoR09mvv6udEiYPGZhrREbjRZGh
        3aMSOrH76x6IWh1OlHix9SWMEQ==
X-Google-Smtp-Source: ABdhPJwYJkgs+qfqxsrtQQlApXR25CpCAIB9YF/4D3mpyg8KTrXfQyU2bY8skxNl8rMJC5c6opRIug==
X-Received: by 2002:a62:1ad6:: with SMTP id a205mr4256254pfa.109.1593202728953;
        Fri, 26 Jun 2020 13:18:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c141sm11968090pfc.167.2020.06.26.13.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 13:18:47 -0700 (PDT)
Date:   Fri, 26 Jun 2020 13:18:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, X86 ML <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: Provide way to actually disable stack protector
Message-ID: <202006261314.B6856AA96@keescook>
References: <202006221201.3641ED037E@keescook>
 <CAK7LNAQL=XF+xvsRNTEGXtY7J-fx5FJKpMuScoxLt8SDKGB3_Q@mail.gmail.com>
 <202006222234.FBCEAD7F@keescook>
 <CAK7LNARRU7j_aSgZreuR-jyFYAipaJwZjUwzmE9RcohgKJvS8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARRU7j_aSgZreuR-jyFYAipaJwZjUwzmE9RcohgKJvS8w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 27, 2020 at 04:04:33AM +0900, Masahiro Yamada wrote:
> On Tue, Jun 23, 2020 at 2:37 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Tue, Jun 23, 2020 at 11:33:53AM +0900, Masahiro Yamada wrote:
> > > Is it OK to not patch syscall_x32.c ?
> >
> > Good question. Peter? (It seems all the syscall_*.c files are just a
> > table, not code -- why do they need any instrumentation changes?)

I'd still like to know the answer to this one...

> Is it useful when we know
> DISABLE_STACKPROTECTOR = -fno-stack-protector  ?

I'm fine with that. My point was the using _REMOVE isn't going to work
for some compiler builds.

> I'd rather want to apply this patch
> https://patchwork.kernel.org/patch/11628493/
> and hard-code -fno-stack-protector where necessary.

That's fine. I will send a separate fix for arch/x86/entry/Makefile.

> cc-flags-y comes after KBUILD_CFLAGS
> so that -fno-stack-protector can negate -fstack-protector(-strong)

Okay, good.

-- 
Kees Cook
