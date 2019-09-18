Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA9AB6093
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2019 11:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfIRJoi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Sep 2019 05:44:38 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42522 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfIRJoi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Sep 2019 05:44:38 -0400
Received: by mail-wr1-f65.google.com with SMTP id n14so5268997wrw.9;
        Wed, 18 Sep 2019 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v8YSQLFy7mi0y7GPIl5MMvWVppKyDodjvZc0MIFH8E8=;
        b=n8C5E2rWnglaX5nCXksoDHQCq1NAX+PgfC7glCxBe5jC59VjBNbXeK+kNenXeEMkjO
         luY0AAropdWXhPSA6Gbes7FHMW80iFF1htllfawIr6TqOyTKwh7v5k2evvVXtMyp3Wu/
         yBmkEP4vyUAkAfEjvWeEQaIGfAsX+bg5Bvhv3eNOHd2RIB3YK+eBmL9QIWeRYV+rcrPg
         FUiThL90az14LREiFMF++v0WR06hQkmsOP2fQ9NyZfpPeBQqZWdB6+u1Ns5ytDmWDBnf
         TzydNmqM1R6CVS4leCy6VR9vQDk2Nx/TsWCS6jBV2GWmjYq/dHZAYkmyYr0iJWSGu4lZ
         fuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v8YSQLFy7mi0y7GPIl5MMvWVppKyDodjvZc0MIFH8E8=;
        b=OcNSZvO33NrOMBoBy8F30mmqSE4DJzhwpG1xZ0sVNoBn/p6mChMPVR86PC5/GBHqB5
         ScSiU0Sg6nxYvpKSNH1Tbt5dmR5ys28IFL7wssQgJvYj8QjrBGw7E00oiJW9wg7uq0w4
         spUaJFyy95vLvN8JdaJUPSvfKmdbSHQdNjSrwzZWLRwg/ih5FgjPO41JUQy04INKo0s6
         1qwK+WN4FUA4wvkztjfIRuf9t1FeNE1LC1ig5S/xa3r/gVcIIYUtTZyJ9U3QmZQ1W5WI
         b9wI2Q7w943nBVYa7bNRPhRLV8zDNvg2dWyakksWlYa0Mav+x3QCv4Tsog4Wwcb+ydyR
         pE0Q==
X-Gm-Message-State: APjAAAXuOiZ6SR+KAW1ZsEmqkVD2k2tXcG/8YLkMGQVxKkWrDgoNIX/x
        GKALngdj0dIf7K8LdozMDZmWHA68REdt0Q==
X-Google-Smtp-Source: APXvYqwU5IdvzFQBkU7pqi4Mu8QuW9BHd4yE9S2clgrCKiq64M+0O0QIg1AmPlgJd/Ys2x0VKdz9XQ==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr2122745wrw.73.1568799876364;
        Wed, 18 Sep 2019 02:44:36 -0700 (PDT)
Received: from t1700.criteois.lan ([91.199.242.236])
        by smtp.gmail.com with ESMTPSA id t8sm3776341wrx.76.2019.09.18.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 02:44:35 -0700 (PDT)
From:   Erwan Velu <erwanaliasr1@gmail.com>
X-Google-Original-From: Erwan Velu <e.velu@criteo.com>
Cc:     Erwan Velu <e.velu@criteo.com>, Jean Delvare <jdelvare@suse.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Changbin Du <changbin.du@intel.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        "Robert P. J. Day" <rpjday@crashcourse.ca>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 1/3] firmware/dmi_scan: Add dmi_save_release to save releases fields
Date:   Wed, 18 Sep 2019 11:43:19 +0200
Message-Id: <20190918094323.17515-1-e.velu@criteo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In DMI type 0, there is several fields that encodes a release.
The dmi_save_release() function have the logic to check if the field is valid.
If so, it reports the actual value.

Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 drivers/firmware/dmi_scan.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 35ed56b9c34f..202bd2c69d0f 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -181,6 +181,32 @@ static void __init dmi_save_ident(const struct dmi_header *dm, int slot,
 	dmi_ident[slot] = p;
 }
 
+static void __init dmi_save_release(const struct dmi_header *dm, int slot,
+		int index)
+{
+	const u8 *d;
+	char *s;
+
+	// If the table doesn't have the field, let's return
+	if (dmi_ident[slot] || dm->length < index)
+		return;
+
+	d = (u8 *) dm + index;
+
+	// As per the specification,
+	// if the system doesn't have the field, the value is FF
+	if (d[0] == 0xFF)
+		return;
+
+	s = dmi_alloc(4);
+	if (!s)
+		return;
+
+	sprintf(s, "%u", d[0]);
+
+	dmi_ident[slot] = s;
+}
+
 static void __init dmi_save_uuid(const struct dmi_header *dm, int slot,
 		int index)
 {
-- 
2.21.0

