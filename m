Return-Path: <linux-kbuild+bounces-9029-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 57997BC04BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 08:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 047F634C68B
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 06:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E79A155389;
	Tue,  7 Oct 2025 06:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4JsO/LeV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CEE84039;
	Tue,  7 Oct 2025 06:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759817040; cv=none; b=Y9j4sgx6ZYPwqAuDD+0dlN0L8bBA4+18GQOVTC0ZTPQnIk5lmsXY1ZP/w522pKuVsg0S1IzWgMVnhdQTfZfQgIzrkNUSZR3b89SEFA1DOxay4fZLA8lULj/QoQsYR0gav/IRNrP0VTBNfLLxq6Ypu4aUXoO52pHzmJhcbiH+39Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759817040; c=relaxed/simple;
	bh=3Go3X2PFSQ6ilStTXsRSqcis0ZnmWnOyNXEGd6+LFm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbTIEnG9G/4tlnrREb6o9piRrOPIuvOMhyDjw4CsSpVdOFkaZHWjR2eqZGocmMirzt/EO4uOl/xjgggdCLpsnEBHlHOU3Fl2haX+6Y6MUBJFJU3IU9WuJkOZPArwlFpdgXOslv6XNwZwIXTMJ2juTTh6Y3zSU2jQpldstoNw46k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4JsO/LeV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kuE2KyXftgWpU4iOunLu6ck8fdLEEJEj0YxHJD9XdHM=; b=4JsO/LeVqOM5QWqD5INpvZO2rn
	dPrH9pQDq03L6IEepWwyg/75IKyRWAL3yGdwwD3S8J0xgvF+TNs/+O08SyAHVXvVnH5OftC64n2T9
	2GVGDJhgwCcKa7r2JZW/cWRauA41hYzyTRSxIRCS+1yIVI7eGt/xd+K4rgi8CXdai+cCaq/AnbP9A
	Mrbmol0QnqN4BzEIwaGYrS14dRLKFhNJbFH7qVoBWEDVzyfOrbkSYFrT9tvZRUVRZfGKnsGqwfo14
	7Xj0e8VFy9o8JZ+xmFM6jjYAB+3DnZtrV3ErculQxvTaJ8T2i+lnbqFD3ttuYpkYOwlFEFdituve2
	6gP6byfg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60nl-00000001Ks7-11cA;
	Tue, 07 Oct 2025 06:03:57 +0000
Date: Mon, 6 Oct 2025 23:03:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Disseldorp <ddiss@suse.de>
Cc: Christoph Hellwig <hch@infradead.org>, dima@arista.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH RFC] gen_init_cpio: Do fsync() only on regular files
Message-ID: <aOStTfvOR-C7l1se@infradead.org>
References: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
 <aOSZo8h6l2XNin3C@infradead.org>
 <20251007165732.66949558.ddiss@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007165732.66949558.ddiss@suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Oct 07, 2025 at 04:57:32PM +1100, David Disseldorp wrote:
> I should have explained why in the commit, sorry. The intention was to
> catch any FS I/O errors during output archive writeback. fsync() is
> called only once as the final I/O.

I don't parse this.  What does 'as the final I/O' mean?  If you want
to catch writeback errors, a single syncfs should be enough.


