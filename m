Return-Path: <linux-kbuild+bounces-6711-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C16A95460
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 18:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3228B188D913
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 16:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517C01E7C02;
	Mon, 21 Apr 2025 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="aSwWbdmJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A009C1EB19B;
	Mon, 21 Apr 2025 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253340; cv=none; b=Y50Pftm1J0X1sIi5/4VFKvkJrvLdTCbyGKexQHuqGZ5Ld7vHDBYSK3yf3VIcXmxNjY8ptAom4U6UWZOtrT+T5PG058QerNsH2cWH8mOzcorDjkUJ6oKf2rEImc1KSY96HUZzv+gAbvib/IjWwvffXkfHX2PplwNSr/n+ntBk0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253340; c=relaxed/simple;
	bh=cVuVFgejEbyTS0iQROEmWdR2zVlqJcSF1BQuDGnHbi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fs7NpiS9mYNeeXnpY5prtbOlhSI7qSoARQq59Ap5H0JVxb56mZEsrwrHpLuAZ5i5dQRM6t43LE0PFGFAapGaLipSEY8ocpdae5q9f6jKPOYZo4YpwW0FmArbuTapSm6qInqz6LbH7Z8/Y18A6dtxQO1aAi8yHW90Ua9v0ux2R9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=aSwWbdmJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1DBF741060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745253330; bh=gxGq9sDQzTilFhNI+sgogQzrTLgAysNYCMUBWj3Hgkk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aSwWbdmJJYHlULeQRqmIZiBkTXpcuPN9ZRV82SfV4CHb3MYZCZjYv+zeQz79Sr2GS
	 9KknI8nxQs92hOToWkh4alhfHM9NZdOcXHTrfqxSnxe1M0+elhQktvbrW3mwuCmB24
	 cO28qpPPqc0wEZM8RUenc5GRruiIiiTUXLTHUW7hjkOBHZwTtx/qVdXMY82k+kzvBr
	 p33+deEZilo2NWQF9jXjz3aEoCdtZfho6XG//atJ+fWewga0vH3dFzkIKwXpmVSFCL
	 oCeEzKDxbZ5vSChkApWLnHdkxmx5ad8KZZLLhVHLCoB+3z/k/MXsaHIZlXKxGWB/y6
	 pFG8rChiQj9AQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1DBF741060;
	Mon, 21 Apr 2025 16:35:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@intel.com>, David Airlie <airlied@gmail.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
In-Reply-To: <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
Date: Mon, 21 Apr 2025 10:35:29 -0600
Message-ID: <87bjspzd4e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

> On Wed, Apr 16, 2025 at 03:51:03PM +0800, Mauro Carvalho Chehab wrote:
>> 
>> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
>> when W=1. Due to Python's normal behavior, its JIT compiler will create
>> a bytecode and store it under scripts/lib/*/__pycache__. 
>> 
>> As one may be using O= and even having the sources on a read-only mount
>> point, disable its creation during build time.
>
> Would it be possible to properly support O= and create pyc / pycache
> inside the object/output dir?

I have to confess, I've been wondering if we should be treating the .pyc
files like we treat .o files or other intermediate products.  Rather
than trying to avoid their creation entirely, perhaps we should just be
sure they end up in the right place and are properly cleaned up...?

To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
should do the trick?

Thanks,

jon

