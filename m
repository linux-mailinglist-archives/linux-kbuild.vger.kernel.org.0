Return-Path: <linux-kbuild+bounces-7786-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C97AEDC8A
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 14:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01FE13A9D65
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 12:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D2D27F001;
	Mon, 30 Jun 2025 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0TkobtU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC35258CFF;
	Mon, 30 Jun 2025 12:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285900; cv=none; b=PQsjb9bTOjK52NQZjDFSGSrhHPtKEg3I5smvk2colkYBK/y0g3Y7ZUDIk5QNdtCXy+5ISCTYq+hIz5Rgoqt3hfYaD74LUa32DBwnBZOvU8NrS2NiZEH0Lwv2sxXeAY1LXX15bCafqf0S8XMSuAXos5r3tlY2s1phCJXUSA3mZOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285900; c=relaxed/simple;
	bh=903MGmEH/WYMrISs/XiXkrDeI8bDOSbRIvorOEn70PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHqW0kz5i/WNtmCtTtphVs1aFJ9yssb/lkB8Vv7Y8Iy2qRKgnMCs+RhuAqsHUodC6RmmtJOjcD+cUA9CUfWNtsmdX6nXCVwYKYibeh3YEvCKa6taPooTEhR8Sbe97pT2rJp5wg+Y1rASgNcwoJJer9PbXXExQArq/yhYRGZWNPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0TkobtU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA70C4CEE3;
	Mon, 30 Jun 2025 12:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751285900;
	bh=903MGmEH/WYMrISs/XiXkrDeI8bDOSbRIvorOEn70PE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l0TkobtUsSZZHT/L/9wHYWdlwMsjzydObQgWGmU3Im2/x1bfherEHA2IBQK2+E1Tm
	 48SQsz8h5kVc4Xh5atPfW7TMzihCNEAo+pJHTLqt00S9m78SeOLvDCjvsbdhE48nlR
	 h/yrzlD9bX7oqKgDdNYsQuLRkg3EFcrLSIXoKsaz9xQcjq1cl1KYnzIjwo030V/uJm
	 vBZra+bTq5oIsg34H1iD/BlArmEjPya1cY0itCH7WwmcUhVsqCyB52bxjT6QHfM4am
	 wvfT69JjEhQaMQQ5zau1a14y7S53FNlmfz/RiSqQr+mfFtW+hBeSvJaT5IN1ms/J/8
	 Z/yrR7VdfcvEQ==
Message-ID: <211a3491-7082-488a-b744-fa7416db18c3@kernel.org>
Date: Mon, 30 Jun 2025 14:18:13 +0200
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
 <Ewn_4yTakSQtGyiitglJP70oWR-szfflywmDJoIY6EFgJVwLYQfXICpOyUk7rIq6_5dAb5Lf0JAREGMnakfylg==@protonmail.internalid>
 <a343d3ce-a179-4c2c-a279-e2c3919a0a99@kernel.org> <87qzz1xwdg.fsf@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <87qzz1xwdg.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/25 2:12 PM, Andreas Hindborg wrote:
> "Danilo Krummrich" <dakr@kernel.org> writes:
> 
>> (Sorry for being late on this one, just a minor nit below.)
>>
>> On 6/12/25 3:40 PM, Andreas Hindborg wrote:
>>>    struct RustMinimal {
>>> @@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
>>>        fn init(_module: &'static ThisModule) -> Result<Self> {
>>>            pr_info!("Rust minimal sample (init)\n");
>>>            pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
>>> +        pr_info!(
>>> +            "test_parameter: {}\n",
>>> +            *module_parameters::test_parameter.get()
>>
>> Can we please call it something else than get(), maybe obtain(), access() or
>> just ref()?
> 
> Probably `ref` is the most precise of the options you propose. I would
> go with that one. Or, should it be `as_ref`?

Guess that works as well.

One question additional question: Can't we just impl Deref for
ModuleParamAccess<T>?

