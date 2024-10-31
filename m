Return-Path: <linux-kbuild+bounces-4443-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6229B79CE
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 12:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68D331C2102E
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 11:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FCE19AD8D;
	Thu, 31 Oct 2024 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9Kj6Qg/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5719ABB4;
	Thu, 31 Oct 2024 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730374654; cv=none; b=Go+WT/30nLtvctXH6gW5aFIi4Z8MWCL50YXxFL/c+k/7cS7RilFsaWTjbDxQwlYydMBIxiNJTm15bvApN1zHAwEOOvkve9z8mfdbLaRaw4Cqq8OeU9fJEzFiIsKVj8+O5EnVWDwuW11CPVBpT065VRax5LI8XCIq7qbZ2cAZ8fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730374654; c=relaxed/simple;
	bh=HOxK+wU9eU048sXFB2KXeqhmmHOku3kZEDARKwtJaRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0NnyhilxYJ4a84D8HST8n+a40NocTnlm0maA3OroN/O5gOYIEATIX26qCx8PhXJRiq3IznaR2lpwRUPlMdUE6/RY7dX7FQ09Fca0+mqHwr3LCE9jOrc3RP6g8/1Hvh5R2uhihATr6j/k6hNZPjMo6Bri5h/6S8j9qSUxe9NiEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9Kj6Qg/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17210C4CEFD;
	Thu, 31 Oct 2024 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730374653;
	bh=HOxK+wU9eU048sXFB2KXeqhmmHOku3kZEDARKwtJaRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9Kj6Qg/BXn6D6IPkaWUMa+vq7gBra4scklcDDT+p2gfmB/VQMGx3bOdKA78aOZCx
	 DpbXWWBb1246u7S4JbuMLGXzfDd1uLbDth9aAMVMq+rce8Wx5+ayP4g44HHejtJsDn
	 1ce3k7ILlPN4dEYm9tKEZouqLxNZijqqEPiHC6SQckAL+/Ep8wvgjBbzoqM1qcNVdm
	 P7WFB7HBgMoxeipm2LmZkdDnJRHuWZAHajaIkKvjjwD7C2mySauNlTKTd8/tXdopQd
	 20VEqB6CFuZiWOTs6CoWBS+ZvX/e4yWfMcgJcyfLUWG/s3V0wWg6Q3YFMpxm3UBIdp
	 ikZX6VRNMZPOA==
Date: Thu, 31 Oct 2024 04:37:31 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
Message-ID: <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>

On Wed, Oct 30, 2024 at 11:05:03PM +0000, Matthew Maurer wrote:
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index e6b2427e5c190aacf7b9c5c1bb57fca39d311564..a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -208,6 +208,16 @@ config ASM_MODVERSIONS
>  	  assembly. This can be enabled only when the target architecture
>  	  supports it.
>  
> +config EXTENDED_MODVERSIONS
> +	bool "Extended Module Versioning Support"
> +	depends on MODVERSIONS
> +	help
> +	  This enables extended MODVERSIONs support, allowing long symbol
> +	  names to be versioned.
> +
> +	  The most likely reason you would enable this is to enable Rust
> +	  support. If unsure, say N.
> +

The question is, if only extended moversions are used, what new tooling
requirements are there? Can you test using only extended modversions?

  Luis

