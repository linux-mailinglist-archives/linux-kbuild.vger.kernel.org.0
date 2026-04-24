Return-Path: <linux-kbuild+bounces-12875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAe6Obe262kJQgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12875-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2026 20:30:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1294626E4
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2026 20:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A5A73006999
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2026 18:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9B63F0ABD;
	Fri, 24 Apr 2026 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sd0j8sAa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DDC3F0A84;
	Fri, 24 Apr 2026 18:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777055403; cv=none; b=iMOviUOtFmfewj+A8hjoZOIoQks1TbHJVxAcXVO0X9XmW815CnEyzJA2TrDW/78VdOnZsenzi9D3dKhnHyg/iOczINhMmY0v4y6k4CNToW636reA++iNgThhyCJHVgy7qDPnq3x6wVHOyZseepHmFNSNTl7HpVCM+M0pkpoPieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777055403; c=relaxed/simple;
	bh=BzNwaiPpDC8alS4rZJmriqM/jUW92bmEh5ViUVeeHx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hbzva+z7E5BrXSee3nlPMFsi0byXdbx3pLWd9WyvBnAnS8KEW+Ot8Nqr6mOQpUn0gm8SUbmNlCXxiZamW8ZHHBJe8sNDk/M9v/JqVCtbtnRKpgPEN4JwKvRvKReXZNzaAVlUg0/LhYk2cRXIVbGmP+u2Ik5QauJDEdPPqoc5MuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sd0j8sAa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A683C19425;
	Fri, 24 Apr 2026 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777055403;
	bh=BzNwaiPpDC8alS4rZJmriqM/jUW92bmEh5ViUVeeHx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sd0j8sAaVy8wuFaV76RiWDNWWIHk7VwD9ND9k3lNeIypDtdVbsgb2kUiSFxLdtUDX
	 FqdsH/pnHk/BOOKZdtjkv6PYZgo6VqegSG8IsZXYzqFM8KPth6fbEl/HP3RVsg42tb
	 /9e7HfeO0kNS5F2lyY7ksgexZ1EKd48+xkmNT6xFNeU4DBbv3DGoVjr1HF6FLrsvRG
	 odGXHO4uggZgvylGzwZ/rRt9cXEyNIC6/41FGTQYsUslB0a6jVF3dSI1V5Qh9bgwUv
	 S3Pk9lm27TN99EP4EYlwgYEF7Vh3hCapMIn6QRysGpv58OB/ValP66M3Q8AhHkrv37
	 3/haNzVWbQuvA==
Date: Fri, 24 Apr 2026 11:29:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: torvic9@mailbox.org
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"nsc@kernel.org" <nsc@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [QUESTION] kernel/Kconfig.hz: outdated help texts?
Message-ID: <20260424182958.GB813908@ax162>
References: <1896318894.249754.1777018724256@app.mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1896318894.249754.1777018724256@app.mailbox.org>
X-Rspamd-Queue-Id: EB1294626E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12875-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 10:18:44AM +0200, torvic9@mailbox.org wrote:
> Hello,
> 
> I noticed that the help text in kernel/Kconfig.hz has barely changed since
> configurable frequency of the timer was introduced in 2005.
> 
> Are these help texts still accurate 21 years later?
> 
> We have e.g.:
> 
>   "250 Hz is a good compromise choice allowing server performance
>    while also showing good interactive responsiveness even
>    on SMP and NUMA systems. If you are going to be using NTSC video
>    or multimedia, select 300 Hz instead."
> 
> Is that NTSC/PAL thing still relevant today, in times of high resolution timers,
> modern graphics cards, Freesync and high-refresh 4K monitors with 144 Hz?
> 
> Cheers,
> 
> Tor Vic

I think this message would be better directed at the timekeeping folks
(now CC'd), rather than Kbuild/Kconfig.

Cheers,
Nathan

