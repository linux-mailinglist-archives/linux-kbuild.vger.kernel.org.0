Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3A94F9E06
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Apr 2022 22:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239418AbiDHULP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Apr 2022 16:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239402AbiDHULG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Apr 2022 16:11:06 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3240C5C349
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Apr 2022 13:09:01 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s17so4897661ljp.8
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Apr 2022 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/UM0a9Ip3D6RdnaIa3xh2eGdIk2IGdD4yqLErApCSxM=;
        b=CI/CYvGTarILQMchP5s65Nb1hnUDQsMrJh6w+c+dkUl2F0BUOL2kuCeFcTeCQbJYjI
         yGMOzFWpjq2/2dCurKDzl4jWsQWHpb2kim/he4cP+VpQJ0ZUStRZGBNXrdgeYq6+Tfcu
         HjaA3//xCR8FdmJPvzvsB8Ewe4ysqg6aLbknQWkkmP6TJjHR3vNr+HzAxJJOsvVYFhqe
         DmwZKjCy0D1h/BU8V9rycAcdezkBXyYJ37skY+HbruIkrt7zeynpUygEOMwl2hyy8C0g
         wByJvNnOaCJ+Uita54VhBO6KQ5POwGmjgBjBNZO9b95Q/C+Pm4W3XcqpBs23OKtumbWW
         UFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/UM0a9Ip3D6RdnaIa3xh2eGdIk2IGdD4yqLErApCSxM=;
        b=GGP6nT91JrXtGRoovwPY3hPdYNQzDq7XN4P4awR9bMRLaqsu2cF4/BEVMXkGNKkAet
         6uDPrZGojlCd0Lpw4Y4mQwPjRtSCs2IHf/uD+HL6iP+m6oUoME19aX+mgxppAcDQmO1w
         9XVtn4XZzcpESsliPwE8x3hAnxKQH73hTTQM5NckoUmFjQPOeQJ11qq4ed3aL2mh/V+Z
         1y+qPPji70HjQmyhZdJZVfNBMQ+kz4LOz0OA+IqSIhSTQbtmoq3bUdrJIpK69S/Cw3se
         x2fevLuaVjCnRQj2YQO8L435cq298aQ/RW4jocBPNNtqOzVGeQzyw3u3azBOa4vBqsbX
         QcUA==
X-Gm-Message-State: AOAM533LvAhx75mWbkt94ig27qS/Ar5/SE1Iv6ltFIA03rL9V+TuP8MO
        5NWd3GEvK6yhu6agfLol5bKP47Gsd6SEBgKB53G/Sg==
X-Google-Smtp-Source: ABdhPJxn/j+3hhBgpW18trIa+1ld5yDFBq4oZ1pt7YDIhvl7m7bWgtTber0s7bQ9iWmBxG7ZeR/kNzR+h6Y+rAp8XlM=
X-Received: by 2002:a05:651c:555:b0:24b:15b7:74ad with SMTP id
 q21-20020a05651c055500b0024b15b774admr12406043ljp.239.1649448539126; Fri, 08
 Apr 2022 13:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <7fad83ecde03540e65677959034315f8fbb3755e.1649434832.git.jpoimboe@redhat.com>
 <CAK7LNARvFcQgEB1b0L6giwx0vD7wU9L-OZ5jvm1c5+StLjeOYQ@mail.gmail.com> <YlCJm8iQBPSOWIT5@hirez.programming.kicks-ass.net>
In-Reply-To: <YlCJm8iQBPSOWIT5@hirez.programming.kicks-ass.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 8 Apr 2022 13:08:47 -0700
Message-ID: <CAKwvOd=2xeZOg+0HosLPgCegKZxe7F-Cprw0MjOiWf2q=AbNDQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove CONFIG_DEBUG_SECTION_MISMATCH
To:     Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, X86 ML <x86@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Changbin Du <changbin.du@gmail.com>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Lore thread start for newly cc'ed ML readers:
https://lore.kernel.org/lkml/7fad83ecde03540e65677959034315f8fbb3755e.1649434832.git.jpoimboe@redhat.com/

On Fri, Apr 8, 2022 at 12:14 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sat, Apr 09, 2022 at 03:29:21AM +0900, Masahiro Yamada wrote:
> > Is [2] caused by dead code that was not optimized out
> > due to the unusual inlining decisions by the compiler ?
>
> The complaint is due to SMAP validation; objtool will scream if there's
> a CALL in between STAC/CLAC. The thinking is that since they open a
> security window, we want tight code between them. We also very much
> don't want tracing and other funnies to happen there. As such, any CALL
> is dis-allowed.

Just indirect calls, which might be manipulated, or static calls, too?

>
> This weird option is having us upgrade quite a few 'inline' to
> '__always_inline'.

As is, the assumption that __init functions only call other __init
functions or __always_inline is a brittle house of cards that leads to
a "what color is your function" [0] scenario, and leads to code that
happens to not emit warnings for compiler X (or compiler X version Y).
There's also curious exceptions in modpost that look like memory leaks
to me.

We already have such toolchain portability issues for different
toolchains and different configs; warnings from section mismatches,
and objtool STAC/CLAC checks.  I feel that Josh's patch would sweep
more of those under the rug, so I'm not in favor of it, but could be
convinced otherwise.

TBH, I kind of think that we could use a C extension to permit
__attribute__((always_inline)) to additionally be a statement
attribute, rather than just a function attribute because of cases like
this; we need the flexibility to make one call site __always_inline
without necessarily forcing ALL callsites to be __always_inline'd.

void y (void);
void x (void) { __attribute__((always_inline)) y(); };

(This is already expressable in LLVM IR; not (yet) in C. I'm not sure
yet _why_ this was added to LLVM; whether a different language front
end can express this, if C can and I'm mistaken, or whether it's only
used for optimizations).

I think that would give developers maximal flexibility to defer as
much to the compiler's inlining decisions when they don't care, and
express precisely what they need when they do [care].

[0] https://journal.stuffwithstuff.com/2015/02/01/what-color-is-your-function/
-- 
Thanks,
~Nick Desaulniers
