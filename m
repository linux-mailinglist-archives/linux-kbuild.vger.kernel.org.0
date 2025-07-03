Return-Path: <linux-kbuild+bounces-7867-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A444AF7DC0
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 18:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF4D04E15D5
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 16:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7E22528FC;
	Thu,  3 Jul 2025 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCfVjCzQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AA76DCE1;
	Thu,  3 Jul 2025 16:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751559968; cv=none; b=YkeZw2HKeqNMOx6cosaxQpbTntuBxW6Fq+lnt0aWpodnKICwGN3Rtb2291/MImCqSxXGlRJActT+vO9d4EJInwGKRqVr+6O1ysgFWA7DkiWBaY7zO+BojfJI0ewBFfwZCdHHHGwxVc3KWGP/Xd6uH7IGiWVjy5zEiqsY3GpAp+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751559968; c=relaxed/simple;
	bh=tbrvOyBytCo6lsr8a6YMlFuoYiLA4jNG7vO7UHFe3l4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cRAesUtId7+7+deD+XvKShcJBrRlBa0QipmaeHGEK6cPyJRysX+/XQDGmIyAYlqBNCREEwfXGBwDCbtrV1xSzcgupEPKm99vAcdNN3lKWfUm15KXTiuVfYOgNvZ6e+ccNUiHGp4Zh8c/JsDQIepj5r/2WcifyrpGWbr/FIEqddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCfVjCzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016BCC4CEF1;
	Thu,  3 Jul 2025 16:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751559967;
	bh=tbrvOyBytCo6lsr8a6YMlFuoYiLA4jNG7vO7UHFe3l4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vCfVjCzQndkVciFceuGGIZV1lyscyQs514LsFRW0LpbFZClL4KbtG/lpsXQxcW1RV
	 4E/YDdxGDKEwQfFFd9GpdZpfzcK5nAGQ+mpP5vqhMqUuNQLjh2aZwsxjrXfVKq09Sy
	 YYEthbwW5y/dOxcO3Re8BV5U9itdZXyZC/gQ76292/WO1Uqf5IWc5c1ZjWXX1gTgt/
	 nHZzJOxIfR+rukGylX247PaAK1dSyD39aPg1FdJGmwJJUHs9iqQSrmhBf70NaUlgJj
	 hAbLjRRbOmeZdz51IGInSyp3ck1MFgXBSfidKNyUfLKBJS0jXsPUfpobsPl5wRLDYU
	 Xg/SA6fFrO1pw==
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
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
In-Reply-To: <DB2BM4UMCFQR.3SQWIRF7HDP09@kernel.org> (Benno Lossin's message
	of "Thu, 03 Jul 2025 11:42:59 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
	<dO7tJL6M4FKz_QOo-Vbb0bZOybyXa9CkBI0SIIKeCGBHIjNHlpElEV0iPbNeXBa6elnsQXqrGS5AGXdGU5hefQ==@protonmail.internalid>
	<DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org> <87bjq1ve6t.fsf@kernel.org>
	<vbMLL995UAW3v-0IanP32kkT2-kRHTK21bCbdsgaykKMsJk3gEKRbJk4CegAZWuTR8oAhAI1R-wFgMuezTeNLw==@protonmail.internalid>
	<DB2BM4UMCFQR.3SQWIRF7HDP09@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 18:25:57 +0200
Message-ID: <87y0t5tf56.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Thu Jul 3, 2025 at 11:03 AM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:

[...]

>>>> +            Some(unsafe { &*self.value.get() })
>>>> +        } else {
>>>> +            None
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /// Populate the [`OnceLock`].
>>>> +    ///
>>>> +    /// Returns `true` if the [`OnceLock`] was successfully populated.
>>>> +    pub fn populate(&self, value: T) -> bool {
>>>> +        // INVARIANT: We obtain exclusive access to the contained allocation and write 1 to
>>>> +        // `init`.
>>>> +        if let Ok(0) = self.init.cmpxchg(0, 1, Acquire) {
>>>> +            // SAFETY: We obtained exclusive access to the contained object.
>>>> +            unsafe { core::ptr::write(self.value.get(), value) };
>>>> +            // INVARIANT: We release our exclusive access and transition the object to shared
>>>> +            // access.
>>>> +            self.init.store(2, Release);
>>>> +            true
>>>> +        } else {
>>>> +            false
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +impl<T: Copy> OnceLock<T> {
>>>> +    /// Get a copy of the contained object.
>>>> +    ///
>>>> +    /// Returns [`None`] if the [`OnceLock`] is empty.
>>>> +    pub fn copy(&self) -> Option<T> {
>>>> +        if self.init.load(Acquire) == 2 {
>>>> +            // SAFETY: As determined by the load above, the object is ready for shared access.
>>>> +            Some(unsafe { *self.value.get() })
>>>> +        } else {
>>>> +            None
>>>> +        }
>>>
>>> The impl can just be:
>>>
>>>     self.as_ref().copied()
>>
>> Nice. I was thinking of dropping this method and just have callers do
>>
>>  my_once_lock.as_ref().map(|v| v.copied())
>>
>> What do you think?
>
> There is `Option::copied`, so no need for the `.map` call.

Cool.

> I don't
> really have a preference, if users always want to access it by-value,
> then we should have `copy`.

But should it be `copy` or `copied` like `Option`?


Best regards,
Andreas Hindborg




