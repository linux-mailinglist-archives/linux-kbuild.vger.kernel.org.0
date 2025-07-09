Return-Path: <linux-kbuild+bounces-7944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C3AAFE355
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 10:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6813C3B8AA6
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 08:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195E4280CC8;
	Wed,  9 Jul 2025 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qS7iiP+j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDC28031C;
	Wed,  9 Jul 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752051427; cv=none; b=h/188yXssiUYjQpX7DClTK4Z5Ag/dX4SeHPdKza2LnzFNBS27Z6kEh3spwVEXlWKI48lr5MuftYrmjWkFtgKUoQoxT1TAbLpk48jssks3yyPOZehLIilcqBwzD9NnZq3ueqdImUzY0Os/6RjS1LhhD0prPLX7g17MX/Vs9Z6nIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752051427; c=relaxed/simple;
	bh=2BSarhHtE6GcWhGBbHI94MeCDx8b0rV3Swg56q7qjeA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fLV62UT8jKnQIXx9YpSshbXU7UKPkFY75Qm0Wz4ASEoJ+mePzFEI08MOTC64LWO3AdyywX6iP5zCKsFJVnI9Qt09p0b4e3E6LCxKhPcQQyrk2Q5BLZHpw5Y75qQfGTg1w2qkm3JnwZAMmqU2bRFPMT7ObmfimaZti0i9KgjvqPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qS7iiP+j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8C0C4CEF0;
	Wed,  9 Jul 2025 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752051426;
	bh=2BSarhHtE6GcWhGBbHI94MeCDx8b0rV3Swg56q7qjeA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qS7iiP+jT9vkogTOeAPZNKTAholTL15z65delebDh/e9P9GBQyhD5x2snK947D410
	 vQHZOW71HBjwoQhrJ7X7ClT7Po/2ceeobJcWeWfpPxy2GU/UdGgnWziSB+tbRHd8OH
	 XGDqmip+QceUX/GmOgeU+BpBv0xXGJPhRzxnzxs64UXvVUKS0AJlYShJUCkqnjCn7D
	 eybh7KJTT14unqLbSEYUCNMfBKYXhRNaiT8yYYTqeXHpVQ3qQoZK+GEUyzX1aT+YZl
	 vrwQqNw6sdJVq8biaFjyTaW/DeE7rK8HjsRId07CbMj9Vz1UE03NOLY5j5Nj0/4iVl
	 6KDsqAvv5H4uQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
In-Reply-To: <DB6QM8WOX9FS.2W36R3YF2VS0F@kernel.org> (Benno Lossin's message
	of "Tue, 08 Jul 2025 16:19:04 +0200")
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
	<20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
	<MsrRzRcWQU4DLY5mlpwajZZaSx_kPRSJTuMGxtI4igY_8NpNBSAbb9v5BcFv2WKZoRkr8QDlcfjlGlH4NwpB8w==@protonmail.internalid>
	<DB6JVOZLCMBL.3EZQJP50UUB86@kernel.org> <87v7o2omqf.fsf@kernel.org>
	<lD3JbMPS7zWoGdRTDujIdJVoSh88nL71zGM_GrDDtARQ72mKzElYG1tZjZpi3bv_AchFrQMg0kFpAEBdB6Hl9w==@protonmail.internalid>
	<DB6QM8WOX9FS.2W36R3YF2VS0F@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 09 Jul 2025 10:56:55 +0200
Message-ID: <87v7o1lp2g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Tue Jul 8, 2025 at 3:06 PM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Mon Jul 7, 2025 at 3:29 PM CEST, Andreas Hindborg wrote:
>>>> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
>>>> index 81e3a806e57e2..13e6bc7fa87ac 100644
>>>> --- a/rust/kernel/sync.rs
>>>> +++ b/rust/kernel/sync.rs
>>>> @@ -18,6 +18,7 @@
>>>>  mod locked_by;
>>>>  pub mod poll;
>>>>  pub mod rcu;
>>>> +mod set_once;
>>>
>>> I would have named this `once`.
>>
>> So module `once` and struct `SetOnce`? Struct name `Once` would lead
>> thoughts to `std::sync::Once`, which is a different thing.
>
> Hmm I thought that `Once` and `SetOnce` would live in the same module,
> but if they don't then I think it's better to keep the `set_once`
> module as-is.

I guess they could live together. I was thinking a module for each. We
can always move it, the module name is not part of a public API.

Let's go with `set_once` for now and we can change it later, if we
decide it is for the better?


Best regards,
Andreas Hindborg




