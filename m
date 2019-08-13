Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E23F58B86D
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 14:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbfHMMUN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 08:20:13 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:57094 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbfHMMT6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 08:19:58 -0400
Received: by mail-qt1-f202.google.com with SMTP id j10so17431248qtl.23
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 05:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1sx6hDgzysYx+a29qVca5WMwZUe5jwQTperKXSLoylQ=;
        b=Ev/tJDUdex0/lv/JEzhxy+49zAkreP6Jg29SndWS5FWZ830Oi1JZSSRe6lp9IrWOaH
         6Y3lgB/2sWKhybFHj3qjhywMystAxoTkuz47QmpUTVjzEPHZ1B/W01+B0ocg5FEHcqhy
         dqZgHcQ0db3rTby/urgNTYN2GhCDoaM3pbXCwRhT8ijr7jEhVYAnAX+PTXEd0AWwBUE4
         gHqeqaiQuCjuP6So/ndbq6iDBndo4FGwp7iSG4AayhQaOObt1T+F3tLAdFEBSwAvCbk6
         IV9N1j3fjk7oDLSc77o4LYwVb6/yy0myZelAKaLZ/iMGgbcy9AtCX+KchP5vb3ypKiyL
         /fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1sx6hDgzysYx+a29qVca5WMwZUe5jwQTperKXSLoylQ=;
        b=BmjrO7q+Kgi2KkYNVaSVk9llOCNlH/UVr/HAwlsrDBRB19nIuxAnDTGH/jcZip5Q2I
         JmVjD76fVMfehJuP44tudiAUrShFk383daquCivJfjx9NzZfwkTA8vhYIn7T/N5aoWSF
         1cIKEzxiCubEQ/Nl6X1yuw21oGMyI32yOUBdJFWleF9MysxrzarPIAV9wp2TQx8JrPGJ
         PJwqkBYt9J7p8rRWPzBgRTPFu2YlBSYtFsPjFIxw44ugsvq+kdvDB2tvYDI+2UP71q0K
         sREZuU3/QPowtgRKWE2/L7vqNju1YgvmwY7xMWRfXkAq7/p6crVfJXwDGzzVKzRyw0cN
         cZ5A==
X-Gm-Message-State: APjAAAWeQfIQgAjXocit4nVxkwP8QJ9d4/z7X3TUgsXqoyYtauhifpjf
        ADYGK5/xGt2hnBbH9uVQ55JC9KskcnfdMQ==
X-Google-Smtp-Source: APXvYqy7XJLCyeK2FSU9zmscKN5oO6sUvybZKuEqJl11qIfRvRwWVPlen7osQbA/oOuqUN0PwQXDX7FNDxzX0g==
X-Received: by 2002:ad4:5242:: with SMTP id s2mr3907894qvq.129.1565698796953;
 Tue, 13 Aug 2019 05:19:56 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:17:06 +0100
In-Reply-To: <20190813121733.52480-1-maennich@google.com>
Message-Id: <20190813121733.52480-10-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190813121733.52480-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v2 09/10] usb-storage: remove single-use define for debugging
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org, maco@android.com
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
        jeyu@kernel.org, joel@joelfernandes.org,
        kstewart@linuxfoundation.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-modules@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, lucas.de.marchi@gmail.com,
        maco@google.com, michal.lkml@markovi.net, mingo@redhat.com,
        oneukum@suse.com, pombredanne@nexb.com, sam@ravnborg.org,
        sboyd@codeaurora.org, sspatil@google.com,
        stern@rowland.harvard.edu, tglx@linutronix.de,
        usb-storage@lists.one-eyed-alien.net, x86@kernel.org,
        yamada.masahiro@socionext.com
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

