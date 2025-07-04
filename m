Return-Path: <linux-kbuild+bounces-7877-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D58AF91C6
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 13:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C78B1BC8328
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 11:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6485B2BD5BB;
	Fri,  4 Jul 2025 11:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qu1b6mPV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A3929D19;
	Fri,  4 Jul 2025 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629588; cv=none; b=KmjFaiEvAxRzxjRhaJjR5In/HSPKRq9moYL0t5+4F0RDFtE+29hA6VRC/P9UmyjNQ3otCbQHwjkTBNYVvbpJjrTZMd9wJtyr4RnKsdjF+LZOFTbWfBrfOoyVz12qH3LabGljv2rJf6sWY2DCf8YtCYlJ8g08/Sv7xuNNMIOhEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629588; c=relaxed/simple;
	bh=0QkNuyPLruhS9grPTs+cSiuHE8ijHQpGHF1EGw1iN1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ALP2+6HltemaM0kcQmLDQ1qeqHxCb4tKUNGusk5340B3NElZsJKs84yc/8DsNTs16eatlG49AaXuivR7gIHuQ1a7Zr0ybdncdbSDr8N69BrzTMsnij3YAbnncmtg7tRI/dLtFaHDjfI9Y5NGIk6KpUW8mZou2bzWBMlK7IWTuxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qu1b6mPV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72EAC4CEE3;
	Fri,  4 Jul 2025 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751629587;
	bh=0QkNuyPLruhS9grPTs+cSiuHE8ijHQpGHF1EGw1iN1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qu1b6mPVXPYeHuP46u/AMC7mWPtX9ONBPLMLFyb6ZR0mI+th1lJYE+JckCRAOPJJw
	 ayxxbD98VjGKPWHbqzL9OLutC8c/2sYd6/Af9dBdNgXCwpXDcx3KBjHYsWrNSkw09m
	 mPJ6ZcSQcgXlnPt1/6KFUmAbHu6CXmAyE2vv5DJIsB7wFRu/YMiH0cWNzi6SQz1oT2
	 8S/WsHJyxzBj+50Jxh0KeOLGjrh3K3dvnr2x2CYZQh/190Iy6z7Uu/6dvOlrqvy//J
	 XEfR46eS7xav11lggBu6rK6PMEDatjbfGEr4+I6LQjbcK09CL1MFgFk20NWkY1Dem5
	 dDYs6WwYzgphA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Luis Chamberlain" <mcgrof@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 3/7] rust: introduce module_param module
In-Reply-To: <DB36LGJOWHZQ.GHXR3VGX7806@kernel.org> (Benno Lossin's message of
	"Fri, 04 Jul 2025 11:59:40 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>
	<aOJo8e9FTJikY-WFnv8a7qAvQS6RFIHTU_gb8fa9RD-8SdGo7o56AoSlWUJUG9NTNB1Wgd09N4p5LJEY8HHXvQ==@protonmail.internalid>
	<0e89892f-103e-4b92-a067-e192cb7b89a6@kernel.org>
	<875xg8tnv7.fsf@kernel.org> <87zfdks8y2.fsf@kernel.org>
	<2LQQjh_rTrPN1jqJ3fD9DdDpQx17_PxIMx2wQJp4RLYlnq1oT_ei6ir6G52V9C-NnplUeRSrq6YQ4_UOA3MRog==@protonmail.internalid>
	<DB36LGJOWHZQ.GHXR3VGX7806@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 04 Jul 2025 13:46:17 +0200
Message-ID: <87ecuwrxfa.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Fri Jul 4, 2025 at 9:37 AM CEST, Andreas Hindborg wrote:
>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>
>>> "Danilo Krummrich" <dakr@kernel.org> writes:
>>>
>>>> On 7/2/25 3:18 PM, Andreas Hindborg wrote:
>>>>> +    /// Get a shared reference to the parameter value.
>>>>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>>>>> +    // held lock guard here.
>>>>> +    pub fn get(&self) -> &T {
>>>>> +        self.value.as_ref().unwrap_or(&self.default)
>>>>> +    }
>>>>
>>>> I think you forgot to rename this.
>>>
>>> Yes, thanks for being persistent on this :)
>>
>> Actually, there is a discussion on whether to keep the API similar to
>> `std::sync::OnceLock` [1] but also whether to rename this to something
>> other than `OnceLock` [2]. Depending on how that resolves, it might make
>> sense to stay with `get` or rename to something else.
>
> But this is for the `ModuleParamAccess`, right? There I think it makes
> sense to choose `access` or `value`.

Right, sorry. My context window was too small here.


Best regards,
Andreas Hindborg




