Return-Path: <linux-kbuild+bounces-71-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8247F06D2
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 15:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B2A7B20943
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 14:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4523E101F7;
	Sun, 19 Nov 2023 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6CvpV61"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA1CF503
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 14:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AC8C433CA;
	Sun, 19 Nov 2023 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700403915;
	bh=0dtY30CPhZvn8O3z06NpRjrEuqxkR7+uYsOGb9dcdao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X6CvpV61YxVyRWd6/vtT+AoaD9pZ0tj3uNT7niektNZOuOBPq9FijgTIDSuKq9qTh
	 Y/EJ8XnpTLJbrG/43spnOC9yPoGR3DI1CN3txOTfgS67g6m5J1bUqfqmwYWHS17/Ri
	 tUedtEvN/I84NPcWt61kY3kdXNiZFgQ2RN8pckRIg6ewg8IBkJKBGmxutEsWs/qsJw
	 oa2+ffB//dBMhhgbezkRUo2P6Us9rd5kKGBfXXkV5ZLpyVrjV+UqgNSuWk2ufgg+lk
	 JGWB+brPzLT3Qk49pZXjQ6iCUYJIOEL/NXnrlooMrJZTGDkcsknNpqqeoRiVfwHbDB
	 wA7o8aXf+RrVg==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso2046732fac.1;
        Sun, 19 Nov 2023 06:25:15 -0800 (PST)
X-Gm-Message-State: AOJu0YyQuh7l3zhEIuRPqOnz85GmeddD7AtZqRK/dlHB4WGsiTBRdfmB
	JSjkJdIlxd/FpdXNglSxIvQTNVbyj82t1MIjs9o=
X-Google-Smtp-Source: AGHT+IHJpfIjTfreDOkdOpR6jVoSn28hEJNeNmNeVKncjPpKurUL2SYs2KUq63HLBYgxqyBXs5/CPxxExorqXjiUkXk=
X-Received: by 2002:a05:6870:e09:b0:1e9:9aa5:997b with SMTP id
 mp9-20020a0568700e0900b001e99aa5997bmr5841334oab.20.1700403915009; Sun, 19
 Nov 2023 06:25:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231119053448.2367725-1-masahiroy@kernel.org> <CAAhV-H6Y4vqc45eaMs+wCN7Quf4e9ogp8aDA8V0sA=TUnMWd-Q@mail.gmail.com>
In-Reply-To: <CAAhV-H6Y4vqc45eaMs+wCN7Quf4e9ogp8aDA8V0sA=TUnMWd-Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 19 Nov 2023 23:24:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=5s0tbqvB+poMD45Oyjknx9=VpVqE+qwqZy9LfQermQ@mail.gmail.com>
Message-ID: <CAK7LNAR=5s0tbqvB+poMD45Oyjknx9=VpVqE+qwqZy9LfQermQ@mail.gmail.com>
Subject: Re: [PATCH] loongarch: add dependency between vmlinuz.efi and vmlinux.efi
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 8:59=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Masahiro,
>
> On Sun, Nov 19, 2023 at 1:35=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > A common issue in Makefile is a race in parallel building.
> >
> > You need to be careful to prevent multiple threads from writing to the
> > same file simultaneously.
> >
> > Commit 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
> > generate invalid images") addressed such a bad scenario.
> >
> > A similar symptom occurs with the following command:
> >
> >   $ make -j$(nproc) ARCH=3Dloongarch vmlinux.efi vmlinuz.efi
> >     [ snip ]
> >     SORTTAB vmlinux
> >     OBJCOPY arch/loongarch/boot/vmlinux.efi
> >     OBJCOPY arch/loongarch/boot/vmlinux.efi
> >     PAD     arch/loongarch/boot/vmlinux.bin
> >     GZIP    arch/loongarch/boot/vmlinuz
> >     OBJCOPY arch/loongarch/boot/vmlinuz.o
> >     LD      arch/loongarch/boot/vmlinuz.efi.elf
> >     OBJCOPY arch/loongarch/boot/vmlinuz.efi
> >
> > The log "OBJCOPY arch/loongarch/boot/vmlinux.efi" is displayed twice.
> >
> > It indicates that two threads simultaneously enter arch/loongarch/boot/
> > and write to arch/loongarch/boot/vmlinux.efi.
> >
> > It occasionally leads to a build failure:
> >
> >   $ make -j$(nproc) ARCH=3Dloongarch vmlinux.efi vmlinuz.efi
> >     [ snip ]
> >     SORTTAB vmlinux
> >     OBJCOPY arch/loongarch/boot/vmlinux.efi
> >     PAD     arch/loongarch/boot/vmlinux.bin
> >   truncate: Invalid number: =E2=80=98arch/loongarch/boot/vmlinux.bin=E2=
=80=99
> >   make[2]: *** [drivers/firmware/efi/libstub/Makefile.zboot:13:
> >   arch/loongarch/boot/vmlinux.bin] Error 1
> >   make[2]: *** Deleting file 'arch/loongarch/boot/vmlinux.bin'
> >   make[1]: *** [arch/loongarch/Makefile:146: vmlinuz.efi] Error 2
> >   make[1]: *** Waiting for unfinished jobs....
> >   make: *** [Makefile:234: __sub-make] Error 2
> >
> > vmlinuz.efi depends on vmlinux.efi, but such a dependency is not
> > specified in arch/loongarch/Makefile.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/loongarch/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> > index 9eeb0c05f3f4..6022bf3d30c9 100644
> > --- a/arch/loongarch/Makefile
> > +++ b/arch/loongarch/Makefile
> > @@ -142,6 +142,7 @@ vdso-install-y +=3D arch/loongarch/vdso/vdso.so.dbg
> >
> >  all:   $(notdir $(KBUILD_IMAGE))
> >
> > +vmlinuz.efi: vmlinux.efi
> >  vmlinux.elf vmlinux.efi vmlinuz.efi: vmlinux
> >         $(Q)$(MAKE) $(build)=3D$(boot) $(bootvars-y) $(boot)/$@
> It is a little strange, because
>
> in drivers/firmware/efi/libstub/Makefile.zboot:
> vmlinuz.efi depends on vmlinuz.efi.elf, vmlinuz.efi.elf depends on
> vmlinuz.o, vmlinuz.o depends on vmlinuz, vmlinuz depends on
> vmlinux.bin, vmlinux.bin depends on $(EFI_ZBOOT_PAYLOAD).
>
> in arch/loongarch/boot/Makefile,
> EFI_ZBOOT_PAYLOAD :=3D vmlinux.efi
>
> So I think vmlinuz.efi has already depend on vmlinux.efi.



That is a story in arch/loongarch/boot/Makefile.


I am talking about arch/loongarch/Makefile,
which is included from the top Makefile.


See this code.


vmlinux.elf vmlinux.efi vmlinuz.efi: vmlinux
        $(Q)$(MAKE) $(build)=3D$(boot) $(bootvars-y) $(boot)/$@




Only the required dependency is

 - vmlinux.elf depends on vmlinux
 - vmlinuz.elf depends on vmlinux


vmlinux.elf and vmlinuz.elf are independent of each other.



In parallel building, GNU Make considers that
vmlinux.elf and vmlinuz.elf can be built simultaneously.


GNU Make spawns two processes to execute these simultaneously:

 $(MAKE) $(build)=3D$(boot) $(bootvars-y) $(boot)/vmlinux.elf
 $(MAKE) $(build)=3D$(boot) $(bootvars-y) $(boot)/vmlinuz.elf



The former enters arch/loongarch/boot/Makefile to build
vmlinux.elf.  (A)


The latter also enters arch/loongarch/boot/Makefile to build
vmlinuz.elf, which depends on vmlinux.elf  (B)



(A) and (B) are independent processes, hence none of them
know the other.


I hope it is clearer.






> Huacai
>
> >
> > --
> > 2.40.1
> >
> >
>


--=20
Best Regards
Masahiro Yamada

