Return-Path: <linux-kbuild+bounces-12322-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKWVMt4Cx2lORgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12322-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 23:21:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A69834BEED
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 23:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45888304C7EF
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 22:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44FA3845B3;
	Fri, 27 Mar 2026 22:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5FB2JuK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF292DCC1F;
	Fri, 27 Mar 2026 22:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649922; cv=none; b=FtIun/ifbYVQ1r/+7CVp96KA3e4WvHRuYgtrnN1G+zoCeOthbfPHnJHOi0G6jAiLN2EhYBFmut3iBz9UUpPq1+WCpaYLPd2bsfUFb6MmuAKlyZxvNCkNxdDKDuSO7kGupmX/Xj0RlqJz/EPP3Kd5gvJrt0+8zYboIdtkHHky7oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649922; c=relaxed/simple;
	bh=uJMQhtVozPrieSITjwYoNxE+RGwS8iTSWgiCZ8nrIo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZ7XJwvn4FYDyguJYYtJtG7yKsmMdGge2LAsHTvrKlYhRGt1DgPexIl2K0N7+3HQnOOzjhtWSrLFzNLMta59oV/v3BxU9nikLJApy6Mspjge26FrYSlwKz8Y4KTqBvW1BwbnHFF+N7vlaBqVAnR3cRRH7wpp1aH+ldK5RLSauTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5FB2JuK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF4AC19423;
	Fri, 27 Mar 2026 22:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774649922;
	bh=uJMQhtVozPrieSITjwYoNxE+RGwS8iTSWgiCZ8nrIo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5FB2JuKJvYyLqNFxgVTcZIr5AwZiGoIYGnmxdyiI6fQsKyAnyxX0Q6z0haFFxx84
	 lUIX6kAlJmX7pHTnu3Bj7LGYMt5tPStK4b3K7Q0kkphJanFnA6P/l2kWUDB5NHPEWT
	 V7fHqqPuHopnRpW5pr7zSS2v/5Bz2VQV1lZuQRJYWjHSg+Yfd7J3lmA2sClHqdo+qY
	 xbk7iQspDMpYs/FyPj2VmOtEGen5RjTBAjFstTdxvHHugj2C1HWCJA3LerPflFLdoJ
	 4lwGMXgVmz0kli0aRb5zMMOmjmS/PMcklsTXX3lFvwey6KDiuQghqN7Z9sFBqhPrVU
	 BdkgAOQG/mE1w==
Date: Fri, 27 Mar 2026 23:18:37 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: add -fdiagnostics-show-inlining-chain for
 FORTIFY_SOURCE
Message-ID: <20260327221837.GA3622500@ax162>
References: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12322-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A69834BEED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 02:59:20PM -0700, Justin Stitt wrote:
> Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
> the visibility of inlining chains in diagnostics. This is particularly
> useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
> inlined functions.
> 
> Add this flag to KBUILD_CFLAGS when CONFIG_FORTIFY_SOURCE is enabled
> and the compiler supports it.
> 
> Link: https://github.com/llvm/llvm-project/pull/174892 [1]
> Link: https://github.com/ClangBuiltLinux/linux/issues/1571
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index e1279c4d5b24..978726aeb1ef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -973,6 +973,12 @@ KBUILD_CFLAGS	+= $(call cc-option, -fno-stack-clash-protection)
>  # Get details on warnings generated due to GCC value tracking.
>  KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-context=2)
>  
> +# Show inlining chain notes for FORTIFY_SOURCE-related diagnostics.
> +# GCC does this by default while Clang 23+ supports a flag.
> +ifdef CONFIG_FORTIFY_SOURCE

While this is indeed particularly useful for CONFIG_FORTIFY_SOURCE, this
impacts the warning and error attributes, which can be used anywhere
(see __bad_copy_from() for example). Is this being wrapped due to the
potential compile time impact? Can we use something like hyperfine to
quantify it and see if the impact is worth the trade off of always
having it enabled for friendlier diagnostics? If not, maybe worth
adding a Kconfig option that is force selected by FORTIFY_SOURCE with
clang or can be optionally enabled by a user?

> +KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-inlining-chain)
> +endif
> +
>  # Clear used registers at func exit (to reduce data lifetime and ROP gadgets).
>  ifdef CONFIG_ZERO_CALL_USED_REGS
>  KBUILD_CFLAGS	+= -fzero-call-used-regs=used-gpr
> 
> ---
> base-commit: 7df48e36313029e4c0907b2023905dd7213fd678
> change-id: 20260327-kbuild-show-inlining-557d31d2293a
> 
> Best regards,
> -- 
> Justin Stitt <justinstitt@google.com>
> 

