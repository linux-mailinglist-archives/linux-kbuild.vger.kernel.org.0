Return-Path: <linux-kbuild+bounces-7945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC0AFE3B3
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 11:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 064027B4AE5
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 09:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2015D283FC9;
	Wed,  9 Jul 2025 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9t/r48+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25B878F36;
	Wed,  9 Jul 2025 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052257; cv=none; b=iZV0nrPkn+9Z5gdNSf9WK1mEn9FQRhFqe7qLsxHmJU/ArXJOw0UaYawJYbxVOd8xLOYLBiJo1IgOE7EzTBPhAHHacArkHMh+ipcIi/ZSRF2RvxF1qYcYe6VZ+K5cXaNK/5CLGyqNkQ4EW8PsvBfSE2Hq5yp2hFMY0pcW2rYHp04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052257; c=relaxed/simple;
	bh=jLWUqCCh+P7rb/vIveEHk3VQXEsAJdl3YjBTzAm6LOw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CAUgxEcOM51qj+Hh/ttohkDewFo3tJ6rwhZBZAJYMOVEVLWUsVrkNcbru00BDO9W8zqdrso4eGDgdkru4el9gRGztMqegR47FCw1T1nxuE9QmaD40Qd2Vgx8GFYgCj9ddkS+8xnmfF/E3zcA4wCiRVpxTg1b8qL0MEFWGsucR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9t/r48+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09609C4CEEF;
	Wed,  9 Jul 2025 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752052256;
	bh=jLWUqCCh+P7rb/vIveEHk3VQXEsAJdl3YjBTzAm6LOw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=A9t/r48+Y243bSoSn50mSN5GgCDWZgiWrL7nyKtXQii9+s+Mh7tgd8IfApvQWjnGJ
	 O8NqfwqO5NgTd3qvRamriBa0DvHPxcrU8LSXKrmAHofliFJu+8/kchn2k7L/vWI1TD
	 8ftIme/i4uwSMseASL+xU7bTq/1aor9R+mPrlBP45s9MTcS3fcM1m3iCmkQFMFEHi+
	 v6ERbwDjGz/wZjzgk/mGsGU786FGanDF5jLar2vnTIMZ6/iv++v/ML9y4dhdlnICOy
	 ly+y8I7wsXv9pXR56lK/iuW+zWiNP3RY3zHQlxGni4dyqmWbToQYxrC5NGXxIZMIuU
	 dJvLPsThymt4g==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 11:10:50 +0200
Message-Id: <DB7EOS7AC5SZ.ZJRH3IRQ2ZMU@kernel.org>
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
 <MsrRzRcWQU4DLY5mlpwajZZaSx_kPRSJTuMGxtI4igY_8NpNBSAbb9v5BcFv2WKZoRkr8QDlcfjlGlH4NwpB8w==@protonmail.internalid> <DB6JVOZLCMBL.3EZQJP50UUB86@kernel.org> <87v7o2omqf.fsf@kernel.org> <lD3JbMPS7zWoGdRTDujIdJVoSh88nL71zGM_GrDDtARQ72mKzElYG1tZjZpi3bv_AchFrQMg0kFpAEBdB6Hl9w==@protonmail.internalid> <DB6QM8WOX9FS.2W36R3YF2VS0F@kernel.org> <87v7o1lp2g.fsf@kernel.org>
In-Reply-To: <87v7o1lp2g.fsf@kernel.org>

On Wed Jul 9, 2025 at 10:56 AM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>
>> On Tue Jul 8, 2025 at 3:06 PM CEST, Andreas Hindborg wrote:
>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>> On Mon Jul 7, 2025 at 3:29 PM CEST, Andreas Hindborg wrote:
>>>>> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
>>>>> index 81e3a806e57e2..13e6bc7fa87ac 100644
>>>>> --- a/rust/kernel/sync.rs
>>>>> +++ b/rust/kernel/sync.rs
>>>>> @@ -18,6 +18,7 @@
>>>>>  mod locked_by;
>>>>>  pub mod poll;
>>>>>  pub mod rcu;
>>>>> +mod set_once;
>>>>
>>>> I would have named this `once`.
>>>
>>> So module `once` and struct `SetOnce`? Struct name `Once` would lead
>>> thoughts to `std::sync::Once`, which is a different thing.
>>
>> Hmm I thought that `Once` and `SetOnce` would live in the same module,
>> but if they don't then I think it's better to keep the `set_once`
>> module as-is.
>
> I guess they could live together. I was thinking a module for each. We
> can always move it, the module name is not part of a public API.
>
> Let's go with `set_once` for now and we can change it later, if we
> decide it is for the better?

Sure.

---
Cheers,
Benno

