Return-Path: <linux-kbuild+bounces-5851-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C53A3F9C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 16:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 312B619C0115
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 15:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9418E213E89;
	Fri, 21 Feb 2025 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="hmxIeYl4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5102139DD;
	Fri, 21 Feb 2025 15:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153142; cv=pass; b=abiUVTPSS1b+v/lcmVAlt8wVD+21gkuKT6/xBLiv6iGVR1AdL3yEDOsscztm+yER8CGSH6pU6nsYUOWJ9ZMyJ7z7YbsTDjhO1AZK2DCsKIbgsucu9HPOqIeSnAMHoJMdfX88I79RZm56uJGASjhS/AY7kmJR7SIQYqMmiN3Dwxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153142; c=relaxed/simple;
	bh=iaQ+8410xKoAcD7janib56GRmsqyMB9cJ17s5UofjeM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=riU1lRuy2eBGjlP3YLlscfk2IeTRrQuex8Qv05SgUyDibFQt5FcQzCLJJl6WPvvcL0xkwAhnNptFiF3AImcgcKM8zNH/f4p6hQFSYHPslVdxVELBsVjA5JRUEdhsd30la8XLqVGbWv1JaWLFnAbWpdMdc2Jnl0PA1B9HE3xd09w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=hmxIeYl4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740153098; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ur8DFaCXw/kfGxqm2t3KTY/RqUQ9/Hm7NPzbLZo907lsoPJtfhPofBmeoRETtZIzKy7XKnfr8jM3E04GcOp00g11fWii7pTAQepqxHLlntonTdcfv1if8m5QwME8VMmMI1rDrnrIASCZlNmizdQViJ9psupxliVrXjqGx8xzkVY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740153098; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HlQHYE1pagm2zjFO6/6LR3Vvs32N93jmTgtwHYFPo48=; 
	b=CUb+cps4DvmJ92jWd4kjfM772bDK7IebZrfq41FAMwBGajdgF5Rd6gxT2k2+ZDuudFT97gaJdvSBhmbj15u4CGbkoSO2GZRL5okUbxbo3QyM7ey85aCy+KnO2H2Trgd0oLAAblmrDOAIxCwwf2UfkZfEfEgpzEUOMcQ2Z1hRzrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740153098;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=HlQHYE1pagm2zjFO6/6LR3Vvs32N93jmTgtwHYFPo48=;
	b=hmxIeYl48SOWkT35ShjoRjzHy48BbupoVwnc1RTMvjQ1bWk8RvIqEDg52ggG87fH
	D4qJ/Ctk4ZlA5imdzpkQQfG6jW/3P2u2JTTMKbUymnMnArX/2xgBGEZwS9uaBUSSF+e
	goUrc3U3SI2GT1d5tWzDiLFRFFksjDzXz1MUwRkA=
Received: by mx.zohomail.com with SMTPS id 1740153097184404.12164099489894;
	Fri, 21 Feb 2025 07:51:37 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v7 1/6] rust: str: implement `PartialEq` for `BStr`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250218-module-params-v3-v7-1-5e1afabcac1b@kernel.org>
Date: Fri, 21 Feb 2025 12:51:20 -0300
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
Message-Id: <FB41A276-5A3A-4878-8DA6-CE0EA751E768@collabora.com>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <20250218-module-params-v3-v7-1-5e1afabcac1b@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External



> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> Implement `PartialEq` for `BStr` by comparing underlying byte slices.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> rust/kernel/str.rs | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 28e2201604d67..002dcddf7c768 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -108,6 +108,12 @@ fn deref(&self) -> &Self::Target {
>     }
> }
>=20
> +impl PartialEq for BStr {
> +    fn eq(&self, other: &Self) -> bool {
> +        self.deref().eq(other.deref())
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

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=

