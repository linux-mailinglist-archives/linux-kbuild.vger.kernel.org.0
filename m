Return-Path: <linux-kbuild+bounces-9281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6776FC0A6B2
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Oct 2025 12:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FBD44E2692
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Oct 2025 11:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A519F2367A2;
	Sun, 26 Oct 2025 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO0l5rCu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD451F0E26
	for <linux-kbuild@vger.kernel.org>; Sun, 26 Oct 2025 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761477614; cv=none; b=I7EbcTzo/T0ZaCEyRSYbtNpEicbGr85bB4mqUGUAWKyeE55PgBDmf2UvxEp9E/eMTNzMrEIg4ROdqzHrYRka/GnACSVYluv/3hbX8yphXoYVTdpw2X7QqduEfWELOknEQFcp1AWbMfuVsMMB4ypL1fUO33SAPgbXQoryMNHN6GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761477614; c=relaxed/simple;
	bh=WXhSsOHYlSratjyBUfDoyHGZ/FPtXvc0lOg0vqlrD54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyzBYHbqzgotf3+i4bxxwoHrQmqmNgLe7xRV6sdL382XKo0l477MBT5ls4bt+KZ7fy+67Va8os2U9xajELcLWFRHpbIeR2X8WrO8nCXByh05vQFGQQLupamjuKQYeE76Z5JQ9LE6r8rCafEQpSccjzUR+DqbjX3JRajxSFvHhco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO0l5rCu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAD5C4CEFB
	for <linux-kbuild@vger.kernel.org>; Sun, 26 Oct 2025 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761477614;
	bh=WXhSsOHYlSratjyBUfDoyHGZ/FPtXvc0lOg0vqlrD54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZO0l5rCuPbIC/tMs2ZuC773iICJte/FhCsKJGvRLh/ebR5CG5S+VTY5XG4cXYGP6M
	 Z/s0dV9b87BHLomxqE3D5UB8YqEJDQMLXCjNhmL9oHg2FyALdelP52uznyqeTRAPMp
	 oBp5OEhpNRTOVFxf+2szgNMIw5nni1QkLzPtSsAco9J85vpSxJJ18yQu3skkx9ZV48
	 TeqeJWzUOU+ddhJvY63n21A1GJ/mL1Kp2KEUzUAQcILa1EYMOUZ9Xd4Ih7IKIH87W4
	 1ZcaMZsEhxOSBXmCN8UXXzR3oP/5iDBxJi5ii6DwIowMZaDj+Q9cssR22TrvUoAcqe
	 0vAyEzYFx5uSA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c3d913b3bso6259722a12.2
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Oct 2025 04:20:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYvOGxdyhkx/ZCmmlZPFxfw+egQJ95pX1LQa29OtNEACQlqPS2/pkUYHAchOhAFmvcouAxbM0fq1QOR4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUOmfCPXSJ3Qx7N6iCWiBuJBjyzGdxuAwwYwLB0xDQ1Ph+jkfa
	4N7UCeNvz8c5qkFRFHfso/JlGGOvgO7cC7wxuWEA4heWkyw+2VGhMPcdfL9UMTQ7T3BICpO1xLk
	3sntz2f8wYvI6ihDJ7rEkx+0foyLzBmM=
X-Google-Smtp-Source: AGHT+IHSStRGe85V7TfWyZyzfF6Ya5hjYUTpONErQ3HLd1kUDYooXBrzJ4vLF95pyPPlWOudi0MNIFeRATeAXFEtvLQ=
X-Received: by 2002:a05:6402:2554:b0:63e:2d46:cc5d with SMTP id
 4fb4d7f45d1cf-63e3dff1673mr10711788a12.7.1761477612710; Sun, 26 Oct 2025
 04:20:12 -0700 (PDT)
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
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
In-Reply-To: <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 26 Oct 2025 19:20:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnx7p3KGFn8w4CVpWUGoGvdUyYRdpas7DP247MZLQ7EzDz5RnfRwoldkjM
Message-ID: <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 4:07=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Thu, 23 Oct 2025 at 10:01, Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > On Thu, Oct 23, 2025 at 2:55=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> > >
> > > Hi Josh and Ard,
> > >
> > > On 2025/10/20 =E4=B8=8B=E5=8D=882:55, Huacai Chen wrote:
> > > > On Mon, Oct 20, 2025 at 9:24=E2=80=AFAM Tiezhu Yang <yangtiezhu@loo=
ngson.cn> wrote:
> > > >>
> > > >> Hi Josh, Ard and Huacai,
> > > >>
> > > >> On 2025/10/18 =E4=B8=8A=E5=8D=881:05, Josh Poimboeuf wrote:
> > > >>
> > > >> ...
> > > >>
> > > >>> But IIUC, the libstub code runs *very* early, and wouldn't show u=
p in a
> > > >>> stack trace anyway, because there are no traces of it on the stac=
k once
> > > >>> it branches to head.S code (which doesn't save the link register)=
.
> > > >>
> > > >> Thanks for your discussions.
> > > >>
> > > >> Are you OK with this current patch?
> > > > For me the current patch is just OK.
> > >
> > > We have discussed this a few times but there is almost no consensus
> > > of what should happen next and nothing changes.
> > >
> > > Could you please give me a clear reply? Then I can make progress for
> > > the following series:
> > >
> > > https://lore.kernel.org/loongarch/20250917112716.24415-1-yangtiezhu@l=
oongson.cn/
> > For me, this patch is OK, ignore __efistub_ prefix in objtool is also
> > OK [1]. But I cannot accept the way that modifying the efistub part
> > only for LoongArch.
> >
> > Clear enough?
> >
>
> LoongArch is the only architecture which has the problem, so I don't
> see a reason to modify other architectures.
From your reply I think the efistub code is completely right, but
objtool cannot handle the "noreturn" function pointer. And this patch
is a workaround rather than a proper fix (so you don't want to touch
other architectures), right?


Huacai

