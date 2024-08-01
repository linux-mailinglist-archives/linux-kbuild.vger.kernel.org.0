Return-Path: <linux-kbuild+bounces-2776-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B58945158
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 19:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D87E1F249BC
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 17:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8151B4C26;
	Thu,  1 Aug 2024 17:14:07 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9CB13BC0C;
	Thu,  1 Aug 2024 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722532447; cv=none; b=dBXVGuTA39dssXFeXUmnV8UX5LzapZH/cjF31zRU9PHVb4qMtbrkMMjS+UhiEN8cAoSGBpVvPgvdAArhiMNZ9Pfhh95oegRkiGUp92zC+brVPiZGV6+E/tC3Xv+aCnBwi6rUTkY/Xb58kHwld2GyTTfvJGhiNgLHLjBXCLwGBtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722532447; c=relaxed/simple;
	bh=IRUKwKfYd9UgSTiig/dA1l8l2KP2iEaX8/7pF03Om0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uY5SPGu8jfeRLuCdv/teWwlVIPGnoyM1fzuZETnXEqYIBfPqg2f8L32b1e3xErh+nUrnUzGVvU+dV2dr/nHVv/lCiRgfwag9sL0p9QC8PHVTyqeVwBlST8HhTnOp0ukT7ld/RWHxQatVmc//sOocFaR9Wx0hnYAjoe5dZXyAxAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D122C32786;
	Thu,  1 Aug 2024 17:14:01 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/2] Rust and the shadow call stack sanitizer
Date: Thu,  1 Aug 2024 18:13:58 +0100
Message-Id: <172253243211.1046073.16495999984147103582.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com>
References: <20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 29 Jul 2024 14:22:48 +0000, Alice Ryhl wrote:
> This patch series makes it possible to use Rust together with the shadow
> call stack sanitizer. The first patch is intended to be backported to
> ensure that people don't try to use SCS with Rust on older kernel
> versions. The second patch makes it possible to use Rust with the shadow
> call stack sanitizer.
> 
> The second patch in this series depends on the next version of [1],
> which Miguel will send soon.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] rust: SHADOW_CALL_STACK is incompatible with Rust
      https://git.kernel.org/arm64/c/f126745da817

-- 
Catalin


