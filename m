Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B102B6E97
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 20:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgKQT0R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 14:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgKQT0R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 14:26:17 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66D2C0617A6
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 11:26:16 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id gv24so1009437pjb.3
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 11:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QKqRulGkV2LShhH9uPn88VjpNW5CZTHrE9JvGus3Oq4=;
        b=rc7d6RpVSCFKI0Sw1a4e96tqeXAAx3vGFZlWfh7LaDZz9RDWtKddRpHbPhv1joM4Y+
         t7pJjDUE0QhMKmq3jkCns/Rs9IwuVlU83i1zJcRBfFMhEXWqAh9l7JmFmF6Jf2kbY9kf
         w9mHbaHaccZUY2g2OEHwM/bHf6kcnqnd8QjLEgtebYolgrVfOpbo5I/7OzBsFV50ot/f
         xiU4LIEg5oN3tHO+0kX9dQSg3okg9baFJjgsqoaOKnIDH2Fj+I9H7eBFdptO7Qt79jqa
         eEbI+u0+d4sY5nLNci8l5tEVRwB9KfeHIgKE+2R05EUjiEYls+lPVgyW5KRstQhnOsrI
         xXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QKqRulGkV2LShhH9uPn88VjpNW5CZTHrE9JvGus3Oq4=;
        b=eT9GlHvhYQ9+uwym+rd8NfgrGBjtldCdbUFdd8RDz0PDQi8ziKJAn6w2Y95VYJewAC
         9qNV2gBJ0LnbU6s/blmO8UnLcsLBcCR6op5ZNiaSn+TMkN7KFaYpRhC/JrP2K3lLlOMO
         JA2OM8p31uMzN5dphwkWBgyp5KXckRvD/DPL7Bj+CCXg0XSQJUXY+zKbf0BDaYXLJo6c
         eWRrHQ9z7Qksj6i/qEnINBOyoN7cvZThpikstUKetPaW/g+9ABOc6w4CBpcuhxwkIvPn
         e9fdcOmPfHKwvwo8QmHwTkxu0Cdb9QmdNNN5oV5+ubk3fv9ASbLeRS7h21PanpXcTlLC
         B5FQ==
X-Gm-Message-State: AOAM533+tYaa8fmvXKojIbLTS0few7W9S6Wjv5nk/FFMi0xXPNIfQ33p
        TiR2qvfHqI+54CBKiUPqAEErYgpfz9A2sfzjEfBbtw==
X-Google-Smtp-Source: ABdhPJzP+4QKYAkg72V6rtkdqvhBULrrFPf48iQQXuByQ+8n8CY8f02CDItGHV1Pop+VXIorLkJaUVOuAP+DkTwZCiw=
X-Received: by 2002:a17:90a:4881:: with SMTP id b1mr595006pjh.32.1605641176219;
 Tue, 17 Nov 2020 11:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <CAKwvOdnf5WKJrLnwM9dDDniP0eG5gnFSMB0rapqWLUAZbVJZvQ@mail.gmail.com> <20201117015438.GA299247@ubuntu-m3-large-x86>
In-Reply-To: <20201117015438.GA299247@ubuntu-m3-large-x86>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 17 Nov 2020 11:26:05 -0800
Message-ID: <CAKwvOdmDY=rZDuyjAdXQ9ukms_356mw0wovpxVUJ9Jvz9hEG_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 16, 2020 at 5:54 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Nov 16, 2020 at 05:41:58PM -0800, Nick Desaulniers wrote:
> > On Fri, Nov 13, 2020 at 11:56 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > Currently, '--orphan-handling=warn' is spread out across four different
> > > architectures in their respective Makefiles, which makes it a little
> > > unruly to deal with in case it needs to be disabled for a specific
> > > linker version (in this case, ld.lld 10.0.1).
> >
> > Hi Nathan,
> > This patch fails to apply for me via b4 on next-20201116 due to a
> > conflict in arch/Kconfig:1028. Would you mind sending a rebased V2?
>
> Hi Nick,
>
> This series is intended to go into v5.10 so rebasing it against -next
> defeats that; please test it against v5.10-rc4, where it still applies
> cleanly. The conflicts will be handled by other entities (Stephen Rothwell
> and Linus).

Got it.  Yeah, applies fine to v5.10-rc4.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Feel free to carry those with MPE's suggested change added.

>
> If you want to test it against -next, 'git am -3' will allow you to
> easily handle the conflict.
>
> Cheers,
> Nathan



-- 
Thanks,
~Nick Desaulniers
