Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B364010FB0D
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2019 10:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbfLCJt2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Dec 2019 04:49:28 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37773 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfLCJt2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 04:49:28 -0500
Received: by mail-pf1-f196.google.com with SMTP id s18so1592472pfm.4;
        Tue, 03 Dec 2019 01:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erD2viJtloeLhrVUw8Su8xjseJyW7Af2nKs25MxP3Sk=;
        b=Rvvej0s30hTRj81W1htMoKBw3Fahdbr/YesJ9yJWaqjwz4SEqRuHMEG4xarObDphP8
         SyPiOSILFUSh4s7MwiZOLFh1Dy7z5+ConpbgVVZdbk2/xH7sirc793lIVcT47XsAXJpx
         43XTGybNuhTuK1Y0wc2nm36CQR31NK+oAyNgvl7bs6+pGIZ2GDDlhWW7orquaaatmUzF
         QOa56KAJmf2cI4weBu1Ji4oCMjOVbJIDMjf8sshNzFhhi7B2msdMmWK/zFEf3/+QD7wi
         TcwZ/eUqylYiDwoiQA1I110LcTnfD88Tqmfwt7RuljOcOxWdXVHHfKh+LmYQzJkNCzGe
         1neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erD2viJtloeLhrVUw8Su8xjseJyW7Af2nKs25MxP3Sk=;
        b=dfGmUnh2ISV4er4UWk88Mw7ogYv7/Y07iKOZEnQiv/6hp/Wr+2cD+sqFO2MnN76SL+
         lexne42rNCI/aDN3CCO8uMW9oa26rhfDhjVT0UScvpq6HblMLZ20eqWMwyvqBZRbeH8g
         SITvNkfLHXjNjH34T5x8ulWAdjuEUIgcNF0bFM2+DeSeXcLxDQCxlVNsX4RsLAV9UJ8c
         KHMLMOHpyBJmoyv6modQrVvKE1flyaQWkhsN+0+ehhROCZR752w2o+yUWzfbUguHDaZL
         nUS8FzQWtjpuw8UGZZurugvQPWvVm0t+xjJXctwIj9TSMyCF7VOvZScRBJv+ghphs/+k
         ax3w==
X-Gm-Message-State: APjAAAVgB5ZFI/Ij/XTlLGbytla5kW75vDZSGjW/GTy6GjqYZXfX2v+0
        WRK0iZP3wMULv/vOi62zeLU=
X-Google-Smtp-Source: APXvYqwGJISc4S2JeZSQ0TQKr0b6AldqMvh1sZJzU8K0cI+2qxXPVsmk1GZnm4rOhUhf7ItuOVhMdA==
X-Received: by 2002:a62:a50a:: with SMTP id v10mr3749263pfm.222.1575366567818;
        Tue, 03 Dec 2019 01:49:27 -0800 (PST)
Received: from localhost.localdomain ([103.231.91.74])
        by smtp.gmail.com with ESMTPSA id k29sm2918064pfh.104.2019.12.03.01.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 01:49:27 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        rdunlap@infradead.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH 1/2] Enlist running kernel modules information
Date:   Tue,  3 Dec 2019 15:18:45 +0530
Message-Id: <20191203094845.610692-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is new file to show running kernel modules list.One line bash
script.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/kernel_modules_info.sh | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 scripts/kernel_modules_info.sh

diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_info.sh
new file mode 100755
index 000000000000..f005c47a3aa6
--- /dev/null
+++ b/scripts/kernel_modules_info.sh
@@ -0,0 +1,23 @@
+#!/bin/bash - 
+#SPDX-License-Identifier: GPL-2.0
+#===============================================================================
+#
+#          FILE: kernel_modules_info.sh
+# 
+#         USAGE: ./kernel_modules_info.sh 
+# 
+#   DESCRIPTION:  Running kernel modules information.
+# 
+#       OPTIONS: ---
+#  REQUIREMENTS: awk
+#          BUGS: ---
+#         NOTES: ---
+#        AUTHOR: Bhaskar Chowdhury (https://about.me/unixbhaskar), unixbhaskar@gmail.com
+#  ORGANIZATION: Independent
+#       CREATED: 12/03/2019 13:52
+#      REVISION:  ---
+#===============================================================================
+
+set -o nounset                              # Treat unset variables as an error
+
+awk '{print $1}' "/proc/modules" | xargs modinfo | awk '/^(filename|desc|depends)/'
-- 
2.24.0

