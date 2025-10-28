Return-Path: <linux-kbuild+bounces-9292-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65DC142FD
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 11:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0B1419C84EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 10:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E553B30B527;
	Tue, 28 Oct 2025 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="Sgh5FnTR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826DF30DD39;
	Tue, 28 Oct 2025 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761648204; cv=none; b=K23HGKIxDQ1cSrYgZCxSTeVuEYt2kx6hB2wcKvQImOD0vG2YA1nmD0pqSerBzb63qUEgS/Usli88JdP1QxFu/pMck/gtP8jgfwZN8xScVzx5ijs6TkaBiY2H5z7wI2WIX4ZSn6tqMMiHPXhtRsHfazyKp+SzH5FkYQu3DBucAzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761648204; c=relaxed/simple;
	bh=mvz4HjuDEpODuwd+rRUJvdj4E0chSyIlcalkMDx80Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9dui6u7MN75reOXlAgl89e2ZT5pYb7xTZt5A13wmsVxdwq8f/9hd82Zo+slnFEHWuLZvlH48u32RWeR1Gs0l4aZZXuzyjq+Vsp6UORD7PL0ntDyfXGyqyz470CvZbSEXm+/Lk11ITg5FIYriGz0AX9oLZHDsKw7YLPJwBhTqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=Sgh5FnTR; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D999A284CB9;
	Tue, 28 Oct 2025 11:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1761648198; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KubPbES/ckVE0akiSyPlNILoL2AL04yp4rZ55Ho1l5o=;
	b=Sgh5FnTRSplJ2R7kvkLgTquZzY1+6UJHKjGmjXnx6byHCfHNkpgEol5nm3sDgKZ1yz2RH6
	tGLvqpPJey4X/FbWGaXKFzpNhYSbjeZwtLfVTobAapCesZZ4xxM6DDS8SpnXdUkr0FJkiJ
	LPo8IwcqMHLsHJk8wW2olevWZqVQcQRHFbtdrAGmacEmsHd3IBA54FqpmTiTUaMfPYvfG9
	QYTjcJeQuPVx4f01mn2TyRHR4+rXcKd15EhZ94vW/QJcXo1iFqXXu4jark7kXOcPo0Q9Kc
	3OXywmlhbMnGtzQ7i8t5A7qyyh0INrjOvrcTQzNCFwFv1+e4kXonOMVIbBcnzA==
Message-ID: <b1e13b0b-19fa-4177-8ae1-0fcbf6d076c6@cachyos.org>
Date: Tue, 28 Oct 2025 11:43:15 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v4 0/2] kbuild: distributed build support for Clang
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
References: <20251027220914.2665978-1-xur@google.com>
Content-Language: pl
From: Piotr Gorski <piotrgorski@cachyos.org>
In-Reply-To: <20251027220914.2665978-1-xur@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

I tried using this on kernel 6.17.5, but unfortunately I get this error. 
I previously tested the version in CachyOS: 
https://github.com/CachyOS/linux/commit/68984063b5e27854272241549e47cb2930ef9710 
and https://github.com/CachyOS/linux/ 
commit/00a3ff73a566b7e27b4ced46af4ce27177d9fc37 and everything works fine.

/bin/sh: -c: line 1: syntax error near unexpected token `('
/bin/sh: -c: line 1: `set -e;    trap 'rm -f 
drivers/net/wireguard/main.o; trap - HUP; kill -s HUP $$' HUP; trap 'rm 
-f drivers/net/wireguard/main.o; trap - INT; kill -s INT $$' INT;  trap 
'rm -f drivers/net/wireguard/main.o
; trap - QUIT; kill -s QUIT $$' QUIT;  trap 'rm -f 
drivers/net/wireguard/main.o; trap - TERM; kill -s TERM $$' TERM; trap 
'rm -f drivers/net/wireguard/main.o; trap - PIPE; kill -s PIPE $$' PIPE; 
printf '\n%s\n' 'saved_c_flag
s_drivers/net/wireguard/main.o := -D__KERNEL__ --target=x86_64-linux-gnu 
-fintegrated-as -Werror=ignored-optimization-argument 
-Werror=option-ignored -std=gnu11 -fshort-wchar -funsigned-char 
-fno-common -fno-PIE -fno-strict-a
liasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx 
-fcf-protection=branch -fno-jump-tables -m64 -falign-loops=1 -mno-80387 
-mno-fp-ret-in-387 -mstack-alignment=8 -mskip-rax-setup -march=znver4 
-mno-red-zone -mcmodel=kern
el -mstack-protector-guard-reg=gs 
-mstack-protector-guard-symbol=__ref_stack_chk_guard -Wno-sign-compare 
-fno-asynchronous-unwind-tables -mretpoline-external-thunk 
-mindirect-branch-cs-prefix -mfunction-return=thunk-extern -m
harden-sls=all -fpatchable-function-entry=16,16 
-fno-delete-null-pointer-checks -O3 -fstack-protector-strong 
-ftrivial-auto-var-init=zero -fno-stack-clash-protection -pg -mfentry 
-DCC_USING_NOP_MCOUNT -DCC_USING_FENTRY -fno-l
to -flto=thin -fsplit-lto-unit -fvisibility=hidden -falign-functions=16 
-fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check 
-fno-builtin-wcslen -Wall -Wextra -Wundef 
-Werror=implicit-function-declaration -Werror=impl
icit-int -Werror=return-type -Wno-format-security -Wno-trigraphs 
-Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations 
-Wmissing-prototypes -Wframe-larger-than=2048 -Wno-gnu 
-Wno-format-overflow-non-kprintf
-Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe 
-Wno-pointer-sign -Wcast-function-type 
-Wno-unterminated-string-initialization -Wimplicit-fallthrough 
-Werror=date-time -Wenum-conversion -Wunused -Wno-unused-
but-set-variable -Wno-unused-const-variable -Wno-format-overflow 
-Wno-override-init -Wno-pointer-to-enum-cast 
-Wno-tautological-constant-out-of-range-compare -Wno-unaligned-access 
-Wno-enum-compare-conditional -Wno-missing-fi
eld-initializers -Wno-type-limits -Wno-shift-negative-value 
-Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g 
-gdwarf-5 -D'pr_fmt(fmt)=KBUILD_MODNAME ": " fmt'' >> 
drivers/net/wireguard/.main.o.cmd'
make[5]: *** [scripts/Makefile.build:287: drivers/net/wireguard/main.o] 
Error 2
make[5]: *** Deleting file 'drivers/net/wireguard/main.o'
make[4]: *** [scripts/Makefile.build:556: drivers/net/wireguard] Error 2

LLVM/CLANG: 21.1.4

If necessary, I can send more logs.

Best regards,

Piotr

W dniu 27.10.2025 o 23:09, xur@google.com pisze:
> From: Rong Xu <xur@google.com>
>
> This V4 is based on the reimplementation provided by Masahiro Yamada
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

