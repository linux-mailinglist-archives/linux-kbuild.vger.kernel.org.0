Return-Path: <linux-kbuild+bounces-12340-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA8KFp2HyWmxywUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12340-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 22:12:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF02353EEE
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 22:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0521C3008882
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 20:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26F137F8A4;
	Sun, 29 Mar 2026 20:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kM+S6d42"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E336C5BD;
	Sun, 29 Mar 2026 20:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774815125; cv=none; b=dJlmWXxXylq+oTQYKpv5PMTA67JZzvAPHvMqzAZGlfxsDIb/3rVAeyUqaK8XtoTohg93B1rdtOA0xsFeBRRdt31HlSEBm9DBiZKjJhwKq7kf/BznlEntvW+MpeduK8zJgD1I/uFxjlkOZM0jUrrWHjXlXQnih7qPZPQ4fstpSLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774815125; c=relaxed/simple;
	bh=nPRmI4B+iD+MY+S2S0Ef0f0gZ+pjMlhctm3P7IyJ5tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQDK03Ok6tifGoxiYt84aTHj496NQJ7iSv0suFFx1SviEgo/jLJkMVit51D0wDQFicDVaZNoh0FevUBMfm+HQqc89LSQmybLd1y0DbwowVCwRaje78T/EbIgXb6VZ9tWqW/SVvvp0l6P7s5ftxvAKJzXPlG7cSKunyABWPsnGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kM+S6d42; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3E6C116C6;
	Sun, 29 Mar 2026 20:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774815125;
	bh=nPRmI4B+iD+MY+S2S0Ef0f0gZ+pjMlhctm3P7IyJ5tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kM+S6d42khvq6mHokYYnMtYTiIHWKiRyDMc1EdG96jnOtScrHzqVx3g5EO6vBwidc
	 EVB+kDTc+uyBjT3dhBpsGQOafS1J/qNHMbd3PK0BvEWnScz1n77cgjhbLJVPXFjlqt
	 UCeE1Hd6CgDi//kLWZ4K0wi6YlbtXArvxjSMsLfY+Iur6KOrJS7fF8OMEpP0AGVV5i
	 YiIGUjDy/vkJllGw+ZnL21ageGPJAsb8vdfqB681B/fhuUOJlbUg23bqH43XflKUBJ
	 9dPicXQIt0xleg1QnahmL3oWCT5/av1t2btgW0YDmOU0I7Uj2LRjGWN72oNwPwXmnk
	 vE4F927/e8aXw==
Date: Sun, 29 Mar 2026 22:05:02 +0200
From: Nicolas Schier <nsc@kernel.org>
To: xur@google.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v7 3/3] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <acmF7nvIh2nX5hjK@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>, xur@google.com,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20260328011927.3569802-1-xur@google.com>
 <20260328011927.3569802-4-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328011927.3569802-4-xur@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12340-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,llvm.org:url]
X-Rspamd-Queue-Id: BDF02353EEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 01:19:27AM +0000, xur@google.com wrote:
> From: Rong Xu <xur@google.com>
> 
> Add distributed ThinLTO build support for the Linux kernel.
> This new mode offers several advantages: (1) Increased
> flexibility in handling user-specified build options.
> (2) Improved user-friendliness for developers. (3) Greater
> convenience for integrating with objtool and livepatch.
> 
> Note that "distributed" in this context refers to a term
> that differentiates in-process ThinLTO builds by invoking
> backend compilation through the linker, not necessarily
> building in distributed environments.
> 
> Distributed ThinLTO is enabled via the
> `CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
>  > make LLVM=1 defconfig
>  > scripts/config -e LTO_CLANG_THIN_DIST
>  > make LLVM=1 oldconfig
>  > make LLVM=1 vmlinux -j <..>
> 
> The build flow proceeds in four stages:
>   1. Perform FE compilation, mirroring the in-process ThinLTO mode.
>   2. Thin-link the generated IR files and object files.
>   3. Find all IR files and perform BE compilation, using the flags
>     stored in the .*.o.cmd files.
>   4. Link the BE results to generate the final vmlinux.o.
> 
> NOTE: This patch currently implements the build for the main kernel
> image (vmlinux) only. Kernel module support is planned for a
> subsequent patch.
> 
> Tested on the following arch: x86, arm64, loongarch, and
> riscv.
> 
> The earlier implementation details can be found here:
> https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/85934
> 
> Signed-off-by: Rong Xu <xur@google.com>
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  .gitignore                 |  2 ++
>  Makefile                   |  9 +++++----
>  arch/Kconfig               | 19 ++++++++++++++++++
>  scripts/Makefile.lib       |  7 +++++++
>  scripts/Makefile.thinlto   | 40 ++++++++++++++++++++++++++++++++++++++
>  scripts/Makefile.vmlinux_a | 37 +++++++++++++++++++++++++++++++++++
>  scripts/mod/modpost.c      | 15 +++++++++++---
>  7 files changed, 122 insertions(+), 7 deletions(-)
>  create mode 100644 scripts/Makefile.thinlto
> 
[...]
> diff --git a/Makefile b/Makefile
> index 69ccf9b8507d..d474b6f0f212 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1047,11 +1047,11 @@ export CC_FLAGS_SCS
>  endif
>  
>  ifdef CONFIG_LTO_CLANG
> -ifdef CONFIG_LTO_CLANG_THIN
> +ifdef CONFIG_LTO_CLANG_FULL
> +CC_FLAGS_LTO	:= -flto
> +else
>  CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
>  KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
> -else
> -CC_FLAGS_LTO	:= -flto
>  endif
>  CC_FLAGS_LTO	+= -fvisibility=hidden
>  

This hunk is just reordering but does not change any functionality,
right?

Iff yes, I'd skip this one.


Nathan, Piotr: your tags got dropped from v6 to v7.  Do you want to
renew them?

Kind regards
Nicolas

