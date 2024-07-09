Return-Path: <linux-kbuild+bounces-2436-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D980C92BF16
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 18:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8DD1C228C3
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 16:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B20D19D89F;
	Tue,  9 Jul 2024 16:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTGk//5R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2214019D88D;
	Tue,  9 Jul 2024 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541186; cv=none; b=LIB4qbXXVejexJCPKFjRAPPfEiNNCDWbNCjwCO14L6IlVPrYaKAd0ZaVCpwHfHD1wPgCq4miEmlCqREj0p48D7dP5hH+/aGHBE9PV9197wKC97J3O8/9K+rZW5zN6FECl/LFH0FFZaoucqVO+Bxw2Z96iUxDerZxoG66uNX2SBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541186; c=relaxed/simple;
	bh=XomL6XkiSGmqijLHAImjPAoDH/hg/wLBpt7YmP/PttY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nfCuM9EQ3+ECEZutb9HsSr3FjokApEocYTlCH6XHrYfl93VUP92o7D/5WoE87SEizfhf2FZbmB7en4AsQPBIJ3EJSPYZUB5zNQlMTErOkZu9aaWIv75mYRVAsPbdGwyzmetdATgbjPJKJYcnIKgv1/10/8D/j90o7uekVl8613Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTGk//5R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6DCC32782;
	Tue,  9 Jul 2024 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720541185;
	bh=XomL6XkiSGmqijLHAImjPAoDH/hg/wLBpt7YmP/PttY=;
	h=From:To:Cc:Subject:Date:From;
	b=CTGk//5RF6DJT5bk3YTgB1qKHHjc10H9GL67lrqHcLTsII4VOeQQBTovAh/j/GDZr
	 HV4i92Fgz6IahKNJgoA9wOqfWKdwkM4DLLuTFtwZ0IMmitYdno8Yc/DgRo6B3zNxmB
	 dj5HAvJDX0V3+Bzt2CgG1BQAigETQ80NQzforE8IkFYQDtDvm+7AuLjfwoSzvxqaNA
	 VEu4iPwFgNl5lBwvldo/Ug1sY2FZyS0bNV8FAbr237qAjphQR8ftD2n/SxhQ3Y7aOr
	 DrYtu4oYy/CJyEN8MV7zcDU/fnc6ArRjyRsoA3oUCjawBBki8X3fIMyLDiaRptfrwf
	 ZJLR2mU02zZLw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v2 00/13] Support several Rust toolchain versions
Date: Tue,  9 Jul 2024 18:05:55 +0200
Message-ID: <20240709160615.998336-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

A few things improved here and there, and rebased on top of `rust-next`.

The changelog is attached to each patch.

I kept the `Tested-by`s since most of the changes are on documentation
or comments, though I did remove them on the patch that changed the most
just in case (even for that one, I think Benno's and Andreas' setup
would not have made a difference).

I plan to put this series into `rust-next` very soon so that it goes
into the merge window.

Previous cover letter:

  v1: https://lore.kernel.org/rust-for-linux/20240701183625.665574-1-ojeda@kernel.org/

Thanks!

Cheers,
Miguel

Miguel Ojeda (13):
  rust: macros: indent list item in `paste!`'s docs
  rust: init: simplify from `map_err` to `inspect_err`
  rust: allow `dead_code` for never constructed bindings
  rust: relax most deny-level lints to warnings
  rust: simplify Clippy warning flags set
  rust: start supporting several compiler versions
  rust: avoid assuming a particular `bindgen` build
  rust: work around `bindgen` 0.69.0 issue
  rust: start supporting several `bindgen` versions
  rust: warn about `bindgen` versions 0.66.0 and 0.66.1
  kbuild: rust: add `rustc-version` support
  rust: support the new `-Zub-checks` flag
  docs: rust: quick-start: add section on Linux distributions

 Documentation/process/changes.rst        |   9 +-
 Documentation/rust/quick-start.rst       | 136 +++++++++++++++++------
 Makefile                                 |  31 +++---
 init/Kconfig                             |  11 +-
 lib/Kconfig.debug                        |  18 +++
 rust/Makefile                            |   4 +-
 rust/bindings/lib.rs                     |   1 +
 rust/kernel/init.rs                      |  13 +--
 rust/macros/lib.rs                       |   2 +-
 rust/uapi/lib.rs                         |   1 +
 scripts/Kconfig.include                  |   6 +
 scripts/Makefile.compiler                |   4 +
 scripts/rust_is_available.sh             |  33 +++---
 scripts/rust_is_available_bindgen_0_66.h |   2 +
 scripts/rust_is_available_test.py        |  59 ++++++----
 scripts/rustc-version.sh                 |  52 +++++++++
 16 files changed, 274 insertions(+), 108 deletions(-)
 create mode 100644 scripts/rust_is_available_bindgen_0_66.h
 create mode 100755 scripts/rustc-version.sh


base-commit: fc6e66f4696b63b8a2645a2bcea407cb04bd0666
--
2.45.2

