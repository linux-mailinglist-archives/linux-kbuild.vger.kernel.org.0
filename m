Return-Path: <linux-kbuild+bounces-5853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E2A3FA7F
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 17:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 215BA440EB6
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 16:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00705217674;
	Fri, 21 Feb 2025 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ErpbdhC2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5D51F4299;
	Fri, 21 Feb 2025 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153734; cv=pass; b=p9xFISEqT7L51SB01Om/vXVli9R4A/QC5bUc2XHfnC/OUbCcX2p6n/iid5K2g3z1myqhHUEpcToVsFfeiWv+27AZelmVyIuc2wWD8qThvxfKdt+tHFwjC8Qbvf/Bmklr1X9RBp+XFsCY1LIL/lY+FI+h50WhXZP/clP1uO48bg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153734; c=relaxed/simple;
	bh=HV97Xq3PPrIXArannXCNBgY8VQMumEfQDGVjRdJhiNk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DkTiXYZfGdkr6jyvMSCPfxnf3JwwHb8ZA4CoIRe7L0g5PWU38VZOk8lQP46G1jQnaay2IauiF7LFNbmwikkPwrFtfiHbsF32EZTxpf8/hByZeJHybhKzWtoMPI+r+tGG0pDvJ9aA4QUZu8pEW5B+pwE0d46jlD9gD9lzuMLJgH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ErpbdhC2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740153695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kZb5ylR6XGfJS2iULorWAP6ngITzkFpnWDJAEeHRV0zJK5psgifirKfeJlKYEA6r3VvypGcKqdqVOpuETTnZk1ESdZO8og0KtmhKy2gbHAKdY3fEEl6xzA3IJAiiWLs01HP3FS8BCYYOnCM0IDjQqinJPcpbumKa4Ao0TggxY88=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740153695; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lmnS12fhAODY05bchgMX7CUUcq/rZl+v6K7NyDg0XTI=; 
	b=gUvGyZFte4NJpAXZaKbjgitDvvuUfOz7tqzRJsAyYbm8h3iFlWC5oJCMur4fE1O59UUV1/ufn1GUDOqUEu9T9bxu87qE9cSS9g9+ndqqLrgynQZ/g0dBouQYZCpB1m0qjJXosVLqw5YL1/UxarPxnbtY5GvaNydit+p31PhNSb0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740153695;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=lmnS12fhAODY05bchgMX7CUUcq/rZl+v6K7NyDg0XTI=;
	b=ErpbdhC2wCOHghgpgPXKXHl3myP5rbSg2tGVaJHU6caHIlSZmJcDWH9ZCW2ZHHQc
	BV8fZMTYdm6ZEvqU4xrlf2UZhc19CQK4qRJinqgqK8tiSbIisoztFnErWVuYA+Tz/z5
	LRKKfP3Zbs9+pGd9zSoPJ6SescUwdO2qHjueWz6s=
Received: by mx.zohomail.com with SMTPS id 1740153693259380.183280566775;
	Fri, 21 Feb 2025 08:01:33 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v7 3/6] rust: str: implement `AsRef<BStr>` for `[u8]` and
 `BStr`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250218-module-params-v3-v7-3-5e1afabcac1b@kernel.org>
Date: Fri, 21 Feb 2025 13:01:16 -0300
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
Message-Id: <87372128-2734-4402-B46F-EF81ECEE546A@collabora.com>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <20250218-module-params-v3-v7-3-5e1afabcac1b@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External



> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> Implement `AsRef<BStr>` for `[u8]` and `BStr` so these can be used
> interchangeably for operations on `BStr`.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> rust/kernel/str.rs | 12 ++++++++++++
> 1 file changed, 12 insertions(+)
>=20
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index ba6b1a5c4f99d..c6bd2c69543dc 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -125,6 +125,18 @@ fn index(&self, index: Idx) -> &Self::Output {
>     }
> }
>=20
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

Why do you need this last one?

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


