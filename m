Return-Path: <linux-kbuild+bounces-9370-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F36C2C83B
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 15:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26927188FE57
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 14:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE5B313E3E;
	Mon,  3 Nov 2025 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLOofRBg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC6630CDA8;
	Mon,  3 Nov 2025 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762181247; cv=none; b=cKzy98fXJZd29Q+sOlwVgwwy2QS1P3S3piKod2bZd21GmRdpVGdRO/rkMHuueIRHZObbjKWyaEX7VC4a++TmSvZaUuhTYigUDhm82QkDIXb3Yo6/vvyBvBywodYf2O1YDcsfyPhBGxWSvWDynlu2CqqyTYcCH7EnJVzDuwlR9OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762181247; c=relaxed/simple;
	bh=wEqUiWqzTn3qz8K/m/T7ZHGVJLtzuiTUO3H/8VHuy4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nH8ayaivYncpoEsHfjL3PVmo4mL3YWVI2o2M0B25zuqT03WEGLtbEZGzYos/9itB83G/Cchuob43/CygXVozc5nBspY6JbU0RR4UiR4t7s0rqAjKSDlEeCLcWmAV77OGSm4vyJoeLghGPdfuOYXmDu1Gc6dkXlrTfMmBaBOGNzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLOofRBg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74552C4CEE7;
	Mon,  3 Nov 2025 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762181247;
	bh=wEqUiWqzTn3qz8K/m/T7ZHGVJLtzuiTUO3H/8VHuy4M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gLOofRBgysxna9uxvfoCaDQSiaA4GPKntTz9Vyhb8eoWE9LSRiuSNsMcdOySc+HPm
	 X5M7AyMh2VsUfuI+2K1EKsR3ouH04TMqLaZpsmdC7+MOzVDXycuKj2BevSsfwkBzZP
	 C/qRSO+iBvxoMRgWcZZY6QtZlf81GlB/L9p9EKGZqeXmolio9oY/+ji70KQmZpdLCu
	 0mk96GkjUGd5IVVrXp7bzMVxS2SUgQS24lrkVDBWrgbyg3KAPgJGpKy29rJGve5PQf
	 ro9giLqf6UwJMEPrXETo5yZdLn6lmaCR4SU4CEekeawWeh1/ZmGmryvmZft/7Ab1oy
	 Wpg5ZgLB5zhMA==
From: Daniel Gomez <da.gomez@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Andreas Hindborg <a.hindborg@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org
In-Reply-To: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
References: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
Subject: Re: [PATCH v18 0/7] rust: extend `module!` macro with integer
 parameter support
Message-Id: <176218124220.2602452.14511624048623385037.b4-ty@kernel.org>
Date: Mon, 03 Nov 2025 15:47:22 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 24 Sep 2025 14:39:23 +0200, Andreas Hindborg wrote:
> Extend the `module!` macro with support module parameters. Also add some
> string to integer parsing functions.
> 
> Based on the original module parameter support by Miguel [1],
> later extended and generalized by Adam for more types [2][3].
> Originally tracked at [4].
> 
> [...]

Applied, thanks!

[1/7] rust: sync: add `SetOnce`
      commit: 821fe7bf16c57d690f4f92997f4e51abb93e0347
[2/7] rust: str: add radix prefixed integer parsing functions
      commit: 51d9ee90ea9060be240830eb28f5f117ad00318c
[3/7] rust: introduce module_param module
      commit: 0b08fc292842a13aa496413b48c1efb83573b8c6
[4/7] rust: module: use a reference in macros::module::module
      commit: 3809d7a89fe550bf4065c04adff6dac610daddad
[5/7] rust: module: update the module macro with module parameter support
      commit: 0b24f9740f26ac7ad91ac0f4de27717c14de91bd
[6/7] rust: samples: add a module parameter to the rust_minimal sample
      commit: e119c2fe8c78632188f6cdeae620951a7032855a
[7/7] modules: add rust modules files to MAINTAINERS
      commit: ee3b8134b2bae848e03e56c090ceca4ae76cee06

Best regards,
-- 
Daniel Gomez <da.gomez@kernel.org>


