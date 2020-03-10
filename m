Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3623F18093B
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2020 21:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgCJUeM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Mar 2020 16:34:12 -0400
Received: from mail-eopbgr60074.outbound.protection.outlook.com ([40.107.6.74]:41383
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726480AbgCJUeM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 16:34:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJSua2I7sMmk4o5NJhdqZxr86nygnrj2O9ayJl0gl1YqZTlgNdwRYQXNjC3uiX3dEKnI2Ye5gXoqlbmlFPxkyO3FkJSJHUKRfgnwmxHgH1RjnAu58LrWP2nnqqkWkTkSpH8d/ic+qCMXl7fcrRemPD6rVxxg9mICtfXdCYbnKghCC9sE1VVxQos3ksZqv3l62PgN7vMpfYS4HVx4Y+xsdsLIx0s1H//CpBLGvxrKaudsbc12Qi4EbNI2b1Pv/cLd4JTLoG/OO/rhkHeKrX2gLEeCLHuvxBLw4A8/YU/0tg/ZulA9d9k9XWGgQ9zd/y/SxUTPbQKByfEExH99aqKc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFVVFWM4bpRmlnu0kI1srXcCkrsmplopNk5lWS41XM0=;
 b=HOSAIBV+nc7njdz5wfsq2s3DLpakgJgjV0pq+c/fuxjKBY+i5elOH/Jyu2MDhEwlrCVWIvJhk1o5kx4OGI14plXIyLGYax6ipXbEdNYe8n3SIqc+7pnVoiMPGUYDpQ8sASYiAJbVE2pq8aXY9b/lmRkTUJ5rdRWex9fKxMC4ac+j0JsyOOBCVurHyCESLM7hEYJnq0xf3j777RLqnbLtoQFuNmn1/cfKr3WNmz+uPbnMnsYBu5svB6BETJYYWPIh3F2PJ6lyPJspNRvIYbIfww9Ub53xNE536E3kpeZMn9yMr/OhN4p3pMupgs2PC/S3C8aemuLW2UYu2icC9+GlNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mir.dev; dmarc=pass action=none header.from=mir.dev; dkim=pass
 header.d=mir.dev; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astrosoftrus.onmicrosoft.com; s=selector2-astrosoftrus-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFVVFWM4bpRmlnu0kI1srXcCkrsmplopNk5lWS41XM0=;
 b=pwReX8ag723OFzH9J0cb+5iEZH97ACgDNnsd7ZD+uCnqvvot5mq6ZOcILdS8eLJCT04ORROTVTrHNW/6KLDyf5QgAeKfBb285LLiwdABl3oHWv/pdzn0RUdT8jlCqMzAivkPCI1M6f27fJLKKcz+6RlsLfWFuWKylDWBzvfmw8A=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mikhail.Petrov@mir.dev; 
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com (20.178.22.75) by
 AM0PR03MB5523.eurprd03.prod.outlook.com (20.179.255.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Tue, 10 Mar 2020 20:34:10 +0000
Received: from AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e]) by AM0PR03MB4881.eurprd03.prod.outlook.com
 ([fe80::e167:721c:978d:4f3e%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 20:34:10 +0000
From:   Mikhail Petrov <Mikhail.Petrov@mir.dev>
Subject: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with
 CONFIG_KALLSYMS_BASE_RELATIVE
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Message-ID: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev>
Date:   Tue, 10 Mar 2020 23:34:03 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR07CA0038.eurprd07.prod.outlook.com
 (2603:10a6:7:66::24) To AM0PR03MB4881.eurprd03.prod.outlook.com
 (2603:10a6:208:100::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.103] (62.118.145.210) by HE1PR07CA0038.eurprd07.prod.outlook.com (2603:10a6:7:66::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.9 via Frontend Transport; Tue, 10 Mar 2020 20:34:09 +0000
X-Originating-IP: [62.118.145.210]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21a3f1a1-7ac8-4c33-d1eb-08d7c5326318
X-MS-TrafficTypeDiagnostic: AM0PR03MB5523:
X-Microsoft-Antispam-PRVS: <AM0PR03MB5523E45741ACF9E0E0F1F86592FF0@AM0PR03MB5523.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 033857D0BD
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39840400004)(346002)(376002)(136003)(366004)(396003)(189003)(199004)(6486002)(26005)(66476007)(66556008)(5660300002)(86362001)(16526019)(186003)(2906002)(66946007)(81166006)(81156014)(16576012)(8936002)(6666004)(8676002)(31686004)(508600001)(956004)(2616005)(36756003)(31696002)(316002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR03MB5523;H:AM0PR03MB4881.eurprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: mir.dev does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7tUG9J29LvL//23i3uxmwrTmPxJL25M/5+Kv9ZV5pxs76olPX75fs8JcuNKa5qZ4Ke25he4HQvsTfd9Rapi1Touqy8sMyDG4a/699zKRqd2QikkVzbkcpeajhMMuUTaC025UzlXuKuuIaEEBzeD2RVicXuIqe1oLhXp++GL4LWHVBbMfse7SISg1O9Yq9Lsuk/CbIWJ/bbxswPuR/gjRCMEKnKl4OfNHL5LTPC5uJeGW0Hxj1W5trBfuzCzR+Sz8xg8B2ryNiTtdkucF9BKTfzZ+T+JWQt3en0fSn+waHibJarMaANh9zDos8FtdCtwQf25lfOtIpoFc8mdf7YJjkiEUYnAeXNC+ffErD+EuTVCqCYnTazuenWIymZJfbnvY2ZQXTI/ZgFZ78BcXFCcPE0i+hiws1sM5LTePLGs3gaB0IcUhQ3FcZDq9Oefeyy5
X-MS-Exchange-AntiSpam-MessageData: Zbtl4x72Jrj22urn+YBAHHBM6M7D0nS31zeF96X6zbeta9BQb3zKb/MUDlZPPYkqysOPFDSwp6d9AhgN6BFTyPHexxGyPn1GIi271t45qz4X/s8x6dcwY1laUM/NRavTNafx558oBJaqSMZHeES4gQ==
X-OriginatorOrg: mir.dev
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a3f1a1-7ac8-4c33-d1eb-08d7c5326318
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 20:34:09.9141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e87efa3-43e9-482d-a930-52632921709f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lg7fIF9xSYihWfN9rS4dBEmR4zuH4tzfhjB9f9TpQePg7cOn9a5g18z7Q/RH9NTiXHzKhCSdKXoJfbm8aCpKZe+2lkl2o8OsVRDufRKAYQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5523
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

But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.

It makes the wrong kallsyms_relative_base symbol as a result of the code:

	if (base_relative) {
		output_label("kallsyms_relative_base");
		output_address(relative_base);
		printf("\n");
	}

Because the output_address function uses the _text variable.

So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:

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
 
