Return-Path: <linux-kbuild+bounces-713-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5AD841181
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 19:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 036E228EE4F
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 18:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A65B6F060;
	Mon, 29 Jan 2024 18:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eA/EIvsM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6756B76029
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551251; cv=none; b=IR7DkBsqnj8kGTlOI2qBB/P2iYEIASEE3ElUqX3atYFfMbXiBJog356wzM3OPtTlSa6Cfa6pfriYMc3KdsrjDVxJYbItbhlr+LUjmWQqJzMQjDnR+fuUetzZf8AhsmyaXpzdQsBrYnqqmlMLv6iI3h1E5+h/FkMfT7fGAWuXYKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551251; c=relaxed/simple;
	bh=ZGGqBUPumN+idc9ens24RKWiq23wqMqhdGfjFbkJcRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t+r7Iw8L9XQfqcHfe1fKUl1jzZhY7SUpc7BTWBWKq0kBv8v2jieBYtkHe4iM3meK7ePBRN0TB0OsOcsjyAf1n8RBtT0Lsk6KuuQnDsSuYQ5IAAqzyYf12qj/gh/lNdcj5UPYg6BJj/4V5fsUwppwJ2ZcQYTTQvAIEEmyqGbODG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eA/EIvsM; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6de3141f041so445223b3a.0
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 10:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706551248; x=1707156048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+CW+in6EnK2znPTJ0AfQ7xRsovW5JNd4hWidmf+BiM=;
        b=eA/EIvsMZ3JtvygLEp+XdI4nquW1ZX4bLgP9CHpIeDb/7wUhhgybI20kG1mHI5CwBc
         ztcrXShmDkU9D4Us13ouRA3+VtIKNnGvzy5B0kaS+xez+9WSh6Q1vvSSnT9dBg8yEqas
         NqlAgpkq613CW+DBudYfBYAKk8FDTSMTzI6Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551248; x=1707156048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+CW+in6EnK2znPTJ0AfQ7xRsovW5JNd4hWidmf+BiM=;
        b=mkT1b0ypeYJyzM1HgI0MixAJ8bVeM63Ooy/n8HZfhsfIT9anqtGUyiOzGUhEqBrgC2
         rVIfGCmR/zlaONQdo7Jh6psixoqfs4be1lryu8GknI1TvKgblAVW1tYztIn62L0K9SPv
         kTzbqC3wn7lKd8Teiwtkin4B+gBYfw/I3OsfwnL3RRL9eMPbJyqNMCXcwfHL6TV7ld8T
         h6n7ELu/jf4/wNQlpbeOq+mEUY/v3npfkaGjfPuzsiIzjHH/3MUEoSzXL15O74pHxNyE
         vpKkvRbgKDhWGT1ckfasxSHnLy55UaNLgRcn9oPZ7cVMSU1oSc1xUyNFGxYR0/brkEKP
         b9VQ==
X-Gm-Message-State: AOJu0YwmFdtFytXvAOw+ITlt8dt2SqKqOWcIbdQCzWtRB1kop76iMLVH
	4C8JQ/XAFnyfrOZcKzxom1tHuipD3Hk1CghPj8j5GFmubhE0e8KPvzRIQuzh8A==
X-Google-Smtp-Source: AGHT+IHzMbnsAAlCzNBmOOUIN7GWD2qtf0TQqIGnd2N24RJxcnvtRd6Jpb1GCe1rOCRHM6gjcuNAQA==
X-Received: by 2002:a05:6a20:e18f:b0:19e:25ab:5d30 with SMTP id ks15-20020a056a20e18f00b0019e25ab5d30mr329007pzb.49.1706551247798;
        Mon, 29 Jan 2024 10:00:47 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902968a00b001d71729ec9csm5622621plp.188.2024.01.29.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 10:00:47 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Justin Stitt <justinstitt@google.com>,
	Fangrui Song <maskray@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 0/6] ubsan: Introduce wrap-around sanitizers
Date: Mon, 29 Jan 2024 10:00:37 -0800
Message-Id: <20240129175033.work.813-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740; i=keescook@chromium.org;
 h=from:subject:message-id; bh=ZGGqBUPumN+idc9ens24RKWiq23wqMqhdGfjFbkJcRQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlt+fKr4C/1Uw/qKiym8JNIHrticwbGItvtoLwR
 XmESZ6nhtiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbfnygAKCRCJcvTf3G3A
 JsyCD/4l4Nk/URvw3kj0okH6XFWIxs/ZeiLVH2vDL41SvfbPQhpi+lCU4RKMP2XieuJ3KygVmGa
 mA8ABOVAJUOmhBNIrC2l9M7tjVcPoXBkTHKV6M282fJYo2pN03EHVZsbjNcng9HMLjgRm2WGjnU
 JYorKquSB4s3PocpIMNr0b0Ct3bnUCnp5tZOjSeEE8EQbNWGc5jPJSnV4UCPkXhZoWb7lAFZuYJ
 UDpE+Wz79/BRLULF+tLwiIQPu8rKVxn5AbO1gRgU8bbUsR4rg0nfIj04eTdS/hnQ+eqjuEtRymG
 E+8Bwd67rfWxhYkbZiIwif6Pz9zuXsENRBB5j/NnsqrrBl1/oBPprzdG3xIUlNfGh3lC2p/XUaH
 X9mtGkfvMvv8ir2VhNed6tLbbUOhodLmPen/S96YcxNcbPM/RZTfibLcuCBWLPOaOtBZnKKdz3f
 YTArlBA0afCW3HPJiMHkpmtMdzhbOs8QtVpKTCyQCuULqrciWRtrNdoMB6Loguv794PpwIkL6Uy
 CnsREXq/qSq/CbmirNh0yylWWz13AjMoedgfxjqXRJX8V43XC/w5iSrcmUwQhbxW2aU8jJ6HqrH
 YRZouC6AHWt83CGOCCLGr7yFpxF0+Un/xkB2uSHPWP8vndnHTl+jscCvIXPaRnlUzY+zoVpk7BA
 zhUdRD7 sxkuuu9w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

Lay the ground work for gaining instrumentation for signed[1],
unsigned[2], and pointer[3] wrap-around by making all 3 sanitizers
available for testing. Additionally gets x86_64 bootable under the
unsigned sanitizer for the first time.

The compilers will need work before this can be generally useful, as the
signed and pointer sanitizers are effectively a no-op with the kernel's
required use of -fno-strict-overflow. The unsigned sanitizer will also
need adjustment to deal with the many common code patterns that exist
for unsigned wrap-around (e.g. "while (var--)", "-1UL", etc).

-Kees

Link: https://github.com/KSPP/linux/issues/26 [1]
Link: https://github.com/KSPP/linux/issues/27 [2]
Link: https://github.com/KSPP/linux/issues/344 [3]

Kees Cook (6):
  ubsan: Use Clang's -fsanitize-trap=undefined option
  ubsan: Reintroduce signed and unsigned overflow sanitizers
  ubsan: Introduce CONFIG_UBSAN_POINTER_WRAP
  ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL
  ubsan: Split wrapping sanitizer Makefile rules
  ubsan: Get x86_64 booting with unsigned wrap-around sanitizer

 Documentation/dev-tools/ubsan.rst | 28 +++-------
 arch/arm/Kconfig                  |  2 +-
 arch/arm64/Kconfig                |  2 +-
 arch/mips/Kconfig                 |  2 +-
 arch/parisc/Kconfig               |  2 +-
 arch/powerpc/Kconfig              |  2 +-
 arch/riscv/Kconfig                |  2 +-
 arch/s390/Kconfig                 |  2 +-
 arch/x86/Kconfig                  |  2 +-
 arch/x86/kernel/Makefile          |  1 +
 arch/x86/kernel/apic/Makefile     |  1 +
 arch/x86/mm/Makefile              |  1 +
 arch/x86/mm/pat/Makefile          |  1 +
 crypto/Makefile                   |  1 +
 drivers/acpi/Makefile             |  1 +
 include/linux/compiler_types.h    | 19 ++++++-
 kernel/Makefile                   |  1 +
 kernel/locking/Makefile           |  1 +
 kernel/rcu/Makefile               |  1 +
 kernel/sched/Makefile             |  1 +
 lib/Kconfig.ubsan                 | 41 +++++++++-----
 lib/Makefile                      |  1 +
 lib/crypto/Makefile               |  1 +
 lib/crypto/mpi/Makefile           |  1 +
 lib/test_ubsan.c                  | 82 ++++++++++++++++++++++++++++
 lib/ubsan.c                       | 89 +++++++++++++++++++++++++++++++
 lib/ubsan.h                       |  5 ++
 lib/zlib_deflate/Makefile         |  1 +
 lib/zstd/Makefile                 |  2 +
 mm/Makefile                       |  1 +
 net/core/Makefile                 |  1 +
 net/ipv4/Makefile                 |  1 +
 scripts/Makefile.lib              | 11 +++-
 scripts/Makefile.ubsan            | 11 +++-
 34 files changed, 278 insertions(+), 43 deletions(-)

-- 
2.34.1


