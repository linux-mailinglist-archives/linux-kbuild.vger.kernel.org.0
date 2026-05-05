Return-Path: <linux-kbuild+bounces-13019-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gt0JvG0+WnUAwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13019-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 11:14:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45D4C95F5
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 11:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 883CF307A8AC
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 09:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E8F41C302;
	Tue,  5 May 2026 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMb9118o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514D3F23A2;
	Tue,  5 May 2026 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971946; cv=none; b=jHolpN3ai4+mUQw7F7F1K2NcF2gXD/PcRTiMO9luxu0Z5nGtN/y5CeC4TwzXdBgbbjmw/t1p05Zpvz7El4Zwxru+JvOs0niJciH9Dm3tK9S/Yt90rNEsavrqw34s2ySgEixuk8aVPmaz7d1kkmusl5S1FybmZ03ZcvEF8SrT72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971946; c=relaxed/simple;
	bh=4UCQ3QN2QWNXrWHKBHRPi0SoBfJaK8yevcbCvXDwQRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b2oGQrT8SjO7s7UbpT3qIFJ+XHGUGsDK8TTy1YRhLlPEx0gI2/r6xUqTY5DS2IXxtnVSOFwrbuCGPvXLCx7ACy4BIIUibS1PcT8Ecc5k3NffwFWzSN5Y1yiwnEOc9Pqt6JYDXIPR7XMR8BPhx0lthn5mWloObNu8/ARFfC2FHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMb9118o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F0FC2BCC9;
	Tue,  5 May 2026 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777971946;
	bh=4UCQ3QN2QWNXrWHKBHRPi0SoBfJaK8yevcbCvXDwQRI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=RMb9118oEn/g2hQTEza+TcqN7fPkdsI+GbNLQYi2lM1GOv21ELF6l+bC5+TntjDzH
	 z8WagyI9GdPcttqqk7+L84RwC6zYv/Z6FreCuTwN/4IMpJ2GSegMnZSO6C56M7wsJa
	 at05/XZ3+2/5Lp4WM6Pl2RO3l5wLuderbvA0cVxI3TEpFh/3Ot08pzI3vt0zenbhxE
	 kUYkSg6Uk9x1HhJ5pnAX03SvxvnERm5cOs9CPSf+IIwE6uM45CRUn8wrpa3M7Hz7aq
	 c7XYAkdSdkQbfJeVpGkwUNgK2kB4uSVsm9uneXL4M4ynU6lQhoZNuVdt9SGqDxmg0D
	 9LZh2ZiC5KzTg==
Message-ID: <c8249a6d-55ee-4ad2-83ac-c25f86759a46@kernel.org>
Date: Tue, 5 May 2026 11:05:35 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/6] objtool: Fixup alternate feature relative
 addresses
To: Sathvika Vasireddy <sv@linux.ibm.com>, nathan@kernel.org, nsc@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 jpoimboe@kernel.org, peterz@infradead.org, ojeda@kernel.org,
 masahiroy@kernel.org, lossin@kernel.org, tamird@kernel.org,
 thomas.weissschuh@linutronix.de, rostedt@goodmis.org,
 ihor.solodrai@linux.dev, thuth@redhat.com, pmladek@suse.com,
 aliceryhl@google.com, elver@google.com, kees@kernel.org, legion@kernel.org,
 ardb@kernel.org, yuxuan.zuo@outlook.com, alexghiti@rivosinc.com,
 alexandre.chartre@oracle.com, bp@alien8.de, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260505084628.17940-1-sv@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260505084628.17940-1-sv@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EC45D4C95F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,infradead.org,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13019-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ozlabs.org:url]



Le 05/05/2026 à 10:46, Sathvika Vasireddy a écrit :
> This patch series implements build-time fixup of alternate feature
> relative addresses for powerpc.
> 
> Previously, Nicholas Piggin proposed a build-time solution using a
> custom PowerPC tool [1], which provided the foundation for this approach.
> The current implementation leverages objtool's existing ELF parsing
> infrastructure to do the same.

What are the changes since last RFC 
https://lore.kernel.org/linuxppc-dev/20260316062237.30948-1-sv@linux.ibm.com/

> 
> This patchset applies atop powerpc/merge branch.
> 
> [1] Original PowerPC tool approach:
>      http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20170521010130.13552-1-npiggin@gmail.com/
> 
> Testing:
> Build and Boot tested on ppc64le, ppc64be, and ppc32be configs.
> 
> Sathvika Vasireddy (6):
>    objtool/powerpc: Add build-time fixup of alternate feature branch
>      targets
>    objtool: Set ELF_F_LAYOUT flag to preserve vmlinux segment layout
>    objtool: Fix "can't find starting instruction" warnings on vmlinux
>    objtool/powerpc: Skip jump destination analysis and unnanotated
>      intra-function call warnings for --ftr-fixup
>    kbuild: Add objtool integration for PowerPC feature fixups
>    powerpc: Enable build-time feature fixup processing by default
> 
>   Makefile                                  |   7 +
>   arch/powerpc/Kconfig                      |   3 +
>   arch/powerpc/Makefile                     |   5 +
>   arch/powerpc/include/asm/feature-fixups.h |   2 +-
>   arch/powerpc/kernel/vmlinux.lds.S         |   8 +-
>   arch/powerpc/lib/feature-fixups.c         |  12 -
>   scripts/Makefile.lib                      |   4 +-
>   scripts/Makefile.vmlinux                  |  11 +-
>   tools/objtool/arch/powerpc/decode.c       |  15 +-
>   tools/objtool/arch/powerpc/special.c      | 451 ++++++++++++++++++++++
>   tools/objtool/builtin-check.c             |   2 +
>   tools/objtool/check.c                     |  57 ++-
>   tools/objtool/elf.c                       |   4 +
>   tools/objtool/include/objtool/builtin.h   |   1 +
>   tools/objtool/include/objtool/special.h   |  56 +++
>   tools/objtool/special.c                   |  29 ++
>   16 files changed, 637 insertions(+), 30 deletions(-)
> 


