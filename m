Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E86E94EB0
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 22:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbfHSUG6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 16:06:58 -0400
Received: from mail-wm1-f97.google.com ([209.85.128.97]:51386 "EHLO
        mail-wm1-f97.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbfHSUG5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 16:06:57 -0400
Received: by mail-wm1-f97.google.com with SMTP id k1so359195wmi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2019 13:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FgIxKoIsQoXNZe/y1pySQAz1KVR8mwuWigj8Pby/9nU=;
        b=jGicaR+TuqZI4HVhMzFnxtNbFzBOh2LKg4KAVUSemLItirqiDY2dugQ/Gy5ShYBBhg
         kuPA6cX8J661IfvzZvbdg0kINtdhm8wDG8RbwmpWXW3XTSIXb5s5bxKoCsd/7/jwDX9C
         mOepsZZoa2rDrE0bRbnCzWGCsRemp/TrKHKiB3FsIpcU0s15ZzNHhk5uNfCyhi0qvtcp
         OV1chqwPN0zjGgwbs/XvC82/EUsMjmL/l3i0sv/oM1OeAXbsHvpcnIcx6cRDWo89SSMT
         g99XiJyWpZWPXD6VpggltjFoWFTg/xjvSzNiYIpeUtZmOAieZdMnIn/GcLyjcDiA4Wu8
         uMcw==
X-Gm-Message-State: APjAAAXV1WBCt0miG0x9tSvgMgsSr4YSPlBcqzGnoLvGhRQiZ1knRs37
        e3G4vooq8yZKyB0A7LbdsQz2KshsW538ZiyuPmfOZH5wj9ZJe8hUdQ7ljaB7x7F/Ew==
X-Google-Smtp-Source: APXvYqywrL6kptN8K+Gh1ua8PZU6yjRQ8ykndVKgTUhOsgCWLbNDn/Ia1WWslE9Xc+ZE91GohtwDiMUGGysA
X-Received: by 2002:a1c:c1c1:: with SMTP id r184mr22036371wmf.9.1566245215772;
        Mon, 19 Aug 2019 13:06:55 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk. [2a01:7e01::f03c:91ff:fed4:a3b6])
        by smtp-relay.gmail.com with ESMTPS id z7sm248136wrl.24.2019.08.19.13.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:06:55 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hznvb-0006eC-Hd; Mon, 19 Aug 2019 20:06:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 85D6F274314C; Mon, 19 Aug 2019 21:06:54 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] merge_config.sh: Check error codes from make
Date:   Mon, 19 Aug 2019 21:06:50 +0100
Message-Id: <20190819200650.18156-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When we execute make after merging the configurations we ignore any
errors it produces causing whatever is running merge_config.sh to be
unaware of any failures.  This issue was noticed by Guillaume Tucker
while looking at problems with testing of clang only builds in KernelCI
which caused Kbuild to be unable to find a working host compiler.

This implementation was suggested by Yamada-san.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 scripts/kconfig/merge_config.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index d924c51d28b7..bec246719aea 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -13,12 +13,12 @@
 #  Copyright (c) 2009-2010 Wind River Systems, Inc.
 #  Copyright 2011 Linaro
 
+set -e
+
 clean_up() {
 	rm -f $TMP_FILE
 	rm -f $MERGE_FILE
-	exit
 }
-trap clean_up HUP INT TERM
 
 usage() {
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
@@ -110,6 +110,9 @@ TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
+
+trap clean_up EXIT
+
 cat $INITFILE > $TMP_FILE
 
 # Merge files, printing warnings on overridden values
@@ -155,7 +158,6 @@ if [ "$RUNMAKE" = "false" ]; then
 	echo "#"
 	echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
 	echo "#"
-	clean_up
 	exit
 fi
 
@@ -185,5 +187,3 @@ for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
 		echo ""
 	fi
 done
-
-clean_up
-- 
2.20.1

