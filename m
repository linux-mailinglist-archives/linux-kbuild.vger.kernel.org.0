Return-Path: <linux-kbuild+bounces-7879-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33951AF9317
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 14:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E81B9581EFD
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 12:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AE72D8DC8;
	Fri,  4 Jul 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNtdw1EZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCF62D63E5;
	Fri,  4 Jul 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633298; cv=none; b=QESo4VfbJuS/kAup3eYzIdGJqmT8Vlrb3orZuI0YGm/VPXfJZ2mJi7W1sJIH2nYOBtNFmv0rCm/+6xOXeJDHIsleG9Z95tZ8366/B50Huwuq72o0NK6RLKiGfwHVCbM2S50SaTvIqJYT5h34vm3JFqGM4pwpbYmyIDUwuLyql6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633298; c=relaxed/simple;
	bh=Q/OqhCqpcLZ9R+W5WLDxBJI6aDdVQyPnr5OQ77cvkao=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oluXB9wEW0QU5z+Gg8mgIoEsB2FnL0wAmfVa09UmrBKbfuYcuolRWVdv8CVITt/24d9HveCq6xiS53GYE4e2+9qbBMiCWaLFfpexv9TOHDD/n2Z88+WYpEtuKX3L1FmxqqGWjFnMBx5AzmYPo4IgOv0pHumeQsmv+3mOPNMKEi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNtdw1EZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D685C4CEE3;
	Fri,  4 Jul 2025 12:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751633297;
	bh=Q/OqhCqpcLZ9R+W5WLDxBJI6aDdVQyPnr5OQ77cvkao=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=FNtdw1EZI48HnFvMGIaWmxY12hRcp2E7x+8Obpiq17tJLfjovbu668rDrbaUnqNXu
	 tMC65uR1CNpmuZHHUC73jJdEBHYvM2XqX1AIS3q05VUYWaARWGrKt8t74u3UqHP+S9
	 bXGFIs9nOzw57K4OL/+yHnZMR9etZkn0qmGub3GZmrvPKGwz3AGUQHfs77cwvJn2ci
	 pChafOq1GjvIygm95pfkOE316c6S3jO/P2ynr4jiHUZRtDpeuGXL2RjZ8NyBy3/Yiw
	 GvAx+1vAHMR2IDRhA8qJ6mmpvccl4d8Vo0DIpWM6NOwmCaoJgbM7D8uh+WN1HbMWvL
	 eAjDT+NQLh44w==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Jul 2025 14:48:10 +0200
Message-Id: <DB3A6GR3TQON.C9N9U4V48R1D@kernel.org>
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
Subject: Re: [PATCH v14 5/7] rust: module: update the module macro with
 module parameter support
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-5-5b1cc32311af@kernel.org>
 <5fYjUlNFhuBwWOP46ph07KX4CMe0ORT5pZ_pD-l719E0ChkPTI2pV1tYJcN3oxKKcMI8_HGU1InaWBj52Kbbag==@protonmail.internalid> <DB1OK2PQZ790.S317HUWYJR3J@kernel.org> <875xg8rvei.fsf@kernel.org>
In-Reply-To: <875xg8rvei.fsf@kernel.org>

On Fri Jul 4, 2025 at 2:29 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
>>> +                            perm: 0, // Will not appear in sysfs
>>> +                            level: -1,
>>> +                            flags: 0,
>>> +                            __bindgen_anon_1:
>>> +                                ::kernel::bindings::kernel_param__bind=
gen_ty_1 {{
>>> +                                    arg: {param_name}.as_void_ptr()
>>> +                                }},
>>
>> Formatting?
>>
>> +                            __bindgen_anon_1: ::kernel::bindings::kerne=
l_param__bindgen_ty_1 {{
>> +                                arg: {param_name}.as_void_ptr()
>> +                            }},
>
>
> That makes the line more than 100 characters after changing other
> formatting things. Perhaps I should just left shift all this?

Not sure what you mean by left shift? When I tried it, it was fine, but
it could have changed with the other things... Do you have a branch with
your changes?

---
Cheers,
Benno

