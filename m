Return-Path: <linux-kbuild+bounces-7936-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA29AFCD42
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 16:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E6A03BC63B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 14:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453962DFA28;
	Tue,  8 Jul 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJdG0bwe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC12DF3F2;
	Tue,  8 Jul 2025 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984351; cv=none; b=krbmhkARTA8mFq6aQSgPOMj/uDcA86lISZRrHr134EJVuWi2Vstgtiqz2ovAJ6ceqvsadwaqK2h6Xg572aPYmxp+MKf+d9nro0XUr9QKwPKe3XjTheVLUgn01xl14CPUj4T+yrY++CWCId6wSpP+M3q7PoOsq8VHrw5vjkW1O98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984351; c=relaxed/simple;
	bh=Iq0j90w5GB1UMwIBCu5T3PMb/N7aK9m/YbQtD24djNI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EiGFdUnL8kSq7U6lrJJlktpKj99u1tNdGvSvq8mt5r35Hu5LUA+2JS1EzaKztUFxbmFYDw8huF3tPBr4BitT//LIDYhl+WBU+JZd4RdOI8BjzHkCa3729Hz7NpJ/a2laxJnWbXeN94Qrvau2/9YhmREVkN6qucuik4G8fYMpXrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJdG0bwe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423C3C4CEED;
	Tue,  8 Jul 2025 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751984350;
	bh=Iq0j90w5GB1UMwIBCu5T3PMb/N7aK9m/YbQtD24djNI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=mJdG0bwexKPHDEAqDwqRF+Htv4NmJ/nfvmsx9gOvX+HSlsF4nm1vAmj+qfaPO35ej
	 jRNUi+VHLoaWeDIEmZ8q+iRKi1LC8mfbuIon3R95/CJf1+7V+6pde9EfkqCX3wBsq3
	 OJbBBBDnpWwpIEYw4986afQ2+J3v21rGxjV6XbLDD/ZWupktHImThisdm4c9UHKl88
	 aJSdYeNtaGKImxqNPY3HMvnK/ITr7tMid6bO/erPrAMxdOACWEJt/ZOUu2K2RyQrZ9
	 e88djzdFXGQA/sciXWLMPAeoTKEULYpueW1Aw0KjQGb+CYfy4p52F6SbbiIRA4xsyz
	 Fg7O7fV3g046g==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 16:19:04 +0200
Message-Id: <DB6QM8WOX9FS.2W36R3YF2VS0F@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>, "Trevor
 Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye" <ark.email@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Daniel Gomez" <da.gomez@samsung.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Greg KH"
 <gregkh@linuxfoundation.org>, "Fiona Behrens" <me@kloenk.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
 <MsrRzRcWQU4DLY5mlpwajZZaSx_kPRSJTuMGxtI4igY_8NpNBSAbb9v5BcFv2WKZoRkr8QDlcfjlGlH4NwpB8w==@protonmail.internalid> <DB6JVOZLCMBL.3EZQJP50UUB86@kernel.org> <87v7o2omqf.fsf@kernel.org>
In-Reply-To: <87v7o2omqf.fsf@kernel.org>

On Tue Jul 8, 2025 at 3:06 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Mon Jul 7, 2025 at 3:29 PM CEST, Andreas Hindborg wrote:
>>> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
>>> index 81e3a806e57e2..13e6bc7fa87ac 100644
>>> --- a/rust/kernel/sync.rs
>>> +++ b/rust/kernel/sync.rs
>>> @@ -18,6 +18,7 @@
>>>  mod locked_by;
>>>  pub mod poll;
>>>  pub mod rcu;
>>> +mod set_once;
>>
>> I would have named this `once`.
>
> So module `once` and struct `SetOnce`? Struct name `Once` would lead
> thoughts to `std::sync::Once`, which is a different thing.

Hmm I thought that `Once` and `SetOnce` would live in the same module,
but if they don't then I think it's better to keep the `set_once`
module as-is.

---
Cheers,
Benno

