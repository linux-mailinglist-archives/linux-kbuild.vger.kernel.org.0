Return-Path: <linux-kbuild+bounces-5854-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D540A3FB0E
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 17:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CF127AE923
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 16:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312EC1FBCB8;
	Fri, 21 Feb 2025 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="HrFq2N6H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD747217F34;
	Fri, 21 Feb 2025 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740154521; cv=pass; b=t+Al+Zr9MY1305FDOu9uIzcLTzKJqsz1MBpq6UCBN/ggpEXyDbOZta83FjdYyml+KFK+n6BPLcTt9pfARVDyOa7o9gv3HpeI/3TxFtcsUQwITb61EhdTmmdSTY01CqLgjIc7WIYCg9wvjDdSo18A3hoDoqUpqx/OZ5JDNWvGDhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740154521; c=relaxed/simple;
	bh=kq47C7Cj0lNqK5gVuD4iv3D6ANd/wMKGIASyMs4pBI8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uIBnKwum4Ft8rKH8bHOaKOfY0Iqg6YMQKxDQXJflbN4TXsVUecru2ifuAOi97yhHzbsfUIFa5CNk++fg5C3hJl8MWpBNHPvGbpb5xmANChd1acryDWd5f26OWmUWTpREBr2l7enZlHSQPK6ABBimKLhpD72SLAMDJ7uLK+uhcb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=HrFq2N6H; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740154482; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=axGHV7uyYSgur6jAbZ0Etq+z1vfX/8gV0yhdKRCEsvL/aRaXScGSPfUTYWGlflg3I3EaCy2is22lLWHFIhM1r+2EOe9zJZ990PTmBDflG64bfgrrb8w+01KvrtsrHU1qz8sNVIDx5Epa5ff44L0f9Ci12rG34fOH3TA0W9ya05g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740154482; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QU4oftVAlwYPxLUQYSBkIID7nutOF48ooWl8p3gGC8U=; 
	b=RvaHzRqNFevItfz77ByvGc2u0dwRmUQEWMgkQohPzULqL3YIn4Rv4p6w854LCks8FWClszYG6qGHd4JwXQ1Kl0Iyb/KvNkZxP2eF0DX51f/ORtZwjPDA4srqKxUEpksmqcb7A/1cOAw3HyKlZv0slxPOHNbAqBQWrBZHedMCrKU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740154482;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=QU4oftVAlwYPxLUQYSBkIID7nutOF48ooWl8p3gGC8U=;
	b=HrFq2N6HUVJUM+27SbT1pFfXF7Sv0hwVKWfR2MX/YkUE9QsI3X8eTWfgHECI0zIH
	c31QL3bPS0QL3Ah1Dv8hHZ6qHEim0t8KbW+LCr/gnws4o9HomBVixcqPh9Sv10umH68
	zVFxMDJ5jeHXEEYxEGu70eucZdZYlBqFh24IHfFs=
Received: by mx.zohomail.com with SMTPS id 1740154479024643.7915371630859;
	Fri, 21 Feb 2025 08:14:39 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v7 4/6] rust: str: implement `strip_prefix` for `BStr`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250218-module-params-v3-v7-4-5e1afabcac1b@kernel.org>
Date: Fri, 21 Feb 2025 13:14:21 -0300
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
Message-Id: <1723B7FD-5929-4C64-8DB3-671C74D97468@collabora.com>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <20250218-module-params-v3-v7-4-5e1afabcac1b@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Andreas,

> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> Implement `strip_prefix` for `BStr` by deferring to =
`slice::strip_prefix`
> on the underlying `&[u8]`.
>=20
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>=20
> It is also possible to get this method by implementing
> `core::slice::SlicePattern` for `BStr`. `SlicePattern` is unstable, so =
this
> seems more reasonable.
> ---
> rust/kernel/str.rs | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>=20
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index c6bd2c69543dc..db272d2198fcc 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -31,6 +31,22 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
>         // SAFETY: `BStr` is transparent to `[u8]`.
>         unsafe { &*(bytes as *const [u8] as *const BStr) }
>     }
> +
> +    /// Strip a prefix from `self`. Delegates to =
[`slice::strip_prefix`].
> +    ///
> +    /// # Example
> +    /// ```
> +    /// use kernel::b_str;
> +    /// assert_eq!(Some(b_str!("bar")), =
b_str!("foobar").strip_prefix(b_str!("foo")));
> +    /// assert_eq!(None, =
b_str!("foobar").strip_prefix(b_str!("bar")));
> +    /// assert_eq!(Some(b_str!("foobar")), =
b_str!("foobar").strip_prefix(b_str!("")));
> +    /// assert_eq!(Some(b_str!("")), =
b_str!("foobar").strip_prefix(b_str!("foobar")));
> +    /// ```

This is passing.

> +    pub fn strip_prefix(&self, pattern: impl AsRef<Self>) -> =
Option<&BStr> {
> +        self.deref()
> +            .strip_prefix(pattern.as_ref().deref())
> +            .map(Self::from_bytes)
> +    }
> }
>=20
> impl fmt::Display for BStr {
>=20
> --=20
> 2.47.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=

