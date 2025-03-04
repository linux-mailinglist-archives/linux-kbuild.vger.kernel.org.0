Return-Path: <linux-kbuild+bounces-5952-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B67A4DBD7
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 12:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00AAF162AA6
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Mar 2025 11:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8719E1FECAD;
	Tue,  4 Mar 2025 11:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="GBFpSHDl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46901FCF60;
	Tue,  4 Mar 2025 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086463; cv=none; b=d/eKV7dy4FFN6FGskje4fAxy1U+ABbn5B9/aIgl0T7ybkBWQlPHO+JCkBtjDGOBnNePts+n2D4WtSWgURmbEYUKeuwJG2IK0tGB2c73CwSNOLqZw5L2z+TA8X9HY03MLXH0fgaqbnbLxV4fX1jWrwZ/HfDs5V8BqI9raJnJ68b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086463; c=relaxed/simple;
	bh=Du7MZsOIDKOjbNlXu3JaKpDxFRTp/orNDFob1H41r7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TdUA6hjhbW692/9mXhqDJvmR8E42oIC5Qe4sRthf+uC3hb0bQkxfl2hGByDtRJ00oKQAU3O3eV9n+VR9nwOQzP0Xz1rC9WMPMHiTfvCfTHetilqSLVErOUEajaVqUA0PU6gvDc7Dv9IBUNq9B/tDTTLqmrgOczeLT+Zl+OP513Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=GBFpSHDl; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1741086451; bh=oONgIxzK+8/o9sj2P7jZLoDOLJDTkcQZb3hUnWfl6o0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GBFpSHDlAydUtZbG7niyZVHYfKk1RE4ABbCLC8z6ePratb2mJcWn3n9TILykbIc/K
	 FU1XBlHDiuNqmkebnV4r8iZiR1ca6Exl3D5emEVuv48LGV/B1M+sqj4aJPwBf/DKbs
	 GcnfjBssl2cvihZLjtj2NULV6LoITCCOt9POX59k=
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
Subject: Re: [PATCH v8 1/7] rust: str: implement `PartialEq` for `BStr`
In-Reply-To: <20250227-module-params-v3-v8-1-ceeee85d9347@kernel.org> (Andreas
	Hindborg's message of "Thu, 27 Feb 2025 15:38:07 +0100")
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
	<20250227-module-params-v3-v8-1-ceeee85d9347@kernel.org>
Date: Tue, 04 Mar 2025 12:07:29 +0100
Message-ID: <m2o6yhjbpq.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> Implement `PartialEq` for `BStr` by comparing underlying byte slices.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
>  rust/kernel/str.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 28e2201604d6..002dcddf7c76 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -108,6 +108,12 @@ fn deref(&self) -> &Self::Target {
>      }
>  }
>  
> +impl PartialEq for BStr {
> +    fn eq(&self, other: &Self) -> bool {
> +        self.deref().eq(other.deref())
> +    }
> +}
> +
>  /// Creates a new [`BStr`] from a string literal.
>  ///
>  /// `b_str!` converts the supplied string literal to byte string, so non-ASCII

