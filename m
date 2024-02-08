Return-Path: <linux-kbuild+bounces-874-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9A84EA76
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Feb 2024 22:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21B51B2CD00
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Feb 2024 21:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DBC4F5EB;
	Thu,  8 Feb 2024 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tbH1z7zI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6BC37169
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Feb 2024 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707427359; cv=none; b=P483KHMFtwqTA/e9hyo/SeHYS8KmeZMpBkw2rl6APMJCYM7Qd9CAhJS670AN758ujEfzbmUatiRqt7/BSKzCemFKTct13m7D23qVH07ZwNEpddH2G/xO0JXVL7bubkPfq2rxA2crWSS5bldjTlCqYniPtVg+NpuoLlKaL04t+50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707427359; c=relaxed/simple;
	bh=vH5p1yozyS4whmGot7j+dGY6TpRrz6VTlRnbT5a6g3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4jLxLYfBFEThCf6TJa6iGd0YSIpR4Uf2gNJND0yDIIMd0i38TmonIenifBBjkc/y+r2wc0iKd74ogrW8EXrt7DfJ2Y3l+sVrLESk+Yd0exoial35C/0eLc9ZdHPV38aij3og+NAmTwtwNTOQEwt2wqBdDmPGlaCVdu1ZXhHZ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tbH1z7zI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40f00adacfeso107625e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Feb 2024 13:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707427355; x=1708032155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8OU3wz4Ub9unVCJsi58NeLWLTNcAHTCBjqsWFPwn4Q=;
        b=tbH1z7zIyHzxC6uCGV2a0LW42gcPLs7YRQsSSZdDuQlWYNf3O6GNRjtKtRu+qwnJG4
         bz2ffGap20l8G7o3nvpFnt40h+K2q3Z5GWZEm6X0jEtq8fAcNtjXDn0ggap1K55pxzIA
         uUhFHcshtEk8P+bDjtPrk8VuqBcSDQON5IBAOX51+Fr3Vf6a7loBvPMjM/KaJnGeTS8e
         bFbPH7vB3BxgKuNcKJ3etgM9Ogu60h5RWksWaTBizZdpX63h52CKs4Fu/cuHFecrh1pc
         WcRR1JoGdhrkagwqeacTYgi8kMaEQEsF+jYdZJDZe/sCmYOG7/9Yx1CX8M40BZ+DPSYr
         F6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707427355; x=1708032155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8OU3wz4Ub9unVCJsi58NeLWLTNcAHTCBjqsWFPwn4Q=;
        b=PEaBvO4iZVwFW2dFszpG54FAbYemAWE68GUgHux7CGFQW648GMvwAPV/U71uFqoNwU
         pFgIqWHRBjIMLSrHPehO9IeduAtXqmysjaFEDNHrmESbshV+ZsQXSIgeoFkV1g5qjR+l
         dy5LYQCepGCNq38hwcGgJrxayTcJEwyVb9yJb827hiBNGzAduWhFGTot/jvH72EUvBsH
         fwYRwCz9fW+/1jozkj8woAE4j8cgnrqO5QD8Hd98bqc5fdWZ3xp5DgJqJKjiwu+WJzUA
         /rGlx9as6orzguXKNI1cYbnIEXItCS7GdCjp9KpBq6Rnbux9TKuAjz95Oo2p1vzhHz/N
         q1CA==
X-Forwarded-Encrypted: i=1; AJvYcCWTLXq5dvq4x/yzQoRWpMnjnw7+EG4RJW6wWV/zFc2/hDqcr/YzZly8rI/+p4HN3cfa4jc1RRFeU+p6o2dPrxIaZOVFWDt69pwL5c/q
X-Gm-Message-State: AOJu0Yx6hcJ9b98+hsRsnf2BAbbccK5Rn/nYVhsWAoAqEWTfn9JX4oQj
	erGDxJwFBIyDEndyzuEQOMNVHbmVCf8o5UNiJjzSMOynaKsKkbucwyYaWAz8J+JkMWrc/MBtBJ5
	j7p+HrcPLaIv9jPaMPWyqr08H5Hu18+6Wj9X6
X-Google-Smtp-Source: AGHT+IE7vsPh10DxxI1KA5C1YT2SkrXDYmEzpjmr7LVzOBYiWexDjyjtO0Q/ohKVicH6UWqWtcYYaAlJfHXUAZ5liMM=
X-Received: by 2002:a05:600c:3d8e:b0:40f:dd8f:152c with SMTP id
 bi14-20020a05600c3d8e00b0040fdd8f152cmr51960wmb.4.1707427354952; Thu, 08 Feb
 2024 13:22:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208-fix-elf-type-btf-vmlinux-bin-o-big-endian-v1-1-cb3112491edc@kernel.org>
 <ZcVDXhFQB1tzka3C@fjasle.eu>
In-Reply-To: <ZcVDXhFQB1tzka3C@fjasle.eu>
From: Fangrui Song <maskray@google.com>
Date: Thu, 8 Feb 2024 13:22:21 -0800
Message-ID: <CAFP8O3L4qM8d9oFCdx4F4FnQ-97aaA_QXgiGm=gGB0HuVdDS4w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix changing ELF file type for output of gen_btf
 for big endian
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, masahiroy@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, keescook@chromium.org, 
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 1:11=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> On Thu, Feb 08, 2024 at 01:21:06PM -0700 Nathan Chancellor wrote:
> > Commit 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> > changed the ELF type of .btf.vmlinux.bin.o from ET_EXEC to ET_REL via
> > dd, which works fine for little endian platforms:
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
> > Fix this by using a different seek value for dd when targeting big
> > endian, so that the correct byte gets changed and everything works
> > correctly for all linkers.
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
> > Cc: stable@vger.kernel.org
> > Fixes: 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> > Link: https://github.com/llvm/llvm-project/pull/75643
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  scripts/link-vmlinux.sh | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index a432b171be82..8a9f48b3cb32 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -135,8 +135,15 @@ gen_btf()
> >       ${OBJCOPY} --only-section=3D.BTF --set-section-flags .BTF=3Dalloc=
,readonly \
> >               --strip-all ${1} ${2} 2>/dev/null
> >       # Change e_type to ET_REL so that it can be used to link final vm=
linux.
> > -     # Unlike GNU ld, lld does not allow an ET_EXEC input.

From binutils 2.35 onwards, GNU ld also rejects ET_EXEC input. So the
comment can be adjusted.

% file a2
a2: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically
linked, not stripped
% ld.bfd a2 -o a3
ld.bfd: cannot use executable file 'a2' as input to a link

> > -     printf '\1' | dd of=3D${2} conv=3Dnotrunc bs=3D1 seek=3D16 status=
=3Dnone
> > +     # Unlike GNU ld, lld does not allow an ET_EXEC input. Make sure t=
he correct
> > +     # byte gets changed with big endian platforms, otherwise e_type m=
ay be an
> > +     # invalid value.
> > +     if is_enabled CONFIG_CPU_BIG_ENDIAN; then
> > +             seek=3D17
> > +     else
> > +             seek=3D16
> > +     fi
> > +     printf '\1' | dd of=3D${2} conv=3Dnotrunc bs=3D1 seek=3D${seek} s=
tatus=3Dnone
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
>
> Thanks for the verbose examples!
> Looks good to me.
>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Reviewed-by: Fangrui Song <maskray@google.com>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF

