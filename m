Return-Path: <linux-kbuild+bounces-8902-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A609AB8615C
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 18:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEB4F1C85270
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF80331A7EC;
	Thu, 18 Sep 2025 16:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="skAot3YM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C43191BC;
	Thu, 18 Sep 2025 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758213833; cv=none; b=gGWwoiPAw8wrJNdy/Vq+1boPTuPYn3RMviut2OhxFcfTTg1/2xwO+qmXmpWbTCdmirFFSl/5vIpWcpthU5sDxHQAAJmo8n/wUrqwgPlJZToFDnBtH/Fb+rZgFxL02Y39wS8GkTdoCxX8VqVFSEh+vR8m+vSSqt/TydurW8t9HH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758213833; c=relaxed/simple;
	bh=/xKQ/jon4u5G1U0AXf3Ei3GiDnF6IHalikvqBwlvbJs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hIuDwNBltVt6ytoy9NrLLi6qMA79uI5Kw/Avk+GmNXa9N14QzXBGJwYa8NwEUzH0r8w0IrhcCvO+2P+p+UBKk6avWHuF71Zf1vvTXH7dQF0BBVStVkFt39fkVnWgHbuZFBxKYQJii0XglITY0ev+j4MrOhBRsTto9NW6cmcsEEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=skAot3YM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A0E4E406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758213830; bh=okc8cPe2ZWbxfmOUNi5nG+59TfojPQ0/kotl+uzMIx4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=skAot3YMbvaiZa04MZfLYUQLW0PCAhwuSWuoXyO2sFGU7wgEptywDrQ7m4cCgVghX
	 5LR8C0EO7gbcAlQTNnGQZvtcZXrpZ77zp6qbCHzWknWW2Ky8MDtvyZdQJdp5S60SGs
	 3n/t4u+CrQ9yveIFet2KmuZ/bBfC72/5KtV+tlr0C9wPqbfZyEVezcdkt11oude8t0
	 sRJqeqdNVkmOTs8HD88fKmxpz+dzMDYMLBmYM/Mby9blshRxbXJaeW2qys7CTpQvmg
	 Gi8skg2ZVMFjqeimW2bhdjMeAOK16meWZgviUXyrxShz4UmN9dpILXsJ5K/SROYs66
	 2l4ZeDgZHnwkQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A0E4E406FA;
	Thu, 18 Sep 2025 16:43:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Marneni PoornaChandu <poornachandumarneni@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexandre.belloni@bootlin.com, corey@minyard.net,
 sakari.ailus@linux.intel.com, mchehab@kernel.org,
 linux-i3c@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, Marneni
 PoornaChandu <Poornachandumarneni@gmail.com>
Subject: Re: [PATCH] docs: driver-api: fix spelling of "buses".
In-Reply-To: <20250917220430.5815-1-Poornachandumarneni@gmail.com>
References: <20250917220430.5815-1-Poornachandumarneni@gmail.com>
Date: Thu, 18 Sep 2025 10:43:49 -0600
Message-ID: <87wm5v7ltm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marneni PoornaChandu <poornachandumarneni@gmail.com> writes:

> Replace incorrect plural form "busses" with "buses" in
> multiple documentation files under "Documentation/driver-api".
>
> Signed-off-by: Marneni PoornaChandu <Poornachandumarneni@gmail.com>
> ---
>  Documentation/driver-api/device-io.rst             | 4 ++--
>  Documentation/driver-api/driver-model/overview.rst | 2 +-
>  Documentation/driver-api/driver-model/platform.rst | 2 +-
>  Documentation/driver-api/eisa.rst                  | 6 +++---
>  Documentation/driver-api/i3c/protocol.rst          | 4 ++--
>  Documentation/driver-api/ipmi.rst                  | 4 ++--
>  Documentation/driver-api/media/tx-rx.rst           | 4 ++--
>  Documentation/driver-api/nvdimm/nvdimm.rst         | 2 +-
>  Documentation/driver-api/pm/devices.rst            | 4 ++--
>  Documentation/driver-api/scsi.rst                  | 4 ++--
>  Documentation/driver-api/spi.rst                   | 2 +-
>  Documentation/driver-api/usb/hotplug.rst           | 2 +-
>  Documentation/driver-api/usb/usb.rst               | 4 ++--
>  13 files changed, 22 insertions(+), 22 deletions(-)

"Busses" is considered to be a legitimate spelling as well.  I have gone
ahead and applied this in the hope that it will reduce the temptation
for others to "fix" it, but this kind of change in general is a sort of
churn that does not really help the kernel project.  Thanks for working
to improve our documentation, but I do hope that you will find more
useful improvements going forward.

Thanks,

jon

