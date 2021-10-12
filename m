Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D1442AA34
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 19:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhJLRDm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 13:03:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31084 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229809AbhJLRDl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 13:03:41 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CGnlMN002244;
        Tue, 12 Oct 2021 17:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2021-07-09; bh=6veSk99HxQgmjBT/UZO+0hBsFi1yDSv30FUdVvV4CDg=;
 b=aSfHRnPz6iW31uRVvMVeGCmdBmmvdwaplnP7NpjCKzccr4+nsxEXmNLpvqPES0nRLbfB
 6wgk4cGO6EGGYUEFa4Fp6VVNwqzKPqVXVFCfMziQ/Gzjuw1VsEChIMsXBq9pIx8Gkmr0
 SVNWAXl1+Nsr6Q51kBaeuGudqGYU1THr5GjAObOtj5rTtiPfDQ4Jcz5L9Jhkj00BnMnP
 1Ox18UaSFieeXlVvGjXhwwKlHMq5J3HeT6pbVVo0Yqd47sbk10uH9xX5AnV/SQcKpImY
 RCGNHMIzIB/KpkzYVJqxH4fwVmR4dph8aOAWR17bJ+LSbsrfLR+z9UWDmV9Aa1irz4qh 3Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bmv41q939-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 17:01:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19CH0lbC190539;
        Tue, 12 Oct 2021 17:01:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 3bmadybb9v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Oct 2021 17:01:35 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 19CH1YvI195343;
        Tue, 12 Oct 2021 17:01:34 GMT
Received: from t460.home (dhcp-10-175-26-251.vpn.oracle.com [10.175.26.251])
        by aserp3020.oracle.com with ESMTP id 3bmadybb7t-1;
        Tue, 12 Oct 2021 17:01:34 +0000
From:   Vegard Nossum <vegard.nossum@oracle.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [RFC PATCH] kbuild: only prompt for compressors that are actually usable
Date:   Tue, 12 Oct 2021 19:01:21 +0200
Message-Id: <20211012170121.31549-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.23.0.718.g5ad94255a8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8XxayucKHSXD_e4YhlOB7bxhTudqel2x
X-Proofpoint-GUID: 8XxayucKHSXD_e4YhlOB7bxhTudqel2x
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If a given compression algorithm for the kernel image is not usable on
the host system, there is no point prompting for it.

We can use the kconfig preprocessing feature to check if the command is
available or not. I've chosen to test this using "which", which exits
with success if the given command exists in PATH (or it is an absolute
path), which mimics exactly how it would be found in the kernel's
Makefiles.

This uses the make variables that are set in Makefile and/or the
command line, so you can do e.g.

  make KGZIP=pigz menuconfig

and it will test for the correct program.

I am intentionally adding these dependencies to e.g. KERNEL_LZ4, as
opposed to HAVE_KERNEL_LZ4, since the latter are "select"-ed
unconditionally by the architectures that use them, so they are not
suitable for depending on anything else.

I've put RFC in the subject as maybe there are downsides to this that
I'm not aware of.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 init/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 11f8a845f259d..f03f2b7962027 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -250,6 +250,7 @@ choice
 config KERNEL_GZIP
 	bool "Gzip"
 	depends on HAVE_KERNEL_GZIP
+	depends on $(success,which $(KGZIP))
 	help
 	  The old and tried gzip compression. It provides a good balance
 	  between compression ratio and decompression speed.
@@ -257,6 +258,7 @@ config KERNEL_GZIP
 config KERNEL_BZIP2
 	bool "Bzip2"
 	depends on HAVE_KERNEL_BZIP2
+	depends on $(success,which $(KBZIP2))
 	help
 	  Its compression ratio and speed is intermediate.
 	  Decompression speed is slowest among the choices.  The kernel
@@ -267,6 +269,7 @@ config KERNEL_BZIP2
 config KERNEL_LZMA
 	bool "LZMA"
 	depends on HAVE_KERNEL_LZMA
+	depends on $(success,which $(LZMA))
 	help
 	  This compression algorithm's ratio is best.  Decompression speed
 	  is between gzip and bzip2.  Compression is slowest.
@@ -275,6 +278,7 @@ config KERNEL_LZMA
 config KERNEL_XZ
 	bool "XZ"
 	depends on HAVE_KERNEL_XZ
+	depends on $(success,which $(XZ))
 	help
 	  XZ uses the LZMA2 algorithm and instruction set specific
 	  BCJ filters which can improve compression ratio of executable
@@ -290,6 +294,7 @@ config KERNEL_XZ
 config KERNEL_LZO
 	bool "LZO"
 	depends on HAVE_KERNEL_LZO
+	depends on $(success,which $(KLZOP))
 	help
 	  Its compression ratio is the poorest among the choices. The kernel
 	  size is about 10% bigger than gzip; however its speed
@@ -298,6 +303,7 @@ config KERNEL_LZO
 config KERNEL_LZ4
 	bool "LZ4"
 	depends on HAVE_KERNEL_LZ4
+	depends on $(success,which $(LZ4))
 	help
 	  LZ4 is an LZ77-type compressor with a fixed, byte-oriented encoding.
 	  A preliminary version of LZ4 de/compression tool is available at
@@ -310,6 +316,7 @@ config KERNEL_LZ4
 config KERNEL_ZSTD
 	bool "ZSTD"
 	depends on HAVE_KERNEL_ZSTD
+	depends on $(success,which $(ZSTD))
 	help
 	  ZSTD is a compression algorithm targeting intermediate compression
 	  with fast decompression speed. It will compress better than GZIP and
-- 
2.23.0.718.g5ad94255a8

