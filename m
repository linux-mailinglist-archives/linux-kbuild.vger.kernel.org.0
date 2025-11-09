Return-Path: <linux-kbuild+bounces-9464-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F5CC44906
	for <lists+linux-kbuild@lfdr.de>; Sun, 09 Nov 2025 23:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 925A0188981E
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Nov 2025 22:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2571FC8;
	Sun,  9 Nov 2025 22:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYid74ZB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E99C264612
	for <linux-kbuild@vger.kernel.org>; Sun,  9 Nov 2025 22:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762727208; cv=none; b=Nbd4jeD+otPqGFunEpqfAdQcqA6yS5sOGtF3FOT3RVki8ekISYAzqEWfD10l07O5A9gu7jdOyl2qpmsdjmlG+maXsaMCbXpAg/5rqCxZnGi3vfLFOpBIPwz/FSt9t0s/GG28JXAsMvXjMvfzwgSmG03viubxOsCk97gfGop2pos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762727208; c=relaxed/simple;
	bh=GRwTmWWCgGyzksGBqAM9TXhdQPTGz3CGeiWXTeRupAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZFt1L2+qlCNDoztfZrDax4o6h2q8yo9+rBZ7ATXlZAHAkLmq/XDv/kueUP4M+pMb8lcBokjzEo8/ORAZZboqnkpyoPQS9yphF72LZzw1isliabz+fAKh4TPywhkgOBtl3OspSno2w/EaZlCMfeSD9wXpARvUZf4CExS58y8PTI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYid74ZB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47778704516so3026065e9.3
        for <linux-kbuild@vger.kernel.org>; Sun, 09 Nov 2025 14:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762727205; x=1763332005; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l5PWbqtd6bcvUrej8zvNzXepXMjrjn2nyg8Z4cZHFz8=;
        b=pYid74ZBgCb96gjMnKMx9gjrQkwxfIjFBhQAnJ1uwRsFIVxzTcJs6RMXE8UyhUsX+K
         Qbgm2EgF44l3XmiOb0+VrSuTbe2TYCpNg86UI0XYS2EVdzP2HUhDTf+tn3a0upotHu+6
         q+of6IWadR3+mLCeK6I3N1eNiJDphs24EbUuzYCwd5glHljfJ6CsXtn3BCwgnB8kytDc
         YpBgkEQf+/MNn7Y/kfkC6yp0Kco/Cy29qmdzqDELCCloINL95qHXl+7UbcBDYDEyEKQL
         O/NeXi0iEHslZqKWita2Mvzwrz38QrAU+8jRmVf3cjTRiL11h7papm4cDePAPS2byapg
         eygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762727205; x=1763332005;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5PWbqtd6bcvUrej8zvNzXepXMjrjn2nyg8Z4cZHFz8=;
        b=wHAN4Qyv5JQmI6+/m3hTQ1ATN7NoL09lFV6b07ZL9cqqHBOxIefwJI6r6gr3uPY7Lx
         f2sed/EU76UzJEsxKi7QGo9e1FwYUxAKTenVyOMX7x2k29EEMNDqzcMK1ESgDvRU01yv
         G4I5mlFRo2zGFzEuB8Z0/UYXrHPfUvRuQAAz1N8CedmmObgNz6UL9JEN6LNzjN6QcyI6
         tRGHGQWDlhBByoW1E4BmCaNebpq+WfGVbgRG2Invpgfo8k1d9IGr/ea3KlMPV1XfYnT7
         0D7ksD/qPI7RgMQLh9Ofyuy1O0gWXBgUbnVIgPcAEtEbkh/D3gV9vQiL3lFepuqd2Yt5
         32rw==
X-Forwarded-Encrypted: i=1; AJvYcCUgyPDmd33U5N13I8VRpEzNiYgEvnKaVdp9HkGFtp3Dev9ATAKz5b4587A6fhYBFXn30z0SX2qkcOoWoy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSs7wby0m7Z5hWY7ZbR05xrX8B18K3HBdxllGD5kVa6o9lBRw8
	D8wt52F0B47JHqakN7vSMS7aIhd1dXXUCTJnSm31QbxwUr/CPnNc/RzDvJnxeLEIaio=
X-Gm-Gg: ASbGncu6SPceC5HQmLi42llZYcgVSpfUEZikOU6WQzfSWqL8ppugKGjdlFcd0dt/Xvt
	Zd1Pg+08SX3QKE9vnrYpsOQju9A9kXDwB2MDBOYa22VSk5Vci9HYEyyF53Qty3qJ/FY2zTiRS74
	uSIC/55kwkZcFjIQq5ApWWB0YZTAp4m7FB6reamwo096izV2lKnqr/loLcMNso0vL69II1ZwPPZ
	y/bz03oD/irYr0MMWayhwTmiqFCKRojmVLasJDHJJo7qB5CEvawU4UggX/6Dyua7bfvRylSvXut
	69NTFy/qrQM1Q0E45ryUit4GR8uL3upONh0KdCcs0FVDbhgEO1Iqk1t+2nfJwNN+9fEoAMEVHxZ
	N/yDYaDIs5QKkyX7hSuQrWZaKAeh4LYKtncZmkabrIBGgqCreG/TwiL7fynKp6KGAwvDDd0cwyv
	3AKH+PNjNK
X-Google-Smtp-Source: AGHT+IGnXStHSl2sAW2VSLtoJGzxaRxNy1OwnwV1UuTdC0dx69zTixHcYF+mVfT18Y61FR6Hlsyn+w==
X-Received: by 2002:a05:600c:4e93:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-47773239bf6mr50608715e9.9.1762727204598;
        Sun, 09 Nov 2025 14:26:44 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2ee2ed31sm11601155f8f.29.2025.11.09.14.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 14:26:43 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 10 Nov 2025 00:26:31 +0200
Subject: [PATCH] kbuild: install-extmod-build: Properly fix CC expansion
 when ccache is used
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kbuild-install-extmod-build-fix-cc-expand-third-try-v1-1-5c0ddb1c67a8@linaro.org>
X-B4-Tracking: v=1; b=H4sIABYVEWkC/yWNwQqDMBBEf0X23IUk6KH9ldJDkl3r0jRKEotF/
 HeX9jLwHsPMDpWLcIVbt0Phj1SZs4K9dBAnn5+MQsrgjBusNVd8hVUSoeTafErIW3vPhH85yoY
 xqlt8JmyTFM3yRReDHXoTPYURdHkprNXf6/1xHCdwu8j3hQAAAA==
X-Change-ID: 20251109-kbuild-install-extmod-build-fix-cc-expand-third-try-2cb1540cadbf
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1925; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=GRwTmWWCgGyzksGBqAM9TXhdQPTGz3CGeiWXTeRupAA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpERUceXxIjNVIRpZszMr2rii7nI7/k293C+ehI
 dQ7wgdbSxOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaREVHAAKCRAbX0TJAJUV
 VqtAD/43McfqLq1snZF+fOLJ31wyzswCzkH8xbjHuxY8XQQ35S0qiuN7Y0Q+c28KzzCT1UERXoG
 3PlPAN9MnUqsBhiUoEq7wRo+FaH74I66rwRVJ/xeFFZJQ8SHVo22C1/XXrw4J19faugzX6fTUaA
 hEqbjVhWkIofIjP1yJQyu0KibK+rKaguRt6cvAvrHGlQYDaxQfcJ73V5/m/KSjWYYGqGtnYcdOT
 AZJFzhAtM8Ilk7wEX0OtQEDpY8B69YuOuOQskfXZkitAWvlRSX6oE/6vYG7d2eL4adtz7Ux4oRH
 ZkG9yqRVG8vrKmTbG4DKb0G+FJjiSP7y4U8o117s2Mqd3OLYhWQDI3FaBK3efWYSQpoAiljlCcY
 Z8glNyNxI/jkBXH4AEsRtIozFnKxHB0kVOUJpLQjV54k7JozMdkCiD/+pyezeE3UIekuVxTEOnj
 Z7YmQFDQqixasblBF2VtabIX9x7B61X7lsOytG0yCF1xxFDe0xzpa0yHMD3YGNQoBJ4/HenisZL
 23dWEnoJr1BlY/348RL31hyR22Y6AEa0FJyjJd8rU2Nky3I15+xMfsdarP0d8uCOLoiHSVGfemF
 EhcoBFz/P9iTAQhJymFFV7nCNXXTkAdMN94kpO8MS4saqZGwy+V7n9NWnGcuIQVAG5Rs0s32/+D
 0nREDtZwKxUdXxQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, when cross-compiling and ccache is used, the expanding of CC
turns out to be without any quotes, leading to the following error:

make[4]: *** No rule to make target 'aarch64-linux-gnu-gcc'.  Stop.
make[3]: *** [Makefile:2164: run-command] Error 2

And it makes sense, because after expansion it ends up like this:

make run-command KBUILD_RUN_COMMAND=+$(MAKE) \
HOSTCC=ccache aarch64-linux-gnu-gcc VPATH= srcroot=. $(build)= ...

So add another set of double quotes, this time escaped, to make sure the
aarch64-linux-gnu-gcc isn't expanded to something that looks like an
entirely separate target.

Fixes: 140332b6ed72 ("kbuild: fix linux-headers package build when $(CC) cannot link userspace")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 scripts/package/install-extmod-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 054fdf45cc37a8717444b8094daf3e1150a8ccf5..6cce5c41552d520bf069487352fd26417b0b3899 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -63,7 +63,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	# Clear VPATH and srcroot because the source files reside in the output
 	# directory.
 	# shellcheck disable=SC2016 # $(MAKE) and $(build) will be expanded by Make
-	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='\""${CC}"\"' VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts
 
 	rm -f "${destdir}/scripts/Kbuild"
 fi

---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20251109-kbuild-install-extmod-build-fix-cc-expand-third-try-2cb1540cadbf

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


