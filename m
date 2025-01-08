Return-Path: <linux-kbuild+bounces-5402-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F2BA05E77
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 15:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A14E1626DE
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 14:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D461442F4;
	Wed,  8 Jan 2025 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQgJpl6G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9068F6B;
	Wed,  8 Jan 2025 14:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346046; cv=none; b=QshHIU/eUywHKMhPsnPzEAuHOg/xez5YclT+TtYlmH3qRhkMoieQWgL8mEE0LX6Ls48mcvs9gXXtukaB7yYmzF+Bvbg0iI2uJpRvlkZuYXtHNX0bVY0VOh6rAGZus4Ikl9ju4NaIQa1XzVhnzYSEFJVVEn9lt4RBl/+Q6A0xo/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346046; c=relaxed/simple;
	bh=+Ks5b42G4hIg6Ccv4uHBqGHIoJUD+5AVSo+CfnmUnYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i8eCdX35j0kAy/CamQC7xBPNonpF32GHASgJd/qLn9OiXCsWfcEsqDtngLCAQhPQJUbIU7R5D9MyJySdeeNifd+K2f+WlIaf8yB2yvtUWvNkL7fTYpr/maObEjcCl/NwqaJC6kwz8b7tb2jQL57UqCgvmyOzi5VYrLVIi1SOeds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQgJpl6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAF6C4CED3;
	Wed,  8 Jan 2025 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736346045;
	bh=+Ks5b42G4hIg6Ccv4uHBqGHIoJUD+5AVSo+CfnmUnYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NQgJpl6GuejCujL+PyOXqOIH1YkX6FdjFZg2aAw7zumcKvG4hi9OTStvVTc/kDMd+
	 YrQrKraB/LaqMBURCUy2RJH+SguI+GJHx6LVtjTd88mJYVO31eoVOhZg/M9JpCL5jv
	 RDMp92LPvXSIS5SZAyf4t1MLiNohUuWchLZPku/Yeoe7ZiQXR/Zxg+jX90x+gsvzsc
	 Xs3ZV3xM9FQuv7nRrxwSB6KEET0iLZmhtrgPTZ627bk/kyxxdJcqhQYbUAhOPIDADW
	 CO5DnhK1hYyCD+d6p/wsSHkdYmeBXx0wkI+6DgTY+f3za4HcJP97nOxTdPjECZL+cJ
	 MrnZp3qd6TwNA==
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
In-Reply-To: <CANiq72=XW1RtXuP4JRVEZzwBKtXOOkJCp3WBW-oEFWHQOf_kpg@mail.gmail.com>
 (Miguel
	Ojeda's message of "Wed, 08 Jan 2025 14:43:31 +0100")
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
	<20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org>
	<pw5PzA4YGsu7j6ET_-OYE2oq9l7ixtTTGhHtxMxmMP5ggHxLrjzMkNMvcMVjGPhu7FpBb2duDD3bRbtMJZZHIw==@protonmail.internalid>
	<CANiq72kb2ocNuE6n32vr4xCkZhZN0uPuCN3SFA1+Q5L+Ma4ByQ@mail.gmail.com>
	<87y10jd8o0.fsf@kernel.org>
	<Tq7yfG7Ag6jqd_ns9qvfEn2KFLl_oJxBm6YwKDey8kbCE9-rDnkN84aW29C4_w1T6FkhDhzPsLeH0XYKe2WSSQ==@protonmail.internalid>
	<CANiq72nBpVy911cVhNFM6teQ0EaE-xs0SB2Qx95O4=nKBdRDuQ@mail.gmail.com>
	<87tta9bhjz.fsf@kernel.org>
	<wULCAqwh_0ZzblArwyc0_DqnoisdHf1sm9VTBiPsIrgNlOKkDQFdgfJk2TUWWhZyZOaXZBrumSJMmLbsaaNHCA==@protonmail.internalid>
	<CANiq72=XW1RtXuP4JRVEZzwBKtXOOkJCp3WBW-oEFWHQOf_kpg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 08 Jan 2025 15:20:33 +0100
Message-ID: <87ldvlbd5a.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Jan 8, 2025 at 1:45=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> I don't think we ever discussed this?
>
> I don't think so -- we discussed other things related to 2025H1 the
> last meeting. Perhaps you/we can bring it up in the next one?
>
>> Version 3 of this patch enabled the unstable feature `sync_unsafe_cell` =
[1] to
>> avoid `static mut` variables as suggested by Trevor Tross and Benno Loss=
in [2].
>>
>> As we are moving closer to a new edition, it is now clear that `static m=
ut` is
>> not being deprecated in the 2024 edition as first anticipated [3].
>>
>> Still, `SyncUnsafeCell` allows us to use safe code when referring to the
>> parameter value:
>
>> What do you think?
>
> The justification seems fairly weak... Unless we are fairly confident
> the API will be stable (even if not stabilized right now), I am not
> sure why we would want to do this right now.
>
> Can we provide our own `SyncUnsafeCell` instead in the meantime, if
> you want to keep the advantages?

I like having the shared `ModuleParamAccess` struct to encapsulate the acce=
ss
to the parameters rather than emitting an enum for every parameter
instance. For that to work without unsafe code when the user accesses
the parameter value, we need a non-mutable static that provides interior
mutability.

I could implement `Sync` for `ModuleParamAccess` or I could add
`kernel::types::SyncUnsafeCell`. Either way is fine for me.

>
>> Returning an error and `pr_warn!` is doable. As far as I can tell, we do
>> not have `WARN_ON_ONCE` yet?
>
> Please see https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros=
-v4-0-410b8ca9643e@tuta.io/
> in case it helps.

Cool, I can list that as a prerequisite.


Best regards,
Andreas Hindborg



