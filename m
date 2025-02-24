Return-Path: <linux-kbuild+bounces-5876-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451CA4220B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 14:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7982D175F81
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 13:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072C724EF6C;
	Mon, 24 Feb 2025 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="EYmG3eqn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70A03FBB3;
	Mon, 24 Feb 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740405064; cv=none; b=tAsWAFUqAMgSIgeCSfbzrGigXb5UY5MwZ/yw9uvjYgHcwSyHhA1HdB85vgntiq11w5rlkf6X4C643IbtOtWlevdZ3275CSMAQyoVqHoPFoCp0iCOLv0PVpvkK8kdsB5vyBsfoMk7OX4zOZO/uHKgpYHmub3pR7t2vtgIDQ6DRTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740405064; c=relaxed/simple;
	bh=9RDuIIDDoRX3iUwz/B6eYJZ3G8+IPjNTeRWnefHxkUw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Oz6V04Yahp+R9+1TSZj+E2yabxfmlpxJnk1hCh53Gz6PEcskySrY7Uve84Dq0AEjopfbJYantDAU62dW9q82+5+9JQW3U/LNQzs4OolM502HpRuKi+mL4pwuX2m0t4HQ9oH6TG+isTTGq07vC2ADQ3nurIjwtLemPZe1h1TAFmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=EYmG3eqn; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1740405052; bh=GoyOgU4F8MJF8xBQLwzVC2scpgFAnMUGWJKmA0XPqNw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EYmG3eqnM4MCQ0hLO2jgmWLWjqkqd00n6N6mN7raLyGsb/UFfbcyOO5mMQ/PIPf+z
	 l/XQMWRzSY1FO4WSPtodgX95I3F4KIonw8h3eM7Nb7i3CaVAOXrc4qSYyCIYKgyLRs
	 GFqMGgPIBwl5fdpk+qDGDgi8qJsISOryviETc/4I=
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Alice Ryhl <aliceryhl@google.com>,  Trevor
 Gross <tmgross@umich.edu>,  Masahiro Yamada <masahiroy@kernel.org>,
  Nathan Chancellor <nathan@kernel.org>,  Nicolas Schier
 <nicolas@fjasle.eu>,  Luis Chamberlain <mcgrof@kernel.org>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Adam
 Bratschi-Kaye <ark.email@gmail.com>,  linux-kbuild@vger.kernel.org,  Petr
 Pavlu <petr.pavlu@suse.com>,  Sami Tolvanen <samitolvanen@google.com>,
  Daniel Gomez <da.gomez@samsung.com>,  Simona Vetter
 <simona.vetter@ffwll.ch>,  Greg KH <gregkh@linuxfoundation.org>,
  linux-modules@vger.kernel.org
Subject: Re: [PATCH v7 2/6] rust: str: implement `Index` for `BStr`
In-Reply-To: <20250218-module-params-v3-v7-2-5e1afabcac1b@kernel.org> (Andreas
	Hindborg's message of "Tue, 18 Feb 2025 14:00:44 +0100")
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
	<20250218-module-params-v3-v7-2-5e1afabcac1b@kernel.org>
Date: Mon, 24 Feb 2025 14:50:51 +0100
Message-ID: <87y0xvpi2s.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> The `Index` implementation on `BStr` was lost when we switched `BStr` from
> a type alias of `[u8]` to a newtype. This patch adds back `Index` by
> implementing `Index` for `BStr` when `Index` would be implemented for
> `[u8]`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
>  rust/kernel/str.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 002dcddf7c768..ba6b1a5c4f99d 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
>      }
>  }
>  
> +impl<Idx> Index<Idx> for BStr
> +where
> +    [u8]: Index<Idx, Output = [u8]>,
> +{
> +    type Output = Self;
> +
> +    fn index(&self, index: Idx) -> &Self::Output {
> +        BStr::from_bytes(&self.0[index])
> +    }
> +}
> +
>  /// Creates a new [`BStr`] from a string literal.
>  ///
>  /// `b_str!` converts the supplied string literal to byte string, so non-ASCII

