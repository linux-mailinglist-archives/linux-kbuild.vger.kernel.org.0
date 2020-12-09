Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4D52D46B3
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 17:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731823AbgLIQ0G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 11:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730324AbgLIQ0G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 11:26:06 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F48C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed,  9 Dec 2020 08:25:25 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id q10so1175748vsr.13
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Dec 2020 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6iPujSFaRf63ICzfMH9y30wFs4tc+8uoN3o287lcAKc=;
        b=nzPpXpurtim/Xt5h6cpZ0FcvFvOqsIz73uPe8GdrX81v6Uzipkco7k/pVTqqXga/3b
         t+MHYk2nyM/C5LzuujzPgJdof9Lw0igpw+9YIzcLX2aV9A7LWZuzXeyuxEEk0n6rnxmr
         aB75dnMFiO0VIGfeysS0gVynJ82rbBrfZklB+Bzln+JpuyM1FmY2SW0AVlvT8AFlHmcv
         +k2dhUROuMIdDtrfh/AYyNOH6SNMuuXgt6E9DSBT8poKxOx/tZH9KA6OYlO1moFwCsec
         UN8w6J3OR3+Eg9iTGgpIl1yYNJAoycddhbXwnLvbb6Sd+NqVgZFEd0Hm1D7SxRunGlrN
         MppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6iPujSFaRf63ICzfMH9y30wFs4tc+8uoN3o287lcAKc=;
        b=C0rhEizHoBxz8wCscRcEQvsaQfHPRXKOLgNtBVMgyR1ovelpdMpiX4/sy1LplByvOV
         OO1ssVgzH3YawcBwZM/VFEnZ8w31xPAI37I0lO3Ezd5xN+CFB2wi6+4epRffUYIWRlUm
         cKnmukZh5kEVS71casFwDlW0izy71sb1BGuPzC4xSLIlMxmxrjrF8LZUc5Bq3oaG2B7r
         7e2GhQrJOsJEDOWkYljgseQgV+gt59FENa2FO0fZf4001ACex7OHoAMwwwfCZELW6lf0
         F1QYy2oobh8Hr2x0SHhsiZGf7tRVvl438AYCRVaZnI8P52Fg+a8m3A9MnwR/GozITr3U
         Y67Q==
X-Gm-Message-State: AOAM531t3wUUjgTGNqiKOYItDzB1Rcq5RQeD3uksBxvzNuS72sQrkJ3i
        o6JNG2GJrQbGBK+2lxiyuynL2nhHxn7gBZtTMqhDxQ==
X-Google-Smtp-Source: ABdhPJyTSS/IMLVSvJ+ApeZ9gBaaSGKG/HtQ8GyhKk+KWuIUDMry01JIQBMoQq94UvqMYjXmfFLduigKrpEFXyqQG0Y=
X-Received: by 2002:a67:2cc1:: with SMTP id s184mr2651932vss.23.1607531124951;
 Wed, 09 Dec 2020 08:25:24 -0800 (PST)
MIME-Version: 1.0
References: <20201201213707.541432-1-samitolvanen@google.com>
 <CAK8P3a1WEAo2SEgKUEs3SB7n7QeeHa0=cx_nO==rDK0jjDArow@mail.gmail.com> <CAK8P3a2DYDCjkqf7oqWFfBT_=rjyJGgnh6kBzUkR8GyvxsB6uQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2DYDCjkqf7oqWFfBT_=rjyJGgnh6kBzUkR8GyvxsB6uQ@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Wed, 9 Dec 2020 08:25:13 -0800
Message-ID: <CABCJKud7ZC7_rXVmrF5PnDOMZTJX9iB7uYAa03YF-dkEojnBxg@mail.gmail.com>
Subject: Re: [PATCH v8 00/16] Add support for Clang LTO
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 9, 2020 at 4:36 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Dec 8, 2020 at 1:15 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > - one build seems to have dropped all symbols the string operations
> > from vmlinux,
> >   so while the link goes through, modules cannot be loaded:
> >  ERROR: modpost: "memmove" [drivers/media/rc/rc-core.ko] undefined!
> >  ERROR: modpost: "memcpy" [net/wireless/cfg80211.ko] undefined!
> >  ERROR: modpost: "memcpy" [net/8021q/8021q.ko] undefined!
> >  ERROR: modpost: "memset" [net/8021q/8021q.ko] undefined!
> >  ERROR: modpost: "memcpy" [net/unix/unix.ko] undefined!
> >  ERROR: modpost: "memset" [net/sched/cls_u32.ko] undefined!
> >  ERROR: modpost: "memcpy" [net/sched/cls_u32.ko] undefined!
> >  ERROR: modpost: "memset" [net/sched/sch_skbprio.ko] undefined!
> >  ERROR: modpost: "memcpy" [net/802/garp.ko] undefined!
> >  I first thought this was related to a clang-12 bug I saw the other day, but
> >  this also happens with clang-11
>
> It seems to happen because of CONFIG_TRIM_UNUSED_KSYMS,
> which is a shame, since I think that is an option we'd always want to
> have enabled with LTO, to allow more dead code to be eliminated.

Ah yes, this is a known issue. We use TRIM_UNUSED_KSYMS with LTO in
Android's Generic Kernel Image and the problem is that bitcode doesn't
yet contain calls to these functions, so autoksyms won't see them. The
solution is to use a symbol whitelist with LTO to prevent these from
being trimmed. I suspect we would need a default whitelist for LTO
builds.

Sami
