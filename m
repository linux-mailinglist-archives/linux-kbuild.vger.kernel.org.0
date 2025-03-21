Return-Path: <linux-kbuild+bounces-6273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6D4A6B589
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 08:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2099B3B44B7
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 07:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EE81EE02F;
	Fri, 21 Mar 2025 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdhqTBW5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C603715820C;
	Fri, 21 Mar 2025 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742543653; cv=none; b=ZsVdBCHk09D5VsJC78WbQdT7E6THpTuhHfHCVm4M5eHlWnqt6Utb/snMlO3D5zX27JNq+DdQ23DUzsLP4Da1GG57fYrEBgEdRzsIr5fJlk2TolbqV71aJWOF09SvHZ0QXwQnjyeFFayAorvemtXYk/A5bhx3kxcD8fqz/zGcAZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742543653; c=relaxed/simple;
	bh=vcghkUr7zjsU1J59DBnO3HcwXjT6KN5LxU6KUTtpxXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lQ98KmBlAe/emexQH/x77H5E1gDuN3LS/NX/jx8ICUzSK+2O2zeqD4NoR3NwRUwBa24m/ZitBLQX2yJzj+kLr0LqJq4hbye4B9uVkXvxKhEyFlMPOCyHi2V5AKRnn+hXiwlj7trs/EZUuPWlCV9DEUiRrLmJW/M/h4NrXhSwMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdhqTBW5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C154C4CEE3;
	Fri, 21 Mar 2025 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742543653;
	bh=vcghkUr7zjsU1J59DBnO3HcwXjT6KN5LxU6KUTtpxXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bdhqTBW5PCwYIb83MM5cg32UOOJrwYf78YzfIQKNQI1wP6PrHHj3QKOuwxlFUOF8s
	 Cn31hJNnXJ+VsZLgKcsTsL0oS6oTT/CoprixfM6Wo/FD+2AfswYzYW6KuNh9I/v7o8
	 NfRuygHQouOxjwPPdswYAuoxuUsOPoxquvrd/cczvO6ocXaNzQGA8VJqrhRvdwGHKU
	 Q6Qkh+YAGoEYsOXuvA7CFN3Ewcyfd9Tbxk5f5fAeyJTZBJgPiADbxopShA/UGPvRLy
	 2rRKpT53Rh5c2IfRr0N4IQSkS9R9Wje8uJYmChjgdfYGKg/L5dXxmdZeChEIsFWQ1j
	 1gLsoYjtREhaQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v8 5/7] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <CANiq72kGzB2CdGMcaftfg2eYvu_rBtH2_gxqVt7KE7RQxCgz8Q@mail.gmail.com>
 (Miguel
	Ojeda's message of "Thu, 20 Mar 2025 21:21:39 +0100")
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
	<20250227-module-params-v3-v8-5-ceeee85d9347@kernel.org>
	<AQOXp6PZFJn4kOjCa-G_hK-4cOZLQSA-N588Hvd0Gjwu0jriKwODiCpAuczfyNQ3iHgJLjEVqO105YjH_xE9aw==@protonmail.internalid>
	<CANiq72kGzB2CdGMcaftfg2eYvu_rBtH2_gxqVt7KE7RQxCgz8Q@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 21 Mar 2025 08:53:59 +0100
Message-ID: <87zfheddk8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Feb 27, 2025 at 3:39=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> +                    // SAFETY: We checked that `val` will fit in `Self`=
 above.
>> +                    let val: Self =3D unsafe { val.try_into().unwrap_un=
checked() };
>
> This is wrong -- `val` can be the maximum, and thus it does not fit
> since it is 2's complement, even if later the complement would.
>
> In fact, it is caught by the doctest when run with debug assertions enabl=
ed:
>
>    /// assert_eq!(Ok(-128), i8::from_str(b_str!("-128")));
>
> We try to put 128 into `i8`, which of course does not work...

Thanks for catching this! I have to start running tests with debug
assertions, it makes no sense not to do so.

I'll send a new version now, hope it will make the cut.


Best regards,
Andreas Hindborg




