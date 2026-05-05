Return-Path: <linux-kbuild+bounces-13033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJt2KrUW+mlRJAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13033-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:11:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D874D0F56
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C10C30E7331
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 16:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4146848B364;
	Tue,  5 May 2026 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvUkbWJh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1277248AE3C;
	Tue,  5 May 2026 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997144; cv=none; b=uel2y07Xjiw113rkhxcp9Ri2cELMuBTB9al+eGLylePLTcgexeLcCETZm/jCdattAuIb19bvzjfMxzb0UqROnfWl9xsssFSChflEcugT+fUpf2GFcAO8pBnFFmOzFxd0COGzabiPqzj43TwWYwCMrZZ4yhGmkxHv6fzE0YchkuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997144; c=relaxed/simple;
	bh=dZ0KxvMjgcEwmX6MlOktEgLivpKwhLOY/uRTAr/7ltk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O607cW2+nhpcUgzUcjV8Wlgv4WRIPSwl+vNA0ohVvimuYonTsJNHZ+FLczNELypfZJtDbu+OGfT8Hm7mft96nLbQPq9nOrvkS2TSc/r53LhdN5Y/YxEM9jbz2dRoL+rpw3HGGGzlZcCnJbfNqVbZ1P8yzkzBmGLhTbBEr1xrfUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvUkbWJh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F24BC2BCB4;
	Tue,  5 May 2026 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997143;
	bh=dZ0KxvMjgcEwmX6MlOktEgLivpKwhLOY/uRTAr/7ltk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvUkbWJhe0WKFMHRiCYe1TtgBFdZ8vQuyn+q79mIX+3tQfrV4heXOlW7Jm73AVnm+
	 LbQGzYlfmgEwT4xJwnsNf0h4cIsWOfpF9JQalbZIwJQLYs9N8INajGZ6UjJ8e+1FH4
	 l+FmklQb+F/RtJVUKH8LBNV7U0BNfLRU/XdVRiwZ2OMSDsa4/H2fGrz19kJQ8o2ScU
	 LSlDSNpjK/Ky3x2V32cu8JquNNfflASzjTAMOgQwAiuKwG+13qIj1W8bFnSY51Kfpk
	 vPxe3VceTnhgFNUMQpzBrkUA5QbtMazo8M/11d8enNxs5i9G5aAsGEoToLxt+26Gq1
	 flEpR3rpPrMdA==
Date: Tue, 5 May 2026 17:28:56 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 04/14] security/Kconfig.hardening: Remove tautological
 condition from CC_HAS_RANDSTRUCT
Message-ID: <afoMuMJ-fHPrW6T4@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-4-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-4-81d9b2e8ee75@kernel.org>
X-Rspamd-Queue-Id: 46D874D0F56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13033-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 10:59:10PM -0400, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the '!Clang || Clang >= 16' dependency for
> CONFIG_CC_HAS_RANDSTRUCT is always true, so it can be removed.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Kees Cook <kees@kernel.org>
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-security-module@vger.kernel.org
> ---
>  security/Kconfig.hardening | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> index e4f23c08a17a..b90cf9ed4642 100644
> --- a/security/Kconfig.hardening
> +++ b/security/Kconfig.hardening
> @@ -274,9 +274,6 @@ endmenu
>  
>  config CC_HAS_RANDSTRUCT
>  	def_bool $(cc-option,-frandomize-layout-seed-file=/dev/null)
> -	# Randstruct was first added in Clang 15, but it isn't safe to use until
> -	# Clang 16 due to https://github.com/llvm/llvm-project/issues/60349
> -	depends on !CC_IS_CLANG || CLANG_VERSION >= 160000
>  
>  choice
>  	prompt "Randomize layout of sensitive kernel structures"
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

