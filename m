Return-Path: <linux-kbuild+bounces-6591-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D533A86DAC
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Apr 2025 16:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A27E19E0299
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Apr 2025 14:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FBE186E54;
	Sat, 12 Apr 2025 14:22:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27937149E13;
	Sat, 12 Apr 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744467742; cv=none; b=cLxDX/HewxgWm1WHS6odIdQ6YCZJ6N3N1flb0L9F5v4BMSg82Mbftg7PIDr7nbYuxwJXEh6nvuoadLtv76xPiQ/nk7uMafQTxp2esDI1/8EIVGNkJeGpjuI/TrK7BX98Oy04/K/IvzphLwyLS6BdChYBVlBOW/ua9YNFziQ67Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744467742; c=relaxed/simple;
	bh=FkrHuh+xF02Q321Wyf0onYgcYoDnpGW3VH9K1TsqZug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3vyHlEwcWgIHqiwQ2YL33Y6BoNuzvfsdwnfyjJG0UR5Je4bjHnaDCqJjkDsKaa+1qM3lxQrqdJXIL2yKY6YMyCy+nnBFP8FuYOw8qeOOMhKto8gpj9jSzk5Y/L9iUlfta9/6h7WkKrFI2yE83CX/dEJ3lYV8BWFGhDHgrhpwGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5258C4CEE3;
	Sat, 12 Apr 2025 14:22:19 +0000 (UTC)
Date: Sat, 12 Apr 2025 10:22:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Arnd Bergmann <arnd@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Rae Moar <rmoar@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Sergio
 =?UTF-8?B?R29uesOhbGV6?= Collado <sergio.collado@gmail.com>, David Gow
 <davidgow@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, Mostafa Saleh <smostafa@google.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/mksysmap: skip objtool __pfx_ symbols
Message-ID: <20250412102218.560196c0@batman.local.home>
In-Reply-To: <20250411105849.GA5600@noisy.programming.kicks-ass.net>
References: <20250328112156.2614513-1-arnd@kernel.org>
	<ycgbf7jcq7nc62ndqiynogt6hkabgl3hld4uyelgo7rksylf32@oysq7jpchtp4>
	<20250411065054.GM9833@noisy.programming.kicks-ass.net>
	<0073e739-e3aa-4743-ad2d-29d7c969f454@app.fastmail.com>
	<20250411105849.GA5600@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Apr 2025 12:58:49 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> > This one is 534 characters long:
> > _GLOBAL__sub_I_65535_1_snnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n  
> 
> I've not seen those before; google seems to suggest this is part of
> static initializers.

I just hit this on my allyesconfig build:

  NM      .tmp_vmlinux1.syms
  KSYMS   .tmp_vmlinux1.kallsyms.S
Symbol __cfi_snnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n too long for kallsyms (517 >= 512).
Please increase KSYM_NAME_LEN both in kernel and kallsyms.c
  AS      .tmp_vmlinux1.kallsyms.o
  LD      .tmp_vmlinux2
ld.lld: error: kernel image bigger than KERNEL_IMAGE_SIZE
ld.lld: error: kernel image bigger than KERNEL_IMAGE_SIZE
ld.lld: error: kernel image bigger than KERNEL_IMAGE_SIZE
make[3]: *** [/work/build/trace/nobackup/linux-test.git/scripts/Makefile.vmlinux:91: vmlinux.unstripped] Error 1
make[2]: *** [/work/build/trace/nobackup/linux-test.git/Makefile:1239: vmlinux] Error 2
make[1]: *** [/work/build/trace/nobackup/linux-test.git/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/work/build/nobackup/tracetest'
make: *** [Makefile:248: __sub-make] Error 2

I grepped for that symbol and it lives in: lib/tests/longest_symbol_kunit.o

Even after removing that test, my allyesconfig still fails to build with:

ld.lld: error: kernel image bigger than KERNEL_IMAGE_SIZE
ld.lld: error: kernel image bigger than KERNEL_IMAGE_SIZE
ld.lld: error: kernel image bigger than KERNEL_IMAGE_SIZE

I guess I'll just have to remove allyesconfig from my test suite. I
still do allmodconfig which appears to still work. At least that will
shorten my test suite time as allyesconfig takes around a half hour to
complete.

-- Steve

