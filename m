Return-Path: <linux-kbuild+bounces-8457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E35CB26587
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 14:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AFECA21E67
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 12:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CDE2FC89B;
	Thu, 14 Aug 2025 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akItc4ij"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386DF25C706;
	Thu, 14 Aug 2025 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175145; cv=none; b=InuDgcACN0tzWpZtQa60p2Ei/ItVtSx2TuFmjd3BVNwyupgD8tqDoAyDSugyowDF281cBIVvqCrzuFxAazRbehMdbAgllDFppG2RbxnHFRODXtUEY7SpM6FTlTyeH9J4owrq8/y36SByxPQPtRkC4U5UzPo1Rbs1/uJrni24zH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175145; c=relaxed/simple;
	bh=ySXXtCWInS8Dd3/1b6Y0gmPDaMaREnzvgVBoXZIcJWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7Jll0wCVd1d1siJOWGDOWGBvIQ3ZZDTxpxxCGduuwO9clUhfaT1+X1DrxBJvx2CBiDMjve9xn0hYLzq30klYhXMczRqMuLVrUU4iFlOPyg9Z7sqLmqO/OUQNo+66cphLJ+WsszwVoZAoKF1Jf7VbiMXINn/O+zs3mHbXBsxZY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akItc4ij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52747C4CEED;
	Thu, 14 Aug 2025 12:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755175144;
	bh=ySXXtCWInS8Dd3/1b6Y0gmPDaMaREnzvgVBoXZIcJWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=akItc4ijtv7KbvHP7dipeKN2FgLp05rwNWt1rXWKAFydgSzO7hW1J8nrFuZDREgId
	 704i5w0FfP2rUOtUHRI6CaAdXZF77FtLgVA3gOELEv2z+T6+q3u/q9MfRzo6ERStq4
	 RqLtFsGBChRZwSGqPM9r+GZ/Ti71KG63W3C6o/cVjO81pu4CV1wI8ftQTfBdOOMNPo
	 eqf150V7ELf8Qvq+UudbpXy71JNKcsT4vDBbAninETTOo5GzblNmp7rDszN0HmBEwg
	 3G5gdF5rRAqH2JMEkSk2S06Z/35XNtNe6k9LXvWT7U7KKLMfvRhPgvcovYfr3M3A4h
	 xsoZum7n9VV5Q==
Date: Thu, 14 Aug 2025 14:10:13 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
Message-ID: <aJ3SJWu8-o2S-KU5@levanger>
References: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
 <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>

On Thu, Aug 14, 2025 at 12:14:46PM +0200, Thomas Weiﬂschuh wrote:
> The hostprog compilers and linkers do not share the regular compiler flags,
> so they are not affected by CONFIG_WERROR or W=e. As hostprogs are used
> during the bootstrap of the build, they can't depend on kconfig options.
> 
> Enable -Werror unconditionally.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> ---
> For testing in -next, as discussed in
> https://lore.kernel.org/lkml/20250812-kbuild-werror-v1-2-36c9ff653700@linutronix.de/

yeah, I am not sure if this is a good change, but I am ok with testing
it in next, as Nathan suggested.

For the rest of the series:

Reviewed-by: Nicolas Schier <nsc@kernel.org>

Thanks.

> ---
>  scripts/Makefile.extrawarn | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 96ff3f5582d651f0016c8ccd49d46022cc6fe070..1434cb6208cb82f20aeb29cc8c059220d1a1f6d2 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -224,3 +224,8 @@ KBUILD_USERLDFLAGS	+= -Wl,--fatal-warnings
>  KBUILD_RUSTFLAGS	+= -Dwarnings
>  
>  endif
> +
> +# Hostprog flags are used during build bootstrapping and can not rely on CONFIG_ symbols.
> +KBUILD_HOSTCFLAGS	+= -Werror
> +KBUILD_HOSTLDFLAGS	+= -Wl,--fatal-warnings
> +KBUILD_HOSTRUSTFLAGS	+= -Dwarnings
> 
> -- 
> 2.50.1
> 

