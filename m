Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8C730B1EC
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Feb 2021 22:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhBAVPB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Feb 2021 16:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60042 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229646AbhBAVPA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Feb 2021 16:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612214013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MmWztmGR5QmsHu5+b9WkkQVWRHsWQU/iqLJE+kYPk+k=;
        b=FQxg7qe752hONfMYUy/xn9tE+uE2QxaHeuZyptM4iuIwkYJfktR9UVygzts4sijR75uBq8
        3basGuxJiCu/ROKdFW2diZ9WPKsKMgF7pgqBet1hYASzAZne6HazaEZs9sOZ+E4mCN6gEl
        ENdyUT7F2oC6lr3PTEJooeWx1INNfYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-dKGUuVngP364zEE8h3y-2Q-1; Mon, 01 Feb 2021 16:13:29 -0500
X-MC-Unique: dKGUuVngP364zEE8h3y-2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00D2D1842140;
        Mon,  1 Feb 2021 21:13:27 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 70D2560BF3;
        Mon,  1 Feb 2021 21:13:24 +0000 (UTC)
Date:   Mon, 1 Feb 2021 15:13:22 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>,
        David Laight <David.Laight@aculab.com>,
        Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH RFC] kbuild: Prevent compiler mismatch with external
 modules
Message-ID: <20210201211322.t2rxmvnrystc2ky7@treble>
References: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
 <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
 <20210128205207.awdbh4bmx56pxxjl@treble>
 <CAHk-=wgh4DaZvTcFfBcDMKc1QXkKjwny_Z0H5JfzdwMTNTBkSw@mail.gmail.com>
 <CAHk-=wh+3PWi2NuoQ0hbSyLpOHjaBWKcgX6N7+PfPkXzNAfMwA@mail.gmail.com>
 <20210128213409.qxnclchjyq6v23up@treble>
 <CAHk-=wgjwhDy-y4mQh34L+2aF=n6BjzHdqAW2=8wri5x7O04pA@mail.gmail.com>
 <20210128220803.fixcmuv4ceq5m7dy@treble>
 <CAK7LNARE3KO-kqdsXAbt9d9+3EqqutYd6iNki_rU2-Q9GkakbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNARE3KO-kqdsXAbt9d9+3EqqutYd6iNki_rU2-Q9GkakbA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 29, 2021 at 08:17:51AM +0900, Masahiro Yamada wrote:
> [3]
> Peterz already pointed out asm-goto as an example of ABI mismatch.
> 
> I remember a trouble reported in the past due
> to the mismatch of -mstack-protector-guard-offset.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=201891
> 
> This has already been fixed,
> and it will no longer happen though.

This is kind of concerning though.  It would be nice to somehow store
KCLAGS in the config and warn if it changes unexpectedly.

This can be a problem not only for OOT modules, but for regular kernel
builds which have a .config copied from somewhere.

Because of the toolchain-dependent kconfig options, features can
silently disappear if the toolchain doesn't support them, due to a
different compiler version, or even a missing library.

> [2]
> 
> As for this patch, it is wrong to do this check in the Makefile
> parse stage.
> 
> "make M=...  clean"
> "make M=...  help"
> 
> etc. will fail.
> Such targets do not require the compiler in the first place.
> 
> This check must be done before starting building something,
>
> Also, this patch is not applicable.
> gcc-version.sh and clang-version.sh do not exist.
> See linux-next.

Something like so?

diff --git a/Makefile b/Makefile
index 95ab9856f357..10ca621369fb 100644
--- a/Makefile
+++ b/Makefile
@@ -1721,12 +1721,25 @@ KBUILD_MODULES := 1
 
 build-dirs := $(KBUILD_EXTMOD)
 PHONY += modules
-modules: $(MODORDER)
+modules: ext_compiler_check $(MODORDER)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 $(MODORDER): descend
 	@:
 
+orig_name   := $(if $(CONFIG_CC_IS_GCC),GCC,CLANG)
+orig_minor  := $(shell expr $(if $(CONFIG_CC_IS_GCC),$(CONFIG_GCC_VERSION),$(CONFIG_CLANG_VERSION)) / 100)
+cur_namever := $(shell $(srctree)/scripts/cc-version.sh $(CC))
+cur_name    := $(word 1,$(cur_namever))
+cur_minor   := $(shell expr $(word 2,$(cur_namever)) / 100)
+PHONY += ext_compiler_check
+ext_compiler_check:
+	@if [ $(orig_name) != $(cur_name) ] || [ $(orig_minor) != $(cur_minor) ]; then \
+		echo >&2 "warning: The compiler differs from the version which was used to build the kernel."; \
+		echo >&2 "warning: Some kernel features are compiler-dependent."; \
+		echo >&2 "warning: It's recommended that you change your compiler to match the version in the .config file."; \
+	fi
+
 PHONY += modules_install
 modules_install: _emodinst_ _emodinst_post
 

