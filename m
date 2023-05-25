Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED300710BEC
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 May 2023 14:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240576AbjEYMVA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 May 2023 08:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233263AbjEYMU7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 May 2023 08:20:59 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn2028.outbound.protection.outlook.com [40.92.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5382A189
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 05:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSApx17VEnMN8WktLkvaeYNHhs9XeFpl5S6VT+zp+J3ujgcwwPzFs6tDhMGiFMZA3ySMr5W5BmiQl6qQZUz2GIGLe16sK9ojv2wVdMelgJNtHONo/FuUbVYGtINz0AKLCb+K0e/y8nfhfHxx84iy9zEnX9gKY9b0fdw2Cjzl8VAilYzY7mMlD5I8uExD1+nAo/F9ynuYfmz/V5zdyMOxEv3OVJn7oADO2FEJ1cpjqa9MWD4LqbCCjch0SG1m7D49MGKfkQdiV8dHiCPsqIqLduPWrR3kbAJWjNFza9tEYWElMSOqvOmusy/RcUIvMOnbMaRnlwxoYPtwTOmnL8F5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wsU6m0yN1jTFw+hjGvbzCnmpRoiOqwSTmL1J5o1OTM=;
 b=mITcoUM4AN5N8xVnqVt/6ES1JkZdLA5xJr9mCN/4LkD9+KitF5haGWbUML98+Beovip8g4IjhNqHjdGOGjq24grS1uihQn9lei+rJJHclv9vuaPpdk8Ne9Y31w0Wx21qX8oQmsNGN2ORwPS1Bt96RQHSSbydt2XLdKGGyb8hsKETZtjJkAEygpLmlxUGPXf93467iNYtbVR8/MIez+Tvm7lYsgcBObm9Plr4zthgUfPmgWKygkv28qiL27ooQ6T/h2F7CbVLrU2Ss1qnWyPA6A80R88NKd7dE0YzuIYxvK6YWjYp+47vRatFwoZTiPDdbvuF/Sb7WL0DfsTzZLEC6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wsU6m0yN1jTFw+hjGvbzCnmpRoiOqwSTmL1J5o1OTM=;
 b=gMjAidOzbfLrsDct30IcpzHKulFv4cmh4mTW/KqD2dCyjVZbTtRN0wjeBmMBSiNA4ao63KaoE1cHNBT/ac8EGdr9PyAGHHjSZxqvVfkoqEfMxBLm6jzPBrQesxORB9ukpr8Ud+XCJVS2YtXxd+aD7F4KBWKZdrkkrFcAYJZsZs3Uim57e/oxWSniyr9o/hYil6oUalgiNwV98XwbgZUN3aP6qsf8DPnirLl8qds2BRfdlsR006MrevQ6m5+EXJ49hqBMmoCaF1dQDD4ouHqRze+Ikyj7o38rlbuqVl1ZCL6YHDklWkV4sBhivnuyFfcVUJxLCTui7l8G/NotMA6j/g==
Received: from OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:180::6)
 by TYCP286MB1610.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:183::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 12:20:55 +0000
Received: from OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b4f8:4693:7f59:55db]) by OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b4f8:4693:7f59:55db%7]) with mapi id 15.20.6411.029; Thu, 25 May 2023
 12:20:55 +0000
From:   Hu Weiwen <huww98@outlook.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Hu Weiwen <huww98@outlook.com>
Subject: [PATCH v2] gen_compile_commands: include targets not ending with .o
Date:   Thu, 25 May 2023 20:20:03 +0800
Message-ID: <OSZP286MB20611C35BF36F4EB69FD3DF6C0469@OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [w0NVy0w2gu9+A8sK+wqyel0nBL6+ENQx]
X-ClientProxiedBy: SGBP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::18)
 To OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:180::6)
X-Microsoft-Original-Message-ID: <20230525122003.6122-1-huww98@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSZP286MB2061:EE_|TYCP286MB1610:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a29ca4-8414-4885-3576-08db5d1a7c89
X-MS-Exchange-SLBlob-MailProps: EgT5Wr3QDKxl1qg+92OPC7eRkgV6gGlHRrh7VZQj1DzV78yrdurG5XpLSmMtEyPyfsN1Rr47Neo+jjovJPtnJKK6GvkQoYqd17H4W3vIJyyLdwxLK9vYB9xygPZJETF7VsxIDl5ViP8vmLiH6MRNQVo9hYeeJYnmB1iLtp31Wi8/DFkV6H8zVLrroigqwMgN4CYOxxmEp7QRKT94zw2TucQiu8fHVZyK3/nh2P792nQ0Gj3SAE206fYOK8eLE2itAYckywOMIZBS+cZR+urfVb9Sqf5n2+tWkMC3exKTBinU6SsDOSzSnT3NWyTA438fjWEAjyyF/iEplaCYQTjj9zpbZ1ORL01XpPh/gtqn+7Dzi21Axr5eS8f9S0bjWFBUpI3a7ToCeQsq2YRnx31AFj6VXEZtj86zABPMPTmF3E6zz3qJ4r3zfWevyaWqYInrSzHjR1zIB8/zqt4mKSvpzPFaPRz/0uT4KIlQoV8a8cjoHWo8ULRFCkwkgwhhWW6BWRXmyfTP+UeLt+MvGJ18O0WImh/OWChYBvN5fwDRPWRxsU0wa4Lb9j1GG9RZh36tovcUGMZ/BWPmv5rhE7MVk3rCrntivKSzrrrgAIC//kVfkNtnMNb1H3618cS/gFkgzsxZxfvkQXj8xQoByfslSbMM+toZ21chgyRtIjIWlC0BHjOBYeTB2U11PpEr3Y4B2mP7FYF/4XzdQm5BVMPKUeuio+zs9wwujssP3CJSctc=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oq9zKG1zjLRtzdQDlM5kl2HEdv/1u2FnivAXWDVf+8AAKDkU1aWgnOGV7vr4+VPT3vyvLzEksSoN3yM6x7RJM6r7DCU28X+xb8LBAdXWu6u6irlAmb71MePazYYHRUTa4b9JAnwMq6WZZxKW/tba36Ada4urtklS2h+OatJ5JZfakLm5KAWz7hM9U8qfW5qvvnFE9eAX9B2WyD56ddwPXm13h15ePuQzAKraaWlZv7juEbsU9fmMcHLRWhcIzsXEexSdLOJnlQypFn1UB8i2GZvFZ0pzr++Zxhtz73sVgDXRz8Lt6plqkYM5jp86eXngmPkjZJMmH2ZoohKRx9ajBf7YqMhk4eyMS2obFpiR3fEIBnor/yxQIkxLxlG3wtPH5B9z2FjyzA8/doboPC0lL2c2k3UQoU5mTca5Sl3ao1VOm0jWaU7K4BjzAXJgbOILrnZ8R+A/A0+AGHgoHu8tl5aEyvAWNhTXEQfTfnJuwCqtmmjtkeQdYJQcJSEAeJDHVoTU6Vr5qAl2Vb0eZgAD1iXdCfzwu5PaD9uLuez4FlX+q4EB+AfJfrSi898lEIjAxH+gLzmPnKkyLxnldSleuRc2CKEAbUR8iMuPULViwvbvgo2EZT6wjokFQB//e9Ea
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KjoC0mo1FjxT5YZWUkaDkE9wTlWHB8NeL+VPst2NVdjhHtImw6d9fQ6Tlstm?=
 =?us-ascii?Q?6sBWg33W1qxDNV9bCkihRy1rqqV0SyvplX6g3apRihPlv5sC8t1WddleXYSt?=
 =?us-ascii?Q?15Ll13AMo9G9T4wLhFVW18fWJpXHGiiLDGCa9fZKrrXng2bpe3EgE0Yrge3H?=
 =?us-ascii?Q?F+der1dzThEE66daYgz/GDkR4mxke8JrM7gm1XMW4kxm+6ivMb1dKVz29Z8X?=
 =?us-ascii?Q?o1Tn6J24L99I31s3AxmhuZp/tcKGnb1G/x2b4SZ/GReZB1Uca837PxjywVpe?=
 =?us-ascii?Q?tg0wuFhIlTGTShq7Iyq3BihwYWXDDy7ttqPozQ/0IEWLTC7uqqIwXo86F2tc?=
 =?us-ascii?Q?zH/q0YBFXXcPcMjfbF/D2gxK8l6Lp98N1bmwQgfpEXL67FJO5iG2ZGxOYoAK?=
 =?us-ascii?Q?UkBrnvjl+eGL7xmJtbsnMqO2tee3lvpvCru/zUstB3KZDb1X/DmRGcX8N5t7?=
 =?us-ascii?Q?HsLQCcdGd5y76nMRoY7+tJPX9yADgP6okdMb4z3m2oin2GkcDR3z0RNM8QR2?=
 =?us-ascii?Q?q5F5+WWAw5/LsbNGkSO/et0b4JlHBdKMFFxeCRkjkgfUzA1RG3be169exvum?=
 =?us-ascii?Q?qtz0BZSdDcdU2YCWD0MNY5LD4tAIqidkP2f+TF+dTXg/gXj1Dt47S205ACH4?=
 =?us-ascii?Q?VLwLFyOKM7WwFEYJQYpJlWgNWCs06OFX8Kozz6m/H2fyPU9uw6t9kI4tNet1?=
 =?us-ascii?Q?XGO/kvXkbYT6PIMxijUZM/e0usluapGOUGSozGrpxf5DifNQOLJMxyL4zE7n?=
 =?us-ascii?Q?hrrQN6xvKMGskoYN+R6Y9AU8ZBxYX1/9p+j0qtowbXj6mSh3hdV1seDFbaoY?=
 =?us-ascii?Q?Pg5MkccOe1VIJo2TqrLytnK/+pGvOWtmO4CUZhQBIw4YIweDh42Jmk2RnaQ9?=
 =?us-ascii?Q?B/uGNP3uOSvlbBlSXhKSyJuhEFGahBCqgxLRuq+AzS5VeZ/OFQbwkkhuX9Om?=
 =?us-ascii?Q?dJh2/kh9FlEXO96hyC+PJi6nqNYUL9p0oLaf6lsEEY0U8jFdvQCuKeA++Ijx?=
 =?us-ascii?Q?u6umhzl3maZOxsJk1zZgd1yVVg8imz/NZCmE7njN7Agt2ksVjSB2qU4ByRyj?=
 =?us-ascii?Q?Eav6VVKUtlffYMxdrwJPyiHkg7lVDYLFI8YdLfaNWQ0Z1f3ZcWgapHRS0aLT?=
 =?us-ascii?Q?YkH+H2LgcaFd11Bce16fetWb9BCAy1oJBf3DhqxN2ab0MFhq+auB7Ot6ZOv8?=
 =?us-ascii?Q?rPyCPZx1rrcHJ8v4VYfD5cEc3HZ/gWOoYGGP8A=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a29ca4-8414-4885-3576-08db5d1a7c89
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:20:55.1572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB1610
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, we only extract commands for targets ending with '.o'. But we
also have many standalone executables built in-tree.

Remove this restriction. And to avoid some false matching, exclude
targets end with '.c' or '.h' when directly walking the directory.

To really generate compile_commands.json that includes such target, call
this script directly with no arguments.  `make compile_commands.json`
will not include them.

Signed-off-by: Hu Weiwen <huww98@outlook.com>
---
Since V1: Only commit message is updated.

 scripts/clang-tools/gen_compile_commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 15ba56527acd..6e88c7e166fc 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -18,8 +18,8 @@ import sys
 _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
 
-_FILENAME_PATTERN = r'^\..*\.cmd$'
-_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.c) *(;|$)'
+_FILENAME_PATTERN = r'^\..*(?<!\.(c|h))\.cmd$'
+_LINE_PATTERN = r'^savedcmd_[^ ]* := (.* )([^ ]*\.c) *(;|$)'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
 # The tools/ directory adopts a different build system, and produces .cmd
 # files in a different format. Do not support it.
-- 
2.25.1

