Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75578978A0
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2019 13:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbfHULzA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Aug 2019 07:55:00 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:52809 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbfHULy7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 07:54:59 -0400
Received: by mail-vk1-f201.google.com with SMTP id x130so801150vkc.19
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Aug 2019 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1sx6hDgzysYx+a29qVca5WMwZUe5jwQTperKXSLoylQ=;
        b=fvP4kpUiTDeOAM1Gx+QPDOJ+dMuDSS2EU+Qf3xyjOeZ1OMqyw8S2HuNqh2L1WfFnyb
         FeuC5CdM6/SLWr3fXuzLfN/8wnAGLWDPu7LVvGoOAcIxSD/ZCRb+dLPdA7XEQlab+bcD
         10FikUlJGJgGRTmQ7H5rdPq+3Ws9GiVMKv0WH8ecmzrepmYI5SvoYMpqk/0G2MZJ2Q58
         ZAC4oNOREnbOnqUHwIlTlAV8DfKjgMSZjdwsEAjqFEzYLYjGgewYELH75tCcRkE02Okq
         SNn0SGfZCwXykWndLAViRVK3iAUJheJ3LxCLNvTj6xgKFU4AnKyYPnUHIgXI4mJ0uoYU
         gJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1sx6hDgzysYx+a29qVca5WMwZUe5jwQTperKXSLoylQ=;
        b=datz7T9dkocolTYgHcBJrePax7/NFQVZwRt8Hmj0XjBmF3NoPhcCPgMIrgcouFyRy1
         86etTawS4wb5fxPKfMo29q7omTRcHrfB50SRYotxxI0+tQFvpfbvtc2c2Tirdwd/ETFT
         WM9zPOtIe8XVKTVD+SvHQMbbXD4m35ZlO076y84OcnKfrqLif2kMee4J6W38BdHbz7Sn
         KwBt7sZiKvGT/c5X+18hW9eP9SxX6w1zScxwqS2RBN0fbNw1bpCyPEHF/IkYCH9hK3oq
         2F1DZtzIRAK3UlWdRL+9xVUoAFPQer6Efi/Ao+Gt1GiY1omQSPrMAl1QQe475Tamz1ke
         bvEA==
X-Gm-Message-State: APjAAAXrYgbG3U+kpo3M4MTuYqcWS7oUgWlDtOF9+HAzLiH8jdPJYYQX
        s44keRqLBcS2V4uFDiwnFO2NzCly1m8TkA==
X-Google-Smtp-Source: APXvYqz1klnI+JicjlHSILwVmAgCMBCf8uFMIPRpnQgichxAflgOYiv3BtroQsjhW4E4Xnf31qNvx8RZAloorw==
X-Received: by 2002:a1f:db01:: with SMTP id s1mr5441690vkg.34.1566388498141;
 Wed, 21 Aug 2019 04:54:58 -0700 (PDT)
Date:   Wed, 21 Aug 2019 12:49:24 +0100
In-Reply-To: <20190821114955.12788-1-maennich@google.com>
Message-Id: <20190821114955.12788-10-maennich@google.com>
Mime-Version: 1.0
References: <20190813121733.52480-1-maennich@google.com> <20190821114955.12788-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v3 09/11] usb-storage: remove single-use define for debugging
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
        jeyu@kernel.org, joel@joelfernandes.org,
        kstewart@linuxfoundation.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-modules@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, lucas.de.marchi@gmail.com,
        maco@android.com, maco@google.com, michal.lkml@markovi.net,
        mingo@redhat.com, oneukum@suse.com, pombredanne@nexb.com,
        sam@ravnborg.org, sspatil@google.com, stern@rowland.harvard.edu,
        tglx@linutronix.de, usb-storage@lists.one-eyed-alien.net,
        x86@kernel.org, yamada.masahiro@socionext.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

USB_STORAGE was defined as "usb-storage: " and used in a single location
as argument to printk. In order to be able to use the name
'USB_STORAGE', drop the definition and use the string directly for the
printk call.

Signed-off-by: Matthias Maennich <maennich@google.com>
---
 drivers/usb/storage/debug.h    | 2 --
 drivers/usb/storage/scsiglue.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/storage/debug.h b/drivers/usb/storage/debug.h
index 6d64f342f587..16ce06039a4d 100644
--- a/drivers/usb/storage/debug.h
+++ b/drivers/usb/storage/debug.h
@@ -29,8 +29,6 @@
 
 #include <linux/kernel.h>
 
-#define USB_STORAGE "usb-storage: "
-
 #ifdef CONFIG_USB_STORAGE_DEBUG
 void usb_stor_show_command(const struct us_data *us, struct scsi_cmnd *srb);
 void usb_stor_show_sense(const struct us_data *us, unsigned char key,
diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 05b80211290d..df4de8323eff 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -379,7 +379,7 @@ static int queuecommand_lck(struct scsi_cmnd *srb,
 
 	/* check for state-transition errors */
 	if (us->srb != NULL) {
-		printk(KERN_ERR USB_STORAGE "Error in %s: us->srb = %p\n",
+		printk(KERN_ERR "usb-storage: Error in %s: us->srb = %p\n",
 			__func__, us->srb);
 		return SCSI_MLQUEUE_HOST_BUSY;
 	}
-- 
2.23.0.rc1.153.gdeed80330f-goog

