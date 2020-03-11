Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8278182356
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2020 21:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgCKUhS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Mar 2020 16:37:18 -0400
Received: from mail-eopbgr50070.outbound.protection.outlook.com ([40.107.5.70]:26787
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726684AbgCKUhS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 16:37:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOAxsEoh/3yc7rN+S3fAgYQ2OTwjNa79tBzZPQUiBowQV+oBp3SPHMOBPm12L45lKYmPJpSI0S+fTeMvgbAd6WnXX8giYZa39hs2hkKFpiGhS4MHsqxzhedhtVw0e4giAKCJL7S1dCziwvt0bo8cyFiuyTsVdiSmOV2g7NHoqGwThJlGeV0/KGIRRByCxAC+OK1wwlKCVSuAFtpvJFFh8qT4XboZPT04Vd+Sq+z0r+S+nOkxrca51nQ+VnJIonUpWCvSjS7uxUVW9azac9sS3MQVpXarcc66XPoYS/5RgACmSx52TR+dh/jbvffMoX7EU9m7XsgduMtiOthqbhz5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZBV+iXZycVHe4c0m7c6H/2nuzu4h3WBS8/zFe8ZLD8=;
 b=axIwkcSjrepH5s6+Q+6p4CZh1e8C3mB2PSA7mUQniaMWook3Tfy9zYOxPMi2BkApJRLXbtjHAyk2IbT6NvE5Ecf1q+RALJvrSO6wfy6NFtEPvoank/QVktm5OQaK6AqkLPwFkmCfKXNUPS23vv23EeIUQJIBwl/EdVIG7JKxQ81GAjYFrEA6l2xhBC0aoSAUOaBYLyVDsRsSdRFF3qADE5ePiLOYcDajCOhpb90wPNDFE2V2C87xHTRVTf0d5U7fm0/90X1nU6gmB3g6fpMaqK6cJ6k4zuwbSi3ic5KEAPo14kbyPKLd1P+QhgMKOGFgTHmceAwt6sXbHhhQeIp+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mir.dev; dmarc=pass action=none header.from=mir.dev; dkim=pass
 header.d=mir.dev; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astrosoftrus.onmicrosoft.com; s=selector2-astrosoftrus-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZBV+iXZycVHe4c0m7c6H/2nuzu4h3WBS8/zFe8ZLD8=;
 b=WfjwDMmIvoK1UGZFQJEOS59J4Djkbi2gu/bbzLmOeAe8oUaCRLGHlygGjoPMVxn5TchHQ1CEP4BN0OAMttTjrPUWSnF4vHT/mCX0oPBO+R5kQTC2S1xZYZWjAY4/opUAbxNHhGcF6ZJ4b+n2s0KEUB8etqITQNtnKqhEXzum2As=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikhail.Petrov@mir.dev; 
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com (20.178.22.75) by
 AM0PR03MB5043.eurprd03.prod.outlook.com (20.178.82.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Wed, 11 Mar 2020 20:37:14 +0000
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e]) by AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 20:37:14 +0000
From:   Mikhail Petrov <Mikhail.Petrov@mir.dev>
Subject: [PATCH v2] scripts/kallsyms: fix wrong kallsyms_relative_base
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Message-ID: <306f76fc-c445-6578-d4fe-5e462861920c@mir.dev>
Date:   Wed, 11 Mar 2020 23:37:09 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR08CA0059.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::30) To AM0PR03MB4881.eurprd03.prod.outlook.com
 (2603:10a6:208:100::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.103] (62.118.145.210) by HE1PR08CA0059.eurprd08.prod.outlook.com (2603:10a6:7:2a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend Transport; Wed, 11 Mar 2020 20:37:14 +0000
X-Originating-IP: [62.118.145.210]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f11e017-bccd-475a-6dca-08d7c5fbfb7e
X-MS-TrafficTypeDiagnostic: AM0PR03MB5043:
X-Microsoft-Antispam-PRVS: <AM0PR03MB50430D7DAC6169CCDE0044FB92FC0@AM0PR03MB5043.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(199004)(110136005)(86362001)(508600001)(36756003)(16526019)(186003)(956004)(2906002)(2616005)(81156014)(8936002)(31696002)(26005)(8676002)(81166006)(31686004)(16576012)(66946007)(66556008)(5660300002)(66476007)(52116002)(6666004)(316002)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR03MB5043;H:AM0PR03MB4881.eurprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: mir.dev does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNH+u1zOU4QOd4EGBV2OrhGOIZFGgkcPA2DB/plH9If8fPXWTXJ0oopSAjbbnzafgRIoWUILdyi94j+yiMnNhznFEgr8lOmlhMlnI1FuCL+WQdHlfkQ0S81JsuGNMF8o33CJU4QMkvZKsZRJVKcSm/uCB9jI5PX5Xl3Zv/KSTMOieR6El54oZf8Ja7zhskell+XzgxKtvEewyKDU/J6otT3lVNtjwCBnBZDRj2S2Deg2u+S7xg05tdgHKEUonM4NBEPrX3ioE8pDTGdA8O9chSekS516OPnXdMKGOueqXZMNiZilt09m8A6Ipls31jGXnZ9glPwBRydcn97QILFNTULKTHxU5B8dN3c2/iseEf/PNYQUMOLGEFTievKRosWpyGsRyz5oczpRl1fzKJ0t9HrsdeCRZuXy+O4KV6C2+n7ji9e4QlXeYVgoZkSueoSt
X-MS-Exchange-AntiSpam-MessageData: Lf/7S3VQLe2LkAcLD6JRze5QahKNWdPnlfIS+zh2qo4rG7SXiAZL1yx5Ey4rGZkDzooTnvKJGpgBehA8Blfnx4LAG332cJJ6EMZf161tCN5X1K4Ih7nXGvz5Ywa2si0SvfBZCn5SmGnisbPN8GONSA==
X-OriginatorOrg: mir.dev
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f11e017-bccd-475a-6dca-08d7c5fbfb7e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 20:37:14.4623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e87efa3-43e9-482d-a930-52632921709f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecQSjAVpjvYDW3mddUhm/0g4/6699ZkgX5o1zkTKORcrl3xxDIYMIWtQLKRC6TKnSWx4Ye8ruPTpPvAtwUPD9l5/oZSilw4/kMKDJW1qCTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5043
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is the code in the read_symbol function in 'scripts/kallsyms.c':

	if (is_ignored_symbol(name, type))
		return NULL;

	/* Ignore most absolute/undefined (?) symbols. */
	if (strcmp(name, "_text") == 0)
		_text = addr;

But the is_ignored_symbol function returns true for name="_text" and
type='A'. So the next condition is not executed and the _text variable
is always zero.

It makes the wrong kallsyms_relative_base symbol as a result of the code
(CONFIG_KALLSYMS_BASE_RELATIVE is defined):

	if (base_relative) {
		output_label("kallsyms_relative_base");
		output_address(relative_base);
		printf("\n");
	}

Because the output_address function uses the _text variable.

So the kallsyms_lookup function and all related functions in the kernel
do not work properly. For example, the stack trace in oops:

 Call Trace:
 [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
 [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
 [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
 [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
 [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010

The right stack trace:

 Call Trace:
 [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
 [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
 [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
 [aa095f28] [80002ed0] kernel_init+0x14/0x124
 [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c

Signed-off-by: Mikhail Petrov <Mikhail.Petrov@mir.dev>

---

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 0133dfaaf352..3e8dea6e0a95 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -195,13 +195,13 @@ static struct sym_entry *read_symbol(FILE *in)
 		return NULL;
 	}
 
-	if (is_ignored_symbol(name, type))
-		return NULL;
-
-	/* Ignore most absolute/undefined (?) symbols. */
 	if (strcmp(name, "_text") == 0)
 		_text = addr;
 
+	/* Ignore most absolute/undefined (?) symbols. */
+	if (is_ignored_symbol(name, type))
+		return NULL;
+
 	check_symbol_range(name, addr, text_ranges, ARRAY_SIZE(text_ranges));
 	check_symbol_range(name, addr, &percpu_range, 1);
 
