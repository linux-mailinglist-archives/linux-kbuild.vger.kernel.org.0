Return-Path: <linux-kbuild+bounces-8547-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29118B2E4DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 20:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D5B3BBF7D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 18:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DB02749FE;
	Wed, 20 Aug 2025 18:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqxUUqFx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B9336CE0C;
	Wed, 20 Aug 2025 18:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755714122; cv=none; b=siRNIPPUeCym6eXiN0LT7DehroFOML4kua5NPDupZxcGBgBmDIj4srY5eXKVbbTpAqNfQpeXvX/Z4pdY6TrxHaNcHRaOh65/je9TBJ8PSrYJ1yVF+BaFSBhWx2bcGVU4fKgYFwVxa8LRMecpyAcwlPn5UFuZ7nUTUs/2p1wSnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755714122; c=relaxed/simple;
	bh=t6tJzwnHnWECPhXyeIvkMQmPIqdRvPTb6HMo81749GE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HeZr2Ox7TFeefUF0ybLKWWxO7kYSVs5i3FchPqCZ7upQ5yEgpFE6WPSN21d455ELvpZmloxL57/ns0z3Qg9Q4HooZLrr9tfs+VJY8tUc9vRyzi+1Rbj/phaubpdHgP+X8GcXvrhm29oHpzyOxq6yAcP0YRURdkFsTUgrNapi/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqxUUqFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAAAC4CEE7;
	Wed, 20 Aug 2025 18:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755714121;
	bh=t6tJzwnHnWECPhXyeIvkMQmPIqdRvPTb6HMo81749GE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WqxUUqFxIjgFlULTMJfuFUZIkoxOgyNbrhTYimwZ82ujfiSItRchf5EHRuncsQHy6
	 Gm3z5HPoArYvBfi+R5yAtq8vJMeIecw61bZS9bswVuMsG75vSxUSHOT3lJQ3n3Hcwm
	 go5XkMhKzKtlDfpaG2U9nxJNLG95t9ooAMdThw6Ix1al7aGtGTWaaAX1nmkHAl1xW5
	 L5eR8tm48PQbuSmJWtPA6yRfg3LGw1SSOGKzySBKW90CBtOQE30kdeMdfbOknwghac
	 emPEyia1TT91dw3ymbjII6YO7z6YKn0PsbWbPWg5hfztSCoFZd3HGvEW+M2K8HPUCr
	 maG0Rv62EFinw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Darin Morrison <darinmorrison@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Benno
 Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Trevor Gross <tmgross@umich.edu>, Adam
 Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, Fiona
 Behrens <me@kloenk.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 linux-modules@vger.kernel.org
Subject: Re: [v17,6/7] rust: samples: add a module parameter to the
 rust_minimal sample
In-Reply-To: <20250819191133.39413-1-darinmorrison@gmail.com>
References: <wyzYz3HWC9PUkn3GWZVWeS0HNsO3GVZ6BvKobKxm2ApoiroXWfhzGevWRYKB_jAfWl5eODwoFhMAx5cYtsw13Q==@protonmail.internalid>
 <20250819191133.39413-1-darinmorrison@gmail.com>
Date: Wed, 20 Aug 2025 20:21:19 +0200
Message-ID: <871pp5dfc0.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Darin Morrison" <darinmorrison@gmail.com> writes:

>> Showcase the rust module parameter support by adding a module parameter to
>> the `rust_minimal` sample.
>>
>> Reviewed-by: Benno Lossin <lossin@kernel.org>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  samples/rust/rust_minimal.rs | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
>> index 1fc7a1be6b6d..8eb9583571d7 100644
>> --- a/samples/rust/rust_minimal.rs
>> +++ b/samples/rust/rust_minimal.rs
>> @@ -10,6 +10,12 @@
>>      authors: ["Rust for Linux Contributors"],
>>      description: "Rust minimal sample",
>>      license: "GPL",
>> +    params: {
>> +        test_parameter: i64 {
>> +            default: 1,
>> +            description: "This parameter has a default of 1",
>> +        },
>> +    },
>
> Thanks for the patches.
>
> I've been using these in a new PCI device driver module and noticed
> that the inclusion of `params:` in the rustdoc test here causes the
> `rusttest` target to fail with a linker error (below) complaining about
> undefined references for `rust_helper_atomic_try_cmpxchg_relaxed` and
> `rust_helper_atomic_set_release`.
>
> Building a real module and using the `params:` field seems to work
> fine though so it must be something specific to the test configuration.
>
> Any ideas how to fix this?

Thanks for reporting! I don't have that issue locally. Do you have a
tree and a config you can point me to, so I can try to reproduce?

Best regards,
Andreas Hindborg



