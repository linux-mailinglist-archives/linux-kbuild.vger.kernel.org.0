Return-Path: <linux-kbuild+bounces-9032-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A395BC054B
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 08:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FC0C4E6258
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 06:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADE62135B8;
	Tue,  7 Oct 2025 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CxTKTgX9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B606208D0;
	Tue,  7 Oct 2025 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759818523; cv=none; b=e6h1LKqIMt41f7KufI9BivEZp3lqbZEH03mPlGSyHJ/Ca9tR1pBWThk2DiXTwxbxY5HEnHp/e2dO5zwxbQtMdyPN8mJ3QzjqdeNqZMQntlql2TO5YxciID6ztf3l4rcZAJOb/Bi1otuQodKQDorHnlJm5k6vR0JMunmFV7aL4ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759818523; c=relaxed/simple;
	bh=JHP3w83ranJKofgy+ICEW4qvy6Ftj/xL8oVhICw0e1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUNfbZGmv31AGEKWg+X5iGTel3ILWai9X+FU5dwN+r4An2wyBe6R3zPOXORu6QVSr/jANKZcMHBySWjcA8GLVxK55r231BpUEwf3s33HQU5ZllmRvzlXzrCA+Iz/Rhj0rjperjx+viS7xsKJOYmgB+2jTG5jJInp59PW5nM5420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CxTKTgX9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jvyHlrrXhbs7kCNYUcL+h44dh1vvxBRvtL2nVCRhMR0=; b=CxTKTgX98L0a5Cr1oJUjL3RA0X
	5ReHEmpgKX1pB+2iogtipXf6PXpua+TZI0rU202zQh3p+7Piqvwb9ULnPOgwIEqAEFf6iBoGwONvl
	W0Ugype5bv4MJThaUI4tquESVH33TbDmpi3Nf1FRLeePY98qAcOTOng/lcEqjRMAknMpV0Moc50oO
	4hRaIhNCxmfcVuOCsTyt0AAarfQZKcPoSCVIGFzhhKwg4C+8Ntv+K6c/9A5EvnM4Sjon7bH+jH4ym
	8lQdrnYkxW2uQS6CDyloffLv9mAAGHlhMUc3ekXpo7Ccv3mtOKslR3HwEu1n50mGLFnZHyxfCoxW0
	eSQ111ew==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61Bh-00000001MSs-2dey;
	Tue, 07 Oct 2025 06:28:41 +0000
Date: Mon, 6 Oct 2025 23:28:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Disseldorp <ddiss@suse.de>
Cc: Christoph Hellwig <hch@infradead.org>, dima@arista.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH RFC] gen_init_cpio: Do fsync() only on regular files
Message-ID: <aOSzGf7OFn2Gkkbe@infradead.org>
References: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
 <aOSZo8h6l2XNin3C@infradead.org>
 <20251007165732.66949558.ddiss@suse.de>
 <aOStTfvOR-C7l1se@infradead.org>
 <20251007172556.3e57b0c8.ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007172556.3e57b0c8.ddiss@suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Oct 07, 2025 at 05:25:56PM +1100, David Disseldorp wrote:
> On Mon, 6 Oct 2025 23:03:57 -0700, Christoph Hellwig wrote:
> 
> > On Tue, Oct 07, 2025 at 04:57:32PM +1100, David Disseldorp wrote:
> > > I should have explained why in the commit, sorry. The intention was to
> > > catch any FS I/O errors during output archive writeback. fsync() is
> > > called only once as the final I/O.  
> > 
> > I don't parse this.  What does 'as the final I/O' mean?
> 
> fsync() is called once after all buffered writes and copy_file_range()
> calls for the initramfs archive have completed.
> 
> > If you want
> > to catch writeback errors, a single syncfs should be enough.
> 
> gen_init_cpio should only be concerned that the output archive file is
> flushed to storage, rather than the entire filesystem. Why would syncfs
> be more suitable?

Oh, it is called on the generated archive.  Yes, that makes sense.
Sorry for the noise.

