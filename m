Return-Path: <linux-kbuild+bounces-3555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46460979507
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 09:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D767B20BF6
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 07:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E212CA6;
	Sun, 15 Sep 2024 07:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgmIn2ju"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D64B168BE;
	Sun, 15 Sep 2024 07:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726385571; cv=none; b=XXt0gKPqwJ/U+r4xlf7wn8xtQBzvfOLU+4PLq+h5uALDflZ2MdkoLgx5oh7kGS2nlAcxjy0E9iNtQxzYE2BEEvEKIY3jtQ6Gn3LQO2UasjfqtkyKPyVT6Ca3PZCsGNFvCbdB3JbjJ6bPoU30v2qd8rY7PbFUFO0rRff4kVso9wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726385571; c=relaxed/simple;
	bh=Sk8UXaCUA/vlAWm8B2E0We3KmFV1OhCUNjsb6him7uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzacOAjOXstu7Nx/9ZcSrXb/rwz70Iv9ukek0kwh2dInK0stiw+3zUQWQj7rWcwRvS7f/KyJ8h0rDYngAmah1Kj8bvA0t56apDBwCkw9f8hD5wg9+4hGZ/tEuNbk2K32T7dZWlJ5s90MoWpENannY6LkZv7aCglXCLoke7NQHs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgmIn2ju; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a81bd549eso410293066b.3;
        Sun, 15 Sep 2024 00:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726385568; x=1726990368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeRHQu+yKzQUqrXbd5lul2wLwuoHFUxcLP2h5VUYKXk=;
        b=LgmIn2juHHmgV5K+08jGXQ1nhCtaxw5K3zjL/RLwUSA2ZvG7xeR1LlXHwHuhEZ4R9s
         EgoaMK3M+R0j+uWWnWR1rNJFQCFg5RE5Bcj+bVG0hxt+YJiPHlKwL1TblpSfr2eZ+O0k
         Kp3EauMCR2agQKWzR+7o09Zj7zZummC12JTGwjmlqclbaCOmOoIQoAM0Y5q9+sX7gVs4
         b/xVLSfP71KLq8lctiq7gKnOnEt7xtB133ps4HTMmEoJiXrmpW3uijyU0igd0MTstag9
         Im3voXN7luRPsZfJejscDXoxRFJNwKnKTzs5Me57m4SX7cxj2SBjkBgm5a6FzIww1iua
         aPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726385568; x=1726990368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeRHQu+yKzQUqrXbd5lul2wLwuoHFUxcLP2h5VUYKXk=;
        b=K5HQKqTXR8SrO5adg0iCp3gE28WXwTBXy+m1ubJFjTyxMrjaxgbpzOwlEdaC8W7ihN
         iFg3PVxAIEuqn1AT1PbldS1GlupbFOYi/7+wZ/V+NWUX5MtAl/gjgMoKw+Ykf3yHXyST
         YPvymIE5SpHcaT2PKGVSwEMrrxwm1k9IVXS/asTe9nxqPTVZTJmlRnNhbz+gBFkRg5jE
         I0o/WjddjrA4uOqg0fuQped6TCDWGCGMp1lnO7vWG3tIE2ur70K4oRlgJTngLGVNu4TN
         N3p9NUhAPIdyeKpAakbabiyM8W1zmK7Yy8n7CrlHEsTLeubeZNE4DqcwaCiuOc2PbWkk
         3UFg==
X-Forwarded-Encrypted: i=1; AJvYcCVKx4yNJ+U8FrinzLnLVHWX0a7hpWhdmXURsPlLgtxw8HZGDVs8cUwS0S8pbbdgijFzYES0nx/eobnGez48pok=@vger.kernel.org, AJvYcCVqppMvOvpjyacU9CG3N9IyDWI/cFEFAaZJnVrB0ZN28UgrbQFdAgjDVSj9c97esezWn933p1w5aHlnDKn0@vger.kernel.org, AJvYcCWNB3a32DzVrmFGN0k44xY1Mtt+4Eu4Kl//d4TMIQGvG1nDBjChX+YO8NB1ObsgOYVtjnuTWuqYsVN0j4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw//nVXi+foFNk496KBozO7FCkh3JQFlhNubyprjgCMWWTIGNb4
	fSZNi4tNoEXOJjbcRJa6GlPOIGPAyqagOXV6C1U3s/Z0ly9OgCwO
X-Google-Smtp-Source: AGHT+IGlHUAsnPjOFFuTn/tXNwH8GByOCS4k9zUVf6iXg3eJnbjo7p2RPWPflOmT8NKEozFzWvNMPQ==
X-Received: by 2002:a17:907:e28f:b0:a8d:2ab2:c99e with SMTP id a640c23a62f3a-a9029730615mr1197571366b.55.1726385566847;
        Sun, 15 Sep 2024 00:32:46 -0700 (PDT)
Received: from ?IPV6:2003:df:bf21:aa00:bafe:d6:9476:f8d4? (p200300dfbf21aa00bafe00d69476f8d4.dip0.t-ipconnect.de. [2003:df:bf21:aa00:bafe:d6:9476:f8d4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90613205b8sm163145166b.188.2024.09.15.00.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2024 00:32:46 -0700 (PDT)
Message-ID: <c7c5a16b-d033-4b46-8994-259c55bfd8b1@gmail.com>
Date: Sun, 15 Sep 2024 09:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
To: Alice Ryhl <aliceryhl@google.com>, Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud>
 <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
Content-Language: en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.09.24 um 23:44 schrieb Alice Ryhl:
> On Fri, Sep 13, 2024 at 11:18 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Fri, Sep 13, 2024 at 12:08:20AM +0200, Miguel Ojeda wrote:
>>> On Thu, Aug 29, 2024 at 10:23 AM Alice Ryhl <aliceryhl@google.com> wrote:
>>>>
>>>> Add all of the flags that are needed to support the shadow call stack
>>>> (SCS) sanitizer with Rust, and updates Kconfig to allow only
>>>> configurations that work.
>>>
>>> Applied to `rust-next` -- thanks everyone!
>>>
>>> Paul/Palmer/Albert/RISC-V: I think you were not Cc'd (at least in this
>>> version?), so please shout if you have a problem with this.
>>
>> For some reason I deleted the series from my mailbox, must've been in
>> dt-binding review mode and hit ctrl + d. I've been away and busy, so my
>> apologies Alice for not trying this out sooner.
>> It's sorta annoying to test rust + scs on riscv, cos you need (unless I
>> am mistaken) llvm-19. llvm-18 + rust built fine, but has no SCS.
>>
>> llvm-19 + rust failed to build for me riscv, producing:
>>
>> In file included from /stuff/linux/rust/helpers/helpers.c:22:
>> /stuff/linux/rust/helpers/spinlock.c:10:23: error: call to undeclared function 'spinlock_check'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
>> ^
>> /stuff/linux/rust/helpers/spinlock.c:10:23: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'raw_spinlock_t *' (aka 'struct raw_spinlock *') [-Wint-conversion]
>> __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
>> ^~~~~~~~~~~~~~~~~~~~
>> /stuff/linux/include/linux/spinlock.h:101:52: note: passing argument to parameter 'lock' here
>> extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char *name,
>> ^
>> 2 errors generated.
>>
>> This occurs because I have DEBUG_SPINLOCK enabled. I didn't check why,
>> but Andreas seems to have introduced that code - luckily he's already on
>> CC here :)
>>
>> With that disabled, there are dozens of warnings along the lines of:
>> /stuff/linux/rust/helpers/err.c:6:14: warning: symbol 'rust_helper_ERR_PTR' was not declared. Should it be static?
>> If those are okay for rust code, it would be rather helpful if the
>> warnings could be disabled - otherwise they should really be fixed.
>>
>> Following that, I got a build error:
>>
>> error[E0425]: cannot find function `__mutex_init` in crate `bindings`
>> --> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28
>> |
>> 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
>> |                              ^^^^^^^^^^^^ help: a function with a similar name exists: `__mutex_rt_init`
>> |
>> ::: /stuff/brsdk/work/linux/rust/bindings/bindings_generated.rs:12907:5
>> |
>> 12907 | /     pub fn __mutex_rt_init(
>> 12908 | |         lock: *mut mutex,
>> 12909 | |         name: *const core::ffi::c_char,
>> 12910 | |         key: *mut lock_class_key,
>> 12911 | |     );
>> | |_____- similarly named function `__mutex_rt_init` defined here
>>
>> error: aborting due to 1 previous error
> 
> This looks like an unrelated problem to me. 


Yes, it is unrelated to this change. It is PREEMPT_RT usage related. I 
think we could add something like

#ifdef CONFIG_PREEMPT_RT
void rust_helper___mutex_init(struct mutex *mutex, const char *name,
			 struct lock_class_key *key)
{
	return __mutex_init(mutex, name, key);
}
#endif

to helpers to fix

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/rust/kernel/sync/lock/mutex.rs?&id=6d20d629c6d8575be98eeebe49a16fb2d7b32350

?

Explanation: Looking at

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mutex.h?#n52

we have (simplified)

#ifndef CONFIG_PREEMPT_RT
extern void __mutex_init(struct mutex *lock, const char *name,
			 struct lock_class_key *key);
#else
#define __mutex_init(mutex, name, key)			\
do {							\
	rt_mutex_base_init(&(mutex)->rtmutex);		\
	__mutex_rt_init((mutex), name, key);		\
} while (0)
#endif

So in the CONFIG_PREEMPT_RT case bindgen doesn't resolve the macro 
what could be fixed by adding a helper.

Dirk


> This patch only changes
> the rustc flags, but these errors have to do with the Rust
> helpers/bindings, which get generated before the rustc flags are used
> at all. Most likely, there is a problem under the particular
> configuration you are using. Were you able to reproduce these errors
> without this patch?
> 
>> I stopped there, Space Marine 2 awaits.
>>
>> Hopefully I'll get to say hello next week,
>> Conor.
> 
> Thanks for taking a look, and see you at Plumbers!
> 
> Alice
> 


