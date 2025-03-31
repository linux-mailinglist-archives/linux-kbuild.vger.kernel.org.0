Return-Path: <linux-kbuild+bounces-6371-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F213EA766F3
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Mar 2025 15:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 553923A731E
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Mar 2025 13:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1291F211710;
	Mon, 31 Mar 2025 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VasNy2em"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74411DFE0A;
	Mon, 31 Mar 2025 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743428081; cv=none; b=ZlVIMWFrTBpTXxRHayrvEiES1cmP1z1F4RKAW2ZZeFN8F36Vn55Iud9fFZRE48iPIeeUSuAcCdIOHYYRDfERStd0skA2wSOwJTs6fzF408AojnHdGsmucuW8sUP+V4/x2ZfULHjg7r2KcJpDfpPZCZSRJWJLogsanjNTBK4blRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743428081; c=relaxed/simple;
	bh=xyF6jByBYOwL1OaHoxuZB6+If5bULRXAgVvZaJT2U0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N73cWsEZuBExpULJ3fxnawll2thgPUaBfGB4ljl/uurYW/h4EXXmLL+4zuYnwb61TLh7sB/AqYrP4G0tRNmhECROskFv2YiqfgU7f7VkJLl0fHugOlHe/fWgcZzzMW2fSXXdDo8K1vCwd8Xkx874bcCBqh0j2CRZZ7ygdGpEojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VasNy2em; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC926C4CEE3;
	Mon, 31 Mar 2025 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743428080;
	bh=xyF6jByBYOwL1OaHoxuZB6+If5bULRXAgVvZaJT2U0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VasNy2emhZWBkQOMZHEZilIDBS5l8ksvzGsU2ATYv/Q8S+DacHJGV6qQhyaJr3x3t
	 8QjAnMHNOc68n+8AJcRYaX+ZP08Gahstmuip+qt5vHd1DtS6AVzAytehhyxGluX6+D
	 Rrly1ScTx/dXtS+C/10iM3YNBBdmj9F9xNEd5iN3hIaWW/XK8OdyL5ydoEcNQIlKx9
	 kHLxeSjyUqJbIKfCJjieALs2q5m8w9li/WZPF86ue5UjHsfDw08GrtV1KOEZnI6V7P
	 0WN5orpWnWlSTEAnjhUZBqQlXIoWqbbMikBb9QtR4eXzZd1+ES+O3d7C/x730KXxk2
	 mJvxeAA350olg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Trevor Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye"
 <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,  "Fiona
 Behrens" <me@kloenk.dev>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v9 1/3] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <CANiq72kSG8oGi9P4=AQ+JjgZk0q31PcZkHRYNF5tCxn9mvcJ0A@mail.gmail.com>
 (Miguel
	Ojeda's message of "Mon, 31 Mar 2025 12:33:37 +0200")
References: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org>
	<20250321-module-params-v3-v9-1-28b905f2e345@kernel.org>
	<SkKHBRFCoKN2SGGuG7h1JCsRotHC2ROoYQILjS8YNssEo3XS1u3SwPT48TTGyMS7RDpD6aMXr28tAGnUeLsE-Q==@protonmail.internalid>
	<CANiq72kSG8oGi9P4=AQ+JjgZk0q31PcZkHRYNF5tCxn9mvcJ0A@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 31 Mar 2025 15:34:27 +0200
Message-ID: <87semt493w.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Mar 21, 2025 at 10:18=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> Add the trait `ParseInt` for parsing string representations of integers
>> where the string representations are optionally prefixed by a radix
>> specifier. Implement the trait for the primitive integer types.
>>
>> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> I had applied the following comments in v8 when I originally took it
> before discovering the UB -- since this patch may finally go through
> modules (or not), Andreas asked me to put them here:
>
>     [ Added integer type suffixes to `assert!`s for consistency with the
>       others. Changed links to docs.kernel.org. Applied Markdown and
>       intra-doc links where possible. Changed to `///` for `mod` docs.
>       Slightly reworded comment. Pluralized section name. Hid
>       `use`s. Removed `#[expect]` for the `rusttest` target. - Miguel ]
>
> Attached range diff of what I did.
>
> I hope that helps!

Thanks Miguel!

I will add the diff to the next spin.


Best regards,
Andreas Hindborg




