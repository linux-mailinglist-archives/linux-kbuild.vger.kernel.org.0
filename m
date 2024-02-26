Return-Path: <linux-kbuild+bounces-1061-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 032B18667F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 03:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D32EB2105F
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Feb 2024 02:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50395DDDC;
	Mon, 26 Feb 2024 02:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTK7GlPN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43134DF58
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Feb 2024 02:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708913517; cv=none; b=kuLpbIxo4ySO4AQHKy3Ody1CHbzKnrmYnOvjUjVSvkpZvE+NQjqAmiZ7Ji3cY7GjXD4wNkl3UUQJrEmkvXApY9UXN0WTkOrrL5Y/mNPgHoD6J4MEcoMg0/GIyhO2rSlitiq1l63vgtkei5Zy7WE7OFy8LLbJcIqojpr9fUagJM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708913517; c=relaxed/simple;
	bh=jZfVAAcDxjvKB0VY8B3YaZ+uO2w0uEao68eTQKvjiw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YH32Sbt2+S5vty677Gn2bvZE+YNmvl8R19cl1XCKAlnBYZjCBMzEytuIdiwa5qPPIFD+dkbOv0q95h/h+KccXdSMjJ5wa63feCdwiDI5PnXkCHl/orV8tOd+W3xK+oMDFhbLVjJqUI/wZuysQAHv5TgTNBHVDilPozCfd3HV05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTK7GlPN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-512bc0e8ce1so2460918e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Feb 2024 18:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708913513; x=1709518313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4WJzDolwQAt18vJAoYRdoVVqjnAvhbqXGlG4vWEs3Y=;
        b=jTK7GlPNZDodkAxLOQnTRxlmR3EKHqnPKDJ2MkVLG8tvAskrgno7okbWPS+nLPZI+6
         3JuWEazS74sUVEO/8Ja5l2IYTv0sFnK42mFQsIBrcY3f+vQ2zGByvTdWhEL2OTpSAXbR
         qAIDGJIRGdICp7SEdR2HOeP5sNSRtKoYbakpsy+CptHRRb2oOLSv+Xicaq7sNOva7A0w
         HwqrSdq8fPuVfWte9sRyOSIyC9ks/Qjnoh2lhtpsdDPeK+7da5CJ/ShKMMY/QmOxOFIc
         ByKT+YD/6XR5euJTQa15PMj7eSrzx26NDyoV1DlIKzWb884F65YT2ckvl/40zm1unmRY
         wZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708913513; x=1709518313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4WJzDolwQAt18vJAoYRdoVVqjnAvhbqXGlG4vWEs3Y=;
        b=EcOi0jJvN/ymeXIjFLShOOv8ptSPBPhwvQ9HMsjdAS5pbGiZ7ebb09wFqgIZx+D7zW
         ukFOE+y8EpX3QGhHTXQzzm9hsA6EJMs6y2VcaJiY+PqTTEcatXgzdNe2T3jGCMksPHnY
         tg7s+dIEhmij7chYNMyT2/2CJ4IbvSHN2ilik1sMxzb5bCE6emIMXDaNlcoeqj9OL6fV
         dC4r0GWFgAYaeFsHR6vBvDbvkrx5/ncdKNT6OzNLYlCtm8ms8fyv/0JBiwisB/az+fxk
         7icDumVXRuw4PXFCqWqXkhBgMFE3YWnNgseECNRr+uqOj9rmH+Sc1hR/8iPLpXbj4ZKT
         /2nQ==
X-Gm-Message-State: AOJu0YwHPXK+nY7rAN+2pGt5xKGhbLbwpyd42L408/Wew9zArMwTeMpp
	09tNi2bZTF9W8G9k3Ba0ZhemabG67sQ62f8c6IoE5uVWMQqHSBBzUvmMBgQTQls=
X-Google-Smtp-Source: AGHT+IHIhjygvqwAPNq6G01cvfGh0Xz2bV+AHOCuxJnMV+tOjv30gYslyjwruP3z9HG5pCKzHnIc9w==
X-Received: by 2002:a05:6512:2352:b0:512:f628:32b9 with SMTP id p18-20020a056512235200b00512f62832b9mr2204358lfu.27.1708913513426;
        Sun, 25 Feb 2024 18:11:53 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 18:11:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:43 +0200
Subject: [PATCH RFC 07/12] drm/msm/headergen: use asprintf instead of
 custom aprintf
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-fd-xml-shipped-v1-7-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3089;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jZfVAAcDxjvKB0VY8B3YaZ+uO2w0uEao68eTQKvjiw0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NhtJZMjKcvl1vvJmmqadrFVvuv6cSSXvf/V
 iZT9I/HRvGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1TdVB/4rX75OqHP0pic+FcAPiu8AJWgzBPrcNlgqGriLQU68RjcWyfSqT8vjWjJQ0hJFEi1PD+D
 hT1pS43M0PqiToTLxrZJdJE1RXheoLvG+7nCKJspMiBg+0ALmJ+RSf49AoJyRA8gCmS6bhebATz
 clq0L088U7EmdDA3O+3bZSXDnDtsy8fWi5vjqu+H1Muw3+8KS+0R2jFDpIQjLuuW1bZ9YLHiOQL
 hCeXbjMkeftb7dv6WjK2EI9wBhaWdz+9Ssewt673vGkZU3eka/wyfnH9Ppp38YKVDmIROMTFpPw
 Z9syTfwp2u2AnGSgjcs2yWiaQapH/EB7rjQrVhlZPG6KEFbw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Replace custom aprintf() function with the standard asprintf().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/headergen2/aprintf.c | 38 --------------------------------
 drivers/gpu/drm/msm/headergen2/rnn.c     |  5 ++++-
 drivers/gpu/drm/msm/headergen2/util.h    |  2 --
 3 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/headergen2/aprintf.c b/drivers/gpu/drm/msm/headergen2/aprintf.c
deleted file mode 100644
index b3d924f59413..000000000000
--- a/drivers/gpu/drm/msm/headergen2/aprintf.c
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * Copyright (C) 2009-2011 Marcin Kościelnicki <koriakin@0x04.net>
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#include "util.h"
-#include <stdarg.h>
-
-char *aprintf(const char *format, ...) {
-	va_list va;
-	va_start(va, format);
-	size_t sz = vsnprintf(0, 0, format, va);
-	va_end(va);
-	char *res = malloc(sz + 1);
-	va_start(va, format);
-	vsnprintf(res, sz + 1, format, va);
-	va_end(va);
-	return res;
-}
diff --git a/drivers/gpu/drm/msm/headergen2/rnn.c b/drivers/gpu/drm/msm/headergen2/rnn.c
index d82d2a561b02..6cf3c54954bd 100644
--- a/drivers/gpu/drm/msm/headergen2/rnn.c
+++ b/drivers/gpu/drm/msm/headergen2/rnn.c
@@ -44,9 +44,12 @@
 #include "util/u_debug.h"
 
 static char *catstr (char *a, char *b) {
+	char *res;
+
 	if (!a)
 		return b;
-	return aprintf("%s_%s", a, b);
+
+	return asprintf(&res, "%s_%s", a, b) < 0 ? NULL : res;
 }
 
 static int strdiff (const char *a, const char *b) {
diff --git a/drivers/gpu/drm/msm/headergen2/util.h b/drivers/gpu/drm/msm/headergen2/util.h
index 98a32a34d076..07ad637e4521 100644
--- a/drivers/gpu/drm/msm/headergen2/util.h
+++ b/drivers/gpu/drm/msm/headergen2/util.h
@@ -110,6 +110,4 @@ struct astr {
 
 void print_escaped_astr(FILE *out, struct astr *astr);
 
-char *aprintf(const char *format, ...);
-
 #endif

-- 
2.39.2


