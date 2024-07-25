Return-Path: <linux-kbuild+bounces-2662-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD90C93C8A9
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 21:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88982282D5C
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 19:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF621C6BE;
	Thu, 25 Jul 2024 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL3KYQYo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB8B55884
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 19:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721935432; cv=none; b=NtlxriHiuj06NEw/ubqykDdvduyk0QS+Sle99AjzlSuwgqAZXjV7mErfNfRfz3o0EhAtq8ZAHRjFNrjfGN3PloryyUMjoYjqEIhJ6cO6cIO+M/P6R5lr9EMD5g/Ma1Wt3IwUbMJAfMkW5pJgcri7mGi/NQIyGI+zlmLxq+xWniE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721935432; c=relaxed/simple;
	bh=5b3Y2wACdqHuVNlVtkmDMdcSLeZ4K915NLd9E6Wt9bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVxjreWCO/gECxBMzImk9AIN9JOLOuOOU+FnCY3tW9/UZH+UrDcgNxDWpIiRMRTDiVhbiWKKO5zoFy6W+MQPA8gNXefPtc7xz3Q70cPzzpPWHWOiGtViZuF5maMOHi5SwNIY09+35ut4P34fRCADdoV2mup2TttlW81aiLw3rVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL3KYQYo; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f00ad303aso824241e87.2
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 12:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721935429; x=1722540229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CmLaMfv6A30ZgKL4O6laLUnqkMf5e4uGRIOlXP5gaVg=;
        b=aL3KYQYohPJ/ayTrO09FaG/T0g4l+/0qN+/XBa9iTacfAl0ydlkbKrcIUUHdjyElGb
         6g4+drZe+Jufw12SI0QhgRmVElcZ1uJcSu2irDCc5cpAHpmSuZLPhlQFn3/TASB0mQqM
         dhm7DynfyWx1Xw+uaBEbU1DHy2g5Qd3CcN+a1xWpKFwrSGi10VOJ9SDr2TMtaCPryGg/
         G/75SXnZfB+04j4X3ZKPixDBvY8+zTYimRexNVuhTut7alaCSvRS26bxu8hcx9lvcsYq
         GG6P1C0evD5p2Wkv4E50lEOzXKHTKieFCW1yfn5uh7ncR7/QW6HfnY1FH/MDPr/uY4RR
         wnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721935429; x=1722540229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmLaMfv6A30ZgKL4O6laLUnqkMf5e4uGRIOlXP5gaVg=;
        b=MP84+3J+ssod71d4JkwJFo8BUCajgzKpqSaAvU73zimeyWv+mINtmw13578FIyQBFM
         ql3PKyk2I3RJe58l9batdul3khRI7TIYuJ/IaBvJcXFHLB8eaxzxllARj4hClV5/cMJh
         3nNwooHF01+cUXT/+aTPwEtEICPmu8Pkt85lssd2+BH/Zm7FBFtbK3T/sq3bGeL3nGJP
         a5MO04j/0UrbsfHF+D5RumkUI/c2injbouO4WOsE5s5Rh32GmiIRCADuVUVFSWayYoEd
         UNWlenzzBPdqEX3VeZ6p+4u4KANCBpl+YyRMiFeDM7eeqMSLZ637KYu1lhOAp5+7khro
         QyPQ==
X-Gm-Message-State: AOJu0YwlI/JECfUoc8K7Sjv8A9hZF72CS48ek4v0wfDZSwiumyKOGghs
	UBBrhhbVoAROnzTuDzE4xRg/v2Xh089bVuFpDcFbvCDwT1sHxFPbatKTizEThozKgQm4gCQw7Jg
	Vy+hpDK2q6O5ElFdIfbKI3yrmYDjaqnVO++U=
X-Google-Smtp-Source: AGHT+IGtMbUI4+lW+Wj/4nRClEEmTUIASxrvXS2U/AjObWKWQilQyq1CAI/U1yLLV7O6waGGheMRrshG/PlWDUQe+xk=
X-Received: by 2002:ac2:4e08:0:b0:52e:9b92:4990 with SMTP id
 2adb3069b0e04-52fd3f1de1cmr2852465e87.32.1721935428513; Thu, 25 Jul 2024
 12:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
In-Reply-To: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 25 Jul 2024 21:23:10 +0200
Message-ID: <CA+icZUX-vannYgAHt3O00kwWXLX_cFpr6JJadX==bpZcUzh_7w@mail.gmail.com>
Subject: Re: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dileks@iniza:~/src/linux/git$ git grep zstd scripts/ | egrep '\-(19|22|T0)'
scripts/Makefile.lib:      cmd_zstd =3D cat $(real-prereqs) | $(ZSTD) -19 >=
 $@
scripts/Makefile.lib:      cmd_zstd22 =3D cat $(real-prereqs) | $(ZSTD)
-22 --ultra > $@
scripts/Makefile.lib:      cmd_zstd22_with_size =3D { cat
$(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
scripts/Makefile.modinst:      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<

-sed@-

On Thu, Jul 25, 2024 at 9:09=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Hi,
>
> I am a big fan of ZSTD - here version 1.5.6 on Debian/unstable AMD64.
>
> When playing with CONFIG_MODULE_COMPRESS_ZSTD=3Dy I observed a 35MiB
> greater linux-image Debian file.
>
> Debian: ~100MiB <--- CONFIG_MODULE_COMPRESS_XZ=3Dy
> Selfmade: ~135MiB <--- CONFIG_MODULE_COMPRESS_ZSTD=3Dy
>
> So, I checked the used compression-level of ZSTD in the build-process:
>
> [ vmlinux.bin.zst ]
> $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep vmlinux.bin.=
zst
>  { cat arch/x86/boot/compressed/vmlinux.bin
> arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; printf
> \370\040\157\003; } > arch/x86/boot/compressed/vmlinux.
> bin.zst
>
> [ amdgpu.ko.zst ]
> $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep '\-T0' |
> grep amdgpu
>  zstd -T0 --rm -f -q
> debian/linux-image-6.10.1-1-amd64-clang18-kcfi/lib/modules/6.10.1-1-amd64=
-clang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
>
> Here some numbers:
>
> [ Values in KiB ]
> $ du -k amdgpu.ko*
> 29264   amdgpu.ko
> 5672    amdgpu.ko.zst <--- XXX: -T0
> 4264    amdgpu.ko.zst_T0-19 <--- XXX:  -T0 -19
> 4260    amdgpu.ko.zst_T0-22
> 4308    amdgpu.ko.zst_T0-22-ultra
>
> $ time zstd -T0 -v amdgpu.ko
> *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> Note: 2 physical core(s) detected
> zstd: amdgpu.ko.zst already exists; overwrite (y/n) ? y
> amdgpu.ko            : 19.38%   (  28.6 MiB =3D>   5.54 MiB, amdgpu.ko.zs=
t)
>
> real    0m2,496s
> user    0m0,448s
> sys     0m0,064s
>
> $ time zstd -T0 -19 -v amdgpu.ko
> *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> Note: 2 physical core(s) detected
> amdgpu.ko            : 14.56%   (  28.6 MiB =3D>   4.16 MiB, amdgpu.ko.zs=
t)
>
> real    0m22,821s
> user    0m22,759s
> sys     0m0,080s
>
> My wish is to use the zstd-option "-T0" (see vmlinux.bin.zst) everywhere.
>
> For CONFIG_MODULE_COMPRESS_ZSTD=3Dy: Add compress-level =3D -19
>
> NOTE: -22 w/ or w/o ultra has no big effect here and increases even
> more build-time.
>
> What do you think?
>
> Thanks.
>
> Best regards,
> -Sedat-

