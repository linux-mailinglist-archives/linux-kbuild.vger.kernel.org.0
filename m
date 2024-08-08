Return-Path: <linux-kbuild+bounces-2910-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A8A94C6CF
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 00:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E7E1C21750
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 22:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7169815D5C1;
	Thu,  8 Aug 2024 22:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAUQAX9m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AAA15820F;
	Thu,  8 Aug 2024 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155117; cv=none; b=HAa/ZhVRJvQrC59aeVGlRkfsIQX/1P3WeQpAYonaC2pZO/3A1geNYEwhQRXZq0OXRri4xjrBy1CvFBfxf0tHmPBfFTJH/HtQrJW/f638H5+zFiSqOz9viSRGuiG9Ki/2Zou05QSZdT0ZizU8X6ZoJ2ok4ZO80A7a96EarOEdGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155117; c=relaxed/simple;
	bh=8cwTGDcOJUK8ayBA2CjvTAILOfKtt8rJkL2q5JOGIRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8wuIYDyB2kns6Zp4g0MQBzrbhjj/lSD0iIDmhuo/imWuGftdO5v2Jdc1nNt9rpZLeuTiQYWnlhSQhOMQp8EFrLJ4TgEXfoi3tADR2+6Fi4djph0xYly61AMWOvxYE9o4MUQopjdDgKXkz9SvDdLcqz/YPU0Y2N1b3ronLKN7RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAUQAX9m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C9BC32782;
	Thu,  8 Aug 2024 22:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723155116;
	bh=8cwTGDcOJUK8ayBA2CjvTAILOfKtt8rJkL2q5JOGIRY=;
	h=From:To:Cc:Subject:Date:From;
	b=eAUQAX9mI81rc0GGlJ9gUsCcOkRC+8zAd1hgNKn/0LYHf3Tp49SXM/EZyCxGE/s9G
	 Ay3uMNf6Bk5kXIoKyOHiFF4A4hesGM5R6EzxR1XBAFDnSYY9JllmzEtc3ReS0peeO1
	 aTFixnDdqqHr0M6SuCNihYAKrFbzNLYbJ0ezzklM26+HlwrpGpGFFYVGyvcf5GBobZ
	 jAyx18wKxzzf/aqG+Gl6GKJOR7k8AZuIEOzuw41gEPYUo8lCXRh9/4osVdf5TSySbh
	 KUdbjekrXSX1O7cQ4XVTnOu36CAqbW4t3/FHUvkaTp391WFMhLSsJn4pUZccqVVpTo
	 h0giCSSq4SC8g==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 0/6] kbuild: rust: add `RUSTC_VERSION` and reconfig/rebuild support
Date: Fri,  9 Aug 2024 00:11:32 +0200
Message-ID: <20240808221138.873750-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series introduces `RUSTC_VERSION` support, which is needed for
several patch series getting upstreamed, and it will be increasingly
useful as we now support several Rust compiler (and `bindgen`) versions.
Later on, we will likely introduce other macros, such as
`rustc-min-version`.

In addition, the series introduces automatic reconfiguration and rebuild
based on `RUSTC_VERSION_TEXT`, to mimic the C side, which is also good
to have now that we support several versions.

It is based on top of the current `rust-fixes`, since there are a couple
pending changes to the version text Kconfig symbols that will be sent to
Linus soon for an -rc.

Cheers,
Miguel

Miguel Ojeda (6):
  kbuild: rust: add `CONFIG_RUSTC_VERSION`
  kbuild: rust: make command for `RUSTC_VERSION_TEXT` closer to the `CC`
    one
  kbuild: rust: re-run Kconfig if the version text changes
  kbuild: rust: rebuild if the version text changes
  kbuild: rust: replace proc macros dependency on `core.o` with the
    version text
  docs: rust: include other expressions in conditional compilation
    section

 Documentation/rust/general-information.rst |  8 +++++++
 Makefile                                   |  5 +++--
 init/Kconfig                               | 11 ++++++++-
 rust/Makefile                              |  8 +++----
 scripts/rustc-version.sh                   | 26 ++++++++++++++++++++++
 5 files changed, 51 insertions(+), 7 deletions(-)
 create mode 100755 scripts/rustc-version.sh


base-commit: fe992163575b187405899c5abaad8ef6fb828ff6
--
2.46.0

