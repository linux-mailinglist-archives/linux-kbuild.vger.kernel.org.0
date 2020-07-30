Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACCC2338BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jul 2020 21:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbgG3TLf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jul 2020 15:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730444AbgG3TLe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jul 2020 15:11:34 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BD3C061574;
        Thu, 30 Jul 2020 12:11:32 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id f9so5429163pju.4;
        Thu, 30 Jul 2020 12:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=BaU8IpH/hEJ0Bt6I9r0CnbjI95drWEkwS26FyN9SQ1C0SLb+l/GctZKrp+6iAniMJ/
         V8IEULsf6CXvq+y2jGJ40+COD9TBdDmqEpVcCPrrq8syEAsFnIadi+22m87xWSRDyKB1
         uiZTPD3w7Nu0x3me1WmwN3q3qadMKKRtCBd7dFCzAmRcuVsdhaTg3ML5fc2M306y2Grx
         WQMiuvGYA61ahT0KfWdswFR/IC13gZbg1FAmwOFP/610ojzXQKvffSQqP21jbW0jd24u
         T/Khm1jATVxJv3+6lsuzrV/S3X/veq5yo285bZq+RTV4Y7SP67+G942fjSVvlvxwOH1U
         m/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=hLiZTMdpxTZ2Ics7lUqaq6EADBg/mUvqJHKpRtyxY5QjeNefUgtaDRbxzplO5QfhZz
         FgGVPFEaJOooQBe5BjxTHTqvRPQuQfTyEmP5OJ5lekMeHj93Lv32kmRWCWdfD33te0Vd
         BDNT74GqB2Ry/HHcuL55FkBqIJJOg7aV7OKFO1FYjpLP3MmJGK8bpsJGzM4Nu0zUZ/SL
         IB7PIZnsojm1uqesHe/5GtGP7W5XJ/vOvqaxLqIL6MV+VjyySMGAMXqx4ajYXR+PDb2L
         2NCWoYghBxvEt293LeD20MaJKIgjt2+2AyrIfU/cL0E1O4BsVD3MDIwiGKv1BcH9wcmx
         Nckw==
X-Gm-Message-State: AOAM5305Vs5yhNghjvwVrDVfMpz6h/GAXZmChKgMiH288/rQhuhtNMRl
        82yLmdCGP16xRLJENQvupOE=
X-Google-Smtp-Source: ABdhPJwm/oxQy2a4+WOCoFsWEMnAGdqfL644K97nSedNa+5kBmRN+lfDPnrOEYaqPuy6ibdgdZHvpA==
X-Received: by 2002:a65:6212:: with SMTP id d18mr315986pgv.402.1596136292141;
        Thu, 30 Jul 2020 12:11:32 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id o22sm8644976pfu.206.2020.07.30.12.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:11:31 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v10 5/8] x86: bump ZO_z_extra_bytes margin for zstd
Date:   Thu, 30 Jul 2020 12:08:38 -0700
Message-Id: <20200730190841.2071656-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730190841.2071656-1-nickrterrell@gmail.com>
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
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
2.27.0

