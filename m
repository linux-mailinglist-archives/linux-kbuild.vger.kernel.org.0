Return-Path: <linux-kbuild+bounces-4435-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA39B71CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 02:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11D3F1F22F07
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 01:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984B34D8CF;
	Thu, 31 Oct 2024 01:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="C0Y7jtBx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50AB2F855;
	Thu, 31 Oct 2024 01:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730337768; cv=none; b=FrKaD3X++CK3/6sEXP+yuFeHP+mZbb+6W9rxnr04Utu1VMH5gWCc3BvtcfApaCDS8rGNCjI0S1FeUeffja1k1uIeEVYcw6q1YqWNl4cLxmnq2PI+SXjz0o4+ggfGzvBO47N6ZpIKalqbq2fbmVatD8B7PchP/r17UQaqGmpn2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730337768; c=relaxed/simple;
	bh=KLOS8u+PMDA0T4vM15ojk9b8umCGFoUlPXxkH5YcKe4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N3yNbXAR5riO4FHfd5LPyA+Eg4e4NPmJIAEWu8t/nAUsxmekyeBAzS8hY5JYh5+Wt3CapzlqKcy7zIj6FTbHZaswz22ZVBh8RvOpZkoLJQoOhZEQJic+JTITa8A2XSPiv0qPeiQ1y7iyMTns415Fb19c+LO3EqEs/vM50kiYPGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=C0Y7jtBx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730337760;
	bh=QjW8Kw5UFmafLnSTxLCguKpJPtpBFspJBqxqy1O825M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C0Y7jtBxM2HrGF3Fgeq4yau1+afHnWMC/ktoKCXAG3lCR82udfE4mVv2/ZXCIQfsx
	 U5qU7v343LVxSw4qCipn8OU8QAwyBRiCFG9zVjXR76F4UU/FF8w6G2TCzCT87OQitD
	 255pfCHLZiQHs/HThwTzK+Uk6bzjX6N7NKW0SnDkEionTYsikO76raEoo7MOZ0me97
	 M4xhiSLeJ8mtmtAFlOkqnii4KTVenm/FixC4kKuxQV5hv5L/M5oXaayzyX8gwfPSNx
	 wbbYqNvkt9wOBPBmqHTppWKssdZWmoZ17CnWM3SrR6eWPh9+OxEMDOgPnx/E+3vPOx
	 MD5ALWY2q3Bng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xf5p503Tfz4xGC;
	Thu, 31 Oct 2024 12:22:36 +1100 (AEDT)
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
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
In-Reply-To: <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
Date: Thu, 31 Oct 2024 12:22:36 +1100
Message-ID: <874j4tcbhf.fsf@mpe.ellerman.id.au>
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
  
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

