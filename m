Return-Path: <linux-kbuild+bounces-11463-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG4DIbO+oGk1mQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11463-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:44:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D911AFF8F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59F26302BE0E
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 21:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E37C4508F9;
	Thu, 26 Feb 2026 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRvF8ofc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4702D449ED9;
	Thu, 26 Feb 2026 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772142234; cv=none; b=iYlMPb7GecZyQuU3GbhUs8gOWoo3jDZI3PFtvPlpU+b+xsGHxb8HpJKPBq7XglndkkSZjzOVd7bjzw2HpF+JdPSRM6Wmc/BqlAvjrppq1F8uZET+TGgU9pCEeyO5L4Uxrr4lYs5BffsAOskKTzpAPaV84i1jmKM8vXXVxR0Q1Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772142234; c=relaxed/simple;
	bh=LitKvXBZw+P7z9/MwzFlKfzPSc2GUxRTmbeSvR5WuCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbjtCXp0fVUT4t9WBPOLTj7wNI40gSBesL7RabsidlYl3OVDotJwxvlJcB9L51tnZzKUXgljN/dcZ/YEKlk7gtg+EoLPlhHRPioV6N/7v8ykkOek1OhKdxpG3NyF9BY5gaPt7dnGWureBplEQHz7en9tRUgLiGakHedTLPTREms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRvF8ofc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40B0C116C6;
	Thu, 26 Feb 2026 21:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772142233;
	bh=LitKvXBZw+P7z9/MwzFlKfzPSc2GUxRTmbeSvR5WuCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRvF8ofc7fVcnFxGwr7B/2odbd7dopGQhvb+YpLtaRsd9l91tNIsIlclKbmJH4GHL
	 k07UQJXGW5ltmlEbbcmG/OvsXmslHfwhYoHXPKtjfZNnFJjEddj5gXtdchBxVIj3qW
	 X84x7fEFR811OiQkBNaSmWK/MSYJ15L1Tm+YDt+IWO/rRsmSJfoWJfKEbawHri6P5C
	 ZUblnDLOFDN1A57AX1E2NmZESrJdKeXJnkHMTefQBzqbVKNrRjzfcJJB/q/fcXCAme
	 t2+Lp6jm2JWFY0nhuoznbDzFVc/NcdCoPY0Fcu380VjmR42sEh3t+XboDrMXaLt3vy
	 4QUsfIE1HQ26A==
Date: Thu, 26 Feb 2026 14:43:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation/llvm: drop note about LLVM=0
Message-ID: <20260226214349.GA1534917@ax162>
References: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
 <20260226-kbuild-llvm-followup-v1-1-201cc2a492d9@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226-kbuild-llvm-followup-v1-1-201cc2a492d9@weissschuh.net>
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
	TAGGED_FROM(0.00)[bounces-11463-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,kernel.org,lwn.net,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29D911AFF8F
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:23:57PM +0100, Thomas Weiﬂschuh wrote:
> Since commit 502678b88cb3 ("kbuild: Reject unexpected values for LLVM=")
> LLVM=0 generates an error instead of silently behaving unexpectedly.
> 
> Drop the now unnecessary note.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

It might be worth keeping the note about LLVM=0 not being the same as
omitting LLVM altogether, as neither the documentation nor the error
message will say why that is not a valid value. Maybe:

  ``LLVM=0`` is not the same as omitting ``LLVM`` altogether. If you
  only wish to use certain LLVM utilities, use their respective make
  variables.

I don't feel that strongly about it though. Regardless:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Documentation/kbuild/llvm.rst | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index bc8a283bc44b..441d8786fcbc 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -71,10 +71,6 @@ recommend::
>  
>  	PATH=/path/to/llvm/:$PATH make LLVM=-14
>  
> -``LLVM=0`` is not the same as omitting ``LLVM`` altogether, it will behave like
> -``LLVM=1``. If you only wish to use certain LLVM utilities, use their
> -respective make variables.
> -
>  The same value used for ``LLVM=`` should be set for each invocation of ``make``
>  if configuring and building via distinct commands. ``LLVM=`` should also be set
>  as an environment variable when running scripts that will eventually run
> 
> -- 
> 2.53.0
> 

