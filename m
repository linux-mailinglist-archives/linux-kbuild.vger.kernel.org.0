Return-Path: <linux-kbuild+bounces-9018-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FEBBFBC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 01:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75E4F4E577C
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 23:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782F41CEAB2;
	Mon,  6 Oct 2025 23:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mlcXeyhK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D608113AC1
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Oct 2025 23:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759791749; cv=none; b=RGVEe3KpKng5f5SPgLOrLzx4aVjzFyrKoODY9vTOS4hOO6tHCTzBtgFED54/YGc2EH7IoO/IwlbROSMA6x9iBqACfsz1U55ddpR7btYIi/7TuA4C3P8bwd2NfsYRaU1dU8eeIO/+sAxxJBxjaAp5pJdSTQ7p9PzD1uiXTuuYH6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759791749; c=relaxed/simple;
	bh=1yVzmTVpaOFv/M+XS6u1tP5/jEOlFcdq7mYw0JifY9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FRu7mNDlVdEa1AQC5ksS6gCyM+SUyUTT3hqKxuPmS5UovZs0e1JO0ExHQu0QXl94pZl63qyQKa/76pCo5J9QzCF+PPHja+6h+qDkl+L+67yFftBefj4bHwphVXJ5MG3dkt4V+uwkanMqMxfGvChuRWj4pSlv2/4Fs3igwQdcL8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mlcXeyhK; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-93b9022d037so217555439f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791747; x=1760396547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPUqxHqoYN9o/nXYPPPYebq9RP8korJ6LZObH1VKs1Y=;
        b=mlcXeyhK6ezWt7oXhZxm3Iv/pE3IaODwEYTgPu/KDNTC3TiTm9bT2oYbDx4B1wtx8B
         rBJAyKhUGMPvHgFySJQeZsF1+04GlougFA/HPKwAnO7Narb38950CDGve1ltzMSWKwv1
         mIM5QIga0tLnjNxFTSGzJkMWsFzCVkh/NS6EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791747; x=1760396547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPUqxHqoYN9o/nXYPPPYebq9RP8korJ6LZObH1VKs1Y=;
        b=sqKLeisS7rCT57RhU08nB28CP+avpgeJcRTzAs/7+LBU59CPItnueUgIqZFhifTAyk
         Tgn2FaFTFWZMyALjjd/5crxNAtc0BZVjMod5XpLND6ZmMQSIMfCvYjEkU5rtzyLz/K/n
         gDuGSk41kbpYG9jbaWcyBzysvgGYsPtdBS70kkJpRz8SZlgzlTQnSf+2Ds3MbvdWXjW8
         qmu1pNSc7aWvUDxHhjual/4cBPdDrmtmHAJKwy5Vct1+1OVDxNbaCRDxhOHe0vtsxVRW
         +IEjoGK2Zua8+UMbe7UVKZhD6q8QNBkGgrPkZ/wznJ4NrlxQpHb+GMvOmwubwtjJzIZi
         AqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW03VhmfNJjQbgYjaluzAldveaQxzpMMu6B4wC4Kp1Ay4nqjW3Ddu90WSKZRcYCu7kjtwwW6RDv5yiHDzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbc+UNXl86wB59K/UNrUwuNhgWDnZQsW/A5ztxVf3Atn5fJtbn
	BYWFwAl0SezW/g6k7BUj+VzRmQzH87X6ZcD4kOAd8mfSX8NlLTGhL7c7YfHuSKn1yA==
X-Gm-Gg: ASbGncsQl/SFrKuQGD9GawlzVI7493ugf9CxuvvWIKffXupRRvo8tl9bImePwQjkGoM
	rQuQXdrrybTYe16HsD4pkpTlpXY99iH3HnJv8OAj7K4JGmb6pCEQ/ZSb/Mj55DmzKHLee51VGVs
	Rf1UIIKCERg3w3zHyK4uCEmozc5cT6G5sEXUZTKo42H72lKOLvnxhMmg6TPgy+L7LcWAMZxMLyg
	oatqaYSrA6+9eOjnnqO/iFFcJIycD1TNjzjQTFLlyXCLurtIUGY7fWPawiBt+X0nls5fM9UsDOU
	Lk7KEiOEY+iuuC77p1y3BUqWNTDzeF3jdKzl7K8PwCs/GZHsDJ3tIae5uA/m9BlVkh3Ewy1L+yU
	U/IA4h5W14odI87j4cye9ysxdyDlETMelUuP7phEHHEusGsjnkwko+g==
X-Google-Smtp-Source: AGHT+IE7/YGoPn47lQ3d5uWVlrWlTdbeR9OUwTMznvi5Kz+D26CuC+sguo/JsRy3VZbgrzZGikj0VQ==
X-Received: by 2002:a05:6602:1405:b0:887:574d:dfbb with SMTP id ca18e2360f4ac-93b96a5a9c7mr1831470639f.11.1759791746857;
        Mon, 06 Oct 2025 16:02:26 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:25 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] scripts/make_fit: Support ramdisks and faster operations
Date: Mon,  6 Oct 2025 17:01:51 -0600
Message-ID: <20251006230205.521341-1-sjg@chromium.org>
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

Changes in v4:
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
- Update the commit message
- Add a way to add built modules into the FIT

Changes in v2:
- Don't compress the ramdisk as it is already compressed

Simon Glass (7):
  scripts/make_fit: Speed up operation
  scripts/make_fit: Support an initial ramdisk
  scripts/make_fit: Move dtb processing into a function
  scripts/make_fit: Provide a way to add built modules
  kbuild: Allow adding modules into the FIT ramdisk
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 arch/arm64/boot/Makefile |   4 +
 scripts/Makefile.lib     |  10 +-
 scripts/make_fit.py      | 264 +++++++++++++++++++++++++++++++++------
 3 files changed, 239 insertions(+), 39 deletions(-)

-- 
2.43.0

base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
branch: fita4

