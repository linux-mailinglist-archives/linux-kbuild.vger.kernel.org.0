Return-Path: <linux-kbuild+bounces-1891-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBC28C96B4
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 23:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95947280E83
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 21:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C0B7317D;
	Sun, 19 May 2024 21:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RB5Hff15"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736CA26AEC;
	Sun, 19 May 2024 21:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716153176; cv=none; b=Xj6Y2Znx7Y9QSwp07e36yIr/twIxYOZDMEWGK/wg3+TxKzCslTjdDQ/GmTakl2PDtN27PmR1FqH3dZGQvehW8jUx27/3e5SITI55yEDZurmV3ySKvFrqoNXe26cgcqUN/6F2PF1q5ehKDI48NfYwmGLhckRQ/D8qHWTl2AnDGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716153176; c=relaxed/simple;
	bh=ycHchcNNkPJYHuh6grxXiGPIJUsXEsvkI6+Ndfvc6L0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKBW3G7TsT4SawD8CtvbFfBhmajcjfs8Vleg/wggEdYsGE1+p9K0ggPfJNtGagKnb1kPFHC7omP3fqJUdp7YItXLu1i4L+ttu/nLrZTrfcSgUZVDO9LlMYlUDLbKqAVrhyMd6Z0KTrxQVAIcTyGypBEA0ZHTngEpenIcq/PVksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RB5Hff15; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC64C32781;
	Sun, 19 May 2024 21:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716153176;
	bh=ycHchcNNkPJYHuh6grxXiGPIJUsXEsvkI6+Ndfvc6L0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RB5Hff15TXv+xZ+4FoMJHqq91r+V9dYXpxdjHbBAOPgvPgIlH5dhy5OifIA9U6LQO
	 uec6kb2dypXp42GiUWluk7mqoo+a+7PSNIFhxzb6tOlxjhSkp4Amcwm0KG7WfFXaJG
	 DQbuETZs/Qvxxf4KI95TjX5CqMms8aN+RAla9DoH83c8A5HDU3H26qF2eGBCCFmHe1
	 e6RcXIWt7hZ2099tnpps2TYnbFyXZ9Zk3C1l8x2rkAKQ2XacQO8LiLDDNVQr0+QLJX
	 w60rOaMK0THM1SvctabMwFtvCV/C9FyQfEApmQewgq0N/w/z+gSv1E0zQYGXjnAlhx
	 OdTijlbyczy+A==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 3/3] kbuild: rust: support `W=e` for Rust
Date: Sun, 19 May 2024 23:12:35 +0200
Message-ID: <20240519211235.589325-3-ojeda@kernel.org>
In-Reply-To: <20240519211235.589325-1-ojeda@kernel.org>
References: <20240519211235.589325-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With `W=e`, kernel C targets error out on warnings.

Add support for the same feature for Rust code, but take the opportunity
to apply it for every Rust target (i.e. not just kernel code), so that
it behaves like having set `CONFIG_WERROR`.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 990890821889..214b5edce4f2 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -206,5 +206,6 @@ endif
 ifneq ($(findstring e, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Werror
+rust_common_flags += -Dwarnings
 
 endif
-- 
2.45.1


