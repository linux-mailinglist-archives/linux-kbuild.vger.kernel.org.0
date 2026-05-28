Return-Path: <linux-kbuild+bounces-13389-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJteDa9iGGpEjggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13389-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 17:43:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0C5F4940
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 17:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD498314A56E
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 15:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5783FFAC5;
	Thu, 28 May 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCqrU2zt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D5E3F8891;
	Thu, 28 May 2026 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981368; cv=none; b=KvYF2tB5uqjAxMeoqNx2wu8KI8M3t9482aeVaHvT4OwdMEqeVKlRYdyjFofiSbSYzLM+shLa4HQaDaQwjzSAGwGL6nfXxpNJKd25hDBd+PLlvjSR5E6A0G/a9cXKZoLGcBEpjJzwxj6APNsehw+aocdBJ4+j2IVkuU5N7mWwDJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981368; c=relaxed/simple;
	bh=DuX8DmAT8RS1FYvxCBdD2I72qxpxRUPLspG2lqxUMtc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gG83V1uHiUxNZ7wc7yP3YPFEKwaTy4W4E1RU2+sReW5ln9MzmIzxRVkaN13Y9g9LMH3PW5n6aiFkBEU3UVEgF0cHHaGmIbtoBda0QBFNEJjJqco6/iynnReYI3Tdg0fXjjh5R44AS/uBsw5So9xy+8G9wlF+akdh8Z5GeU2UYvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCqrU2zt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDA81F000E9;
	Thu, 28 May 2026 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779981331;
	bh=HQHnrduYkLIQPN9kstDdzYmZdGNBjAz+GZwnoeuo5tE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gCqrU2ztprPL374XOf6jHhvfeHzl4eVYmYnUhVlYNZUAfeGkoLRAq1FdTLM2m1tLV
	 j2G+q/8rBKa2B8RqtNKVmY876t++NW9/Xp/I/aVgg/dMkOnwhZecydojIM78lXf0rg
	 FjIRJYMy5QSn0hq2x7gnBSXOjPPNpGEqkeV8OJdWUYy3PvYjSpAipMgpgWxUvmlizP
	 zwa5TgAaJaQRZVbHqEN2eFftGe1EysiU5vS2jnh9Gz9vmDzEA826VnTHT3JhQrNioj
	 GzZXZHJSPz+zAKnji5YDNksII0Fm94aZV/zSIMCrPSem7i3xpxwfjweJNshha5Svv3
	 2ItwaubdoBubA==
Date: Fri, 29 May 2026 00:15:19 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor
 <nathan@kernel.org>, paulmck@kernel.org, Nicolas Schier <nsc@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/4] bootconfig: embed kernel.* cmdline at build time
Message-Id: <20260529001519.14ca9dbe92fb2622249137c6@kernel.org>
In-Reply-To: <20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org>
References: <20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13389-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: A2B0C5F4940
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 09:41:33 -0700
Breno Leitao <leitao@debian.org> wrote:

> The userspace pieces (xbc_snprint_cmdline() in lib/, tools/bootconfig -C)
> already landed; this series wires the rendered cmdline into the kernel.
> 
> Motivation: today the embedded bootconfig is parsed at runtime, after
> parse_early_param() has already run, so early_param() handlers can't
> see embedded values. Folding the kernel.* subtree into the cmdline at
> build time gives a CONFIG_CMDLINE-equivalent for embedded-bootconfig
> users without forcing them to maintain two cmdline sources.
> 
> Behaviorally, the "kernel" subtree is rendered to a flat string at
> build time and stashed in .init.rodata. setup_arch() prepends it to
> boot_command_line before parse_early_param() runs. Overflow is a soft
> error: the helper logs and leaves boot_command_line untouched rather
> than panicking, so an oversized embedded bconf cannot brick a boot.
> 

Thanks Breno, yes, that is what I think about.
Let me check it. And could you also check Sashiko's comments?

https://sashiko.dev/#/patchset/20260527-bootconfig_using_tools-v1-0-b6906a86e7d5%40debian.org

Thanks,

> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Breno Leitao (4):
>       bootconfig: return 0 from xbc_snprint_cmdline() for a leaf root
>       bootconfig: render embedded bootconfig as a kernel cmdline at build time
>       bootconfig: add xbc_prepend_embedded_cmdline() helper
>       x86/setup: prepend embedded bootconfig cmdline before parse_early_param
> 
>  Makefile                   |  5 ++++
>  arch/x86/Kconfig           |  1 +
>  arch/x86/kernel/setup.c    |  3 +++
>  include/linux/bootconfig.h |  7 ++++++
>  init/Kconfig               | 33 ++++++++++++++++++++++++++
>  init/main.c                | 19 ++++++++++++---
>  lib/Makefile               | 16 +++++++++++++
>  lib/bootconfig.c           | 58 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/embedded-cmdline.S     | 16 +++++++++++++
>  tools/bootconfig/Makefile  |  2 +-
>  10 files changed, 156 insertions(+), 4 deletions(-)
> ---
> base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
> change-id: 20260508-bootconfig_using_tools-cfa7aa9d6a5a
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

