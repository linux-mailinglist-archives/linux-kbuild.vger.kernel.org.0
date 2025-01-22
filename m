Return-Path: <linux-kbuild+bounces-5532-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF5A19312
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 14:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A0F616054C
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 13:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F003E213E61;
	Wed, 22 Jan 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NTphKHzb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B1211A11
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554081; cv=none; b=u7tOtN0ra2gnKbtqESYvhY5DV1OJFt44g88CwVPhFyiVh/isS6AspWfiZHMko7A7qjjdRGC/3QWk+UqW/ZnqB+OImLL7pupYTBd0nGlCq5H7x37/xWdpf4hhWXYsm2L0CXXKPclt2xHiJ5kbSIqel3sa0sGS2nvgg7wYgyx79G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554081; c=relaxed/simple;
	bh=Aja9IWLqIsJ+8STZu81BLfq4DL7+g/ayz7j4EtKld0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EORZ22Xv63fkPz6QxMT0Ssqgo3cgJwCtOToEPePQAwrmMiVuznysW3SQPRgkNzdJ2gVDyapWIUzRZyBBsFHzaN3gARh6z4+cR9FqdolvDV8EaYzTa6B493Ve2BUrRq6uuhbWAbwTw34eRaEs5SMSGUdu4QtYSZxAJ4dS67Y9cZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NTphKHzb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so2963a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 05:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737554078; x=1738158878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aja9IWLqIsJ+8STZu81BLfq4DL7+g/ayz7j4EtKld0Q=;
        b=NTphKHzbwY7m8x5OaC3hw8quljy6p8P2L//HGQMz4aU4ITZMPMDhtqnHMT2VwwVlAG
         VOx6WYmzr4ULk5ihPH2qFQ5NwLDMwnXsEvBhiagy8I5NBZrsprFV1vng9JsKAs4A96iE
         rEVcRLyw5vuCnr2TSwo4dqWqmTSClNyAcUZvdIbF+Bz92BRkeQ0MeE+tlCeUjYvAF7CR
         WPW196wdjcekOC23BQKZ+blETk3h8SMI7FxGi8ybt+AySS5wtTi4X9YIedgv4zimlrOu
         99uqQ0CGKfeYr6YEQZIL5bRGWpmbyBmknCstwVonhYcowrdKy7XrDcz0siKIag6vW57L
         NJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554078; x=1738158878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aja9IWLqIsJ+8STZu81BLfq4DL7+g/ayz7j4EtKld0Q=;
        b=ZofHxnbN72uB2u0Mj1yimrMGWLh0lupCb7c6CpHY7Y+DmwQnJXwvzgKa5gqJCcyA5T
         EkhySaohqjrRNvn5vNvhZI+rUHqiFjtCEkuguXc31AtaYi7DZZmE7atWfo8TfpkxH4c2
         uHzGglPXybwP/nao1N7iG3j6pTYbzoVgR30a9U8VbeCt4HZhtRC/3oNf3DQMFxVz9nL2
         t0djIaZI9Y5g+jPMMiUu5dzud1+7+ttdIbCcsJ4Sm3terasLD5a+28uzR196R4zmInS5
         gGsQwCP6iM+pvxRPNbqAdL+fFo71694q8uCFapt5zc9DGU2iFEZv3PzwqClT8uJeCEjA
         HbsA==
X-Forwarded-Encrypted: i=1; AJvYcCVcy+cvXG7ir+tn8AyaIyGFueHbh/Q1R1Kt803owLXUcGBvWEjzzbY6CVPyyG5VMvgD3NuiaR2bGFWfuoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPHNJsbxBInEKdqmlx4tatczStqD6IFmwnFJqLyneHNwz08dEN
	Wd7heAakSP0O1xS1E+KF1h7f1SDhWTHCrZ4OLmLD5ccKOEvVMcYfbHCTbRdqtZYf1MA0vYVRnrM
	xjrxgI8/AUmIcFf30ikXhxDIaLh5CV7yJqqGK
X-Gm-Gg: ASbGncvUf3neZ1XH5IIlq7xt7K9GaavoSGD4lAp9OCZIjqde019DrRSZa7L8nWM8rT3
	uRlMXyqgHUf8aAhydJcswgMBL5yHNGLHKJRPkadi9BEAH7Qj3SD3wesHlum6njNsJmjX7I0MLtd
	+d2P8=
X-Google-Smtp-Source: AGHT+IHBC6XLtUtYXrzEzVE4IQs6mUaRzxkMW6KbFHU4zq3aeb/bxwC9rANTYWTS6Y5/Lu9/OA24OmLu/FzuZxoGy4w=
X-Received: by 2002:a05:6402:177c:b0:5d0:eb21:264d with SMTP id
 4fb4d7f45d1cf-5dbf52b73f5mr85949a12.1.1737554077893; Wed, 22 Jan 2025
 05:54:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-kernel-compress-fast-v1-1-fa693b6167d4@google.com> <CAMj1kXF-GSB9Ty7X1h4u1uA6qhO1Y1UvVrNF=R+hk3PENRz7WA@mail.gmail.com>
In-Reply-To: <CAMj1kXF-GSB9Ty7X1h4u1uA6qhO1Y1UvVrNF=R+hk3PENRz7WA@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 22 Jan 2025 14:54:01 +0100
X-Gm-Features: AbW1kvbz84okZ8EjFVjUgqmssHigJO0WT_2FKC4hm8C7G6az3kttq8fu5bC2ADo
Message-ID: <CAG48ez2hVHk-C4XAGW2GieHZ9JAF0RrFfpZF7XhYc80pznMwbA@mail.gmail.com>
Subject: Re: [PATCH RFC] x86: Add CONFIG_KERNEL_UNCOMPRESSED support
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-efi@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 2:31=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> Hi Jann,
>
> On Tue, 21 Jan 2025 at 23:16, Jann Horn <jannh@google.com> wrote:
> >
> > Support storing the kernel uncompressed for developers who want to quic=
kly
> > iterate with one-off kernel builds.
> > Store it in the usual format with a 4-byte length suffix and keep this =
new
> > codepath as close as possible to the normal path where decompression
> > happens.
> >
> > The other compression methods offered by the kernel take some time;
> > even LZ4 (which the kernel uses at compression level 9) takes ~2.8
> > seconds to compress a 110M large vmlinux.bin on my machine.
> >
> > An alternate approach to this would be to offer customization of the LZ=
4
> > compression level through a kconfig variable; and yet another approach
> > would be to abuse the existing gzip decompression logic by storing the
> > kernel as "non-compressed" DEFLATE blocks, so that the decompression co=
de
> > will essentially end up just doing a bunch of memcpy() calls.
> >
>
> This all seems pretty complicated, and adding yet another
> (pseudo-)compression method is not great in terms of maintenance
> burden, especially because there are other consumers of the compressed
> images (both for bzImage and EFI zboot)
>
> Did you try running gzip with -1 instead of -9? On my build machine,
> this reduces the compression time of a defconfig bzImage build from
> 4.3 seconds to 0.9 seconds.

I tried lz4 with -1; that is very fast (240ms wall clock time on my
machine, and just 120ms user time):

$ ls -lh arch/x86/boot/compressed/vmlinux.bin
-rwxr-x--- 1 [...] 110M Jan 22 00:01 arch/x86/boot/compressed/vmlinux.bin
$ cat arch/x86/boot/compressed/vmlinux.bin | time lz4 -l -9 - - | wc -c
2.86user 0.04system 0:02.96elapsed 97%CPU (0avgtext+0avgdata 15756maxreside=
nt)k
0inputs+0outputs (0major+220minor)pagefaults 0swaps
46309676
$ cat arch/x86/boot/compressed/vmlinux.bin | time lz4 -l -1 - - | wc -c
0.12user 0.06system 0:00.24elapsed 75%CPU (0avgtext+0avgdata 15524maxreside=
nt)k
0inputs+0outputs (0major+94minor)pagefaults 0swaps
56029608

But I wasn't sure how to wire that up in a nice way. I guess the
nicest option would be to create a separate kconfig variable for the
compression level to use for any cmd_lz4/cmd_lz4_with_size invocations
in the build process; and then maybe only make this option visible if
LZ4 is selected as kernel compression method?

Another option would be to create a new option in the "Kernel
compression mode" choice menu with a name like "LZ4 (fast)", turn
CONFIG_KERNEL_LZ4 into an internal flag that is selected by both LZ4
variants shown in the choice menu, and duplicate some of the make
rules, but that seems overly complicated.

