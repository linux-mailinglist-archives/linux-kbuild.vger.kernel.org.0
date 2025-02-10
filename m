Return-Path: <linux-kbuild+bounces-5699-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E26BA2F49A
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 18:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78B961889A59
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 17:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D7C24FC16;
	Mon, 10 Feb 2025 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="jdYuO2hG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406E62500BA;
	Mon, 10 Feb 2025 17:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207067; cv=none; b=GqMQBSifVAUrFMKaTsQJIz/53X7pbEjCgRB+Zs/cMmaxFEUjKCMdLL8OMaXQEvq3KwHRjZMLsfXD+E0eW3oyHerBQYpZbzMc9v5n9WFwAudP7Cqwp+rdG8mzWvoSo+gwT7/CV7oHI/f0bZ8OTtEzjXkeYjz5Ljqib8B8c8irXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207067; c=relaxed/simple;
	bh=5VAiCu9wsbnHuDb91xBNptjwUNAtJkr4ewb+2CdrpF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jkGqfnHnmdFpqsLatlR/U9h7OPcj783IobAJTAEFEgCFAUG5rirfFCoJ/QcBZ5wac+kGjOaZIrmlztvwx/QYf+HHO6Zjypf/Kf4V8+vX7ziD2AiMOC0gDhhrRcOcXfA+U+3wd1aKd2yPu29sA1Q7Vz6QGEmZfKWst/rp8b6TFsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=jdYuO2hG; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1739207064; bh=5VAiCu9wsbnHuDb91xBNptjwUNAtJkr4ewb+2CdrpF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jdYuO2hGhDTcdQKHK8/9grPS1mwoWTu786nKEmDrhgHW2Di0MGIN6zOrh4/TDYSVg
	 7R+wdKMiV1irQ86ZcXvZpluCO0bxtkZDkrXPLRTrIGp0wdgmh8Ni3eTW90+/ugLc5s
	 5EwprOknit5+ZtGbGdOKPegpDsQxwh8VkrJ2B1j0=
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Nathan
 Chancellor <nathan@kernel.org>,  Nicolas Schier <nicolas@fjasle.eu>,
  linux-kbuild@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Danilo Krummrich <dakr@kernel.org>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  patches@lists.linux.dev
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
In-Reply-To: <20250210164245.282886-1-ojeda@kernel.org> (Miguel Ojeda's
	message of "Mon, 10 Feb 2025 17:42:45 +0100")
References: <20250210164245.282886-1-ojeda@kernel.org>
Date: Mon, 10 Feb 2025 18:04:22 +0100
Message-ID: <87y0ydafzd.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Miguel Ojeda <ojeda@kernel.org> writes:

> Introduce `rustc-min-version` support function that mimics
> `{gcc,clang}-min-version` ones, following commit 88b61e3bff93
> ("Makefile.compiler: replace cc-ifversion with compiler-specific macros").
>
> In addition, use it in the first use case we have in the kernel (which
> was done independently to minimize the changes needed for the fix).
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Fiona Behrens <me@Kloenk.dev>


