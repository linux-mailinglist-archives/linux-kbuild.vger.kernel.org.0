Return-Path: <linux-kbuild+bounces-7784-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CA2AEDAF8
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 13:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 994F217812D
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 11:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7125225D8E8;
	Mon, 30 Jun 2025 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xr4k41UT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E70824166F;
	Mon, 30 Jun 2025 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283009; cv=none; b=avzXkjTYnqf7E0JYywR/reYH0uDUZfe25x7y+E0pXZh7hIR4cLP+s5962QYo7klEmpMHeYslq6ozPfEp5X39HdSH/lk8KGsKfvUG+lJmko644Fi3fyoavQAGYFc5UAKUHygVGWFilOuct5fVNTEbpd568/1b95P89uJP1/iLQb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283009; c=relaxed/simple;
	bh=/m9h+kdKUjWIbdWrTObJ8GmTEsk/KfT36k6zkuF2HnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CnX2wnvagMdgAIXXI4zCFp8Felufy6Epv7qq+Y0UUNIAgBapfX/RtDVL00yjUNLEdy21FqqNMv+rH3ick1QX+Ccp1fdH0c3u7H9U+GHlmf1pYIAWgg5hkYIxXxHfSOubY3yjPgTZpXsrIcCsYkQnKfGNlVnQ6qwS/tjWIqRV3X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xr4k41UT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2214AC4CEE3;
	Mon, 30 Jun 2025 11:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283008;
	bh=/m9h+kdKUjWIbdWrTObJ8GmTEsk/KfT36k6zkuF2HnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xr4k41UTlnGcwAW05zUJFvSZd3dGJ2xBg+YLOUBUq8/ZLGO8MhyrLvPj4O9wLv9Yz
	 gd0xn9RFDU0PwbbeUSeS0sKJm34yTFf5QzF1nIDd98iOuXWgetnHG3Yti3oDVgwgcS
	 BF4N/tYGLnPsRKUqjXbjlSd569MiD0G9J0jK5ckuQj0p1uySXiCxJ+2iz99HGy4oXf
	 PK8Et04oNmZsp/fpQrVv13yPnsIYgNvTqYVdsD5l1bIwg28kFjhG2ud9nPFE0tsoyz
	 +KDb8r2uhhcHHK6R113WqOz1DIK9tjamPzI3yFvZqSrMA/rm37lSUwkw8bV4kJVsvl
	 n71qH92pyW5jw==
Message-ID: <a343d3ce-a179-4c2c-a279-e2c3919a0a99@kernel.org>
Date: Mon, 30 Jun 2025 13:30:02 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/6] rust: samples: add a module parameter to the
 rust_minimal sample
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-5-bc219cd1a3f8@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250612-module-params-v3-v13-5-bc219cd1a3f8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(Sorry for being late on this one, just a minor nit below.)

On 6/12/25 3:40 PM, Andreas Hindborg wrote:
>   struct RustMinimal {
> @@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
>       fn init(_module: &'static ThisModule) -> Result<Self> {
>           pr_info!("Rust minimal sample (init)\n");
>           pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
> +        pr_info!(
> +            "test_parameter: {}\n",
> +            *module_parameters::test_parameter.get()

Can we please call it something else than get(), maybe obtain(), access() or
just ref()?

> +        );
>   
>           let mut numbers = KVec::new();
>           numbers.push(72, GFP_KERNEL)?;
> 


