Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFBAB1607C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 02:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgBQB2I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Feb 2020 20:28:08 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:24959 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgBQB2H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Feb 2020 20:28:07 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 01H1Rgfc021181;
        Mon, 17 Feb 2020 10:27:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 01H1Rgfc021181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581902863;
        bh=npiBDu1sgUOXM3tc4L5AL9NAyEO74A69RwtfAvLKdWg=;
        h=From:To:Cc:Subject:Date:From;
        b=L84dy2QT3OSNyynoKAFCJlevvo79hSm4xP0K/lyfZKHP0iF77MJcMLxDZLHDE4nog
         jEF3cFfPprieoPHf1+/39YfwhQoG90hcSDkcB2iMTMywmTCXG+zyqj0jmwyXjB/YHV
         KWMQG5WQ6HN3II/HZP2++TMkKLuSYFWlK4Q3dE5nuVRjVnumigQ30WtYAg6A2a1s/i
         vTSDw+8JxCJrH5FjehyCb+AZORH5rNd4YwK9UCoTcN5lp6/GJQfR/EpMbBOmTpaUJY
         MbvqD3sRGkKcpl6WP4dFdSPxJoNxRS4vNolfpZTKiPY1SaECvtwqA8B/1JkWVNvOc2
         ZDpTYE2+CN8+g==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kconfig: remove unused variable in qconf.cc
Date:   Mon, 17 Feb 2020 10:27:40 +0900
Message-Id: <20200217012741.22100-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If this file were compiled with -Wall, the following warning would be
reported:

scripts/kconfig/qconf.cc:312:6: warning: unused variable ‘i’ [-Wunused-variable]
  int i;
      ^

The commit prepares to turn on -Wall for host programs written in C++.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 82773cc35d35..50a5245d87bb 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -309,8 +309,6 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	  showName(false), showRange(false), showData(false), mode(singleMode), optMode(normalOpt),
 	  rootEntry(0), headerPopup(0)
 {
-	int i;
-
 	setObjectName(name);
 	setSortingEnabled(false);
 	setRootIsDecorated(true);
-- 
2.17.1

