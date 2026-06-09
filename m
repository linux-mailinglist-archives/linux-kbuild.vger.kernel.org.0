Return-Path: <linux-kbuild+bounces-13682-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UjOyI3qkKGoqHAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13682-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:40:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19010664D3B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:40:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Jo25DLt8;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13682-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13682-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88FE6303D8BF
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 23:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3673E7BD5;
	Tue,  9 Jun 2026 23:40:38 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DED370ACE;
	Tue,  9 Jun 2026 23:40:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781048437; cv=none; b=NePIdc0MdxMw343bAj+Y4AIG9RBmG845L1EYdNQ9Jtp8UKYQeK5XkYqOIoadUbi5lHytupleCBBcK8P/gwt/PJjazs33/l2ap2OFl3vxjGb5fkt6lbf7pENA3kmC3/Qc4X4v8FUAmwTmCMkfa6GdWg1kS2PJySsklFRXzCU/54Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781048437; c=relaxed/simple;
	bh=cUPl6GbgtHpFAbSkmB2tZ0f6uqr9N/6A5bxVPT1xDF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u3zNgUr72HnmdkhuXa2wnfsG4Dc5VA4d+0Jt8EsgUBPY3wwGtrY5H4xRcTP8DGyxm+BJICIJOINbXvSJwV4/Gya+/7dTLVffbkDk30N5dJ9YIiRhgqFTGvJFLTglAcpQhDobMYAdrMyE2h3w5vSbN5dUk5rCZSVaDbbQvEoC3T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jo25DLt8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF901F00893;
	Tue,  9 Jun 2026 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781048436;
	bh=zWbtTasqHYZ22NTZEvHP2JSPQq6kl25q5C50kDsT+E4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Jo25DLt8y/eYZGx0wVxq7hpF3pDLq+GnWrC0/AO0oUfdJjL9ndIfdKOcT4FBZx/5P
	 Z2tWoUIJPdOyfiKe2Kg9bTRRL6aK7ryLKnaJ69A4M6216UkUP7pvN7lvgDUq50MRYg
	 /1rzeVP2M62oMtjXZsIH7cm+nmEUuuULWhh4AZTGg/0csLMisbFoowh0pI2hVqexIp
	 jGwKY11YAMv8chHr6RmC/+12KP6fKFd3HoyD7Uweg9aQ7z/OzimqiStVy4QfII5CYq
	 6sDd/+XD1sjXTmpeaGzC33yqbz35gRFaIsn2o12RwX3kaQInYNdLtUevamI2Mhtb4B
	 oaOF3cMYwPJpg==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arm-kernel@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
Subject: Re: [PATCH v2 00/16] Bump minimum version of LLVM for building the
 kernel to 17.0.1
Message-Id: <178104773630.2704789.17858317658280322569.b4-ty@b4>
Date: Tue, 09 Jun 2026 16:28:56 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3318; i=nathan@kernel.org;
 h=from:subject:message-id; bh=cUPl6GbgtHpFAbSkmB2tZ0f6uqr9N/6A5bxVPT1xDF4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkaS3IPsivujN14IlVvd5DxTcUlU/e9+jdRk8kvq+dbf
 cHdx/90O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEdr5mZNiTt59J7VTM/K2v
 O/fyv5M5fzHhZbORdoB/UO3ffVtuSXszMvwzu30mYUfBRMtKrwu9x/rrlisuX/pr+9lt+mEBEj8
 MOVkB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:nsc@kernel.org,m:morbo@google.com,m:justinstitt@google.com,m:nick.desaulniers+lkml@gmail.com,m:nathan@kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-hardening@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:xur@google.com,m:shenhan@google.com,m:linux@armlinux.org.uk,m:arnd@arndb.de,m:linux-arm-kernel@lists.infradead.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:linux-riscv@lists.infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:ardb@kernel.org,m:peterz@infradead.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13682-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19010664D3B

On Sun, 17 May 2026 13:05:03 -1000, Nathan Chancellor wrote:
> Bump minimum version of LLVM for building the kernel to 17.0.1
> 
> The current minimum version of LLVM for building the kernel is 15.0.0.
> However, there are two deficiencies compared to GCC that were fixed in
> LLVM 17 that are starting to become more noticeable.
> 
> The first was a bug in LLVM's scope checker [1], where all labels in a
> function were validated as potential targets of an asm goto statement,
> even if they were not listed in the asm goto statement as targets. This
> becomes particularly problematic when the cleanup attribute is used, as
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[01/16] kbuild: Bump minimum version of LLVM for building the kernel to 17.0.1
        https://git.kernel.org/kbuild/c/ce3267a39a92b
[02/16] security/Kconfig.hardening: Remove tautological condition from CC_HAS_ZERO_CALL_USED_REGS
        https://git.kernel.org/kbuild/c/813fe686e90b4
[03/16] security/Kconfig.hardening: Remove tautological condition from FORTIFY_SOURCE
        https://git.kernel.org/kbuild/c/8ad2017578c99
[04/16] security/Kconfig.hardening: Remove tautological condition from CC_HAS_RANDSTRUCT
        https://git.kernel.org/kbuild/c/9331258bc129a
[05/16] arch/Kconfig: Remove tautological conditions from HAS_LTO_CLANG
        https://git.kernel.org/kbuild/c/2189cb1a80f06
[06/16] arch/Kconfig: Remove tautological condition from AUTOFDO_CLANG
        https://git.kernel.org/kbuild/c/de0bf1e138fcd
[07/16] ARM: Drop tautological ld.lld conditions from ARCH_MULTI_V4{,T}
        https://git.kernel.org/kbuild/c/48d229b6a48ae
[08/16] riscv: Remove tautological condition from selection of ARCH_SUPPORTS_CFI
        https://git.kernel.org/kbuild/c/62c4af8689511
[09/16] riscv: Drop tautological condition from TOOLCHAIN_NEEDS_OLD_ISA_SPEC
        https://git.kernel.org/kbuild/c/7e279976cf2a2
[10/16] scripts/Makefile.warn: Drop -Wformat handling for clang < 16
        https://git.kernel.org/kbuild/c/2a35c63c6bc42
[11/16] x86/build: Drop unnecessary '-ffreestanding' addition to KBUILD_CFLAGS
        https://git.kernel.org/kbuild/c/7b3281fcb43c5
[12/16] x86/module: Revert "Deal with GOT based stack cookie load on Clang < 17"
        https://git.kernel.org/kbuild/c/12b7bf92bddd4
[13/16] x86/entry/vdso32: Remove conditional omission of '.cfi_offset eflags'
        https://git.kernel.org/kbuild/c/4e7af20d0d104
[14/16] kbuild: Remove check for broken scoping with clang < 17 in CC_HAS_ASM_GOTO_OUTPUT
        https://git.kernel.org/kbuild/c/f3de78cb19d12
[15/16] compiler-clang.h: Remove __cleanup -Wunused-variable workaround
        https://git.kernel.org/kbuild/c/c69eaa687667e
[16/16] compiler-clang.h: Drop explicit version number from "all" diagnostic macro
        https://git.kernel.org/kbuild/c/c919893eabb43

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



