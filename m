Return-Path: <linux-kbuild+bounces-10748-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBrKHIbYb2n8RwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10748-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:33:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7214A7D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0A4AE886A16
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DC443E9C4;
	Tue, 20 Jan 2026 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqrigPUg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D33EDAC3;
	Tue, 20 Jan 2026 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931935; cv=none; b=dWf6i9nklYaXEf7t9DQSkw7i4iOnAaG8I8XaHKmwXZejP2AksgrkmrERTdJoHh9JdylvofDFABDKRvsLpwJaTbOgGchsTliveS39wAbF4rkTInpT9LQaavji1Eh/J9IIwLYqkkOFkJ0Rc8sV6uvtoFf2sxp8wQ2kMwwKydAlZdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931935; c=relaxed/simple;
	bh=Y9cZ7orhjjaxMihveN4lhxry2uDDss/+iMQKy1Nem28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m21pJK8N8N5PvJIwrFX9onB1z1dgnClsHNhf3f4F9oXds2LqJmPQC1DunErU3Kyaep9ny/oSpzSFdf38CGZIoZjP97f/SDgXB4Mj4NEfssVAMnbtixK24R/iJJ5z1/MhnvSTKUyG0Iz5DSKxDh0Ct2cYFlHqbRR4J8M8dDCWAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqrigPUg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87471C16AAE;
	Tue, 20 Jan 2026 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768931934;
	bh=Y9cZ7orhjjaxMihveN4lhxry2uDDss/+iMQKy1Nem28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sqrigPUgLp8CHIqvTB6si1zueozeU91+N/v9yWs4bY62qtFStLd53MjtG++o8a+s2
	 Y/PFetqqq+kdWgw2TOBB3Ark2XGfAx8lIxZT3Win+m5i9IkRWA7Nmv3+hr0x0TtI8V
	 GMqEyau6VYSSM/PYtVBat8h6sfJvLwPs7cRK710WYVD/xUBS32nmX5Q/V7QbbygWgA
	 Mrcn4zD1hRBa9o3/D/YaduSNS9rukKrLc4PvCYMJB6ZSYEDZyPQ7zUNNBYeCJd6GgR
	 4/4CRV3HqLkWCm/3Wcx4DkYxYNuOpDmBOT12se5HV6lOVjjllJO+cQf5sAWjVxrthb
	 TkBvw2tXhLkVA==
Date: Tue, 20 Jan 2026 10:58:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
Message-ID: <20260120175849.GB2749368@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <20260119213516.GA1051134@ax162>
 <20260119214931.GA1058062@ax162>
 <1766d2ae-1224-4d3e-bc9f-786702989a79@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1766d2ae-1224-4d3e-bc9f-786702989a79@gtucker.io>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10748-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,get_maintainer.pl:url]
X-Rspamd-Queue-Id: 0E7214A7D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 10:56:46AM +0100, Guillaume Tucker wrote:
> Not at all, on the contrary I have some dedicated time and long-term
> interest to keep maintaining this.  Please feel free to add me or I
> can send an extra patch if you'd rather I did it.

I can fold that into the two changes in a natural way.

> OK sounds good.  And sorry, get_maintainer.pl didn't mention Nicolas.
> I should have checked the KERNEL BUILD entry by hand in the file...

No worries, I am sure there are quite a few scripts that we technically
own but do not have an entry for it in MAINTAINERS. This won't be a
problem going forward at least :)

