Return-Path: <linux-kbuild+bounces-8211-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E2B12F2B
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 12:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EFBF3A539C
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 10:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093AE1BC9E2;
	Sun, 27 Jul 2025 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JuVwO1SC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436DB72634
	for <linux-kbuild@vger.kernel.org>; Sun, 27 Jul 2025 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753611407; cv=none; b=KqgcVkAR5/DXCRm3Rhfi0QRAhn9aoBqmITgNtPlUJOX3on3HrIH++baGyyUigbzoa33l51de4MUMAhN2vuXGF0ltZZg+WwCZRkYlNrta7KJg5iSp6eLxIJbuPEWuNcen5is+nWehwCJxwfrtJhlzlDqmjYNURzfYU7UG0siXbNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753611407; c=relaxed/simple;
	bh=7gXF/JGd7cdYSztftJD+wHyryWPRVHXOyQ2/0gQV568=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtH1ce4mIrbjAAGJ1vR9cv2U0TTAwkQGLJJIoxjHjx4KlcqshpB7WmaoevhLLIrDiN5PQvJddkPwUO3iDg7Eo4Rr8SVnvAL4MPuu0f0/eBn3V15B+KoyPqWWqb8cZ4+EtJn6hnyiexg2KZ1FTZvD9tx+1+E2qRu8T21NiMK8Ge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JuVwO1SC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4561ca74829so37195485e9.0
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Jul 2025 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753611404; x=1754216204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gXF/JGd7cdYSztftJD+wHyryWPRVHXOyQ2/0gQV568=;
        b=JuVwO1SCQq61r9WlCtKr4htyBKucXYq2rE1R5v5HBd8C2m29pgAj+vA60Z5E1f9Of8
         nS0g/FucqYB05zvhGKDsRZsI6WXgvK0fPA1ZJ5MwMwEnTR+6zJzDUaZpXSjTKaiBAJde
         gO5HESaWYe/QiUa7nX8hLKfFjK40NxdhAbD5HeO3IIySM8j8UQ2FkDA5YnSH30/MQJ5O
         Hk94ihTYuIWVUxYQO41VhTH1XOZT+XPrRs/iS2NCV87amZjNpgCOmpWzNtoO5s/IuxQr
         YM6ErlDzTW9AR9lQZPQ7qMQNziQkmEpaB2C7PU+ISqryagz6D1348YzTBO1vknNVsFub
         OFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753611404; x=1754216204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gXF/JGd7cdYSztftJD+wHyryWPRVHXOyQ2/0gQV568=;
        b=txVk+xgLvKvcQ7Y5jvHL68Bw4vY76zsbpsDc/ArMHJxFgzvhzeGpkiO4hixrnSdPSV
         IVp5KW1b+vGp8BKVnI8c+ibsTLLdmhjIIc2SLoq/RobYDeZd3ebAFWsBRrOhtd6ipkuJ
         qIYl2UAVdKK5EOa1meICjm4xCeLCL1a7jIIfV6ZOJurPIvxcsBMBA9Fyx8SD+taIjCni
         kGxRabR+PLVMg4fJney8lsxyCZOyLRi3RcFhyZA1LQt9Hhua1uyzmSWSqdkrFGO643p7
         kfXesWnzOhrKZnbUqaIVn4sCFZpuhZl0uRqrwZXUPfc6ed3m4H4d/mW6u9Uvs5DaVNcu
         GMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAsv9ME+QcQ9dyS3kFynmJZeK+p8OM6hg5kLKX7OVkou0f+nyhahjs6PQ4TKG+nfd40fgtCoXmgzmwh0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/n7/ry5nuL2jmNGij5bsJKdXZyseFG5fr9gf0suAwsoKoXW1
	Wqi8bgXgDrFHk+suDYSGmfq7h2mm9HnXFS5/MhwsNFCDvnqr5jEO5Qzx5wMTHHA0nZ8ONzkS4LW
	cpnh7BlYAUndFWXrZ5VRps0jGbQOJVC7cLaJHpX8c
X-Gm-Gg: ASbGnctGBWDqSN8P5RbKfUJWYrgv3+7CLD51lWZ32hwuDr1IScKLmt5UoZV5Xr9RqfL
	FuF1+opQwVx2bW0BAi8F/6VZMM7YnUcsIIMzh3mVs/vJkv/o5PPkWwnt0McMe/4jr1rtRojxYtp
	ZfnzqWp0W9ENTb1OX0xdunYBivrVBCV9o7BNBzudIxK5QnobleDFqPAabQzLR186wNSfPeJQQ4r
	I1H/xyq
X-Google-Smtp-Source: AGHT+IFyrg1ejKvUxd9ZtQSI9909R3ixl5LPHcy5aVZC0U4Sj9RIX4I7zArgs9AtLDU/QcoqDxdQPatS2VjlhudegxI=
X-Received: by 2002:a05:6000:22ca:b0:3b7:791b:649b with SMTP id
 ffacd0b85a97d-3b7791b67d5mr4008222f8f.11.1753611404412; Sun, 27 Jul 2025
 03:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727092317.2930617-1-ojeda@kernel.org> <CANiq72=Y3i-WeygLix6j-sPZwE2QTOkaZDQOrED1aCiMoH3Cqw@mail.gmail.com>
In-Reply-To: <CANiq72=Y3i-WeygLix6j-sPZwE2QTOkaZDQOrED1aCiMoH3Cqw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 27 Jul 2025 12:16:32 +0200
X-Gm-Features: Ac12FXzQd6Ubqwcqmg__eYKdobRTIYZ7Qw-ApZU0mG8XcaNSXbzlilcOMmffJUM
Message-ID: <CAH5fLggeVq83ZPWPE5Thv8LUNrp6pX6sifGBFFbe20W1neWJ=w@mail.gmail.com>
Subject: Re: [PATCH] rust: workaround `rustdoc` target modifiers bug
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 11:31=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Jul 27, 2025 at 11:23=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> =
wrote:
> >
> > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Closes: https://lore.kernel.org/rust-for-linux/36cdc798-524f-4910-8b77-=
d7b9fac08d77@oss.qualcomm.com/
> > Link: https://github.com/rust-lang/rust/issues/144521 [1]
> > Link: https://github.com/rust-lang/rust/pull/144523 [2]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> And most likely:
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
> pinned in older LTSs).

We also do not even set -Zfixed-x18 prior to v6.12, so there are other
reasons to not backport it further.

Alice

