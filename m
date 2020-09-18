Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46C1E270790
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgIRUx3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgIRUx3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:53:29 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264D0C0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:53:29 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id bw23so963231pjb.2
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iy3TQ3C1Ek23yK9GZJXs0daNRNetn5CYF4/zAE2h7ik=;
        b=KW2Q2zo+JFuYkr4TiNUBIe05OcRvez9oPhQD2VPO4rhQx4vr57iS+J6zydE3kkrQLF
         DI66mG3IeYuMnm30FYVw5h6Oxc9WygSHNlBMmug3nlJy8G1DUZ0juqx+QQnea9m7Gete
         ZlaTZ+Z/2TdOkps+Zf6K1JMQCJdPxK/x+hQD14J8YYA/+4YQfkWf+gJLTCmIge3scE76
         p3ygrRlm7Krhqb7M2JzcHo7FC2+dzmjQDXITtDjcCKKvClFY66fCZJuYnZ82RbA6pZTO
         Ed6GbIdgELybyBiBA7rEsXwGMBM8G5XyQ62y/lS/J/y5NTvmLs19ZGyoccTTuwOoeW73
         b8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iy3TQ3C1Ek23yK9GZJXs0daNRNetn5CYF4/zAE2h7ik=;
        b=D4QOUjMauj4ygs5Wlr/3TvDJcFCby+myjcbn8GYSn1n/seree7q5+7t1XaS6QMjhSR
         johj1Wc8HkhEL2GZJmcmKXPAACCSx5V+QMReo0teKqw7b8+oRuxyeMQjNrDKSyJcrgNO
         7RRS+Qce1z297quZw8Dvon/qHWAB3yWJafbSwVmNmSnmYIcBW/MoFUwdhik8s/ljZOC+
         359fXN1S2gy7Vm2ScqjNWp5RjN4zxwcdjiDNaKhkrHTal6NOsT59I7tRjYmb25+ETK5v
         waz27NJN1ESZsfAnxIJbOkAzmbr9PTz7akYCHFJptCfVdLm7KIoNgVNTCYvlNEuxnIuN
         9iGQ==
X-Gm-Message-State: AOAM533KwYSNhXiFHqopueEGbY669JsabW44tG65FAswwEkGl6RKJ5lA
        u2y00oscA8A7vRMPz4IYOnazUUBZH65KX+aCgZ0Odg==
X-Google-Smtp-Source: ABdhPJykoyGWTRcD0lR6xnSRRS+gTsSrH7i8r0dJuA7wRYkUeLk2vde81YvSA+MIvTflgkJVw4xrDt+AfE3pnj9QWgw=
X-Received: by 2002:a17:90b:f18:: with SMTP id br24mr2004360pjb.32.1600462408474;
 Fri, 18 Sep 2020 13:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
 <CA+icZUW1MYSUz8jwOaVpi6ib1dyCv1VmG5priw6TTzXGSh_8Gg@mail.gmail.com> <CABCJKueyWvNB2MQw_PCLtZb8F1+sA1QOLJi_5qMKwdFCcwSMGg@mail.gmail.com>
In-Reply-To: <CABCJKueyWvNB2MQw_PCLtZb8F1+sA1QOLJi_5qMKwdFCcwSMGg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 18 Sep 2020 13:53:17 -0700
Message-ID: <CAKwvOd=N5XS+c7X+fM+0aHWoo8j-xZ96Qk1a4n6gvYJZAq1mCQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/30] Add support for Clang LTO
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
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

On Fri, Sep 18, 2020 at 1:50 PM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Fri, Sep 18, 2020 at 1:22 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Fri, Sep 18, 2020 at 10:14 PM 'Sami Tolvanen' via Clang Built Linux
> > <clang-built-linux@googlegroups.com> wrote:
> > >
> > > This patch series adds support for building x86_64 and arm64 kernels
> > > with Clang's Link Time Optimization (LTO).
> > >
> > > In addition to performance, the primary motivation for LTO is
> > > to allow Clang's Control-Flow Integrity (CFI) to be used in the
> > > kernel. Google has shipped millions of Pixel devices running three
> > > major kernel versions with LTO+CFI since 2018.
> > >
> > > Most of the patches are build system changes for handling LLVM
> > > bitcode, which Clang produces with LTO instead of ELF object files,
> > > postponing ELF processing until a later stage, and ensuring initcall
> > > ordering.
> > >
> > > Note that patches 1-5 are not directly related to LTO, but are
> > > needed to compile LTO kernels with ToT Clang, so I'm including them
> > > in the series for your convenience:
> > >
> > >  - Patches 1-3 fix build issues with LLVM and they are already in
> > >    linux-next.
> > >
> > >  - Patch 4 fixes x86 builds with LLVM IAS, but it hasn't yet been
> > >    picked up by maintainers.
> > >
> > >  - Patch 5 is from Masahiro's kbuild tree and makes the LTO linker
> > >    script changes much cleaner.
> > >
> >
> > Hi Sami,
> >
> > might be good to point to your GitHub tree and corresponding
> > release-tag for easy fetching.
>
> Ah, true. You can also pull this series from
>
>   https://github.com/samitolvanen/linux.git lto-v3

Also, I've been using b4 happily for a short while now.
https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation

My workflow would be: check lore.kernel.org/lkml/
for the series in question. In this case:
https://lore.kernel.org/lkml/CABCJKueyWvNB2MQw_PCLtZb8F1+sA1QOLJi_5qMKwdFCcwSMGg@mail.gmail.com/T/#t
is the cover letter.  Then in my tree:
$ b4 am https://lore.kernel.org/lkml/CABCJKueyWvNB2MQw_PCLtZb8F1+sA1QOLJi_5qMKwdFCcwSMGg@mail.gmail.com/T/#t
-o - | git am
-- 
Thanks,
~Nick Desaulniers
