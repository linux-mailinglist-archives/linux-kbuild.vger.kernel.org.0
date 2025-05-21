Return-Path: <linux-kbuild+bounces-7202-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C879ABF15D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 12:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E4791897140
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 10:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C45253942;
	Wed, 21 May 2025 10:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KLbvwtRd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708FC23D285;
	Wed, 21 May 2025 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822781; cv=none; b=jdBZvBQDlAacb8Rm9B6PfCTPUC5On8PYH4DwQZt29zgkmRF8prGFyTFgRisrpgcDwluF/X9Kbewl4qtCGkajpDZCm6rYafbXIM6heU7TcNbQBw/LbocMPbsMrRR2YyVvkTmFB001dxyJLKk9JUCZwHk+6OfudKvu7nHHZk8SuOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822781; c=relaxed/simple;
	bh=+iFhBXf0vbCbL+XqEy89NDjV9grPFRpL54vjJA7X/Ew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pC5ztnyrxCe3Fn8oxVfRF41AZy0xs9XWzg2zsiEfs7zqQ7CFokcB4mwZn5jke3EZ//LwbPD4Q0cxYRHafT/njOlwaX5sKbHMT60cxozr/SsqG0ai5FLEsC/fAsbVNAiiAEpPj7xFZk+KjNIpCmLP6Y9M+5WdCThFYfOuLW8CFDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KLbvwtRd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E368A41A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747822773; bh=4Rpc61MxhtsPFZeepnU8k+b9p0Cplh44VpM/YqieauU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KLbvwtRd8red76Ln7sMFAksJUB3m0CxUDf2hBjNbowmRIxxxj6y/ENGapzU+nKtfy
	 VX1FErAjt/DFgbda6zW3WDqIuhIilvsO9ZLg2rR9QuAuckRq7NddDhNhDWfZr4j5WH
	 WYOzfPL0fkcV7QRy++XN01D45b1TcT5Fs3ZMfBV3BtdiGtwbDxFrUGMSPpvWaZYJuv
	 fYIffx4yAh06T9lOZGBfHbI8HGdNphT/pXBSeOFl0bAPbCHrbLpbD9b3TtZl7PFXst
	 QVDFwqlNNV9tL7Y5mp5lS569TEVXV4z4rDrQIuiw8mRFoy3/+NaF7uDXLXqt9KRAIL
	 Fx/mcnGBdU2Og==
Received: from localhost (unknown [93.187.88.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E368A41A9E;
	Wed, 21 May 2025 10:19:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>, linux-doc@vger.kernel.org, Masahiro Yamada
 <mchehab+huawei@kernel.org>, Nathan Chancellor
 <mchehab+huawei@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Some kernel-doc fixes
In-Reply-To: <cover.1747817887.git.mchehab+huawei@kernel.org>
References: <cover.1747817887.git.mchehab+huawei@kernel.org>
Date: Wed, 21 May 2025 04:19:29 -0600
Message-ID: <875xhugtam.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> That's the third version of the kernel-doc fixup patch series.
>
> It address the root cause why Sphinx logger was not working: there
> was a call there for logger.verbose(). According with:
>
> 	https://www.sphinx-doc.org/en/master/extdev/logging.html
>
> This is a valid call, but it doesn't verbose messages. Instead, it is
> crashing with modern Sphinx versions, causing the log to not work.
>
> I got rid of it, replacing by logger.info().  I took the time to also
> address an issue pointed by Andy: not having the same log message
> placed everywhere. With such change, we can keep using Sphinx
> logger (which produces colored messages) inside kernel-doc
> classes.
>
> With that, we have:
>
> Patch 1:	makes Lore and kernel-doc ML receive patches related
> 	to kernel-doc.py and get_abi.py.
> Patch 2:	cleanup try/except logic and get rid of logger.verbose();
> Patch 3:	fix a KeyError when trying to acess data from non-existing files;

OK, I've applied the series, thanks.

Sorry for my relative absence through all of this - I've been out of the
country and poorly connected for the last three weeks; done with that
now.

Thanks,

jon

