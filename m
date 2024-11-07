Return-Path: <linux-kbuild+bounces-4537-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B80B79BFDCB
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 06:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E96E11C21B47
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 05:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCEC192D68;
	Thu,  7 Nov 2024 05:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b6vcZLH0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9376FBF;
	Thu,  7 Nov 2024 05:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730958419; cv=none; b=EkuAKiEmKhIrhpvdeqiqF8jV59pSqqA/NUnRYxSPjmmu0uNNzHp9CjPQypD3Yh/mSAHyK/WqAz37YqPw0h2LwB/pfx4UhAmGm16KzcTZbM+23SOW1vDtR8x6okd4PIL9g247twHytxEhYmVOs6HuMACjcLG8DyjcxLvVytnqAJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730958419; c=relaxed/simple;
	bh=U6TAUWpp6YCZPpNfVICIRBHslEm44bWdJrgTkuIx9iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay/f4BOxL+vVYNMShw+0vj+WGBp4J+Z6ozQ4OyPZAU2fLi2GcZPyxSu+OobS9iQCDqUOIxyZJu2gRixdIBGTDsK+fVvN9hfK7X80F6cga+B5Klia2FTUmHLGUTXqpM72QUZO7Bs1GKOYJBCNSM9KAT9ncCmMQFrl6NNsWWZVYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b6vcZLH0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xsw2uo8JjXrJF1a+GH1+9h8M/XifofVZ2RoBiXka41Q=; b=b6vcZLH08woo58egLr69U/GKg6
	tX5nsY+Cs7VVklRsFsGDcQMrJvuuzuca4TKN+GdQh6aFw1y6+Z+ba8kQPK1t3juEdaQ8nzwf8jpZB
	RHJa1jrdl+h19zaa+a6yzy1oO7XIJoccqY6ldQBmyXBqzFQNM641rSXSE978w1pxCeqAaiEXSLyuS
	vBBC9yk+BPmYu6FxKL+8H1w+2gY87dFzZon/F1mRjlL67jPPuOAl334Uvnxf3k/iXoxVEFt85gZ7r
	uLpOl8J/q7TXwqIsvutEDwJ5Bipz1sJ+DdaPPLDDWHSXDtfgZbqn47Okxlf0HH2joigJiVgIwORgU
	YnpOHxQA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vM5-00000005kV4-0lfM;
	Thu, 07 Nov 2024 05:46:53 +0000
Date: Wed, 6 Nov 2024 21:46:53 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, hpa@zytor.com,
	petr.pavlu@suse.com, samitolvanen@google.com, da.gomez@samsung.com,
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, hch@infradead.org,
	gregkh@linuxfoundation.org
Subject: Re: [RFC] module: Strict per-modname namespaces
Message-ID: <ZyxUTT8t28XUkk4x@infradead.org>
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
 <Zyv-yxClglfwvmUa@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zyv-yxClglfwvmUa@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Nov 06, 2024 at 03:42:03PM -0800, Luis Chamberlain wrote:
> > This allows exports targeted at specific modules and no others -- one
> > random example included. I've hated the various kvm exports we've had
> > for a while, and strictly limiting them to the kvm module helps
> > alleviate some abuse potential.
> 
> Yeah we also want:
> 
> EXPORT_SYMBOL_NS_GPL(bdev_disk_changed, MODULE_loop);
> EXPORT_SYMBOL_NS_GPL(bdev_disk_changed, MODULE_dasd_kmod);
> 
> But we might as well have EXPORT_SYMBOL_GPL_FOR() with the implied
> module list. We could then add just:
> 
> 
> EXPORT_SYMBOL_GPL_FOR(bdev_disk_changed, loop);
> 
> But it would be nice to just also support this as well:
> 
> EXPORT_SYMBOL_GPL_FOR(bdev_disk_changed, loop, dasd_kmod);

Parsing a variable length list in a single macro tends to be a bit
of a pain, and I don't think there is much benefit.  Most of the cases
should be exactly one module.  If we can cover the small uses of
multiple uses with multiple exports I think its perfectly fine, and if
we can't cover it at all I can probably live with that aswell.


