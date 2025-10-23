Return-Path: <linux-kbuild+bounces-9262-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B55BFFC65
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 10:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA46F3A3D34
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 08:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C332EB5C4;
	Thu, 23 Oct 2025 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpCxyfcx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA5C2EAD0A
	for <linux-kbuild@vger.kernel.org>; Thu, 23 Oct 2025 08:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206830; cv=none; b=oUW1sprc03ecgN9xoyMoQcyIZ7FLw5NdvOdQesE3rxhP0Qd7AoJxCgriJjGVsrSVKUQETBsZZYnA0krkrNo28iRi84lf/++DpL1wVfXhpVkHLE647eEUA6RzIs705Si1HGliQs7GYqM16LBbOeLY2ADZBs0TEvA6RgiIcNCAK0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206830; c=relaxed/simple;
	bh=VysN6EHYkdOUpoEuRAyXlfItg/cHXm73ASmOEB5VMaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFUorwMwG5dDme716Rll8Dx9t8xiQwkMI2vF83mq0AM9avTI+RfOBR9IlIhBIIZfgpLe/4W4sf7TtWXsz3OXPnpkqgiVjhDN4qAY0OWPrL9qo+cBkDvuWKMwU2uIdmqI9j1Gct8pV1AxT3kE+QDQG9LcoUYhpG+O94M/9wgrWvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpCxyfcx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39D7C116C6
	for <linux-kbuild@vger.kernel.org>; Thu, 23 Oct 2025 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761206829;
	bh=VysN6EHYkdOUpoEuRAyXlfItg/cHXm73ASmOEB5VMaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fpCxyfcxWolccjVuj+7ltJnTVlv9CldLMHV7ZNavYsxW82P1lUZ7eu5RIQMU1r+0z
	 Q3xnepx2lNUunvzZwfJFUOJxd0kx9eQBXPIwycYoC4rzTpRt4bwwhKpiQgAWDn8XEF
	 2r6OTz3xOYCAvs/iJOSTNcC3xU0yXsUPUwQCv8BtFXd9qBVT25rO1LjKq8+/3y173E
	 8XXuZL2HWIFV0I9aE2zabqYfwMVfljAoRdly3c3X/Qg8thLDjNDORjENu973pfSO34
	 2D7+P7SyQyXJoNBUHy4sAQuwQKVAJktid2w0h072k+rwxGw3hvZu1SDWuFKoYQLvzE
	 kBX1tiFV19OTA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-592f22b1e49so474315e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Oct 2025 01:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxKHGuISYaFSheQTAupBaU7cdKdz4esoW9IDFMFU3OR2VJgbSLNb9cKLzUCppnqwk+H9BB7+hVvpUq/W4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGNSkWJRIx/CngTjyB+MqS+mg7ljExtt6w+0o6LQJhBAW6xeNC
	a7XirCjxtGgT//DiOV/VII//cIussMXh2jBv4LGRPJeUSC/Ni5MJqrlaUYbvvfXCvBJKxAiKKsf
	2QBT/2W8guek6yIU7VY95wpa3Z37zTqA=
X-Google-Smtp-Source: AGHT+IH2k0BakTqpQ5lQqnKMRD6Z7aVcR5hL4BYeIHS6Ze64OfFlym0sW70AuM9NoMi3ufQme1oL95mzMLwh7Wx0wW8=
X-Received: by 2002:a05:6512:b1e:b0:58a:92cc:5819 with SMTP id
 2adb3069b0e04-591d853543dmr8192834e87.36.1761206828188; Thu, 23 Oct 2025
 01:07:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn> <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
In-Reply-To: <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 23 Oct 2025 10:06:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
X-Gm-Features: AS18NWDF5CVCCcvajdSpES8CkYD2Jn1SbZ6xM-qrHn3BdntYv4P4IHkWBRJpQ1c
Message-ID: <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Oct 2025 at 10:01, Huacai Chen <chenhuacai@kernel.org> wrote:
>
> On Thu, Oct 23, 2025 at 2:55=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > Hi Josh and Ard,
> >
> > On 2025/10/20 =E4=B8=8B=E5=8D=882:55, Huacai Chen wrote:
> > > On Mon, Oct 20, 2025 at 9:24=E2=80=AFAM Tiezhu Yang <yangtiezhu@loong=
son.cn> wrote:
> > >>
> > >> Hi Josh, Ard and Huacai,
> > >>
> > >> On 2025/10/18 =E4=B8=8A=E5=8D=881:05, Josh Poimboeuf wrote:
> > >>
> > >> ...
> > >>
> > >>> But IIUC, the libstub code runs *very* early, and wouldn't show up =
in a
> > >>> stack trace anyway, because there are no traces of it on the stack =
once
> > >>> it branches to head.S code (which doesn't save the link register).
> > >>
> > >> Thanks for your discussions.
> > >>
> > >> Are you OK with this current patch?
> > > For me the current patch is just OK.
> >
> > We have discussed this a few times but there is almost no consensus
> > of what should happen next and nothing changes.
> >
> > Could you please give me a clear reply? Then I can make progress for
> > the following series:
> >
> > https://lore.kernel.org/loongarch/20250917112716.24415-1-yangtiezhu@loo=
ngson.cn/
> For me, this patch is OK, ignore __efistub_ prefix in objtool is also
> OK [1]. But I cannot accept the way that modifying the efistub part
> only for LoongArch.
>
> Clear enough?
>

LoongArch is the only architecture which has the problem, so I don't
see a reason to modify other architectures.

