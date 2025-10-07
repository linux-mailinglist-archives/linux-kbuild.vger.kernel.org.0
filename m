Return-Path: <linux-kbuild+bounces-9027-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D23CEBC0297
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 06:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7EA61896B0F
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 04:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E917D16F288;
	Tue,  7 Oct 2025 04:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KvvUcnsC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4917A318;
	Tue,  7 Oct 2025 04:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759812004; cv=none; b=POiWskv4eXz1b+Z/Uqxn0Twn2TVY7chq8b+bYhuhoxb0PKKhaXcDYm9JGySDhsWjWH4F/PrkX9+kTWUqRNkakHUuIKr3ERguYhHZX+jW0tPpF0lXsZe7Qb7EO4d9W+g3eXGWsxSxHB5IKB2HrLyYxnjFBUTxTqdSWo95ghYf+3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759812004; c=relaxed/simple;
	bh=GeYSyG5ulRONz/Oh78xBkkMNZYojc/GpUceMuyVQSas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJVgyujYdrSMFpVch+0Gdy/XoS/tyG93dmDG5tbS88EEyrBWRtHdZjJ6lF3q6GgE3L1ORVAvYnzrwDP3KldfCjMM9+UoA/0+0lM5cZu0fjcicB1gh0fMvuBEkiNnitOu6JsEiQ0hzJygfJ/L3L7+SfoC1K+jEopzwqU607CplwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KvvUcnsC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+AguE4rucpaLg7FRf0dthwiLawI0yG7ImPAcuMa5Ft0=; b=KvvUcnsCCswrLRbrDcoRJmfHPB
	JJyHOcyzAWpyqdIoBTqJ/gVWCj9Ch9KAaFgb8NA2zaRHVyaFOpl4jTio9nzGpuWQyiPBGPglHSJXQ
	iqZ1S1Ku1o0XeJ5pH+8QOmpWSIslnvMCu0D1U+kxkqljO/t8MKlqljoZrYTT52qCP2///yKhIqCco
	NKRU42bkstpeUXRXiTSBzM6LAw2cgtMcfruEgoHTGu7QJtyEWFMZ/yRXU7P6Bx5Ywdc4TprN6NEk3
	6wFs3pB/B6Lek1COjRb9hkkN8IvqGhfE5gdpU0SVvvQ8e2W4JgezRDiARn/DBBcJ6rBDqOJcFL+9y
	NwTkgIag==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5zUZ-00000001GFd-0Y2k;
	Tue, 07 Oct 2025 04:40:03 +0000
Date: Mon, 6 Oct 2025 21:40:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: dima@arista.com
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH RFC] gen_init_cpio: Do fsync() only on regular files
Message-ID: <aOSZo8h6l2XNin3C@infradead.org>
References: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Oct 07, 2025 at 12:55:03AM +0100, Dmitry Safonov via B4 Relay wrote:
> From: Dmitry Safonov <dima@arista.com>
> 
> Here at Arista gen_init_cpio is used in testing in order to create
> an initramfs for specific tests. Most notably, there is a test that does
> essentially a fork-bomb in kdump/panic kernel, replacing build-time
> generated init script: instead of doing makedumpfile, it does call
> shell tests.

Why is is using fsync at all?  Seems like this was added in

commit ae18b94099b04264b32e33b057114024bc72c993
Author: David Disseldorp <ddiss@suse.de>
Date:   Tue Aug 19 13:05:45 2025 +1000

    gen_init_cpio: support -o <output_file> parameter

without any good explanation.  In general doing a per-file fsync
is going to horrible wreck performance, and given that no one is
interested in partial initramfs archives also rather pointless.

