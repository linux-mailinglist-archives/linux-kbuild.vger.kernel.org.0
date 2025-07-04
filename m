Return-Path: <linux-kbuild+bounces-7881-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3959AAF94BD
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 15:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE94E4A7EDA
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 13:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A3430AAC5;
	Fri,  4 Jul 2025 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjnrqUa3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84DB30748D;
	Fri,  4 Jul 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637101; cv=none; b=PhAos7cHy3/SbKJbtBWLOfm7xODiP4sZYVHFsizjxSSxhqC2h7lPkdA5zdEAhVPeDqf/EM/nAJ7WKVPeVqDeSsL6gUdNkN4wJPKPaN/tZV6lAGi4uxafQobnIE8DYuudjLW/Ya6x6vJKkGEan7is3+m+LP93sgJMQ/Tpm+vm6NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637101; c=relaxed/simple;
	bh=/OiYSjkCDD0yVzW/zMXSwGUuzicvKJf923CS++qCXzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S+AZ4bpfvfdExWeJiGUlTpeUoymUrCMc5ap9uea0xnFHDXO1212VicYo8lSmtaww4pI2RkVdWAGgDrviBrA0oYxMYvNIRRQS/QFxyxbgdt4h6xvl4g9WNLWeGzjpKGr7LLrcp0/zJv6ffrqc7RHZfStupSF87DQKoXjSpRoW26A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjnrqUa3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9B4C4CEE3;
	Fri,  4 Jul 2025 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751637101;
	bh=/OiYSjkCDD0yVzW/zMXSwGUuzicvKJf923CS++qCXzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DjnrqUa36fkh8FCFhG4sw12ZoEQfFO5inamHW+G/dfchhyYcVkgSTNUaT7VMxNcLQ
	 n0NMJIE54SJcJTBThl4+lP+1p+nWD+FQsogOMa7LXxWImwDAVkByIIOOAHuQgRbKFd
	 8cW61XSP+u/00KT/B7YrqlLeuyd3zkSV2zuEtD5knRGXd4NxajCNQHNj21kOFwBoA8
	 ikzmrCdb3T0ZHWl/jdiG9yTzwTiGfvAsbL2GoEp3DWdP8Gh8PTMjFmAQB/o50DizLx
	 /jRp0Wci77uzt8oWFXrXsB5VohKUetig9XsWsJROzsP+oCkCMIPrDGsy9LOwjbc3RL
	 LvfM/eZpDJIEA==
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
Subject: Re: [PATCH v14 5/7] rust: module: update the module macro with
 module parameter support
In-Reply-To: <DB3A6GR3TQON.C9N9U4V48R1D@kernel.org> (Benno Lossin's message of
	"Fri, 04 Jul 2025 14:48:10 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-5-5b1cc32311af@kernel.org>
	<5fYjUlNFhuBwWOP46ph07KX4CMe0ORT5pZ_pD-l719E0ChkPTI2pV1tYJcN3oxKKcMI8_HGU1InaWBj52Kbbag==@protonmail.internalid>
	<DB1OK2PQZ790.S317HUWYJR3J@kernel.org> <875xg8rvei.fsf@kernel.org>
	<32cgJkp6-1w5-FLQMuvqhCiTvKUhR7SiIWtWdQFlkp2UoeAU3YuYmj7EElURj_NxY01OuuWlZ2aNPzX1UksjOg==@protonmail.internalid>
	<DB3A6GR3TQON.C9N9U4V48R1D@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 04 Jul 2025 15:51:27 +0200
Message-ID: <87zfdkqd28.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Fri Jul 4, 2025 at 2:29 PM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
>>>> +                            perm: 0, // Will not appear in sysfs
>>>> +                            level: -1,
>>>> +                            flags: 0,
>>>> +                            __bindgen_anon_1:
>>>> +                                ::kernel::bindings::kernel_param__bindgen_ty_1 {{
>>>> +                                    arg: {param_name}.as_void_ptr()
>>>> +                                }},
>>>
>>> Formatting?
>>>
>>> +                            __bindgen_anon_1: ::kernel::bindings::kernel_param__bindgen_ty_1 {{
>>> +                                arg: {param_name}.as_void_ptr()
>>> +                            }},
>>
>>
>> That makes the line more than 100 characters after changing other
>> formatting things. Perhaps I should just left shift all this?
>
> Not sure what you mean by left shift? When I tried it, it was fine, but
> it could have changed with the other things... Do you have a branch with
> your changes?

Move all the code template so the least indented start at column 0.

My WIP branch is here [1].


Best regards,
Andreas Hindborg


[1] https://github.com/metaspace/linux/tree/module-params


