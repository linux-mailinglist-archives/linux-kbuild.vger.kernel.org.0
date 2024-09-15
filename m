Return-Path: <linux-kbuild+bounces-3558-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3453979857
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 21:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD6251C2110A
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 19:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62541C9EC3;
	Sun, 15 Sep 2024 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg38Fq8j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C41C9DE4;
	Sun, 15 Sep 2024 19:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726427399; cv=none; b=faJzDO+PEQy9SCFL6GuOijLhuKkBs6j0gNFUqo381Phx98PJmkU1xglMadFK8O6Dwt2Tqyvrb4+yUe670KDaIdLO0worh6ksOH1BZjhi3uySJxaOjVJn9g+ynUHHihVjkmViK6hQM2JH9nM8I9pR9MxNWG0NS5gHhQQA1EsP2Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726427399; c=relaxed/simple;
	bh=s7jHNTMqyMp9XtQtQyKBg8Qso4UuUJlOeK2ulSpy4+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoVZE1z+O82nzsWe9lMy6HYXGerhNziRKxgerM7R0CrC23LAOxLeMltg3FeCji/FTBFQcD9R5XE76rW1tJY4mk/Vad17hNCQfRHBC855+I71ueZQO6t2Sp/OIOwvx1PcT0mo38Hkbi1u9KOv1nhlZG1Y7tZGb3TzST6IsP9xLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg38Fq8j; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7d50ac2e3f8so578051a12.2;
        Sun, 15 Sep 2024 12:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726427397; x=1727032197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7jHNTMqyMp9XtQtQyKBg8Qso4UuUJlOeK2ulSpy4+Y=;
        b=Pg38Fq8jkEy24BKFREK9b7lK8+lG5/HWVuHeORQvh8kGMjVkZQYPcfGZKV9mtij1Tg
         GxfLGGN7cpJHS7ByE1nuMkap5S5Bz/r7D5J+Kqi+SzztKPHC9zofOXS6gsxy1e8k4gN8
         vVUf0ujJRKY6nYkifvlEp77S2Aep/OJC1i1PjXHFYH3O81xk/vWNZJqWnf6/4aWCaeoM
         peg7W+lt9GiUJFtpTNHLt6kRxb4nkdR+k2QIE8TfqOHLxm1RVslq5oIUiiu0o4KW31N0
         SZV03Rb9FPYxO/tqKbfigSv/mz1ouWxsHIaiaytxd9Q3YXXyr46sD7vmzXnF2C7riGHF
         1b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427397; x=1727032197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7jHNTMqyMp9XtQtQyKBg8Qso4UuUJlOeK2ulSpy4+Y=;
        b=pIUeJTcTWtf5oT5mOjlZr0qZkKrxxenbMQ8v6+6zKKjEyw/zcAjXj3sC0Mmc0GOUIh
         VK8/JP6SmzhGUfwuRRLtQo+DBj1IQ04W/V96Or26N0pKpvp2MuZclcBGV66TPdh5Jp5s
         mPXk41LYiJW768sQpXVl8oFsVNTCzrYOpQcqHv47pBxCOXsPfeZLrWXRtMNFrWaKxbQ2
         A3H9CevBpjFSV3YyC3xEFukzAn++UY0gK+8WV3Wy4WVXbnino4w5jmunWYG7aKMwgzDe
         63pCaj1Ss9G6RU6dseDUtwRif13z3zG8NSh6ojqoc2Qxz0weINYNYxeZW6z7u3w4pO2w
         piMA==
X-Forwarded-Encrypted: i=1; AJvYcCW+pvRX8lsDJSg/hrcrodFPYTXs5UcZGohkxie18fXU63Uy8ml1yX15SW3OeVJYh5BmA5z1qGnOnC/xYjQx@vger.kernel.org, AJvYcCWkfgiDqj3Nmmc4/TmPJ63FLlzpRMvrWLZJg+8xq+TI5C/ZJNyX4Xw0OFOKqceA4U2zWAyXS6iwSuzINdQ=@vger.kernel.org, AJvYcCX4rgyaze5MCN6wGOaGD6DIjYmxBLs6QtGn4mEu5oR7zMOqT6dq+ji183SnWPBsGdQW2yD8AUsRgd6CEmLD12s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfAEXFkE4I92cG0rvYF2eQON8WHZOTw1JEvxAfI7lTFl2EWQXU
	/4HSzXiJUnaeEUw6EQLP/0mOTAaEcaPVYVN+LXZSxGj9/kvU7raOtPwOY1ggXUiQu0lbv4BKBy2
	6Y3zzhd+kADvUDZVZB+Nb9sn/tgA=
X-Google-Smtp-Source: AGHT+IHr0D6TWxTQzv88KR/FDg3V8HgU8w+g0FgRZ0BBw/Zr3pFklWBFV+/D/FvhV7n8gNesZsrEXZhiFnl6lwGFOLY=
X-Received: by 2002:a17:90b:4d0b:b0:2d8:8e8a:2b0c with SMTP id
 98e67ed59e1d1-2db9ff88dcdmr6418732a91.3.1726427397086; Sun, 15 Sep 2024
 12:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-kcfi-v2-0-c93caed3d121@google.com> <oehf6r5eftrnuvzulg2yhukf7gjh7jltfdqmtffiok3ro63xe7@y3iplw2gpcy2>
In-Reply-To: <oehf6r5eftrnuvzulg2yhukf7gjh7jltfdqmtffiok3ro63xe7@y3iplw2gpcy2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Sep 2024 21:09:45 +0200
Message-ID: <CANiq72=hS1xMCQBzkgM=AMhj4BkDubqRG-kmGU8aQXN3kBS6=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Rust KCFI support
To: Gatlin Newhouse <gatlin.newhouse@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Sami Tolvanen <samitolvanen@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 2:13=E2=80=AFAM Gatlin Newhouse
<gatlin.newhouse@gmail.com> wrote:
>
> To test this patch: I started from v6.11-rc3 tag and applied the new vers=
ion of
> Miguel's RUSTC_VERSION_TEXT patch [1] and the Support Arrays in Target JS=
ON
> patch [2], before applying this patch. I am on Rust's beta channel and
> Clang/LLVM 19.
>
> I also built a v6.11-rc3 kernel without these patches to establish a base=
line
> for LKDTM output in dmesg when testing CFI [3]. I built the v6.11-rc3 ker=
nel by
> starting with an x86_64_defconfig, then enabling CFI_CLANG, CFI_PERMISSIV=
E, and
> LKDTM.
>
> When applying [1], there was an patch does not apply error. I had to manu=
ally
> change the init/Kconfig RUSTC_VERSION_TEXT to Miguel's change in [1]. No =
issues
> encountered applying [2] afterwards. Similarly, was able to automerge thi=
s
> patch without any issues.
>
> Then I built the kernel starting with x86_64_defconfig and enabling: RUST=
,
> CFI_CLANG, CFI_ICALL_NORMALIZE_INTEGERS, CFI_PERMISSIVE and LKDTM. Compil=
ed the
> kernel, load into qemu with Busybox rootfs, test CFI within LKDTM per Kee=
s's
> blog [3]. I saw the same expected behavior from LKDTM after applying thes=
e
> patches when compared with the behavior from LKDTM on a v6.11-rc3 build w=
ithout
> these patches.
>
> Link: https://lore.kernel.org/lkml/20240808221138.873750-1-ojeda@kernel.o=
rg/ [1]
> Link: https://lore.kernel.org/all/20240730-target-json-arrays-v1-1-2b376f=
d0ecf4@google.com/ [2]
> Link: https://outflux.net/blog/archives/2019/11/20/experimenting-with-cla=
ng-cfi-on-upstream-linux/ [3]
>
> Tested-by: Gatlin Newhouse <gatlin.newhouse@gmail.com>

I wanted to point out that this is an excellent testing report.

Cheers,
Miguel

