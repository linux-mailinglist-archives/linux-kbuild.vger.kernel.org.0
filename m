Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC590349D2B
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Mar 2021 01:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhCZADz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 20:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhCZADW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 20:03:22 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4A0C061761
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Mar 2021 17:03:20 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id w2so3181022ilj.12
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Mar 2021 17:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nAYo0kerZLUN7BkJOSM9MDyMbtqlP2Ebf5RZ2YCWYvE=;
        b=qn2P1c8qwafkNgsglrLTaTm7bLzpkRkiTLfJLGK8xTN4luzvlgNlv3PnwABJDfQ0NQ
         0MhNPSvMVr/plOe7Ep+dLmsOihehu2nGgPeyN2RbdvbPnZIvwEVVJSD7Nqa3+VU1CMVY
         o0FIODwO5enxaMXKwVTKlaroVBH0Jd861DVZ+KwZREziKZ3yaXyPNMBRw9A0ISQLY71R
         Pf8Dh4rEOPxN5r4WJCLgXkn7/y7WaU61B7NFXh3k6r4x5m2glFuCmtObmLcXH3tWXWOo
         wGSDfwu16SSwuzkoCrSQNFJxIa/kJ+sWs/QkDY0ZXFD1my/Q9T6i/h0IveTFSozVTfeM
         J7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nAYo0kerZLUN7BkJOSM9MDyMbtqlP2Ebf5RZ2YCWYvE=;
        b=DfVx73VCX6MJnBQ1kTjGCPIZ5dwWKXhobzH+byLEDq2b4Apr6tfAQ9lmIB7zg0k7GX
         WLYf+xdhmdcgiZcf7bxAz3qoiFTveq+MH59yXQYei68VAw13fk44WTw8RspTQsAVGL7h
         aq+/J3xkVWdpCNtnrEMbW/0WTPO8z+uGpftPnlcj1VPM2ZIaRHP8PJkLb2LSzuS6rXje
         oyf1jr9yc4dNmJ9PToS45q6ZdflOoVvg5lo1tSMP7Xkn0ar2wmMeTWYnh82JbZJXATkr
         zVr6Dfw4ZQzUZqi+qQwPyMEJPZW+I8Qhin0eIaLHjLVCl+s1mm3L8kgLJsYOxydj2LnH
         RFEA==
X-Gm-Message-State: AOAM532GOBhnyYecKAx4olYM6YVvDlV9YJrbkqw6zQZirIjfCYaqaO/0
        KFFiSXMbPN3B0kqhzubQXo1MQFtAGuM3a9W9qgODAQ==
X-Google-Smtp-Source: ABdhPJycYy1zKxJCALDiO9Ar9NLQb0Bxbm3WLrp/be6z8zC2ySSZc6pZUvOHR+zeKlLowgV0ewAnXJs41sU7Cs8VIoE=
X-Received: by 2002:a05:6e02:1b86:: with SMTP id h6mr8191233ili.145.1616717000105;
 Thu, 25 Mar 2021 17:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210323203946.2159693-1-samitolvanen@google.com>
 <20210323203946.2159693-13-samitolvanen@google.com> <20210325103757.GD36570@C02TD0UTHF1T.local>
 <CABCJKud_VC_vAn_7PdZzDja0gpk5ych0CBJpBw45pvivFoePgQ@mail.gmail.com>
In-Reply-To: <CABCJKud_VC_vAn_7PdZzDja0gpk5ych0CBJpBw45pvivFoePgQ@mail.gmail.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Thu, 25 Mar 2021 17:03:08 -0700
Message-ID: <CAMn1gO6EvzG0WtTyoARjuYhuPxPokVAMbqX-756XLOgRD6audw@mail.gmail.com>
Subject: Re: [PATCH v3 12/17] arm64: implement __va_function
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        bpf <bpf@vger.kernel.org>, linux-hardening@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 25, 2021 at 4:28 PM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Thu, Mar 25, 2021 at 3:38 AM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Tue, Mar 23, 2021 at 01:39:41PM -0700, Sami Tolvanen wrote:
> > > With CONFIG_CFI_CLANG, the compiler replaces function addresses in
> > > instrumented C code with jump table addresses. This change implements
> > > the __va_function() macro, which returns the actual function address
> > > instead.
> > >
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> >
> > Is there really no attribute or builtin that can be used to do this
> > without assembly?
>
> I don't think the compiler currently offers anything that could help
> us here. Peter, can you think of another way to avoid the function
> address to jump table address conversion with
> -fno-sanitize-cfi-canonical-jump-tables?

No, the assembly seems like the best way at the moment.

> > IIUC from other patches the symbol tables will contain the "real"
> > non-cfi entry points (unless we explciitly asked to make the jump table
> > address canonical), so AFAICT here the compiler should have all the
> > necessary information to generate either the CFI or non-CFI entry point
> > addresses, even if it doesn't expose an interface for that today.
> >
> > It'd be a lot nicer if we could get the compiler to do this for us.
>
> I agree, that would be quite useful in the kernel.

Maybe. The kernel's requirements seem quite specialized here though. A
normal C or C++ program has little need for the actual entry point, so
if you need it you are probably doing something low level enough to
require assembly anyway.

Peter
