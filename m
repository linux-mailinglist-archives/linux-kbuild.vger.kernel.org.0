Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7972D4960
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 19:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731823AbgLISrG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 13:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733267AbgLISrF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 13:47:05 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D787FC0613D6
        for <linux-kbuild@vger.kernel.org>; Wed,  9 Dec 2020 10:46:24 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t8so1592696pfg.8
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Dec 2020 10:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SLck9T+fSmc7a2TIjVWcYDoy5sXjzN2t3Wk/7vfAiNU=;
        b=bhK6iE8+kmUpXazU8RtlUQWQoj/gYhhd10dZE+8+sfMSvHRbFPAuMemfMZJpCk7KLo
         qxI34DHiizH6q+cv+JjdskR2bDrHOJERUYjVOoU/koSNLjgctg0ASc+O/d+o5Fy0r+DH
         P5qzC/WyE2Q1lPKJXmbTIwcCv4Kq6A5+KZNJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SLck9T+fSmc7a2TIjVWcYDoy5sXjzN2t3Wk/7vfAiNU=;
        b=L1kezUDvVQ8qfeZAobVxElllYQgmUH0aya9Z5s4/v5O2qDzYj2ij0En3KdlpdpF4FW
         lo8oWAcYJdVVHLK5BRbm+ykLKf/IzgwxXnX9dWsufdeAYYRSU7cuhy6Mkomeut9RerA7
         CaJGHDEE1ebmaRrO5zqDXMxzQihsNTxbUpE5RpgayGbQGevIbJPgLsjjZkiR21RRe+yn
         L8XR8saqfacHrtkViX+EmpJrQ1P6WgCO07VrLuYu1/yMLq0WbU4NfovHV7J3j+Ay5Pc4
         lVqDOMpe0xd2GHfkm80q496vvOg8tbY23NEBR3s8vGLWs4/TEWxFc+l9N2fz7XQCjp3S
         5yIw==
X-Gm-Message-State: AOAM530fdLpWchAQDoXYjheLO3UWJkMYfACEIfLyfG+upCaz+BzmUIU2
        ZmZmg5L0xdVXmARA+shH+tE7Zw==
X-Google-Smtp-Source: ABdhPJxsOMJXYHgO++DFsy46q+XDaL5LbfNiKSXWrHsgDpx4L/Vpg9szW4GEOZ4o6Z++CZWZM+WnLA==
X-Received: by 2002:a62:84ca:0:b029:19e:6f95:11b1 with SMTP id k193-20020a6284ca0000b029019e6f9511b1mr3534614pfd.68.1607539584427;
        Wed, 09 Dec 2020 10:46:24 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w70sm3499919pfd.65.2020.12.09.10.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 10:46:23 -0800 (PST)
Date:   Wed, 9 Dec 2020 10:46:22 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/7] ubsan: Enable for all*config builds
Message-ID: <202012091045.34E3CC3FA@keescook>
References: <20201203004437.389959-1-keescook@chromium.org>
 <20201203004437.389959-6-keescook@chromium.org>
 <CAK8P3a1Br8JFJX2PxyjVxMPMhi-y8mxf+vdEAZQq_Wm2wYP7ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Br8JFJX2PxyjVxMPMhi-y8mxf+vdEAZQq_Wm2wYP7ZA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 03, 2020 at 09:51:40AM +0100, Arnd Bergmann wrote:
> On Thu, Dec 3, 2020 at 1:44 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > With UBSAN_OBJECT_SIZE disabled for GCC, only UBSAN_ALIGNMENT remained
> > a noisy UBSAN option. Disable it for COMPILE_TEST so the rest of UBSAN
> > can be used for full all*config builds or other large combinations.
> >
> > Link: https://lore.kernel.org/lkml/CAHk-=wgXW=YLxGN0QVpp-1w5GDd2pf1W-FqY15poKzoVfik2qA@mail.gmail.com/
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Have you checked if this has a notable impact on allmodconfig compile speed
> with gcc or clang? I think I've seen significant increases in build times before
> with this, but I don't remember the actual magnitude.
> 
> Making it 20% slower would probably be ok, but making it twice as slow might
> be too much.

And for Clang, it's about 7m40s before and 8m30s after, so roughly 12% slower.

-- 
Kees Cook
