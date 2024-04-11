Return-Path: <linux-kbuild+bounces-1528-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 993548A1CA5
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Apr 2024 19:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55CB82860B5
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Apr 2024 17:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A071117CBE0;
	Thu, 11 Apr 2024 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GV3kEgin"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E7D3D57A;
	Thu, 11 Apr 2024 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712852974; cv=none; b=Eyh6tuSeK3Sc7DuRPuoA3KF9EUsuisdEmQyGPUWEAvuKJUKI7aHO6EYY6/8BzeIgF1tvfwhO7d2SFar2jBFa35HjCV5IibIbX9WU47du4aDZclxenouwHjhuDN84uLh2cQAC1qDAzPUiqkPd7zWxhvvCVFsBcbaFyNHYd1p57c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712852974; c=relaxed/simple;
	bh=5KYOKLUoKUSHt+aSUX0mRdSiiFrnp5pk3GvLLooLOG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdrDTYc1iGs/Clfu56pNmx+ux2+O7jLRTu4raCUYG8foi8FE/TOTMBKqq0y/bcusfZl1ctJ5kArM3WSUlNSyCNNOT85+k8NqbkcYWYhhuElsvauxFraQc/qCsCReth1YkbNfcKBHri2r5KrNoqBWop9NNgW6bET3IQvjqWjJOcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GV3kEgin; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jSoELd035Qbpy5VZyyE32Ep100gFdbPAw1g5jQHs3Gk=; b=GV3kEgin3atUbtVlAM9Zi1o7mL
	uiwrfPr3Y2s6po7PQUakBsr+gPOriaV3RYZA51NZtP6tRAl8QbiHvyxpnIkLMZYw1busyZL/lxDdB
	nS2kdjUG2e/sRknhVltIsFiRoiDi+dsQD3P17gf+jbQze1pz/xB9xArIWxCrqawiqX1iNM910Hv5/
	Q2uYRWMlf+ipQpi0pP3hm6X8McFvYQwrfdaguJqQ+aD9/D8D+JhlNTqiPbwJ0J1/LCDUi0x7Rdj5C
	h7UHMWAuYvxWAIOtpVD6a0qi53ihd3/K1zuAfUF8DiORxnM5gUr4zC7b/0DMZS5ZWfetUpUPLVRAq
	L3dQqCPw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxIo-0000000D5AC-2bTn;
	Thu, 11 Apr 2024 16:29:30 +0000
Date: Thu, 11 Apr 2024 09:29:30 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Yifan Hong <elsk@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Matthias =?iso-8859-1?Q?M=E4nnich?= <maennich@google.com>,
	Ulises Mendez Martinez <umendez@google.com>
Subject: Re: [PATCH v2] module: allow UNUSED_KSYMS_WHITELIST to be relative
 against objtree.
Message-ID: <ZhgP6nzoDAH6UqXB@bombadil.infradead.org>
References: <20240410193734.29788-1-elsk@google.com>
 <20240410194802.62036-1-elsk@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410194802.62036-1-elsk@google.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Wed, Apr 10, 2024 at 07:48:02PM +0000, Yifan Hong wrote:
> If UNUSED_KSYMS_WHITELIST is a file generated
> before Kbuild runs, and the source tree is in
> a read-only filesystem, the developer must put
> the file somewhere and specify an absolute
> path to UNUSED_KSYMS_WHITELIST. This worked,
> but if IKCONFIG=y, an absolute path is embedded
> into .config and eventually into vmlinux, causing
> the build to be less reproducible when building
> on a different machine.
> 
> This patch makes the handling of
> UNUSED_KSYMS_WHITELIST to be similar to
> MODULE_SIG_KEY.
> 
> First, check if UNUSED_KSYMS_WHITELIST is an
> absolute path, just as before this patch. If so,
> use the path as is.
> 
> If it is a relative path, use wildcard to check
> the existence of the file below objtree first.
> If it does not exist, fall back to the original
> behavior of adding $(srctree)/ before the value.
> 
> After this patch, the developer can put the generated
> file in objtree, then use a relative path against
> objtree in .config, eradicating any absolute paths
> that may be evaluated differently on different machines.
> 
> Signed-off-by: Yifan Hong <elsk@google.com>

Applied and pushed, thanks.

  Luis

