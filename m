Return-Path: <linux-kbuild+bounces-11464-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBqVKyu/oGk1mQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11464-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:46:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 366941B0059
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79121303EF98
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 21:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EC847A0D4;
	Thu, 26 Feb 2026 21:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9qEnpe6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDFD47278E;
	Thu, 26 Feb 2026 21:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772142364; cv=none; b=aiymNc2U0U/BXp67/yPidKnV/4oING7DIPzxAmHZB4DWGsrFoC0u7NasZ9zb8yWpTJ5EosEj/UGo2SKF6tLlrrliNBLdVz4Aaxtvmn3Cm58plp2ihk8Nzt3uT4li2t9oNod7FjQojdHQ1y+jkuFag7cuSChwG/O+nJIGFivQrT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772142364; c=relaxed/simple;
	bh=9PUAqh4AmE3b4r8EskMUHbqu6i21zZmHDmBinHBDkVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfaXiU3RHoyRUftxpcDBDUsQt+bgG9P3zIgqhcl+CQEyJUFui3cOgBGSgnu6kHBz6t+UeNYcXT3qMVOAFkeXyg2rL1t+2/mnK38ENaOVP0G0kRc8CyHS1CIJhLgo8imkFWsZD1HK7nA9kub0LNQEkPa14C6AYtxZDY/QBS0vF/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9qEnpe6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933E7C2BC9E;
	Thu, 26 Feb 2026 21:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772142363;
	bh=9PUAqh4AmE3b4r8EskMUHbqu6i21zZmHDmBinHBDkVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y9qEnpe6wyp9sNLLCdn4T5h8SoQcb/MU6uOkZPNmjZc4CedA74AQ69hqPtgtEZJeX
	 suJahMr/2vLRFjeAu14oSkgzEVGxPhZZt2D8BWYouEJXhAIdioAaNU3kKrYh8eci/R
	 U4ixUCxYC+CFtkYDLaUZqpCz+IB7wocK+RDzpbIk2XXv9SDcRp2hRL+McmePw5VkUD
	 zXJhBX/pJlS1d6aejSROFj0+EVLiRNqKUGU4fplxZuAD7/Xoao4n8lkZQvUDCPC37D
	 SdDLreQiE1D8n+ccd9beokEfBq89+OS+JBY7fH9SWpw09wAGm9pY+00wNLe5LBpHhJ
	 2Js7C7ODgLysw==
Date: Thu, 26 Feb 2026 14:45:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] tools/build: Reject unexpected values for LLVM=
Message-ID: <20260226214558.GB1534917@ax162>
References: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
 <20260226-kbuild-llvm-followup-v1-2-201cc2a492d9@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226-kbuild-llvm-followup-v1-2-201cc2a492d9@weissschuh.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11464-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,kernel.org,lwn.net,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 366941B0059
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:23:58PM +0100, Thomas Weiﬂschuh wrote:
> Since commit 502678b88cb3 ("kbuild: Reject unexpected values for LLVM=")
> the regular kbuild rejects unexpected values of LLVM=1 instead of
> silently treating them as LLVM=1.
> 
> Align the tools build to kbuild.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> 
> ---
> There is no formal maintainer for this file.
> IMO this change should go through kbuild.

Ironically I just rejected a tools/ patch going through Kbuild:

  https://lore.kernel.org/20260225192505.GC2755225@ax162/

but since there is no formal maintainer, it is the same change done in
Kbuild, and the risk of fallout is much less than that change, I think
we can make an exception and take it.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  tools/scripts/Makefile.include | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
> index b5ecf137febc..41971a68972d 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -56,6 +56,8 @@ ifneq ($(filter %/,$(LLVM)),)
>  LLVM_PREFIX := $(LLVM)
>  else ifneq ($(filter -%,$(LLVM)),)
>  LLVM_SUFFIX := $(LLVM)
> +else ifneq ($(LLVM),1)
> +$(error Invalid value for LLVM, see Documentation/kbuild/llvm.rst)
>  endif
>  
>  $(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
> 
> -- 
> 2.53.0
> 

