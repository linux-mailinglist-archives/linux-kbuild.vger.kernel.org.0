Return-Path: <linux-kbuild+bounces-4846-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799A9D845E
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 12:25:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF834284B5E
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 11:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E77E1991CD;
	Mon, 25 Nov 2024 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="ibq9vWSI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1787198A32;
	Mon, 25 Nov 2024 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732533944; cv=none; b=aMhw65XTAQ1LumGfCB7qVtoo44p3y3Jj9aCNA3SYhrPnwzHPCB9lrGueftWxZDGfzuUlfa1f7nctjp8ev363JEbCdxu7Of5Dp2ohV6AqQJjNDZUg+OdhDCw/cMVfzXuC9ANZu5jVOR3WHG0yO8DfW4igbQ3kY/IVK/M3k+l3ijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732533944; c=relaxed/simple;
	bh=5iMQqINixsurBU8fcFSasigeM1BFuQKrZ7zJw0q7rxU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hCDCJcTkd86DNN4QV9xM3k2dvGOz5DsNXbbJRoOWfbhoBTfFylVEXP05gV+9dwXDVFNiaYIxfP7PQ4eryEP0Ze84Exg/TlI3lP2rWgUwv3xGAW8WRXX+DHx2ewFprLd+6kbU1P3seF61KLD+aFDr3MEGl5o3X3/dgXw8Ead4pkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=ibq9vWSI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732533935;
	bh=GEwWZpkSTwqkvb7sbAxuL/F3C5T2lgJTaLKpD4NJ67s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ibq9vWSIkcvH3dVNxoDUbmcfbmw9gOTfu7vLdfVcW9ngaj4FXizoh3F73wHquZUQW
	 A6GAdiQISb3502sWECC/O/vKtjQ+j5iAQzNAKpI/OSqzBpKu+2kOoZ85QH9j8tKiXG
	 j0Gt+bvBJILy+G0DpQyq9xbaSD/N71qWWtuvFk0OBielTvVxvNYNblTQ/7HdhzSIp4
	 okDL5RYCU2YpNO5qqFwTmg/FdB2tDeTlh7uZdcvta0HazRG1uNpWpYo26FBtxhncq1
	 NQ64prFmd/qc4XwOayVfEdQ8CjKjOoI7PLm/e4UER4Cx6Q5kQCBY3+BnF2vMwZ9dve
	 3hDyEZuMmKd6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xxk0B3vybz4xcr;
	Mon, 25 Nov 2024 22:25:30 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Maurer <mmaurer@google.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
 <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, Daniel
 Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Jonathan Corbet
 <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Matthew Maurer
 <mmaurer@google.com>
Subject: Re: [PATCH v10 1/5] modules: Support extended MODVERSIONS info
In-Reply-To: <20241123-extended-modversions-v10-1-0fa754ffdee3@google.com>
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
 <20241123-extended-modversions-v10-1-0fa754ffdee3@google.com>
Date: Mon, 25 Nov 2024 22:25:31 +1100
Message-ID: <87mshntv10.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Maurer <mmaurer@google.com> writes:
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
>
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format. Other architectures do not appear to
> have architecture-specific usage of this information.
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
>  kernel/module/internal.h        | 11 +++++
>  kernel/module/main.c            | 92 +++++++++++++++++++++++++++++++++++++----
>  kernel/module/version.c         | 45 ++++++++++++++++++++
>  4 files changed, 162 insertions(+), 10 deletions(-)

I already acked version 8, which AFAICS is identical to this version
(for this patch at least).

Not sure if you dropped my ack on purpose, but here have another one :)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

