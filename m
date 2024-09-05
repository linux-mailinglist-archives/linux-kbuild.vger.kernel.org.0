Return-Path: <linux-kbuild+bounces-3394-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7186896D286
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 10:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09477B22349
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 08:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD72189901;
	Thu,  5 Sep 2024 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2euH0Yri"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB381145B10;
	Thu,  5 Sep 2024 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725526539; cv=none; b=qRT7ZHoQyhmyeble7y3qICZjHnWT63Y85Yy83JexWf01ynj+ucEcSjXtpEzCot5WP5+bF5x4dWeLna4xpuClPpeuEe2RjlU80RWERK+eq7JojqViI0NjHAGF9mei3X5zMDbcDwOfzCv4tlCAP1T549DK3qyPdVme3nK5j7QpuxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725526539; c=relaxed/simple;
	bh=pptrtwecTm2vs7pR9+635jVizxBVhb2ekXC/H4dXEcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUmSJ/rdNHH765M2RDGSFFC0w9OeQAmlnev2xYtFtrm48VJaB20oXRwwosf9tBwOYSKIuOTpfeOltDUAkvdbbXPvVTfXGxgZIwGgJZOomRQpPfHpx89TE6Ou8KKoaD/1xtqhXWAjDRjeG1aIla/0QYvxyrUljjGPW77ljpY5Snc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2euH0Yri; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bj/9hfuUUM8WFaatE+7Vlu1JF3d9Wxc1bvxKBCXyOdc=; b=2euH0YriP++SC+vj7jsSaicW0h
	MdsosUS095968lJj31s10KPBqE8xe5qlzO/KqsJV+yYPbyI2m9OBKBf9h9V+hQlz47pcOv1YVp0JN
	uN8EzOyQWaoK0o7puDfkuu2yNFma3qQDSxn6Ct0H2GxvqIqIJF1VdCiRBxDbKvEwU9qkfTEHHpSQ4
	AA7TkOtDJ0jGw6ijn+xDWBciMDPhcDMMUtQTC24fWD3cyOpVkiE5P8uBEPhaJOnxj75TvnFe+ss0n
	mZWBpW3zMjrC8lX1jw85repNMUm4chNIsjQQuSkMqeIxT/YP3JeAhWINC4/e2iKbHH4mTDmYS/4fd
	VE/fsGhg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8HB-00000007euu-0LqL;
	Thu, 05 Sep 2024 08:55:37 +0000
Date: Thu, 5 Sep 2024 01:55:37 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: deltaone@debian.org, jan.sollmann@rub.de, jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	masahiroy@kernel.org, thorsten.berger@rub.de
Subject: Re: [PATCH v4 02/12] kconfig: Add picosat.c (1/3)
Message-ID: <ZtlyCR4EloWbeWG7@bombadil.infradead.org>
References: <ZsPBfBQXNZmbNfpE@bombadil.infradead.org>
 <20240829212352.38083-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829212352.38083-1-ole0811sch@gmail.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Thu, Aug 29, 2024 at 11:23:52PM +0200, Ole Schuerks wrote:
> If one has to install some external package first,
> then that might diminish the usefulness. While there are extreme cases
> where it can take hours to manually identify all the dependencies, first
> having to build PicoSAT might take longer than manually resolving the
> conflict. Many users might then never install PicoSAT to try out the
> conflict resolver, even if they would benefit from it.

That's a package dependency problem, ie, a distro thing to consider
which packages users should have installed. But isn't the bigger issue
the fact that you want some C library not the picosat binary tool? Or
would it suffice to just have picosat as a binary installed? I see at
least debian has python3 bindings now too python3-pycosat. So what type
of picosat integration really is best for the task at hand?

> So the question is whether using PicoSAT as an external library is worth
> the portability issues and effort, and whether it wouldn't make more sense
> to directly include the PicoSAT source file.

The pros of an external library are less burden on maintenance, and
otherwise we'd be forking PicoSAT, but as I mentioned, I don't see a c
library but instead just the picosat binary. An alternative is to use PicoSAT as
a git subtree inside Linux on a dedicated directory, this way PicoSAT
can evolve and we can update it when we need to. Note a git subtree is
not the same thing as a git submodule, those are terrible.

> Otherwise, if we go with not including the PicoSAT source, then one could
> inform users about the missing package in the GUI, like this:
> When PicoSAT is installed:
> https://drive.google.com/file/d/1asBfLp1qfOq94a69ZLz2bf3VsUv4IYwL/view?usp=sharing
> When PicoSAT is not installed:
> https://drive.google.com/file/d/1ytUppyFPtH_G8Gr22X0JAf5wIne-FiJD/view?usp=sharing
> 
> Let us know what you think. Include PicoSAT directly as a source or not,
> and then inform the user via the GUI?

Do you need the picosat binary or the actual c code for helpers /
library?  I don't think we have anything in Linux yet using git
subtrees, but I don't see why we wouldn't for generic tooling and
this might be a good example use case.

  Luis

