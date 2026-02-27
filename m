Return-Path: <linux-kbuild+bounces-11477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO+oNupRoWkfsAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11477-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 09:12:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25E1B44BF
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 09:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DC98304FF5E
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 08:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2673783AC;
	Fri, 27 Feb 2026 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFCToiXW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A71B2C859;
	Fri, 27 Feb 2026 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179936; cv=none; b=WktjW313VfFYhWSO1+PM1LK1/17L8Bmy5vCnd7KOoDn8yURoABVtnTxU5kVx4nKcMGa+LplGSHCwK2xJzsOgCqbTKmXvnpvRCVoQrBXwTtrOOFndLXmHkP99UxL6InoWv4RfmupGNdQ+oBghATBVcwJxJKnzrcSzbNirZsm6lek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179936; c=relaxed/simple;
	bh=5yHFi7Uqf8PvGODIPdnTDF9ERiveAaJ1TGA+YyK4k+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpXskdwmhIDeLCCJAEkcQX+ETATpzosgH3qrRINXRsl6KH73uvW2OndnX5/u5GyusPETiXuiU2q6a1DItL64OCfGKkQrK0jJtBSc0aKgSASLg1fYQlucR4bQAHxIikYpOl7aKupguenBp9TZIjfaU/vSVJoMs3QvzQF7+6oSFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFCToiXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7C3C19421;
	Fri, 27 Feb 2026 08:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772179936;
	bh=5yHFi7Uqf8PvGODIPdnTDF9ERiveAaJ1TGA+YyK4k+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFCToiXW8kKLNKrfK9wi86ym03t4i4g4YOCcaC4QFIXqzq6O2Wx/fZRK0fBUIC9r3
	 YhpUpsw7Vlwq7ZqvNCs3MZadZFnyddn8GUjjuaNMuu72R1jOauKeALLUMu2TjNC7IB
	 IE6yVX/1YCSSB0QHlWJb03e19LfwLxmjqNO0THShZj4lNiy20VRwzXHVtMrBCAAAuv
	 n9v3X2qkroTDkg5H1bNbjA8HEnFONCCh0PJkTT9t3VXQ8++Opo3bKsuGZHDO6jaPFo
	 8LVqw7nYrIbSFQzq88/ieFaZeX4s7SoK8khFmFxGVedj4FjmC3fnUVIalR2ME+9EWw
	 h2VOBtT4eM4pw==
Date: Fri, 27 Feb 2026 09:08:00 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] tools/build: Reject unexpected values for LLVM=
Message-ID: <aaFQ4Klr6JcJmFFW@derry.ads.avm.de>
References: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
 <20260226-kbuild-llvm-followup-v1-2-201cc2a492d9@weissschuh.net>
 <20260226214558.GB1534917@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226214558.GB1534917@ax162>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[weissschuh.net,gmail.com,google.com,lwn.net,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-11477-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7F25E1B44BF
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 02:45:58PM -0700, Nathan Chancellor wrote:
> On Thu, Feb 26, 2026 at 10:23:58PM +0100, Thomas Weiﬂschuh wrote:
> > Since commit 502678b88cb3 ("kbuild: Reject unexpected values for LLVM=")
> > the regular kbuild rejects unexpected values of LLVM=1 instead of
> > silently treating them as LLVM=1.
> > 
> > Align the tools build to kbuild.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > 
> > ---
> > There is no formal maintainer for this file.
> > IMO this change should go through kbuild.
> 
> Ironically I just rejected a tools/ patch going through Kbuild:
> 
>   https://lore.kernel.org/20260225192505.GC2755225@ax162/
> 
> but since there is no formal maintainer, it is the same change done in
> Kbuild, and the risk of fallout is much less than that change, I think
> we can make an exception and take it.

+1

> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

