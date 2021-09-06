Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB59402103
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 23:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbhIFVKc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 17:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbhIFVKZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 17:10:25 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C73C061575
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Sep 2021 14:09:19 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s12so13229268ljg.0
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Sep 2021 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MpoW7+4bCye+SeExcKZK2eoEgcuVbF8tuM5mlM4JK9M=;
        b=iY3QXx/8LAgnq6Y5Josw+UIssquPRTay+X0/utkiPhEcU14USp+B0Ws3YtjZ2fQ5+S
         T1yNNfFL0tHpFVuVOkaS8hui5kRcMxONlYEC4/VNoUbZbWBEghFQo3qy8mhu7FY/5ByJ
         NQfz2k8q7ae0m+2pgo10RQ+f9SRxmF13xXJAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MpoW7+4bCye+SeExcKZK2eoEgcuVbF8tuM5mlM4JK9M=;
        b=PpDw0vqNCeREUO3bSX5R6x3FpArcBhEtbfkoZ5/HM3xaICOQZZhqgCcQQlnhTkJrgf
         7w2V2lcVcW0Tnb/WBuO2bc687u3Y+kSUwjxoRLFLMZYAZrluUWpzocjURkEli+PcnTxJ
         CqRVhxWHsKJkHZ78Uj2GBdqcBNIhXZR1Fw+g2uu6+GaieDqJCFJ3i3PwgJD0x3XaUMH2
         KYxnK+b2KrJ2si4czPwZ/nEU9TEXLRtfvJ6QBYuaeKUx0sDuxrH08Xx221IfybfbDGgS
         raAoTfUG5ViYCoq+H1WIgbcyrKKlkhycJembRf7yN+JuWB+sAx6X1aY0nqtFUKFgNHE7
         qg5g==
X-Gm-Message-State: AOAM532x/GAVKHlVglO4p7dmSntzf0aimGwCLaEWhicMavf3VfP1EUcc
        WCqfcushRuTgPYeKuZXDZWHa8gJh1ZjzZaED
X-Google-Smtp-Source: ABdhPJxo0ZVK7xk8YTdEltGEcZp7E9KWWDVIaEQavoJ8PJ0g6ECW+YzTpSRnTw64xHW4Ztm+WuWq0g==
X-Received: by 2002:a2e:509:: with SMTP id 9mr12464030ljf.453.1630962556668;
        Mon, 06 Sep 2021 14:09:16 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id n5sm1198329ljj.97.2021.09.06.14.09.14
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 14:09:14 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id y6so13175237lje.2
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Sep 2021 14:09:14 -0700 (PDT)
X-Received: by 2002:a2e:8185:: with SMTP id e5mr11756332ljg.31.1630962554175;
 Mon, 06 Sep 2021 14:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <871r644bd2.fsf@oldenburg.str.redhat.com> <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
 <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
 <87lf49wodu.fsf@oldenburg.str.redhat.com> <20210906194808.GY1583@gate.crashing.org>
 <20210906201432.GZ920497@tucnak>
In-Reply-To: <20210906201432.GZ920497@tucnak>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Mon, 6 Sep 2021 14:08:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
Message-ID: <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To:     Jakub Jelinek <jakub@redhat.com>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>,
        Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 6, 2021 at 1:14 PM Jakub Jelinek <jakub@redhat.com> wrote:
>
> the only guaranteed APIs are
> those provided by the headers (x86intrin.h/*mmintrin.h etc. on x86,
> arm_{neon,sve}.h etc. on arm*, ...)

You guys realize we don't use those, do you?

And you don't seem to realize that you are actively arguing *AGAINST*
what you think you argue for.

That "immintrin.h" file, for example, is simply not usable for the
kernel. I just checked.

Why? Because it ends up doing exactly all those things that MUST NOT
be done for the kernel.

   In file included from
/usr/lib/gcc/x86_64-redhat-linux/11/include/xmmintrin.h:34,
                    from
/usr/lib/gcc/x86_64-redhat-linux/11/include/immintrin.h:31,
                    from t.c:1:
   /usr/lib/gcc/x86_64-redhat-linux/11/include/mm_malloc.h:27:10:
fatal error: stdlib.h: No such file or directory
      27 | #include <stdlib.h>
         |          ^~~~~~~~~~

Oops.

And no, it doesn't work trying to include some specific avx2intrin.h
file either:

   /usr/lib/gcc/x86_64-redhat-linux/11/include/avx2intrin.h:25:3:
error: #error "Never use <avx2intrin.h> directly; include
<immintrin.h> instead."
      25 | # error "Never use <avx2intrin.h> directly; include
<immintrin.h> instead."
         |   ^~~~~

Very similar things happens if you try to use that <stdint.h> file
that somebody mentioned earlier.

Guys, you don't understand how limited the kernel header files are - on purpose.

You also don't seem to realize how hard it is to separate out the
user-land crap that we really cannot use, and must not use.

And you think that we're making it harder for compiler people, but
that's not at all the case.

You really don't want to deal with us saying "you can't do that" when
you do something that is

Yes, <stdarg.h> has historically worked for us, and it's pretty much
the only one.

All your arguments about how people need to use the standard headers
are basically worthless, because you have never actually tried to use
them in a standalone project, have you?

So just face it - stdarg.h is special.

And it's not clear that there's any reason why the kernel should
include the one that comes with the compiler, when the kernel cannot
use any of the other header files that come with the compiler anyway.

And ALL of your arguments about how we must use compiler header files
are COMPLETE GARBAGE, because you didn't even look at them, did you?

See?

So stop making arguments out of ignorance. Because that's literally
what you are doing. You've never tried to make those header files
standalone, and you don't have any idea of how nasty it would be if
you were forced to.

               Linus
