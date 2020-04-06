Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F2F19F47E
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2020 13:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbgDFLWY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Apr 2020 07:22:24 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38410 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbgDFLWY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Apr 2020 07:22:24 -0400
Received: by mail-wm1-f68.google.com with SMTP id f20so6338637wmh.3
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2020 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qDK5+uBeH6pLDnaoKYduIBBNRFpH/vDYlc7eibTIZjE=;
        b=J0IJ9s9ZmVQvPhdwtoZwYkj55qLQHm43hi3wsUzL4mKjhuj2h0I+jKBHX2RdnbHRxN
         dJN8useS/qDkKMB0Wk+58eWd7C0qCGhYU+UPtt2pIyoLqkfi6QgYkIYkmmWELE6YkPS2
         aqH77+/arCyMiYXEk+lN+8f//BoofOfNQlNUqQqXjOQ3dftCnNfx6awdlrM+sh6TQsY5
         0WBVVyiiGpAvgMmHZLREGmKUoH26ud/Qd7HLy/O4leLxpHdKsIxJx+MVjD135TLQPp06
         yYBgKUliotjcF9jQgeXcok53/G4uIsqavL2+NaLYaXYjcE1pQ9s7e7vgL0LD4IGgnb0C
         BDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qDK5+uBeH6pLDnaoKYduIBBNRFpH/vDYlc7eibTIZjE=;
        b=DB6bsbDxg/hQrQqsRBkEV1tdW8aUUJorgGJ6mUItyzpBYgiKMhExF4gPsP5wJw4+JW
         n5x3RxuWYFQRKmB/1LZGEpxxAE5oH42z6xSwdT3GwCKksqdVxNQZtVq2KhKqWXAlkmBi
         M1n17SE9jFiP0SPk7nzbKM5bzxg+bRCPi4gAYZbgZD+7VAHIfW53N14VYaOCcOrd08G+
         eJRfehljR09dYP+uc/9yihZS48Jbv92G6sqUe6n/1plvmWY6mD8dYfGBmiCYNqRAYsGx
         CldypsF8rQVEky5Oi0A0Uh3Ofe4uaiLcbUdhIBsXoIfwb93rnsG9Tm1HrunPL24wi5fH
         MyzA==
X-Gm-Message-State: AGi0PuYV6vL7afw6S1k4wEYC5ioyNHYU3bkg9qrWXRsAfO9oipXw1VtZ
        lL0shtc6nd+FKRGkWx8YGT/YOg==
X-Google-Smtp-Source: APiQypJqSNe+gkm9f/9SkkaI8W+1PHJH7h62962gDjMKUWiW3InWQUYz6lyWddRZOHNDDmXkj2sPCg==
X-Received: by 2002:a1c:2d95:: with SMTP id t143mr22457582wmt.89.1586172141483;
        Mon, 06 Apr 2020 04:22:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id y80sm25959365wmc.45.2020.04.06.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 04:22:20 -0700 (PDT)
Date:   Mon, 6 Apr 2020 13:22:20 +0200
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux@googlegroups.com,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to
 Clang/LLVM
Message-ID: <20200406112220.GB126804@google.com>
References: <20200403051709.22407-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200403051709.22407-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 03, 2020 at 02:17:09PM +0900, Masahiro Yamada wrote:
>As Documentation/kbuild/llvm.rst implies, building the kernel with a
>full set of LLVM tools gets very verbose and unwieldy.
>
>Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
>GCC and Binutils. You can pass LLVM=1 from the command line or as an
>environment variable. Then, Kbuild will use LLVM toolchains in your
>PATH environment.
>
>Please note LLVM=1 does not turn on the LLVM integrated assembler.
>You need to explicitly pass AS=clang to use it. When the upstream
>kernel is ready for the integrated assembler, I think we can make
>it default.
>
>We discussed what we need, and we agreed to go with a simple boolean
>switch (https://lkml.org/lkml/2020/3/28/494).
>
>Some items in the discussion:
>
>- LLVM_DIR
>
>  When multiple versions of LLVM are installed, I just thought supporting
>  LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
>
>  CC      = $(LLVM_DIR)clang
>  LD      = $(LLVM_DIR)ld.lld
>    ...
>
>  However, we can handle this by modifying PATH. So, we decided to not do
>  this.
>
>- LLVM_SUFFIX
>
>  Some distributions (e.g. Debian) package specific versions of LLVM with
>  naming conventions that use the version as a suffix.
>
>  CC      = clang$(LLVM_SUFFIX)
>  LD      = ld.lld(LLVM_SUFFIX)
>    ...
>
>  will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
>  but the suffixed versions in /usr/bin/ are symlinks to binaries in
>  /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
>
>- HOSTCC, HOSTCXX, etc.
>
>  We can switch the host compilers in the same way:
>
>  ifneq ($(LLVM),)
>  HOSTCC       = clang
>  HOSTCXX      = clang++
>  else
>  HOSTCC       = gcc
>  HOSTCXX      = g++
>  endif
>
>  This may the right thing to do, but I could not make up my mind.
>  Because we do not frequently switch the host compiler, a counter
>  solution I had in my mind was to leave it to the default of the
>  system.
>
>  HOSTCC       = cc
>  HOSTCXX      = c++

What about HOSTLD ? I saw recently, that setting HOSTLD=ld.lld is not
yielding the expected result (some tools, like e.g. fixdep still require
an `ld` to be in PATH to be built). I did not find the time to look into
that yet, but I would like to consistently switch to the llvm toolchain
(including linker and possibly more) also for hostprogs.

Cheers,
Matthias

>
>  Many distributions support update-alternatives to switch the default
>  to GCC, Clang, or whatever, but reviewers were opposed to this
>  approach. So, this commit does not touch the host tools.
>
>Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>---
>
> Documentation/kbuild/kbuild.rst |  5 +++++
> Documentation/kbuild/llvm.rst   |  5 +++++
> Makefile                        | 20 ++++++++++++++++----
> 3 files changed, 26 insertions(+), 4 deletions(-)
>
>diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
>index 510f38d7e78a..2d1fc03d346e 100644
>--- a/Documentation/kbuild/kbuild.rst
>+++ b/Documentation/kbuild/kbuild.rst
>@@ -262,3 +262,8 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
> These two variables allow to override the user@host string displayed during
> boot and in /proc/version. The default value is the output of the commands
> whoami and host, respectively.
>+
>+LLVM
>+----
>+If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
>+of GCC and GNU binutils to build the kernel.
>diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
>index d6c79eb4e23e..4602369f6a4f 100644
>--- a/Documentation/kbuild/llvm.rst
>+++ b/Documentation/kbuild/llvm.rst
>@@ -55,6 +55,11 @@ additional parameters to `make`.
> 	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
> 	  HOSTLD=ld.lld
>
>+You can use a single switch `LLVM=1` to use LLVM utilities by default (except
>+for building host programs).
>+
>+	make LLVM=1 HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
>+
> Getting Help
> ------------
>
>diff --git a/Makefile b/Makefile
>index c91342953d9e..6db89ecdd942 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -409,16 +409,28 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
> KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>
> # Make variables (CC, etc...)
>-LD		= $(CROSS_COMPILE)ld
>-CC		= $(CROSS_COMPILE)gcc
> CPP		= $(CC) -E
>+ifneq ($(LLVM),)
>+CC		= clang
>+LD		= ld.lld
>+AR		= llvm-ar
>+NM		= llvm-nm
>+OBJCOPY		= llvm-objcopy
>+OBJDUMP		= llvm-objdump
>+READELF		= llvm-readelf
>+OBJSIZE		= llvm-size
>+STRIP		= llvm-strip
>+else
>+CC		= $(CROSS_COMPILE)gcc
>+LD		= $(CROSS_COMPILE)ld
> AR		= $(CROSS_COMPILE)ar
> NM		= $(CROSS_COMPILE)nm
>-STRIP		= $(CROSS_COMPILE)strip
> OBJCOPY		= $(CROSS_COMPILE)objcopy
> OBJDUMP		= $(CROSS_COMPILE)objdump
>-OBJSIZE		= $(CROSS_COMPILE)size
> READELF		= $(CROSS_COMPILE)readelf
>+OBJSIZE		= $(CROSS_COMPILE)size
>+STRIP		= $(CROSS_COMPILE)strip
>+endif
> PAHOLE		= pahole
> LEX		= flex
> YACC		= bison
>-- 
>2.17.1
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200403051709.22407-1-masahiroy%40kernel.org.
