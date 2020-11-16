Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2B82B43C4
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Nov 2020 13:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgKPMcE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Nov 2020 07:32:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:47496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728329AbgKPMcE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Nov 2020 07:32:04 -0500
Received: from trantor (unknown [2.26.170.190])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 990C1206D8;
        Mon, 16 Nov 2020 12:32:00 +0000 (UTC)
Date:   Mon, 16 Nov 2020 12:31:58 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jian Cai <jiancai@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] kbuild: Always link with '-z norelro'
Message-ID: <X7JxPkmYnUA7nKfx@trantor>
References: <20201112183839.1009297-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112183839.1009297-1-natechancellor@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 12, 2020 at 11:38:40AM -0700, Nathan Chancellor wrote:
> Commit 3bbd3db86470 ("arm64: relocatable: fix inconsistencies in linker
> script and options") added '-z norelro' to the arm64 Makefile when
> CONFIG_RELOCATABLE was set to help support ld.lld because ld.lld
> defaults to '-z relro' but the kernel does not use program headers or
> adhere to the section layout that is required for RELRO to work.
> 
> Commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
> CONFIG_RELOCATABLE") unconditionally added it to LDFLAGS_vmlinux because
> an error occurs with CONFIG_KASAN set even when CONFIG_RELOCATABLE is
> unset.
> 
> As it turns out, ARM experiences the same error after CONFIG_KASAN was
> implemented, meaning that '-z norelro' needs to be added to that
> Makefile as well (multi_v7_defconfig + CONFIG_KASAN=y + LD=ld.lld):
> 
> $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LLVM=1 zImage
> ld.lld: error: section: .exit.data is not contiguous with other relro sections
> 
> To avoid playing whack-a-mole with different architectures over time,
> hoist '-z norelro' into the main Makefile. This does not affect ld.bfd
> because '-z norelro' is the default for it.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1189
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
> 
> Hi all,
> 
> This should probably go into Russell's tree with acks from the arm64 and
> kbuild maintainers.

So that's a fix for arch/arm going in the top Makefile.

For the arm64 part:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
