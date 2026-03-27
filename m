Return-Path: <linux-kbuild+bounces-12312-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBa0JC86xmm7HgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12312-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 09:05:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31512340BEA
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 09:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D15B2304FC89
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 08:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4233CF038;
	Fri, 27 Mar 2026 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFbL7bSg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F353CE4A3;
	Fri, 27 Mar 2026 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598561; cv=none; b=BRwu1DnRN17DQEnzigcOT0ArWxeTpJRMAq//+EH+fds5pHV0LodsuRULvbaInXnEnrCnyoVw6ghvM/h5aoksGJI93Va2+W825NIHVRt6L9IOqNtfjlh521zhpxSpHVrdNWDsQJOTfoo4SwPSTJdT8XIMfCt1/U0hplcg7EVeATA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598561; c=relaxed/simple;
	bh=4yElemxoldf70eF7hcKaNFQI55z5oAEHZ7RUijBnr5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnXXyH0JHFifqD0m9bYVYtdzkyE9y4UC2uc/QhhvA/wptMHZ85TFYdoxe4janVV6ZC4WbxICIeeCt4ZAGgYcJM/EKaXOP5p3i7TAWbMcui7FAExnHmtXePXpJEB3vpUvrOV3ZOrIqWms3ROS/KHj8VaoulCQXMlXyUB8IBhUN7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFbL7bSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A62C19423;
	Fri, 27 Mar 2026 08:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774598561;
	bh=4yElemxoldf70eF7hcKaNFQI55z5oAEHZ7RUijBnr5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFbL7bSgskzfoDKi/FKRm0HzHU9+zKYToteP1BoTs7aWO41cGNGhZp7n4eTeSImTt
	 2mA18PnA6LV/NsOUjgeqyhNaZQTW7mHA2MbfJF1MpHHfOffJsApIIjcZWjvDOZmttq
	 0OWn26vWhF5Mu13y7tW7kFvhUkW1lC1Tj9pENYAJVj1CDVZs9nQl6F0VjSzBVP3cQU
	 2+T/bghmhKm0XrIuTIFAmlo4BU89MaNzmobfcOjH5k6GC+8d6JhIfRinRgKeyygR+m
	 i48X9B4VzQj66nfjoFu4j52m+qI91CtPhALF7Z6a9tfPBYH00RnJ9qzaFLA0OntmZn
	 ez/Ec/a9rvlVw==
Date: Fri, 27 Mar 2026 08:59:50 +0100
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
Subject: Re: [PATCH v6 2/2] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <acY49h_jpzbd74vq@levanger>
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
References: <20260316212930.120438-1-xur@google.com>
 <20260316212930.120438-3-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316212930.120438-3-xur@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12312-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31512340BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 09:29:30PM +0000, xur@google.com wrote:
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
> Tested-by: Piotr Gorski <piotrgorski@cachyos.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
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
> diff --git a/.gitignore b/.gitignore
> index 3a7241c941f5..c12bdf5a97f9 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -56,6 +56,7 @@
>  *.zst
>  Module.symvers
>  dtbs-list
> +builtin.order
>  modules.order
>  
>  #
> @@ -67,6 +68,7 @@ modules.order
>  /vmlinux.32
>  /vmlinux.map
>  /vmlinux.symvers
> +/vmlinux.thinlto-index
>  /vmlinux.unstripped
>  /vmlinux-gdb.py
>  /vmlinuz
> diff --git a/Makefile b/Makefile
> index ba5eee68d5d2..4a399b7f3b48 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1033,10 +1033,10 @@ export CC_FLAGS_SCS
>  endif
>  
>  ifdef CONFIG_LTO_CLANG
> -ifdef CONFIG_LTO_CLANG_THIN
> -CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
> -else
> +ifdef CONFIG_LTO_CLANG_FULL
>  CC_FLAGS_LTO	:= -flto
> +else
> +CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
>  endif
>  CC_FLAGS_LTO	+= -fvisibility=hidden
>  

This hunk does not apply on kbuild-next-unstable [1] (a possible
conflict resolution: [2]).  Can you please rebase the patch set on
kbuild-next-unstable as Nathan suggested [3] ?

Thanks and kind regards
Nicolas

[1]: https://git.kernel.org/kbuild/l/kbuild-next-unstable
[2]: https://git.kernel.org/nsc/kbuild/c/505471374cfb107
[3]: https://lore.kernel.org/linux-kbuild/20260316204311.GA1329928@ax162/

