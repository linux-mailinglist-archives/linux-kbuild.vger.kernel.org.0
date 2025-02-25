Return-Path: <linux-kbuild+bounces-5900-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4941A43704
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 09:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0087B3BA7CA
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 08:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43462580F4;
	Tue, 25 Feb 2025 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QltTdTC7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9404D21577D;
	Tue, 25 Feb 2025 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740470934; cv=none; b=tGkO4OygFPUuB7Bx2g9AlGYF+LhUrySqNlpu4HUWrRf/53xt9oPhPdlxOfmMhEPGpIukPnpaDEYq1A36G4+uG0APCrVqJSyB3d2FIfWllGer39Sz/XcVtNbMjLnnIg5Z5zM7PY3REvjktqo97sTODjmFjKodfMTS93ImFdVU0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740470934; c=relaxed/simple;
	bh=sQAfVvcp7n1ezVIbtvacOocV6jhjjc+IvNo1mmfimAs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D41EiHktmVu9RDjtpqW72wLKG4bcScMQYeK3CXKcehWJymzsUrxKSI7tjn6zZjH3fZe73eRoO0ig3mV8UNFjnpYa6CHR1soOdlFjJgEw9wfyOu3Jpj1CVNi0piTLfDksGYRWpuBjdw63fekFZpLHew/TD29D+MGdyj+OsHqenjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QltTdTC7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7FBC4CEDD;
	Tue, 25 Feb 2025 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740470934;
	bh=sQAfVvcp7n1ezVIbtvacOocV6jhjjc+IvNo1mmfimAs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QltTdTC730e2XfTORBjLo/b8UfZZHeQCwQEBANfSrd3lgpPqdyodmLREjd7sM6I9m
	 yOWRZ9+4ZYl9EjB97+sSBOv0rTolcXjcuU1rNOiRrgRncJcBlTBf350QHcjtVKrAfT
	 5mTgpIXWX2iWvvI3xzQECPy4zQIFNVhu0OKqdZERZfSP4IP5GzvuvEHVymTUDi5vEb
	 HDFcoY3qcmDxMEmtiDtvTcKqlsf1Wb3LSU5BAzSjodWkdxu9rN8rKa8g6Ba09VQFYn
	 Hp0lWx0rSpJoALlhgDFjH3+rUsW8yGU4SIGE5Bc8X9K4ULxKdRXbZesZAc8RZZ83X8
	 3PKaUilpjMvJw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Janne Grunau" <j@jannau.net>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  "Adam Bratschi-Kaye"
 <ark.email@gmail.com>,  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu"
 <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v7 5/6] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <CANiq72ns264CeAHPKv9m4rUxS7b8J6+2Mwrk=+xSEQs5wPNoxg@mail.gmail.com>
 (Miguel
	Ojeda's message of "Tue, 25 Feb 2025 02:51:33 +0100")
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
	<20250218-module-params-v3-v7-5-5e1afabcac1b@kernel.org>
	<20250224223032.GA615664@robin.jannau.net>
	<d65H4u7WH99Iku0t8049xM2-SeBQVjpkNmYJdZadlG0WENXnb9BmG3U8DXYAQedZSSZ3C4ruU4D_cpEgwxgSxw==@protonmail.internalid>
	<CANiq72ns264CeAHPKv9m4rUxS7b8J6+2Mwrk=+xSEQs5wPNoxg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 25 Feb 2025 09:07:51 +0100
Message-ID: <87ikoyxx9k.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Feb 24, 2025 at 11:30=E2=80=AFPM Janne Grunau <j@jannau.net> wrot=
e:
>>
>> The errors go away after exchanging i128 with i64 (while breaking the
>> parsing for large values).
>
> I don't think we can use 128-bit integers unconditionally for all
> architectures (we could eventually get it to work for some though). So
> we should do one of the other approaches discussed in the previous
> versions, like call into the C one.

I don't want to call into the C functions for this task if I can stay in
safe Rust.

I think I can solve the issue by parsing into a unsigned version of the
integer and then test the sign bit, or compare against the max value for
the signed version.


Best regards,
Andreas Hindborg


