Return-Path: <linux-kbuild+bounces-9202-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE365BE833C
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 13:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B08235C441
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 11:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451ED32D0E8;
	Fri, 17 Oct 2025 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWvUWl5n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2DD32D0CA
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Oct 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698832; cv=none; b=E3n0PLZnaBEQbrzqnJufUwd7z/uTVW32X7OBmQoyJgacltg4dbPPBV/VxQsMoL3+/a0rblT7LhUIEUNNlkabZv28xIlrDY2XnYFYT4ccgMT+3Lk3wT+QA3tVtCA1Vx+1qPvKEr4Xi1nmqirviaQh5T09G0DyR/RsqY6Db5REY5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698832; c=relaxed/simple;
	bh=0qKoqeZEFFOD2RlWkl69ruJZbnMDtQNF0IQVriRGDxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPO5BRSg/jyv/k70Z/YUTyxlulodUGdE+X0FVO2tK6kQgU2+v5xKlF6sBJbOmInXymKXRcnhHFOppcLV7EL5yn+zvs5yCfy9NhpxGC/WcFxO6A4KJr+Ni50h+tk4GhUqc9ql5W9TtC5Qa1Zk1NBbLN0WtxH5kTBmHYXmsP4m6JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWvUWl5n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C338AC19421
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Oct 2025 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760698831;
	bh=0qKoqeZEFFOD2RlWkl69ruJZbnMDtQNF0IQVriRGDxI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EWvUWl5nqTu29sldpT18woB5mT2hLN7XcQmiPTwyYqdXHu+jnVksMP04uDJo2FWId
	 4waqpD0TRzeyYRxJyOG+KEvd5B4kPr3T4CVxPDayI/eVuAIa7DeXuZSrik+8eZN7v4
	 LOuqUX8hLZGgrZq0E+I+Ne/tD7zeWxatENHTNaQT6XhXdB9sD/ewxDfqRU3BdtbZdG
	 QPZMDM+rejO5ZkUON1ph6fVZPVRUKL2HLcUQ/mDGUCK/bLV5XfIqQh99SGJsRbcg3Y
	 4ahOPJqRncQedXOEULxkPrZ+OpZ+tWNuIZLVsrXnJIW3z5j28FogNDbN/BmUf7rz89
	 mpc1xYLK4W6Xg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-58d29830058so2235962e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Oct 2025 04:00:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYPW2B6YKSwCQUUyBmjgFty++wEm3y7wYI0djCnzy+ldDI4n6ebvcq3ARzX6u0ktcrTbFuZMFGO3EikBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMpxjdz1aHlBvfqCld8NLKOzEehIJwtz/px1WDs5YmgoysX+v4
	jhtpgvp6bBrNoM/WgagchAahpuNM30lPTvZpi+r7DZO2uC9loZOJz8lXF1+famf5sDm/z3W8Aux
	QG7U9Vx/j6k3/w2fSNHcwi5+vZYDpmbM=
X-Google-Smtp-Source: AGHT+IHxN2kS3odkWkazx6Kii1GVS0Wt6GhSEw2kpURhNsBRjiYw7sCxVK13poY4URZHjBG3Xbuf2j46mmtwgrQHRjc=
X-Received: by 2002:a05:6512:3b24:b0:57b:8a82:1dcf with SMTP id
 2adb3069b0e04-591d84fd0c5mr1144213e87.18.1760698830068; Fri, 17 Oct 2025
 04:00:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn> <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
 <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com> <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
In-Reply-To: <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 17 Oct 2025 13:00:17 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
X-Gm-Features: AS18NWCIYrjb5KW9LhHY0tpEoyBeBcU1fB0oUJiskEYiezDhT-2dTfp0F9THCv4
Message-ID: <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Oct 2025 at 17:49, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Thu, Oct 16, 2025 at 04:52:20PM +0200, Ard Biesheuvel wrote:
> > On Tue, 14 Oct 2025 at 18:47, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > > The idea is that libstub code doesn't belong in vmlinux.o because it's
> > > not a part of the kernel proper, and doesn't need to be validated or
> > > modified by objtool for any reason.
> > >
> >
> > I don't see a reason to change this on architectures that a) do not
> > use objtool and b) link the EFI stub into vmlinux. If LoongArch wants
> > to change this, that is fine, but that still does not mean it needs to
> > change on other architectures too.
> >
> > EFI related boot errors are a nightmare to debug, and I will be the
> > one getting the reports when this regresses arm64 on hardware that 2
> > people on the planet have access to.
>
> The idea was to have more consistency, so vmlinux.o never has libstub,
> regardless of arch, but that's your call.
>

The code in libstub ends up in .init.text, which will be mapped
executable during boot on architectures that incorporate it into
vmlinux.

If objtool validation is never needed for such code, on the basis that
it is not actually called even though it is present, then I think that
is fine.

For the other architectures, I don't have any objections in principle,
I'm just being cautious due to the regression risk.

> I'd still propose we keep the KBUILD_VMLINUX_LIBS_PRELINK mechanism to
> allow other arches to opt in as needed.
>

Again, no objection in principle. To me, it just seems a lot of churn
just to avoid having to teach objtool about indirect calls to noreturn
functions.

> And that variable might even be useful for other cases (x86 startup
> code?)
>

Not all x86 startup code is in .init.text; some of it sticks around
and is still used at runtime. I reckon that implies that objtool
validation will remain needed for that, no?

