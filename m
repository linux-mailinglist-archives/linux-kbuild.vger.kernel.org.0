Return-Path: <linux-kbuild+bounces-6925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A2AA8BE8
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 07:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 618B216F47B
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 05:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8923919F462;
	Mon,  5 May 2025 05:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZoU+o4H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88F1B87E9
	for <linux-kbuild@vger.kernel.org>; Mon,  5 May 2025 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424772; cv=none; b=NdSQy662TlTgbpo/hqKX0Imout+g62fOFWjNqPkRxGdlPcaftLhz/hqeJ7QtUUCMnB0HORkXHJdHscAroNT6FsS/fix6QJCMtLBnyP1HactQ+khv+/kc0yz5u2QvtuvX8IsHsb0nlkyQRpAqwm3EJdcG7090CMi0ZfieXuZjN6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424772; c=relaxed/simple;
	bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmnf3hSlMBPrl2BZ2lg7AedHYlPNyNAf4tqO5t7W+xAbmkZ5BW3//ylIt06bFsXfo/gC4SUlFWCxmFHpgf89QNByoCOHDEoCz++027NW0HMsleA4AR7n+oz5ZUtzucGc3t3WIrL/3wZbzttQe9K/F8YCjYjleenU4mTFiUOw84A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZoU+o4H; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so33502911fa.1
        for <linux-kbuild@vger.kernel.org>; Sun, 04 May 2025 22:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746424769; x=1747029569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
        b=UZoU+o4HWvakX2nxmiB9eKOzNpzeS2xKKeVbm1wrONUXlfK+Hyb6JkBP5aS2thQouu
         vI/mJ2/dK1oDKJkn3BCsoMMzN0k3C2dG4qT0E0U6KemwFOOo2NxpDEyIoVVqZnbuKcdO
         VoM6jIiMGWvfCszwv6Rwd2Vsq4UuBAwpwEEfHeKctkptM9g11or6SlBb7mrb/QkTH/ED
         l8AyUeV7Sz7XOUxejmJiNYkv/2RAbNBfkh3cuZGjwgTsiPJpCDXeJBLZdkbPQ1GtFuXT
         b/3dtTIt/9nHROwnmuM/KJkTovXhbZGnxasysqCGdPRaxahnWJrjRdVkudOWLPJsw+Kj
         r9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746424769; x=1747029569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
        b=MfFx1I0podVsRsiDEXJJbwYgYDF8vC06YQJDnQS0d3wbl7EqhUWoRyqNH/A/XDnPLr
         0pLquJ6eW5CdIySNFXJm5AHQS88aIphZnYHbBVVA4JZq58B4BYmLmpO6ryiIrWBlJk4i
         d8CY2BF1KXiODmWRAg9VehvTQyeLhCC40dQ55mHgml0GfGjkEYAkNywE5JMuD0oxmBPI
         zsitiRUm1DI7kHimM6/X9N1scsVTHiG4+PUIwdiFuzrSLhrkNLQJK6cSdueWsgwkaiDn
         Uhwex+Sb3LKwhum+3pDFLfyrBi5Yi2vBQ6FXOfeM8CG49u/I6Xmnu3cEx8SPjLDP/x2e
         RJxA==
X-Forwarded-Encrypted: i=1; AJvYcCUHRcdGkBKobHcxkC9EtwpLn9rmYU5Q+v1a0fyshxzphbBOC3Ch4hTzaRBfoFO77Ujem87ouVplrLgMNFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcbAqGCFAto/qmzhb42Usi1WdqjV0wc3jRiYuo8aGPyvuy8dpX
	w9YCopg8Ja6qR7uGhZ3PR9GB8ZFc5UsGysaF9QLH+8HMzJF4GH2c102Vcojq8GrgtRAqHEdAaL5
	1+6jxIyecd/CtJlhCaDIkDYA59FthtkCgcqsZ
X-Gm-Gg: ASbGncvrGF/7R5DFFbiKZeL1yBPY5UuNyrwy4tmIBHC+NL/4J+QGpt7CmqopKNLK8R2
	0F2cYf4+/Wd92qTTUF05oQHduUr0/qHttPhl6OhQVBZ/HrWbd1VpKTSxYh9dGpZ1DF30lSnpi94
	g/sSt+1ZFevT0QPxFrMYtqr4sL7mgtXDTZXa1q/DzXXO690q1dkU+X6Q==
X-Google-Smtp-Source: AGHT+IFD2StGXXU4LRBTieMiBl1477i7opw2k6zaQzZpZT7Xzqji9FSBQHuj++vQYVldHnNlC03ywPxgJw7rDH3n0w8=
X-Received: by 2002:a2e:a585:0:b0:30c:12b8:fb8a with SMTP id
 38308e7fff4ca-3233ebe48fdmr15610161fa.0.1746424768540; Sun, 04 May 2025
 22:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
 <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com> <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
In-Reply-To: <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 5 May 2025 07:59:17 +0200
X-Gm-Features: ATxdqUE_jDd0HC0IONKRAtQ24jV76OHs3LwnQnbNgHzz6cgeJxyFcYPBg_mcEL4
Message-ID: <CACT4Y+Yavh4GkocO01GSP+0hWXZNVBEaD4-9W2V452Z5+C+kZA@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Aleksandr Nogikh <nogikh@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2 May 2025 at 15:47, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, May 2, 2025 at 2:36=E2=80=AFPM Aleksandr Nogikh <nogikh@google.co=
m> wrote:
> >
> > Thanks for incorporating the core.o change!
> > I've tested the v2 patch on my local setup and it works well.
> >
> > Tested-by: Aleksandr Nogikh <nogikh@google.com>
>
> Thanks for testing, very much appreciated.
>
> Dmitry/Andrey: I guess you may want this to go through your tree
> (although I don't see a `M:` there), but if not, please let me know:

KCOV does not have its own tree, it's merged via MM tree with MM
maintainers effectively serving as final accepting maintainers.

