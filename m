Return-Path: <linux-kbuild+bounces-11325-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDieILjhlGlqIgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11325-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Feb 2026 22:46:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF0150DEB
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Feb 2026 22:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE83430488A7
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Feb 2026 21:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442292C0299;
	Tue, 17 Feb 2026 21:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzatSmBb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2155B267B89;
	Tue, 17 Feb 2026 21:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771364728; cv=none; b=idl1laxmysgUPGHBvmADOtA0U3W82r8fRc6R8CTohfd7P+jTl+0h1sR2IsqL7Sv5zpZTxolK2kje+i3lPw/tXJxESuZtTmBJeTwJ9AgYNQQCIWItJNg+gmI2jKPNmG/srQHXT8NeuM9PCwT/nty33eM7q4kZOnrunwmrXs5wY5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771364728; c=relaxed/simple;
	bh=JPTM2IadFeMvKIMn4IZtSDZBa3m3Kmc9Y1jeip9vad4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ob/wAgN9PCLBGfjjkdcRqOss9p2ho+YlFHgMTQzdzxSvVZZ+AKbzbhg7E0SF0+OI+f1ky+KAZ1E2TJ1LYnjonJxhsJKv5g2T+gf46ac7HiccWRYcXDVSc04tHmIRU25q5XKAgxyltXNfuMZJDNDw5nOWnxve9CBPLYT3kqbw8G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzatSmBb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F222CC4CEF7;
	Tue, 17 Feb 2026 21:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771364727;
	bh=JPTM2IadFeMvKIMn4IZtSDZBa3m3Kmc9Y1jeip9vad4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dzatSmBb5dRdKVM7QGegf8H9JKCVmt1CyPf4WmQL1F5Vq5SXeawmvTvZVsb4Lidi3
	 9tTPWPv5cblZv1V/ofOpaxUTWKnootvYiDk6wdTAKdhIWv1fWWyljUAbFhZd+bjzko
	 pLHcn6JwMnFM+UwxuY6s3DyC7rhoZdsXQlIQTzMXOhSv/iRwG+NGdcZs5nQJSk6x41
	 xpkoXNEMWrORVa5tgQ6/8hquM6Aw84uaut69bgWEeNICcaA4c5BfneDqQIrZQSeis2
	 lKQBfio9w2Mtf1o99NqkXh9X8R5Aur9Lw3+jfXeQax305vnY+hxAFO/PeRYw2g0Z3k
	 Cx7hrRUUZ0kCg==
Date: Tue, 17 Feb 2026 14:45:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Helge Deller <deller@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] fbdev fixes and updates for v7.0-rc1
Message-ID: <20260217214523.GA3380010@ax162>
References: <aZBlTsIwTzS0tqBD@carbonx1>
 <177110244909.2897141.11184148040863874004.pr-tracker-bot@kernel.org>
 <aZDpCUcIXLmuydoF@carbonx1>
 <CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11325-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17CF0150DEB
X-Rspamd-Action: no action

Hi Linus,

On Sat, Feb 14, 2026 at 02:47:47PM -0800, Linus Torvalds wrote:
> [ Adding Kconfig maintainers and linux-kbuild list ]
> 
> On Sat, 14 Feb 2026 at 13:30, Helge Deller <deller@kernel.org> wrote:
> >
> > Linus, I'm really sorry, but I messed up drivers/gpu/drm/Kconfig while
> > trying to fix a merge conflict.
> > My patch series should not have touched drivers/gpu/drm/Kconfig at all.
> > That's purely my fault and not the fault of the patch author.
> 
> Humm. Funky how the Kconfig parts never complained about the
> duplication of all those source lines, so the problem was basically
> entirely hidden and things still "worked" even though that Kconfig
> file had been so messed up.
> 
> I'm not sure if the Kconfig tools could perhaps warn about this kind
> of duplication - we might have some of it intentionally - but it does
> make me go "Hmm".
> 
> Nathan, Nicolas, comments? See that commit ca4ee40bf13d for the
> partial revert, and notice how Kconfig is entirely happy both before
> and after that..

It seems like we should be able to check if we have seen an sourced
Kconfig already, presumably somewhere in or around zconf_nextfile() in
scripts/kconfig/lexer.l. Not sure how complicated it will be, I will see
if I can wire something like that up during the next development cycle
(amongst the other things on my plate). Given how wonky that looks in
menuconfig and the like, maybe it is worth making that a hard error.

Cheers,
Nathan

