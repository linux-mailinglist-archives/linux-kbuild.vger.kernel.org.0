Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06ECB27324E
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Sep 2020 20:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgIUS6c (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Sep 2020 14:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgIUS6c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Sep 2020 14:58:32 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9889C0613CF
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2020 11:58:31 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z22so19235575ejl.7
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2020 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rrEufNVuY5dCBzinzTyZLnRAK6NDit4k748EnZ9ZGyU=;
        b=VwM6SxPchzpHYvDq5MuGqptnfOCO+2u8UOZQsUHmvXP+yQTF+Z7wlraeVtjd/s9jlB
         wV193ZvJeoHSX0mG5NaEp1P+oe7FoNjVRmUSb2Z+JinKsMwFIqn+MpalsijQarctvj4U
         FH4y6mRhga1p9JKtJgLYS2O01gvN0JoRMzpIJ8sTPjHm+K3XvxLJoxyawOroxTt3ewXo
         2erVwwtPxW6qCdmd6A02Wa5wSMbzwpQ/xA7DOELk4+u1Yv0Dw6Gb0gPjk1AInJx+Npb8
         9g541oYiyMOVYQWN0p1s+dSK+qehJVoUb8ZcAzai39YkrQsAMRZIWHvBa3cE/5jkadoT
         Dtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rrEufNVuY5dCBzinzTyZLnRAK6NDit4k748EnZ9ZGyU=;
        b=pNl4QrYE4N0YuZ0qT3cCZbzy8gsjST7bmGmjInT4ohs6CMm2rjOFslx5KQwD5EvOyH
         ZEeQwyXgVuA0bg3zfXVQkyOGqeAKw0p1FtwKjxazWckOzzRZwIF3AJUNu/KtbXvhUb/S
         tIegKmMFzLr9hcNkDABS0BJZigaQoFu0/1tIRJybjWIMgnr1Ve1+MlGPrPozMvjEADZ1
         E7BoMvSEjYPrhGRTVs4fitmSFj64drAjkraujcMsy8Ew65wUsNcAxkE9JH9OWcfnlpdc
         yYnDw7DnNXdJL6nnHACO6egEph+r8itw9KVJLeRxYYAV4vxdfufNtMfgg6v/n7S16KSn
         Eemw==
X-Gm-Message-State: AOAM533kktpXmIJnC+uKp46yIUdU9X34is4NKF4aNrJB30v/A8kGYYzL
        QsAm7W0wYkcukz26fJtgeWEBZFXVaZpKsAx8wqrquQ==
X-Google-Smtp-Source: ABdhPJwAs9ksH6re9qMXbI2fsKP5Ghj4mOoCzkBFQS+BQszgLy1pqKFO8fFSdMFWe7XQ/UpW1tcdUlWla4BBqoqymc8=
X-Received: by 2002:a17:906:ecf1:: with SMTP id qt17mr960026ejb.158.1600714709946;
 Mon, 21 Sep 2020 11:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
 <20200918201436.2932360-14-samitolvanen@google.com> <202009181427.86DE61B@keescook>
In-Reply-To: <202009181427.86DE61B@keescook>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Mon, 21 Sep 2020 11:58:19 -0700
Message-ID: <CABCJKuf5pKqEDaAKix5CaUmv92M5HOAB-psdNg=awF7BDZ+yvA@mail.gmail.com>
Subject: Re: [PATCH v3 13/30] kbuild: lto: postpone objtool
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
        X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nick and 0-day bot both let me know that there's a typo in this patch,
which I'll fix in v4:

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f7daa59ff14f..00d7baaf7949 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -223,7 +223,7 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp
-nostdinc                    \
 objtool_args =                                                         \
        $(if $(CONFIG_UNWINDER_ORC),orc generate,check)                 \
        $(if $(part-of-module), --module,)                              \
-       $(if $(CONFIG_FRAME_POINTER), --no-fp,)                         \
+       $(if $(CONFIG_FRAME_POINTER),, --no-fp)                         \
        $(if $(CONFIG_GCOV_KERNEL), --no-unreachable,)                  \
        $(if $(CONFIG_RETPOLINE), --retpoline,)                         \
        $(if $(CONFIG_X86_SMAP), --uaccess,)                            \

Sami

On Fri, Sep 18, 2020 at 2:27 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Sep 18, 2020 at 01:14:19PM -0700, Sami Tolvanen wrote:
> > With LTO, LLVM bitcode won't be compiled into native code until
> > modpost_link, or modfinal for modules. This change postpones calls
> > to objtool until after these steps, and moves objtool_args to
> > Makefile.lib, so the arguments can be reused in Makefile.modfinal.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> Thanks for reorganizing this!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/202009181427.86DE61B%40keescook.
