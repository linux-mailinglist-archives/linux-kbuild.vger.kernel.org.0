Return-Path: <linux-kbuild+bounces-5423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8EFA09223
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 14:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CAFE165A64
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 13:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCA72101B3;
	Fri, 10 Jan 2025 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhNB51C7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA0320E309;
	Fri, 10 Jan 2025 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516009; cv=none; b=aVMSXJHkQwdWDmIG2K0HOa41T91GMOfmzs2IoCndPEzZAYDLBFO2MmeLuqcZkqtIdPH0W52//yAVBnXCOa1bf6wngOSTjoYB7CKZsrKFrDBhcHcFkpcko453fL+oKvFrenBWC2Whuvwr0ocHAsZirymWm7+cfIE5fNOWY2gtYFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516009; c=relaxed/simple;
	bh=Rf9AInWA78YV1eY89zKesjFq1NrGShI+hyMES9T6hHc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mXPkpnQmvEiTjxnpvzzdlXeHOL5zROjd4jmJZyKfYmfk2d1NP/uQni1Fj+UDhQLWGzkCLCO1v8e4VHVLnVrJ495Lz3lSHnMfo9K+DDv4r5MNQ4BQU2b1RxTcP5wGem9+V9kGp9/V7TE2zU+9AYCStlM+ODFqDnK6/0tfoYbLxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhNB51C7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232C7C4CED6;
	Fri, 10 Jan 2025 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736516008;
	bh=Rf9AInWA78YV1eY89zKesjFq1NrGShI+hyMES9T6hHc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hhNB51C7DjddLT+E4r9UusYrr6/NphwiQRGZmY+XcfH75PJE9QK7I0ixQNP2km75I
	 FQTACek9PXRct5DQYmgLhPr6rRC7KW3A/dYHMN++6pDWPDH48k6JooYWBzQKlSp9fE
	 6vwulG55pyTvE0OAMyL660Ia0i8xQOw1zj1u9LaUFTKar0aN7SwJIe9O+cdA3d0EvC
	 n375WPtJamGeXXCKNRp8ArVdnzIRA2FZVRfPO7DnikjoqoCvkmCOSZRTksjwdvuMbM
	 7VjRW9aO/nRpIL74pZW9tAOxLw6iYBEjgyjBX9pMMhW/x3KKSVLCg9rX7AL7Ic6mEU
	 EEDmrc5Fv6jvw==
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
Subject: Re: [PATCH 1/3] kbuild: rust: move `-Dwarnings` handling to
 `Makefile.extrawarn`
In-Reply-To: <20240519211235.589325-1-ojeda@kernel.org> (Miguel Ojeda's
	message of "Sun, 19 May 2024 23:12:33 +0200")
References: <20240519211235.589325-1-ojeda@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 14:12:12 +0100
Message-ID: <87sepqg6dv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Miguel Ojeda <ojeda@kernel.org> writes:

> Following commit e88ca24319e4 ("kbuild: consolidate warning flags
> in scripts/Makefile.extrawarn"), move `-Dwarnings` handling into
> `Makefile.extrawarn` like C's `-Werror`.
>
> No functional change intended.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg




