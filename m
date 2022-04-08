Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8974F9E17
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Apr 2022 22:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239450AbiDHUSy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Apr 2022 16:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbiDHUSx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Apr 2022 16:18:53 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 176F03852F8
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Apr 2022 13:16:49 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id q14so12831763ljc.12
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Apr 2022 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hi6N/3Gfly/aeQxX3MNYeA6tcKASZ5qO4cZ7KqJIS/I=;
        b=V0ukmsZGOjGOJiK2b7BnIWsCcnQz90DZY0k0Ghi1mnlZjFg4vYu+WVtOBKplk0aPNb
         xSGPQdBQhqDhDebvMNWrLmYSy5rpw3uCbI5QPDvDX6Kow7dr5eZIKOjXuM7UbjVGt0Zx
         S2Zw9t/zTMIieUJbua+eXbgDDgUvbjFuvCWzHSdSLGQTZq8lwr1unU2LghD0WiCIDEnI
         rJE0PEDvgKb597saf9fl2Xaws1w8ty1pn1TNAPpD0e7tYwekQWJy3BhEwXX+KpOqonaz
         dlsyTLjJFzKuzHKY5eCC7Q6KTahmxRskQHmglGk/DuHMe2vlLsvZpXe0eb5vq74jj6W4
         ZhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hi6N/3Gfly/aeQxX3MNYeA6tcKASZ5qO4cZ7KqJIS/I=;
        b=MTaJyqFxc307b+oBLmhfSqPWgKX9vtfuOkcYkDitxRfv/i8+zidnHBLZOt+61v+EDc
         6ZCR/I5DSX5u+bNRUmaBIHlbrwfv2J/EbQc4Jniwgh1whXiVHRJHlIXcqQlrvLgBuhEb
         g70J/L0uNqFvqt+n8EucJOi7u/lTXF8VY6lwmjIxljhustfWC7SKQ9/aSSG8G5hByQrj
         7mNltyXHy68Fh9Y17qsJQsk4gcHgykNdmJJNR3M8BbF6h08myMfzPbXuyA0bdy5O5vJy
         GOk78SwsAKxRYa61zQFaG197HSYKnuYCbHtBzkHzB5V8vhY0QJ5wMz6/DX1oToqvz1H+
         5wjA==
X-Gm-Message-State: AOAM532f/Ek8z1U1YXAMiIoApYPv2ls1L/YKq/xy/ZBJgEdkjZ0eZvDu
        TBVdWtE/W8JoRWgTacgKcd6Ku5E1/DkKRRiDvDCafA==
X-Google-Smtp-Source: ABdhPJxXE2J6V1LtwHStnWObudn7sZJkA3RyGvTh47b5fBJtNaOCCD2wLzJjsH7fCMEEf13m5ow672e7a9MeMnNyfTQ=
X-Received: by 2002:a05:651c:555:b0:24b:15b7:74ad with SMTP id
 q21-20020a05651c055500b0024b15b774admr12420671ljp.239.1649449006497; Fri, 08
 Apr 2022 13:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <7fad83ecde03540e65677959034315f8fbb3755e.1649434832.git.jpoimboe@redhat.com>
 <CAK7LNARvFcQgEB1b0L6giwx0vD7wU9L-OZ5jvm1c5+StLjeOYQ@mail.gmail.com>
 <YlCJm8iQBPSOWIT5@hirez.programming.kicks-ass.net> <CAKwvOd=2xeZOg+0HosLPgCegKZxe7F-Cprw0MjOiWf2q=AbNDQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=2xeZOg+0HosLPgCegKZxe7F-Cprw0MjOiWf2q=AbNDQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 8 Apr 2022 13:16:35 -0700
Message-ID: <CAKwvOdkKx2vjJc5zxBicYSvSgKKFdpd_HsS-2k9Vwfpni_WNvA@mail.gmail.com>
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
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 8, 2022 at 1:08 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> Lore thread start for newly cc'ed ML readers:
> https://lore.kernel.org/lkml/7fad83ecde03540e65677959034315f8fbb3755e.1649434832.git.jpoimboe@redhat.com/
>
> On Fri, Apr 8, 2022 at 12:14 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > This weird option is having us upgrade quite a few 'inline' to
> > '__always_inline'.
>
> As is, the assumption that __init functions only call other __init
> functions or __always_inline is a brittle house of cards that leads to
> a "what color is your function" [0] scenario, and leads to code that
> happens to not emit warnings for compiler X (or compiler X version Y).
> There's also curious exceptions in modpost that look like memory leaks
> to me.

These assumptions perhaps made more sense in a world prior to
commit 889b3c1245de ("compiler: remove CONFIG_OPTIMIZE_INLINING entirely")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=889b3c1245de48ed0cacf7aebb25c489d3e4a3e9

(I view 889b3c1245de favorably; perhaps this whole thread is just
fallout from that change though.  It's also interesting to note that
CONFIG_OPTIMIZE_INLINING was enabled in the i386 and x86_64
defconfigs. That might color some folk's experience with the use of
`inline` in the kernel sources and whether "inline means
__attribute__((always_inline))").
-- 
Thanks,
~Nick Desaulniers
