Return-Path: <linux-kbuild+bounces-2516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD93930BCA
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 23:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCC1B1F219BA
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 21:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCB63D97A;
	Sun, 14 Jul 2024 21:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CoP74KCh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D7A17995;
	Sun, 14 Jul 2024 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720993413; cv=none; b=I8cKlkf5oug5zvVaEsFakdqz+SpMHa2CE5DG8/G1ECHqQrFXk2BbXalk4Kq76Np6RoCy4UTnJ1mV1hWHbV91AbfUEXBeCS04X9KwMjWMpkns+TC+bvJvfDFXqQDv1/v+cRHCTPkF47kdQ4wfZvKwzIUHXjzHxqldTp30b1LWFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720993413; c=relaxed/simple;
	bh=ct0qPOqX44pf411JPF6Z0tkH2qji7IzJANyguHIxcBY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pX9iGx+xq/kfTLgzV0QLtDGb5QuZCLIEhIs+fFRltWueBV4qwtQD6++7Id6icERfxcKiHycY/6LK7ImIjtS/r3H3YYsFPeUSDv/QhQTPBUxglceIrUZbW114temsrXpXt4SlPabqFMirkhLA2m+IRhElR0uX4HFgEj48lG/Jm3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CoP74KCh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826B9C116B1;
	Sun, 14 Jul 2024 21:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720993412;
	bh=ct0qPOqX44pf411JPF6Z0tkH2qji7IzJANyguHIxcBY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=CoP74KChCxzdVDbeMwom84ufBP1oMU/0yYQGqG/TkB2m/jLH9SNsqYYdFSam1K3vq
	 C5IaHq/FpDN6fCvx8vYdTUtvuZFhT/b54D1ZEBgIGSRhWSLkm0IE23JZr45hB7dyaw
	 is3n2LJKtnuLXmXZqJs2Hav8TWS6p2IMOBIs1oSs6NqZzNt7g09doYlQ3zD2DjLgbu
	 fYZjVrplzAP6H82xoCm+tDFZLPLcLRcw0un2Qgqs7eiy9GK7ue4NcYgdWIwPS4EaLx
	 AibFklS9lLxAQgf8glyPy8C9wbaeg5i3o1I1P34YwFj538cJ9/coHKGwRv5nJLXI7t
	 XFSZSFgK+BQWw==
Date: Sun, 14 Jul 2024 14:43:27 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>, Marco Elver <elver@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] fortify: fix warnings in fortify tests with KASAN
User-Agent: K-9 Mail for Android
In-Reply-To: <20240714170847.2029108-1-masahiroy@kernel.org>
References: <20240714170847.2029108-1-masahiroy@kernel.org>
Message-ID: <BCF87531-EBAE-4942-ADC7-BAF27EF7CC43@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On July 14, 2024 10:04:32 AM PDT, Masahiro Yamada <masahiroy@kernel=2Eorg>=
 wrote:
>When a software KASAN mode is enabled, the fortify tests emit warnings
>on some architectures=2E
>
>For example, for ARCH=3Darm, the combination of CONFIG_FORTIFY_SOURCE=3Dy
>and CONFIG_KASAN=3Dy produces the following warnings:
>
>    TEST    lib/test_fortify/read_overflow-memchr=2Elog
>  warning: unsafe memchr() usage lacked '__read_overflow' warning in lib/=
test_fortify/read_overflow-memchr=2Ec
>    TEST    lib/test_fortify/read_overflow-memchr_inv=2Elog
>  warning: unsafe memchr_inv() usage lacked '__read_overflow' symbol in l=
ib/test_fortify/read_overflow-memchr_inv=2Ec
>    TEST    lib/test_fortify/read_overflow-memcmp=2Elog
>  warning: unsafe memcmp() usage lacked '__read_overflow' warning in lib/=
test_fortify/read_overflow-memcmp=2Ec
>    TEST    lib/test_fortify/read_overflow-memscan=2Elog
>  warning: unsafe memscan() usage lacked '__read_overflow' symbol in lib/=
test_fortify/read_overflow-memscan=2Ec
>    TEST    lib/test_fortify/read_overflow2-memcmp=2Elog
>  warning: unsafe memcmp() usage lacked '__read_overflow2' warning in lib=
/test_fortify/read_overflow2-memcmp=2Ec
>     [ more and more similar warnings=2E=2E=2E ]
>
>Commit 9c2d1328f88a ("kbuild: provide reasonable defaults for tool
>coverage") removed KASAN flags from non-kernel objects by default=2E
>It was an intended behavior because lib/test_fortify/*=2Ec are unit
>tests that are not linked to the kernel=2E
>
>As it turns out, some architectures require -fsanitize=3Dkernel-(hw)addre=
ss
>to define __SANITIZE_ADDRESS__ for the fortify tests=2E
>
>Without __SANITIZE_ADDRESS__ defined, arch/arm/include/asm/string=2Eh
>defines __NO_FORTIFY, thus excluding <linux/fortify-string=2Eh>=2E
>
>This issue does not occur on x86 thanks to commit 4ec4190be4cf
>("kasan, x86: don't rename memintrinsics in uninstrumented files"),
>but there are still some architectures that define __NO_FORTIFY
>in such a situation=2E
>
>Set KASAN_SANITIZE=3Dy explicitly to the fortify tests=2E
>
>Fixes: 9c2d1328f88a ("kbuild: provide reasonable defaults for tool covera=
ge")
>Reported-by: Arnd Bergmann <arnd@arndb=2Ede>
>Closes: https://lore=2Ekernel=2Eorg/all/0e8dee26-41cc-41ae-9493-10cd1a8e3=
268@app=2Efastmail=2Ecom/
>Signed-off-by: Masahiro Yamada <masahiroy@kernel=2Eorg>
>---
>
>Kees Cook said "I'll try to figure this out", but I have not seen a patch=
 so far,
>so I decided to do this myself=2E
>(https://lore=2Ekernel=2Eorg/all/202405310908=2EA5733DF@keescook/)
>
>I will send a pull req with this and some other fixes=2E
>I need to fix this, as v6=2E10 will be released soon=2E

Awesome! Thanks for figuring this out; I hadn't had time yet=2E=20

Acked-by: Kees Cook<kees@kernel=2Eorg>


--=20
Kees Cook

