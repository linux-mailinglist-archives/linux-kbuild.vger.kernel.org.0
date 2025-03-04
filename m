Return-Path: <linux-kbuild+bounces-5953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38297A4DBF2
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 12:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034DF188DE5A
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 11:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5E61FECDC;
	Tue,  4 Mar 2025 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="TT4KhdQV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4641FECCC;
	Tue,  4 Mar 2025 11:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086589; cv=none; b=jSuDiFV/AWDAGMuyhpuhMuDJa37RS44az6qQXLhkOwOQDJHNrsaybwrrmUTAaOA2Rcxt5jUksVxXxHt/uYelEhh4UZel3mLTfCvZQLS1RRDfXaFojAhx1Q2emyqKYZrfVhmCl7xaiKD/RrfptQFwSRvyWyEuqr47nJ9KigYVHQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086589; c=relaxed/simple;
	bh=eTDdXRdWUrl2WnDoH0LuvBWrsYt8mWjcwSfM4twc78M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KGUFPudMytHsOl5y0QOBGOpj1XPyiB0FJpuvPbNFx4EFqXzTHUKhdrd/q5e59uzYlZeOsVZX5x+p1I7hHGYADywDdP7f8D+ludItMkFdAJyzKbCSChGSYyfdaQ7kH199V1NwA5KBqyxLX7neOUCoDVmS0Pl2B6K3AAGBx9RxTes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=TT4KhdQV; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1741086584; bh=q+Qf0imOm4losyj00ntII/wA3h21QUgSLnhXaMx09gE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TT4KhdQVKjFKdHN9QwzIhGsw0j9IcIWjsAiR1DKTslT+tv9odBgGs6rH4rHQ4Cr8J
	 l/NYI0DF72Trv6u8YOk19qkSwlw2BF1n3jgTB5ZTuyBJLQNKm1yu0eOkRHEUFKZSSX
	 KPCSRRllbG9W10aYfO+W0MXff/nTdGGZTTpUqUnc=
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Alice Ryhl <aliceryhl@google.com>,  Masahiro
 Yamada <masahiroy@kernel.org>,  Nathan Chancellor <nathan@kernel.org>,
  Nicolas Schier <nicolas@fjasle.eu>,  Luis Chamberlain
 <mcgrof@kernel.org>,  Trevor Gross <tmgross@umich.edu>,  Adam
 Bratschi-Kaye <ark.email@gmail.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kbuild@vger.kernel.org,  Petr Pavlu
 <petr.pavlu@suse.com>,  Sami Tolvanen <samitolvanen@google.com>,  Daniel
 Gomez <da.gomez@samsung.com>,  Simona Vetter <simona.vetter@ffwll.ch>,
  Greg KH <gregkh@linuxfoundation.org>,  Daniel Almeida
 <daniel.almeida@collabora.com>,  linux-modules@vger.kernel.org
Subject: Re: [PATCH v8 3/7] rust: str: implement `AsRef<BStr>` for `[u8]`
 and `BStr`
In-Reply-To: <20250227-module-params-v3-v8-3-ceeee85d9347@kernel.org> (Andreas
	Hindborg's message of "Thu, 27 Feb 2025 15:38:09 +0100")
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
	<20250227-module-params-v3-v8-3-ceeee85d9347@kernel.org>
Date: Tue, 04 Mar 2025 12:09:43 +0100
Message-ID: <m2ikopjbm0.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Implement `AsRef<BStr>` for `[u8]` and `BStr` so these can be used
> interchangeably for operations on `BStr`.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
>  rust/kernel/str.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index ba6b1a5c4f99..c6bd2c69543d 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -125,6 +125,18 @@ fn index(&self, index: Idx) -> &Self::Output {
>      }
>  }
>  
> +impl AsRef<BStr> for [u8] {
> +    fn as_ref(&self) -> &BStr {
> +        BStr::from_bytes(self)
> +    }
> +}
> +
> +impl AsRef<BStr> for BStr {
> +    fn as_ref(&self) -> &BStr {
> +        self
> +    }
> +}
> +
>  /// Creates a new [`BStr`] from a string literal.
>  ///
>  /// `b_str!` converts the supplied string literal to byte string, so non-ASCII

