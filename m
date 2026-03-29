Return-Path: <linux-kbuild+bounces-12338-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XXxJCZWHyWmxywUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12338-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 22:12:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68473353EE0
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 22:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F36A930048FA
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 20:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AE337F8A4;
	Sun, 29 Mar 2026 20:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzyJ4oUJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE1036C5BD;
	Sun, 29 Mar 2026 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774815120; cv=none; b=pSz7BVZLNwBaS6xxfjOH2BEyLk2vBsAXd4Z5gWXEwpnwhlBxB09Q+e/skgjuRt4eK1wxmJm//LTo8By3K0v09MwV7F9u0mKyM9dn/j9hu4Z9ZgxGrGigd1Elp5jS2gFhIjv2Kr5BUuKmF7v/qDduzTboaUeCxear5swWcSp3Iig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774815120; c=relaxed/simple;
	bh=lfZx5pqpuomQ8ypN8m4iDEyro/FK6knvEsFfeY4h62k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MevhA/Cp2+3xC6vpFv6qwq/5UPzSbqNlAMvPX5IJ5sdj3J85hQhXCQXSFgmBBR82Mo+amsyYPOp44ATTdL090fjh94NjnkI+AA4esDg9/x3s3jted05roNuINJbKnXLDbk2t2xxFFTSh82a7uMt26Pc5bU+BuQu/VapN4/88dbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzyJ4oUJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530C0C116C6;
	Sun, 29 Mar 2026 20:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774815119;
	bh=lfZx5pqpuomQ8ypN8m4iDEyro/FK6knvEsFfeY4h62k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzyJ4oUJkwtgAx9/wg2sbxUEV58aMogNIRRdyMNxt3OD19dZK9nQPc+Tl9Kntd8zz
	 UWSITx6AL2TABEza8G4aHCerOdtecnxG/aoZ9SihO5ZRgg73tNrENpuHlo07VgyWGY
	 KbjH55hiKVKfQyhMXU35XrusTAVVkfBSGpgOqscKrTQ5RtEXiFyoz5Y+jKCvsow3kW
	 GQIk0tLsbyNFLt17zgnPPnfrREdhw0qqJy3xEROGKHDHiLCqUSSGcaRInRbWY56/cF
	 RjENOC12hZRwdIzwtJdY13rsH3ZfnfaPvwSgvzZYV1fwPiR0mrslOQCQIOsmFLwPAc
	 KX4OR/C1FygrQ==
Date: Sun, 29 Mar 2026 21:44:28 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Samuel Rowberry <sprowdev@gmail.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add GCC stability warning
Message-ID: <acmBHIotA4p50qJQ@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Samuel Rowberry <sprowdev@gmail.com>, masahiroy@kernel.org,
	nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260329192139.475926-1-sprowdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329192139.475926-1-sprowdev@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12338-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 68473353EE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Samuel,

On Sun, Mar 29, 2026 at 01:21:39PM -0600, Samuel Rowberry wrote:
> Newer GCC versions are not fully compatible with the code.
> Adding a warning lets users know without getting in the way
> of setups where it is okay to use GCC 15 (or is needed.)

can you please elaborate, _why_ you state that gcc 15 is incompatible in
some ways?

> 
> Signed-off-by: Samuel Rowberry <sprowdev@gmail.com>
> ---
> v2:
>  - Fixed line wrapping in commit desc
> 
>  Makefile | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 02902bcae..361b5a509 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -720,6 +720,19 @@ endif
>  
>  export KBUILD_MODULES KBUILD_BUILTIN
>  
> +# Version check on demand because configs can get stale

kbuild already warns on compiler changes between kernel and out-of-tree
module builds, cp. Makefile target 'prepare'.

> +# This check is GCC-only because that is standard
> +# and if someone is using a custom setup, then it is
> +# assumed that their setup works.
> +ifeq ($(KBUILD_BUILTIN)$(KBUILD_MODULES),11)
> +ifneq ($(findstring GCC,$(CC_VERSION_TEXT)),)

What about CONFIG_CC_IS_GCC ?  Or ...

> +CURRENT_CC_VERSION := $(shell $(CC) -dumpversion | cut -d. -f1)

CONFIG_GCC_VERSION ?

> +ifeq ($(shell expr $(CURRENT_CC_VERSION) \>= 15),1)

ifeq ($(call gcc-min-version, $(CONFIG_GCC_VERSION)),y)   ?

> +$(warning "GCC $(CURRENT_CC_VERSION) detected. Please use GCC 11, 12, or 13 for stability.")

Why do you leave out gcc-14 here?

Kind regards

-- 
Nicolas

