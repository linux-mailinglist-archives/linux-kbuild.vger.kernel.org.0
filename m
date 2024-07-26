Return-Path: <linux-kbuild+bounces-2679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 206DF93DAA3
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 00:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C869C284179
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 22:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB87114A0AE;
	Fri, 26 Jul 2024 22:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bu97LNjI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E94143C6A
	for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2024 22:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722032332; cv=none; b=O7/VJxvlOXBHnkYcAKbYuD474ihxHiNq/H2znUfu8cqggLbjf6nlaWMzO7dTQ3AHdgN8+ppSQwpAjpGcu58PdH6ENk+WNtdjHbnkBgrK56fycSVMOVMr9LgbhJzRJ7q/1IXZCx/cEMGw7eEIanrys7w2ezZ6pLq794iR/4pQAZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722032332; c=relaxed/simple;
	bh=1f4PLSeDf//4F4d9fqeO9tHXKaDlu4ZiF8daIPO9XfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhlzsgVpU+5ivpm9BfmtLStiorhW8qRBdlyT15acxBuCQUd0I1F+DyV9Un/7drNBQkwNowUjBJdMF/kXsFv5FARPg7FoAHCZEnJ5QghSLF107e5l5Qbj4pakYp+0G9+wfhRqCcjiReX7Av8vJ4vq//qTy+Oy+1sb9vn8zMbnaIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bu97LNjI; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef2ed59200so20001241fa.3
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2024 15:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722032329; x=1722637129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGTyknzdUVy6TjNYHCceWsgBZJcDcOQ3F4kdpqXLPdw=;
        b=Bu97LNjI1zm6M0D08dvzuvqaplKuO99pbCMjxHYCuDgZtf71zzTyIijB3690HH43QH
         5BEOMQJOZ4QiJ4pl46XlPkimLM/v1cPMRPNZEn97z+S6Vn3rIfEHCr9dKSEUcKMXq6cH
         KSrcjot0APtAYvFmJInYeCh7gOnyMWKOff7hagtyuWBChxkRZYa03YCU7UbSNQPhL5tQ
         UN3DueY6VK684R8LZSCzgVWv+RcX5loxGhi8ZR1JD1tmi9DrGJTc6H9RCg7NhVfWzgQC
         3o27rbpbOrC1DRMam/YsBSGlI8FzTdJtDCCPWdNTegyq35tU8BZ77zqihQwr/JMZBsGQ
         o5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722032329; x=1722637129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGTyknzdUVy6TjNYHCceWsgBZJcDcOQ3F4kdpqXLPdw=;
        b=uEY8D2GX71QvziArw93WO/rGrWOkt6YyZ81nL+QobW2O819vsfyuIvB80L8VEQLeAf
         R7EmTeiobMwSuI9SS0RUFxDTDzoAOPnVEWms9WeOkK0sI3d/Pv1EUpI5NM4kxt0T8KCB
         90b5H3EkcC6SBB+S77+4KZZgnrayaypVxdLSaX+hB2qHRh18jIhLN6HILQ1dusMniwML
         5+WOWJ2ofM48DyC4DOf/Coa7dTXs+LuS6swhx/TVkQ5vnUjELF0tlLyoqmubOpJHO6E3
         1vbqS4WOGnRa7JKJAx6iI0XYxwOM1ersPhL2qCCHSABm7nEDYA7J8pToiE4hD7Y6eA/D
         6lOA==
X-Forwarded-Encrypted: i=1; AJvYcCXDEbG+l7RAMChZyDE0RDU15POlomePYPRS3qHx4O0rCCA4713TZwnYtHoWxWML3w95IQsBMu3sasOTX3p3gv4bp3veihhT/tEH/cRE
X-Gm-Message-State: AOJu0YzwA1h98AMFMmAKk5o7+FaUhsFzXB/HMrk3odb6jiMyClimzSaq
	AEsIWEto1liSEvopfxwMmaZ5uIFgbI24ne6eLmfeuFMrFL/fT5UsNjrShGLkXuajX23VPRN4tRb
	NNIM1+slRSNSxAVDWCOg1YG4ud7I=
X-Google-Smtp-Source: AGHT+IHlw1E6WxJQ8S6oiAvTXKmk4uUDzEBCgH3uxED8CIC8VcHQyt/OD2+6f3sZaAseb9/zb79EzVHXA70YuTs3U08=
X-Received: by 2002:a2e:924c:0:b0:2ef:2472:41c7 with SMTP id
 38308e7fff4ca-2f12ee02f73mr6370701fa.7.1722032328957; Fri, 26 Jul 2024
 15:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
 <CA+icZUX-vannYgAHt3O00kwWXLX_cFpr6JJadX==bpZcUzh_7w@mail.gmail.com> <CA+icZUU-ktXDwQPA9cbXPM_A9pKoOzUCJ821Z2U1vzFkujMErA@mail.gmail.com>
In-Reply-To: <CA+icZUU-ktXDwQPA9cbXPM_A9pKoOzUCJ821Z2U1vzFkujMErA@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 26 Jul 2024 23:18:37 +0100
Message-ID: <CACvgo52-KbJHUde8kP5-=HdHoCFEcAt=mmy1i=MR7Er7xZz67w@mail.gmail.com>
Subject: Re: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	q66 <q66@chimera-linux.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Torge Matthies <openglfreak@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sedat, all,

The mixed quoting is confusing me a bit, hopefully not to the point
where I miss some questions.

On Thu, 25 Jul 2024 at 21:00, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Jul 25, 2024 at 9:23=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.co=
m> wrote:
> >
> > dileks@iniza:~/src/linux/git$ git grep zstd scripts/ | egrep '\-(19|22|=
T0)'
> > scripts/Makefile.lib:      cmd_zstd =3D cat $(real-prereqs) | $(ZSTD) -=
19 > $@
> > scripts/Makefile.lib:      cmd_zstd22 =3D cat $(real-prereqs) | $(ZSTD)
> > -22 --ultra > $@
> > scripts/Makefile.lib:      cmd_zstd22_with_size =3D { cat
> > $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
> > scripts/Makefile.modinst:      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> >
> > -sed@-
> >
> > On Thu, Jul 25, 2024 at 9:09=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.=
com> wrote:
> > >
> > > Hi,
> > >
> > > I am a big fan of ZSTD - here version 1.5.6 on Debian/unstable AMD64.
> > >
> > > When playing with CONFIG_MODULE_COMPRESS_ZSTD=3Dy I observed a 35MiB
> > > greater linux-image Debian file.
> > >
> > > Debian: ~100MiB <--- CONFIG_MODULE_COMPRESS_XZ=3Dy
> > > Selfmade: ~135MiB <--- CONFIG_MODULE_COMPRESS_ZSTD=3Dy
> > >
> > > So, I checked the used compression-level of ZSTD in the build-process=
:
> > >
> > > [ vmlinux.bin.zst ]
> > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep vmlinux.=
bin.zst
> > >  { cat arch/x86/boot/compressed/vmlinux.bin
> > > arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; printf
> > > \370\040\157\003; } > arch/x86/boot/compressed/vmlinux.
> > > bin.zst
> > >
> > > [ amdgpu.ko.zst ]
> > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep '\-T0' |
> > > grep amdgpu
> > >  zstd -T0 --rm -f -q
> > > debian/linux-image-6.10.1-1-amd64-clang18-kcfi/lib/modules/6.10.1-1-a=
md64-clang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> > >
> > > Here some numbers:
> > >
> > > [ Values in KiB ]
> > > $ du -k amdgpu.ko*
> > > 29264   amdgpu.ko
> > > 5672    amdgpu.ko.zst <--- XXX: -T0
> > > 4264    amdgpu.ko.zst_T0-19 <--- XXX:  -T0 -19
> > > 4260    amdgpu.ko.zst_T0-22
> > > 4308    amdgpu.ko.zst_T0-22-ultra
> > >
> > > $ time zstd -T0 -v amdgpu.ko
> > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > Note: 2 physical core(s) detected
> > > zstd: amdgpu.ko.zst already exists; overwrite (y/n) ? y
> > > amdgpu.ko            : 19.38%   (  28.6 MiB =3D>   5.54 MiB, amdgpu.k=
o.zst)
> > >
> > > real    0m2,496s
> > > user    0m0,448s
> > > sys     0m0,064s
> > >
> > > $ time zstd -T0 -19 -v amdgpu.ko
> > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > Note: 2 physical core(s) detected
> > > amdgpu.ko            : 14.56%   (  28.6 MiB =3D>   4.16 MiB, amdgpu.k=
o.zst)
> > >
> > > real    0m22,821s
> > > user    0m22,759s
> > > sys     0m0,080s
> > >
> > > My wish is to use the zstd-option "-T0" (see vmlinux.bin.zst) everywh=
ere.
> > >
> > > For CONFIG_MODULE_COMPRESS_ZSTD=3Dy: Add compress-level =3D -19
> > >
> > > NOTE: -22 w/ or w/o ultra has no big effect here and increases even
> > > more build-time.
> > >
> > > What do you think?
> > >
> > > Thanks.
> > >
> > > Best regards,
> > > -Sedat-
>
> [ Adding some more folks - kmod / authors of commit c3d7ef377eb2
> ("kbuild: add support for zstd compressed modules") ]
>
> Debian/unstable AMD54 ships kmod version 32+20240611-1.
>
> To use better/higher ZSTD compression-level for
> CONFIG_MODULE_COMPRESS_ZSTD=3Dy - do we need a newer KMOD version?
>
> DIFF for Linux-6.10.1:
>
> $ git diff scripts/Makefile.modinst
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 0afd75472679..2a8b37c80cbf 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -146,7 +146,7 @@ quiet_cmd_gzip =3D GZIP    $@
> quiet_cmd_xz =3D XZ      $@
>       cmd_xz =3D $(XZ) --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -f $<
> quiet_cmd_zstd =3D ZSTD    $@
> -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> +      cmd_zstd =3D $(ZSTD) -T0 -19 --rm -f -q $<
>
> $(dst)/%.ko.gz: $(dst)/%.ko FORCE
>        $(call cmd,gzip)
>

The compression tools (zstd, xz, etc) are used predominantly for two
separate topics - kernel image and kernel module compression.

Off the top of my head: in the former case, reasonable compression is
used by all tools. Be that zstd, lzo, lzma, you name it.
Honestly I don't know why and what's the merit behind the levels chosen.

In the modules case, things are also consistent where the default
compression level is used throughout.
Here it makes sense to keep the default since you can consider that
the decompression can be done by either kernel or user-space. Where
each comes with it's limitations:

The in-kernel one does not support ultra levels for zstd (or it used
to at some point) IIRC. The kmod tools themselves rely on the zstd
library liked in, although if one is using busybox then zstd
compressed modules were not supported last time I checked (a year or
so ago).

So for example: you can have zstd --22 modules, if the kernel + kmod
are new enough (have in-kernel decompression) things will fail. If
they're not, things will work just fine.

Which is why, I think it's up-to your distro/builder to choose the
policy. Here is what we've been using In Arch `ZSTD_CLEVEL=3D19 make ...
modules_install`.

Tl:Dr: You'd want to use `ZSTD_CLEVEL` (or equivalent if using xz)
during make modules_install **depending** on the components used and
their version.

HTH
Emil

