Return-Path: <linux-kbuild+bounces-4785-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0479D549F
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 22:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F192282545
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244C61CB50C;
	Thu, 21 Nov 2024 21:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaVXi5v0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323684502F;
	Thu, 21 Nov 2024 21:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732224003; cv=none; b=QMwUCUB4MUIV02h9YmdFNZXEjGoWZm90ZF+jJI856ScjQ3fmaYNHxKWUwIVApBlwAxFOJbg3rJ/wPeQVYuuU3MTI1nQNggMst6uCog3T9IbKQv1R1mx98TTeJCE2RunsMkowekv3Jisyh6PuYULWKCOX8tO3C0QLRIrobuhsVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732224003; c=relaxed/simple;
	bh=IZxeSj3DH9D4QFgOVdPCe7k3HBOTZSxL4HiD7PDE4bg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=bCER9n04nu2k10XjOum/g7tOtmYmw8HOiGEk+EvaxTLGZqTJWO57bvWEwXWtR96L7DIlgLY7y7SAaYKKx+8EuUwsBifop28D6OSv5zF/PrgfWHfehPh2IVbOV69ETWz7ryTcKTnziG03daWpf64/1DTt87gJLBDXr0+hacOSSY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaVXi5v0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a99f646ff1bso212277466b.2;
        Thu, 21 Nov 2024 13:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732223999; x=1732828799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5mVwL/gxcL6T7A/AL0caz7nykYr0i5AQPoZcXGEz/0=;
        b=AaVXi5v0mabo9uTBhRwqMGGVGnkxNO7jKPbSlJ6WdF3JMk4uFddFjmXMbx0tuKeKc1
         htK2tPM2t0ct5BAxCsHY/muHntnTakxRdbFDwv/SpnaqB1dDi6XmUoSWgWAo1+yhp9tu
         iVSblNVrssx+jw25fe5APllpmjD0ktaS6/ZN+RscwIa+b0RDzNExnvg3mfe/qCd5Yb2s
         4ovtNMITiUs6oKWSj+spKGrwHBSGARYf8BPM/hH5QGjuWDajIPC7d6KThBztGGNdnjM2
         Kt5UGFCy7J1hz6LoYkqz4V7IJgOp9i21UP3pbWxgLVtDys2I7iCG4SjqR5JZ3X31GYUD
         9iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732223999; x=1732828799;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+5mVwL/gxcL6T7A/AL0caz7nykYr0i5AQPoZcXGEz/0=;
        b=iO/YXEoKxD/t02m5/O42ftdQfiIeEiy7ft9+FrDg7Q0Q0icxx367XuczXUYHCiaT4M
         ufpjNsdT6/gD2dzS2mihqwUGyomtmMrODumfi3UPShEGEvTLM5XIzK3w0ad04OOdsrwT
         xpbZD05MiOMQ5Q2lCIe8vT4Mqv8zOz1xKm9mK2+qKZyI3w2yIyAjnWrOQWune7S//9r3
         VjM5hXwEGv7bjSvAtsogJ6MQTZdl/un0l2DE9W1MSflgpDoCsB18QVKv4rWGAxxMlabA
         aVCBv/yhJzovTFnAlGmJ/0o/02kbf9oVNsa3txYbmNW23iD5srOFeZs9aps1+n3qbF4+
         Y7jA==
X-Forwarded-Encrypted: i=1; AJvYcCXbKFOOCZN1uxxS4Q/HQkqKZGVciTN8wRb/UgWfDd396HaBDFWlrimZHp6ns3Y4X+y3MbbSHL73LLKLRxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoaATQwJxozITH3SQClDpkiRsAvGERiA2q+15E4hiZzsS2viwP
	CtUlhEwbEdpb1d4InDgm6MLRvBQ8s4QcuQKinEddsy3YPxKg5pgbJXLnAg==
X-Gm-Gg: ASbGncut5skYK8jFsaxeyKtJb8bhqTKLhNCYqhHG6RP0MwQcG6l2YsZLR/C528u1Nf/
	OBU+VMkPNWLyc3rgaZRFW/+hIiZqjnVVR1o7ivrzDJ2C8RgHSLpPizGWTWh6hwkdqegxckGDW9G
	9t3cPwRnVhCYRhMZ8oJuBNP8okAVqww3SKk2b4gg+cFVAcXKHJ8lLRM3d3HCO12+Jc2I9S4rrYu
	FRmFGmj5FL9KLn29I5itsEszV2+eSiBfIukJlogZwXn0dpWOIUW+dyi7G6ByNNhUcSQqUOx
X-Google-Smtp-Source: AGHT+IEgJCmbBuQqoybt7KwE0w4X0L72atjpXIF7Z7ccrhIhMaRCKipXQU1YUH2jkLaRC8w+NGL2Cw==
X-Received: by 2002:a17:907:cb26:b0:a9e:b0a3:db75 with SMTP id a640c23a62f3a-aa509b551a0mr42773066b.35.1732223998775;
        Thu, 21 Nov 2024 13:19:58 -0800 (PST)
Received: from [192.168.178.20] (dh207-40-8.xnet.hr. [88.207.40.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57d4d5sm14881366b.163.2024.11.21.13.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 13:19:58 -0800 (PST)
Message-ID: <f96d57c9-efda-4781-a395-a7c5fec7f2ad@gmail.com>
Date: Thu, 21 Nov 2024 22:18:58 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Build System <linux-kbuild@vger.kernel.org>
From: Mirsad Todorovac <mtodorovac69@gmail.com>
Subject: [PROBLEM] make bindeb-pkg: When just one source line in a single
 driver is changed, all driver are rebuilt?
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I am perplexed now at 6.12 stable vanilla tree, and I've noticed that after changing just one
line in ./drivers/gpu/drm/xe/tests/xe_migrate.c:226:5-11, all unrelated drivers are being BTF'd, SIGNED,
and INSTALL-ed:

  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aht10.ko
  INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
  STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
  INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/adt7475.ko
  STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/as370-hwmon.ko
  STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aquacomputer_d5next.ko
  STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/applesmc.ko
  INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
  STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asus_rog_ryujin.ko
  INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asc7621.ko
  INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
  STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
  INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9055-hwmon.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
  STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
  STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
  INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/dell-smm-hwmon.ko

Is there an option to rebuild just the necessary driver that was modified?

2.

From the list of files that were compiled, it seems that drivers/gpu/drm/xe/tests/xe_migrate.c was
not rebult:

$ grep CC ../err-6.12.0-tiny-pt-02b.log
  CC      init/version.o
  CC      init/version-timestamp.o
  CC      arch/x86/boot/version.o
  CC      arch/x86/boot/compressed/kaslr.o
  CC      arch/x86/boot/compressed/misc.o
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/kallsyms
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/sorttable
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/asn1_compiler
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/genksyms.o
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/selinux/genheaders/genheaders
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/selinux/mdp/mdp
  YACC    debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/parse.tab.[ch]
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/sign-file
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/insert-sys-cert
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/parse.tab.o
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/lex.lex.o
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/modpost.o
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/file2alias.o
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/sumversion.o
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/symsearch.o
  HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/basic/fixdep

But they were only BTF + INSTALL + STRIP + SIGN'ed:

$ grep drivers/gpu/drm/xe/ ../err-6.12.0-tiny-pt-02b.log
  BTF [M] drivers/gpu/drm/xe/xe.ko
  INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/gpu/drm/xe/xe.ko
  STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/gpu/drm/xe/xe.ko
  SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/gpu/drm/xe/xe.ko

Nothing suggests that "drivers/gpu/drm/xe/tests/xe_migrate.c" is being recompiled, though it was modified,
or at least "touch"-ed.

Is this the expected behaviour?

(I have deliberately skipped "make clean", to see if I can save some building time and grid power.)

Thank you very much.

Best regards,
Mirsad Todorovac


