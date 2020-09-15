Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F82326AC5F
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Sep 2020 20:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbgIOSoU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Sep 2020 14:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgIORdK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Sep 2020 13:33:10 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DE4C061788
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2020 10:32:42 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id y25so966321oog.4
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Sep 2020 10:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PAtDVfuEJhlt1elf5/lgoBo+0AnWtv6A1Q7VC77Ff04=;
        b=d0JaJ9en3sRyhoZPnW1QJJsxEdsVuPco3gIwh9SOrfnk19I2FwZ7GOdGlPhvQTrY1k
         txY0wp2cgnvWub0vDpMs/MJk8Pu0yM9YHo71bPPgXGTmrj9nzguJi8qtik3HijV58bFt
         d2O3luG/WR9UWz1jRPucM/caqSWmjD+RDDJXnr1xoFcys3qOaGdlWvq4ZmxcVwZrx/uI
         ozBsIng1hGBF00/o2vwNEvqKXH5n+W0odVBB5j6WYIu+mwKz8DADLNADAd9ic1lxeC/z
         G1T+PpfVFVmx/i24SgJG/1ndRmiiK8yYYYDVKwOqn1uak0gt53v94/41Wg3i8R6SJtn0
         JVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PAtDVfuEJhlt1elf5/lgoBo+0AnWtv6A1Q7VC77Ff04=;
        b=b9B3nfE3hvLn1QcglAhupWlExBP64gJLoYG317rQvZcSuUNIf5oqmMiyJlozE1vC0t
         /VGAB708kKAuNmyRYkQQwlXDdjNN12bErx3n/J/T/+ZuwlZ9JNO2HjH/FNDq8f+dhz9V
         JP5Y6rukqjeW/iDWtf54oI12PrGVXQCM8eH+qMrbopLThDKLOMtRilG6UXHENuD/Dw3V
         vauif2hvc0U1CRT5stGkwtBzcf5RTEq37kesSsOE9T+vTPiOA6bmGOyFKMogX4/xPdh1
         MyRGy12RWA8WsB9GYRHfNE/CJPN8xejWcK+uNyZjEAwQiwDpUBRJ+yN+oROe62JVZqI6
         BpVA==
X-Gm-Message-State: AOAM5303qWlboe4NjaRJ8Rpl2/HlMynjOFevYlIumO+8z/u3W1rlpjuX
        N6cqkmSnDFW9UnbovCURq0r9cbWeRJfKA4IC6hiCcQ==
X-Google-Smtp-Source: ABdhPJyCzInxRpJlSmxXfBdbgreenCQjI8gKUscz7zGArVGzNAylhuh/sQNja0PJx+ORauOO7/zkeU7+nZkaJKmgHdU=
X-Received: by 2002:a4a:751a:: with SMTP id j26mr14993283ooc.14.1600191160831;
 Tue, 15 Sep 2020 10:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200914172750.852684-1-georgepope@google.com>
 <20200914172750.852684-7-georgepope@google.com> <202009141509.CDDC8C8@keescook>
 <20200915102458.GA1650630@google.com> <CANpmjNOTcS_vvZ1swh1iHYaRbTvGKnPAe4Q2DpR1MGhk_oZDeA@mail.gmail.com>
 <20200915120105.GA2294884@google.com>
In-Reply-To: <20200915120105.GA2294884@google.com>
From:   Marco Elver <elver@google.com>
Date:   Tue, 15 Sep 2020 19:32:28 +0200
Message-ID: <CANpmjNPpq7LfTHYesz2wTVw6Pqv0FQ2gc-vmSB6Mdov+XWPZiw@mail.gmail.com>
Subject: Re: [PATCH 06/14] Fix CFLAGS for UBSAN_BOUNDS on Clang
To:     George Popescu <georgepope@google.com>
Cc:     Kees Cook <keescook@chromium.org>, maz@kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        james.morse@arm.com, julien.thierry.kdev@gmail.com,
        suzuki.poulose@arm.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        David Brazdil <dbrazdil@google.com>, broonie@kernel.org,
        Fangrui Song <maskray@google.com>,
        Andrew Scull <ascull@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 15 Sep 2020 at 14:01, George Popescu <georgepope@google.com> wrote:
>
> On Tue, Sep 15, 2020 at 01:18:11PM +0200, Marco Elver wrote:
> > On Tue, 15 Sep 2020 at 12:25, George Popescu <georgepope@google.com> wrote:
> > > On Mon, Sep 14, 2020 at 03:13:14PM -0700, Kees Cook wrote:
> > > > On Mon, Sep 14, 2020 at 05:27:42PM +0000, George-Aurelian Popescu wrote:
> > > > > From: George Popescu <georgepope@google.com>
> > > > >
> > > > > When the kernel is compiled with Clang, UBSAN_BOUNDS inserts a brk after
> > > > > the handler call, preventing it from printing any information processed
> > > > > inside the buffer.
> > > > > For Clang -fsanitize=bounds expands to -fsanitize=array-bounds and
> > > > > -fsanitize=local-bounds, and the latter adds a brk after the handler
> > > > > call
> > > >
> > > This would mean losing the local-bounds coverage. I tried to  test it without
> > > local-bounds and with a locally defined array on the stack and it works fine
> > > (the handler is called and the error reported). For me it feels like
> > > --array-bounds and --local-bounds are triggered for the same type of
> > > undefined_behaviours but they are handling them different.
> >
> > Does -fno-sanitize-trap=bounds help?>
>
> I tried replacing it with:
>       ifdef CONFIG_CC_IS_CLANG
>             CFLAGS_UBSAN += $(call cc-option, -fno-sanitize-trap=bounds)
>             CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
>       else
>             CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
>       endif
>
> The code traps.

What's your config? Do you have CONFIG_UBSAN_TRAP=y? If so, you have 2
options: honor UBSAN_TRAP and crash the kernel, or have a
'CFLAGS_REMOVE_... = -fsanitize-undefined-trap-on-error' for the files
where you can't deal with traps.

Thanks,
-- Marco
