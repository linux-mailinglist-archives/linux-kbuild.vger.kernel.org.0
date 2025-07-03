Return-Path: <linux-kbuild+bounces-7852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F160AF6EE4
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 11:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC7B8188517C
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 09:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD74023BCF1;
	Thu,  3 Jul 2025 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="jSKSpC5a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037892D23B9
	for <linux-kbuild@vger.kernel.org>; Thu,  3 Jul 2025 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535405; cv=none; b=U8q/aVDHAELlcixglttp4v+123EgwPvfhm0C7zBdmW3VidD5HXLc0U5TSIXSQqekwaaWPxuOdMSVHymh+enTPXMGJXsf+u8i4FnbZHX0vaSmlk1z7rW5Gbp/QmekVuauXropC7BO+197K6bwt7w+Kih09v0OSUembgIZMxcjS3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535405; c=relaxed/simple;
	bh=UNBBkEo9dLh004V3nW9S9BnSVg1BNnCyVDQknQy6Cf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbPWSEq3LnHLWWFsGeAkLxP4wlND6e0H6w6PO63OxIqQQaUnZ7NzdCYMbqlxO9u0OqE34iZHtvIGEx+AdPmIVWcTYvz++0cSeCq/ThRJYZcflF/YMvhVbqAkuug5lVYmV97iVPDQ3EXe8kwOjQvSSKrjQn+FoHNlTvoS0AbRsyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=jSKSpC5a; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso7471031a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Jul 2025 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1751535402; x=1752140202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PfJEOD6bcsCKwy/03k+/1lB8bmN4UuO1fxBnn9sTTY=;
        b=jSKSpC5aBy+55w7Zzqth08AStZA3hzw6UzGx8nppIg0ZRDmBqMzcL6642KYJNsTvew
         EIQrioad+Z4VvN6DPBQilQj1hijhlaLxyv6iFAqI3mXUSfskMSCGrjtQ5KXRKv45EX7r
         fd7sKKE7qV2nACoXhgyf64hI+yNb3Gvs0M/YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535402; x=1752140202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PfJEOD6bcsCKwy/03k+/1lB8bmN4UuO1fxBnn9sTTY=;
        b=Hk363/26Rrv/OiWX71jBx8Iwb5cEM0DaIx7DgLHfgdd1WYgzLsRkgEZqWHCAp6H2Zq
         0qoGMSMwELR4t6RyOO49v11rNryLB3NrjJ5AFvAVQj4l1fhS+HZdCIroVWs46bywSVTa
         DRuyK4CsrTWwf8HucvE+FWwqLFTIVOsauaxuRZwFz0neCyJf21SzJ9cCAR9yVaaTZ50S
         U04OuasUr56FPjHo1YBWD2cYt4H9O3wjQCWCR5sf9DUHt06TSvUdaIhnppMjQMKAZB9q
         Hi2IHhpvE9ZnW+6d+mTN6bx3p/ya3tAaePlp5SXXwce67+Y/X+/uIo9h4f0re9ne8lnq
         304Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6piNw/3YqxpmCjA58zW+aj0EKTVvqpkcMKmhtp7dhrpEsUqpJFLFi2+zUkKvRSLh6gnX34MAlVyQWL1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrazxLL+0MTFdlDfrHfDdAcg/Bp8sfzem3WkcHwoytaMGK81U
	3U1IBMHr/zUFx90YSN4o6ABTHi3tRfH6AJ/yCP4632dkNu8P9xUc/krZNDVxYVwu9g==
X-Gm-Gg: ASbGncuXNxGDxnamJpApU9aX4UIo/uisacwEi6VIFmnYaSSmbR33pZk7ajbbx/XN8Yz
	YZnEuv2mZbV1uRs+65aKnY4Q52JewX4h5tiTe+fpGDZ0uOHgGNXgY/d1d5oefdIbHyk/lbUTTmK
	q9PfjFpl9Z4HOtYDVJ+J2PCqlw6wXzqzkaAuNBoykrUSy+N5rRbFeXkcyJpjPzWzdP9CfRfL3WO
	dKUGJRzYyPEnde315Vc68LgNmgXLdTsU0Cz5DhvUAs7R/c+V6G6Zpqfl1f0sTpn9hNv0Ecm7M7I
	okySJS1OwR81aM37N1FFCmqKVJBttPsV23S1GkAQtrint3WQKydwUOxnkClQfFapFkQBOm4BOFK
	cCX3qMYtRoDN+v6QCRdnIiKsph/ecM5GW/wU=
X-Google-Smtp-Source: AGHT+IHXJh0SDDKaDCkTtTOXpeI99DlSTdKDZyjyyQnshIr85+25RuGYbbGI0dZbtoEoZ3MOFWsOLg==
X-Received: by 2002:a17:90b:52c6:b0:316:3972:b9d0 with SMTP id 98e67ed59e1d1-31a90a2d5d4mr10538719a91.0.1751535402153;
        Thu, 03 Jul 2025 02:36:42 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc5c8a9sm1874182a91.15.2025.07.03.02.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:36:41 -0700 (PDT)
Message-ID: <35e1fef4-b715-4827-a498-bdde9b58b51c@penguintechs.org>
Date: Thu, 3 Jul 2025 02:36:39 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
To: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye
 <ark.email@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/25 6:18 AM, Andreas Hindborg wrote:
> Introduce the `OnceLock` type, a container that can only be written once.
> The container uses an internal atomic to synchronize writes to the internal
> value.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>   rust/kernel/sync.rs           |   1 +
>   rust/kernel/sync/once_lock.rs | 104 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 105 insertions(+)
> 
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index c7c0e552bafe..f2ee07315091 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -15,6 +15,7 @@
>   mod condvar;
>   pub mod lock;
>   mod locked_by;
> +pub mod once_lock;
>   pub mod poll;
>   pub mod rcu;
>   
> diff --git a/rust/kernel/sync/once_lock.rs b/rust/kernel/sync/once_lock.rs
> new file mode 100644
> index 000000000000..cd311bea3919
> --- /dev/null
> +++ b/rust/kernel/sync/once_lock.rs
> @@ -0,0 +1,104 @@
> +//! A container that can be initialized at most once.
> +
> +use super::atomic::ordering::Acquire;
> +use super::atomic::ordering::Release;
> +use super::atomic::Atomic;
> +use kernel::types::Opaque;
> +
> +/// A container that can be populated at most once. Thread safe.
> +///
> +/// Once the a [`OnceLock`] is populated, it remains populated by the same object for the
> +/// lifetime `Self`.
> +///
> +/// # Invariants
> +///
> +/// `init` tracks the state of the container:
> +///
> +/// - If the container is empty, `init` is `0`.
> +/// - If the container is mutably accessed, `init` is `1`.
> +/// - If the container is populated and ready for shared access, `init` is `2`.
> +///
> +/// # Example
> +///
> +/// ```
> +/// # use kernel::sync::once_lock::OnceLock;
> +/// let value = OnceLock::new();
> +/// assert_eq!(None, value.as_ref());
> +///
> +/// let status = value.populate(42u8);
> +/// assert_eq!(true, status);
> +/// assert_eq!(Some(&42u8), value.as_ref());
> +/// assert_eq!(Some(42u8), value.copy());
> +///
> +/// let status = value.populate(101u8);
> +/// assert_eq!(false, status);
> +/// assert_eq!(Some(&42u8), value.as_ref());
> +/// assert_eq!(Some(42u8), value.copy());
> +/// ```
> +pub struct OnceLock<T> {
> +    init: Atomic<u32>,
> +    value: Opaque<T>,
> +}

This type looks very much like the Once type in rust's stdlib. I am 
wondering if the api could be changed to match that api. I know that 
this type is trying to provide a version subset of std::sync::OnceLock 
that doesn't allow resetting the type like these apis:

* https://doc.rust-lang.org/std/sync/struct.OnceLock.html#method.get_mut
* https://doc.rust-lang.org/std/sync/struct.OnceLock.html#method.take

However, these methods can only be used on mut. See here for failing 
example: 
https://play.rust-lang.org/?version=nightly&mode=debug&edition=2021&gist=a78e51203c5b9555e3c151e162f0acab

I think it might make more sense to match the api of the stdlib API and 
maybe only implement the methods you need.

> +
> +impl<T> Default for OnceLock<T> {
> +    fn default() -> Self {
> +        Self::new()
> +    }
> +}

Any reason not to use #[derive(Default)]?
> +
> +impl<T> OnceLock<T> {
> +    /// Create a new [`OnceLock`].
> +    ///
> +    /// The returned instance will be empty.
> +    pub const fn new() -> Self {

Like new in std OnceLock. Matches. Good.

> +        // INVARIANT: The container is empty and we set `init` to `0`.
> +        Self {
> +            value: Opaque::uninit(),
> +            init: Atomic::new(0),
> +        }
> +    }
> +
> +    /// Get a reference to the contained object.
> +    ///
> +    /// Returns [`None`] if this [`OnceLock`] is empty.
> +    pub fn as_ref(&self) -> Option<&T> {

Looks like the get method in the OnceLock.

> +        if self.init.load(Acquire) == 2 {
> +            // SAFETY: As determined by the load above, the object is ready for shared access.
> +            Some(unsafe { &*self.value.get() })
> +        } else {
> +            None
> +        }
> +    }
> +
> +    /// Populate the [`OnceLock`].
> +    ///
> +    /// Returns `true` if the [`OnceLock`] was successfully populated.
> +    pub fn populate(&self, value: T) -> bool {

Looks like set in OnceLock.

Might also be worth implementing get_or_{try,}init, which get the value 
while initializing.

> +        // INVARIANT: We obtain exclusive access to the contained allocation and write 1 to
> +        // `init`.
> +        if let Ok(0) = self.init.cmpxchg(0, 1, Acquire) {
> +            // SAFETY: We obtained exclusive access to the contained object.
> +            unsafe { core::ptr::write(self.value.get(), value) };
> +            // INVARIANT: We release our exclusive access and transition the object to shared
> +            // access.
> +            self.init.store(2, Release);
> +            true
> +        } else {
> +            false
> +        }
> +    }
> +}
> +
> +impl<T: Copy> OnceLock<T> {
> +    /// Get a copy of the contained object.
> +    ///
> +    /// Returns [`None`] if the [`OnceLock`] is empty.
> +    pub fn copy(&self) -> Option<T> {

No equivalent in OnceLock. Similar to something like this:

x.get().copied().unwrap(); // x is a OnceLock

Example:
https://play.rust-lang.org/?version=nightly&mode=debug&edition=2021&gist=f21068e55f73722544fb5ad341bce1c5

Maybe not specifically needed?

> +        if self.init.load(Acquire) == 2 {
> +            // SAFETY: As determined by the load above, the object is ready for shared access.
> +            Some(unsafe { *self.value.get() })
> +        } else {
> +            None
> +        }
> +    }
> +}
> 

-- 
You're more amazing than you think!


