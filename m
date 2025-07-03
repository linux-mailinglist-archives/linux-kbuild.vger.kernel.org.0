Return-Path: <linux-kbuild+bounces-7850-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A563AF6C07
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 09:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08DD13A5E80
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 07:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FA029A9D2;
	Thu,  3 Jul 2025 07:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSfuUiOA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D24225D6;
	Thu,  3 Jul 2025 07:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529079; cv=none; b=V8cIlJsimy6W2bhUpW7AmX/7cVQAwFPtltb717cbDQFetNFNIZ4PZwdmD19epL2p4NHf/gzY7AY5nsDrzIA3lx4ubJSNkRMITGzA1wiQY/4gi0ZBA/bo5ToQ2LTDYKbLa6NCwZyb/DmCJURHWq5u80b9siCWHOyfkrt2ZJRwKjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529079; c=relaxed/simple;
	bh=RjRLZxr33+J8jGIO+4wFE0QODeYW14cbDpVhMRCXyzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LJHTY52kG69aQfMUBCYVCioR8K0xCcdm8NuGsTSfXmZzewr9Y9J/rTx4IHLemHdfsUDkEOSFW9Nd0+Q33qXJpWH8519b6mygKgOUmBUAKds7E55dfZkA07G1vw/whLRD64bgDTkjQngUl05hFmHihpTKObiS+beQsWJzeMkEt8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSfuUiOA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BEDC4CEE3;
	Thu,  3 Jul 2025 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751529078;
	bh=RjRLZxr33+J8jGIO+4wFE0QODeYW14cbDpVhMRCXyzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NSfuUiOASqRQpZFRrGCU7ZUHkLJc7KgPAY5TYu+KdCpmFzw1+YucYfWmsSXzFhDEQ
	 FVJIeIFUDxpa3JpCSqMf1WhopmXCPb2dSToLwdewUyRADFMrbCHVjPZJ45Wa+LuY+1
	 m2eBMiwbSQFo4GIVNtKJ9aiBru81ZBB8z8/nuAlyQ7MoX8Oyo1zLAQBc2Lc6fvEHbb
	 EgqvTWIU51NqDkvJE0xbfWhx0y4xfSIDU1EtrM1DlEysM1dAmWanls/liGVmtKErF9
	 2t5IdX5wW0VOHTcTWJmCe5HAOZNWuz4UkLHmtH0dNmZ9yKIpS+OL6rpk4+rWz/WZo7
	 oCWog3bdFmU2w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Luis Chamberlain" <mcgrof@kernel.org>,  "Danilo
 Krummrich" <dakr@kernel.org>,  "Benno Lossin" <lossin@kernel.org>,
  "Nicolas Schier" <nicolas.schier@linux.dev>,  "Trevor Gross"
 <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
In-Reply-To: <CAH5fLggY2Ei14nVJzLBEoR1Rut1GKU4SZX=+14tuRH1aSuQVTA@mail.gmail.com>
 (Alice
	Ryhl's message of "Wed, 02 Jul 2025 16:50:30 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
	<QU7IDrQqnXyNZDFF_jgZ4qTsRLPmUeeWedU_T1i11uOyc1E83Zo4tETj_oPxSfJySNZZ4-XEVBlkZJ-MZech4g==@protonmail.internalid>
	<CAH5fLghw5TDrzmFZB=tORR5Lxx4WoG4wer6y5NuFdod2_tb6zg@mail.gmail.com>
	<87ms9mvgu4.fsf@kernel.org>
	<SDwHRzxHLJf3WmFylTkCMs-bN75ZgNVkG6K2JZhoGkL0SCcJOgsJjscF7NIMJnuW-iqrtl1lqwe8ACZmZzamZw==@protonmail.internalid>
	<CAH5fLggY2Ei14nVJzLBEoR1Rut1GKU4SZX=+14tuRH1aSuQVTA@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 09:51:06 +0200
Message-ID: <87h5ztvhjp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Wed, Jul 2, 2025 at 3:54=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > On Wed, Jul 2, 2025 at 3:19=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
>> >>
>> >> Introduce the `OnceLock` type, a container that can only be written o=
nce.
>> >> The container uses an internal atomic to synchronize writes to the in=
ternal
>> >> value.
>> >>
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >
>> > This type provides no way to wait for initialization to finish if it's
>> > ongoing. Do you not need that?
>>
>> I don't, and in my use case it would cause a deadlock to wait. Anyway,
>> it might be useful to others. Would you add it now, or wait for a user?
>
> Waiting would require additional fields so it should probably be a
> different type.

That depends on the kind of waiting. If we do unfair waiting, with
spinning, we can have unlimited waiters with this type. We can also use
the remaining 29 bits of the atomic to encode ordering to get fair
queuing for spinning waiters.

Putting waiters to sleep would require more fields.

> It's more that we probably want the OnceLock name for
> that other type for consistency with stdlib, so perhaps this should be
> renamed? The name could be SetOnce or similar.

The feature set is very similar to `std::sync::OnceLock`, that is why I
picked that name. We can expand this to allow resetting without too much
effort, and we can do fair waiting with spinning for a reasonable amount
of waiters.

But I am also OK with changing the name to `SetOnce` if we envision a
`OnceLock` with thread sleep blocking at some point.


Best regards,
Andreas Hindborg





