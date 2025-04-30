Return-Path: <linux-kbuild+bounces-6819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918B1AA54C3
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 21:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A443A8065
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 19:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8F31E9B1F;
	Wed, 30 Apr 2025 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJrsM6ty"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8C1311AC;
	Wed, 30 Apr 2025 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042027; cv=none; b=r7+r6CBf5KvMY4gjpcGKssPX0gxX+pn2PFhG8vM8jHDTVbHx8G8GwxCp6sTDq3VtPztX5inTyg19in1ruwq69N2/rrCnunEn2NX46OagDaFi1nV6AQGEVKaX5uQVJrbsBVkkqE2R4XUUhII+2Y6vAkH1gc01aqhBkFOJ2+f4rpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042027; c=relaxed/simple;
	bh=R4X++FePIEEVrMNj+JrsGnJGPpL34ww2PSH7pi8UTNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TpZct/64Cxi22+7TsaEUiwej4YVKc9F720Lg0cPP6lhFjHFaObWgZCHJpC5kfwuwHlezWb+PYHTIfB+sRyYS51OE7KK0iOHAZcUczdElNIy3J8vNFS86L9aag1oLs5dDUqqcWhmJ8tUU8QFwDDSF/4rzTx6C7fonKEUjW7pvWjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJrsM6ty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28AEC4CEE7;
	Wed, 30 Apr 2025 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746042026;
	bh=R4X++FePIEEVrMNj+JrsGnJGPpL34ww2PSH7pi8UTNg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KJrsM6tyJMWaFZqsGgQeA1oX+2XO9qwDLiTjeU5hPw0b0ofnAC6ESnMA7E8N8dSEy
	 rnyuYCi2SDx2CaFW4VkGmubWgoSBvGV2lnns+5M3TLAKwdpgOC05qJy9WoMHcETRLU
	 YXsfGegVwYXa4PYc/+u4qe+WNbu9ko0OFq2uMh2EdoDvxZnsZyK7q53gq3DV0SOfSe
	 Fp9KClv76vXHGlmZ8Auv59PW8kLk6nqoEloNep2IXfBGLTCkszbTiRAbDvfBvSOB5c
	 tsGIgvalqVKLyput6+qGv0CdcBc1WuB5Q6X4BCV+M0kRDz34uZmwXzpXAqHln/FeMz
	 xtM118t9ZlpuA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Petr Pavlu" <petr.pavlu@suse.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Trevor Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye"
 <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Sami
 Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v9 0/3] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <7f707d8e-f2e4-49cc-8d7e-e8c4c4193cec@suse.com> (Petr Pavlu's
	message of "Tue, 22 Apr 2025 15:22:13 +0200")
References: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org>
	<TYWaPPH4gYIHt34o_EgTjPNCEjoecJrCoa2BQSgayqmOJJZGRbmd9nwxNhXhzjoNtY1CGFapv9-pKYiosYTgsA==@protonmail.internalid>
	<7f707d8e-f2e4-49cc-8d7e-e8c4c4193cec@suse.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 30 Apr 2025 21:39:57 +0200
Message-ID: <874iy530c2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Petr Pavlu" <petr.pavlu@suse.com> writes:

> On 3/21/25 10:17, Andreas Hindborg wrote:
>> Extend the `module!` macro with support module parameters. Also add some string
>> to integer parsing functions and updates `BStr` with a method to strip a string
>> prefix.
>>
>> Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].
>>
>> Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> [...]
>> ---
>> Andreas Hindborg (3):
>>       rust: str: add radix prefixed integer parsing functions
>>       rust: add parameter support to the `module!` macro
>>       modules: add rust modules files to MAINTAINERS
>>
>>  MAINTAINERS                  |   2 +
>>  rust/kernel/lib.rs           |   1 +
>>  rust/kernel/module_param.rs  | 221 +++++++++++++++++++++++++++++++++++++++++++
>>  rust/kernel/str.rs           | 170 +++++++++++++++++++++++++++++++++
>>  rust/macros/helpers.rs       |  25 +++++
>>  rust/macros/lib.rs           |  31 ++++++
>>  rust/macros/module.rs        | 195 ++++++++++++++++++++++++++++++++++----
>>  samples/rust/rust_minimal.rs |  10 ++
>>  8 files changed, 635 insertions(+), 20 deletions(-)
>
> I'd like to pick these remaining patches on modules-next around rc5/6,
> so they can sit on linux-next for a bit before going into 6.16-rc1. It
> is a new code with no users so I don't expect much fallout, but still.
>
> Could you please post an updated series that includes the cleanup from
> Miguel?

I thought I sent it, but it appears I did not. Sorry! I will ASAP.


Best regards,
Andreas Hindborg



