Return-Path: <linux-kbuild+bounces-7924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AE5AFC616
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 10:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59D734276B4
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 08:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32372BDC23;
	Tue,  8 Jul 2025 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVvy2ldA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F4E1E231E;
	Tue,  8 Jul 2025 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751964488; cv=none; b=Ny5Dx21eWmiCK6Aha4DwmHhbUAT/8px2IilaC3SVSe0LZyGeCgLH1pYmD0Iz0k74Tzo9Ie//uHA+dlAI5/FHdNacZ3QrVJ+LIsBd/eGSM2XoHumz6kmhMGdZHBW4U9Mi9Gh5c8goJTIwbytJI6c/NoiBw8lDhXiOjifm7uXYEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751964488; c=relaxed/simple;
	bh=nu58sHnwkVXGgc5nmEIoVZo4o9oFF2C6+nfFzXZ1s4A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cT/P/W94YA3t3KYLDoZHibHgiSnihcLtfltbguz4BmAT0SVpqeMFPP/XWtc40fVdxGahCCQc0dpmqKN2Vvls3T/Ew7IySW/gvJL572bkeWEKEwqt7jwWXLXk8LnktODX+Ow39P8kOTNqG9lHsWbuf6yeDVHSjL+8LNw76dM8Tu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVvy2ldA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8F4C4CEED;
	Tue,  8 Jul 2025 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964487;
	bh=nu58sHnwkVXGgc5nmEIoVZo4o9oFF2C6+nfFzXZ1s4A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YVvy2ldAkhT+2bdFXVYg9FStclkbIMbVPUBnePtFnpxgTb1yheiuZ97kSj/Vib+H6
	 Wed/8Gzf+VCi5tctz8zbHmOjcYQn8dzNESpGS8Joiw2iTsO8NYVMnv+SFijCqqKw0f
	 DoNWy+qbKYjW4sMtRcyha7UKhHBkcexdJsNcAPZ7+hMXaV3LK7PqiUrEN/5raX8SMa
	 3Qab1pAyKqAonUh4ExikPP0iFf+vmJoa/8UI/WK3QoMaf2ImNKQNbHLD580rHwhNlR
	 sUYtxSZuesDNwMIMiQ1C43Dxmh+VoosUOH0NacDujfMHER3EVJAUpD8wS1MTdqPkDS
	 X9rIIfrkG6EVw==
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
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
In-Reply-To: <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
 (Alice
	Ryhl's message of "Mon, 07 Jul 2025 15:38:58 +0200")
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
	<20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
	<miAy8nyEfpbNOEEKc8GGbUJCVpgjOlfffFKuSdwzwiFTR_Q-U3oUWKShLk_Qed5HHKwUEK-f_UA6nJbhrubQdw==@protonmail.internalid>
	<CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 08 Jul 2025 10:47:54 +0200
Message-ID: <87cyaboypx.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Introduce the `SetOnce` type, a container that can only be written once.
>> The container uses an internal atomic to synchronize writes to the inter=
nal
>> value.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> LGTM:
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
>> +impl<T> Drop for SetOnce<T> {
>> +    fn drop(&mut self) {
>> +        if self.init.load(Acquire) =3D=3D 2 {
>> +            // SAFETY: By the type invariants of `Self`, `self.init =3D=
=3D 2` means that `self.value`
>> +            // contains a valid value. We have exclusive access, as we =
hold a `mut` reference to
>> +            // `self`.
>> +            unsafe { drop_in_place(self.value.get()) };
>
> This load does not need to be Acquire. It can be a Relaxed load or
> even an unsynchronized one since the access is exclusive.

Right, that is actually very cool. My rationale was that if a reference
has been shared to another thread of execution, we would need to
synchronize here to see a possible initialization from that other
thread. But I guess it is impossible to end the lifetime of a reference
without doing a synchronization somewhere else.


Best regards,
Andreas Hindborg



