Return-Path: <linux-kbuild+bounces-3154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8951295BC30
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 18:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FF83B285F7
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 16:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899971CDFAE;
	Thu, 22 Aug 2024 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Mw8nd1UT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1B1CDA24;
	Thu, 22 Aug 2024 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724345022; cv=none; b=m4W+w5oDYVU2bvaD96VcD8Q53e7CYMd0TFwC1DTxxEMz3VihFfPIAiwjA+pAwwAELBNCSNh/K0gapNNo+XBrLEEtVLKHiBnWcvhA0M0veEOibPyjtBVxM3yE7TcxLhpUo8HOhPjqY6/ldeJY+w7/zO4sMnoQQbO+lc5+IVvQvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724345022; c=relaxed/simple;
	bh=1oe8woxh7Z2Ip7tlYozIn91luOTHUGO0MOgxmtdZXJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oxV0A6ycIs2mDWfna28bL1szW1NkkbE/aoz4L07W8xepr8zX0/X0UI4CWIkj2EG3pEPdwCI1rGG/bTGi4/DBX08p77pVgNIKgy8GUPkaHfPuKoiLof4gr+8OWvbwMbDAVH/guB1hEm57ijxO9wogj+aiKvCS6FCPRE4HPIM2hfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Mw8nd1UT; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BC5A941A8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1724345017; bh=57CDXJgPfuH1qnC0kbJAYgQ52BOTKVedbtmqw7a8X9E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mw8nd1UT6+0y3uy5KqY4WcFR9NpMKogJnJbp6ms1UWQtliNHEK42msD48VdfLHDwM
	 0NYzz7J0gTInDjqfWK7lmIiOLdJhFXKtihL8HbaaqgNAswQTLm4iKDhhCF79xzkE6L
	 ssy5iLgpVRFISae5+Z2I1QG+3h8hytI7aMzuyX8JWAbmZ2IJAAcfM2fZkR5/x5WgVK
	 X+Cgi81Qy9A38HJjsqSQdcJ7gEcmTM3keCC/QQf62mJLJ6pSMs420FS7dIU3z7NBUd
	 WWHqzcHJMsN7TN41nErPnnizeoUiev4WD7kp9aMJejM1WEw9Web/BidnAQ1FCX63Ua
	 7RFhG1WywwddQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BC5A941A8A;
	Thu, 22 Aug 2024 16:43:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary
 Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa
 <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau
 <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, Sami
 Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
Date: Thu, 22 Aug 2024 10:43:36 -0600
Message-ID: <874j7ccxtz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sami Tolvanen <samitolvanen@google.com> writes:

> The first 16 patches of this series add a small tool for computing
> symbol versions from DWARF, called gendwarfksyms. When passed a
> list of exported symbols and an object file, the tool generates
> an expanded type string for each symbol, and computes symbol CRCs
> similarly to genksyms.

Potentially silly question but: how similarly?  Specifically, do the two
tools generate the same CRCs for the same symbols?  It seems that might
be important for users transitioning to the new DWARF world order.

Thanks,

jon

