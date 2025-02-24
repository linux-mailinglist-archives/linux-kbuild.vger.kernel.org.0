Return-Path: <linux-kbuild+bounces-5894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0933FA43020
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 23:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BBF53B459F
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 22:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980011EBFE6;
	Mon, 24 Feb 2025 22:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="cey62cR4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bZIjnI8T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0568B3DBB6;
	Mon, 24 Feb 2025 22:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740436239; cv=none; b=F7qBaiA3UPWrQvyJzLtisNaGKI9H/m7Q2agQUi7eJViO/2dBAheD2JBYZ7CFS55YWfBe9TZ46frzUHjBwFTMUiEICrNlmfr0/bJmerxEpH/GJD8dpd8lOgsFuehImJFSv0Bj5QGL7s3L6NltIHD6swwUcEldgt7VSy8RVJEDH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740436239; c=relaxed/simple;
	bh=O0pCRDGn4iQ7GiTUj7I+4iYeEiZ8K7m3WtPTYjknbVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJcX3RT8kvS2vUiKACz02t01Ygaho4m5FPLaKk2RpsiO/7xb20PBy/6iUZUElrutteIQ950uTgCDP+GmscMLq015o7+jTExOKdY4vC2G/sc0UnXQeIsU+sgYN9bPk8ItSDDlg8qNaTfAon6PA3CImn6oTfm7mq48MFhiisbxRfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=cey62cR4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bZIjnI8T; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id E5D3B1381517;
	Mon, 24 Feb 2025 17:30:35 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 24 Feb 2025 17:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1740436235; x=1740522635; bh=Bd+S1XulZr
	LFDTKwyGmTN9YcBPY1oZeNyfDO3GE4v0M=; b=cey62cR4yvMe6gFIL7b49yA50v
	hdHAchEY4j5XvJi4Dx+l+feOEQbjF4cKqaxJILugd/0mGrljXW0x2+fvv+IBeRRW
	RVitOFWTxtjaFyWtTQyg+y+E1LFrWH/FM5Hf/+oeSXvc2vxx93XOW4xa0NQTJw8S
	VVRUxFkpw20s7ZJtpRJM+q1LTTSWK+lCcTehhf2c0mTKgdz32sibHZpHqDa1v0uA
	AssWhiou8jZboDoqQVEG+E/5QL6Ia5CeJQYAMl4taOMfvLIb+ovORo9OecDSvs23
	FfTyqIZnBbIO4XlVpBNgF+SR/CjORFSC1Z6GaFQrvc4hhkZafTc0X4+svX/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740436235; x=1740522635; bh=Bd+S1XulZrLFDTKwyGmTN9YcBPY1oZeNyfD
	O3GE4v0M=; b=bZIjnI8Tqfxpg0HgMAS8Y7ZF8ue5HK3TXuQDXoKcfof3oUoflHG
	qfcWo35GxYRh+pe9mr6zxEBgFBTc7IJqGa98kv6wCQi8GhmNr6DIyoddY7rcsER+
	yK0Ba01vtEwYMVfBpIG4k7dVUOOwtDc+SS2Hn1HoXMENPmSW6p+cn9IW7pwTAxky
	WpImpPYiJZqO1THdFaAmtysuErGsnXVJ4nwhO+DDSNwUmIKoarkMLK57gXUsPp+Q
	E7iSdbuTI53cKizClr+d807i7rd85pwk6sn5AREL2dz4pki5CsiuJdNqKTbCA/B4
	yuyvB4pacoP7hqoJRke5akBayndf74L12zg==
X-ME-Sender: <xms:CvO8ZyVUa-jUUHn41mOGFNM4wJeRzdmy-17LYBJln-KyN1XydVAPlQ>
    <xme:CvO8Z-ktXlNcRZYOh94DA8wRMOYmJKK0O2ogHPDli3WDHWkj7USQvqFHCbH4S6QJQ
    9N0Gn41d4jh4hQZOH8>
X-ME-Received: <xmr:CvO8Z2Y6hXRjpIYLuMhM1itQuZ8FGCevQF5mz5wkK_-YiIu0U90t3UK9k2jcCctMfEHXFPbcZ21WjxEm6qLI007GAZccSw-7rJs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdektddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedvfedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghoqhhunhdrfh
    gvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhn
    vghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpd
    hrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhroh
    hsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:CvO8Z5XtHN6c3TOorBh021UC9jVAJEZy0KZX4PmX3PUesXbM_fUQMQ>
    <xmx:CvO8Z8nKZAf9jdCjU66MbE-FfH4hQ7I8aJwEqa_V2stzB8izBkRePQ>
    <xmx:CvO8Z-eJTXTL8EaeEljxRwwappybtQhKDIxukBNqbAwgJHdG_MIsVQ>
    <xmx:CvO8Z-HSehRjYb4hVhfAJ1Em3M_Ki4FVhA-wzAYo-636qHH3UuDAog>
    <xmx:C_O8Z2FGhb1Y8N5yrGEo3iSngXenwBAX7mw9-ZKEVx5Ea4Cfy5ey3yFI>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 17:30:34 -0500 (EST)
Date: Mon, 24 Feb 2025 23:30:32 +0100
From: Janne Grunau <j@jannau.net>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
Subject: Re: [PATCH v7 5/6] rust: str: add radix prefixed integer parsing
 functions
Message-ID: <20250224223032.GA615664@robin.jannau.net>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <20250218-module-params-v3-v7-5-5e1afabcac1b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218-module-params-v3-v7-5-5e1afabcac1b@kernel.org>

On Tue, Feb 18, 2025 at 02:00:47PM +0100, Andreas Hindborg wrote:
> Add the trait `ParseInt` for parsing string representations of integers
> where the string representations are optionally prefixed by a radix
> specifier. Implement the trait for the primitive integer types.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/str.rs | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index db272d2198fcc..8b0d814b47f52 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -945,3 +945,121 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {

[...]

> +    pub trait ParseInt: FromStrRadix + TryFrom<i128> {
> +        /// Parse a string according to the description in [`Self`].
> +        fn from_str(src: &BStr) -> Result<Self> {
> +            match src.deref() {
> +                [b'-', rest @ ..] => {
> +                    let (radix, digits) = strip_radix(rest.as_ref());
> +                    // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
> +                    // So if we want to parse negative numbers as positive and
> +                    // later multiply by -1, we have to parse into a larger
> +                    // integer. We choose i128 as sufficiently large.
> +                    let val = i128::from_str_radix(

The usage of i128 causes here following link errors on arm64 with
"rustc 1.84.1 (e71f9a9a9 2025-01-27) (Fedora 1.84.1-1.fc41)"

| ld: rust/kernel.o: in function `<i128>::from_str_radix':
| /usr/lib/rustlib/src/rust/library/core/src/num/mod.rs:1563:(.text+0x3bc): undefined reference to `__muloti4'
| ld: /usr/lib/rustlib/src/rust/library/core/src/num/mod.rs:1563:(.text+0x440): undefined reference to `__muloti4'
| ld: rust/kernel.o: in function `<i128>::overflowing_mul':
| /usr/lib/rustlib/src/rust/library/core/src/num/int_macros.rs:2517:(.text+0x4b4): undefined reference to `__muloti4'
| ld: /usr/lib/rustlib/src/rust/library/core/src/num/int_macros.rs:2517:(.text+0x534): undefined reference to `__muloti4'

The errors go away after exchanging i128 with i64 (while breaking the
parsing for large values).

ciao Janne

