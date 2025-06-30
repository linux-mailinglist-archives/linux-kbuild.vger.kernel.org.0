Return-Path: <linux-kbuild+bounces-7787-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84012AEDCA6
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 14:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73B957A9088
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 12:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673FF289E26;
	Mon, 30 Jun 2025 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PC2Q2JTa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344AE1DFCE;
	Mon, 30 Jun 2025 12:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286207; cv=none; b=Zll6GPMEfcJu82yoH3o4kSt0UwX5qICKsLCRzC6NEza732G68QOQqLROzkEaPmBcBsPReM6SgaGuVE6xl4IShU5K17552q7KCjS2WxA72nhAkHQxfo02DxT31a4FL4eYtSswaPNP62cobxbHnZHBb4zNSPwbs2gJRCPb3gNzTuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286207; c=relaxed/simple;
	bh=PS22i7SSq5dvjKK9kqPLGugkmvSLjA3uIWk/TfpI6+s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DrEvEXvA8m8V7tzfLLsY0SDZYYDzHH0fQ5mtvJTxWyVzhvgwwSwH+OTeCOGt9bzyD7+gWB89NOAjs6KvaGGNumz5PUHxwC+mGMJ/xvLEQJtPYVH/qq2Hg5dmN8b8n6F062wSnjfreFP8TMSYNrqvL3R4GzIcFhIi6I6sqopJpTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PC2Q2JTa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B48C4CEF0;
	Mon, 30 Jun 2025 12:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751286206;
	bh=PS22i7SSq5dvjKK9kqPLGugkmvSLjA3uIWk/TfpI6+s=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=PC2Q2JTaWrwuwnEZc5zvBipv7uLyiQ8W20zWwiaXI38LGaEBDhLSGdmIv2pkY519t
	 jr9Cr0rF368Vx4ybcxGZ5EkXr4o40AuCeGqvBm2PF9eAZuu/5QAqS6jS/seBi+EIPq
	 DDZ6oweF25cigi2mmS8iZXS3gHC6/NXIQT85B/FflTmQjz33M59DlwqA/vksGRNC+H
	 pGar6U0mZYGOI6bepenKp+pkgyMrRTOZ26Qx3ZYyZv4LxnWt2CAozIyc5fzm5TN8L+
	 4Gi+84LOrN+ZP/YcyFE5UAz3Dl4znpK+xt9WPJbbAg+aYz5fxo1PS5ztkWMbfDqRE9
	 MPgEPnQkfj/Xw==
Message-ID: <a29fa1fe-b614-4f2f-8da7-4feb4b73953f@kernel.org>
Date: Mon, 30 Jun 2025 14:23:20 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 5/6] rust: samples: add a module parameter to the
 rust_minimal sample
From: Danilo Krummrich <dakr@kernel.org>
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
 <211a3491-7082-488a-b744-fa7416db18c3@kernel.org>
Content-Language: en-US
In-Reply-To: <211a3491-7082-488a-b744-fa7416db18c3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/30/25 2:18 PM, Danilo Krummrich wrote:
> On 6/30/25 2:12 PM, Andreas Hindborg wrote:
>> "Danilo Krummrich" <dakr@kernel.org> writes:
>>
>>> (Sorry for being late on this one, just a minor nit below.)
>>>
>>> On 6/12/25 3:40 PM, Andreas Hindborg wrote:
>>>>    struct RustMinimal {
>>>> @@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
>>>>        fn init(_module: &'static ThisModule) -> Result<Self> {
>>>>            pr_info!("Rust minimal sample (init)\n");
>>>>            pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
>>>> +        pr_info!(
>>>> +            "test_parameter: {}\n",
>>>> +            *module_parameters::test_parameter.get()
>>>
>>> Can we please call it something else than get(), maybe obtain(), access() or
>>> just ref()?
>>
>> Probably `ref` is the most precise of the options you propose. I would
>> go with that one. Or, should it be `as_ref`?
> 
> Guess that works as well.
> 
> One question additional question: Can't we just impl Deref for
> ModuleParamAccess<T>?

Just notice that it would work for now, but not in the future, because this will
apparently require some lock guard? Then maybe access() describes it best?

