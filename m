Return-Path: <linux-kbuild+bounces-9683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 32029C709D5
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 19:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC766344674
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 18:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9890F341057;
	Wed, 19 Nov 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gbRIxQut"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC100366DC1
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576045; cv=none; b=XKE2IVMvD6bENWAepGZjm39Dqr0ToD7J8/YhLxbrf8xu2LtWDRnrhVtKk7XDe4aql1w2G9vOAeoW49aoP22pqqFxQRqudnMEUhlv/8OkdBf0njHC46/lBowNibuPoa27LiDPGGsjAbSioH4xuhWfN6uqqSfGOx+XEPENbZTmKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576045; c=relaxed/simple;
	bh=fq7yGHxuW0cDFvgb+sXTHDvNA06ZmRk29X+WraNFCws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hsLEM5gc1gEhDscdhoiKaUdcpwE8OTkXDJCHy4tD4+orP91p4EAJ4rMaO7c7x3MxBWIJco0DOktwZiSaH8VHYgeelQaABK4BF+HIRiVDT/YQ6bj4+Pi3vmNUUkJIo+dYa+Fwrdp1JxfOp59HUHJObwe/ku6acD67e04kqNR4Ktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gbRIxQut; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-433100c59dcso353055ab.0
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576037; x=1764180837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0H4D6A5/Fz6+ZVWISfjUYImiLMbW+d5U+Obqut6PQU=;
        b=gbRIxQutb+xPwnXKdAZIaE8HQcq9Ke++tLTZhGeffX2YEgUO3sTomk3Ayyo7wgblVq
         b7qkOXI7bY5yu7WrYnr+e55CutRWZvSPvseA5KP8mSaF+vxkjZYUXPVkeW0b9t2Yoru7
         12bixsqEeNPNHbEq9aNJt14fYjZMY0yH4k43o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576037; x=1764180837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0H4D6A5/Fz6+ZVWISfjUYImiLMbW+d5U+Obqut6PQU=;
        b=dL3TIS94egjEbf6247k+SyvN6TcDTFlLdu465GSKdG2k0VpKxMxCS9tWrmP5JX0bsx
         1Gj5d0fXY0Ljz32o9eUDZtitZkHYbw8djznKB12WVArGH4kOft5fPk/TAQ2VGVYOTjN9
         AUGdvKO9/pYQE2fyyL0sIfORGGAQIlAhicUxSQRLeYqtccfIKwFWZcWTV/SuKLXIkqo3
         yq2cWMp6OO/jAYWvUNHRYfdQ1qnCdxMduPIpqrYlspc9N3sh0XoD0djOQyZjYvvMUERf
         gQLILS6S4dJYxNDEBWVm3nwrLCKVKftQ/ygpu4sVSkba0yQElXLZpN1H1jR11j0DAk8s
         NTYg==
X-Forwarded-Encrypted: i=1; AJvYcCVnVEThC/9bcq3wS19gmitvkzq8+hQ2WEr4Wum5w/RFmFKAA0diFrpiyWZ3/aXOnqHOCXPouFiUiY4cQyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzeQov9zTk6U9VWYLv/w8t7YzJPhZCQOffjU103R9Af/wFbKZH
	NZaJjf65SAbt/hINOb+6FHHbPSFF9VAKT0B7Rwhz4uLPZ7ZwpVmVKyXHaGrBSKd2Bw==
X-Gm-Gg: ASbGncsinjRw4f2+ZBn+FT1vYWS1uysMC6RUPJZl9NRmaIYGIEHTXVC4BZJLoBUsJLg
	7g5+vVXzt9iJ/fR/P80qb4JovEeojMxW1CmwWL9KHFSTpwnaRKow9TCvsRWPmH5Y4VTRhDboBK7
	8ZxCUpMIRvMpEabMo5//zCFKV9LLP7IW+v7FZIVpJDU3bpwaFbjbeFQ9mg2682rJbPj557gx7MV
	mKKIQVkH5pOTIhm99ScFzAN9BNrwhuXz5SfuZomUsE3Lo/c1YbnKFX3U+9lmeQk9OYV/ij7Ld4B
	vdUnsP+qeOL1NpZC1VZJnyL7owC7W4cBHTGDrNQUMwX3Fw7zwOF4NX520H5ZZ7zBAPMSIi+k4qT
	hnJK7VzM9ewGsxq+4n51pbP37yTvPNXBhRemJP1x2XFLqBzPi50AkjBef3of2/WutQQYbTJovkU
	r64WXg
X-Google-Smtp-Source: AGHT+IE/2JEiabneT+vq3UyMtVUuWtIZXvc2b4MEv6Jrjx/DrjNxhr8iITGjEUqkm6x1qj9D1rKrZQ==
X-Received: by 2002:a05:6e02:3789:b0:433:29a9:32db with SMTP id e9e14a558f8ab-435a9073140mr4249655ab.24.1763576036980;
        Wed, 19 Nov 2025 10:13:56 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:13:56 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v6 0/8] scripts/make_fit: Support ramdisks and faster operations
Date: Wed, 19 Nov 2025 11:13:21 -0700
Message-ID: <20251119181333.991099-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series updates 'make image.fit' to support adding a ramdisk to the
FIT, either one provided as a parameter or one created from all the
kernel modules.

It also includes a few performance improvement, so that building a FIT
from ~450MB of kernel/module/devicetree files only takes a few seconds
on a modern machine.

Note: I included support for using the existing cpio script as suggested
by Ahmad, but a fallback remains in case that is not available.

https://lore.kernel.org/lkml/CAFLszThpTg-FBoNG_tQ0xve0LkYWER85EJeHuem-_JUD8J1Ocw@mail.gmail.com/

Changes in v6:
- Using the modules.order file instead of 'find'
- Use gen_initramfs.sh where available
- Mention that FIT_MODULES just needs to be non-empty
- Make use of modules.order instead of using 'find'

Changes in v5:
- Fix 'use' typo
- Add a new patch to split out module targets into a variable
- Build modules automatically if needed (fix from Nicolas Schier)

Changes in v4:
- Update the commit message
- Provide the list of modules from the Makefile
- Reduce verbosity (don't print every module filename)
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

Changes in v3:
- Move the ramdisk chunk into the correct patch
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message
- Add a way to add built modules into the FIT

Changes in v2:
- Don't compress the ramdisk as it is already compressed

Simon Glass (8):
  scripts/make_fit: Speed up operation
  scripts/make_fit: Support an initial ramdisk
  scripts/make_fit: Move dtb processing into a function
  scripts/make_fit: Provide a way to add built modules
  kbuild: Split out module targets into a variable
  kbuild: Allow adding modules into the FIT ramdisk
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 Makefile             |   8 +-
 arch/arm64/Makefile  |   1 +
 scripts/Makefile.lib |   6 +-
 scripts/make_fit.py  | 293 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 269 insertions(+), 39 deletions(-)

-- 
2.43.0

base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
branch: fita6

