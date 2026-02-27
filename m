Return-Path: <linux-kbuild+bounces-11476-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMlkCeJRoWkfsAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11476-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 09:12:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F01B44B0
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 09:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A67F30241AF
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 08:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E18E29B204;
	Fri, 27 Feb 2026 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ob31p4eu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4312C859;
	Fri, 27 Feb 2026 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179933; cv=none; b=XKDi1IH8c8icVhbcml38hvi77su78O5H6OxB6LqF4SIeeGqEmnbdpktRnmw+kDJo+bYaYF5dOczYNb/nmxZ5qL1Hb3Dex8vG8lrZlAD+I0zuJusBTMt8QXfCnIdDx57PovFoh/ztc+4U1TBnEknns0eJnRmYnrk4UvKviCW8GyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179933; c=relaxed/simple;
	bh=XxzWQhicsnkxJqpPD5XdtCTMwIo1QdLs1qf0kd9cDs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGcX6e1ntyjrjiHwXjjaHQWuDXZJCnjDs2wcRca2Wxv1lxSOI/F4qhB8Z02EwvArq20ptkNVgedqYPCWTdm/2sbOk/oj+G1O9uGxicf+mKodivS9nq0NzEICbstx30AFZAfzUR/8T3NyujcF8SHvGjW4Bl1mRh2YPCaRsiAj250=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ob31p4eu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C52BC116C6;
	Fri, 27 Feb 2026 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772179932;
	bh=XxzWQhicsnkxJqpPD5XdtCTMwIo1QdLs1qf0kd9cDs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ob31p4euqLzztaD/YNm1tiAft9jn/u7sJvBaBqQCenLFUnWzhYV3/IXKkkQxGwPsW
	 iSXy6mLoIZqahCyw+rx0wtxzE+b/setS2lGl4NkkaGOrTm0v6ABlS/1KABb+AzYj4u
	 j9xBWOi6agU1dYqdGWNh+oeyQcHE116DMlVXuP3aQhkob+iPKtzK2Sr8log4bjWeZv
	 nNJBRV4gQML9bIJhmdm2LWQJIn7Rk09vaVafQGEB8/7YX+wVOGUGSjWxpU6TPD+OnH
	 0vdm/hiELCDZYiRxfH6+7wpLzN/jfhnVtKcwf4NVlzUaRwD5BPjiE3W7InjLR3C4KG
	 aFP/g819rD90Q==
Date: Fri, 27 Feb 2026 08:54:52 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sun Jian <sun.jian.kdev@gmail.com>, Florian Westphal <fw@strlen.de>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] genksyms: Fix parsing a declarator with a preceding
 attribute
Message-ID: <aaFNzDFvMI8TNrNg@derry.ads.avm.de>
References: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,strlen.de,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-11476-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8D1F01B44B0
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 03:07:17PM -0700, Nathan Chancellor wrote:
> After commit 07919126ecfc ("netfilter: annotate NAT helper hook pointers
> with __rcu"), genksyms fails to parse the __rcu annotation when building
> with CONFIG_DEBUG_INFO_BTF=y, CONFIG_PAHOLE_HAS_BTF_TAG=y, and a version
> of clang that supports btf_type_tag.
> 
>   $ clang --version | head -1
>   ClangBuiltLinux clang version 22.1.0 (https://github.com/llvm/llvm-project.git 4434dabb69916856b824f68a64b029c67175e532)
> 
>   $ cat kernel/configs/repro.config
>   CONFIG_BPF_SYSCALL=y
>   CONFIG_MODVERSIONS=y
>   # CONFIG_DEBUG_INFO_NONE is not set
>   CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>   CONFIG_DEBUG_INFO_BTF=y
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig repro.config all
>   WARNING: modpost: EXPORT symbol "nf_nat_ftp_hook" [vmlinux] version generation failed, symbol will not be versioned.
>   ...
>   WARNING: modpost: EXPORT symbol "nf_nat_irc_hook" [vmlinux] version generation failed, symbol will not be versioned.
>   ...
> 
> genksyms falls over parsing the __rcu attribute in the declarator:
> 
>   # Kernel reproducer
>   $ make -skj"$(nproc)" ARCH=x86_64 KCFLAGS=-D__GENKSYMS__ LLVM=1 net/netfilter/nf_conntrack_ftp.i
> 
>   $ scripts/genksyms/genksyms -w <net/netfilter/nf_conntrack_ftp.i &| rg 'syntax error'
>   include/linux/netfilter/nf_conntrack_ftp.h:29: syntax error
>   net/netfilter/nf_conntrack_ftp.c:46: syntax error
> 
>   # Trivial reproducer
>   $ cat test.c
>   int (*func)(void *foo, int bar);
>   int (__attribute__((btf_type_tag("rcu"))) *func_with_attr)(void *foo, int bar);
> 
>   $ scripts/genksyms/genksyms -w <test.c
>   <stdin>:2: syntax error
> 
> Optionally allow an attribute to precede a declarator to resolve this
> error and properly generate symbol versions.
> 
> Fixes: 07919126ecfc ("netfilter: annotate NAT helper hook pointers with __rcu")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I plan to take this via the Kbuild tree for 7.0.
> ---
>  scripts/genksyms/parse.y | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Thanks for the detailed explanation and reproducer!

Tested-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>

