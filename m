Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65F0E287F12
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Oct 2020 01:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730809AbgJHXZQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Oct 2020 19:25:16 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:34014 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730206AbgJHXZQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Oct 2020 19:25:16 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 098NOF8l067270;
        Thu, 8 Oct 2020 23:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=nZnWsiDFEcPgQ5B79nIlPz4Zz2ktxkZud96KgKbHQLw=;
 b=oWgkus4VuCsFXS/7NnKOK/q5NxnzspOoazFY7ub40NTnUqaCzr3IRxOMJi4dN8XfQ0ZY
 XQToF863lZyuH2KmXfqEaG3v7ADxZHcr51Z62TtqMMUTt2ExjTERmAIoH84NPuEmqagk
 ODqkDVu+RrQjHqv/W2diF/5Tvs1GnNwfVrqEWQ7xUCUHZBokSkeEEjBl0VH0ZwLeHbgI
 VIeo1E03Huc4OhrPuCFF1O7kWpnBipADE6WMpOwhq9KiI+1wXbComaD6TmUwH0+KbDho
 WHLzSA3DjEKXunR23qkyoFWSowSauPmXS09xJHbq3PuA0ofmg2WoNOPwu0SxC7NwQ19t GQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 3429jurrt5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 08 Oct 2020 23:25:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 098NLNhS113561;
        Thu, 8 Oct 2020 23:25:13 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 3429kk4hsb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Oct 2020 23:25:13 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 098NPBw4032394;
        Thu, 8 Oct 2020 23:25:11 GMT
Received: from toshiba-tecra.attlocal.net (/10.159.157.36)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 08 Oct 2020 16:25:11 -0700
From:   Victor Erminpour <victor.erminpour@oracle.com>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] merge_config.sh: Add switch to specify ARCH variable
Date:   Thu,  8 Oct 2020 16:26:28 -0700
Message-Id: <1602199588-24468-1-git-send-email-victor.erminpour@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9768 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 mlxlogscore=913
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010080164
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9768 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=928 mlxscore=0
 phishscore=0 bulkscore=0 suspectscore=1 lowpriorityscore=0 spamscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010080164
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add a switch to merge_config.sh to specify the ARCH variable
which defines the target architecture.

Set x86 as the default architecture.

Signed-off-by: Victor Erminpour <victor.erminpour@oracle.com>
---
 scripts/kconfig/merge_config.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 63c8565206a4..b7a687f093f0 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -22,6 +22,7 @@ clean_up() {
 
 usage() {
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
+	echo "  -a    set ARCH variable to define the target architecture"
 	echo "  -h    display this help text"
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
@@ -34,6 +35,7 @@ usage() {
 
 RUNMAKE=true
 ALLTARGET=alldefconfig
+ARCH=x86
 WARNREDUN=false
 BUILTIN=false
 OUTPUT=.
@@ -46,6 +48,11 @@ while true; do
 		shift
 		continue
 		;;
+	"-a")
+		ARCH=$2
+		shift 2
+		continue
+		;;
 	"-m")
 		RUNMAKE=false
 		shift
@@ -172,7 +179,7 @@ fi
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
-make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+make ARCH=$ARCH KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
-- 
1.8.3.1

