Return-Path: <linux-kbuild+bounces-10918-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHUFKxXSeWlCzwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10918-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 10:08:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAFF9EA45
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 10:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06CF9301301A
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 09:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7A733DEE0;
	Wed, 28 Jan 2026 09:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/fy8wA9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14133D51F;
	Wed, 28 Jan 2026 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769591314; cv=none; b=BclEgplBtWrghWnDTBDtyqCZNWPc7rSx4RD5SeIfx1sU2s4ZM7LjkYaso1Nnk51gerBVW8ZAbgtAa/5Tf1S9I+NQ33kUs1v8654t7ZPzzcKU706ruszmSQpA80W0Q63J8EC/HvNHlwsqmSw1yH/RTCIQl3LG6D6+oWaAvQoC+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769591314; c=relaxed/simple;
	bh=qMm7hX4PVk6Yh3XxSpUlBGaH4NHbgK3Mp/XYDMcbkRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/TMeLnHnpE8QRPz8Ye5h/l7aBwJevfKv+V3lheWUA8XOQa5XrBcJVU2oZzsChk1RJkg8CWpQowWBsjbpNxkL0xcOz4Y5VcM0emLxfg8z0L+LvFKMeDuk5V2EI7vzFynvw1HMuY0sSLbQftKG3mGTSM4fp1Tuhvqk/IJNLf4WvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/fy8wA9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EBAC4CEF1;
	Wed, 28 Jan 2026 09:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769591314;
	bh=qMm7hX4PVk6Yh3XxSpUlBGaH4NHbgK3Mp/XYDMcbkRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/fy8wA9Ztf/7aCePdtske0mvp+fqFqnCZsHDPJ/NDcxQ1pKTPzboloLlYqcHgEFo
	 nqnipaJT9VkDVukFpSdOMKa7PcNjFHvebwoLcNFQuWheZq793us26RZq7cZXrYpVc5
	 h2GA19GCxCfxUJ74kdMIR4h+mQ84c0ap1OaKRm83rK7a7KdqR5N6VpIxpq7qFRZCs/
	 s68Wa1+DlG9UTXR9Ese3MSAX1Mv33dfsHa/9OnQmVSstz1DltU4pDiF5DhoJTKDU3o
	 VBgQRiMaL1EMRHDhH14u8NVMR2O7BQ1wn9jl0X6CEOvUVEHyxayEzemBuA27+LUNuJ
	 8SubglEKBH0xw==
Date: Wed, 28 Jan 2026 09:16:13 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ethan Zuo <yuxuan.zuo@outlook.com>, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Fix permissions of modules.builtin.modinfo
Message-ID: <aXnFzbuV6oQJD_Sj@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Ethan Zuo <yuxuan.zuo@outlook.com>, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <SY0P300MB0609BE844D61B504AB2013C99C90A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
 <20260127205915.GA3856796@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127205915.GA3856796@ax162>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10918-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[outlook.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:email]
X-Rspamd-Queue-Id: 0CAFF9EA45
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 01:59:15PM -0700, Nathan Chancellor wrote:
> Hi Ethan,
> 
> On Wed, Jan 28, 2026 at 03:23:23AM +0800, Ethan Zuo wrote:
> > Currently, modules.builtin.modinfo is created with executable permissions
> > (0755). This is because after commit 39cfd5b12160 ("kbuild: extract
> > modules.builtin.modinfo from vmlinux.unstripped"), modules.builtin.modinfo
> > is extracted from vmlinux.unstripped using objcopy. When extracting
> > sections, objcopy inherits attributes from the source ELF file.
> 
> Ah, that explains why this is only visble after 39cfd5b12160, as
> vmlinux.o was just a regular object file, whereas vmlinux.unstripped is
> an executable. There was another patch submitted to address this issue
> that did not explain that bit well:
> 
> https://lore.kernel.org/20251209-modinfo-executable-v1-1-ed0c553a4390@pengutronix.de/
> 
> > Since modules.builtin.modinfo is a data file and not an executable,
> > it should have 0644 permissions. The executable bit can trigger
> > warnings in Debian's Lintian tool.
> 
> I had asked on that previous submission what sort of issues could be
> expected from being executable and warnings from tools is a reasonable
> answer to that. Thanks for including that.
> 
> > Explicitly set the permissions to 0644 after generation.
> 
> Would it be better to do what the previous submission did and just
> remove the execute bit via 'chmod -x'? That seems to be slightly more
> common in the kernel (even though there are very few uses of 'chmod'
> throughout Makefile instances) and seems to get at the issue a little
> bit more. Not sure if the creation of these files respects umask, in
> case someone had a more restrictive one, but that might be contrived.
> 
> > Fixes: 39cfd5b12160 ("kbuild: extract modules.builtin.modinfo from vmlinux.unstripped")
> > Signed-off-by: Ethan Zuo <yuxuan.zuo@outlook.com>
> 
> Nicolas, do you want to take this as a fix for 6.19 or should I take it
> via kbuild-next for 6.20/7.0?
> 

I'm happy to take it (v2) for kbuild-fixes this week.
Thanks!

-- 
Nicolas

