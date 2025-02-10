Return-Path: <linux-kbuild+bounces-5694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FCCA2EE81
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 14:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C261A3A995F
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 13:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE5622FAE6;
	Mon, 10 Feb 2025 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWMpaFlt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98352221DA9;
	Mon, 10 Feb 2025 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194607; cv=none; b=TehNJ1ufG6o5XPe9G9WeI2Mf8+NUnJSS7ys7SUxC93OqW+uImZDoDJwmTtqhr+GQEmUBErhgMUCgl6IbibSp1/bOz7iqbRFfUNT5zgf3IQH7jrIywqvWWwBGFoA/sZEPuzipaBakgjaYbCroOcLA+D5ylQtRrWVGXQ4jZ63/7xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194607; c=relaxed/simple;
	bh=h771ztDzs2jfdkBrqnFiwMYhaHEI0wB9nvXB8oF9E38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CRPzpNOUexyjQ8cgDvEb0tQnTLcW7a8gGWJnMCE0CcBAvcNK/vE63VHy2M2/trc7zdsnELTRagNC6X+S5PuzqhSrUdGAD4lgDW3C591N5stTZD35yqNF2rZ2olxOU/aXaFDb/7WJcPszRd6NEKIT6x1NWIovNuqqxdu1+sfDiAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWMpaFlt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B35C4CEE9;
	Mon, 10 Feb 2025 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739194607;
	bh=h771ztDzs2jfdkBrqnFiwMYhaHEI0wB9nvXB8oF9E38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CWMpaFltvqP211df82f4cu4rTI+mZfQOXTqesEtg5rZvHpraftAlI+xmadAwUfVLD
	 lNj7HjrwJpoo0REO/yi7Rm5ptdbKGW5P6mqA+jUxDFnKMkyGXbTmaL5O7o2qa8jI0q
	 8r1xzGMYZi7+zTkMp58iYU+w/QHtcfCE+qkY+fo/Lc11XUhnW1Y1KztGNo4V0YV6AM
	 XoMkd+flj9+edhoQhW9me8NxaE0VFKx8sEWpeQe3+Q+5PUhvNSEERqkuo2iJvwJDbb
	 CNK4UhMDDabCS/+7z8hCT70f5k7GA6kxMaj6dusJywUIeDL0CUmlMcZ/ewJC5mOuJA
	 q7KKmAf8ARd7A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v5 4/5] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <20250204-module-params-v3-v5-4-bf5ec2041625@kernel.org> (Andreas
	Hindborg's message of "Tue, 04 Feb 2025 13:02:11 +0100")
References: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
	<-rai5J5j5SdFTOIxdaN3KunfUOmtwEtBUxAshbqeA7fJOzy1QRyUJGwIJVz-QEfw8NGmvoMsrxFSh_1Q39glYQ==@protonmail.internalid>
	<20250204-module-params-v3-v5-4-bf5ec2041625@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Feb 2025 14:36:32 +0100
Message-ID: <87bjv9j50f.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Andreas Hindborg" <a.hindborg@kernel.org> writes:

> Add the trait `ParseInt` for parsing string representations of integers
> where the string representations are optionally prefixed by a radix
> specifier. Implement the trait for the primitive integer types.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---

There is a bug in `ParseInt::from_str` that prevents parsing the string
"0" to zero. Will fix for next version.


Best regards,
Andreas Hindborg



