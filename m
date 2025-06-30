Return-Path: <linux-kbuild+bounces-7783-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 019A6AEDAA6
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 13:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B06C3B2303
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 11:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2EB23B621;
	Mon, 30 Jun 2025 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kf8eheID"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0671F419B;
	Mon, 30 Jun 2025 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282346; cv=none; b=Rn2vsWJKrYlafnSLE+wvOfD1Z9oLKbT2iAVmrdZbBJLPRZti++WOHmPDoFBFnyb8N/rZu92Cf2LZxZ3Nycc8GEVs2tmZJ1eZflpO5BdVBaUfm7CmULYBtfjL7OyTeD8whX+a1Vdx2V6aS+sDLyeH3hcUuaTVCCyHbFa+VLA/iYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282346; c=relaxed/simple;
	bh=bIpgmPc0b9EDJv5uYq+XPXXxnqq2jlRbVDbZ7cCRdNY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rmuamDiUgRpNeCB1P8sOMG8yAemi/RxxyCX/X8uuAN9D5sJZTPo68ZbJK2dVVOTS+105VDw+tHIegE250ZoHJevsPjECltY0ILV/x0YbdMEUze6EXYrIbxg0kwClTkCX1NbJNHfFeElr/fVja+S4qXzMQHnD4gqyDvMdtcJj0HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kf8eheID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252FEC4CEE3;
	Mon, 30 Jun 2025 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751282345;
	bh=bIpgmPc0b9EDJv5uYq+XPXXxnqq2jlRbVDbZ7cCRdNY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kf8eheID+HbtQNViBTZdMnfh46M5zDwW4hrciZ2nqmYkjJgSgB/IRja6MfrIue0re
	 vzi/mCxqv51nkQ/jXoxJGslxFjz288XftiQTGncQbwbHxkE3SZuHba6z1OsNneHrky
	 7b8UmG1yF0eQ44o1nDm2zPozg2+J3BqdxaFouGK6s06SJh9XYT527l1qohMcSAiS/Y
	 YTgP71PC1zz0PF9km5sT1l3c6DQj9O4BTImKlLmLgTmf+xI51wDrkCPGAN7LCGzO+l
	 t3tlmvlAJVAGRAkh18CvOBnxlghbgpU50aFePVsELZcxyY24IctuLnhMHCQAEADUjN
	 CD7XbmpJ/8Dng==
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
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
In-Reply-To: <DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org> (Benno Lossin's message
	of "Fri, 27 Jun 2025 10:23:16 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
	<COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid>
	<DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org>
	<smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid>
	<DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org>
	<Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid>
	<DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org>
	<RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid>
	<DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org>
	<87plepzke5.fsf@kernel.org>
	<xFouVLxX1_t1mH69FDYwlIhBlI72M0IzQEKn0ntG_wT9z7V5DtbxiwVP_frH_yiS-Gf0q_AhqetbLmuvJ_yP5Q==@protonmail.internalid>
	<DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 30 Jun 2025 13:18:50 +0200
Message-ID: <87wm8txysl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Fri Jun 27, 2025 at 9:57 AM CEST, Andreas Hindborg wrote:
>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>> That's good to know, then let's try to go for something simple.
>>>>
>>>> I don't think that we can just use a `Mutex<T>`, because we don't have a
>>>> way to create it at const time... I guess we could have
>>>>
>>>>     impl<T> Mutex<T>
>>>>         /// # Safety
>>>>         ///
>>>>         /// The returned value needs to be pinned and then `init` needs
>>>>         /// to be called before any other methods are called on this.
>>>>         pub unsafe const fn const_new() -> Self;
>>>>
>>>>         pub unsafe fn init(&self);
>>>>     }
>>>>
>>>> But that seems like a bad idea, because where would we call the `init`
>>>> function? That also needs to be synchronized...
>>>
>>> Ah, that is unfortunate. The init function will not run before this, so
>>> we would need a `Once` or an atomic anyway to initialize the lock.
>>>
>>> I am not sure if we are allowed to sleep during this, I would have to
>>> check. But then we could use a spin lock.
>>>
>>> We will need the locking anyway, when we want to enable sysfs write
>>> access to the parameters.
>>>
>>>>
>>>> Maybe we can just like you said use an atomic bool?
>>>
>>> Sigh, I will have to check how far that series has come.
>>>
>>
>> I think I am going to build some kind of `Once` feature on top of
>> Boqun's atomic series [1], so that we can initialize a lock in these
>> statics. We can't use `global_lock!`, because that depends on module
>> init to initialize the lock before first use.
>
> Sounds good, though we probably don't want to name it `Once`. Since it
> is something that will be populated in the future, but not by some
> random accessor, but rather a specific populator.
>
> So maybe:
>
>     pub struct Delayed<T> {
>         dummy: T,
>         real: Opaque<T>,
>         populated: Atomic<bool>, // or Atomic<Flag>
>         writing: Atomic<bool>, // or Atomic<Flag>
>     }
>
>     impl<T> Delayed<T> {
>         pub fn new(dummy: T) -> Self {
>             Self {
>                 dummy,
>                 real: Opaque::uninit(),
>                 populated: Atomic::new(false),
>                 writing: Atomic::new(false),
>             }
>         }
>
>         pub fn get(&self) -> &T {
>             if self.populated.load(Acquire) {
>                 unsafe { &*self.real.get() }
>             } else {
>                 // maybe print a warning here?
>                 // or maybe let the user configure this in `new()`?
>                 &self.dummy
>             }
>         }
>
>         pub fn populate(&self, value: T) {
>             if self.writing.cmpxchg(false, true, Release) {
>                 unsafe { *self.real.get() = value };
>                 self.populated.store(true, Release);
>             } else {
>                 pr_warn!("`Delayed<{}>` written to twice!\n", core::any::type_name::<T>());
>             }
>         }
>     }
>
> (no idea if the orderings are correct, I always have to think way to
> much about that... especially since our atomics seem to only take one
> ordering in compare_exchange?)
>
>> As far as I can tell, atomics may not land in v6.17, so this series
>> will probably not be ready for merge until v6.18 at the earliest.
>
> Yeah, sorry about that :(

Actually, perhaps we could aim at merging this code without this
synchronization? The lack of synchronization is only a problem if we
support custom parsing. This patch set does not allow custom parsing
code, so it does not suffer this issue.


Best regards,
Andreas Hindborg




