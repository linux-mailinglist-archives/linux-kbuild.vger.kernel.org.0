Return-Path: <linux-kbuild+bounces-7993-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D927B02BC6
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 18:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239141C22AAF
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 16:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380A421B9F0;
	Sat, 12 Jul 2025 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEjfbmOw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070BC15747D;
	Sat, 12 Jul 2025 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752336081; cv=none; b=SWD936Y0hPlZMkDJM9CBAHEG21YbdOvs5t8eNQp06N2j9uUSfPBVYovyO+KVzCW52oXdKU0I/ibwaCO4W63o5vboxpMWfqH1bqjODLapLGIWF2W/6jsd6ty8DdOMJNb0uZWug8c6Btx6eiNf0pKDqPkJ2Z0/pUYHk0KIPZIl17k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752336081; c=relaxed/simple;
	bh=6f3qpOYDQlFpv9m9e57Bcutd5dvqOERVpMkcf8P0EzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OZfHunEUw49xwHeiQA/PtPfeM2Uajn51pZ1zHrvkFWaWQWHg8f/QxeRKXNEfJIXGyca/7mj0S+zi3INOCGpm3HF3HrobYj/lh9Vvb0n+lbOa3LPq31hz0JYc17w0zzXLrO0XSo8SgdcNQHZ6uhvGgZPUncsWuzCQeORKqhkKJ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEjfbmOw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622B3C4CEEF;
	Sat, 12 Jul 2025 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752336080;
	bh=6f3qpOYDQlFpv9m9e57Bcutd5dvqOERVpMkcf8P0EzU=;
	h=From:To:Cc:Subject:Date:From;
	b=sEjfbmOwWIkTb9R9ngBOmWN99HmpQ577877gKDlqb4ensOogXVUTrOWwNb5KBqHpv
	 m/9Z0GJjiV2DVykyhgqMGvzOZ4EiUI7CwgV4cvsCdMFvdaRyckNcu3ojkPrYDMaZ6O
	 Z00Bw3UGWJMCNDD+D2zuDEKwWYns9I473prLqmur53T1glOtvljrUL0mKe9EkByqok
	 zPL1HL/gmEwU+bNHoz5ynP8SJ3PIjUXFMpmSk6ed2Xs79pqXaRnKS50T4MKQ+rxWnd
	 8R3HBbOttJftVwkF9vDLelDDJ2kDnSLX4OlN9UExlViqI3dK/kpbDZxZlT2OQrgVQr
	 YuTwxBlM8oxrw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 0/2] Rust fixes for the upcoming 1.89 release
Date: Sat, 12 Jul 2025 18:01:01 +0200
Message-ID: <20250712160103.1244945-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A couple fixes for the upcoming 1.89.0 release, currently in beta.

With this, current nightly (1.90) gets also clean.

Miguel Ojeda (2):
  objtool/rust: add one more `noreturn` Rust function for Rust 1.89.0
  rust: use `#[used(compiler)]` to fix build and `modpost` with Rust >=
    1.89.0

 rust/Makefile           |  1 +
 rust/kernel/firmware.rs |  2 +-
 rust/kernel/kunit.rs    |  2 +-
 rust/kernel/lib.rs      |  3 +++
 rust/macros/module.rs   | 10 +++++-----
 scripts/Makefile.build  |  3 ++-
 tools/objtool/check.c   |  1 +
 7 files changed, 14 insertions(+), 8 deletions(-)


base-commit: fe49aae0fcb348b656bbde2eb1d1c75d8a1a5c3c
--
2.50.1

