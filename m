Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3296E1982FA
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2020 20:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgC3SHP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Mar 2020 14:07:15 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:34255 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgC3SHP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 14:07:15 -0400
Received: by mail-il1-f193.google.com with SMTP id t11so16794088ils.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2020 11:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ppT7F7qNchzvH1R+rW214qqRYLN3C8FBeBsX6qASJ8=;
        b=E7SHscRpJDreN5AQuBS8iLe+I2YBFQtfo9LtAMmQ4nJ1uroPl1RuQzX4PPH8ZhBars
         SMBngiLizr+pyJpE7G9838ffAHtRTGXBDQkS6+ouG1Rxd1EdgQT6cylC8sJBhIORBpBi
         XT/fO3QFGfclRkZ4WJFOEX7sPfuvE3hLzgm60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ppT7F7qNchzvH1R+rW214qqRYLN3C8FBeBsX6qASJ8=;
        b=fHTtevqxvUvV8HGrhXe87ueaIFX4OgA8+Sbgkz7mF3lzZASunSCvzTuipYVimUyZ6O
         2lSNWgthSgJz1ozQkinPVeanq7T/9acI6Yh05feBqvKnRRLiPA60cq/cuv6GX4Srq8y8
         nUFSR9HXPF2wGKeMCMdYKW4UUGOlI8L3XhgIFKcLJEtqShK+ZWbmam2uEWrflhzO+FEI
         ReD9I9Qw8sQtn1xUkUkYh+F8YMRL6Ppr562z0ZJpFbRdeduZIBV8WwzSGcTC3fYr9VDB
         2feMDNqFwUmh07VTibqYwUiAhS4l/CM6Mly7AwHTpw8dEFRPnyIM+MNpZQNPm+yDW9u1
         6XDA==
X-Gm-Message-State: ANhLgQ1UydtvKHQFOofl+qTwGmfPwBkRXq74H7fufE9/UDLSY8NQ0FiK
        x2FLFwHI4QVeDHolJJSUY0d3OQ==
X-Google-Smtp-Source: ADFU+vsI3tfecxVgn4jxAb7dkMJJg/4u0XS6Gu2SnEAcEHrslsOrRTCgKhIeKNkS/z+S3BayN8PGnw==
X-Received: by 2002:a92:af53:: with SMTP id n80mr12720393ili.42.1585591634260;
        Mon, 30 Mar 2020 11:07:14 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 8sm4375809ion.33.2020.03.30.11.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 11:07:13 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH] Makefile: Update kselftest help information
Date:   Mon, 30 Mar 2020 12:07:11 -0600
Message-Id: <20200330180711.14393-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Update kselftest help information.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Makefile | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index e56bf7ef182d..5e5c770423c7 100644
--- a/Makefile
+++ b/Makefile
@@ -1470,12 +1470,15 @@ help:
 	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
 	@echo  ''
 	@echo  'Kernel selftest:'
-	@echo  '  kselftest       - Build and run kernel selftest (run as root)'
-	@echo  '                    Build, install, and boot kernel before'
-	@echo  '                    running kselftest on it'
-	@echo  '  kselftest-clean - Remove all generated kselftest files'
-	@echo  '  kselftest-merge - Merge all the config dependencies of kselftest to existing'
-	@echo  '                    .config.'
+	@echo  '  kselftest         - Build and run kernel selftest'
+	@echo  '                      Build, install, and boot kernel before'
+	@echo  '                      running kselftest on it'
+	@echo  '                      Run as root for full coverage'
+	@echo  '  kselftest-all     - Build kernel selftest'
+	@echo  '  kselftest-install - Build and install kernel selftest'
+	@echo  '  kselftest-clean   - Remove all generated kselftest files'
+	@echo  '  kselftest-merge   - Merge all the config dependencies of'
+	@echo  '		      kselftest to existing .config.'
 	@echo  ''
 	@$(if $(dtstree), \
 		echo 'Devicetree:'; \
-- 
2.20.1

