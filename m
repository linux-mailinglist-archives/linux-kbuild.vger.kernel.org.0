Return-Path: <linux-kbuild+bounces-7553-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD83ADF727
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 21:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FAD63AB6FE
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 19:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681F6211A2A;
	Wed, 18 Jun 2025 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3VipRQm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732D16B3B7;
	Wed, 18 Jun 2025 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276137; cv=none; b=t/8IpKt/nPx47KiDCFuUt2GWeIfOdG14opMahuSlrUC/LeAtj9HwzgBhQXOVNckx2oqH3M7o5aSPhVCFxXs6Zzrc+eXpKZhnotn9jhUHWLID9blrppSa/NChTx2NVLM9m8imVQyWjpd46VDMrPnJ4iZbvkls44RXSxLG1k54ho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276137; c=relaxed/simple;
	bh=FZzI6adUeBKtCN+hzD8CtOSpXbsit36US1Vf9DPcRbA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=f/LduGVGuXAAk8dQTO7qgV5JLnNs6PTbqX5B9scZWnE9lroy+8sOQH4eyvrz06Dw5nMb8fxSS9kUrlMf2UAW6O6AZT2oBrVoh/f8QUnQCnPELIU+qK7YE27QpbL4NEvIIPWVFQ+koNsZV3JL+TNWsxXjM5x+sV2XiH6dP22dLXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3VipRQm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46789C4CEE7;
	Wed, 18 Jun 2025 19:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750276136;
	bh=FZzI6adUeBKtCN+hzD8CtOSpXbsit36US1Vf9DPcRbA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=t3VipRQmRHZ0SY2shy6+Z2DyfeCr5nQC5ufVuHdyU5Ph0N/Q8B8XSlaW4GVjvBF5H
	 zt58EQHyOb7rgRQqgS77g38xj96QVVqn2tVlyJo/lnWus6bTZcWvBLuYQPGrTHCOl1
	 tHPSEvNUTU2gYqAoHB8nTqwagVRbyt66J6HwYP6jqJzi9Ko/ky3pKp3Qoy3MUrtC/c
	 gN9Y8j4o00uyYi5ymdpmAiucvaEYpIRRxW6iyDl8ogNrEInT7qI0LaNi8gQF5m0K1u
	 1EfAh5t+fqTaX+uBDcHEF649gTaAsCH1Lj0sBG9xMr46NA6JBuX9Ue7613qTU4a476
	 idbdsT8OTLXrA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 21:48:50 +0200
Message-Id: <DAPX3U7TF728.2YCGGSXQ03AQI@kernel.org>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 5/6] rust: samples: add a module parameter to the
 rust_minimal sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-5-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-5-bc219cd1a3f8@kernel.org>

On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
> Showcase the rust module parameter support by adding a module parameter t=
o
> the `rust_minimal` sample.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  samples/rust/rust_minimal.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)

