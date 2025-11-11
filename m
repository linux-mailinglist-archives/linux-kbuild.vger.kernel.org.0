Return-Path: <linux-kbuild+bounces-9578-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA5CC4FA1C
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 20:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1B5189CB69
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 19:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55019328B64;
	Tue, 11 Nov 2025 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNEQU7rt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77E32AAB1
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762890292; cv=none; b=KfqWBN3PsWOMT/C7Snzp4Vzw62xV/ibUcm8B6m87X3TbGuTVHtsLYBUQJsEsFt6lMlYymFtlHa0qkg+upk0jnT1m31U+ITbGud2l6VbKMndnO46PLnvwVCESpeD/BEqPW9De4XQWkUemvZkvqwIMskCtzOTiZrVwoSYeDtWbWKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762890292; c=relaxed/simple;
	bh=JiUjPFE5L6L3WUSoWqtnqWCucYId5dZy3dcTcIJ6lbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Talp1ieqq4vklVkKAiDg7jdhMIVu/AG75iGl2/ZFjYoVqBTBA1khUbbGBi9b200uOnOEu5duPuRptd6yPcsfIhuDaal78Qojjvy0U9zAQWd5IZS6qh0U+IqblXfWvBdxievaJLCF1IUH/yH7+gmc3uDtdb6NbEYUPocVjrkRciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNEQU7rt; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b8f70154354so10068a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 11:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762890290; x=1763495090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBwIkGZr5oeEH/G4GQqW+JJA6UiGsteAP6cGwBb+I8s=;
        b=QNEQU7rtfTdxjxfLCG/eoAFCg3CucgTfZVBDPlwuoAPm7XcK9zGsBYVLObEFyEoFYS
         xyv6BnTy2D9SKz6DOkv2E0uQbHF4WgefM7jwP++mKN83FwIhhDCz/vSl4HtaYkAEcqBQ
         0sfjITnHLxKpanUBKGo5ScC6ZjmG90qMQYWQylwp1bKV4Jwbm2/JJrnHqiyW+dfKNk+7
         x992ScOgjL5X9MLD8+gSBGgBfdnK92VKswHf7MhqDuimWgxX5t3kIOCFA38INXZS8AGk
         vGRYu3H6E6R+N6Fn8POgVGwA7nege4shGjmcG/6nHPebFUwjuyvuwYMRLHdB0ub814zb
         Zcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762890290; x=1763495090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hBwIkGZr5oeEH/G4GQqW+JJA6UiGsteAP6cGwBb+I8s=;
        b=HtWcAOc2OlJZD1S7Vkijfo5h4hJptN9ETAc/NC2tGNm61fw0sTEPDmbxXG/8sEnde9
         NfEwBDIBy9wboosUT48U/oKGnABkQ66rnfIjdIOlYqoQWfWmsgjiVWrr+ExWrqZMkf5F
         o08tjk9fUr9OiOGFh7minD0z6zWvATq/OkfjP6U+lkvbT2BmnVxSAucHdbjb9pOc7lS8
         GaG46SAihvBvrqsilvK+cURvVGYahRsHTP+xDvBJA4TXjF0v0tL063cf4fYr9MnvNMpE
         AYmNdgL4rPZcD08caILR81gvZg6i/gOAZ1Rd04kUEzbPvAXzphMtw7//opXBtkYf69JI
         8Y2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUea0ux89K2UFu/A1u4SnfLL8yPhUNGYmBqGsMF9M6JOhAmsUpepW0q7wwXM+GETnRgWiGuPsk3TYec3cM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybm8/KQb7FFkQZyPkHEbceuWiBsUKabND1ksAvG1WVJ7ZxFNjO
	IphiQ52UKlxoj/UPlC5wvkrTk9OISIvv4SeIZ3nEtqtQS2TuLrQsqp/rRuNiIvPQ7cj57p+xVcT
	ul1RcDFC3vvp8zrlUY+aEvhZ5fHStG7w=
X-Gm-Gg: ASbGncuoeYyeQcVsSw/ZD6py1aY1lOjvVBrYlqneNqMOBgtDeMuGvLxp+Wym7bQDixN
	T68+K1FkthqvUGQ/G6GQP0Wcq0sBaWjtb0BliSC+FjN+b2B92oIakHv89qty56X8/9RHmX2F25I
	CjW2kbRhx/4/haCbirg3U0EN2+2sZV0J7m26pTQy7Sxbrkv9dnweY62abKN4M2fjUIiIWwkRumM
	oc0aqLsXIhvkkKY8dS4K2FvJwprPZEDbwjyrsN5uHqKNUqe1aIUitXm0lt98RTlj5r0Rxz3YjUt
	njpbA8MwyFSMz4VFaTq9g5fAP3EvvR+8G7WimTOhY7rKzXVIAuFrPzvaNqyvDnFZPzgfYx33SGj
	KkwM=
X-Google-Smtp-Source: AGHT+IEIgD2TIb5lI+JHX8EN36MOz76t2fs8U9WrA5lSIrN1Ee1RN3oycFlI6xL09eb/igzj3iXymu1H+QisdP+gzoo=
X-Received: by 2002:a17:902:c951:b0:295:f926:c030 with SMTP id
 d9443c01a7336-2984ed34944mr3301345ad.2.1762890289896; Tue, 11 Nov 2025
 11:44:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org>
In-Reply-To: <20251110131913.1789896-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 20:44:37 +0100
X-Gm-Features: AWmQ_bl0uHm3iTs5smKUuF4u87o5Gft8n3MmJwhpnH_Cho0hzrCzkBHz2YKCGnk
Message-ID: <CANiq72kOOieyK03wukCDRaG8po1nmH6BFnyEe_Y7Do42BF_S8w@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:19=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Starting with Rust 1.91.0 (released 2025-10-30), in upstream commit
> ab91a63d403b ("Ignore intrinsic calls in cross-crate-inlining cost model"=
)
> [1][2], `bindings.o` stops containing DWARF debug information because the
> `Default` implementations contained `write_bytes()` calls which are now
> ignored in that cost model (note that `CLIPPY=3D1` does not reproduce it)=
.
>
> This means `gendwarfksyms` complains:
>
>       RUSTC L rust/bindings.o
>     error: gendwarfksyms: process_module: dwarf_get_units failed: no debu=
gging information?
>
> There are several alternatives that would work here: conditionally
> skipping in the cases needed (but that is subtle and brittle), forcing
> DWARF generation with e.g. a dummy `static` (ugly and we may need to
> do it in several crates), skipping the call to the tool in the Kbuild
> command when there are no exports (fine) or teaching the tool to do so
> itself (simple and clean).
>
> Thus do the last one: don't attempt to process files if we have no symbol
> versions to calculate.
>
>   [ I used the commit log of my patch linked below since it explained the
>     root issue and expanded it a bit more to summarize the alternatives.
>
>       - Miguel ]
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Reported-by: Haiyue Wang <haiyuewa@163.com>
> Closes: https://lore.kernel.org/rust-for-linux/b8c1c73d-bf8b-4bf2-beb1-84=
ffdcd60547@163.com/
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72nKC5r24VHAp9oUPR1HVPq=
T+=3D0ab9N0w6GqTF-kJOeiSw@mail.gmail.com/
> Link: https://github.com/rust-lang/rust/commit/ab91a63d403b0105cacd72809c=
d292a72984ed99 [1]
> Link: https://github.com/rust-lang/rust/pull/145910 [2]
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` to start getting some testing.

If someone doesn't want it, then please let me know.

Cheers,
Miguel

