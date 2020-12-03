Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315F52CDDFF
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 19:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgLCSsl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 13:48:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbgLCSsk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 13:48:40 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 879BEC061A4E
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 10:48:00 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id v8so1843424vso.2
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 10:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ah+rD4wk+k3lncQwfhIaQxiXkvEJG1Frpy4Nqe+0q0U=;
        b=SKhZH7li060XYzleaCahQbBQsMynLjFbQa3EhTv77mq3GHRmSi61KzLCOLC1Z4ksaj
         pSJDPGDFnV9Yx/X3ETP86ugtkVzY02GZAgoZstjnPNK8KrdI1fjRRRcqwKuLoZ+iGFnw
         Mfp9TStTmlP08QQnKRNmpPAPNNvtn/NE5MsBi6vL6DIXPVYtfI8exjpC70eIc1jAi6hr
         IWUJKbfX69GJkb8hVQ58bQnKSKy9x1UkfpKRekYoEUXT0JpoySwIrh8/YFahuMWMIznf
         +OWbSKuFcovO+Pj5wPAfXa07brxfPV5prt3FbyqI8tm/0XTPi+MmqG20rvrPzlHjF8XG
         lj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ah+rD4wk+k3lncQwfhIaQxiXkvEJG1Frpy4Nqe+0q0U=;
        b=b30yW/RnE+B45vpAwR2sxoggY2V1GgLM0hOYBQCqp8QuNVMSoa2LrE/WohUAAo2PBP
         77t26a+MsKFzmlaSkAMrKoIbhW1SrwyJjXjLftxPywEZxXf3kqhk/dtuBv/z0cdPrwIb
         8vpalxdsUL9AVHPjma1S6KWa2y6g6PD2s2qdp22W2Nw4meJnwe0iMdZBekEiaKeLS5gG
         p1mRFYxaBN/gitGpFNrrHTZ69irssVl1AnGwQwLGXo+1HZeWu1sEjoJ0FdZb/Q7e/SzO
         utKiTpfQs/XLf6D5D1gyneTjAviNpfkLKT77a3zxPhQjf4VoPDOk9WiKEldRstm9orW8
         tBnw==
X-Gm-Message-State: AOAM532zTwR70Wkm1b2XwLG5+DmSxEicjTNyJjR9rnand2Q07XhhEQEN
        ri6l7obkoH+EFZTQq+etpo3niweUJu3XwgZCpm3w+rIyM8sjfQ==
X-Google-Smtp-Source: ABdhPJwWZ3eYDNgK+tyHhs3o/e9jTvYAkoSVCUaRgclpcuqt9dH748zpq6nj5Jt+rgjXHu/FF8NKz82dnl1j7RfAePA=
X-Received: by 2002:a67:f74f:: with SMTP id w15mr696164vso.54.1607021279552;
 Thu, 03 Dec 2020 10:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20201013003203.4168817-1-samitolvanen@google.com>
 <20201013003203.4168817-15-samitolvanen@google.com> <202010141549.412F2BF0@keescook>
 <CAK7LNAT350QjusoYCQEHDdoxAfTZjj82xp86O1qoNF=0u0PN-g@mail.gmail.com>
In-Reply-To: <CAK7LNAT350QjusoYCQEHDdoxAfTZjj82xp86O1qoNF=0u0PN-g@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Thu, 3 Dec 2020 10:47:48 -0800
Message-ID: <CABCJKue4Gg7gGA3cgpP-uiThxR=5Qh2Pq+KctGJN_GtStpf9Fg@mail.gmail.com>
Subject: Re: [PATCH v6 14/25] kbuild: lto: remove duplicate dependencies from
 .mod files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>, X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 3, 2020 at 10:00 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Oct 15, 2020 at 7:50 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, Oct 12, 2020 at 05:31:52PM -0700, Sami Tolvanen wrote:
> > > With LTO, llvm-nm prints out symbols for each archive member
> > > separately, which results in a lot of duplicate dependencies in the
> > > .mod file when CONFIG_TRIM_UNUSED_SYMS is enabled. When a module
> > > consists of several compilation units, the output can exceed the
> > > default xargs command size limit and split the dependency list to
> > > multiple lines, which results in used symbols getting trimmed.
> > >
> > > This change removes duplicate dependencies, which will reduce the
> > > probability of this happening and makes .mod files smaller and
> > > easier to read.
> > >
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> >
> > Hi Masahiro,
> >
> > This appears to be a general improvement as well. This looks like it can
> > land without depending on the rest of the series.
>
> It cannot.
> Adding "sort -u" is pointless without the rest of the series
> since the symbol duplication happens only with Clang LTO.
>
> This is not a solution.
> "reduce the probability of this happening" well describes it.
>
> I wrote a different patch.

Great, thanks for looking into this. I'll drop this patch from the next version.

Sami
