Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE3CD135E01
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2020 17:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbgAIQR2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Jan 2020 11:17:28 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34008 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbgAIQR1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:17:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id t2so8069094wrr.1
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2020 08:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y2Twc/4NGWAktor1LtRx/8ZfV8fNdobSeF8VACd7NtQ=;
        b=2HAoL1j70ejT1gsCA47ItX4L13c+Lekgn7PQbHRsc3wvFSvbceA78tijG7wyydNu/v
         7E1eeoe+xN52OGGz3u8G2lJOHwdB6m35cn5erVnDgAd6DbUsSAoXZ0yG3S5aOYNxx2aR
         knPuvKahtwohE/TdnBKi1Imvjt+SLfTd+z5MvA3cUEw+dTrHyM0oQxMJ84FwNLuDkLAA
         qMOWe+/y3qLPXRd3VwoD2oKr9V5lLWCe3/WjnfTXDFSNEY+fXXAqKIHHSevM6wXVi15q
         U1ApapyPufoAOKqkoPqmQLKd7s4/Lw6+77uvwHEnNcuOzuEo+zXEv9oc8VU2b2/MKkT6
         SvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y2Twc/4NGWAktor1LtRx/8ZfV8fNdobSeF8VACd7NtQ=;
        b=Dt3pvieOck9eadl66P184Q+3/I855hVhxmR2Sycm8caRykJ1bi7+NKH27vdqu/29tx
         NQ04QREjxXFHI37cqwXBP8UBDIeezIJKXHqfgTniBNHcEBIWjG2toIeYXDBe4C2FzGHH
         Oe5RoWtfL7pLho36Gy9BNvZ7y3wZMBrLlcLTIjlrBmid40kLWOj2XiYoOHs1WnQaXbJ3
         ua25XZgmSnzqPEyCd44pfdmDoiuDRIW0i+c+MX/K/jwvnX4zdMfMlQW4PyUCdxAGCCpF
         t8bIGdIZLn9zCD+60rjjZhIQKheJ77rAeejwgDVAVXwKo5y2Rr05A2l9eR4e4MGSRXlz
         F1/g==
X-Gm-Message-State: APjAAAXGFNI7NG2wGf0vxsI7589ELQOyBm4yLGrQBimsU4fRNP2k/7Lo
        Je0pAtJUV1WVr4ysPk9yR4Dcbw==
X-Google-Smtp-Source: APXvYqyPbGB4LHfHSMgYlyKMfT1GnPO5HFRg6dAa1V/RyHOBmdlI4zTb5yC8nxMYCgtgWfzpA/AziQ==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr11402659wro.51.1578586646632;
        Thu, 09 Jan 2020 08:17:26 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id f207sm3805207wme.9.2020.01.09.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 08:17:26 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] kconfig: ignore temporary generated files
Date:   Thu,  9 Jan 2020 17:17:24 +0100
Message-Id: <20200109161724.9546-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

If building gconfig fails, a temporary gtk config file is left in the
kconfig directory and is not ignored by git. Add an appropriate pattern
to .gitignore.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 scripts/kconfig/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index b5bf92f66d11..d22e6753397d 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -3,6 +3,7 @@
 #
 *.moc
 *conf-cfg
+*conf-cfg.tmp
 
 #
 # configuration programs
-- 
2.23.0

