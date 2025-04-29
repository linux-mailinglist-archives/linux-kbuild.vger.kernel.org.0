Return-Path: <linux-kbuild+bounces-6796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09227AA1024
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 17:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DF2517E262
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 15:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C2C21D3EE;
	Tue, 29 Apr 2025 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSK+laBa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6B784D02;
	Tue, 29 Apr 2025 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939719; cv=none; b=cGqJv9jBAjYq8U5DEqZL9NRROMj7VIrFeZlCIdc6b69lKjTRsyOvG+YuAz4Nqblmk9rSRbx40pkNZNUj7DMi4RUgvUN31p9PT/4pxUh9iAx2GT8JLGEGaYzuy515mnlnL7r5OU4dIpeZKrnq4fJufYWhhD2vd8eNYdHmUqCV/To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939719; c=relaxed/simple;
	bh=d3x/fAE3L3P7Ahk/PHPiq5UGFIghmwq9vcT+jdkOIpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMktxLALEMhyp8s1Xj69OVUgFNy07KxQNjQztFuug9xNUwd/O7R9xaACPaNfbJyRsnLrNgmZ65PyVhq1nwDU8GaSU7n5hZhTnBEEDrptQvjpw9M+t7MsQiEJnYbGynUWGD6i9hnhLKjn42Xm06l67wnhQG9R/H9lrB/TVHws1b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSK+laBa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE2DC4CEE9;
	Tue, 29 Apr 2025 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745939715;
	bh=d3x/fAE3L3P7Ahk/PHPiq5UGFIghmwq9vcT+jdkOIpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSK+laBaCMabYZa8QGurmlVl1zbRlv8bMW8+qOB8UZOJY6w1vEHTMsmPtfMJbCwZJ
	 uBz86V+4wnBw2zDC+re4NT2qs/wKPKTG7vIxg87i1/ZO0QvJYFte87xu3pWOs+vxMZ
	 PzfAbdJyOtcwH3Jt9ilPcvx2fr8X1lq5gmCzaponcBpsjjrEVGMG9h1rjPEVBvpsa8
	 4/tl3AUhynEJKpyUqUdB+XY8GdAzHDAcnJq+RabKQAKOhgWJ5UtmOP/m6WPhNhzn6p
	 GsuCP4YpvFmCwa8RlI0ymMoOYbKffdiQns6ndKZRoQ/EgFKrBBV3RAR5aiXSoMCM50
	 WvcODUxwQvb/A==
Date: Tue, 29 Apr 2025 17:15:09 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v1 5/7] modpost: Create modalias for builtin modules
Message-ID: <aBDs_Unta7-vOPk4@example.org>
References: <cover.1745591072.git.legion@kernel.org>
 <bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion@kernel.org>
 <cf3ff619-6177-42e1-8f64-74cf4cbb8672@suse.com>
 <aBCkNh0Q2hwpMchj@example.org>
 <aBDK0G6OUUcEmzvZ@example.org>
 <7b13da9f-39f2-4007-931b-519d8e7d1ab6@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b13da9f-39f2-4007-931b-519d8e7d1ab6@suse.com>

On Tue, Apr 29, 2025 at 04:14:13PM +0200, Petr Pavlu wrote:
> On 4/29/25 14:49, Alexey Gladkov wrote:
> > On Tue, Apr 29, 2025 at 12:04:44PM +0200, Alexey Gladkov wrote:
> >>> I'm not sure it's best to overload this data in this way. I think mixing
> >>> actual files and "logical" modules in the modules list is somewhat
> >>> confusing.
> >>>
> >>> An alternative would be to keep a single module struct for vmlinux and
> >>> record the discovered aliases under it?
> >>
> >> It is possible to extend struct module_alias and add the module name. The
> >> problem is that alias is added by module_alias_printf() and we will have
> >> to add the module name to the arguments to each do_entry handler in
> >> addition to struct module where there is already a name (but in our case
> >> it is vmlinux).
> >>
> >> I can do that if you think it's a better way.
> > 
> > If I don't add separate entries for each builtin module, the patch will
> > look like this:
> > [...]
> 
> I see, that didn't turn out as well as I envisioned. One more approach
> would be to track builtin modules separately. A patch is below. I'm not
> sure if it's better.

I'm not sure I get it. What do you mean when you say I need to track
builtin modules separately ?

-- 
Rgrds, legion


