Return-Path: <linux-kbuild+bounces-12404-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK2vFnfwy2m5MgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12404-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:04:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD2F36C512
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 18:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AD323057B17
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3985E401496;
	Tue, 31 Mar 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E86X1NAi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A83E1D15;
	Tue, 31 Mar 2026 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972536; cv=none; b=uzRH6/Zsgy2765itq3WzhZB6ZgpfNW3Se1vr7vfwepu16w8yCIbYEk3NEIN1v5tN/Cjc+5fOhVL6OENAkZlE/1AazhZVojpRuWmOIsKzFGowTzlUx9p1u3JpbdSmTghMzNw91J3uJep+rULPkMtEIlrrCp0ALdis5nRRkYmEDtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972536; c=relaxed/simple;
	bh=YAVCqs+iKM3va+HanHaYLnT7coslqWkOv6oKzf+5HG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FySc/YNtbDIRJyA27aTrBcIRjjBePdkQ6vyTIIvFspeX1bUZlwC8Go28APaJKz/XX3zwo6b/FQQ01tDraNlXSuPb8kX4uL9l3OZpMYl64EBF1dGL7+IwuRt0Zpxe/IzT2/AdqybGof1ipbULTs9qtKXmdUa9dvFSn952pAtT/Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E86X1NAi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05042C19423;
	Tue, 31 Mar 2026 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774972535;
	bh=YAVCqs+iKM3va+HanHaYLnT7coslqWkOv6oKzf+5HG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E86X1NAifKBcMbNzdSCMD+R/Ghrw22Vz2KNxf2jHlvnOPvGCYDvGtYTaqnefDWqy/
	 1ecFvlznfWzETGtepJJj/MEqgw2OcV6sF2x8SlrO+EZC660E99ZT9Yh3hDRtQyw5lD
	 MOI4srx70Hu2KGwD44yeExVARPkInyJlf3b08ODqLZIq3fIuXnOWjVaD0Qoe9bBuu0
	 RZvNheA96OtCUWk1wjHvXzS7JC4ik6l4no0TrMQ27shY3MQQnizY9M4l9MmM1AGSif
	 B7VNb7CS6O6510kfpOuSATc8LFdd99lV8nYEt9M/6QjFCAekbTyna+PaqIluEWcFlj
	 cNxlpXx89GBjQ==
Date: Tue, 31 Mar 2026 17:55:31 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: expand inlining hints with
 -fdiagnostics-show-inlining-chain
Message-ID: <20260331155531.GA2004441@ax162>
References: <20260330-kbuild-show-inlining-v2-1-c0c481a4ea7b@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-kbuild-show-inlining-v2-1-c0c481a4ea7b@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12404-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBD2F36C512
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:09:08PM -0700, Justin Stitt wrote:
> Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
> the visibility of inlining chains in diagnostics. This is particularly
> useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
> inlined functions.
> 
> Add this flag to KBUILD_CFLAGS under a cc-option so it is enabled if the
> compiler supports it. Note that GCC does not have an equivalent flag as
> it supports a similar diagnostic structure unconditionally.
> 
> Link: https://github.com/llvm/llvm-project/pull/174892 [1]
> Link: https://github.com/ClangBuiltLinux/linux/issues/1571
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Changes in v2:
> - Move to always enable option if compiler supports it (thanks Nathan,
>   Kees)
> - Change commit title and message
> - Link to v1: https://lore.kernel.org/r/20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index e1279c4d5b24..4972b23fb77f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -973,6 +973,10 @@ KBUILD_CFLAGS	+= $(call cc-option, -fno-stack-clash-protection)
>  # Get details on warnings generated due to GCC value tracking.
>  KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-context=2)
>  
> +# Show inlining notes for __attribute__((warning/error)) call chains.
> +# GCC supports this unconditionally while Clang 23+ provides a flag.
> +KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-inlining-chain)
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
> 

