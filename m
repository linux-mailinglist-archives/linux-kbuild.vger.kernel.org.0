Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4864F261617
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Sep 2020 19:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731854AbgIHRDN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Sep 2020 13:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732058AbgIHRDD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Sep 2020 13:03:03 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B53C0613ED
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2020 10:03:03 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k15so11448923pfc.12
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2020 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TS+pFAf+gXvyICCIZ7exDi0/Gxg54q8UJXDvRO7l168=;
        b=pKJ8j7uKJcb7uVWaQ5j/SnvkaAx4KCY55KCie8OQaygCpy1OPF8cDgeNH1qrPaLMvG
         8srfgOOgbosqJmTceeQvjWZChA+6j/LEIRcay7cMsXtBzLKxqoBwUcyD/WziBOgMhTht
         H95mhfOyXrIvUmREbH1YWzNRx8qhfoLUnK6vxg72nBJz4Zsryt8ZJJ5SgRHKxhMkN6NG
         dtOewrVFqRwrzOeM6o0lzzlRd9V3/io+BfvvategCuZpFKOLhdC7d/WJPglYjH7skxA9
         mFBhEsZ3kh8WuUPDicHPjHktAGiGpoaEUWzf67bzqCSOGx192KG66jA3O0NwWTFIar6q
         WtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TS+pFAf+gXvyICCIZ7exDi0/Gxg54q8UJXDvRO7l168=;
        b=HeSmV4kJ+77IG63oqPFpzevJyZtG+Bo5lBRmQTpsMx7/ugy6pCCNDcf9FtuFJva4bJ
         VdRXfqG/E/EQa7x+/9LTTmNZI103wwTizV/idl0dVks7LEwL0n6h2no/5p8Y7WC6BktY
         QFIhCGf/Ax38cIoQ0vbJ2bQHZWETJYREso90Hn0GGh0HRKEsSCjkK7Ad8Q2D4KpxRQ4C
         f172E4eoD1iAPUMxjMTnaMEPDqYLxyebv41vSGKRiGUDnb3Ct5qIb0ttA/PqhTozq1Bh
         ft/1ErdUnMkrmmV0WvrAsOhjnbe1ak16wry0gSavq43eMwYLL1PG7s+rOLoiG2uiaOmo
         bRyg==
X-Gm-Message-State: AOAM531KejRMBUXg/Oxo3BYtZCg7MV2PXu9B/RPbdHpycj4VnQkLWO/F
        7eV4A3v+GxhJ6Ct9cNjC95PezQ==
X-Google-Smtp-Source: ABdhPJypTa9m8baYyH7KtZLmA6Dhp5bWpLPg7YpbRm1G9HK65/WnGTkmsSsfgelDtI+oA1WrmQRR/g==
X-Received: by 2002:a17:902:d714:b029:d0:cbe1:e738 with SMTP id w20-20020a170902d714b02900d0cbe1e738mr2106530ply.19.1599584582581;
        Tue, 08 Sep 2020 10:03:02 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
        by smtp.gmail.com with ESMTPSA id t15sm19413909pfl.175.2020.09.08.10.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 10:03:01 -0700 (PDT)
Date:   Tue, 8 Sep 2020 10:02:56 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 09/28] kbuild: add support for Clang LTO
Message-ID: <20200908170256.GA2743468@google.com>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-10-samitolvanen@google.com>
 <202009031504.07098D6F8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009031504.07098D6F8@keescook>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 03:08:59PM -0700, Kees Cook wrote:
> On Thu, Sep 03, 2020 at 01:30:34PM -0700, Sami Tolvanen wrote:
> > This change adds build system support for Clang's Link Time
> > Optimization (LTO). With -flto, instead of ELF object files, Clang
> > produces LLVM bitcode, which is compiled into native code at link
> > time, allowing the final binary to be optimized globally. For more
> > details, see:
> > 
> >   https://llvm.org/docs/LinkTimeOptimization.html
> > 
> > The Kconfig option CONFIG_LTO_CLANG is implemented as a choice,
> > which defaults to LTO being disabled. To use LTO, the architecture
> > must select ARCH_SUPPORTS_LTO_CLANG and support:
> > 
> >   - compiling with Clang,
> >   - compiling inline assembly with Clang's integrated assembler,
> >   - and linking with LLD.
> > 
> > While using full LTO results in the best runtime performance, the
> > compilation is not scalable in time or memory. CONFIG_THINLTO
> > enables ThinLTO, which allows parallel optimization and faster
> > incremental builds. ThinLTO is used by default if the architecture
> > also selects ARCH_SUPPORTS_THINLTO:
> > 
> >   https://clang.llvm.org/docs/ThinLTO.html
> > 
> > To enable LTO, LLVM tools must be used to handle bitcode files. The
> > easiest way is to pass the LLVM=1 option to make:
> > 
> >   $ make LLVM=1 defconfig
> >   $ scripts/config -e LTO_CLANG
> >   $ make LLVM=1
> > 
> > Alternatively, at least the following LLVM tools must be used:
> > 
> >   CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm
> > 
> > To prepare for LTO support with other compilers, common parts are
> > gated behind the CONFIG_LTO option, and LTO can be disabled for
> > specific files by filtering out CC_FLAGS_LTO.
> > 
> > Note that support for DYNAMIC_FTRACE and MODVERSIONS are added in
> > follow-up patches.
> > 
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> 
> I remain crazy excited about being able to use this in upstream. :)
> 
> The only suggestion I have here, if it might help with clarity, would be
> to remove DISABLE_LTO globally as a separate patch, since it's entirely
> unused in the kernel right now. This series removes it as it goes, which
> I think is fine, but it might cause some reviewers to ponder "what's
> this DISABLE_LTO thing? Don't we need that?" without realizing currently
> unused in the kernel.

Sure, that makes sense. I'll add a patch to remove DISABLE_LTO treewide
in v3.

Sami
