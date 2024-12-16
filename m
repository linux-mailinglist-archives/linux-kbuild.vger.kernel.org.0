Return-Path: <linux-kbuild+bounces-5158-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCFC9F3E14
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2024 00:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5B921880908
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 23:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC291DA0E0;
	Mon, 16 Dec 2024 23:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Eytt7KwO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709DC1D9A51
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 23:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734390807; cv=none; b=W8UbFKxP9g2600XNqkYh7qnRPt5SdGxCTEfGxD5JbmglcMVA7MImZC3XGydE5KlcWuyhryug5tFpwssMy/Whh4t6jXQ0ORLfSU4RLs/B0u5TeW4A5seq7+my+5G8pAqxwuialfZce3pl0bW0CmToBHLZXlmHj5EtHAl+duvGcKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734390807; c=relaxed/simple;
	bh=IOgGM2w7pk3oigV1gqLUmR9Qqpa9O/Il6zfGw3fe3jI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L3E+b8t/XitxhvfkTrzIHZzG6XhNRrAMC+WgDqVTIDigEduy93lZCLDljgtxm9vv6LcYQYmYvsRuLsQU7RnRCfzKSCxl6nn8m7d5f6BivPJH8kYF5/OtVjXT0RAfN+tS6M+Pu6H2WtGUCOuzx+uxR5J820eQhIG6+EYFSnA1cc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Eytt7KwO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21631789fcdso37226755ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 15:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734390804; x=1734995604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Cbp0zEgt8sYGgGttOagenj605vUWFx5sipZ2Yl2U3s=;
        b=Eytt7KwO0WU2hyUIdW/6GWYKKe++eJXTFSyWcq8AVT9BM8fYi87jMhv+4jfU4DW/SM
         hyLHneNQV0xzTXpk3yPCrpVdUrEIFzxcnMLVAN8Seik2D5kEC5bk9Qp4NYt2kqf1VUOs
         AztXLshVs0dm5EEM+UKBfE25F8xJF5lP6qP9kmtIg8d83NTQRbWfK2O4Ky0A1mdIva3s
         FbBBy/+qT1gBazRFleWvObp37aF/olvT93vmxU41bjTaTJ1m/YG5UY89kW8JloxQB4sv
         q4Aik/spGo3H7zJuXsuJTNyQjRm4ZabM4mdtwH7f74EH68eGaQzuJCQ1L3bNQpnOX0lH
         kd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734390804; x=1734995604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Cbp0zEgt8sYGgGttOagenj605vUWFx5sipZ2Yl2U3s=;
        b=EHbEuHqvecJ9ndFurDZxTnOVAgtLdtsUOM5vqWwkDLjWoM1qvQd86DmJYRfiUnyc8e
         MIEggEIoPiybHjbi0me2655X5dxQUP3EUekTi9TaDsFqtwxEa6leQeIYPqfFg2cnntsT
         l5wJ54dyjkTejbO0vggX1ZVBGiS9PDEsSLMo8vSpeU9NboCm695Y7elylaUOTf0UIT3X
         ZRANcVPRpyBmh5JsOycjQIY1M8LgI6VaDIn7+nkxIerno+MBPMbFBdKCI4xYUIH5ethI
         /UwTDJ+1vQg36q1vh0DgmE4bt7YyxWgU/iRjE/HxW6WNLJQ3M4zmqT+W+aPVyFI8xYPd
         tOiA==
X-Forwarded-Encrypted: i=1; AJvYcCVP/Cq/LtY4Lo9599DxvglvV1LLOqbYApsC4xE/piYwIGXfhWjb98XIhRxrj4e/aBGiUay1wkPJiuiAA1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdQEGvfYc6E9IvVjCnMWyGcBcs6MuSJNFqsMWSb1YQ0L0Gx72c
	CsCcMeGGFQlT1sKSSbqyuJM+MK6NVL3e8BBdyrkUWrVmATBUWlVbgOTsogHLg/z/OsjxrHUfZKI
	/
X-Gm-Gg: ASbGncuYDgh/35sSKDaOSNhI9eDB5ayLQtdfv47fBPo1QyWhJZBTOrp27EfCv9nxTed
	OmcDtgANFd5XQPZytAcZhw/sgz2VU9K929JHqYSMgSZgO2bC7IIlzQ2EZJUl8NTT8tQarle5jqx
	TgAV0uSc68l24C5ukTJ/9KeRe6CCdBFIi3axtR+cCrS3Y+Vjus/V0xPx1AbomKtCeIYGUJvDepB
	aWdgk2dDPULAgYuF2/iprDXyMIFot94Ef2ftRFBu4PzxePjoxS+XF3UhMM18QqBt7aQKM8z
X-Google-Smtp-Source: AGHT+IFjshciKlmIzBIB1jw3LAR8ZYMAQPyyhOAHw8JXPxmnDCkeL3I1RpqctkebF7xjVj+9QrljiQ==
X-Received: by 2002:a17:902:e94d:b0:215:b18d:ca with SMTP id d9443c01a7336-218c9262d3fmr19286865ad.18.1734390804203;
        Mon, 16 Dec 2024 15:13:24 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcc47bsm48333255ad.63.2024.12.16.15.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 15:13:23 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] perf: tests: Fix object code reading test for riscv
Date: Mon, 16 Dec 2024 15:12:50 -0800
Message-Id: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPKzYGcC/x3MQQqAIBBA0avErBNyLIiuEiFqY00LixEikO6et
 Hzw+QUyCVOGqSkgdHPmM1XotoGwu7SR4rUasMNeozbqIok28mOFc7jt6Q8r5FZOmwrOxw49mTA
 OUAeXUA3/+by87wdZlscZbAAAAA==
X-Change-ID: 20241213-perf_fix_riscv_obj_reading-cabf02be3c85
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Nelson Chu <nelson@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=IOgGM2w7pk3oigV1gqLUmR9Qqpa9O/Il6zfGw3fe3jI=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rCFo5+3e1tQisqpS6cac/wyM1MmJaWySK9PGtBBvOv0
 6Xbun91lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBG+LEaGb7e2ZHT+jXg/4T8D
 c2X1sxcK2mW1O46Jy13fG73kPPv5XEaGxZM1Cxg2/bUOU7Tlnu+i9MlYSu3ZjWSraXInZx/vuze
 VAwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

There was a breaking change to binutils objdump that causes partial
instructions to no longer be dumped. This behavior is different from
what the "Object code reading" test expects. Add a Kconfig variable that
checks the version of objdump and conditionally enables the perf test
fix for riscv objdump versions effected by this issue.

A binutils patch has been sent as well to fix this in objdump [1].

Link:
https://sourceware.org/pipermail/binutils/2024-December/138139.html [1]

To: 

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      kbuild: Check version of objdump
      tools: perf: tests: Fix code reading for riscv

 arch/riscv/Kconfig              |  5 +++
 init/Kconfig                    | 10 ++++++
 scripts/Kconfig.include         |  6 ++++
 scripts/objdump-version.sh      | 69 +++++++++++++++++++++++++++++++++++++++++
 tools/perf/tests/code-reading.c | 17 +++++++++-
 5 files changed, 106 insertions(+), 1 deletion(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241213-perf_fix_riscv_obj_reading-cabf02be3c85
-- 
- Charlie


