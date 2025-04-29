Return-Path: <linux-kbuild+bounces-6798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B7AA127B
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 18:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEF2A4C01B5
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 16:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0FD2512C6;
	Tue, 29 Apr 2025 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbVoZggt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9935A24A047;
	Tue, 29 Apr 2025 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945577; cv=none; b=cJ8NHcJdkzsyiMjoPySGdbDP1HiVADqUJpsHfLZsYpMj8YHIjIcVuxe1T4tXVR3A8rQ1OhgOI4uMj9z/zoblH231q/ZdVr9bEeLDSSXzJ2KG/b04YaeSsUTl6FB6/oIE80w/suqrmIbJUXPKE2M0EBxMUarGjpOuqKkFd3FIHuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945577; c=relaxed/simple;
	bh=aOnvrbKGCd6oZtAZ+WNZIUoYtPamcTbmixwVmPQzSX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wxif/6/eZWGMiASOnQe5G0Apqk8Ae7GH8I2Cm3mrrbJkQEyXf2OE/LexTVmODh1RJrrJP4BxZYtqtgdkHE2ELSntStONpkcr14zdFMqqbYJS9T+E1wqRYvlxG3M6/sDoQoVpv1ANOeMtDCGRXc/3pUnwG/KgTkf2Oh1ARWypkf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbVoZggt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B93FC4CEE9;
	Tue, 29 Apr 2025 16:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945577;
	bh=aOnvrbKGCd6oZtAZ+WNZIUoYtPamcTbmixwVmPQzSX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbVoZggtxb56N/IORSBXBpTc4lh3NOkTRToTPMaFsJYwTRlD6ghYVlPEkfnoLP4ao
	 v0PKVd3FFlFCiNH2jiXzIgej3wk9uJs3BckkbVwzlW04KXAtCxtJQGQRi1/v4RSivc
	 h3OIAB2KF8wKt5siG65a4l0yoV6ov+R2FOXR2UhdK43FeZT9e6FdWM5TIiwbarbSEX
	 CuUwTebiDJVI1nMFcGHpMben6YlRjiSOd8oswG6xR4NaNeQSq2JRqtI9z7K/erTp3j
	 Tp/HY8S4mwIaDeoGWfHbPb7+NIl3wkgTTSK1x8nae3kxhpVjqfs88qCb5DYUq5FfZm
	 LzmD9Q+O8EHtg==
Date: Tue, 29 Apr 2025 09:52:54 -0700
From: Kees Cook <kees@kernel.org>
To: Nicolas Schier <n.schier@avm.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] randstruct: Rebuild completely if randstruct.seed changes
Message-ID: <202504290951.8C3D7C7653@keescook>
References: <20250429-rebuild-on-randstruct-seed-changes-v1-1-16a74fe65538@avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-rebuild-on-randstruct-seed-changes-v1-1-16a74fe65538@avm.de>

On Tue, Apr 29, 2025 at 02:59:13PM +0200, Nicolas Schier wrote:
> Include generated/randstruct_hash.h in linux/compiler-version.h to force
> a complete rebuild if CONFIG_RANDSTRUCT is enabled and randstruct.seed
> changes.
> 
> Removal or change of scripts/basic/randstruct.seed leads to a remake of
> generated/randstruct_hash.h.  As linux/compiler-version.h is a
> hard-coded include for every kbuild induced compilation, conditionally
> adding generated/randstruct_hash.h there adds it as build-dependency to
> each object file.

This does technically work, but this feels like the wrong solution.
Also, this won't work for another case where I need a similar thing: if
the .scl file for the integer sanitizer changes, we need to do the same
full rebuild, and that's not a C file.

I think we need to explicitly inject something into fixdep...

-- 
Kees Cook

