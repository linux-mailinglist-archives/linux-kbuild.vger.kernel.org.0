Return-Path: <linux-kbuild+bounces-11117-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E1IHpLIi2kwbAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11117-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 01:08:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F9B120390
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 01:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 939B1304076F
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Feb 2026 00:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3171C3207;
	Wed, 11 Feb 2026 00:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6uqC8Y9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3C11FC8;
	Wed, 11 Feb 2026 00:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770768528; cv=none; b=FOVL/1QEwxgO9Rcg4lAfxpWxTjJpDYGQYixFwQRk5OzJAJveFOPUfyTI0NgRbPsqadcvndtZ6du5oSpWeAciwU8fyrojd1H4XdgbiAb5w2lrsg0dlOiB7ISGASHNYBcjeKFKZviuqMGWZw9n78DPYeoKOv2zI6m9RrLCedZq0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770768528; c=relaxed/simple;
	bh=a/wyIwzu539mfRd+fSKj0L/c46DJlmi/exPfK6ruCYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U92tMlOPPoGqJ4wtI5eXcrWTUhcov85s1STVvCwWci4k2pcn8qCdzQ/PvITE2SjF64wTSzkTU2CEpa7j0asY6rRXQ0PPDyvUvVjZWWYTmeonidMuZD78d5O6k0yGZJD50XBNNQsS3qIDQtwNvqRtVhe3M+bvjmVcA4IzrF6WlmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6uqC8Y9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93297C116C6;
	Wed, 11 Feb 2026 00:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770768527;
	bh=a/wyIwzu539mfRd+fSKj0L/c46DJlmi/exPfK6ruCYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6uqC8Y9rTjLhx+ume1XnLsGEO6DUPb7Un4mgc7hlc0KFTi39HLVlTDTO9ra7qJAr
	 AoSR74DvlYuULsX4QyjVURqfNBq036iVBcxHaj3PQtppc/ohyZUaNIP1kLVTT8aarl
	 Y0zp/3EmlS1YZw1G4AvMPY8s2rWzWcy5r2pGfCRKI5e5HmAFMyfdiOjOrdxeHltqNo
	 N3qJlSpmQKl3UldX67TY22taMayMQYYawFojUgoggP/eGPHyoYvPjlkQ+GijBPLvZy
	 UWKSu3GnDjorQRCwBhY7w9e8WP07cZKcnQvK0uYq5Kf0X5hIf1fQwFk/vndZRKTln/
	 ZOldy5rFULkRA==
Date: Tue, 10 Feb 2026 16:08:45 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Jens Remus <jremus@linux.ibm.com>
Subject: Re: [PATCH] kbuild: Add objtool to top-level clean target
Message-ID: <5rjukudwwyq7miwyqe5s5ba4gmd3avmbk4vwn6ulozvrm6dbel@qlxttckoy3yu>
References: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
 <20260210221734.GB1148627@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210221734.GB1148627@ax162>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11117-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpoimboe@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D2F9B120390
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 03:17:34PM -0700, Nathan Chancellor wrote:
> On Tue, Feb 10, 2026 at 01:45:22PM -0800, Josh Poimboeuf wrote:
> > Objtool is an integral part of the build, make sure it gets cleaned by
> > "make clean" and "make mrproper".
> > 
> > Fixes: 442f04c34a1a ("objtool: Add tool to perform compile-time stack metadata validation")
> > Reported-by: Jens Remus <jremus@linux.ibm.com>
> > Link: https://lore.kernel.org/15f2af3b-be33-46fc-b972-6b8e7e0aa52e@linux.ibm.com
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> Indeed, I have noticed some funkiness in this area but not frequently
> enough to have the time to investigate it. This appears to work fine for
> me.
> 
> I will likely have a kbuild-fixes pull request before -rc1 so I can take
> this unless you want to have it in a different tree?

If you can take it that would be great, thanks!

-- 
Josh

