Return-Path: <linux-kbuild+bounces-11973-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG2FA5pEuGmLbAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11973-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:57:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4194129EA79
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6ACA3004616
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DC633D4F0;
	Mon, 16 Mar 2026 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFlEJVaX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF5A33A9DD;
	Mon, 16 Mar 2026 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683813; cv=none; b=OZC/Yf1HcURds0YO4wMxGWc9ZaydCkLDSUQFvJGqQNU8P/bN0usKDFhzB8zJ5592rHLJ+bJwMb3PjfQts5LubJu7rJgSbe28LTwvqcInauSciPycc3wQkVwkG0N+/cynmcsMqnRif4Re3VqFZx6dV6frr9XuBD6o2BBUvf9TVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683813; c=relaxed/simple;
	bh=q0y8BC7GzfesebMNcpcg7i9dnaVgrshHFWjsHC4iOu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soe/mTVQTavOw6YDZE5d5t9xTrFk87Fg+fgFSlgh62XnwGEbYcCTCRBsMzFIFueCigFeuaXdXJ3MGqNW+WhXpk5UtUEfddKd9tDF1YQVOa1cYOMj69FxIWg+Bi6Tu2AzcM5tX8iBZslQ3sg0QQMK0Z/j+NcYx1ssumVCV0SOquI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFlEJVaX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBD6C2BC87;
	Mon, 16 Mar 2026 17:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683813;
	bh=q0y8BC7GzfesebMNcpcg7i9dnaVgrshHFWjsHC4iOu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFlEJVaXpE6jStGa3SJRMs060nrfHkpqXCSBBlRrN5jlZ/2qTCqCOaIOFhz6yK08u
	 h0ZHmDZ6uMxqh3dzNGC7B+4KlewKD4gWjipXHt3XGStjoVWJqtQRjFYh77YRGv+Ed7
	 /gTxcDluk4uDbiuffzVUWqD8LTMZQnbdS9pvhyDSrGj2cXHpxjBCzuUF+zRcnoaalM
	 ij6Y4zrqahjLuLGyfZ3BJZFj/mFNZR+14bm0GtP1qwi8DYOiIsiDjeqwWcHJdVYyGU
	 kG3KAfJvJEiNF5Rgvh27N5evzBrmHNTHTlX5YxxkRkJr2zTE9ubF+qmOH7AeUk/5Gx
	 +UHjmssSaMbCQ==
Date: Mon, 16 Mar 2026 18:56:29 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <abhETba3IvIH1BU9@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
References: <abgRRX3PH9IaExi8@sirena.org.uk>
 <abgph5Gk1G8UgG2E@levanger>
 <d9a3537a-9abc-49f0-86df-13089ff35a3a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9a3537a-9abc-49f0-86df-13089ff35a3a@sirena.org.uk>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11973-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4194129EA79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 05:42:17PM +0000, Mark Brown wrote:
> On Mon, Mar 16, 2026 at 05:02:15PM +0100, Nicolas Schier wrote:
> > On Mon, Mar 16, 2026 at 02:18:45PM +0000, Mark Brown wrote:
> 
> > > Makefile:2254: *** extraneous 'endif'.  Stop.
> > > Makefile:2254: *** extraneous 'endif'.  Stop.
> > >   PERF_VERSION = .gbc1f864a1976
> > > 52.34user 4.91system 0:56.88elapsed 100%CPU (0avgtext+0avgdata 140840maxresident)k
> > > 0inputs+0outputs (0major+1379795minor)pagefaults 0swaps
> > > Building: arm64 allnoconfig
> > > Makefile:2254: *** extraneous 'endif'.  Stop.
> 
> > thanks for the report.  Unfortunately, I cannot reproduce that anyhow;
> > but I pushed to kbuild/kbuild-for-next at 12:36 UTC, might that have
> > been a bad point in time?  Do you have your merge somewhere around where
> > I can fetch it for investigation?
> 
> I tend to start late mornings UTC so something in the middle of the
> night won't be noticed.  I don't have my merge to hand, sorry - you'll
> be able to see where I merged things by looking at the history of -next
> for the kbuild merge when I publish today's -next.  IIRC there as
> nothing other than merges and the commit I flagged in there, it's
> possibly a merge issue with Linus' tree?

Ok, thanks!  Then I'll have a look at it tomorrow (14h ahead) and hope
to fix it for the next '-next' round.

-- 
Nicolas

