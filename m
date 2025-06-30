Return-Path: <linux-kbuild+bounces-7788-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D95AEDCBD
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 14:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29D271897C6E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 12:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9C027055A;
	Mon, 30 Jun 2025 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9r2lQ7x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D06A21C186;
	Mon, 30 Jun 2025 12:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286475; cv=none; b=CZDn/FIrxj17YMETFd97b5HQYTWIjZj/cGbFoq90WAWiZfg9+lY45v03P7LgHi9yAMbtR5S8SmX4yjVdtjROiqFedrXKZiF6q2QpdTf450f+YEO0vdJ7UnjYuXXyy6EKu598u0JHKqvHF08beoz9w2SZbckbh11bxL86JllnaZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286475; c=relaxed/simple;
	bh=TdkNbXOSEdCNBRION+A5vF/XNr0ga0/GKwNsi4yCSA4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=tkIbmU0RdJfgyFcHfGYwambzjrlJPFJakGFLpxf/xuNz96ECPbVX5VQqwVWa1RevYDKdtLXLUi69MSALJs4R9NReAGZmQjfZW0iEf/n7i2n13XXPBT+KjNRS2H7Dqpyq+VCIBLMgZRrYGb4BYSmkOoDgLEjJAubCWlrvwf778VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9r2lQ7x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9E8C4CEE3;
	Mon, 30 Jun 2025 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751286473;
	bh=TdkNbXOSEdCNBRION+A5vF/XNr0ga0/GKwNsi4yCSA4=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=C9r2lQ7xLa1CG57hZnMQ/cxxrJVKBryIAUf2UHq1rW95CIn3COVgtCw7EL7CMLjqJ
	 qGsXMAYq87zlK4fTVlB85LpFzDlo2OJHlWpwqE5N7huY7w2eBO/qcIrBFe3p1bwSjI
	 eTWUy65fz/ge31BZV9MlalxKOPrPu0geyfIBcafy8x68VIVA3ZsgM5JUIxySBFrBpq
	 zXLnQdUOYJeQhDYT98BDykMc3TvQ9yHfmJr+5JdFIiVmnWs/qHvoWT0lVVDO2NUigw
	 LPyymUz/9YoIFG4L4FJCdSHBLG/vZKVywkmpcR83yq6gtgmCLmK453RqgGXnCB9hC3
	 t5QsfuimZgVIw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 14:27:47 +0200
Message-Id: <DAZV8OGL8BMH.11SLXBXQ17ZJ9@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
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
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
 <COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid> <DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org> <smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid> <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org> <Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid> <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org> <RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid> <DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org> <87plepzke5.fsf@kernel.org> <xFouVLxX1_t1mH69FDYwlIhBlI72M0IzQEKn0ntG_wT9z7V5DtbxiwVP_frH_yiS-Gf0q_AhqetbLmuvJ_yP5Q==@protonmail.internalid> <DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org> <87wm8txysl.fsf@kernel.org>
In-Reply-To: <87wm8txysl.fsf@kernel.org>

On Mon Jun 30, 2025 at 1:18 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Fri Jun 27, 2025 at 9:57 AM CEST, Andreas Hindborg wrote:
>>> Andreas Hindborg <a.hindborg@kernel.org> writes:
>>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>>> That's good to know, then let's try to go for something simple.
>>>>>
>>>>> I don't think that we can just use a `Mutex<T>`, because we don't hav=
e a
>>>>> way to create it at const time... I guess we could have
>>>>>
>>>>>     impl<T> Mutex<T>
>>>>>         /// # Safety
>>>>>         ///
>>>>>         /// The returned value needs to be pinned and then `init` nee=
ds
>>>>>         /// to be called before any other methods are called on this.
>>>>>         pub unsafe const fn const_new() -> Self;
>>>>>
>>>>>         pub unsafe fn init(&self);
>>>>>     }
>>>>>
>>>>> But that seems like a bad idea, because where would we call the `init=
`
>>>>> function? That also needs to be synchronized...
>>>>
>>>> Ah, that is unfortunate. The init function will not run before this, s=
o
>>>> we would need a `Once` or an atomic anyway to initialize the lock.
>>>>
>>>> I am not sure if we are allowed to sleep during this, I would have to
>>>> check. But then we could use a spin lock.
>>>>
>>>> We will need the locking anyway, when we want to enable sysfs write
>>>> access to the parameters.
>>>>
>>>>>
>>>>> Maybe we can just like you said use an atomic bool?
>>>>
>>>> Sigh, I will have to check how far that series has come.
>>>>
>>>
>>> I think I am going to build some kind of `Once` feature on top of
>>> Boqun's atomic series [1], so that we can initialize a lock in these
>>> statics. We can't use `global_lock!`, because that depends on module
>>> init to initialize the lock before first use.
>>
>> Sounds good, though we probably don't want to name it `Once`. Since it
>> is something that will be populated in the future, but not by some
>> random accessor, but rather a specific populator.
>>
>> So maybe:
>>
>>     pub struct Delayed<T> {
>>         dummy: T,
>>         real: Opaque<T>,
>>         populated: Atomic<bool>, // or Atomic<Flag>
>>         writing: Atomic<bool>, // or Atomic<Flag>
>>     }
>>
>>     impl<T> Delayed<T> {
>>         pub fn new(dummy: T) -> Self {
>>             Self {
>>                 dummy,
>>                 real: Opaque::uninit(),
>>                 populated: Atomic::new(false),
>>                 writing: Atomic::new(false),
>>             }
>>         }
>>
>>         pub fn get(&self) -> &T {
>>             if self.populated.load(Acquire) {
>>                 unsafe { &*self.real.get() }
>>             } else {
>>                 // maybe print a warning here?
>>                 // or maybe let the user configure this in `new()`?
>>                 &self.dummy
>>             }
>>         }
>>
>>         pub fn populate(&self, value: T) {
>>             if self.writing.cmpxchg(false, true, Release) {
>>                 unsafe { *self.real.get() =3D value };
>>                 self.populated.store(true, Release);
>>             } else {
>>                 pr_warn!("`Delayed<{}>` written to twice!\n", core::any:=
:type_name::<T>());
>>             }
>>         }
>>     }
>>
>> (no idea if the orderings are correct, I always have to think way to
>> much about that... especially since our atomics seem to only take one
>> ordering in compare_exchange?)
>>
>>> As far as I can tell, atomics may not land in v6.17, so this series
>>> will probably not be ready for merge until v6.18 at the earliest.
>>
>> Yeah, sorry about that :(
>
> Actually, perhaps we could aim at merging this code without this
> synchronization?

I won't remember this issue in a few weeks and I fear that it will just
get buried. In fact, I already had to re-read now what the actual issue
was...

> The lack of synchronization is only a problem if we
> support custom parsing. This patch set does not allow custom parsing
> code, so it does not suffer this issue.

... In doing that, I saw my original example of UB:

    module! {                                                              =
                                                                 =20
        // ...                                                             =
                                                                 =20
        params: {                                                          =
                                                                 =20
            my_param: i64 {                                                =
                                                                 =20
                default: 0,                                                =
                                                                 =20
                description: "",                                           =
                                                                 =20
            },                                                             =
                                                                 =20
        },                                                                 =
                                                                 =20
    }                                                                      =
                                                                 =20
                                                                           =
                                                                 =20
    static BAD: &'static i64 =3D module_parameters::my_param.get();

That can happen without custom parsing, so it's still a problem...

---
Cheers,
Benno

