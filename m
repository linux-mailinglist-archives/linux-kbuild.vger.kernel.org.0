Return-Path: <linux-kbuild+bounces-2666-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACC893C941
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 22:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077A91F21647
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 20:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44702BAEE;
	Thu, 25 Jul 2024 20:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gL0QMpYu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D311711
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 20:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721937634; cv=none; b=lHJNCHr1Lk9obndzTK0PJ5xmDSS83i0OwvVSksQx6pOJn0e3A7J8YJqJ8Yr1vQo6kmgqXRcIe0uPM3G2cPQlG82UWzohRTrCBUugPBbFfHHryHHIk16RC9bHYKQ+7PfQ92ZqXr8CfmZ6duA7NjgYoicOEdYi3WtH1iQD4dsATCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721937634; c=relaxed/simple;
	bh=77SSXUP7TZW/vFun8bkkzON9mVJac489nHTzBztzwCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4awoczA4MuHznVcKRFJPoA/3jYC6rtlMVXzLe5kajzWlDK3RlUffDvP1093rOkXkAsO44lzPf4SlRjk3CobWFTp+oX0brn9jgMOt3pI0/2xeBHwUS4A2aqVehknq75d/O3v9arBi1TkTw4T+TxEsjkza+Tf45ycXQLJar7bIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gL0QMpYu; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52fcc56c882so476978e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 13:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721937631; x=1722542431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xtF3ycvAp+AuLgjPtxp4ZGNiiofFGgaAqsnd887nzSE=;
        b=gL0QMpYuVOdF5CJDgKSYKzUl9R9jn/gIahJlgGNnp8WJG9RenU/7vha1R7pxyRcgmd
         rAdsPL/wL2bjKoSAfnIdhlSmFEcPGWsz3UgGm9ASfgfQVsbe0fH68StgPYEH751CEhqb
         gwqs7BlnYOppb/oyKsGNET5A8mOStStBskRknr43NDY0aANFxzvrN6hu7ERKNbIxeWg9
         xeDQzQHV4nXiHPu0fuyhTxtG52LSSylf2A8KKsUpn5VkSfbkkPKMd8MP3fsxfm9ty/14
         /eRLFSeaeLDSxeM49SCT4W/m1Cp+bxmLCV3TpYjLsNoARLcBrUTkniy8lDZmvPuKIgJV
         nQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721937631; x=1722542431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtF3ycvAp+AuLgjPtxp4ZGNiiofFGgaAqsnd887nzSE=;
        b=LUvzWQDcJhg6jeAq5URg1Wkf9ul0uGQ3yQaHX1SH65XCEkCp/YRN0ZcXTNJ4M9pIrx
         6rMn+S0Goy1Wa7pyLezwg50ynq7wngGK8WOmevGqM/1DAZZG8qe09EvO8zdmMMPXHD96
         RQ8YgzJCp1LeVTfgeDQWtGHirl6O5BKZ/6aq8bPo9If9PCXy0NhtowjK4BAjo2zSc3YQ
         7xQWhQOkLRufEYMeprqp/qhBQtIAsWIVQr8RIRSWTvcdgfNRZ0gz2C8wMBO8l2VBQpPp
         pyh6mDoDgoLNlUmlDT0SodJM3R6TdXkuIkcYQ5ISw6NNisMop6itZSukC6w/KELaqaG8
         JHtA==
X-Gm-Message-State: AOJu0YxNQOi5AnHUpukK5CBJPY1CGkF6B0NU+xQcist40hrtkQNsbnyU
	rwf5g6Rc4E1EcO+aEexul31a5UxMhrCWpPWGa6A+Ci14J6Ahd7QoFxMqxsYbk30lVQMJ5DdHkFT
	HXaZ8Br5ntmazKhA582IMfFrANWE=
X-Google-Smtp-Source: AGHT+IGLs4g+D50sLKqdKcV91MJrXEZqbm/c24iQ5JNcI6JM+5f7Tg8g8Hm9J7Tki9h3JTnrCLoyY9xAnI5n2uz+KhQ=
X-Received: by 2002:a05:6512:3da6:b0:52e:8161:4ce6 with SMTP id
 2adb3069b0e04-52fd423c10fmr1271979e87.25.1721937631100; Thu, 25 Jul 2024
 13:00:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
 <CA+icZUX-vannYgAHt3O00kwWXLX_cFpr6JJadX==bpZcUzh_7w@mail.gmail.com>
In-Reply-To: <CA+icZUX-vannYgAHt3O00kwWXLX_cFpr6JJadX==bpZcUzh_7w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 25 Jul 2024 21:59:53 +0200
Message-ID: <CA+icZUU-ktXDwQPA9cbXPM_A9pKoOzUCJ821Z2U1vzFkujMErA@mail.gmail.com>
Subject: Re: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Piotr Gorski <lucjan.lucjanov@gmail.com>, 
	Oleksandr Natalenko <oleksandr@natalenko.name>, q66 <q66@chimera-linux.org>, 
	Emil Velikov <emil.l.velikov@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Torge Matthies <openglfreak@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 9:23=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> dileks@iniza:~/src/linux/git$ git grep zstd scripts/ | egrep '\-(19|22|T0=
)'
> scripts/Makefile.lib:      cmd_zstd =3D cat $(real-prereqs) | $(ZSTD) -19=
 > $@
> scripts/Makefile.lib:      cmd_zstd22 =3D cat $(real-prereqs) | $(ZSTD)
> -22 --ultra > $@
> scripts/Makefile.lib:      cmd_zstd22_with_size =3D { cat
> $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
> scripts/Makefile.modinst:      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
>
> -sed@-
>
> On Thu, Jul 25, 2024 at 9:09=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.co=
m> wrote:
> >
> > Hi,
> >
> > I am a big fan of ZSTD - here version 1.5.6 on Debian/unstable AMD64.
> >
> > When playing with CONFIG_MODULE_COMPRESS_ZSTD=3Dy I observed a 35MiB
> > greater linux-image Debian file.
> >
> > Debian: ~100MiB <--- CONFIG_MODULE_COMPRESS_XZ=3Dy
> > Selfmade: ~135MiB <--- CONFIG_MODULE_COMPRESS_ZSTD=3Dy
> >
> > So, I checked the used compression-level of ZSTD in the build-process:
> >
> > [ vmlinux.bin.zst ]
> > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep vmlinux.bi=
n.zst
> >  { cat arch/x86/boot/compressed/vmlinux.bin
> > arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; printf
> > \370\040\157\003; } > arch/x86/boot/compressed/vmlinux.
> > bin.zst
> >
> > [ amdgpu.ko.zst ]
> > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep '\-T0' |
> > grep amdgpu
> >  zstd -T0 --rm -f -q
> > debian/linux-image-6.10.1-1-amd64-clang18-kcfi/lib/modules/6.10.1-1-amd=
64-clang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> >
> > Here some numbers:
> >
> > [ Values in KiB ]
> > $ du -k amdgpu.ko*
> > 29264   amdgpu.ko
> > 5672    amdgpu.ko.zst <--- XXX: -T0
> > 4264    amdgpu.ko.zst_T0-19 <--- XXX:  -T0 -19
> > 4260    amdgpu.ko.zst_T0-22
> > 4308    amdgpu.ko.zst_T0-22-ultra
> >
> > $ time zstd -T0 -v amdgpu.ko
> > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > Note: 2 physical core(s) detected
> > zstd: amdgpu.ko.zst already exists; overwrite (y/n) ? y
> > amdgpu.ko            : 19.38%   (  28.6 MiB =3D>   5.54 MiB, amdgpu.ko.=
zst)
> >
> > real    0m2,496s
> > user    0m0,448s
> > sys     0m0,064s
> >
> > $ time zstd -T0 -19 -v amdgpu.ko
> > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > Note: 2 physical core(s) detected
> > amdgpu.ko            : 14.56%   (  28.6 MiB =3D>   4.16 MiB, amdgpu.ko.=
zst)
> >
> > real    0m22,821s
> > user    0m22,759s
> > sys     0m0,080s
> >
> > My wish is to use the zstd-option "-T0" (see vmlinux.bin.zst) everywher=
e.
> >
> > For CONFIG_MODULE_COMPRESS_ZSTD=3Dy: Add compress-level =3D -19
> >
> > NOTE: -22 w/ or w/o ultra has no big effect here and increases even
> > more build-time.
> >
> > What do you think?
> >
> > Thanks.
> >
> > Best regards,
> > -Sedat-

[ Adding some more folks - kmod / authors of commit c3d7ef377eb2
("kbuild: add support for zstd compressed modules") ]

Debian/unstable AMD54 ships kmod version 32+20240611-1.

To use better/higher ZSTD compression-level for
CONFIG_MODULE_COMPRESS_ZSTD=3Dy - do we need a newer KMOD version?

DIFF for Linux-6.10.1:

$ git diff scripts/Makefile.modinst
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0afd75472679..2a8b37c80cbf 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -146,7 +146,7 @@ quiet_cmd_gzip =3D GZIP    $@
quiet_cmd_xz =3D XZ      $@
      cmd_xz =3D $(XZ) --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -f $<
quiet_cmd_zstd =3D ZSTD    $@
-      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
+      cmd_zstd =3D $(ZSTD) -T0 -19 --rm -f -q $<

$(dst)/%.ko.gz: $(dst)/%.ko FORCE
       $(call cmd,gzip)

Thanks.

BR,
-sed@-

