Return-Path: <linux-kbuild+bounces-906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD9F852793
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Feb 2024 03:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDCCDB23536
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Feb 2024 02:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A62B849C;
	Tue, 13 Feb 2024 02:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K5NZstl8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857A48820
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2024 02:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707792469; cv=none; b=jPpZwqOYqXVUHJwT0ewJmpbuvpgIFO+xnaAkFEg2zNZ13xH3LE6ZUJJYIexFvegrFjIa2xEOwRYRB0QCsdgJRMhYIbttLITyyc/6uMY9n1su2fvBdz2b4EYhTlmZ31UCP6Qmu0tuC7u76HtfHUy+XlC2FipqP81/8n43PGANDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707792469; c=relaxed/simple;
	bh=1ENHKjt3Uc2mr1Ke1IQDakTrAi2JOlr6brAtfQuPsQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMY8o31882xo5kVqp/6JrPXmgTpHv4HkSzKYQkXHSfmHpbJ/MvcFdUeo6qC82QY3sQmF1qWJNc9QAcOCazg3CyZqTWYCnYSgjTpuyvaJPeApG6KyUWsJJsN8tDrluC9hFdwmCuyaajBNRUrQwzZ6lvOi92D2vU3O1b3Xjz1B3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K5NZstl8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56037115bb8so3973a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2024 18:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707792466; x=1708397266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgrUTvQOJUYDuKbHFZKlpKXYvoGRnWvQmByrFkbKhpY=;
        b=K5NZstl8qsnTB4L+YhEd/c41q/HMQ3SwCDTHWmJwIicsWrz2N360xTNTDlnu7w35QG
         Y0kf+E+UGbsbYVo6fpDweisjB414TuJD5ooCK+RGxInaO4FGlojeLTnyivwB5fakT3dr
         5ag7eaA2K7mCoeCVrkns021oA14wiWdKCLIIXsh8F4+qCOXpm8D4FwvT6Z+GOz82Ze89
         kc6qfWvoCgh9bFFPzLMTJlzR5BS2aOzhLNurkU8UM5SlmkhxwvKFQN40GXhB2XT0vGEG
         izkA5/6ufUszmOPeKGIcgnuLgwqKBVEFX5H4r+/+e8oYySHMbE4Yh3Dvvvx8bKO+mMOO
         PV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707792466; x=1708397266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgrUTvQOJUYDuKbHFZKlpKXYvoGRnWvQmByrFkbKhpY=;
        b=EZGdGCS9055h8Pp+d8JrGbtfPxjRyRGhTNi2nDhFna/PaeINvwYJBpVaKDuLYzwEvG
         Y/2rOkx67YH/WugdpIeW4uAGJYUAiaif9aesiNpj57SEiszYN505P8zxyiZSmCudmq2D
         2dNC/secQh2iIqI5pPcRSB+2DXw9mTx7SJPJ0JvqdW6OdNRCTWovMKZ29V7uP0S2WO7s
         ZQeQxrx4KKIdKM2nYA98MxKM5kxjRjLGDkVM9zFdjHkmDH3jyUbVI1Zc409GTulxVNG6
         cc9SXi/ZZSARa+/U6VH8HL1FiHXRYPcRmvfKBkqvAGNimf5yov1NevG4BzXl8P22j/O4
         E23g==
X-Gm-Message-State: AOJu0YydQas/vfbwkD6SzcFO9LtDdIIK9be2htFO4JFpX2llKp4miM8P
	5Ki3HST6m1yJNMtM3OTDwocyzdDJDJpP++Eixqce6yviOdAhZOluXkE6N+49u1Oo79s3q2lfl3U
	wn6fcjQiv0zd7M/915SCROojK1AGyKEvIlMFo
X-Google-Smtp-Source: AGHT+IEct+r39gbb5nT7BKUPki00osiOdxLM8JznhwylxUtmHwxRUvLEwmdDrymuS+ebBIImPsxnRRZuVs2lgoq7LJ8=
X-Received: by 2002:a50:9f21:0:b0:561:519f:85c4 with SMTP id
 b30-20020a509f21000000b00561519f85c4mr67882edf.4.1707792465570; Mon, 12 Feb
 2024 18:47:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212-fix-elf-type-btf-vmlinux-bin-o-big-endian-v2-1-22c0a6352069@kernel.org>
 <CAK7LNATK=8V+BroyN+uo9OynkfR6s6HtRgh=LF7yan7cPkbaTA@mail.gmail.com>
In-Reply-To: <CAK7LNATK=8V+BroyN+uo9OynkfR6s6HtRgh=LF7yan7cPkbaTA@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Mon, 12 Feb 2024 18:47:32 -0800
Message-ID: <CAFP8O3LVgVRsrBAmJKV02bw2yrHziTFeRtJsnqx0iXieYMTJUg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Fix changing ELF file type for output of
 gen_btf for big endian
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, nicolas@fjasle.eu, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, keescook@chromium.org, 
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 6:16=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Tue, Feb 13, 2024 at 11:06=E2=80=AFAM Nathan Chancellor <nathan@kernel=
.org> wrote:
> >
> > Commit 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> > changed the ELF type of .btf.vmlinux.bin.o to ET_REL via dd, which work=
s
> > fine for little endian platforms:
> >
> >    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF...=
.........|
> >   -00000010  03 00 b7 00 01 00 00 00  00 00 00 80 00 80 ff ff  |.......=
.........|
> >   +00000010  01 00 b7 00 01 00 00 00  00 00 00 80 00 80 ff ff  |.......=
.........|
> >
> > However, for big endian platforms, it changes the wrong byte, resulting
> > in an invalid ELF file type, which ld.lld rejects:
> >
> >    00000000  7f 45 4c 46 02 02 01 00  00 00 00 00 00 00 00 00  |.ELF...=
.........|
> >   -00000010  00 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |.......=
.........|
> >   +00000010  01 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |.......=
.........|
> >
> >   Type:                              <unknown>: 103
> >
> >   ld.lld: error: .btf.vmlinux.bin.o: unknown file type
> >
> > Fix this by updating the entire 16-bit e_type field rather than just a
> > single byte, so that everything works correctly for all platforms and
> > linkers.
> >
> >    00000000  7f 45 4c 46 02 02 01 00  00 00 00 00 00 00 00 00  |.ELF...=
.........|
> >   -00000010  00 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |.......=
.........|
> >   +00000010  00 01 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |.......=
.........|
> >
> >   Type:                              REL (Relocatable file)
> >
> > While in the area, update the comment to mention that binutils 2.35+
> > matches LLD's behavior of rejecting an ET_EXEC input, which occurred
> > after the comment was added.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> > Link: https://github.com/llvm/llvm-project/pull/75643
> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for updating the comment.

Reviewed-by: Fangrui Song <maskray@google.com>

>
> Thanks.
>
> I will wait for a few days until
> the reviewers come back to give Reviewed-by again.
>
>
>
>
>
> > ---
> > Changes in v2:
> > - Rather than change the seek value for dd, update the entire e_type
> >   field (Masahiro). Due to this change, I did not carry forward the
> >   tags of v1.
> > - Slightly update commit message to remove mention of ET_EXEC, which
> >   does not match the dump (Masahiro).
> > - Update comment to mention binutils 2.35+ has the same behavior as LLD
> >   (Fangrui).
> > - Link to v1: https://lore.kernel.org/r/20240208-fix-elf-type-btf-vmlin=
ux-bin-o-big-endian-v1-1-cb3112491edc@kernel.org
> > ---
> >  scripts/link-vmlinux.sh | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index a432b171be82..7862a8101747 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -135,8 +135,13 @@ gen_btf()
> >         ${OBJCOPY} --only-section=3D.BTF --set-section-flags .BTF=3Dall=
oc,readonly \
> >                 --strip-all ${1} ${2} 2>/dev/null
> >         # Change e_type to ET_REL so that it can be used to link final =
vmlinux.
> > -       # Unlike GNU ld, lld does not allow an ET_EXEC input.
> > -       printf '\1' | dd of=3D${2} conv=3Dnotrunc bs=3D1 seek=3D16 stat=
us=3Dnone
> > +       # GNU ld 2.35+ and lld do not allow an ET_EXEC input.
> > +       if is_enabled CONFIG_CPU_BIG_ENDIAN; then
> > +               et_rel=3D'\0\1'
> > +       else
> > +               et_rel=3D'\1\0'
> > +       fi
> > +       printf "${et_rel}" | dd of=3D${2} conv=3Dnotrunc bs=3D1 seek=3D=
16 status=3Dnone
> >  }
> >
> >  # Create ${2} .S file with all symbols from the ${1} object file
> >
> > ---
> > base-commit: 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478
> > change-id: 20240208-fix-elf-type-btf-vmlinux-bin-o-big-endian-dbc55a1e1=
296
> >
> > Best regards,
> > --
> > Nathan Chancellor <nathan@kernel.org>
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF

