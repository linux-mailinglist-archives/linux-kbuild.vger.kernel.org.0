Return-Path: <linux-kbuild+bounces-9992-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0597CCA3AB4
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 13:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD2C9303BCDE
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 12:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA4C341052;
	Thu,  4 Dec 2025 12:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crisal.io header.i=@crisal.io header.b="QWmZQmQ8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d4LUKr5P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E7A34104D;
	Thu,  4 Dec 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852578; cv=none; b=duGB1fyM/ojeaL9+mcmj1rFS6IbluqN8cKKs1qMg8263rldbTD1RneL4/6BFJvp9R02S0iimNWK/nKDEQPv/Kgz1ngWDefhtVSIYdVBczEcVacwMvEo9bKkwnrK/B+07zkDN6rGTZua0j6txVpWnC6apRxIrEMztREAHDhTq05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852578; c=relaxed/simple;
	bh=mtFU3xisnTvnZXhklY5mMAFpawHY+RH8+ZPCmrpf3Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9nkWdzFvzwzWRlGB9oS3p9FBjCYBcLh3K8StGHhXEE32jobNZaHNgWhuUCEY7YsJVoJOJojaHln68dIcSPthJ39yqnKZijAhj43LJ4kKdb8PnX1cpx0vhWE4CgQppRwB9RUSl6pJ9a1i2Tj98iqOTUnPBBjPtneAYEVJi1pQAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crisal.io; spf=pass smtp.mailfrom=crisal.io; dkim=pass (2048-bit key) header.d=crisal.io header.i=@crisal.io header.b=QWmZQmQ8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d4LUKr5P; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crisal.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crisal.io
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 991E11400224;
	Thu,  4 Dec 2025 07:49:35 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 04 Dec 2025 07:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crisal.io; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764852575;
	 x=1764938975; bh=bT7FHjsbQ8DOCUyp+kexyJRmQz7YtubohaLbP21dgus=; b=
	QWmZQmQ8drjAUhtM3EKvi9IGmEYwlgKHmD6DEeMNgU1cDITtkm36or/GKRANaoSO
	ldYx9isB/WQ4SZXIerr5uQo+UxQYmmh/PJG6AXetuvXIoH07o0SDg4YUkdn0yR4+
	1OnQpHI2je4URQ40n6B3dLaoWnB/o008x8JaKfDUn7TrJRCDLtewnPFyBmKSUFS2
	ZOQl/zlrwFYab0Ve67HfSmoS29BlXzSWYaQxBMtlFC8jKw/dfjQ/wxKFGp4v4Pay
	NWU7TQLKGT8B+wsa3s/bSqkMwwCqbKZHhIaS3Q5DNDEb3foa0oWd7G5sRREhKkMZ
	8dq1SFoEIz0kWvxuRfalVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764852575; x=
	1764938975; bh=bT7FHjsbQ8DOCUyp+kexyJRmQz7YtubohaLbP21dgus=; b=d
	4LUKr5Pp/AGMgk3O3ccRP4nFv4Io7xt6Yczuf7gA4oWo1kiWLWr7PQ9kDT/pG0Pk
	HM2MWOGHqfjtswp8SVvu0LG4Nb4fRm21E+/iG6elpHLVYM8YIXGb4G8ntt9S24WB
	XTgi15cJAKr+QS/7EdUStOb1gOb1emBxGgjWRb7F+rlsKOEDvn1pd8KepUyyLoro
	4C/XBFbXQM6IpoyFHLAaGANyvlxFW3ZduI3qT06GMX9VwaiV7Z6LXEiN87/bA9S2
	MeCDqCiAWvyOSQ0EnG197hSFQqQwHugp/S2JBAD5DeQRwPuW/rrltrlMBoLAE6TP
	Xly7EjxYU5YgnWddZy0bQ==
X-ME-Sender: <xms:XoMxaftIg9lrhKoIsI9yLzV99-PYFh6m5AK3y1GkUt051fQ6pfxc0g>
    <xme:XoMxaXZPsINg-X6_SpHYviYJ4t0xaxgJwE-o_NHkbfsQGUfZziOxUMo4omiiY9762
    AKGPXJ6TVr58smEizAy1cVxbzZwwD5w6L-8ZcKkVfvrFEvHkf7azUU>
X-ME-Received: <xmr:XoMxabsOsdheTnf3G4xTEk0PswJW9moz6ytx3ZYLJYQg5IdWKx_sr3rOm2qP-iF00UcAUJGcxEF1ndCSM3PnF3iYfM1mzW1o_oI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epkfffgggfuffvvehfhfgjtgfgsehtkeertddtudejnecuhfhrohhmpefgmhhilhhiohcu
    vehosghoshculmhlvhgrrhgviicuoegvmhhilhhiohestghrihhsrghlrdhioheqnecugg
    ftrfgrthhtvghrnhepheeuieejvefhkeekffeklefhfeevteetueethedvudelieeuveev
    ffejfefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpughotghsrdhrshenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegvmhhilhhi
    ohestghrihhsrghlrdhiohdpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtohepsghouhgrnhhtohesiihohhhordgtohhmpdhrtghpthhtoheprghrthhh
    uhhrrdgtohhhvghnsegvmhgsvggtohhsmhdrtghomhdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehjohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhgpdhrtg
    hpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhdr
    fhgvnhhgsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:XoMxaWA_0XGjWUyj_omVPnW4Dam6xBxCotJNmgzJmPJ3qtDD2osQjg>
    <xmx:XoMxaaMeFf-Cwgb1A2pglnMdApsgjs1BngwagP-9o2gnEr-PzItVWg>
    <xmx:XoMxaY6-KS1B4Ffc8pO7e9EuUPJVxSPDC1857Pwst1BJTdjw6ODvrg>
    <xmx:XoMxac3U4poM50Z6o2Wd1oal5GRpfXfVWeXWEVSl9yFtxXjBu7b5kg>
    <xmx:X4Mxae_ro2UZcjWQsPKA-TMcEQ9dSlR2xZk6FPrIbaiE5NxqtEzhotki>
Feedback-ID: i2e3c46c1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 07:49:31 -0500 (EST)
Message-ID: <dd5856a8-e120-4884-8828-9d0c9edc60f0@crisal.io>
Date: Thu, 4 Dec 2025 13:49:28 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Antoni Boucher <bouanto@zoho.com>,
 Arthur Cohen <arthur.cohen@embecosm.com>, Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Josh Triplett <josh@joshtriplett.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
 <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Autocrypt: addr=emilio@crisal.io;
 keydata= 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
In-Reply-To: <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/4/25 12:57 PM, Miguel Ojeda wrote:
> On Thu, Dec 4, 2025 at 12:11 PM Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> Right. Earlier I also proposed using libclang to parse the C header and
>> inject that. This might be a little simpler, in that..
> 
> Yeah, that would be closer to the `bindgen` route in that `libclang`
> gets already involved.

Yeah, so... there are existing tools (c2rust [0] being the actively 
maintained one IIUC) that in theory could do something like that 
(translate the bodies of the functions from C to Rust so that rustc 
could consume them directly rather than via LLVM LTO).

I think the intended use case is more "translate a whole C project into 
rust", but it could be interesting to test how well / poorly it performs 
with the kernel helpers / with a single header translated to Rust.

I personally haven't tried it because for work I need to deal with C++, 
which means that automatic translation to Rust is a lot harder / 
probably impossible in general. So for Firefox we end up relying on 
bindgen + cross-language LTO for this kind of thing, and it works well 
for us.

If I'm understanding correctly, it seems the kernel needs this extra bit 
of help (__always_inline) to push LLVM to inline C functions into rust, 
which is a bit unfortunate... But this approach seems sensible to me, 
for now at least.

FWIW Bindgen recently gained an option to generate inline functions [1], 
which could help avoid at least the bindgen ifdef in the patch series?

Anyways, it might be interesting to give c2rust a go on the kernel 
helpers if nobody has done so, and see how well / poorly it works in 
practice? Of course probably introducing a new dependency would be kind 
of a pain, but could be a good data point for pushing into adding 
something like it built into rustc...

Thanks,
  -- Emilio

[0]: https://github.com/immunant/c2rust
[1]: 
https://docs.rs/bindgen/latest/bindgen/struct.Builder.html#method.generate_inline_functions

