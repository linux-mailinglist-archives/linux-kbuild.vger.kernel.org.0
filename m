Return-Path: <linux-kbuild+bounces-5862-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EEA406CE
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2025 10:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC5043BEDC6
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2025 09:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CAA2063FC;
	Sat, 22 Feb 2025 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MG81fplp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443812066C6;
	Sat, 22 Feb 2025 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216333; cv=none; b=QjVYOgAGYW24eGu8+R+gfhCN2Cq7+yMilrMBd3dBc1v3czolDX710a461rBWj4toO5AjWiGx+onZ1hNaEkPEepyHgV1plSiwPelKb7R6MEVvM/6YUsNXln1FLlsmUKchOWDuIclCSnibtpmjNJzKwvpOBK6c6+lFRyNYR8f7bpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216333; c=relaxed/simple;
	bh=56hDo32Azb2ahbyNFuHrL/IGY3jiwnJ7XKs0zeaPLXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ItHqEPXSFfJgsWXWWEw4tO55FT92r5aqVNMC7/qRKGQBgBjuNRpx9RRtX2Bm5YlGhldYupWGTCIRndbgPIhOPN2xtdJ8e1FNeeU3IVKoIwBX8PfS5EOB7n+Ixbb/uDc0S1LbhSRSrWSfiuku3ML0ERePDz/Kn9XAkq3CmyaUtxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MG81fplp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1056C4CED1;
	Sat, 22 Feb 2025 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740216332;
	bh=56hDo32Azb2ahbyNFuHrL/IGY3jiwnJ7XKs0zeaPLXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MG81fplpFrsuDjg3WTz0jxHwueyoxNfjF4uKD6V0q2v05PQLkIXqjRgb/YMy+oQlw
	 iATZasoPsLb2y+5xa6e5cugeRiUzD2D5oyUtRJCxaD5Fjw51+nhhyzvhaKQpJK4eBs
	 5EKtZo25IiwPPER++nRnpdBWSIqxueH4w5OhbZkSO4hJweK6acRZ7jVRY/4l1bZtOK
	 eFHtRhgiBYl75vX9kbMiMod8EuWCt2rMie51f6Edp0+XvbvMFGshi9x/QUOnPSYTBP
	 ByjbOI1RRLBo4VFw5uaXFVwkf6b5qc5ie4rC2hyBgy7MeEnjAfNd++zaTJHux9I7T3
	 VPnMp+2oYN5Pw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  "Adam Bratschi-Kaye"
 <ark.email@gmail.com>,  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu"
 <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v7 0/6] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <F882BB02-A795-4F79-A2AF-CBA9608470A5@collabora.com> (Daniel
	Almeida's message of "Fri, 21 Feb 2025 12:45:48 -0300")
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
	<UymzM42tyVZD_DUcMoDIfNqTrk-B7QbvdKTEvMOjrOtwnqYN7v1fK2dLnKnGAyND_6LOE4bhRxwzd1GH9SqrLQ==@protonmail.internalid>
	<F882BB02-A795-4F79-A2AF-CBA9608470A5@collabora.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sat, 22 Feb 2025 09:49:13 +0100
Message-ID: <874j0me54m.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

> Hi Andreas,
>
>> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>> This series extends the `module!` macro with support module parameters. =
It
>> also adds some string to integer parsing functions and updates `BStr` wi=
th
>> a method to strip a string prefix.
>>
>> This series stated out as code by Adam Bratschi-Kaye lifted from the ori=
ginal
>> `rust` branch [1].
>>
>> After a bit of discussion on v3 about whether or not module parameters
>> is a good idea, it seems that module parameters in Rust has a place
>> in the kernel for now. This series is a dependency for `rnull`, the Rust
>> null block driver [2].
>>
>
> ```
> $ sudo modprobe rust_minimal test_parameter=3D2
> [  251.384125] rust_minimal: Rust minimal sample (init)
> [  251.384600] rust_minimal: Am I built-in? false
> [  251.385010] rust_minimal: My parameter: 2
> ```
>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
>
> IMHO, this is slightly confusing, since the parameter is named
> =E2=80=9Ctest_parameter=E2=80=9D, but you=E2=80=99re printing =E2=80=9CMy=
 parameter=E2=80=9D.

You are right, let's change that to "test_parameter: ".


Best regards,
Andreas Hindborg




