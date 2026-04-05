Return-Path: <linux-kbuild+bounces-12639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +/aVEc8N0mnFSwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12639-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 09:22:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D039D96C
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Apr 2026 09:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD71C3009156
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 07:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EA03368BB;
	Sun,  5 Apr 2026 07:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dk+vR4BQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E375A2874F8;
	Sun,  5 Apr 2026 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775373771; cv=none; b=jG3oajB5ZgL+nNrBvII1qoqDd5nOCYoK6vzjG8+F/xcNFcv1BPtNnfe1uFiRSFC/OFyEanuIU/QnMfWAne+zY1+ML1bKVYRAdcIskaUBRA+M2rtGV40C3Ud9SpfVYYG0b1Ne5xoC+zX0sve0uTHQm9wf1H7broVGJy1l9+OwsvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775373771; c=relaxed/simple;
	bh=jzzTT4JHZRSx7l0LKk3ufeKRAnkOp7iVghBTbLq0QUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeBTknzWdOZV6S5tNvL2+eZROZCrdZRcKMq2fqMeGC2Us8I7Meo5/+rAOYyYAUh5lA3zFvS7O2F6BLcd6tMK7Ms5UTKQo3CZFqnAIXKcFFQ2lTyGNZr+nhzbCRqCGPxLcJimr2dTng5Y7S8COs1SpAj7Bn8Ryzlz/aEgiyvqhec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dk+vR4BQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEB7C116C6;
	Sun,  5 Apr 2026 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775373770;
	bh=jzzTT4JHZRSx7l0LKk3ufeKRAnkOp7iVghBTbLq0QUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dk+vR4BQ4AE0mkmwdwTwL2O/IYPTUuohzriWeZbOj7NvLVb/vFeLbzaJX7YygF4PT
	 xNhVoGMmk5m+pN2AVLPoM+HZ7C75cwIfrRO4whZlD+SdPaL5TwC5b23OVWmyFCwdMy
	 S0quPfX8FpMEBxbl+55AJogWd6SbifkyE/2C6R1knAJRnEwl4U4vvA0d3OACwE3gtT
	 bonxsg5hGlUpqwTr1ugYBMnA0B1jnG91dHaFYpD+QZ5ll5ZrmaqFmNbmVcnoeCDYqF
	 rqqX/0/Rl9MZaoKWEwPz//nFWwddqqxdnjQOrAG19hvwnRMcBjkefpOBoOwo3BgdLx
	 uFM62DaEjcGIQ==
Date: Sun, 5 Apr 2026 09:22:39 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] checksyscalls: fail on all intermediate errors
Message-ID: <adINv3LKBRYJ8zG-@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
References: <20260404-checksyscalls-set-e-v1-1-206400e78668@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260404-checksyscalls-set-e-v1-1-206400e78668@weissschuh.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12639-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 8F9D039D96C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 02:23:10PM +0200, Thomas Weiﬂschuh wrote:
> Make sure that a failure of any intermediate step also fails the
> overall execution.
> 
> Link: https://sashiko.dev/#/patchset/20260402-kbuild-missing-syscalls-v3-0-6641be1de2db%40weissschuh.net
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> Niclas, could you move this before commit a414e4ba513f ("checksyscalls:
> only run when necessary"), or merge it into that commit?
> ---

Inserted before commit commit a414e4ba513f.  Thanks a lot.

Happy easter!

Nicolas


