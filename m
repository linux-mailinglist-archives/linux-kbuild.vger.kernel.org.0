Return-Path: <linux-kbuild+bounces-5422-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA6A09221
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 14:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E758188E5E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 13:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC87210193;
	Fri, 10 Jan 2025 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDJ0VkMp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E949820FAA2;
	Fri, 10 Jan 2025 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516005; cv=none; b=MCJ9O4Y1GmnnVqN8rbsy4MILmEonRm28ZnkXlLLgBD11X++uQF/j7aPAq7d7eV6l3c09gx/jvfKQcy5mpExfuLlbHbvVoLmK/MVvd6tVA2MgNglDgidoLik0NqJs3JbP1pumNMc6c2ySEQo3UpzQAbRt1zWVxQa1BTOIVswRsdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516005; c=relaxed/simple;
	bh=silqge2DVCwuHEb9M5/ClOaRGQ/9d3hVmjF8uWto/4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lPMo3LyuNJzZ7khWnVcVjdi1/M+wqSa0U3jLKShEyuB4gDp6FXwX2C6YjTMqlqSD5TFaZwqM+SJnAp9v5fuY/q4QlJHIAbu1hvuSi0g9m4p9FoBB/Eo7SEpv0w/ms/97I9/dctp67H7Yua3FYF4nIuSDFZNkoU+oSJhw/9WElLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDJ0VkMp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0022C4CED6;
	Fri, 10 Jan 2025 13:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736516004;
	bh=silqge2DVCwuHEb9M5/ClOaRGQ/9d3hVmjF8uWto/4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rDJ0VkMpTmy0mPhpS4jWaav1GSyu1S8p3AortkUviOnwtui/0CuSnR3rC0sQxeAdL
	 eljNAXc/vQxLmMxprI5x6Ei8tWE2d7aEGw73yoaR4xTybJwsVAYe7j3QXINFnrLghv
	 YVbAdKUlCPL4keivMOVC5XIo6m26AUMqf4QhUbm7KNtbvwHVcyQPgoUqcAG0lOjKEv
	 yL59bSyLd1hCuQWURltyrOx0ifkczFd84yB1pDft7/G754DAQJUJcF7VEB0FbEz6Pu
	 ZsDZcR6aWCItP50biYMAXH2zIcFdORvh0VGJEEzvVDwRJwcxkVKlNNhiTH4HQddXps
	 kuqgfdV6Dsa8w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,  Wedson Almeida Filho
 <wedsonaf@gmail.com>,  Alex Gaynor <alex.gaynor@gmail.com>,  Nathan
 Chancellor <nathan@kernel.org>,  Nicolas Schier <nicolas@fjasle.eu>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@samsung.com>,
  Alice Ryhl <aliceryhl@google.com>,  linux-kbuild@vger.kernel.org,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,
  patches@lists.linux.dev
Subject: Re: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust
 targets
In-Reply-To: <20240519211235.589325-2-ojeda@kernel.org> (Miguel Ojeda's
	message of "Sun, 19 May 2024 23:12:34 +0200")
References: <20240519211235.589325-1-ojeda@kernel.org>
	<20240519211235.589325-2-ojeda@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 14:27:29 +0100
Message-ID: <87jzb2g5oe.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Miguel Ojeda <ojeda@kernel.org> writes:

> Make all Rust code (i.e. not just kernel code) respect `CONFIG_WERROR`,
> so that we keep everything warning clean.
>
> In particular, this affects targets in `rust/` (`RUSTDOC H`, `RUSTC TL`,
> `RUSTDOC T`, `RUSTC T` and `RUSTC P`), plus host programs and any others
> we may add later.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



