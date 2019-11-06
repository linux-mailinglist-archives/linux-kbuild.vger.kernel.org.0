Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8743DF0D1B
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 04:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfKFDgr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 22:36:47 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37855 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfKFDgr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 22:36:47 -0500
Received: by mail-pf1-f196.google.com with SMTP id p24so11271592pfn.4;
        Tue, 05 Nov 2019 19:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pTTWawkDHrL/VbTuhJkLaMCYfHyS01RsimwVc/8Fqc8=;
        b=KwRMz8IFmhaN5TMsA5qegDtYyWTn1AA0odiZsGqtRBIEYPJY6F9Bo0/zI7sWjbkWHw
         RP7x4SYbbUjjJnAeiy+pfnYErcd9Jq5QF+A1MP+XT1OWyv3qaArroNiOlfaEmCaqFFmW
         BS0VPmZFr+93amdf023g/KdB679Xb1McoNieHrq/oByxJiZz9RwMMe8GoLLi0ICYqCB9
         We5rCCCYB0IX7y1jdDe/o3fhm04hCMP3FB1iVOaFdMgzmGy9kUnLtDUcYNpK3T+7jK7m
         uvRWU0lhvTuRf+HEsACEwA46jck1N+Oz4016Df7lRGb2DJMi8OeKWr/b+0ignJJhuX0V
         rLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pTTWawkDHrL/VbTuhJkLaMCYfHyS01RsimwVc/8Fqc8=;
        b=ocmGKVPq6kJ9g/bIJz2OEkNt1NocOYnBIfs8NE953ApR9z4ibiX5VZIaPv9MJDs67Y
         bv1/MRHj6+UM9p1erhdkzUXRWItHG5vADNm3vhR0YT9vllRgE89pHEkItNVOVVeY9oyn
         ZmWc6U9W57TknJnNK559afcjehCXm6EnpzivpzpCYrY6S1x4i7x98d33YojaMLIFBqUY
         bdY2c3mfnKrAtjCj0vuOfd/WsQrPmQcaeVh2aH44usHRKi86Fa+7RM3CtM+v2n6AFjUP
         VXrC5dylHDyJQeuv4S6BtBC9BwYKl3QGqHEJiwxc3PB1XvO0Q1+fycRayQqm5RpHYjFt
         yfBQ==
X-Gm-Message-State: APjAAAUA0uEKvco0AtvtNgENz1zDa5ArI4XDRJEhi39ePvVGEIloxqpV
        0K27Hakh7VdwPh5bJDKUyw0=
X-Google-Smtp-Source: APXvYqzjhMGnKcng8LbH4bPZfxojruAouhsbekLOoz1EcB5TABF3PmKeVV54uPqjaRekbwljrbAREQ==
X-Received: by 2002:a63:8f46:: with SMTP id r6mr307595pgn.51.1573011406752;
        Tue, 05 Nov 2019 19:36:46 -0800 (PST)
Received: from Gentoo.localdomain ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id f33sm20597425pgl.33.2019.11.05.19.36.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 19:36:46 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     alexander.kapshuk@gmail.com
Cc:     rdunlap@infradead.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH]scripts:ver_linux:Added Bison and Flex to the checklist
Date:   Wed,  6 Nov 2019 09:06:10 +0530
Message-Id: <20191106033610.29841-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As Masahiro pointed out ,only add Bison and Flex to the checklist.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/ver_linux | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/ver_linux b/scripts/ver_linux
index 810e608baa24..85005d6b7f10 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -32,6 +32,8 @@ BEGIN {
 	printversion("PPP", version("pppd --version"))
 	printversion("Isdn4k-utils", version("isdnctrl"))
 	printversion("Nfs-utils", version("showmount --version"))
+	printversion("Bison", version("bison --version"))
+	printversion("Flex", version("flex --version"))
 
 	while (getline <"/proc/self/maps" > 0) {
 		if (/libc.*\.so$/) {
-- 
2.23.0

