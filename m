Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16E520A715
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 22:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405243AbgFYUvd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jun 2020 16:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405069AbgFYUvd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 16:51:33 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0574C08C5C1;
        Thu, 25 Jun 2020 13:51:32 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a1so7270653ejg.12;
        Thu, 25 Jun 2020 13:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:sender:resent-from:resent-date:resent-message-id
         :resent-to:from:to:cc:subject;
        bh=PJk1uqWKoUYUDWYFwioLyaf088HJRFL7Q5jCSZgGiYs=;
        b=dQoVOFPDDwcTw79n9jM52Iijw7bijdGH1KaKRDhqH3fnTllMpG/3WNKcjxfZ9/9cOA
         vaFuUq6gqsxZzPVFXJLLZdPB7+COA7iSGzneVKM5jkhnnZjYpSBKznG10yjb56nAM93H
         Wh4CZmAJWM9FTcIHPjuZ36nX0HPMrrrW/69saJbrrNjqSptHtJT6pRYT6/v/iHuSHTEf
         8H58LIpSOHzDkS2yEUK6oIErjx83HaRMbbk//V5NLDh923tT9/bl+6b+6RshpnNkajdW
         oCKMeiZpbjOvHAO2LPMmxzW59c8HcmgZBiVXsAG5hxbUYDcU6EMlRmlF2xPqzY9W8r8o
         VRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:sender:resent-from:resent-date
         :resent-message-id:resent-to:from:to:cc:subject;
        bh=PJk1uqWKoUYUDWYFwioLyaf088HJRFL7Q5jCSZgGiYs=;
        b=M9AC2pUP3yLI2AGYt4yOq1aWvuLt20E6ihwKJfmC7fo53l+pGHYoIYa8e5ReoWQ31o
         Wx6wm4vksF6qokFID9R7++jta3HSYhkSjXXwTGwRE9O6IWGPlqgxx0rzOWnPfF3Z9ZTl
         8mkgQ9+sAuaDzOH3yfJ5dcnouxIUQjhKIWcF1H4+tuuLzNRhFrnp6nWvtiiQ9ACuSgQO
         /EkRGI2OcfzdmKA5zsKeFyGiNjj3PZMzGdy3ZNDDgVonpjV+qU4lisd1W2gemYWe20Kp
         cjgnZ4jSG3RKMDlLzxki2MvBNmXvUq2G3vnPsd84vaTDRTy769LZYeIZrPl5f/b9txYI
         vdgQ==
X-Gm-Message-State: AOAM531/6PdUoXMTYDCpqOWqlHns3Di/Utx/PG7xQYiX/59eykJUBEl9
        AjPIHPem+QKl2BvS9vPYTS8=
X-Google-Smtp-Source: ABdhPJzVSnPp4BFlugJ8XxlnS3JGISkw/bjhE6bkdy7RhDY9kAhYAPf+4YQh9eHXvugSrECaQrF23w==
X-Received: by 2002:a17:907:20cf:: with SMTP id qq15mr30310431ejb.238.1593118291454;
        Thu, 25 Jun 2020 13:51:31 -0700 (PDT)
Received: from dumbo ([2a0b:f4c2::1])
        by smtp.gmail.com with ESMTPSA id bz14sm17461668ejc.100.2020.06.25.13.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 13:51:30 -0700 (PDT)
Message-ID: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
Date:   Thu, 25 Jun 2020 13:51:30 -0700 (PDT)
Received: from cavok by dumbo with local (Exim 4.92)
        (envelope-from <cavok@dumbo>)
        id 1joYqF-0004F9-2F; Thu, 25 Jun 2020 22:51:27 +0200
From:   Domenico Andreoli <domenico.andreoli@linux.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Domenico Andreoli <domenico.andreoli@linux.com>

Make 'make tar-pkg' install dtbs on arm64.

Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>

v2:
 - Destination path includes the kernel version, as expected

---
 scripts/package/buildtar |    9 +++++++++
 1 file changed, 9 insertions(+)

Index: b/scripts/package/buildtar
===================================================================
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -125,6 +125,15 @@ case "${ARCH}" in
 		;;
 esac
 
+#
+# Install dtbs
+#
+case "${ARCH}" in
+	arm64)
+		make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
+		;;
+esac
+
 if [ "${1}" = dir-pkg ]; then
 	echo "Kernel tree successfully created in $tmpdir"
 	exit 0

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
