Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39B12172FD
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 17:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbgGGPvQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 11:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgGGPvQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 11:51:16 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB804C08C5DC
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Jul 2020 08:51:15 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id md7so3568355pjb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jul 2020 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6nbLKEvdqqtu0DOxk+RX2NCeuVjz/d5/WDsGYxOKe+A=;
        b=qbZF9hTub3E6dJOMlijRiMiRkHYkFQubSYFp6P+VnStOU35ksLbT5c2olfLiJpXsF3
         p3AHOCADz7BlPRcb5xlVfsDuFkpaWzroZytIxmWQMa1Tq9gUpWVZPukI1yqE2KFTHiA3
         9YlWvV6iIbDdJ+BZAyuKLx1RPuPn/LEcUmBvsAMcz6jJ5yyWtgLEw10Q8wnhLwp1ZVgF
         o4GGnZfpFXNrCeoFTPW5BteobP+ETyf4GPs6Ui4f/hVYa1npYd2Jb7cBEU2OssXqWPH4
         auU0losOJLOMYxa1RdqPXWKkY62FkFHARI3LfbFiT0CpoTlE2LZsZ8/SQVRU7EUqTPAC
         0DtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6nbLKEvdqqtu0DOxk+RX2NCeuVjz/d5/WDsGYxOKe+A=;
        b=dtcNArwE2gcU4cUlU90sHxYyJZbzJJSOOzgvVuye/cCTo4ZF5+9tqIDNTXQGOfKGNu
         Zml69hS89HmH9IFHB2ezdY2L+ZtwpC39vxXTGo+v4lfsXWYKNICu5qsPd5IZTmNLXOgm
         xkVYCUosEnQ65g5sXoBURS8A8OQ8IthiUjcnoUQFhBdI5jMSoM89aD+Nl4Llxq3F6IXG
         tW/sZ8zBYT+Ex2+R/+/d+NmaE+QfA7ue7u8secROKi+d9RfrqUX6NigOC+A/4zTs/yZ6
         kM15nhBwovSw4hT4JQQ9vcur8n4iwg8A9ipWwHCX7iv7sHGve+8diJxbptoY18SlEr7E
         EzGw==
X-Gm-Message-State: AOAM533L1iYJWKYXcm/ZZAlaNEEu/knFsQ1DIykD3VRLJ31O3oW+9i3m
        bCEvDFDAgckx8YvhbLFR8N4h3Q==
X-Google-Smtp-Source: ABdhPJzoBjROrVaJtp6nujXRaXTatw7gwLtR2zb8jqFckSgpuUCpME8ySKJl8GGYK6iDFTRo3tsWzA==
X-Received: by 2002:a17:90a:a106:: with SMTP id s6mr5003560pjp.53.1594137075030;
        Tue, 07 Jul 2020 08:51:15 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
        by smtp.gmail.com with ESMTPSA id b10sm22289026pft.59.2020.07.07.08.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 08:51:14 -0700 (PDT)
Date:   Tue, 7 Jul 2020 08:51:07 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Jiong Wang <jiong.wang@netronome.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org, X86 ML <x86@kernel.org>
Subject: Re: [PATCH 00/22] add support for Clang LTO
Message-ID: <20200707155107.GA3357035@google.com>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <CAK7LNASvb0UDJ0U5wkYYRzTAdnEs64HjXpEUL7d=V0CXiAXcNw@mail.gmail.com>
 <20200629232059.GA3787278@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629232059.GA3787278@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 29, 2020 at 04:20:59PM -0700, Sami Tolvanen wrote:
> Hi Masahiro,
> 
> On Mon, Jun 29, 2020 at 01:56:19AM +0900, Masahiro Yamada wrote:
> > I also got an error for
> > ARCH=arm64 allyesconfig + CONFIG_LTO_CLANG=y
> > 
> > 
> > 
> > $ make ARCH=arm64 LLVM=1 LLVM_IAS=1
> > CROSS_COMPILE=~/tools/aarch64-linaro-7.5/bin/aarch64-linux-gnu-
> > -j24
> > 
> >   ...
> > 
> >   GEN     .version
> >   CHK     include/generated/compile.h
> >   UPD     include/generated/compile.h
> >   CC      init/version.o
> >   AR      init/built-in.a
> >   GEN     .tmp_initcalls.lds
> >   GEN     .tmp_symversions.lds
> >   LTO     vmlinux.o
> >   MODPOST vmlinux.symvers
> >   MODINFO modules.builtin.modinfo
> >   GEN     modules.builtin
> >   LD      .tmp_vmlinux.kallsyms1
> > ld.lld: error: undefined symbol: __compiletime_assert_905
> > >>> referenced by irqbypass.c
> > >>>               vmlinux.o:(jeq_imm)
> > make: *** [Makefile:1161: vmlinux] Error 1
> 
> I can reproduce this with ToT LLVM and it's BUILD_BUG_ON_MSG(..., "value
> too large for the field") in drivers/net/ethernet/netronome/nfp/bpf/jit.c.
> Specifically, the FIELD_FIT / __BF_FIELD_CHECK macro in ur_load_imm_any.
> 
> This compiles just fine with an earlier LLVM revision, so it could be a
> relatively recent regression. I'll take a look. Thanks for catching this!

After spending some time debugging this with Nick, it looks like the
error is caused by a recent optimization change in LLVM, which together
with the inlining of ur_load_imm_any into jeq_imm, changes a runtime
check in FIELD_FIT that would always fail, to a compile-time check that
breaks the build. In jeq_imm, we have:

    /* struct bpf_insn: _s32 imm */
    u64 imm = insn->imm; /* sign extend */
    ...
    if (imm >> 32) { /* non-zero only if insn->imm is negative */
    	/* inlined from ur_load_imm_any */
	u32 __imm = imm >> 32; /* therefore, always 0xffffffff */

        /*
	 * __imm has a value known at compile-time, which means
	 * __builtin_constant_p(__imm) is true and we end up with
	 * essentially this in __BF_FIELD_CHECK:
	 */
	if (__builtin_constant_p(__imm) && __imm <= 255)
	      __compiletime_assert_N();

The compile-time check comes from the following BUILD_BUG_ON_MSG:

    #define __BF_FIELD_CHECK(_mask, _reg, _val, _pfx)		\
    ...
	BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?		\
			 ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
			 _pfx "value too large for the field"); \

While we could stop the compiler from performing this optimization by
telling it to never inline ur_load_imm_any, we feel like a better fix
might be to replace FIELD_FIT(UR_REG_IMM_MAX, imm) with a simple imm
<= UR_REG_IMM_MAX check that won't trip a compile-time assertion even
when the condition is known to fail.

Jiong, Jakub, do you see any issues here?

Sami
