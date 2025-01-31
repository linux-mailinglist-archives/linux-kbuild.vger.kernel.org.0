Return-Path: <linux-kbuild+bounces-5584-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B0BA242DD
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 19:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F12B9188A529
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 18:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435111F2361;
	Fri, 31 Jan 2025 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2cNh50E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161D6153565;
	Fri, 31 Jan 2025 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738348838; cv=none; b=IZaluS8neON+cuBeKS3i1L/dDn6d/TG6OhHkjxrd1PDBJ+/SV4H4TSj1yQjP20BuvUX1ksDwMhMdJciyoIa0v6hhBGtNYjUgIGjQXDjvmaDR3W3lBE4i0TTLOj8TXseYXSZKCZkItzJRodlLmAC5YUhiYtY826HVKEZhIAgnHX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738348838; c=relaxed/simple;
	bh=HocyuMQRt/Jb/+PhULdNRTzn6VciVwMKpzCeYQ7J9jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhouJFPbQ/Dmveg1dAXOamwNNXAR87Rtau7Q1aWArxjfrQZCCDM8EShGDDRFKgBV41vehm9zq3RxgiLqvwjLTzWmbPwicCXqm9sZTbcYizW9mKw/Nlw1C664wytN43E3SAtgucnJtuWhZY/TZSjV7QBNRM8ti44EeBNITLMxIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2cNh50E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0B8C4CED1;
	Fri, 31 Jan 2025 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738348837;
	bh=HocyuMQRt/Jb/+PhULdNRTzn6VciVwMKpzCeYQ7J9jw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M2cNh50Eu/F7JDW4BQp4ARFBFKQY195tn1ptJE10HDN9HW/1V4PAbIuWpUW3QoKkG
	 BEOofeY0shf3V8aMljPbHOInTOxvcsF0IimDfvN/bHLVhssHBPVd5j6NBNQS1u8wxZ
	 a85Q8DUReOc06qJMowCKM/9SsaoaAA4vjSnzF2J42Dfgq8jN4+2azvpFeznxMnqcuG
	 lSMBASDlEOErhzS3qaFGBrhPJBlBxzV2s9ojZfUf+8EqM14jRY2up1HtdxRtkaiKgJ
	 EYEsWezXqkdtnZpT0548P1pMmtq3JUUpbPl9hPLZ2zsbybxWn+a4yitiKKafZLtG4G
	 Ki2pW8vFpMStA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-540201cfedbso2051274e87.3;
        Fri, 31 Jan 2025 10:40:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJfQW03tfLJ9Sb8cRbtiJbo3+GoQabCB8aJfPz6RywbK8yEnk52dt6qxjbXF+vZPwRZEdncotsPnvrhwA=@vger.kernel.org, AJvYcCXTrHXf5hP1ePlNYeemJiqVOoMGKGBPB3hO2rQSf1KW9aw/YknHVmAn1BuupeOdOvy5A31u8sg36PIGIw3K@vger.kernel.org, AJvYcCXxxXDVOGZpBF+LXfkid884e6AxqBB7F75lJ9vbSZ8oplJhZmudq3NBKutWBesaQVLPy7xGPtqOkGderw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIyZtrkSpbWAbKy+vNp6Nt6/ckyjv9AoJiAvIkpIfqZ8ZXDVsp
	6uwmeCzxzrmLYAyAZk7UAA2Zi9aFceGUkUMSuf0FIjtTH5iDgr/JWUqz7BIKBlVdXdEVzUtZwjv
	XpE+65nwqQ3X57iKThFM8AGytRpw=
X-Google-Smtp-Source: AGHT+IHdKn9VqjLBKaDbjxSRGDxQQw7nKxOIaBP1a43GPldoC1cyLVVrxGrDHZgDHOgeyoJr8p4yOQe5I/qrgaM3GJ8=
X-Received: by 2002:a05:6512:3d86:b0:543:bb21:4245 with SMTP id
 2adb3069b0e04-543e4c037a3mr4510825e87.28.1738348835776; Fri, 31 Jan 2025
 10:40:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
In-Reply-To: <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Jan 2025 19:40:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
X-Gm-Features: AWEUYZmtraJ0f1xtPGTQ8Kk14Y8os0Pf_CFXonFppaQr6hImtn_0cqsdTmSGWzY
Message-ID: <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 31 Jan 2025 at 19:35, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Jan 14, 2025 at 12:53=E2=80=AFAM Ard Biesheuvel <ardb+git@google.=
com> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Due to the fact that runtime const ELF sections are named without a
> > leading period or double underscore, the RSTRIP logic that removes the
> > static RELA sections from vmlinux fails to identify them.
>
>
> Dumb question - why can't you rename the section 'runtime*' to '.runtime*=
' ?
>
> .rel* matches to sections that just happen to start with '.rel',
> which may not be REL or RELA.
>

That is what I proposed originally [0] but it was shot down by Linus.

[0] https://lore.kernel.org/all/20241014125703.2287936-4-ardb+git@google.co=
m/T/#u

