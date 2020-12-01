Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B09712CACC3
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 20:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387413AbgLATwe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 14:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729397AbgLATwe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 14:52:34 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28A2C0617A6
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 11:51:53 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id y7so1805625pfq.11
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 11:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJhY8u/xgI3NwUsMsFhtkWUYc2YVhnaebCX5nl2Ru6Q=;
        b=MU1J+QtjrMYect596h5eTpeHLQFqd4jbXkWpVSHILQafJ7WMP2JUuLbw0ninWQShV1
         Eh1Oe/+AnHFQzAMXF+YolY5+IBS2Npa01AwORUkDKXWV9fN6mS0YrWE5aM6a3pZYPx6S
         JLerU25sXGp+vfE+oYX7kBAjMthNKxUcPBJv4x/QoiEHeCXBcp3zAnCtjXZmaSO6WA2s
         HCB+4snvQenMBOz4d/v8seIQWfzmgrh8oq6LB4iz4kseuvkRm/7U5F/adejklVLvC9oT
         HdfZ7iGJOuo4/PghZ//tjUdn1EGf0Y+yB9oLCUzML8c2pG3EpRP8Bmp/oVwP0eJ/gaA0
         55pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJhY8u/xgI3NwUsMsFhtkWUYc2YVhnaebCX5nl2Ru6Q=;
        b=FxHVblmfQ+W7LBPcmexipGodiWCZMLJUTZQDCYbkWKMjypzu08Fn3uBAcFz59Q2JQK
         1GHBCSMo8DnP5sht36CCAFBQJ/ptAnteP7WHj5p0mduiqw6LNPhf/d3kP62OoreqLEVr
         Wp9kWpIRLIzStp3SO3cRbbsVGVjwwtX2GUo0qGRozyH4XHGdsarebb91miGx+iE5VQt8
         NoBEBt3nP8a8RSjnROWq/PnqdbkahtXATP04eKRwgFHCoKexfCLAG4PmxbMukxBEjh2A
         4Iw6GQnIDjutt9s6RS66SsoMnl1gZ/q53RWcudbiKTnU0oVp7n2rgEcDLGnN8BQylkH2
         85OA==
X-Gm-Message-State: AOAM532JzZkFZQorVy9oGFw89jO7KmPkcQieUyTIFp3eZ8X6UXwd44BN
        LLNiTM3YutY8cm66U3+yTl1gRqn3o8gVanPsmzF3Ww==
X-Google-Smtp-Source: ABdhPJx3Xdxr6ftEvN+BqvqUknUxbXtsaIoy9RJVA4UseQm3v6s7H1av1h3KcgjU/+t+wKVVMgBfbefs2TutGOwyb1w=
X-Received: by 2002:a62:1896:0:b029:197:491c:be38 with SMTP id
 144-20020a6218960000b0290197491cbe38mr3997304pfy.15.1606852312900; Tue, 01
 Dec 2020 11:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20201118220731.925424-1-samitolvanen@google.com>
 <20201130120130.GF24563@willie-the-truck> <202012010929.3788AF5@keescook>
In-Reply-To: <202012010929.3788AF5@keescook>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 1 Dec 2020 11:51:41 -0800
Message-ID: <CAKwvOdkcfg9ae_NyctS+3E8Ka5XqHXXAMJ4aUYHiC=BSph9E2A@mail.gmail.com>
Subject: Re: [PATCH v7 00/17] Add support for Clang LTO
To:     Kees Cook <keescook@chromium.org>
Cc:     Will Deacon <will@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 1, 2020 at 9:31 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Nov 30, 2020 at 12:01:31PM +0000, Will Deacon wrote:
> > Hi Sami,
> >
> > On Wed, Nov 18, 2020 at 02:07:14PM -0800, Sami Tolvanen wrote:
> > > This patch series adds support for building the kernel with Clang's
> > > Link Time Optimization (LTO). In addition to performance, the primary
> > > motivation for LTO is to allow Clang's Control-Flow Integrity (CFI) to
> > > be used in the kernel. Google has shipped millions of Pixel devices
> > > running three major kernel versions with LTO+CFI since 2018.
> > >
> > > Most of the patches are build system changes for handling LLVM bitcode,
> > > which Clang produces with LTO instead of ELF object files, postponing
> > > ELF processing until a later stage, and ensuring initcall ordering.
> > >
> > > Note that v7 brings back arm64 support as Will has now staged the
> > > prerequisite memory ordering patches [1], and drops x86_64 while we work
> > > on fixing the remaining objtool warnings [2].
> >
> > Sounds like you're going to post a v8, but that's the plan for merging
> > that? The arm64 parts look pretty good to me now.
>
> I haven't seen Masahiro comment on this in a while, so given the review
> history and its use (for years now) in Android, I will carry v8 (assuming
> all is fine with it) it in -next unless there are objections.

I had some minor stylistic feedback on the Kconfig changes; I'm happy
for you to land the bulk of the changes and then I follow up with
patches to the Kconfig after.
-- 
Thanks,
~Nick Desaulniers
