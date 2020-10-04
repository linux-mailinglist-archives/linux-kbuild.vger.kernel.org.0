Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41210282B1A
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 16:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJDOJ0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 10:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDOJ0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 10:09:26 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF17C0613CE
        for <linux-kbuild@vger.kernel.org>; Sun,  4 Oct 2020 07:09:26 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id k6so6516262ior.2
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Oct 2020 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=i31xtu73b6W9mhjjYioVqO0cJaC19+bW1p3k2llhPN0=;
        b=uKegY6AoQXkKBbSzkZ/fJY0tP/R6wMJQ29mzfKfFYsG/fcIfp1NWs5u7rus9Cg9VDA
         qJkclabrG0PGH5hcdl682wfO1GmNrzkNH/9nq/NDOQHgC9P39eKnSNMf3uvtM6ITCcan
         QgDbr1FMPrBG1V0Pns34JvvZRw7B9v1JRWYWmfryuUApl09IVn4EOHMAJibQDd5vCVmR
         IhnilF3xPxQi671LacZAYQ8KB8EE5mMJH/b24/3ST5N+y2ukIU7sUr8jg+j/v0uThCwQ
         yNFpiqENmCFCyCUI4vB1IZcqb7wY6bNNlnRi38iLvoQZ70puTfEreHmKnxBQlYo82itn
         9uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=i31xtu73b6W9mhjjYioVqO0cJaC19+bW1p3k2llhPN0=;
        b=oUlcnTVihgHveS6HAiEpd04lI6nrOviVQtyu58l3AJyh9fb+cLfp48rmw69JwreRBq
         SiAHI/mWjMGOzPrpQz+GQWEj0PaBRU0MQfc7pcjm1HHelthJjCAKH/y4ItnVOd7WkcJI
         92j3yLuJgBOq1hX9exW+UeUo5uquGllLIHcrobLw47ie4rOw3A+uoVCI0kyIb6WnBUao
         gsi/WNgSOi5jTbA1pxMenxIrwPBM4NfU/ESfzHw1pua6FJ1fD6RULhVN5jNzzGNdZMgc
         Wb4SZAvVvFpceP4Qe3NVjyxH0SgoGEwip7K/t0c3sgl0uY83DHdMnsvdnEIdIj90vD+y
         6/Dg==
X-Gm-Message-State: AOAM5302HmBjkkMA1WvbsHMBJZkY8A1Bq5pegyzbTAnLmKbljQSVzsHP
        JaWTmWcLEPOJpmqcBu+L4srtx0w9kaJGXvNs0i4=
X-Google-Smtp-Source: ABdhPJyusvyxSyftvQBqCBrGssnqR/KdKxMgcxmvA99zg5hAE5ODiblO7iwn0iHGWzfjZWgbKGLwt8yZa5Fp2mvnPx4=
X-Received: by 2002:a6b:7c0d:: with SMTP id m13mr7690380iok.57.1601820565628;
 Sun, 04 Oct 2020 07:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUUss+XGHxtSXB3WaRLODdQ0-Ln03N45NUQ=QaP49O3e0A@mail.gmail.com>
 <CAK7LNARes+EEjue1ZNXZrKjWLjkv76NwEUyo_S6F3d=gni9XSA@mail.gmail.com>
In-Reply-To: <CAK7LNARes+EEjue1ZNXZrKjWLjkv76NwEUyo_S6F3d=gni9XSA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sun, 4 Oct 2020 16:09:14 +0200
Message-ID: <CA+icZUWAYBSmBBcBSkGso45n=jmehEv2SUxJ13kCqHF+Qi8yCw@mail.gmail.com>
Subject: Re: Linux-5.9: Remove CC_FLAGS_USING via asflags-remove
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 4, 2020 at 4:04 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sun, Oct 4, 2020 at 10:29 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi,
> >
> > I wanted to get rid of CC_FLAGS_USING in lib/Makefile:
> >
> > ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> > +ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_USING)
> > +asflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_USING)
> >
> > ...it makes no sense to me to remove CC_FLAGS_FTRACE and not CC_FLAGS_USING.
> >
> > ccflags-remove-y (here: CONFIG_FUNCTION_TRACER=y) seems  to work but
> > *not* asflags-remove-y.
> >
> > Am I missing something?
> > It is getting overridden?
> >
> > Documentation/kbuild/makefiles.rst says:
> > "...AFLAGS_$@ has the higher priority than asflags-remove..."
> >
> > How can I check if there is another AFLAGS_XXX interfering?
> >
> > I see -DCC_XXX in...
> >
> > lib/.crc-t10dif.mod.o.cmd
> > lib/.crc-t10dif.o.cmd
>
>
> This is compiled from a C source file.
>
> lib/crc-t10dif.c
>
>
>
> Why are you trying asflags-remove-y for lib/Makefile?
>
> I see no assembly source file under lib/.
>
> masahiro@oscar:~/ref/linux$ find  lib  -name  '*.S'
> masahiro@oscar:~/ref/linux$
>

Yeah, you are right it is a C file.

It looks like CC_FLAGS_USING is not "inherited" or passed or whatever.

I tried with "filter-out" and...

KBUILD_CFLAGS := $(filter-out -DCC_USING_FENTRY, $(KBUILD_CFLAGS)

....that resulted in an error:

need-builtin= \
need-modorder=1
In file included from lib/bug.c:50:
In file included from ./include/linux/ftrace.h:21:
./arch/x86/include/asm/ftrace.h:7:3: error: Compiler does not support fentry?
# error Compiler does not support fentry?
  ^
1 error generated.
make[4]: *** [scripts/Makefile.build:276: lib/bug.o] Error 1

So, it looks like I was wrong with removing -DCC_USING_XXX.

Thanks for the quick response.

- Sedat -


>
> > I want to remove all -DCC_XXX assembler-options derived from lib/Makefile.
> >
> > Regards,
> > - Sedat -
>
>
>
> --
> Best Regards
> Masahiro Yamada
