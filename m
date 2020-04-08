Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2445B1A2B97
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 23:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgDHV4T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 17:56:19 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34463 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgDHV4S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 17:56:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id a23so3049623plm.1;
        Wed, 08 Apr 2020 14:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8w6z7ePzBWm8stjHkgclVq8ZQiingis8QFQoH+ZzJU=;
        b=ZJI2Q3FplBc9C50NyWa9JnEkDRIS0iwq41SNeQS74c7uw0qr29tSN6GmUoVg0IA2bO
         yK51xogDZYBOE8qUA18n8erAcV3TEexwLy84zVfvdEQM7yLhfl+1chlRsM10GPUXJl/t
         /W/fG1RUk+E3wmk2V4zacO200uVcjSVDf4dW+zLeyeqCF4kjvBJroDyia+cly5su03yl
         yihlU7FkN2Dj0lTaNCQc/pF5OHZ5mGujOi7KLPCoe1Hatl6t24FiRGCKmptTkHAF7Dal
         R5m+Emwe+FdwMmiP1yzGZW5vpE8TC5PvqdDAu8Jqq9ctUNYlmQwyNCxWxIg+ZorpEQX/
         nB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8w6z7ePzBWm8stjHkgclVq8ZQiingis8QFQoH+ZzJU=;
        b=gmlI/5x3PTwype7zRb1wy282GUgocpIGChRartBf9OQSKzlK8ebXYYDYlRSn6VzoAZ
         cckE9XopnTgwtnkxKgqe0j4rEL1xXwzycP1zLM/t0MQJjeZ8fpM8HHAjv79cqagjMONP
         X+mvroCGZnNpulfLacVr6qYcXJGcPnT3GCF8XG7Z3d8HHtNo4Y/P/IOaj6hwS4wwGZlf
         xeN4+fN3BY0CZfsMu1p1L7MFj9KYLcFBD/yiGEKV+VdUv3kGPRgMuDpQBtKxyr1LgHPG
         3q6eWmNC9MFw/jwYNz8wjppwb79sVDiB885fMD9G6+mstVQCS6weMzJwGyrDWjNhxYvw
         P5cw==
X-Gm-Message-State: AGi0PuZSXSdRHJjECT/PMHSmJnecGEGVOV9d6d1nDA8PygxWz6wluQ7p
        7a7XN7hr3VLKMvyJYCPL8yk=
X-Google-Smtp-Source: APiQypII67IcsfPACVTTXg3t/zUdUfxor2LLUHBYawBdXxBSuQtGK+yqPrtlWnpm8ey9Gov9Vc2/LA==
X-Received: by 2002:a17:90b:3656:: with SMTP id nh22mr7712665pjb.71.1586382977034;
        Wed, 08 Apr 2020 14:56:17 -0700 (PDT)
Received: from nickserv.localdomain (c-73-222-55-223.hsd1.ca.comcast.net. [73.222.55.223])
        by smtp.gmail.com with ESMTPSA id ci13sm459604pjb.16.2020.04.08.14.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:56:16 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v5 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Date:   Wed,  8 Apr 2020 14:57:09 -0700
Message-Id: <20200408215711.137639-7-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408215711.137639-1-nickrterrell@gmail.com>
References: <20200408215711.137639-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

Bump the ZO_z_extra_bytes margin for zstd.

Zstd needs 3 bytes per 128 KB, and has a 22 byte fixed overhead.
Zstd needs to maintain 128 KB of space at all times, since that is
the maximum block size. See the comments regarding in-place
decompression added in lib/decompress_unzstd.c for details.

The existing code is written so that all the compression algorithms use
the same ZO_z_extra_bytes. It is taken to be the maximum of the growth
rate plus the maximum fixed overhead. The comments just above this diff
state that:

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 arch/x86/boot/header.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 735ad7f21ab0..6dbd7e9f74c9 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -539,8 +539,14 @@ pref_address:		.quad LOAD_PHYSICAL_ADDR	# preferred load addr
 # the size-dependent part now grows so fast.
 #
 # extra_bytes = (uncompressed_size >> 8) + 65536
+#
+# ZSTD compressed data grows by at most 3 bytes per 128K, and only has a 22
+# byte fixed overhead but has a maximum block size of 128K, so it needs a
+# larger margin.
+#
+# extra_bytes = (uncompressed_size >> 8) + 131072
 
-#define ZO_z_extra_bytes	((ZO_z_output_len >> 8) + 65536)
+#define ZO_z_extra_bytes	((ZO_z_output_len >> 8) + 131072)
 #if ZO_z_output_len > ZO_z_input_len
 # define ZO_z_extract_offset	(ZO_z_output_len + ZO_z_extra_bytes - \
 				 ZO_z_input_len)
-- 
2.26.0

