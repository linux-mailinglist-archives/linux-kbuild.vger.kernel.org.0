Return-Path: <linux-kbuild+bounces-9301-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0F5C16986
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 20:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7CEFD34996A
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 19:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC57B34E750;
	Tue, 28 Oct 2025 19:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="PrREbZWX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0295E34E769;
	Tue, 28 Oct 2025 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761679382; cv=none; b=WfwLDTexs290Eawnq9bA+vW+zagA3dSKTlTu/OE47cKLmm4kbKPA+2Z7e0evJqB4fODxt99gKxeVs9uUSEc4fBpk2I45e+zYiS8J/ZBj9wsABUNPWBk6ZeUI+omQ5aRsEACdH/Em7AGd3/NySBcOLjGjBjpsbw+ZxuxdHclITSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761679382; c=relaxed/simple;
	bh=FF4Qf51HeniU4/6NrIYJ51oAsFYjuewiaqxPEZwmODo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/oHyQYsihB2ft6H2VhCUi8PLKhejkI5wSi5B0ip0K56vrCnRfoM7CND/5IbrlOj5lJ5ej7B6+6JbA5HC4D07Cd2OuslQfDSOF3k6L8nvTaFeNR8HfK/1LgTT6y/8ePchrLVmEXGCnyC3gm7z5EwpPqSSlJmZm8eFHLsfvkl07s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=PrREbZWX; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6F96284C45;
	Tue, 28 Oct 2025 20:22:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1761679377; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=hYvNMVjeKzw3MzT3PrZtTs9nPaVHSX4F+oxSbDdwhj0=;
	b=PrREbZWXHDEuoRfTiEJjARFeYMjjlovinN+BSgkoA/5g+0Bky4Jr7HnVE5wshV5jJiwyS4
	5PGtMsKEDQi5Yt6ZM1NyyX2a7XKDWbdLtTsOkfQrPMUupn1O58JXTdyP7WTaeMY0m1o8QN
	co2osOmSfBr8lWT3X4c/g08qCpWv2Q3+BF+lBIFPqhPIp9ZGi1jes5atFQU7OQUdPuhDcJ
	chcdyCu3nYsRnY96jgKOlm0oVToI7NjdAdUU6J8fl364FLip9wqCATFqs6pzkf/gOoxj6i
	KVWrFslZTk9zKq4lxed1bXEUJ+O5tSRQpRtFTJNsFLtJ+bxGF0EEI85AdRfTZw==
Message-ID: <ff40b07b-bc22-4588-ad17-c38b7b4d9867@cachyos.org>
Date: Tue, 28 Oct 2025 20:22:51 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang
 ThinLTO
To: xur@google.com, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Stafford Horne <shorne@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20251028182822.3210436-1-xur@google.com>
Content-Language: pl
From: Piotr Gorski <piotrgorski@cachyos.org>
In-Reply-To: <20251028182822.3210436-1-xur@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Built and booted without any problems.

lucjan at cachyos ~ 20:19:27
❯ zgrep -i THIN_DIST /proc/config.gz
CONFIG_LTO_CLANG_THIN_DIST=y
lucjan at cachyos ~ 20:19:45
❯ cat /proc/version
Linux version 6.17.5-1.3-cachyos (linux-cachyos@cachyos) (clang version 
21.1.3, LLD 21.1.4) #1 SMP PREEMPT_DYNAMIC Tue, 28 Oct 2025 18:39:23 +0000

Thanks!

W dniu 28.10.2025 o 19:28, xur@google.com pisze:
> From: Rong Xu <xur@google.com>
>
> ChangeLog:
>
> V5: Handle single quote escaping in echo _c_flags to fix
>      Piotr Gorski's reported error.
>
> V4: This is based on the reimplementation provided by Masahiro Yamada
> on May 26. The difference is that this version now saves the compiler
> flags (_c_flags) from the Front-End (FE) compilation and re-uses them
> for the subsequent Back-End (BE) compilation.
>   
> Rong Xu (2):
>    kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
>    kbuild: distributed build support for Clang ThinLTO
>
>   .gitignore                 |  2 +
>   Makefile                   | 25 +++++-------
>   arch/Kconfig               | 19 +++++++++
>   scripts/Makefile.lib       |  7 ++++
>   scripts/Makefile.thinlto   | 40 ++++++++++++++++++
>   scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
>   scripts/mod/modpost.c      | 15 +++++--
>   7 files changed, 174 insertions(+), 17 deletions(-)
>   create mode 100644 scripts/Makefile.thinlto
>   create mode 100644 scripts/Makefile.vmlinux_a
>
>
> base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa

