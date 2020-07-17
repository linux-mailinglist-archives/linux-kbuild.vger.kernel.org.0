Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3252241C9
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jul 2020 19:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgGQR21 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jul 2020 13:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgGQR20 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jul 2020 13:28:26 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548C8C0619D4
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jul 2020 10:28:26 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id dp18so11650480ejc.8
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jul 2020 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7JTqB5slGWNqmPcHQg0gX2jPDhSmZshqLrbRwDwrvQQ=;
        b=qkRGYkOMW6VaoakdKRVaH5aUrXdmDg5t9er9/Vce66oxkl7UQqyWYOlRwXYeCpY3wW
         oGZLkqSMQcsYzJrQM1bl4jbPOH2ds+18vciyXIQPsIh7FHOEiWMHb+FbQPOAzmUtYx0d
         jAFb5ZBiJf1OgEZsVfnTqp9/tGZUXdX3DMpkRciQc7dzdFZjMmS+H+DJQfvlr/CrsaXE
         bH5rENTcwdmpjUlk5dB0JCsW5u+aaktYFW19sQYPYsWpe/3Pe/7RQhyb4jz0/LEW2lX3
         sL4OLuZO05Zi99C6TpMJZ+BigM//cBFejkcKoMvjeBR4jPKuIlKROtzMLgdkDvKya0hC
         pOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7JTqB5slGWNqmPcHQg0gX2jPDhSmZshqLrbRwDwrvQQ=;
        b=JELq5jcDO1ukUiks6i1Uf0WPzM9Cq+DHgtFVa7MjtQKV1C5y4o8TkSKANN/sJc8bxt
         TDaS79E0Ec5Bdte5yHt0ppJkc2zQ+v6ihnMIicHx3glW0wBI/PUw00YB0hHYCySQD271
         Ztul4MXPa0p5b+zt2WTUkj/AX2qRD7HGdb7nWU9gRtifC3uXNphJzTioHQ5gLyZKujGF
         9MdPVI7qbdkCLaUsDyQjkYgUti0Bc4So1Nthplc6LK6XpvEDK2HKSQ2SxoWi7EJTt40Z
         09vh5ropTwJetG8F0+ORtZQZY90t+iQxYLkVmW7PrLH75KObxCpZgJLaVEy67A0p2yyX
         whnA==
X-Gm-Message-State: AOAM532NZA4+eWehzIt+YO+oCrGhz9oCE5Xx82/0JSWfHKkSN56BndHE
        EXDavN2BIZAVplVrZWdEvJsBUzpRjAmmOhIXFdg92A==
X-Google-Smtp-Source: ABdhPJzlaBMxTWwrZe4YERy10lN7ECFDWF6Vu5QVaYVW+Htu2uWuMYN38XkknSqycX+o/PgPMS9zy6pkp2BhDOPkYdc=
X-Received: by 2002:a17:906:eb93:: with SMTP id mh19mr9298900ejb.552.1595006904583;
 Fri, 17 Jul 2020 10:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200624203200.78870-5-samitolvanen@google.com> <20200624212737.GV4817@hirez.programming.kicks-ass.net>
 <20200624214530.GA120457@google.com> <20200625074530.GW4817@hirez.programming.kicks-ass.net>
 <20200625161503.GB173089@google.com> <20200625200235.GQ4781@hirez.programming.kicks-ass.net>
 <20200625224042.GA169781@google.com> <20200626112931.GF4817@hirez.programming.kicks-ass.net>
In-Reply-To: <20200626112931.GF4817@hirez.programming.kicks-ass.net>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Fri, 17 Jul 2020 10:28:13 -0700
Message-ID: <CABCJKucSM7gqWmUtiBPbr208wB0pc25afJXc6yBQzJDZf4LSWA@mail.gmail.com>
Subject: Re: [RFC][PATCH] objtool,x86_64: Replace recordmcount with objtool
To:     Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
        X86 ML <x86@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
        Matt Helsley <mhelsley@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 26, 2020 at 4:29 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Jun 25, 2020 at 03:40:42PM -0700, Sami Tolvanen wrote:
>
> > > Not boot tested, but it generates the required sections and they look
> > > more or less as expected, ymmv.
>
> > > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > > index a291823f3f26..189575c12434 100644
> > > --- a/arch/x86/Kconfig
> > > +++ b/arch/x86/Kconfig
> > > @@ -174,7 +174,6 @@ config X86
> > >     select HAVE_EXIT_THREAD
> > >     select HAVE_FAST_GUP
> > >     select HAVE_FENTRY                      if X86_64 || DYNAMIC_FTRACE
> > > -   select HAVE_FTRACE_MCOUNT_RECORD
> > >     select HAVE_FUNCTION_GRAPH_TRACER
> > >     select HAVE_FUNCTION_TRACER
> > >     select HAVE_GCC_PLUGINS
> >
> > This breaks DYNAMIC_FTRACE according to kernel/trace/ftrace.c:
> >
> >   #ifndef CONFIG_FTRACE_MCOUNT_RECORD
> >   # error Dynamic ftrace depends on MCOUNT_RECORD
> >   #endif
> >
> > And the build errors after that seem to confirm this. It looks like we might
> > need another flag to skip recordmcount.
>
> Hurm, Steve, how you want to do that?

Steven, did you have any thoughts about this? Moving recordmcount to
an objtool pass that knows about call sites feels like a much cleaner
solution than annotating kernel code to avoid unwanted relocations.

Sami
