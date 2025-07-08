Return-Path: <linux-kbuild+bounces-7926-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DFBAFC64A
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 10:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EEF31AA0B1B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 08:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF652BE02F;
	Tue,  8 Jul 2025 08:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXo5qQ0h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B0C1A5BB7;
	Tue,  8 Jul 2025 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751964923; cv=none; b=YdRvQTKgB4iR/VQpOYVm2LClUr0nVo4WfGIDkdoVrO01RfceHfkBnHE9WVreieNgaxPqZ+opr1hrc23wufGZ83q5+p88AVmUadutnmJy1wFovi8oRr8kyxBc5X6Xg1oTyZrU7kf+hWmqz60tkQouYYnOiuHxFfkg+Fig/9vM71s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751964923; c=relaxed/simple;
	bh=iHOMGm/QJSF1F7OpYnhZk9VaTNli6N2XPKdp7QttwHk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=m0Bu4jX6FzTQGhI+nBvE8L4cQTK+EVB/QBPcV47ksADbrLkGo6VHoGDXhwAohzrHFsXER4vcM+24oaQoEbFnAYYY+k+wsuAAUSw9+3rputdI6d8a04XXE7eRNLVrqm0QQzcywzsGEmeHmMP/G/uhYrACDecIKY7KGhG3imQnn2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXo5qQ0h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4278AC4CEED;
	Tue,  8 Jul 2025 08:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964922;
	bh=iHOMGm/QJSF1F7OpYnhZk9VaTNli6N2XPKdp7QttwHk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=UXo5qQ0hmiWbVmlCGWV+MA2xroo8/O9bPvgaZn4RyfgdmOeBAcKUo9WDewY6QmnH7
	 kZ+KnSJe8VCH6Y7C5t2w3wICMu1pz4tfaY4fzwFI8nOFtzUOd2+XFFk9Frhi4YWQDN
	 yVX589pNLvwTpqTjbtJWXIINSGa3dsxxrsxaQ7maX/AwfEnRniUxE3j1pPQiDNQvLw
	 Rz/pTxubNbDU/RG3alYtyldw1yZv9djBG2NuTCYWq6H5qOH+ChOHdpUt29v9rs+Fih
	 cGPI5AVqpTUauwbMKYSR2VOab8gmVc6zE65EXcgIrHTDSeAYIkjLPpkaaB1WfWfxcb
	 sPgfhhOfO4J+g==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 10:55:16 +0200
Message-Id: <DB6JQBNDFOFC.2XNUIMTFVE2XT@kernel.org>
Subject: Re: [PATCH v15 2/7] rust: str: add radix prefixed integer parsing
 functions
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-2-c1f4269a57b9@kernel.org>
In-Reply-To: <20250707-module-params-v3-v15-2-c1f4269a57b9@kernel.org>

On Mon Jul 7, 2025 at 3:29 PM CEST, Andreas Hindborg wrote:
> Add the trait `ParseInt` for parsing string representations of integers
> where the string representations are optionally prefixed by a radix
> specifier. Implement the trait for the primitive integer types.
>
> Tested-by: Daniel Gomez <da.gomez@samsung.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/str.rs           |   2 +
>  rust/kernel/str/parse_int.rs | 148 +++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 150 insertions(+)

