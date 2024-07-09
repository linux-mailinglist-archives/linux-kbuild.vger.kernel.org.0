Return-Path: <linux-kbuild+bounces-2438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2102E92BF1D
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 18:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52A201C22B66
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 16:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFCE19E839;
	Tue,  9 Jul 2024 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PH3P7f0c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FDC19DF5C;
	Tue,  9 Jul 2024 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541207; cv=none; b=DwxayeMUlaA2FoI2DjqExFXDAqNm+LJSir+VLEdxcdcNGQqp7Bsz51i/7XJt9ZUOwHP2SLjJKHIOt2OFCJk2LxrEE/dq6Qf5NDcgPYZapzMYd05vAlQvlJ0uTKEb902uVvWpQGxB0ihzBePNCFEgCdCzk73/jjqnFE9DjIYBExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541207; c=relaxed/simple;
	bh=Thuob+LZEz9c03OnGu6BVeMz2jDrDUQ5FhyHil9JAoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXl04l4R61DCfHrP+IMzTW+XRScHbsCpYvZxOf7qsCQYZeshKfB6I/WZz1a6SlpGxILhACbO6wwGd9XsXgh/w3nq9LnLsF+c41yodJhna4DB+Mh4cpQT1mqOePy/1RJy9p8YFYtzU4A9dKOv89q+YgCbAUHj+VzAXGDgbJfNUlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PH3P7f0c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99D8C3277B;
	Tue,  9 Jul 2024 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720541207;
	bh=Thuob+LZEz9c03OnGu6BVeMz2jDrDUQ5FhyHil9JAoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PH3P7f0c07sg6E4d0AgtQVqiIVSGXnEV7f8MVwfBUeSHZ1KNQoKBlm6aA2TPBKNvn
	 hTj4cLFIlRnZLakhWBdUCDihSq2nknWMbOsMnZtf2WZ9l44P+r6VXI2TSpKpg/WVyI
	 T5wdeD6fdlQjcd/FA/AFgdGnyhpytr35OQGj90Ns4iL4wTb0oj9YUT4hfSte1wisMl
	 19tHD8d3Yp60pVRIN/tTuI4fVnYwraeKcDfCIdwugCpDpy3Yq+CudPb26+NOTpRfY1
	 +9+EPR1xoHAIVxoird+dwr/il8jFYQ33wTiMqWxbpsMY7MVjyG6h89M974WNPpAMAb
	 4I3dhSF7eZRgg==
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
	Finn Behrens <me@kloenk.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 05/13] rust: simplify Clippy warning flags set
Date: Tue,  9 Jul 2024 18:06:00 +0200
Message-ID: <20240709160615.998336-6-ojeda@kernel.org>
In-Reply-To: <20240709160615.998336-1-ojeda@kernel.org>
References: <20240709160615.998336-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Clippy lint groups that we enable, except `correctness`, have a
default `warn` level, thus they may be removed now that we relaxed all
lints to `warn`.

Moreover, Clippy provides an `all` lint group that covers the groups
we enable by default. Thus just use `all` instead -- the only change is
that, if Clippy introduces a new lint group or splits an existing one,
we will cover that one automatically.

In addition, `let_unit_value` is in `style` since Rust 1.62.0, thus it
does not need to be enabled manually.

Reviewed-by: Finn Behrens <me@kloenk.dev>
Tested-by: Benno Lossin <benno.lossin@proton.me>
Tested-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 7ea526814fdb..9044fdb9adb1 100644
--- a/Makefile
+++ b/Makefile
@@ -467,10 +467,8 @@ export rust_common_flags := --edition=2021 \
 			    -Wunreachable_pub \
 			    -Wmissing_docs \
 			    -Wrustdoc::missing_crate_level_docs \
-			    -Wclippy::correctness -Wclippy::style \
-			    -Wclippy::suspicious -Wclippy::complexity \
-			    -Wclippy::perf \
-			    -Wclippy::let_unit_value -Wclippy::mut_mut \
+			    -Wclippy::all \
+			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
 			    -Wclippy::needless_continue \
 			    -Wclippy::no_mangle_with_rust_abi \
-- 
2.45.2


