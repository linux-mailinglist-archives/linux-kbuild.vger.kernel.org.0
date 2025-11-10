Return-Path: <linux-kbuild+bounces-9512-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F78C46E43
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BC384EB433
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 13:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02403310624;
	Mon, 10 Nov 2025 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgDY+v7W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A273101C5
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781301; cv=none; b=k/I97ZkINPG9bkAIDBwV/V/XpQ2ZOWLJS/UMLVOr9YKAkKvovUHzywHJua6Z7sTpWEjKLuY2dyGwC3BA91jtIEGGxzvcPCJ+z9gjkV+m3WzAbuBpysa3s134ip571tPsM9ccZP6N2ugAohwc3YMtlkxejkWjH0wmcteBUbiKsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781301; c=relaxed/simple;
	bh=bjfTI5/MNKD9oHiCRC+m1AgyC5/Ghs09FtZxTOpiKMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyLp25AZkfdKfseqvkif7RVZM7LDVhHnWvV33u32b0ttkSfpnj8PjyxFp5KhKjSAO1BgM+8vFZTDN2H1qIJ+UuHCOmUj8auSNMJ6BltAPnFMovFwDcAscC4GQMktPYFBUynr1RMmU9GejQv1ooeWNtV2UvZYsHmLWDTRANbYp1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgDY+v7W; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso278133a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762781299; x=1763386099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjfTI5/MNKD9oHiCRC+m1AgyC5/Ghs09FtZxTOpiKMo=;
        b=SgDY+v7WcGKDmmW3A0PrFB85FWWC1Ak5z9CUqCF5j3FqACjhmT8JJ5tJeZ0fO4KVzy
         vqVTT1t/mwugT+hjIfMRxfFCWqGB5Zyc4DrVXoveMdLIsZQXgBm3xkf565sntin50hA1
         xwva0sIkNBm18lEP0K+Ayo5+p+kbjSJocHlRKZr2vCa/H3e55CUXtlxS29y6/J0RXT1b
         nnkHm6k5xH3e3Ca+vW8pmqMu6I4+KdOLomrkzi/FT6zl/8xNFHh2CwpNIVK2KiNUpJXi
         R63+V+c/44vT0UCqbigCNMOlJ4Zr7KtHw946ISaV0TRNba6ywdivWHDBO/IgU4BY1wh7
         BEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781299; x=1763386099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bjfTI5/MNKD9oHiCRC+m1AgyC5/Ghs09FtZxTOpiKMo=;
        b=ZIpuRSjNWfaTK3CXsRWixkKIpR6e1tNLvAMJaTmkAgfcbKPuUYNDMw7K8sBn2m+eAG
         J4nIyZAH7KE331LYOtq6V6lz4B7oRYDYJ1tGNkB9z1xx1e6JTEmgVnhb1tYMH/3QAAJz
         gRtHiq/ttqJ94IfQWGXDymuDuxu4x29FnbluXjK5o/kxA9h5fxUdSjFMz0BYwQs9HKzZ
         JfYQGQiagsWR3zpycePdxbjfryi6Zli9x4QLApBZP0kUfAcRx71Et2QqY61Leq2ZDG5B
         3n/cl2/AnJxp1dL0KlEVNZtRWG+KsqCYSJDuJ9zmNGulHQKmqQXUZGQlB59G0igS29vO
         BFaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7aVVH+lpTmLy/8lCARncwGhZY8P/5PHUtnHY+dfa+7Tt851bOtRdgK8UmxK6+sPoqAIfhtwdvqtdnVyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYbDuGq9pWfKpeSR0Dv2SE9Kvbg+ZiHCqMZgv+t/US6eE6rpv7
	P4t7RtSGKmA993CWjPJDpHdxvO8poU5Pyiss8YkDqQ2TLRk+KigugJykd+X/NucH+3YbkAeLZfI
	dEIIhr6qEJxTd8L3M3taLvxyPIIigmSQ=
X-Gm-Gg: ASbGncsaA31V3+AivmN/2wEMoYOvGUb2NZZNHOIjKntV4f63jnTp/cQAFGWxM0T0joV
	CsPKwoUiwlPFYl45ABjF8Wor20dUCgnOTlYbhhpr4FKsdolMXNbNfuSiYQkMd6g2PMu8dRjsKep
	VPjJKHK19vFKPY7+buZSl2of1AIySiF7soPQYmrqsGz7RDIbyci124xDyafer6Z6GryBuzeVYcB
	C8j9KHHZ82f9TmMtV0JP6mUN7zA1rNvzG32Qxl3SDP/Wj5+4lhXbRZk8MQ70aT7y79EL4Pj5xus
	cbDu2VstvW1zHJcQkpZ66WKGP4SYJllKJmubmy5+ggkxxSY1VchZJZ3tWSZ4xGyKCYuvTYU2LrU
	jBUM4QFfqZLHgA5UVOv2tXJMX
X-Google-Smtp-Source: AGHT+IEyNd/CIr3oQh1rXjWGYDIzhBKFEX331S9clDMfX3PRs9JtaBsmWUbizR9ZvdnMVpJ2wUh49e65b06MdwUpBx0=
X-Received: by 2002:a17:902:d4cd:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-297e567be2amr59101785ad.5.1762781299138; Mon, 10 Nov 2025
 05:28:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-10-ojeda@kernel.org>
 <aRHOnGyLx-bEVqcY@google.com> <20251110131049.18e2f5c9@eugeo>
In-Reply-To: <20251110131049.18e2f5c9@eugeo>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 14:28:06 +0100
X-Gm-Features: AWmQ_bmiU7DKmjn-tBgMdy06u7eyya-M3TMlTQsJq9SC-BFptX9Vc5y9iKMzXvs
Message-ID: <CANiq72mGYKYZmQ8g5AbXCsRS+WPxbeaSyngR69jsEpY8akouog@mail.gmail.com>
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:10=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> So I think the implementation here is sensible. I believe Miguel's
> patch is also pretty much replicating the logic in proc-macro2's
> build.rs.

Exactly, I was essentially following what upstream does for stable compiler=
s.

(More generally, even if a feature may work, if upstream doesn't
usually test "older nightlies", then I wonder if we should enable such
combinations/setups anyway, unless we need them for a particular
reason).

Cheers,
Miguel

