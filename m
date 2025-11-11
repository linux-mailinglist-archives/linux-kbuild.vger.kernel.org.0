Return-Path: <linux-kbuild+bounces-9547-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79637C4BB87
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 07:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA9A1882A58
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 06:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37D024BBE4;
	Tue, 11 Nov 2025 06:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y8kfn3sZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A608C2253EB
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 06:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843441; cv=none; b=WarckNcHzUWhbZIkG3LF2+Nuuuvt4r0J7/2in4/3gaeDR+BiV6OhVgYxT3dYDtODAgI35odftqLMl4wcXmHAfRmyTEXxzr49Hio+9eco9hIAZoe1cjgF1lNwm8Gba9SYuDfVG8v/zKnjIGIY+iK34HEiFJqyT7hfwghEPtgkDFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843441; c=relaxed/simple;
	bh=TlhmG/A4QTnE1W6q5RPZRQ5IjQao0xzjijoB7KOo+Z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U8QrFT6XqBm6jfG/52E2GPKZ8wbnDYf/J+K6+6R7RdWKdsXBVKgQBiudDJgAxjCHiImvcY660G7WBqsW6GeR0Ekg7Xkhd2UYHX8Kwdzw7YbgMtKHHkd+g+7FYQyVLiAJBW3a7TfQmyF/IigbPfXdjwrSZGrtkb3dhpDRaZSwgLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y8kfn3sZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710022571cso36601025e9.3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 22:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762843438; x=1763448238; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWt0AuF6akDTgtUcbRjCqEt3ipQsYXg4NGtxGbQXUNA=;
        b=y8kfn3sZHNn1nRFzbwxr7omqB/3tj5Nwf4VNaXYRTx22+aObNTJx1gOG8y5WPLCILf
         aVxiM0F2n0774GXDVHoeNgOj+6x60yiyvvdzlVn1nQ/JQVxH0mOMxo+jFlvrT9nbesT5
         asL6FC6pLV0Y6cy9OhTx4ey0hGYGdPrFrkQnL0NnTiMCTJLZiaP65gMDnoqwEOj2WQvy
         PFyQ21nMP3KvEt0GQJrlfadotkIG3Y4wcLa4p4l0tYizEGW2WT0DX1k3vKFto//PSCD8
         R4jeWDM34Us6g1u+5uIcYSZ0OdiKu6XJ2MGjN2gAnzjPDeNSgPFkzY3RycfS6DU+CUmx
         w9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762843438; x=1763448238;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWt0AuF6akDTgtUcbRjCqEt3ipQsYXg4NGtxGbQXUNA=;
        b=vkjFqcp9S2aAq+YdWe8CJj6TqGxRQIZZNZH5Fmf7OFyN7y9Tr/z84YGvYrjMq+ylOc
         xnqax1dNFmyuy+lyNQhVC3E/ha8/TFxnifq0iU7l8YsbVhHH5xbQrAlO3+RpBTY/9KP0
         rQS95DO0rV00mwKsia+IQSAy6k/QM8EKgpaJQRHPdzKI5la95QJ3Oj3LZsc2ZxU034n9
         IbdnPeENjGsIQvEtxnUHNeRUjnGuafQKwwu7Awi1rvkxipCTXSUJ0/JBc2RDJYQX12Z4
         z6Wil3Frk2K4yEmo3qWgM1fVupBzfraDhy/dqOw/nqguUGunOh/a2MKw9Op45fx4WiP0
         3fBw==
X-Forwarded-Encrypted: i=1; AJvYcCUz3Mrbq+mrMCcuUVLClOBGVazIAVhOJkvzoGLIvrseqrfd/4akzk8IP7Sg6SU+oL4uChnU/A6GhC0oY68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzepyQ4aeKnSUW6bB5kwLaLD9OXJ1bjdWMo1d/oEx53ow5oHMLa
	e/tsrwi88tjLP67+VSCn/tuohxvw+nBzSpWDiuK+4UgQUEY7IC+GQDAvE/BrvfeXuuU=
X-Gm-Gg: ASbGnctgDNJ3hRXxqnVcBHhfNnBuMhaSnOxqaVmQ8pQNbqiqvwtCwUPBXrQQ4ZHo5gv
	7oh1wtObWHNNx6tXRJW7EsSLvY8IesH7MUR4gCb+ej+DDuLq8soStHKYPpFEKu0brYg81GZX+iy
	Cm7Lk3wYGdK+N4KaxYxjsMXdDCORd2r1CBxSXYdYyEWwWGoc9Jao7EYcf5yC7LbbtQFkPxVQDYo
	10syDPgcPWcugoqCo3bbm1MxD11/MZWcDMOAGm909MVi6MBZm8jSHh8LVZMsqv0Vd57lQGf/Zvd
	8CAo+JbGdoi31d6FyPSvudY23zioGW6A73T1BleO3DCiZHxctXsUljjlcQuNU7HfyMc1ZQxVtKW
	BrQaSFGO8RDON6e8wt+Zt+yq/zJFzt5nHCtm0nUUQCwRMzXa6u2CfnQjEaNo1j03Ou3DsGc0GvQ
	==
X-Google-Smtp-Source: AGHT+IH3ncjthnq0B5Vg69zXKIYDaqeR3ZiowhpOGW+iWlV4Ch2UpceJAQxbdcBanp2lkvWiuTz/KA==
X-Received: by 2002:a05:600c:4f42:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4777c7ddab0mr76513705e9.32.1762843437815;
        Mon, 10 Nov 2025 22:43:57 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47781d8ccc7sm9869235e9.17.2025.11.10.22.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 22:43:57 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 11 Nov 2025 08:43:51 +0200
Subject: [PATCH v2] kbuild: install-extmod-build: Properly fix CC expansion
 when ccache is used
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-kbuild-install-extmod-build-fix-cc-expand-third-try-v2-1-15ba1b37e71a@linaro.org>
X-B4-Tracking: v=1; b=H4sIACbbEmkC/52OSw6CMBBAr0K6dkzbiL+V9zAs+gMm1pZMK4EQ7
 m5FT+BmkvcymTcLS47QJXatFkZuxIQxFJC7iplehc4B2sJMclkLwS/w0C/0FjCkrLwHN+VntPC
 VLU5gTHGDChZyj1QmzSCNFvWBG2V1y8rlgVxZ3ar3pnCPKUeatydG8bG/nuB/9UYBAmrDrdXCH
 E/qfPMYFMV9pI4167q+AerdPpn3AAAA
X-Change-ID: 20251109-kbuild-install-extmod-build-fix-cc-expand-third-try-2cb1540cadbf
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2264; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=TlhmG/A4QTnE1W6q5RPZRQ5IjQao0xzjijoB7KOo+Z8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpEtsqqfbS40dd/Wz5dNm8tgw+mUgMfBDb2A7Ph
 J0LSuwr1IiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaRLbKgAKCRAbX0TJAJUV
 VgKyD/9Xqm2rmLjLhgaxWN06q9BrpkftNo8/GxYrxd0okpxaMB2I377mBTrnCrfUE6fCBnfbBjo
 81lHU00+wtSbstyaTQ5SOEQcKj/PETGHBUnEJbFmQtj9doH2ARf/KNTL4Tbf3iyFnznGu8DRteN
 iCdbaGWLUWGob4dCfreZ2J/AFtIFfFSs2MOkllnwLvPSYPpYGaVzXi1C2xkumllnvDLJFe3yAIv
 T6QSAc+s/gL7T4caAfoS5rGrGd7TdqvdQy7ByCmCcJZwBFykUORb04tP036TFQFygL8F3xACWTI
 o2Rno9OF0teoxY6qakBrwhbEv/rUpP5oe9r4AwPutLYlQ4JYIl8i0XNzMR1RMVqverMtNjzQS4T
 JfHdrrPjVqyRjwQNkG9U0Vay+jyazemPyrRuLA6sckVqvDki2Bkp5R1QHbgxiCoDMBIdUWDXJIQ
 F+4d4xexo+0852dHpVtaaCcW6wLWewQU1HuoDQImtq5L1A6oT41deTm87Xg+8CrUQ++a5pCZZBh
 wbKOB68iNoHT2/o/dr1rW32LazABH3uhH1RSdB6ymPDnGje6DRoHPpFtb6CPW12MyXndMJYOlhu
 XcCo9BYh4JN3HAOMcPusMUVunWK8vbZaucgcG+dfYAOYFPm4Vl4kt1E2z5a4xGjpt+H7pcCxGDx
 M+JVCDnjMaa7KOg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, when cross-compiling and ccache is used, the expanding of CC
turns out to be without any quotes, leading to the following error:

make[4]: *** No rule to make target 'aarch64-linux-gnu-gcc'.  Stop.
make[3]: *** [Makefile:2164: run-command] Error 2

And it makes sense, because after expansion it ends up like this:

make run-command KBUILD_RUN_COMMAND=+$(MAKE) \
HOSTCC=ccache aarch64-linux-gnu-gcc VPATH= srcroot=. $(build)= ...

So add another set of double quotes to surround whatever CC expands to
to make sure the aarch64-linux-gnu-gcc isn't expanded to something that
looks like an entirely separate target.

Fixes: 140332b6ed72 ("kbuild: fix linux-headers package build when $(CC) cannot link userspace")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Moved the new double quotes inside of single ones, to be able
  to drop the escape, like Nathan suggested.
- Re-worded the commit message according to the above change.
- Link to v1: https://lore.kernel.org/r/20251110-kbuild-install-extmod-build-fix-cc-expand-third-try-v1-1-5c0ddb1c67a8@linaro.org
---
 scripts/package/install-extmod-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 054fdf45cc37a8717444b8094daf3e1150a8ccf5..2576cf7902dbbfcd82ea690aac1b2a246b3a6a30 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -63,7 +63,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	# Clear VPATH and srcroot because the source files reside in the output
 	# directory.
 	# shellcheck disable=SC2016 # $(MAKE) and $(build) will be expanded by Make
-	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC="'"${CC}"'" VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts
 
 	rm -f "${destdir}/scripts/Kbuild"
 fi

---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20251109-kbuild-install-extmod-build-fix-cc-expand-third-try-2cb1540cadbf

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


