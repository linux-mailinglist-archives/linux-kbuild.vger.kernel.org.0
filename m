Return-Path: <linux-kbuild+bounces-13106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM7jNcl+AWoMbQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13106-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 09:01:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE0508C52
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 09:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 565793015C9D
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 06:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93C830100D;
	Mon, 11 May 2026 06:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAROJ4Ao"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A641F26AE5;
	Mon, 11 May 2026 06:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482761; cv=none; b=Slw4Wcet1sh1p6lBv/nG2WBE+D5+gcGP6vBxQCplsVkXrmd7NJHIZrXEEOzABb6SeLoQyblmAahxSBEnOOaC8RUtboRjv+Yr9y0zgqRfHEYdq2/ht/cf2/zIwD7khfchx6VFcKagEcR8yOG2Ndkmoyf5Uc+knhGtVs+z3hDyDgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482761; c=relaxed/simple;
	bh=AZtN4tgKcG7XG/OKVu2OzXU1/jYA5e8pCqU2/DUkkgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYo+gY5bPLIDh2ppkvXFfFm2MIGA/AOojrK12BEH+dTutKw4/yFmo0qJWWJO2v8j1rcVn5hyzUfmfO4//jPvmhxBXsvWcqh8HjGLrZ/Iw09exDddKoVMg/TO9w9jGk51moGcowcitepSS1kooWnqNJMgu0RfvzC3/IDP4H9eHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAROJ4Ao; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F5FC2BCB0;
	Mon, 11 May 2026 06:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778482761;
	bh=AZtN4tgKcG7XG/OKVu2OzXU1/jYA5e8pCqU2/DUkkgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAROJ4Ao+Ua4PmEezYY5++oL/Non3I+zpgKBuI3aKPGbkh9D248zJkie9S4Dr52yP
	 A/GvxxwDXbiAzn6xBOJrP5twe52fpubQbQYhA/cx8Ll/G/ZYVX7srzdgRuG6mOBqxa
	 9N5ksks+K8u0ImDmtMkjJWbqCVfh0dXtHasLatG+zTVgSYf6bqUVDK9dHBTMPXnO6+
	 FBROcZZx3/26GXTRxzAngcw5PY04KRxakETY1OqS1Y7Kx+6fTr4dz4R+yoUM5dS89a
	 3FZuC7q/8KiYCJPo0eiSxUZ0Oio9AW8qKVtYNeFtpFzGVPkvryh6FXNu5LBhnST7bJ
	 B8QvcuT41ofKw==
Date: Mon, 11 May 2026 15:59:15 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <20260511065915.GA325559@ax162>
References: <20260509101939.27108-1-mo@sdhn.cc>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509101939.27108-1-mo@sdhn.cc>
X-Rspamd-Queue-Id: 35CE0508C52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13106-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,smile.fr,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Mohamad,

On Sat, May 09, 2026 at 01:19:38PM +0300, Mohamad Alsadhan wrote:
> rustc's -C linker= option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
> 
>   error: multiple input filenames provided ...
> 
> Generate a small wrapper script and pass it to -Clinker e.g.
> 
>   ```
>   #!/bin/sh
>   ccache gcc "$@"
>   ```
> 
> Note that the wrapper intentionally avoids a leading `exec` to
> naturally support leading environment assignments such as:
> `VAR=VAL ccache gcc`.
> 
> This fix should be general enough to address most if not all cases
> (incl. wrappers or subcommands) and avoids surprises of simpler fixes
> like just defaulting to gcc.
> 
> This avoids passing the user command as an environment variable as
> that would be more challenging to trace and debug shell expansions.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1224
> Suggested-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>

Thanks, this seems reasonable from a Kbuild perspective (although
Nicolas may have other comments) and it appears to work for me. I expect
this to go via the Rust tree.

Acked-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> diff --git a/Makefile b/Makefile
> index 1a219bf1c..5ebeef67f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1651,7 +1651,8 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>  	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
>  	       compile_commands.json rust/test \
>  	       rust-project.json .vmlinux.objs .vmlinux.export.c \
> -               .builtin-dtbs-list .builtin-dtb.S
> +               .builtin-dtbs-list .builtin-dtb.S \
> +	       scripts/rustc-wrapper

What tree was this generated against? It conflicts with Linus's tree due
to commit a76e30c2479c ("kbuild: Delete .builtin-dtbs.S when running
make clean") that landed in 7.0-rc6.

>  
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES += include/config include/generated          \

-- 
Cheers,
Nathan

