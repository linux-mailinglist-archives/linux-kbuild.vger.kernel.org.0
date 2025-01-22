Return-Path: <linux-kbuild+bounces-5535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68775A193EF
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 15:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F92016BC43
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 14:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD9C212B06;
	Wed, 22 Jan 2025 14:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V541d5Te"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC02145B3F
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737556289; cv=none; b=GBvXy/tRtVon8pTK1dV8qyDzEgBEtk3uPg9XiR0dcoU99Dbk8wt45A40qnS1U5AAB9Dqi510EvEsROvdvL21SG+oJzzmMarRlU6yPPqHEj/I6JP71BqjAP5fXQTaSL3WzVah/bdYKRSiwnPf4prUXaNyjxRVlVwgcYGP3m8FOsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737556289; c=relaxed/simple;
	bh=SS403rpeH4QkIigOaWuCPjLKr+fUBZBgfinOiucot50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjDq3+gmWOsp1GOB8R9LqBwRaiU2nsYbDSCN6c3QZTZos2erfDqpVCu98IeoXXTYUg0nexS3q4u0BWbi4TrD2Xs2H1c8JK3lJADl12V61Ffl133G7/Vsft8UWIoaOfCCzljZQejo2PKisodiXwSsw1UsAUC48BqUkDO1VCJtJP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V541d5Te; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so8759a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 06:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737556286; x=1738161086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SS403rpeH4QkIigOaWuCPjLKr+fUBZBgfinOiucot50=;
        b=V541d5TedfUFSjsQIf3KFhHUVFsJz/dteARttFhjyhhZdTSRJFf8wOPIdRdXZbZ989
         lzP/5vOuw0bRgplY8fCAM3oJCjMBFf8BY8WTckR3Y2xq08JaUSGhx2QCugwmeccxoeQb
         UL6PLEGxLvXSEwV9YJ7GixZUPjvvIvZHBfn57EUnN+agybOwIF5nbwx7NgCv/TIarrSZ
         we7skFqyEez+ZNMZomMWix+TeptgerS66u/a1APwXlK4l1g7V+Mm0vryKX8kLuSmtIOM
         bSCfhckfJB0bvgF5ozBQ4H6DA6d/1A6EAnpiu7RP0OX/MhWPlve7DkTANbBTSEO+h5Kf
         clPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737556286; x=1738161086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SS403rpeH4QkIigOaWuCPjLKr+fUBZBgfinOiucot50=;
        b=EtLFTJeGuDKC5ohBRaoC2ldmzVvobKBT2hzVvbLI5NlkToGO5Y5N+1kCfE8MGUOriS
         XBTjj6MR3qTu/Mm992mCGHJQHtwocX+HXHxQIsWUzIiX6ZLjTgdjM/NGqX6jOfcYTPyv
         NdBiJWV9vbCXzhEoPzyd+eEl69Pt+8bWYq5xu4U16JY+XizrFWKnn8UvjpMUycsP6One
         hvWQkj/1H8ZLEoo+3h0TqUNhlW0FY01jYunQQM/nz6GdmJU/iWX0Mhyd1ARlGlrPRroj
         bvEvPbv3meVy3pUMNyJou+kWsLgILukG5BZNtpdegPOTA81dDuShnR3GEQn9H4U7UYE8
         VgAw==
X-Forwarded-Encrypted: i=1; AJvYcCXeymAPzCliYhvJor88FnUPT2lAQm14QzVZV8Pn4jJrHrTaNJDSu0skmSBZBf+xNynbZXnY2ok2g6iufsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzdg3OqGJEix7I/OsVJ75HPLi3HN469GWyZP9S55VUwCHGQ+Ya
	DzHZtq/kzy3MTdEekZfnv3VA8uwJX0mX5GjKn82nsUFUHUH7qlfqOAqfQcJy7YTHox/BoEojGdz
	XUCBctAqJm0ZxpOYaAZdxcTWOxn1AUDeLCJ5p
X-Gm-Gg: ASbGncv+2B5Llf8CPwGXcFn8I4WungHFjTXaSnPE8jGRPCFIp4cTxwCy1WPiNl/XMBf
	is0aOkfOqgLR+eb7WXJ9Yc3KzYJjhG7ufFO6VrB9Q/J3E0bjgT9M1Ozel8j1RCU6GgTx8WcNKKv
	gadWg=
X-Google-Smtp-Source: AGHT+IFesEQnnGXVizSnPJKKVM2HjDrAqrQujwPVd7KJC4E6/Sdsd6PHt+n+6RGHv0EAgrplpwDwo/jvZD5JmDYeMnc=
X-Received: by 2002:a05:6402:5169:b0:5db:68d3:e8e7 with SMTP id
 4fb4d7f45d1cf-5dbf52d5521mr115343a12.5.1737556285870; Wed, 22 Jan 2025
 06:31:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-kernel-compress-fast-v1-1-fa693b6167d4@google.com>
 <CAMj1kXF-GSB9Ty7X1h4u1uA6qhO1Y1UvVrNF=R+hk3PENRz7WA@mail.gmail.com>
 <CAG48ez2hVHk-C4XAGW2GieHZ9JAF0RrFfpZF7XhYc80pznMwbA@mail.gmail.com> <39417993-9fec-4ff0-aac2-6bb2c5a96b3b@mailbox.org>
In-Reply-To: <39417993-9fec-4ff0-aac2-6bb2c5a96b3b@mailbox.org>
From: Jann Horn <jannh@google.com>
Date: Wed, 22 Jan 2025 15:30:49 +0100
X-Gm-Features: AbW1kvYKlg-OBSlI6fvFs1AyhZUgtuX5mT1bqsyyQWDzwQP4pB8q8_Kx2fKoTI0
Message-ID: <CAG48ez3ddjXA0HiRyS-wT6Fs_fkX-5cf9XRD061YhJu+NZ8dGw@mail.gmail.com>
Subject: Re: [PATCH RFC] x86: Add CONFIG_KERNEL_UNCOMPRESSED support
To: Tor Vic <torvic9@mailbox.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-efi@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 3:19=E2=80=AFPM Tor Vic <torvic9@mailbox.org> wrote=
:
> On 1/22/25 14:54, Jann Horn wrote:
> > On Wed, Jan 22, 2025 at 2:31=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> >> Hi Jann,
> >>
> >> On Tue, 21 Jan 2025 at 23:16, Jann Horn <jannh@google.com> wrote:
> >>>
> >>> Support storing the kernel uncompressed for developers who want to qu=
ickly
> >>> iterate with one-off kernel builds.
> >>> Store it in the usual format with a 4-byte length suffix and keep thi=
s new
> >>> codepath as close as possible to the normal path where decompression
> >>> happens.
> >>>
> >>> The other compression methods offered by the kernel take some time;
> >>> even LZ4 (which the kernel uses at compression level 9) takes ~2.8
> >>> seconds to compress a 110M large vmlinux.bin on my machine.
> >>>
> >>> An alternate approach to this would be to offer customization of the =
LZ4
> >>> compression level through a kconfig variable; and yet another approac=
h
> >>> would be to abuse the existing gzip decompression logic by storing th=
e
> >>> kernel as "non-compressed" DEFLATE blocks, so that the decompression =
code
> >>> will essentially end up just doing a bunch of memcpy() calls.
> >>>
> >>
> >> This all seems pretty complicated, and adding yet another
> >> (pseudo-)compression method is not great in terms of maintenance
> >> burden, especially because there are other consumers of the compressed
> >> images (both for bzImage and EFI zboot)
> >>
> >> Did you try running gzip with -1 instead of -9? On my build machine,
> >> this reduces the compression time of a defconfig bzImage build from
> >> 4.3 seconds to 0.9 seconds.
> >
> > I tried lz4 with -1; that is very fast (240ms wall clock time on my
> > machine, and just 120ms user time):
> >
> > $ ls -lh arch/x86/boot/compressed/vmlinux.bin
> > -rwxr-x--- 1 [...] 110M Jan 22 00:01 arch/x86/boot/compressed/vmlinux.b=
in
> > $ cat arch/x86/boot/compressed/vmlinux.bin | time lz4 -l -9 - - | wc -c
> > 2.86user 0.04system 0:02.96elapsed 97%CPU (0avgtext+0avgdata 15756maxre=
sident)k
> > 0inputs+0outputs (0major+220minor)pagefaults 0swaps
> > 46309676
> > $ cat arch/x86/boot/compressed/vmlinux.bin | time lz4 -l -1 - - | wc -c
> > 0.12user 0.06system 0:00.24elapsed 75%CPU (0avgtext+0avgdata 15524maxre=
sident)k
> > 0inputs+0outputs (0major+94minor)pagefaults 0swaps
> > 56029608
> >
> > But I wasn't sure how to wire that up in a nice way. I guess the
> > nicest option would be to create a separate kconfig variable for the
> > compression level to use for any cmd_lz4/cmd_lz4_with_size invocations
> > in the build process; and then maybe only make this option visible if
> > LZ4 is selected as kernel compression method?
> >
> > Another option would be to create a new option in the "Kernel
> > compression mode" choice menu with a name like "LZ4 (fast)", turn
> > CONFIG_KERNEL_LZ4 into an internal flag that is selected by both LZ4
> > variants shown in the choice menu, and duplicate some of the make
> > rules, but that seems overly complicated.
> >
>
> Hello,
>
> In my opinion 'lz4 -9' doesn't make much sense.
> It's terribly slow and the compression ratio is also not exactly good.
>
> Instead, zstd seems to be a much better choice. Not quite as ultra fast
> as lz4 levels 1 to 3, but much better compression.

I think you're describing a slightly different usecase.

My goal here is something I can use for when I build a kernel, boot it
in QEMU, test something, and then immediately throw the kernel away -
I don't care that much how much disk space the kernel image uses, and
the goal I'm optimizing for is pretty much just the time needed for
one build followed by one boot.

