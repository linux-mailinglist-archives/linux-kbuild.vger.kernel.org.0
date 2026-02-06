Return-Path: <linux-kbuild+bounces-11046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJW4IYukhWmSEQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11046-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 09:21:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E8FB67A
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 09:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF525302FE9E
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 08:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CA3313551;
	Fri,  6 Feb 2026 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuMrpi1w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721312727FA;
	Fri,  6 Feb 2026 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770366087; cv=none; b=EHdvJhXL9HHzYOK1LqQ4ldRn1CMAz3ITIOJxiVX1nyz/zsvQMPcLaQArTDYb6Rsg2beUHalDRxR1oEezrNxH9YyfzPi1/byA3/u4QkTSm0iIcnxN2zBIpNdfqasWyIDuoSXnogDLCaO7PjQD3ZT/A8s+demMI5+HUe88cvf4OhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770366087; c=relaxed/simple;
	bh=rFBDwKM+8eVDmElaGNAP+N2mc+0XDTWvQ5c8XhF2Ans=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpFMJtFF3PGm6l1y7Sl1il+qbvy0hqGBZoy6EjaGdRGR//ZkB2SxiRZCD/+5uIdCWaxfYd5SUhsZS5PCgr8iQAQIq+b6W9z+BpL45gLCUCFSWin1mWoBasaefjTwMqPQg/fO1ZEeBO2KV4YnSrEloee9vdIWSErt5QCAJuqKReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuMrpi1w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0A1C116C6;
	Fri,  6 Feb 2026 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770366087;
	bh=rFBDwKM+8eVDmElaGNAP+N2mc+0XDTWvQ5c8XhF2Ans=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuMrpi1wXa32eH6gDrOJXaoNuXAJHatfq/tqkXnblZVcUN3idUSYGd455sEGmu7cL
	 JATaVR+d4ulxZUPOdHehdc+MtkOJmTkZ4H16TqM08T53of1KWzBKRqlDCgdJ6YUgVF
	 E+32Awcw4rgO21E/azKVZLQ7FGrpZ//j04VJd9w4xMzeUyihG8A/vyobMPNuJ2+X8+
	 jikTePxTjkzaGemtu5v9BO9LWjVVWNXaHDf3LTcw7XuvUqTU7lSaE4bLNOwUH/f5Wp
	 4LiQQRx4H46IXsfY6SPFcydqSKPdoeo09nf+e0HPpCvIwXH/tvm/x4qMig3xlyKD00
	 Z6E3WE4XasLVQ==
Date: Fri, 6 Feb 2026 09:21:03 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: remove dependency of run-command on config
Message-ID: <aYWkb6_IzbNlnsM4@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260205-kbuild-run-command-v1-1-b8cbbc3db270@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205-kbuild-run-command-v1-1-b8cbbc3db270@weissschuh.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11046-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF0E8FB67A
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 09:49:58PM +0100, Thomas Weiﬂschuh wrote:
> The run-command target does not always require a kernel configuration
> to be present.
> 
> Drop the dependency so it can be executed without one.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

