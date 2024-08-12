Return-Path: <linux-kbuild+bounces-2948-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B6494ECAF
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 14:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE1B51C21B82
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 12:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B128917A587;
	Mon, 12 Aug 2024 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="louG5wne"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15A8176FBD;
	Mon, 12 Aug 2024 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465056; cv=none; b=ZNqcfnmeCKffXNYpkIRG7dtGv/R3rIeYNICGjUs/7WqF8QLngOfKPIE2ZwfwPvLxpl1WTaTVSdffq/P1ycGVXOJotlPTt1E86HyE1Ds4dCxAJa/AR7pVwIzJsZN+CLuleajzAnGWyM00TV3EY1fcW27b131Wa7DIYiUbu6vCRjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465056; c=relaxed/simple;
	bh=pTiLvX6dgRw/lbpMcbvul78nttHoBA2ug0btunkVO8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a1OfEb2f+A2ZVDM4bsrvrrjzJ/QRpnq9rP5b8HLwRyHZfRowioEWfUWpYdoshGwx/G4tgYsMNzHbZDduuxVWpVrJwa1QbKv8NLR0h6kLJVg8Ehi/L0w1ot+fbmMzrsugKL/SzzcFCLpL9J+YpqWaseX859RwAkkiBN2/cin0KMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=louG5wne; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a94aa5080so501935166b.3;
        Mon, 12 Aug 2024 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723465053; x=1724069853; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2MT7CpoVbgtNAFPvwIvM+rcDNcVzre2hq92xi/BU9g=;
        b=louG5wneHQtxvjJQqPXm88+oEUJLKLVmwX92MvVFwbLk4hPEO22AV1oWTZvXzFwLrd
         QH0iIcDEUtE9zXcv0oNfmlpR8SvLkVh1op7oNpstR0Ir5yOeUR6YdjVlS5E01Qktrj9q
         5hGMGLyMmxO4Xm9Vwc4ly6tv0zGvB4fvVhswv8hcIu+TjVjbWyI6Aiv5jr3+2mbcU4+m
         B1Iti3IG+y9lZhWHDs9/lmv8Alqd8tyjCgNBWED9thFg4lxDmnc+4IfV8wkxPGpSbmkK
         mvd8If5a4Uca/yRcBKxrGv3zbiNPGN8n3sB0wjb0ULOrnW5xC9V8VURVatFAv3Mm/im4
         h1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723465053; x=1724069853;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2MT7CpoVbgtNAFPvwIvM+rcDNcVzre2hq92xi/BU9g=;
        b=mceC5opIVq6PCCOgwTDDAUvK2ZF8xDOf/aJlQRfa36lQRHJKvzy9kB9AQcZm9XzqXV
         XGFwW6D75DR/V3khteQ5VDdqJChHpt1X99PExrfE+BcR42C1ZYH7K0LesJcehyZocp7t
         y6vN138pn3zxTt8aK56EDhvz1eFEglT5cGs+yaW2hyTHrP6vFCLhaPE3QLfVRp5qKXI6
         j7sCauFK+0JuUK7XCyVmmh6niY09+ZHNMv3ahnzLDcGJKoT12umAFiSNZe1BzjcsXg7n
         WT4hZf+hd7UvHCEXKiRj8wVTtBpih4hyYBCNtK+6KHoe7GaK5lwSghmIwwFXoe9GAu4x
         Si8g==
X-Forwarded-Encrypted: i=1; AJvYcCWO7jLLqLQjsErAN7TDcWNMHM/sBQHpBAEhAdKCRyvePUlFRNbanTYeh6iQTTiihEcTYljBhDF3NlhAN97M@vger.kernel.org, AJvYcCWWjK5egA8TrlVgpHu4U6iAtMzA+MveUOCa69Jo0g6CsVb3/SZ79KTD4rL4EZ3CJ6pPlmmpgg7V7xc=@vger.kernel.org, AJvYcCX8BDFEMbH30zECifVIUjYhJpmQSeln6kHg2oEWORkTXGflIe2Wfb5txBq10SJtSpHkia3FnMrHc6ehr9tN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0gm3c4SRr8mabHDhhUTcDDugR6lwr/jlbD8cZpE9yV9knk7h+
	/9dS7bSk8CdqYSLkGBsu+2wVkqBxXkpxPBYhilBUd0btAcBL6dY3
X-Google-Smtp-Source: AGHT+IHuioC1eMHhDjPqzvdRQcGw1i3us/v/rw8S6D6YDwM5A3GZum2Wq897dettoU7QQJkhYpvLHQ==
X-Received: by 2002:a17:907:6092:b0:a7a:c083:8571 with SMTP id a640c23a62f3a-a80ed2cfebbmr5491866b.52.1723465052896;
        Mon, 12 Aug 2024 05:17:32 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb0e1981sm225737366b.72.2024.08.12.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 05:17:32 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 12 Aug 2024 14:17:21 +0200
Subject: [PATCH] Documentation/llvm: turn make command for ccache into code
 block
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240812-ccache-literal-code-block-v1-1-4f09de978667@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFD9uWYC/x3MQQqDMBBG4avIrB1IQpDoVaSLOP6tQ4MpiZSCe
 HdDl9/ivZMqiqLS1J1U8NWqeW+wfUeyxf0F1rWZnHHeBOtYJMoGTnqgxMSSV/CSsrw5+MEN1mO
 0GKn1n4Kn/v7v+XFdN68FKyJrAAAA
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723465051; l=1223;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=pTiLvX6dgRw/lbpMcbvul78nttHoBA2ug0btunkVO8c=;
 b=SDOJxpOKGH39hPR8hykQodZxeGYZ7NMFfdKU5mLg3BkVQmrFVkc43IOOtxTJqPHJhco8fE7iL
 8TIjOkDlvTCCJASXzC44OzeodS2DWLWJZlPEF1QRTm1Zg7BPa9waOfK
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The command provided to use ccache with clang is not a literal code
block. Once built, the documentation displays the '' symbols as a "
character, which is wrong, and the command can not be applied as
provided.

Turn the command into a literal code block.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 Documentation/kbuild/llvm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index bb5c44f8bd1c..6dc66b4f31a7 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -126,7 +126,7 @@ Ccache
 
 ``ccache`` can be used with ``clang`` to improve subsequent builds, (though
 KBUILD_BUILD_TIMESTAMP_ should be set to a deterministic value between builds
-in order to avoid 100% cache misses, see Reproducible_builds_ for more info):
+in order to avoid 100% cache misses, see Reproducible_builds_ for more info)::
 
 	KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
 

---
base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
change-id: 20240812-ccache-literal-code-block-8462614e91e9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


