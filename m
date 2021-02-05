Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1D53113B4
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 22:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhBEViI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 16:38:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:47730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230332AbhBEVhr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 16:37:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E964064FB2;
        Fri,  5 Feb 2021 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612561027;
        bh=gJsWhexY6Rt+DKU7bIDjsohhXAKuTggz7inIKLaEf4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XmbAcAaErPzq1dFO179ekXUFmhjO54uMQcGyw0EfgCZJx1W7PXeIzENKZAQhwSiKh
         1/5cLMYrLLziXK0Gri+dRvWmRrzDdLmIfvfjDsgLeE5lJLl2iETtQWGt9Ff3wzYp6I
         bOVVGfmP9i2JsJT7FfuQThNSqr0vsu/Ljeu+YImSBs6b1hYAth4Db8AeQnSk9ObZKy
         Dg+kHdKbfVcgWmRiveqaUX6aAradkX6tV6QvSQXFm3mgLJRfHQOyRnSFqybbG7CBm3
         96+zsMqpioLw7djfciJf/qn4ew8YAq2OIAoDt1Zvs48Jjg0xrPkP2WigDXutqOvWs7
         8TpYI9dMlvcrQ==
Date:   Fri, 5 Feb 2021 14:36:51 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: Using GNU AS from a selfmade binutils v2.35.2
Message-ID: <20210205213651.GA16907@Ryzen-5-4500U.localdomain>
References: <CA+icZUUjb_71mWwWFMYN_OPZir2vStLq1kDY1O+JCFjtmEEBjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUUjb_71mWwWFMYN_OPZir2vStLq1kDY1O+JCFjtmEEBjA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 05, 2021 at 11:56:55AM +0100, Sedat Dilek wrote:
> Hi Masahiro and ClangBuiltLinux folks,
> 
> I am trying to use binaries from GNU/binutils v2.35.2 for my
> Linux-kernel builds.
> 
> Background is I am doing some testing for BTF + pahole with GCC-10 and LLVM-12.

TL;DR: GCC will use the first "as" that is found in your PATH while
clang will:
1. Use the "as" present in the folder that it is installed in.
2. Use the first "as" that is found in your PATH.

To override clang's behavior, you can pass '--prefix=' to it.

GCC:

$ echo | gcc -### -c -x assembler -o /dev/null -
...
 as --64 -o /dev/null -
...

You can prove that this works with a symlink to /bin/false.

$ cd "$(mktemp -d)"

$ ln -s /bin/false as

$ echo | gcc -c -x assembler -o /dev/null -

$ echo ${?}
0

$ echo | PATH=${PWD}:${PATH} gcc -c -x assembler -o /dev/null -

$ echo ${?}
1

As you will notice, PATH has no affect when there is an "as" binary in
the same location as "clang":

$ which clang
/usr/bin/clang

$ which as
/usr/bin/as

$ echo | clang -### -no-integrated-as -c -x assembler -o /dev/null -
...
 "/usr/bin/as" "--64" "-o" "/dev/null" "-"

$ echo | PATH=${PWD}:${PATH} clang -### -no-integrated-as -c -x assembler -o /dev/null -
...
 "/usr/bin/as" "--64" "-o" "/dev/null" "-"

But '--prefix=' does:

$ echo | clang -### --prefix=${PWD} -no-integrated-as -c -x assembler -o /dev/null -
...
 "/tmp/tmp.B8BdCWZJTL/as" "--64" "-o" "/dev/null" "-"

When there is no "as" binary in the same location as "clang", PATH works:

$ echo | /usr/lib/llvm-10/bin/clang -### -no-integrated-as -c -x assembler -o /dev/null -
...
 "/usr/bin/as" "--64" "-o" "/dev/null" "-"

$ echo | PATH=${PWD}:${PATH} /usr/lib/llvm-10/bin/clang -### -no-integrated-as -c -x assembler -o /dev/null -
...
 "/tmp/tmp.B8BdCWZJTL/as" "--64" "-o" "/dev/null" "-"

If you want to use a separate binutils while building the kernel with
clang, you can:

1. Symlink your LLVM and binutils binaries into one folder.
2. Pass '--prefix=' via KCFLAGS:

make KCFLAGS=--prefix=<binutils_bin_folder>

It is entirely possible that '--prefix=' should always be present though:

diff --git a/Makefile b/Makefile
index f5842126e89d..409822f45bfd 100644
--- a/Makefile
+++ b/Makefile
@@ -562,10 +562,10 @@ endif
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
+endif
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
-endif
 ifneq ($(GCC_TOOLCHAIN),)
 CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif

Hopefully that helps.

Cheers,
Nathan
