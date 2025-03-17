Return-Path: <linux-kbuild+bounces-6208-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C98A654D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 16:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0947E1896AAC
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 15:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA49241683;
	Mon, 17 Mar 2025 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JYJ73U8a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A67221568;
	Mon, 17 Mar 2025 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223671; cv=none; b=aEH2uFw5nY1SFOcLTxS0iZThuBcO37kBFSsJ/0sR5TM9A4A16EyCwAlhg2BaOmF12MK7s8xzGTdQp0iF0FKTFh0+QQ16/UKeZ+3x2ypBch4vjeuXdXT2dK581+YOqitxV+Do2cA7WtOne/xE+9tfkFXV6jwg3v2ve8MZNRPc1Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223671; c=relaxed/simple;
	bh=WptTcSSlmCktUdKPW+1KUBV/N+lclVq0IHaAKtcbT3w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jBWVq4AMnar089UiSBHiAD3H2X3vyEvUZYqeMibSkb/fTcLSNS5B0jGXsqOJDYsJqI2+Th0JYy9pmpnl6ah0hxFf7kRVpYPx5EhUWH6pmKhWj+4XqpjmAGmxdLfTrxnk+BEOpaNovYLfie1P8ld0A+3MMbBDzz1ifM96gsub5XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JYJ73U8a; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ak62mbupfzdybavrnbwyabpmwy.protonmail; t=1742223667; x=1742482867;
	bh=WptTcSSlmCktUdKPW+1KUBV/N+lclVq0IHaAKtcbT3w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=JYJ73U8a6VlJ/zNgB3D99RzvvNfuJZ1/nNFfdUY4Y0BjHqDHbgyeg+mcimfkqyvJs
	 GVRAvLGTAhVZ6RFeaF2jPRzuMk7bdmPhKBUB9tV5gpGhWdebYZioZ7e2zZAv0tT+z9
	 FEU3jm96yyfSU52RiTpOeEVjUe4SN3SmOVCzTL200/gnbRGlmZyVvpRxd0/UNr9KCZ
	 2SVNMWviwvOvEtlOsPWGPSkCLZ0Gs/4NKThYBaJPPYUHIn0E+XCGxe75NDH5goimOz
	 6JcEUBtY8L7lbi6/9uNvUlkAPj05dyXfytwYxUlOOe4XfnMZrIfEkltTObHiuBD41R
	 Miyp/UEz6zI1A==
Date: Mon, 17 Mar 2025 15:01:01 +0000
To: Tamir Duberstein <tamird@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-pci@vger.kernel.org, linux-block@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 6/6] rust: use strict provenance APIs
Message-ID: <D8IMQP0N3WOI.3INW9SXYK8SM@proton.me>
In-Reply-To: <CAJ-ks9mXzM6D++vq0QCugaFOS9ES0j7GpeWZqckY0dA3JwpnJw@mail.gmail.com>
References: <20250315-ptr-as-ptr-v4-0-b2d72c14dc26@gmail.com> <20250315-ptr-as-ptr-v4-6-b2d72c14dc26@gmail.com> <D8IFS7175NNQ.3VAP8WA2QC8WF@proton.me> <CAJ-ks9mXzM6D++vq0QCugaFOS9ES0j7GpeWZqckY0dA3JwpnJw@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: f09460e69c19b19c4743a9876a71f182183ddd19
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 17, 2025 at 11:53 AM CET, Tamir Duberstein wrote:
> On Mon, Mar 17, 2025 at 5:34=E2=80=AFAM Benno Lossin <benno.lossin@proton=
.me> wrote:
>>
>> On Sat Mar 15, 2025 at 1:17 PM CET, Tamir Duberstein wrote:
>> > Throughout the tree, use the strict provenance APIs stabilized in Rust
>> > 1.84.0[1]. Retain backwards-compatibility by introducing forwarding
>> > functions at the `kernel` crate root along with polyfills for rustc <
>> > 1.84.0.
>> >
>> > Use `#[allow(clippy::incompatible_msrv)]` to avoid warnings on rustc <
>> > 1.84.0 as our MSRV is 1.78.0.
>>
>> This isn't necessary, right?
>
> It is necessary. MSRV is encoded in .clippy.toml, it doesn't matter
> what the *current* rustc version is.

Oh of course.

>> > In the `kernel` crate, enable the strict provenance lints on rustc >=
=3D
>> > 1.84.0; do this in `lib.rs` rather than `Makefile` to avoid introducin=
g
>> > compiler flags that are dependent on the rustc version in use.
>>
>> So it won't be enabled in the doctests, right?
>
> Yes, that is correct.

I would mention this in the commit message. Thanks!

---
Cheers,
Benno


