Return-Path: <linux-kbuild+bounces-2916-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A294C6DC
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 00:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DD251C21851
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 22:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5BC15F301;
	Thu,  8 Aug 2024 22:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGmtupP7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8F615EFA3;
	Thu,  8 Aug 2024 22:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155143; cv=none; b=LyYn68OO8LcuXXd+1oJrEpcHEZ9foOAts/cx8rP+iDYppOqRxH2yiRv80PYEEAMtPdW6qV5Oe7VeyL1HrOEWRTzW4diHDI2x0+P4oGzCKCBtQoJiTD6YQn9DYX8ywzG2nhIzbB9pdrk5qhsSs8JdnX8Zh0nCjmZ/AYGjXqohEHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155143; c=relaxed/simple;
	bh=Dd+AEbTggXStEdSEmha1BZG1604nKY6E7BJ1Ers8Xg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPL6kXlBDy8UfOrUQthNSJpwxERR/JbPthzFMFX27IIR8kKH5ef08H9a7FLYs/GqnUnrK8oaVTWBS/wMp/gSfAcgk5acUo/0M5byoolxurjeMWlHguRAdFOj/VEe4E+bL81VTSABvvXVpF4PM5crWaNYHyAK5rQZMt9wU8o2Ars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGmtupP7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A50C4AF0C;
	Thu,  8 Aug 2024 22:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723155143;
	bh=Dd+AEbTggXStEdSEmha1BZG1604nKY6E7BJ1Ers8Xg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SGmtupP7vC2I1Rz0y72beEuKjy7ao5c5zZ0/GBwzGdTnECfOx7ztRX6M4dcJCO+Jv
	 ZR+VFVJeENtfffM9cqyxHPOMOmY0byYitIFgeb5+ubeyklDz6kAmNjyS1YYCH5ZPtR
	 H800xsWsYxPaakivRIRWleNtUfKfc/UwpHTQTys9jEKeJPfYqgd9bOk70qvnMi4DjR
	 xMTtYAtPz0Kxu9fDZcZi7SDXbzVhvKojGx7GH1NnHv1GWByWJhHLMTE1/5JhvgPZqn
	 DtGuQ4l/dGd8H6X1ct6zCy3hzgLYtyXxDTroTYgV/uRKzHHk42rC5/Z8+9VIdmwouw
	 GwOjUEUkA+fgg==
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
Subject: [PATCH 6/6] docs: rust: include other expressions in conditional compilation section
Date: Fri,  9 Aug 2024 00:11:38 +0200
Message-ID: <20240808221138.873750-7-ojeda@kernel.org>
In-Reply-To: <20240808221138.873750-1-ojeda@kernel.org>
References: <20240808221138.873750-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand the conditional compilation section to explain how to support
other expressions, such as testing whether `RUSTC_VERSION` is at least
a given version, which requires a numerical comparison that Rust's `cfg`
predicates do not support (yet?).

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/general-information.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index e3f388ef4ee4..071c5bafd668 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -142,3 +142,11 @@ configuration:
 	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
 	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
 	#[cfg(not(CONFIG_X))]  // Disabled
+
+For other predicates that Rust's ``cfg`` does not support, e.g. expressions with
+numerical comparisons, one may define a new Kconfig symbol:
+
+.. code-block:: kconfig
+
+	config RUSTC_VERSION_MIN_107900
+		def_bool y if RUSTC_VERSION >= 107900
-- 
2.46.0


