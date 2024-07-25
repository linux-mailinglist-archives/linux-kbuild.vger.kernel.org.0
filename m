Return-Path: <linux-kbuild+bounces-2660-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 574F093C89B
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 21:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 037DF1F229F2
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 19:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5A76FB8;
	Thu, 25 Jul 2024 19:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSF5qTU1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECDE3BBC2
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721934605; cv=none; b=sFraG4XIWiOTlIwPs8ngCK3l5oxc6ve6ulpjyBoAzkXWQFdmzIe6U5Is1Eefaz0Z9ilHBXLRFB+qNzfrXQtWpfxPiIg6zAPeZBvtxEGR1JBpJOVLAOQyH1yuE8F03i2X7Mk4CuKazOsX24pr395oS6lDMZ3gXLsRUna/h25Wt+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721934605; c=relaxed/simple;
	bh=5L8XWeic6EAUAZVGxqaDAGTOIBTwXL0a0VNWMLRpJzs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FmIfBnxxCGTbaGJloXSCYxrn84/TdZt3lqlIe5b7KNcbCBlQJcRj/oGhLgU9q1bYVFgvoG/bvO6EeZWL0hbWuw01Di7nTFgt5GP7eIunts774xjEeXXUTwW9FHuUmmV4uxtoSoPNBDz+uWYNa55ET4IfSkqi+/QScD5Tbwscv3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSF5qTU1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ed741fe46so636946e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 12:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721934602; x=1722539402; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyqaVwrcxe1M52Erb8Q0jkwz8/0tCTUh4ju3lpS/QdQ=;
        b=jSF5qTU1iqXuAjjNmBm4r0cLH0r+f5a49oNPpqIhA4tBXA+LCiZHCODVn+trrYYsDB
         +LA4B4IS8bzhqJCwhXiNG/fHY6rRqax1akMmSicix0EkjaZlvHOzRtQHHIs8cclwcI/Q
         I2mZEMDiKbb9EPt6JzOr2+MKS4SB8YG3Y56efTSi20WVnM5LY4jq1rakR9IPhgiCWEeQ
         SzMoyiZS8CK9mrLXyMRR0irneVr/TQVYizJKu5guq5Nl3WoJ1Fwig+Crx/YJyq3fNTyk
         yKI5FG3B6hOaTwxL7j0Bwc7LexvuGZeuJvPFKNfMfgFGnyjid+vrY0i3JfupS0y4cN17
         xEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721934602; x=1722539402;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyqaVwrcxe1M52Erb8Q0jkwz8/0tCTUh4ju3lpS/QdQ=;
        b=b/qndOTqHhvbt/H5xb8PNX/J+NniLjCg7n5G1tDNMLiMUnF0giYLunWOxTMon4yerV
         OHBU9YzOSM/IMs+MwufdWi9uHbjRKQMzhPMyI9GmEAte/XifVJ8T+Buyj9z7XKYuGwAI
         3duBOy0mG4F2vZaVqhqeZq6tPzTPxG5oeIh0Iuj0kFh/bNFjEmVz2Vkrioc88yHmBOqX
         Fa/4fbSsslPOA3q8KoLAo0x/TIn+oqrt+sc7GCquAwAFX+dakSQIKUPrC7ZS+R4qe6+7
         EEowizLYHviDILgCMPv+lHuv2HjOPhOgIS6yA4RsUnesifME5+GOu9PqSXgdfvnIc1hB
         rzEA==
X-Gm-Message-State: AOJu0YyCXjTT/YyrlgLH1aK6eqW+NmoSHUt/91n3uaXie0ZaeGYjqbne
	P1zowsMm7ZO7A6xj3SrSsFx0It3wM4aHVabd8alMTH9qKTWBOvi+4CYf2jXte8JNWc4PQiv0cTF
	HvbAQ1tQ+CKH8dnryFq4jd8JAjjmZEdI6iH8=
X-Google-Smtp-Source: AGHT+IGFz24Lfb6689HF5Y2yAEBeBmzdwLyDAcXrPVOYiqXusYNyWJABmJ/clr4MjgGuVfQGMCD+O10j1SIjD/9RlB0=
X-Received: by 2002:a05:6512:114d:b0:52f:d15f:d46b with SMTP id
 2adb3069b0e04-52fd6029cecmr1795709e87.14.1721934601373; Thu, 25 Jul 2024
 12:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 25 Jul 2024 21:09:24 +0200
Message-ID: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
Subject: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"

Hi,

I am a big fan of ZSTD - here version 1.5.6 on Debian/unstable AMD64.

When playing with CONFIG_MODULE_COMPRESS_ZSTD=y I observed a 35MiB
greater linux-image Debian file.

Debian: ~100MiB <--- CONFIG_MODULE_COMPRESS_XZ=y
Selfmade: ~135MiB <--- CONFIG_MODULE_COMPRESS_ZSTD=y

So, I checked the used compression-level of ZSTD in the build-process:

[ vmlinux.bin.zst ]
$ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep vmlinux.bin.zst
 { cat arch/x86/boot/compressed/vmlinux.bin
arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; printf
\370\040\157\003; } > arch/x86/boot/compressed/vmlinux.
bin.zst

[ amdgpu.ko.zst ]
$ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep '\-T0' |
grep amdgpu
 zstd -T0 --rm -f -q
debian/linux-image-6.10.1-1-amd64-clang18-kcfi/lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko

Here some numbers:

[ Values in KiB ]
$ du -k amdgpu.ko*
29264   amdgpu.ko
5672    amdgpu.ko.zst <--- XXX: -T0
4264    amdgpu.ko.zst_T0-19 <--- XXX:  -T0 -19
4260    amdgpu.ko.zst_T0-22
4308    amdgpu.ko.zst_T0-22-ultra

$ time zstd -T0 -v amdgpu.ko
*** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
Note: 2 physical core(s) detected
zstd: amdgpu.ko.zst already exists; overwrite (y/n) ? y
amdgpu.ko            : 19.38%   (  28.6 MiB =>   5.54 MiB, amdgpu.ko.zst)

real    0m2,496s
user    0m0,448s
sys     0m0,064s

$ time zstd -T0 -19 -v amdgpu.ko
*** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
Note: 2 physical core(s) detected
amdgpu.ko            : 14.56%   (  28.6 MiB =>   4.16 MiB, amdgpu.ko.zst)

real    0m22,821s
user    0m22,759s
sys     0m0,080s

My wish is to use the zstd-option "-T0" (see vmlinux.bin.zst) everywhere.

For CONFIG_MODULE_COMPRESS_ZSTD=y: Add compress-level = -19

NOTE: -22 w/ or w/o ultra has no big effect here and increases even
more build-time.

What do you think?

Thanks.

Best regards,
-Sedat-

