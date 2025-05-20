Return-Path: <linux-kbuild+bounces-7176-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84585ABDDC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 16:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8C493B5A3D
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 14:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1806C24A06A;
	Tue, 20 May 2025 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPXdAy6A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE760248895;
	Tue, 20 May 2025 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752632; cv=none; b=rPGkAK/D93nGk0o7BxDWemENulLrNa1+YnbYudp2WXbo9YknKFXXAe57AzK2I9WKRYaSXKrUqP7DQ2Sy1Nni/9kee+ygsJAoboVYh3/AW13Szdps4+Hv5J6EW3rFs4M4R/y/+vrlh7DQsbu2hZS6GsKL02D+vC/o9mo+kOT7pK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752632; c=relaxed/simple;
	bh=vSFkFDNoruSqIw3vqssboHhOnvSYTX8hKjBoIt8fao4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nh1ykcLR9hTzuP3yetDuuvGReFT0cOZEmz8w7Xph1IxvZ1QSBCHP0i1APxjqr55NdYO2LPA0OISGCv8lcFrXI/u7C3pC+QWx+bFLhZQ2WajVoemLcn8w0srDlQx9GxrvDS9jC+xTKTkdoU6eapvFm6gO/4uVymjYwNMwDc0+tPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPXdAy6A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79AEC4CEE9;
	Tue, 20 May 2025 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747752631;
	bh=vSFkFDNoruSqIw3vqssboHhOnvSYTX8hKjBoIt8fao4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aPXdAy6AZkJChuRAVnyusFfBy5YT4MWiFXdoDwUBiK+Np1pPUETvCOHt1TI5XsvHT
	 w9A/TR2XvRjto2JAkpAieUZvdLq0ZLAyJbQglLaJWvcA0/HUE1oEgTHc/fBUXt0RIB
	 uBYkypKlkPpS8VL9w5jYUhI7N+jhslFIEni1670DFhanDIP2gTM+QT1JYIKyaQ0TGq
	 au6bFF3qlsRCdO4oJ32y7+3BeGCAT+y0Pu02rh+kZ6+pneUzbpXMDMfkMcEtwWiZPt
	 nQRo+06t8rbBQL8pGORcquVgBvhCawsAh4JCRK/cXM/9g1bfvaO6vk70tQFE5/CMht
	 /wn04XeOmlqeg==
Date: Tue, 20 May 2025 16:50:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, Randy Dunlap
 <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook
 <kees@kernel.org>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] docs: kerneldoc.py: add try/except blocks for
 kernel-doc class errors
Message-ID: <20250520165024.7447a107@sal.lan>
In-Reply-To: <aCyQIwBnSiPLPrDo@smile.fi.intel.com>
References: <cover.1747747695.git.mchehab+huawei@kernel.org>
	<064bac2f462c13f56154891d8f3fb788db94f325.1747747695.git.mchehab+huawei@kernel.org>
	<aCyQIwBnSiPLPrDo@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 20 May 2025 17:22:27 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> On Tue, May 20, 2025 at 03:33:08PM +0200, Mauro Carvalho Chehab wrote:
> > Replicate the same behavior as what's done with kernel-doc.pl:
> > continue building docs even when there are exceptions.  
> 
> ...
> 
> > +            logger.warning("kernel-doc '%s' processing failed with: %s" %
> > +                           (cmd_str(cmd), str(e)))  
> 
> > +                logger.warning("kernel-doc '%s' processing failed with: %s" %
> > +                               (cmd_str(cmd), str(e)))  
> 
> The prefix of the message is the same for different (semantically) places.
> Is it okay? (I would expect them to slightly differ, but I dunno if
> cmd here is the same, perhaps that's enough for distinguishing the two.)

I guess it should be OK, as the "%s" variables are the ones that will
actually help to provide a hint about the issue. See, in practice, if
one wants to check what crashed, the procedure would likely be to run 
the command line, given by "cmd_str(cmd)" and see what output was produced.

Regards,
Mauro

