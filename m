Return-Path: <linux-kbuild+bounces-5399-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9923A05BE3
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 13:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66C407A2419
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 12:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0C61F63C9;
	Wed,  8 Jan 2025 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5XSw59i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1B1A239D;
	Wed,  8 Jan 2025 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340332; cv=none; b=O52mOWhkOJ2YK6SahCNOXZuFympIy69Qc8stKNg4wu1BhoTnWlJ7Vcj3/gHkvMhEeSOQliMSOiHDGEipCNgzZ0m6jFvda7jfSgu3q7JD2CfQVsfCwljeu+7lmbjnffJVgxQ83XinjWUAvlLjldOZ+7olTDZhUb8TIkFS6rrShfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340332; c=relaxed/simple;
	bh=IF8cbp+7gNJeGLCETAgpwe4NyF9qqSHtjma2BuF+uMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BYf/reCx7JpKd37iEcKuXDbiqdoDisnd0neZx6hOBk1eS5Poz0uOTWIpNGDZqV32lTFNQnNPmuUr1tAy4K35wEXGfOs+qyJefcxZkZ7m45p3HmRCH3hKsWMlaQmY8NnoV/1utB3WGVcOtQkoOOOwxMhBzEVkMOO3kW4+vAsAs50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5XSw59i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B776C4CEDD;
	Wed,  8 Jan 2025 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736340331;
	bh=IF8cbp+7gNJeGLCETAgpwe4NyF9qqSHtjma2BuF+uMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=t5XSw59iEASl0rRz8F6kTdUMM3UrJl11HK/sDXy8g8wMeMvG1XJcUhscfigclcKds
	 jZuFiaurMx5sQWi+CBTF6aK8zLpT5RRLEhj8Enb4gU4wED1DkSSWHLWVdajiH+C6Ub
	 o/DOA4kcuH6dw+mWJh44Vj6UfehxgFcCKMUgkbr7Fwn/0IChYNCc/yB1Jaev2oM52L
	 9A3F1pSwC/alTWyku/eyeQCoJXtxPjAw5JJJyVMujFcJuxllgb7LDLfYxnBsUgQjd6
	 j7i9cWgl1ek4fUYVzxRbS8fN1q0YbcwdVoh150cecj4+XYyw544ggg7bFEvH85EsbC
	 3nkPEsaP7mDFg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] rust: add parameter support to the `module!` macro
In-Reply-To: <CANiq72nBpVy911cVhNFM6teQ0EaE-xs0SB2Qx95O4=nKBdRDuQ@mail.gmail.com>
 (Miguel
	Ojeda's message of "Fri, 13 Dec 2024 18:14:37 +0100")
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
	<20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org>
	<pw5PzA4YGsu7j6ET_-OYE2oq9l7ixtTTGhHtxMxmMP5ggHxLrjzMkNMvcMVjGPhu7FpBb2duDD3bRbtMJZZHIw==@protonmail.internalid>
	<CANiq72kb2ocNuE6n32vr4xCkZhZN0uPuCN3SFA1+Q5L+Ma4ByQ@mail.gmail.com>
	<87y10jd8o0.fsf@kernel.org>
	<Tq7yfG7Ag6jqd_ns9qvfEn2KFLl_oJxBm6YwKDey8kbCE9-rDnkN84aW29C4_w1T6FkhDhzPsLeH0XYKe2WSSQ==@protonmail.internalid>
	<CANiq72nBpVy911cVhNFM6teQ0EaE-xs0SB2Qx95O4=nKBdRDuQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 08 Jan 2025 13:45:20 +0100
Message-ID: <87tta9bhjz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Dec 13, 2024 at 2:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> scheduled for removal. Interior mutability via `SyncUnsafeCell` provides
>> the same functionality and it is my understanding that this feature is
>> on track to be stabilized.
>
> I am not sure about the last bit, but even if it is on track, we do
> not want to start using new language features or APIs that could
> potentially change.
>
> And even if it is a feature that we are sure will not change, we
> should still let upstream Rust know before using it, since we are
> actively discussing with them the remaining unstable items that the
> kernel needs and they are putting the kernel in their roadmap.
>
> So I suggest we mention it next week in the Rust/Rust for Linux meeting.

I don't think we ever discussed this?

I was going to put this in the commit trailer for v4:

---
Version 3 of this patch enabled the unstable feature `sync_unsafe_cell` [1]=
 to
avoid `static mut` variables as suggested by Trevor Tross and Benno Lossin =
[2].

As we are moving closer to a new edition, it is now clear that `static mut`=
 is
not being deprecated in the 2024 edition as first anticipated [3].

Still, `SyncUnsafeCell` allows us to use safe code when referring to the
parameter value:

```
{param_name}.as_mut_ptr().cast()
```

rather than unsafe code:

```
unsafe { addr_of_mut!(__{name}_{param_name}_value) }.cast()
```

Thus, this version (4) keeps the feature enabled.

[1] https://github.com/rust-lang/rust/issues/95439
[2] https://lore.kernel.org/all/CALNs47sqt=3D=3Do+hM5M1b0vTayKH177naybg_Kur=
cirXszYAa22A@mail.gmail.com/
[3] https://github.com/rust-lang/rust/issues/53639#issuecomment-2434023115
---

What do you think?

>
>> Not sure. `val` being null not supposed to happen in the current
>> configuration. It should be an unreachable state. So BUG is the right th=
ing?
>
> Since you can easily return an error in this situation, I would say
> ideally a `WARN_ON_ONCE` + returning an error would be the best
> option, and covers you in case the rest changes and someone forgets to
> update this.

Returning an error and `pr_warn!` is doable. As far as I can tell, we do
not have `WARN_ON_ONCE` yet?

>
>> Not in the current configuration. The parameters can only be declared
>> "read only". It should be impossible for anyone to call this function.
>
> What I meant is, can you avoid writing the function to begin with, by
> leaving a null function pointer in the `kernel_param_ops` struct, i.e.
> `None`?
>

It turns out we can!


Best regards,
Andreas Hindborg



