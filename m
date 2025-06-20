Return-Path: <linux-kbuild+bounces-7590-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7164AE19FE
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 13:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F29118948FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 11:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383D728A40F;
	Fri, 20 Jun 2025 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rACp/zYB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078562853EF;
	Fri, 20 Jun 2025 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418968; cv=none; b=mQDEzhGenSMUo+HZFfkul3KICuo0s+qM3unQ3WnDOUaVF4E6aoYMBwxpm+JXaagFd2KmNorU0ZTqlS1WMxw3Mw94lGXi4D9sPprzpgQc/8QBDn1DwuTyq/26NvRsf9kO3pznt3v1XLRU4B8XYetv0a1MIuTuuEsB30S2L/JOzjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418968; c=relaxed/simple;
	bh=toY/8RlMvZbaSXxFKcYu2G72F3PE0BpQoMJH1XDj3DE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U1K1UXJixmF4s5ZdEYb3FvlSpMSfiik+zRXTsYpoh8WpVj6jaH/syH6P0gy2Q7Thi+9V8O1gpn7btMEIMHgcD2X2lSZQM3tyYivLw6vaQAr7kPYUN54x40S5iuezIVnN+vlBYCbredDyhk7TQxcEz47LLEjZrgne9ASWavNYVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rACp/zYB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC79C4CEED;
	Fri, 20 Jun 2025 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418967;
	bh=toY/8RlMvZbaSXxFKcYu2G72F3PE0BpQoMJH1XDj3DE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rACp/zYBSDuBwdyMyauNMZ+PtNQx4mAX0MagrZFICgxBbzDorvHD3BbX77sBhT4+z
	 YCKWHq0j+0+7Zr5yt7rwmQvq3WFij9ipXbZQbjNjdazhhQgANwugyh0Y+imrI/ov+Z
	 TjDQjEBI9Mib/oZvblQav2X4I56jy6I4qisn4X5YdmcsF/gBpuNGzWhDljGMtJP8Bb
	 WfKA9JqMokqJYELT8W93LE13kleX7tRhc+Io20uMLYH7sXMilpkZT+qVZFmF/89NKy
	 BSRDXanCFJqHjtmhuqOtFFGz0sdptrc9+v0y1dAvwYTpvqLWm30FazxxM7FSfPvmcb
	 V15wQSiEcZpeQ==
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
In-Reply-To: <DAQIXKJ9VMS6.2044WT0FQQCVC@kernel.org> (Benno Lossin's message
	of "Thu, 19 Jun 2025 14:55:03 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
	<aa9d7lhjQuDhyNw8zShbtfPFK19W5awx7cPJgC-2X4fGv2yUTnn0jqyIHfMN4wyuaYoS3fU6Fqe_wFteVUGtUg==@protonmail.internalid>
	<DAPYMAB44RUZ.7NIWDUWY1UYF@kernel.org> <87v7or7wiv.fsf@kernel.org>
	<cYt7F9EQzCCQcq4wPsJlpuXF6bXYHVEq7yhlX8MMQbBIFr2zkJLktttiIwEl7oD5aaaFKp1Mco39U3mkfTvrGw==@protonmail.internalid>
	<DAQIXKJ9VMS6.2044WT0FQQCVC@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 20 Jun 2025 12:31:05 +0200
Message-ID: <87o6ui66xi.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Thu Jun 19, 2025 at 2:20 PM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:

[...]

>>>> +    crate::error::from_result(|| {
>>>> +        let new_value = T::try_from_param_arg(arg)?;
>>>> +
>>>> +        // SAFETY: By function safety requirements `param` is be valid for reads.
>>>> +        let old_value = unsafe { (*param).__bindgen_anon_1.arg as *mut T };
>>>> +
>>>> +        // SAFETY: By function safety requirements, the target of `old_value` is valid for writes
>>>> +        // and is initialized.
>>>> +        unsafe { *old_value = new_value };
>>>
>>> So if we keep the `ModuleParam: Copy` bound from above, then we don't
>>> need to drop the type here (as `Copy` implies `!Drop`). So we could also
>>> remove the requirement for initialized memory and use `ptr::write` here
>>> instead. Thoughts?
>>
>> Yes, that is the rationale for the `Copy` bound. What would be the
>> benefit of using `ptr::write`? They should be equivalent for `Copy`
>> types, right.
>
> They should be equivalent, but if we drop the requirement that the value
> is initialized to begin with, then removing `Copy` will result in UB
> here.
>
>> I was using `ptr::replace`, but Alice suggested the pace expression
>> assignment instead, since I was not using the old value.
>
> That makes sense, but if we also remove the initialized requirement,
> then I would prefer `ptr::write`.

OK, we can do that.


Best regards,
Andreas Hindborg



