Return-Path: <linux-kbuild+bounces-6429-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F76A7BF4A
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 16:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6857F3B767D
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 14:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC52E1EF088;
	Fri,  4 Apr 2025 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mklutUMH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101AE56F;
	Fri,  4 Apr 2025 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777104; cv=none; b=oj3K2wqUmhoDZiJF4utaZ+KR/AsTFfLmyhrckue/KRZwaQGxMBQhxp16Gb08ZabbcGMpCVWgbWzN1dvG1WKra2yjLd53RSnbgYfQOkQRGScgMmOIucjxqZXnZfVnfEBsHKXtdAAXGn43J/AbEcJxZ/mJ/+nFWGm14fNWecgjkNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777104; c=relaxed/simple;
	bh=ioJrvkJAeM+YcI+CZl+87dhg4gg66R8gypCOb6/tPOQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o7SKombHL488Xeu/h6AiQ7xN+bZFjjcRO5NG/yVQ2vdEupeufoE7kW/wosWB8dI2XhZPoyUyZxeIEG7vTXTQfi11GepT8RkE2hdmiD/qnBj6qoqpyAvE/4d5gakgnPnyAJ4Pl96VRXgZEy93F00iiXARIOw2oI3u6BLf4xIURoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mklutUMH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EA98B40407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1743777096; bh=eWI/SZFTOXRzer/u/6kKmYd237l3OYB93Txyi2bbAmM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mklutUMHLFrRpR336yCPOhw6s09Lh0jHuqtnbyRDGaNlZYOEZuOGmLj3W2qT4+Dv+
	 BSAFmtDijAzlrDV26zJwECKMzkq4u2/+9+JbSq8XplQHaDGY3oqzgpzI/JJHhvU4X6
	 /CmSU7hOwxEh+3iukbzqfLUx9yYG7zj3qS8Km7007sDBTQbeGNGynImcmmXx/Fcg6F
	 95J27+Ay+ukTgw3SwwAoAW7q7XMNc6AU17hFJYNu1oIGyMF2QHsMT7xfFtYJqDFEmK
	 4Xr74DszCy5uV0cTcY+d7PnU6psomknAzFTKRO/glF9ciGn2GQG9f7+9cCOGr4WRRm
	 Rtoe8e8YCsmrg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EA98B40407;
	Fri,  4 Apr 2025 14:31:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>, =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?=
 <nfraprado@collabora.com>
Subject: Re: [PATCH RFC 0/2] Add Kconfig pages and cross-references to
 Documentation
In-Reply-To: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
References: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
Date: Fri, 04 Apr 2025 08:31:35 -0600
Message-ID: <8734eogfqw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> writes:

> This series adds Kconfig pages (patch 1) to the Documentation, and
> automarkups CONFIG_* text as cross-references to those pages (patch 2).
>
> There is a huge change in build time with this series, so we'd either
> have to so some optimization and/or put this behind a flag in make so it
> is only generated when desired (for instance for the online
> documentation):
>
>   (On an XPS 13 9300)
>=20=20=20
>   Before:
>=20=20=20
>   real	6m43.576s
>   user	23m32.611s
>   sys	1m48.220s
>=20=20=20
>   After:
>=20=20=20
>   real	11m56.845s
>   user	47m40.528s
>   sys	2m27.382s
>
> There are also some issues that were solved in ad-hoc ways (eg the
> sphinx warnings due to repeated Kconfigs, by embedding the list of
> repeated configs in the script). Hence the RFC.

I'm still digging out from LSFMM, so have only glanced at this ... I can
see the appeal of doing this, but nearly doubling the docs build time
really isn't going to fly.  Have you looked to see what is taking all of
that time?  The idea that it takes as long to process KConfig entries as
it does to build the entire rest of the docs seems ... a bit wrong.

I wonder what it would take to create a Sphinx extension that would
simply walk the source tree and slurp up the KConfig entries directly?
That would be nicer than adding a separate script in any case.

I'll try to look closer, but I'll remain a bit distracted for a little
while yet.

Thanks,

jon

