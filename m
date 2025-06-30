Return-Path: <linux-kbuild+bounces-7789-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB7AEDCCD
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 14:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B8D3AC502
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 12:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAAD285053;
	Mon, 30 Jun 2025 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0GLWnex"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF63A25F979;
	Mon, 30 Jun 2025 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286724; cv=none; b=k1RImL+fIfDB4sBsjzhQ+vOEcTTczr9eGmsWgSlU50JSEDb9kAdH42HEQOY8QJJmttcYGp31nWIsiv0Ym/U/utQF98lo2xaJpYYkhMTtwqrGtYj3xjsfBppfCO8BlNCnA9hGIdVBkNJxai0Uf88r5i7tGJH5zJJUMd13d2klccI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286724; c=relaxed/simple;
	bh=mYEHSHiaoqZbuDagkYLY51yAWXpjac4Sp0EZW5KOBcA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HDknGBOclbiD9vaniwGU0hy7UmS/lr1N+jsIc/6maLZEHPMIh7Lc22WgN/n9nN5+B1uHlmElL47pJLQ5ZbPG0Jnldefrvyp/rcP7c9s+JCni9KOv/SlZSaiEtfNYjx7kcxcDOsPSCtZ9THhN7Cq7hcGcsEnZ/qPsvt75fHkU3iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0GLWnex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49BCC4CEF0;
	Mon, 30 Jun 2025 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751286723;
	bh=mYEHSHiaoqZbuDagkYLY51yAWXpjac4Sp0EZW5KOBcA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=O0GLWnexx0I8dGAWj31cI85X4o9FIB5Czt20YKesAIa+DdIO89p65WZOxJYwoz+ea
	 2CgUxKd9TaFUzD7UScrQrx7X4CHTRJQAUB7aD5z7eHs/OvWu2psA9zgPiXzP1xxyDa
	 bcI9JCq1iUtguuzRfnb1p3t7ulFC1aRgeO4H9GzQUlLuUAHU1gDLiz85Wg+85xUyDR
	 XzB3OuUhxfBgY6ouwJbaErhusmp1VacVzKj2IKs9f6+gPiau/ZdhkP36LlhfXS0Df/
	 7gX3OQz/xXeRh0fUiJ04GCItr9CsfG5pHNN6lnhEm6KHAB7+Ou87WEwMagn+iv5LDO
	 lOy8GtaFFrIfw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 14:31:57 +0200
Message-Id: <DAZVBV7S0IE6.VOSX1VWHY1BN@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, "Trevor Gross" <tmgross@umich.edu>, "Adam
 Bratschi-Kaye" <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 5/6] rust: samples: add a module parameter to the
 rust_minimal sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, "Andreas Hindborg"
 <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-5-bc219cd1a3f8@kernel.org>
 <Ewn_4yTakSQtGyiitglJP70oWR-szfflywmDJoIY6EFgJVwLYQfXICpOyUk7rIq6_5dAb5Lf0JAREGMnakfylg==@protonmail.internalid> <a343d3ce-a179-4c2c-a279-e2c3919a0a99@kernel.org> <87qzz1xwdg.fsf@kernel.org> <211a3491-7082-488a-b744-fa7416db18c3@kernel.org> <a29fa1fe-b614-4f2f-8da7-4feb4b73953f@kernel.org>
In-Reply-To: <a29fa1fe-b614-4f2f-8da7-4feb4b73953f@kernel.org>

On Mon Jun 30, 2025 at 2:23 PM CEST, Danilo Krummrich wrote:
> On 6/30/25 2:18 PM, Danilo Krummrich wrote:
>> On 6/30/25 2:12 PM, Andreas Hindborg wrote:
>>> "Danilo Krummrich" <dakr@kernel.org> writes:
>>>
>>>> (Sorry for being late on this one, just a minor nit below.)
>>>>
>>>> On 6/12/25 3:40 PM, Andreas Hindborg wrote:
>>>>> =C2=A0=C2=A0 struct RustMinimal {
>>>>> @@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn init(_module: &'static ThisMo=
dule) -> Result<Self> {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_info!=
("Rust minimal sample (init)\n");
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_info!=
("Am I built-in? {}\n", !cfg!(MODULE));
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_info!(
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
test_parameter: {}\n",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=
module_parameters::test_parameter.get()
>>>>
>>>> Can we please call it something else than get(), maybe obtain(), acces=
s() or
>>>> just ref()?
>>>
>>> Probably `ref` is the most precise of the options you propose. I would
>>> go with that one. Or, should it be `as_ref`?
>>=20
>> Guess that works as well.
>>=20
>> One question additional question: Can't we just impl Deref for
>> ModuleParamAccess<T>?
>
> Just notice that it would work for now, but not in the future, because th=
is will
> apparently require some lock guard? Then maybe access() describes it best=
?

What about `value()`?

---
Cheers,
Benno

