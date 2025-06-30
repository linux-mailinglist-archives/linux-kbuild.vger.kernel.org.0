Return-Path: <linux-kbuild+bounces-7785-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED3AEDC71
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 14:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8ADF7A7B52
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 12:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C4B289816;
	Mon, 30 Jun 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaV5oK5c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8377A24A058;
	Mon, 30 Jun 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285574; cv=none; b=KFt9hAARPcLAkcFMr4TuFP2YurNPOWQQZtZsrneQguheAEfJO/DWwzOaq8ppxwsVEGn3GYum+HxEImGwZAjDFBoYke2Xay4XykEHvD/iXX47t/AiMF4imXLu5vjun05FFVOeUw5aw+N2d51oe0vXZHQi814yoNS6Rnma5BEtYBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285574; c=relaxed/simple;
	bh=OAKKPO5WAFxNS5ms3mqTo100SLRig36uzVnDCmiO2jg=;
	h=From:To:Cc:Subject:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=Z/3+b3OAA17t5UnTtUMqct50iWcaVzMvbHKrZsC4F8SjLTuFd1OH9z+mIy7WcEN2nmyOr5zPWlwQkEOAZUJmw+xmvfGVz7Izn1x39K9Xd8moiIZ6AY+NTcdg1EFecxD/Zz3XktRRvVEX+4A91tfRw1tEheZQoFf7DZwSxC0oNF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaV5oK5c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A127AC4CEE3;
	Mon, 30 Jun 2025 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751285574;
	bh=OAKKPO5WAFxNS5ms3mqTo100SLRig36uzVnDCmiO2jg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kaV5oK5cQQGMvF0zVYgdU8Dy+GsxKluitINfeXUMmlNoENC+nFheop9ZPsEK4aT2r
	 yWkVuFOsjL9wQPm9ZGUEoWI8ABc0bSF8QrbhebjYRGRwKJeMt8n6sPhaTZRbw7RxYl
	 NyBig3DaeWSGGqwJ+esch7hG9O0BoWlZQn1zIzAUs6tsgBLfEenDq3Q1rlkRIsVDim
	 n1GR2vOEzp9GJH5AotscDxPxVudiPmYQ/q4gDaNtoh/qVEHLOave/dGRmqtxn4+E88
	 rH6vTb1fExRuIizGiYNGSMoob16xpac/lD9yaLFJaGHL2RWUbse+mh5SlVdsZymEEm
	 Ny93+DFRINP8Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?us-ascii?Q?=3D=3Futf-8=3FQ=3FBj=3DC3=3DB6rn=3F=3D?=
 Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Benno Lossin" <lossin@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 5/6] rust: samples: add a module parameter to the
 rust_minimal sample
In-Reply-To: <a343d3ce-a179-4c2c-a279-e2c3919a0a99@kernel.org> (Danilo
	Krummrich's message of "Mon, 30 Jun 2025 13:30:02 +0200")
Message-ID: <87qzz1xwdg.fsf@kernel.org>
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-5-bc219cd1a3f8@kernel.org>
	<Ewn_4yTakSQtGyiitglJP70oWR-szfflywmDJoIY6EFgJVwLYQfXICpOyUk7rIq6_5dAb5Lf0JAREGMnakfylg==@protonmail.internalid>
	<a343d3ce-a179-4c2c-a279-e2c3919a0a99@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 30 Jun 2025 14:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> (Sorry for being late on this one, just a minor nit below.)
>
> On 6/12/25 3:40 PM, Andreas Hindborg wrote:
>>   struct RustMinimal {
>> @@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
>>       fn init(_module: &'static ThisModule) -> Result<Self> {
>>           pr_info!("Rust minimal sample (init)\n");
>>           pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
>> +        pr_info!(
>> +            "test_parameter: {}\n",
>> +            *module_parameters::test_parameter.get()
>
> Can we please call it something else than get(), maybe obtain(), access() or
> just ref()?

Probably `ref` is the most precise of the options you propose. I would
go with that one. Or, should it be `as_ref`?


Best regards,
Andreas Hindborg




