Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8814E86D3A
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2019 00:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404619AbfHHW1a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 18:27:30 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:52328 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404609AbfHHW1a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 18:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=d61aNlsNAczZfW/vM9aiAOBf4WQPDAD1R+a+T4+MUf8=; b=TGiCIOV+g0O4VY4o0IKK7Ew2t
        zK6PA8Tp3+hMzjFPPTe5lreJ92doJec3Pqr0t1iMUbC6xIaeuyoijadOErRHAzYU4hfMny3mwcHSu
        DTNcZm1jRhAIuRDrPNvWtxxh+bR1DKFUBpQsakfsAc2G6Y6tFVBbOo4JriIt4evW4NR8Y=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hvqsX-0004EB-Vg; Thu, 08 Aug 2019 22:27:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 6F9662742BDD; Thu,  8 Aug 2019 23:27:25 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH] merge_config.sh: Check error codes from make
Date:   Thu,  8 Aug 2019 23:27:05 +0100
Message-Id: <20190808222705.35973-1-broonie@kernel.org>
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

Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 scripts/kconfig/merge_config.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index d924c51d28b7..96e960dce968 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -14,9 +14,10 @@
 #  Copyright 2011 Linaro
 
 clean_up() {
+	RET=$1
 	rm -f $TMP_FILE
 	rm -f $MERGE_FILE
-	exit
+	exit ${RET}
 }
 trap clean_up HUP INT TERM
 
@@ -171,6 +172,10 @@ fi
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
 make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+RET=$?
+if [ "$RET" != "0" ]; then
+	clean_up $RET
+fi
 
 
 # Check all specified config values took (might have missed-dependency issues)
-- 
2.20.1

