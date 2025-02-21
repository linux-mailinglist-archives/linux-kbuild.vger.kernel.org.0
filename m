Return-Path: <linux-kbuild+bounces-5850-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A6AA3F960
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 16:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABA32440691
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 15:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224961F12E4;
	Fri, 21 Feb 2025 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="P0PAcyep"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFC11E7640;
	Fri, 21 Feb 2025 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740152804; cv=pass; b=fPjEfGGhSVBOfMWyYktf0Nx1i8AK0YfMLQs3i0+VffKFq+OMyjFk6RsZc5j4fYN/ZGWBDaLWOFMvEkr5lBnmxfqQfPHAi5LotcUpWxXkUK/0+veRJ5cMpGplZxXyLsMgIlz1XWUvFsOmE6D/xXkLkPqsLLjmaO/IiwoFF7kDoAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740152804; c=relaxed/simple;
	bh=pn2MuqrPPywukUfVG1Tn4il5fz+cXCZkczWE+P6YzHQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QF/X3up895yKgnHpsIdAbGFyqNkSIyQ+xCoexGXAs9SJQpY2g4J/4CRYFugiZABCazGYgm28fkJ8QLfnfQ95pztmdbFfl+N6I2F/MSX5MP9UfIfO+uMMoPav8pYUn1F43yWe80TZuk49TSvbowv1rKpkwdB2uItJKKa4QqVHM1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=P0PAcyep; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740152768; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fEgPaftwiozQnitf44S47NOq3cGA765xGRmrLZK6Sv3ypHwd0sOcHHQBYY/g0zOzRfZfLhXULDWAugrpAKwlz3mkoo6qh19HQjrA0fc/ZPK0dyA+th5DQk8aOCDgc4UvqW8EA+bj1MTWJ5XQgnLLUSPRwtVNay9mR72ZTsANy5w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740152768; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CgG3qgCstWdH24HcDyLIW/wtQ4JGMB+RlmP0pIdS1Lw=; 
	b=lHE4vmXcYUF3YdMuFKVCuo7dUd33aSvyV9EqAL5vVM5xyaeCU9si7PAGJy8XeFohGAlvNTNkhg61+rDmf5HiEZUoIbTnMrlUuZdlQLEAMZGk0zxSy5z7W/YqSqe4J14SIiXOy44AyPrCZwKjn2HNdOKpHASkT7rNI7GWT9cbg68=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740152768;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=CgG3qgCstWdH24HcDyLIW/wtQ4JGMB+RlmP0pIdS1Lw=;
	b=P0PAcyepf6usrkvthJZSHWojSPwAEcyiKMjZrkIcG6lJqEsbJsm4zCqEmsJYOuIn
	3pnnDJNDQmNjJuo/dCx33cgE+ZXa8qRq8tWPHwMa1WWzf3Gt9C2PAg+YDmUIym+BPUM
	olWFM6uxhyoh7FSykeJ6zSu6KD4GRKFDm7g2U8PQ=
Received: by mx.zohomail.com with SMTPS id 1740152765928241.70092754235043;
	Fri, 21 Feb 2025 07:46:05 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v7 0/6] rust: extend `module!` macro with integer
 parameter support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
Date: Fri, 21 Feb 2025 12:45:48 -0300
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
Message-Id: <F882BB02-A795-4F79-A2AF-CBA9608470A5@collabora.com>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Andreas,

> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> This series extends the `module!` macro with support module =
parameters. It
> also adds some string to integer parsing functions and updates `BStr` =
with
> a method to strip a string prefix.
>=20
> This series stated out as code by Adam Bratschi-Kaye lifted from the =
original
> `rust` branch [1].
>=20
> After a bit of discussion on v3 about whether or not module parameters
> is a good idea, it seems that module parameters in Rust has a place
> in the kernel for now. This series is a dependency for `rnull`, the =
Rust
> null block driver [2].
>=20

```
$ sudo modprobe rust_minimal test_parameter=3D2
[  251.384125] rust_minimal: Rust minimal sample (init)
[  251.384600] rust_minimal: Am I built-in? false
[  251.385010] rust_minimal: My parameter: 2
```

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>

IMHO, this is slightly confusing, since the parameter is named
=E2=80=9Ctest_parameter=E2=80=9D, but you=E2=80=99re printing =E2=80=9CMy =
parameter=E2=80=9D.

This is of course very minor. Overall, congrats on getting this to work =
:)

=E2=80=94 Daniel=20=

