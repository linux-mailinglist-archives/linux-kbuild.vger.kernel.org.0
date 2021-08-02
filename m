Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8A93DDECC
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 19:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhHBR5e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 13:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhHBR5d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 13:57:33 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB835C061760
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Aug 2021 10:57:23 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id r23so24922153lji.3
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Aug 2021 10:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nC4XJjZxwv8aF5TNChowkvDDxD3oEPmG8mUjf+O0H8s=;
        b=Bv1bENRmbv77G0zlvzeppM5C9cGDmcnQl8w1qBdRDaS3Bp/AdLG85BA0MofvpAdSkr
         iuV+N8AHiv0AitraGxDfohU5y150b67aoXHHWgpdARfXeLMv1mpIa0608MUZiU65h14+
         /yS5MPBRheSQecKzE4Dtf4Kwlrt2r8zSGLTNlpRpsOPgoJVLEEEViCr7ztZB4VNb/MTF
         jO1zBfW9AMPa2y9TNJWJFV5YsGrPPA8qfW/VAx4vL+Ffe8X9lOsAu9Xk6kFxiHw57ZLR
         XMXJYxWQCoYnd9sDj6jgJGySVAHOZe6FW6EOFd2OOnN6nkn6jqMKXiGU3z4+UFXLNCVn
         MXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nC4XJjZxwv8aF5TNChowkvDDxD3oEPmG8mUjf+O0H8s=;
        b=UZ37bZccpo3MhR8n0n9Q6fKMqkgLcl1j1ChOGB7hrjCntWjrNXQLrptrtD6W6DWN1Z
         Y3pB7/bkUTC2AQ7yMeHVb0CHpzAMbPsQdNlmTDuZo9NlzLxFk8242+Q7/cvKCVKzrLt9
         leNA6wdi8ozVdr+Es7LYjoXSOpS7fBeLyL+3sVMHQrIHgqOVAhc6SQWp8LH81UJ+QbsS
         K12L36fAyTCLT60Y+yIobRLgF3F9bW95NZbJFs9+kxWPZhgqlOzXQtxz7NNj2h/3vOnS
         OyfagE3w+gQ8b9fyvNbErqh46E3wf77aLSbBw9fe8FBXntFb7CJMoJH8EGfYBiSOmbrp
         40Eg==
X-Gm-Message-State: AOAM533ckh+rDZDyXrY+mcQnQSmCcZiv/uAf6BT8mPGGsPsZXTAaC+t8
        cnBRJwuqWens0Um9/naL7tjS+zCYXOde3p2sceHEog==
X-Google-Smtp-Source: ABdhPJxJX5UV6Q1jw6LGoOAi8fJakoYrnRfMcUjHinAjv9Plca7Uqua7fo6o0CZEgbjoTwfOxAoXmuAfYWikPQ9hCkM=
X-Received: by 2002:a05:651c:38f:: with SMTP id e15mr758845ljp.233.1627927041797;
 Mon, 02 Aug 2021 10:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210730215708.276437-1-ndesaulniers@google.com>
 <20210730215708.276437-4-ndesaulniers@google.com> <20210730231252.r6fi6c3i6obbcgfi@google.com>
In-Reply-To: <20210730231252.r6fi6c3i6obbcgfi@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 2 Aug 2021 10:57:10 -0700
Message-ID: <CAKwvOdnK=SUm1_--tcLRO3LVeXd_2Srfv2tsZCUW0uXXa1W_pg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] Documentation/llvm: update CROSS_COMPILE inferencing
To:     Fangrui Song <maskray@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 30, 2021 at 4:12 PM 'Fangrui Song' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> On 2021-07-30, Nick Desaulniers wrote:
> >As noted by Masahiro, document how we can generally infer CROSS_COMPILE
> >(and the more specific details about --target and --prefix) based on
> >ARCH.
> >
> >Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> >Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >---
> > Documentation/kbuild/llvm.rst | 17 +++++++++++++++++
> > 1 file changed, 17 insertions(+)
> >
> >diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> >index b18401d2ba82..4292f0686316 100644
> >--- a/Documentation/kbuild/llvm.rst
> >+++ b/Documentation/kbuild/llvm.rst
> >@@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
> > Currently, the integrated assembler is disabled by default. You can pass
> > ``LLVM_IAS=1`` to enable it.
> >
> >+Omitting CROSS_COMPILE
> >+----------------------
> >+
> >+As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
> >+
> >+Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> >+``--prefix=<path>`` to search for the GNU assembler.
>
> and the GNU linker.

Sure, I'll add this, but wanted to note that generally the compiler is
not used as the driver for kernel builds; the linker is invoked
directly. IIRC, there were a few spots where the compiler is used as
the driver; I think some of the various VDSO's are still built that
way, but it's not common.

>
> Reviewed-by: Fangrui Song <maskray@google.com>
>
> >+If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
> >+from ``ARCH``.
> >+
> >+That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
> >+
> >+For example, to cross-compile the arm64 kernel::
> >+
> >+      ARCH=arm64 make LLVM=1 LLVM_IAS=1
>
> Is  ARCH=arm64 make LLVM=1 LLVM_IAS=1
>
> preferred over
>
>    make ARCH=arm64 LLVM=1 LLVM_IAS=1
>
> ?

Will respond to this against Masahiro's reply.

-- 
Thanks,
~Nick Desaulniers
