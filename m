Return-Path: <linux-kbuild+bounces-5852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0530AA3FA69
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 17:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04693425629
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 16:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7540521507D;
	Fri, 21 Feb 2025 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="d9RyPqF/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825D621506B;
	Fri, 21 Feb 2025 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153579; cv=pass; b=LAdzO4eOLuncSxhxALSsOErr0guUzz2S+aLK5Z7nqoCR9T5e+Mg/okWAdOoYpoGapFX6YEYgG5r+xDhxG3OydzHxXCqcMx4JsTWJUWi+jVix7T/t+u1C/O8gSaYev23ajYacVWAHwGYyTMfdIv31sHn8+//X1ttsV1yCn6ieYRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153579; c=relaxed/simple;
	bh=ntiVJXzkZTZjsdeI5IdrDhxqLX4AiOQr3+403vBJSnI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ilo86LQ1DuZi8BlFuHA2bZRmE4hPqzNNqxbpv+d8gBdxFFA5zO/YEkJmfOn6GuWcb0CS3qxlgP29Sf/X/59D177+iJABkYnV8454YIMXScX8vi0FeAHRHWgR6gJCng6jG5Qh0oHLCXe1hl2ua+XmLcYzYAkxcENsVdvsFUR+T5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=d9RyPqF/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740153544; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Nn1BpqQX78RRt0sY8e9CKmdBeBFf3st0Sbf+2kPjRqbrxIPZZN2Og7TO5iFdMxCWDmuYZFUWvX7d6BjFcUdIPEfeQBEs4f/5mUG3Z7zqVZvKs4mkNO04haCW7nPvbSvo673VZt3FmihGouWdFQxTPOzF10lAcDXcgdv0GMRr8J0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740153544; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VMzhihZ2XljnljV6PhP6eOJIJ/ST5xaErOjkBTRaQ9k=; 
	b=L2GAaaJpyc50eu/ChVdfRWf9bIfqr6PeJSyCONhDf+nq+nv/vjx6Zupx3Df3JfL0b0FEjQaijPZ/mGiGNmgDXR1oZpuf8bVUL763Jx3ECMkhWx/tizYDPj8lK04WT1N3hm7ozXrc8aMsmW9sVPuT86DwMa9yn0U1rgz21O6mki8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740153544;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=VMzhihZ2XljnljV6PhP6eOJIJ/ST5xaErOjkBTRaQ9k=;
	b=d9RyPqF/6qrMyi29DkZ44eIpR7Bn4PjpU1W3GdDNsdqFF7SJr04SmUmsa2hgz38z
	p/CnJVJ2mtVIY40upH2QaDkGqoviSCmklvJUvzAjldz/vwXGTVnmtHIZcFDIsYnIYr/
	ZMj3ECxbboHDXy7bcgpyhl1+HIUMdTy8M2jhbbTU=
Received: by mx.zohomail.com with SMTPS id 1740153542341460.47491147955066;
	Fri, 21 Feb 2025 07:59:02 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v7 2/6] rust: str: implement `Index` for `BStr`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250218-module-params-v3-v7-2-5e1afabcac1b@kernel.org>
Date: Fri, 21 Feb 2025 12:58:45 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Luis Chamberlain <mcgrof@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Adam Bratschi-Kaye <ark.email@gmail.com>,
 linux-kbuild@vger.kernel.org,
 Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>,
 linux-modules@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <56BF12A8-F632-428B-ACC2-0847F95CB8E9@collabora.com>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <20250218-module-params-v3-v7-2-5e1afabcac1b@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External



> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> The `Index` implementation on `BStr` was lost when we switched `BStr` =
from
> a type alias of `[u8]` to a newtype. This patch adds back `Index` by
> implementing `Index` for `BStr` when `Index` would be implemented for
> `[u8]`.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> rust/kernel/str.rs | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>=20
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 002dcddf7c768..ba6b1a5c4f99d 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
>     }
> }
>=20
> +impl<Idx> Index<Idx> for BStr
> +where
> +    [u8]: Index<Idx, Output =3D [u8]>,
> +{
> +    type Output =3D Self;
> +
> +    fn index(&self, index: Idx) -> &Self::Output {
> +        BStr::from_bytes(&self.0[index])
> +    }
> +}
> +
> /// Creates a new [`BStr`] from a string literal.
> ///
> /// `b_str!` converts the supplied string literal to byte string, so =
non-ASCII
>=20
> --=20
> 2.47.0
>=20
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>


