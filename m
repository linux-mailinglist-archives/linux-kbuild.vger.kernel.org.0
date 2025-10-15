Return-Path: <linux-kbuild+bounces-9171-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F7BDDF0D
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 12:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C07D1924FFD
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 10:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88618316917;
	Wed, 15 Oct 2025 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hy9oruxp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2641A5BA2
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2025 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523525; cv=none; b=m7O7I1W3uhE8mdc37CeN4K/lAMoRrlp/JPnqqdzWBStlntw3fXqAhUcstOhtcJ3y+GELstehpF488agAbE+qcrT2+IZG/moWgGcd/9Kr4svbhygeHmm1apfzS5a0NBR80e9UUMDOrQMdpxIQfqwzIrG0rAFQIVNfZxVbR4Cfr9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523525; c=relaxed/simple;
	bh=AKRVTpEaCryjzqVobxcXLuc2KAuU8jHd/1sf3EF0MtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U67HI0ZqVectjgWhb17GMolH/cgHpdSzE4vYs/L8wBmHkNnGT/3zRpZjaDRjlUwtNUAowUMq2MbP/voJzrAff8f19GVuenKlWMPq4RJeQpFkWp0KxTnn8N2wIbVaqYcPxKn18M+M/YrIjQm7Jwy8g8IwuAD3wz96K9a6GZRXLuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hy9oruxp; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 15 Oct 2025 18:18:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760523519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=AKRVTpEaCryjzqVobxcXLuc2KAuU8jHd/1sf3EF0MtU=;
	b=hy9oruxpwDLVAMbDF7laAlXetP/79cocsl0OI1oTfZw+FeE2dEC1gzhmb/KcwAYsAfnDsF
	RQL8IOe1El6r764tacnCkWUxTTr4dE6uABsEEYedPSVBIeC5bRECwTlXMrk6JtJTRxURph
	Is1iz0mq+9EAhyWJyLuyK8zQjbvf6NU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: GangYan <gang.yan@linux.dev>
To: David Disseldorp <ddiss@suse.de>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gen_initramfs.sh: add the positive check for timestamp
Message-ID: <aO907xsN6VV5IxM7@yangang-ThinkPad-T14-Gen-1>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

> Hi,

> On Wed, 15 Oct 2025 10:18:31 +0800, Gang Yan wrote:

> The gen_initramfs.sh script has already checked that 'date' returned
> somthing, but it did not verify the content of the return. This patch
> adds a check to ensure the correctness of the timestamp obtained via the
> 'date -d'.

> This change doesn't seem unreasonable, but I think failing when an
> unsupported date is explicitly provided is an improvement over silent
> fallback to time() based initramfs mtimes.
> A change to the kbuild.rst KBUILD_BUILD_TIMESTAMP documentation would be
> worthwhile. Could you add a note regarding initramfs and pre-epoch times
> there?
Sure, I will send a new one. Would you mind add your "Suggested-by"
tag in the new patch?

Thanks,
Gang
> Thanks, David

