Return-Path: <linux-kbuild+bounces-6039-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7252A5B6D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 03:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E67871706A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 02:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172FE1E5B65;
	Tue, 11 Mar 2025 02:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuE5qKAw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231C1DE3B1;
	Tue, 11 Mar 2025 02:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741660765; cv=none; b=VB6HgaY+OHDmytKw0gZv9rm53IMrj5r5T0BTRTnDj8NF8IYLZRNxMGtzuK4YmYgMiDgqFlwYgQCsYG+cjdMD0Z0VTALiBtRuEAhNm50mjE9rQBHC7Yk8d4+BEyUm2POINdtUo0kz/IEw1kPpBsoaZ4NMKZyVQxyBAS7UsZqCfY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741660765; c=relaxed/simple;
	bh=LnmuzoRtltn2EeudiDcylpdiaUGszUXlXCyPD7IoncI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s8Bf+2KG0yBlUFFZxgwgnFcyLhFhW4oqs9uV9Q+WXMXsktj3X3uD9+0RzLj/uSJsMmNkkgM9/sikJZKqcjufkWHrU16Iq1kyZT1i0KEb4vKzWKquHZpHma1yl4MhvLZlf4tJVtCP7C3ZwNMd9b7/gw8tg0NCj1kLbd3aCu+YpGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuE5qKAw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53535C4CEEE;
	Tue, 11 Mar 2025 02:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741660764;
	bh=LnmuzoRtltn2EeudiDcylpdiaUGszUXlXCyPD7IoncI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZuE5qKAw9dvqbyE1Zg3V2DK4hmbk9HVp/NinPEnMsa6T+PruCmBXLFsL+JAioQmGX
	 gpQoVbry7USAXeTXZnwgf79Vp8eR0XmhFTuqou79oJg+p03i3A6NKT3km/jDyuSy1r
	 ylbD7T0ACRpN3xx/fNe92PIN3wKDec9GCN+Cmk4XAx7CCbvjqpD4WsjIX2GDZCZ/zE
	 lql+SDwttBngNp4gBefXYxCy1A4NhyjTPWfMFVICG6jwDjpaKF/b09JdlenZh77JxL
	 wCaH357SSxlCj2HJby7H3KlQyVLqaoVxLo5oZXox119FpEXmJfxdQlE+Hn8NBYByBz
	 fVXOCsDz8kdUA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so5243535e87.2;
        Mon, 10 Mar 2025 19:39:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxiRArsHdnaDEJG5J3JwQe2UfBQ3j3yMm6aARTcdu6f0Cs2+rG0uw+KBo7xJ/65DghH0DQtL/IFEhPc1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVdl/Z4GyP4c793y3/YRV9rY+w3HlhEtO1yXkSgiCqWNNaGiaJ
	D5uvc1EC2ylIkvX8JAPV6Nzob0iUTaTzHGqJpl9EXzGo6CgFGG1lxfKsX7n/dkFvAWzbYnUo+ad
	iQ0rJApVRYmD3IRDkJLBhIwQzKc4=
X-Google-Smtp-Source: AGHT+IGs1BK9/xmuuvL4MZUqWyatSUGU/ZZw7BQeXXcDh6YdPqA2Gwtl7XzWqDMrTeBuOX+vz5BXGu7sl3LfPUOHB/E=
X-Received: by 2002:a05:6512:4011:b0:545:2f04:31da with SMTP id
 2adb3069b0e04-549910cb49emr4751316e87.46.1741660762903; Mon, 10 Mar 2025
 19:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
 <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com>
 <CAMj1kXGVe-R7VF1nHmRx+UB4FuhSjiwMU=n_uWCLC99rTTa5ZQ@mail.gmail.com>
 <CAK7LNATkaTvAwPmNM3kSOCkCptW-bo9Ko6asWyFVcGYgu5rHtw@mail.gmail.com>
 <CAMj1kXHCia-gQy7fkVC5SgMyFqz6rRgpVbz6_W7e9jk7ENaQxA@mail.gmail.com> <Z81j8EguDyz_uesu@gmail.com>
In-Reply-To: <Z81j8EguDyz_uesu@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Mar 2025 11:38:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATb40pkqXXH+o_CXW6Vf3zavAj8oSeWnpGfXq6SCto4kw@mail.gmail.com>
X-Gm-Features: AQ5f1JqRQONy4dygKtwyr9gpdY9gYEAosA8acpKjKOrbPOod07yZuJNq2-84VFU
Message-ID: <CAK7LNATb40pkqXXH+o_CXW6Vf3zavAj8oSeWnpGfXq6SCto4kw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Ingo Molnar <mingo@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 9, 2025 at 6:48=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrote=
:
>
>
> * Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > On Sat, 8 Mar 2025 at 17:17, Masahiro Yamada <masahiroy@kernel.org> wro=
te:
> > >
> > ...
> > > I do not think it is broken.
> > > As I mentioned above, I regard vmlinux.relocs as a byproduct
> > > of the atomic build rule of vmlinux. This works.
>
> Except when it doesn't work, such as when an intermediate linking step
> fails, and intermediate build products are lost and cannot be recreated
> easily (or at all without modifying the source)?
>
> And the thing is, there should be no such thing as an 'atomic build
> rule of vmlinux' if it means lost information when the build is broken
> at an intermediate step. What purpose does it have?
>
> > There is no make rule for vmlinux.relocs, and so
> >
> > - if it gets deleted, it cannot be rebuilt and even though the build
> > does not break, the relocation data is missing from the compressed
> > image, and this could potentially break the kaslr startup code,
> > - it vmlinux.relocs is older than vmlinux for some reason, make will
> > not notice and silently reuse the outdated version,
> > - when creating vmlinux.relocs from vmlinux and an error occurs,
> > vmlinux is deleted, making it difficult to diagnose the problem.
> >
> > I think this is badly broken, but if you think this is all working as
> > it should, I am not going to debate this further, and you can consider
> > the patch series withdrawn.
>
> That's very sad, as both the simplification is substantial:
>
>   19 files changed, 52 insertions(+), 87 deletions(-)
>
> and the increase in debuggability is substantial as well.
>
> Thanks,
>
>         Ingo

When a byproduct is accidentally lost
(for example, manually deleted), it is not automatically restored.
Running 'rm vmlinux' or 'make clean' is needed.

vmlinux.relocs is one such byproduct.
Another is the map file when CONFIG_VMLINUX_MAP=3Dy is enabled.

I am a bit concerned about having more and more
intermediate vmlinux.* files, but maybe only me.
I hope vmlinux.unstripped is the only/last one.


OK, let's do this.

Ard, please send v2 with .gitignore and 'clean' target updates.


--
Best Regards
Masahiro Yamada

