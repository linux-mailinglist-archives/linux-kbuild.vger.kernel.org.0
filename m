Return-Path: <linux-kbuild+bounces-6263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD149A6A924
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 15:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4F1F189B5F4
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 14:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5491CAA7F;
	Thu, 20 Mar 2025 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWa1zvwd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1056978F5B;
	Thu, 20 Mar 2025 14:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742481927; cv=none; b=il3vDKRkS1+qOMkTae2FpUgOSgUVdhzlKC25S+QN4jVEFNq2UX3YsfVPNIfwDJiWAx/OkbBB+J2RSPF0MxZgEpInXlrCHU/x1dtYHyeCg9sv2XPCL7/MPQalqPaObP0jzCKaHYGuQymvpu74U+SzLfzn1mV86RXbhvVlDPWm7tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742481927; c=relaxed/simple;
	bh=mFTONBur+13F+uY2kS+NldAEhsm33/yBF8Gvhz/9VI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSlaNwcYpex2PrFo3KWykAFf17rxWt+dmJANRwAF4dxFajsyIh/GOFAxHg2c7VOn9SsKqYYj5RZcJORzJTajg2KbGejbppLVYe9MoYMF99MwkRRC2Go2XYTyvDwpSS9Hhrj3ZC435dtVBjVPRPbUIcnSNWFPibMrOWEszmDp6Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWa1zvwd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821BCC4CEED;
	Thu, 20 Mar 2025 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742481926;
	bh=mFTONBur+13F+uY2kS+NldAEhsm33/yBF8Gvhz/9VI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oWa1zvwdX03b861YpeQo7bWkNd9aZXYjBdXFtNS5bpLwb4dx8Z+bBDzUsgE6MNBmr
	 wtaQEPIS9xhovtfwxLp5DGqFUQmjrBCQXeZwI6BwLkV3QRXxpNWltn5MeGsq6rZUWv
	 iVMIysmjL/mN7nl/WquAIUS/dimuSYapsuNAAGAH5vS33oqXUbDngrO14Zd1cnNTOl
	 ROyNj+xi07lAg3Cw2u69Q94YKAnGr0LybsrZCSj3JD5cfU55YWGVh3D1AePUePHYpY
	 7sUHuFU95zBM9CgHaz8xI6VUqa1Ua2gAHb8MigGwPiZYneHhZkMHTrUd/trHJ4zKsE
	 WgO1eHk2WoPGQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30613802a6bso9101101fa.1;
        Thu, 20 Mar 2025 07:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUV9NBGDV5LVCmyoZk6A/nRsFkru+JDP2VEWbe6Ct7lynxI9Y0d0+Vl9d0xJxHhNBOtJndr2jWp8V8SR8o=@vger.kernel.org, AJvYcCWlyAkQmxsTi9dL9tHrj4xDAOP6aYgI53qJVfrPGftNHPoKNJyA8VS+jqHPCgXO4Ch696NLL/48UI73S4c/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8nwCL83skDcA1QguS60umoD9utI1uMA28NW9Ex7Hx6z13epmE
	lIRHgg8zvf8+uskCH1PJz5lIxnkHAImbDsNn/BNAoii3c07oKLJ/XUUpT6cdaoY/JI9yUxt60rs
	7L9YvZ2jwTDkBx2Lnh4Wb0Yoek+o=
X-Google-Smtp-Source: AGHT+IHRtXdnLD8pUfqFi3hNor1VULqyvxiUBeS9XF8+MMG8aoaeBpY9PZBo60bd6p0fXyUA0Ud5ySCOZahuCtQOfAg=
X-Received: by 2002:a05:6512:39d2:b0:549:5769:6ad8 with SMTP id
 2adb3069b0e04-54acb195c01mr2552380e87.4.1742481924873; Thu, 20 Mar 2025
 07:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320070746.101552-2-ardb+git@google.com> <CAK7LNARR+LZEUuYSe-TaWwsvA_knwUOoDxZsbucK8GkwBJxgmA@mail.gmail.com>
In-Reply-To: <CAK7LNARR+LZEUuYSe-TaWwsvA_knwUOoDxZsbucK8GkwBJxgmA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 20 Mar 2025 15:45:13 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE1jVp+3aoyWEKNUOg3VWJ14xtyFGE0n3-UScEPA402Jg@mail.gmail.com>
X-Gm-Features: AQ5f1JqptoXNZA92Dzm9aR9FxjvzL1RCem2adm9WQ8n0JxNa-D4vxCArZR9uRlA
Message-ID: <CAMj1kXE1jVp+3aoyWEKNUOg3VWJ14xtyFGE0n3-UScEPA402Jg@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: define __GENKSYMS__ when processing asm-protoypes.h
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, brgerst@gmail.com, 
	x86@kernel.org, nathan@kernel.org, linux-kernel@vger.kernel.org, 
	nogikh@google.com, Sami Tolvanen <samitolvanen@google.com>, 
	syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Mar 2025 at 15:40, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Mar 20, 2025 at 4:08=E2=80=AFPM Ard Biesheuvel <ardb+git@google.c=
om> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Ensure that __GENKSYMS__ is #define'd when passing asm/asm-prototypes.h
> > through the compiler to capture the exported symbols. This ensures that
> > exported symbols such as __ref_stack_chk_guard on x86, which is declare=
d
> > conditionally, is visible to the tool.
>
>
> Why don't you make it unconditional, then?
>

Because this symbol is being hidden from the compiler.

Commit 577c134d311b9b has the details.

