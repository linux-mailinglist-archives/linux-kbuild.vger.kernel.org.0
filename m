Return-Path: <linux-kbuild+bounces-3727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEDD98526D
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 07:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFCEF1C22BDF
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 05:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C35149C4F;
	Wed, 25 Sep 2024 05:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GcX+J38I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2062.outbound.protection.outlook.com [40.107.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB861B85D1;
	Wed, 25 Sep 2024 05:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727242301; cv=fail; b=bA/FQiYeMBPnLThp6DC+Psp5QdiMC+mmlikrOvPOUVKJXnEp2MmjNpyVJXvowg5rIwqO3pD9kqeVaYmOSU+HWsEg8nAfqG80185lTbnrLZXa8g+Raiq6xR0dI0X1+oySyFeukKl8z6Nfo4MJHv9N5Ah8poD/w4/gswOsFZ3igKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727242301; c=relaxed/simple;
	bh=qysoJd3rAnWclS/KjarlF1U93CxxnLFhjZ0vV3cGOmo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SqZQm9FQXxLNS9T51fQ1Lmffmy0cSZup6jO4w3jmkxdUZSS4xaUyE/3a8s8esGmd8BS5FWgmapRfASggQnedDbSelV1c/w8J3XHA7vlbO9TY8OqKF0LggSYDWuJqLoBZXknFzwl6elpDDuGQ6579DrVa+gPk1crecnVhpVX6yUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GcX+J38I; arc=fail smtp.client-ip=40.107.104.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EykfWCQ4YAL2GHpdeHsQt8upXhSHcQZxO9RKWkTJqfNTriR/ukTK/KcTOdR7SkpBJClJTfsKf6moMEOSUXn6JpbU12hz6545wbBQ5GItHDVwom7lWernqlGzVlLVgCyDMLUBUhWx+l11uSS6z53JW7+LDaQPfOxR/kySvGN+LlJH4FzpjHNMcZhX/SF6zgCzyOmISXxexBp7uVdIIIavZbsovVqDRpZJo6ulfcBrTJTqlaUaLplAwu8AcSwmZZVjuSqFFMN4VUXyHB7LkznDKTMuOWHTrl05F0O10CKewprMLhIuWux7Vrc/wiqE1+KDj+gNzU1l31WQWH4b97wuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egIpIvmOsO36KeEUs3TyAUP2VZfxGnnNyqI7x7hyLOM=;
 b=tT/+sbiuLmeFde9KHHSTWSmzCpze0L3Wt1s0DqYHqY8lpLwfMxKNis6J10exTWXb1pPXVT2VG8rQyHW8rgxJMk+4NXkXSVwDrLyH3FPvrFc27qrlpaOF2arkhCffZoA2inFWbVlv59h3ZhgtNs+pMcbWfoWqHEbW3PD984TOyyK2vqz9LbLt+ndWlO/9sC1UF4G23U83Li2ip1zaxPBdxziBHKHXJMOls5A3UD6KBu7W74CDYsnsQzkQsU8djdwJ61cwTxGoQQUNPi7k7oqrhNYIkXq5wuBD7l/cNEJS5B3GbeqzKNZ6p/6P+szf6sn+U2JuSkC4R5DAFp4V4YTjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egIpIvmOsO36KeEUs3TyAUP2VZfxGnnNyqI7x7hyLOM=;
 b=GcX+J38I6bg/n2hwTvDMScsplzQjV502m957YCPtk6dqI78GV8r+0aFGNja+L18nw04r6dKruuCqv2LOcWZvh+I0syeVb4tugBv5wBrx1TWZkUpNb2rU4JAvkrAriUEEaDXocty3BfseOQFAQXtFWLA49+oQ4HtT9AjnuOESrk36NbXSqs/js7I13BdI7V7AF8lxRNO2z1HrS4DNuPWd8xTQABcWP5WL6LP9Fx+6NEzl/oRg33V6GRgFfab2h5XhaC7gT8Lobkr9Xu6ZMsYBHYijO+3PvP1U+liJBKZubB4z/vzeTjb/GyE11jy6JigtS0hj1B0kEmFwes7RMc3XYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Wed, 25 Sep
 2024 05:31:30 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Wed, 25 Sep 2024
 05:31:30 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: devicetree@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] kbuild: fix a typo dt_binding_schema -> dt_binding_schemas
Date: Wed, 25 Sep 2024 13:32:30 +0800
Message-Id: <20240925053230.45606-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 0202c9d8-6934-48cb-d33f-08dcdd234f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oz3XMdbcT1t3w894U6BWwy0NTLe1K7qm3hOiyxS+OYfauJ+0HV1WmFiQ94W+?=
 =?us-ascii?Q?dr8teYyF69f63MCWkVaQlji7zUwDDxZnSIZgYL9nsE8F8VSUE4R0cbKBxVQu?=
 =?us-ascii?Q?AaZwRHgBGPATTOqnIGhzFuMfJQflr1k30hTW+HtAWLf+eJi8GN3Z9FVgYxmR?=
 =?us-ascii?Q?jVwTOvqrpBDetOuNYp4PB60BBXquvSSx2b733qkKsKY/qZHs2VuqDQEE350G?=
 =?us-ascii?Q?FJNVinYYSWpIrTgzdnIDGqun23iL3O9Er2aabuZ1cH2Q+sIaDOP4S75+fAIp?=
 =?us-ascii?Q?dQ4OQBbfiF0ETduUmL8OYtcmZPexpyaHX2qmVKq2eq6nLA5QROTBZ5ufg0eD?=
 =?us-ascii?Q?xRIDsO3XGvQaHElB5cXaL9JfW4H5qvMqZV1nBKZ0GGoNjxZo7HIWwJF7n6G6?=
 =?us-ascii?Q?ZArop/LYnlxB/KqCDqskaLlWNH2v6H/zV6aoiT5hvq2yfEAlclTq4kHmPXkJ?=
 =?us-ascii?Q?oThWetw0/aVeVnM2f+2O1Fp3IBYKz0XgV8H6/5iKdtGMM16VrcLuIsaGeHo2?=
 =?us-ascii?Q?pxs9t7fYcJWmZQ+GJawlHeF7c5NBCkUHg+tOu9KOGaVmfi7A7F1ABgBpdFU8?=
 =?us-ascii?Q?+PkdTSA8wsF8m85hZvBjWTlWy2QH1VerDPoXhZf7fqp24Z4apVlmZKQKJ1Ik?=
 =?us-ascii?Q?BN1xNKGiYykHIWFAbteOSjMwnhUyiLGB6vTFWLr4wFNVAvl3owzNUcdiBmvD?=
 =?us-ascii?Q?HkO1XzvffwSKjcEQz6NKm6djqUMLue4ChyIKA8yuLx8JSsSMDjREWUTKgGsl?=
 =?us-ascii?Q?iEpimqJsmqxQQxBBW7qFPJVq4aby8f12McdhobIDNDR5QTLBStCZxHZsCxJA?=
 =?us-ascii?Q?zEi2RMlHK0HrD0cZ9GeSkkOsP9ABsX05nZIw2d2CD3//F1xUE4ij1V1N7DVV?=
 =?us-ascii?Q?6sb3hqzdzOSjmqvipsPmXcrFDaQJUd9AHzrPYGDSZ7oTRYcMw0qx59mpdLVS?=
 =?us-ascii?Q?hhaNLRNEWDqpe5/BglBF/o3fYJ0A4n+6KxGV4kfWutpVM1NEndciaOg9Plth?=
 =?us-ascii?Q?pqsziHGwatlmgU28lsq/05Vei+PQK6RclC+/TSxSxctnfv7+mEJBMjtv43Lw?=
 =?us-ascii?Q?+8Gaw+MFCdvZhfZ6qXu1lLQh9Dglqb32sJLgqKLd0jeR4zLEwF1ridZwbLo2?=
 =?us-ascii?Q?JxDAb16FcKC7FPlVLRd+SW3MckIzUyH4xc2wYC2HbE3Hz+iOdEtzmeT1KOMB?=
 =?us-ascii?Q?rd+kUPdOROw/pYotXAjZUVVQznqEd2H67OBNymCPTAfERs/L0y9QOeO+gRY3?=
 =?us-ascii?Q?pwfo4MkvzXvJR6GoncGLeN3L3F7TXxUM+ld7d3tRhl3aLFbCq9K7kSlDhlc2?=
 =?us-ascii?Q?791jy+xjZXasvyGHVcYojgMfZNYihSQUSa/lJEhrv+p1TTEBsizKKGGC4JyD?=
 =?us-ascii?Q?/ED1zUpv0Mo4oFW7E9Lkd19D/g1YlscG/DzqljR8h+7PDB6nXQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X98qM+9B1WfpdEf6LAbBO91uxgNQosoQaukv6e/YWW2hbD1tFtCzl7SjsbCK?=
 =?us-ascii?Q?MiDMyNVoG/m9hzJr0Xzj4LdnR1GBy4g4/QVGm2a6Nz22Py8YUTApQPOOgbfH?=
 =?us-ascii?Q?BOwn7mGraVa1h7/G/QXl2fx4IdZq1GxdXh+fg4yvYPB3oWv5v5kWFjt6aHuE?=
 =?us-ascii?Q?bRLJtrImspa0fDBK80FcnH+CbhY1i4DY75/P1NGwluoLerS1wW6epZ+YfMvV?=
 =?us-ascii?Q?k79fPB3K5SKeItaJthVA4lqMvZekzHrc+90mSOQ58gmKrl5kIaY0Rpm8S77Z?=
 =?us-ascii?Q?Fh7IH0pk31Z1+LDYoQJt1UA1siVFnPVtLf4DPHRUVU5s3K7nGsh94b5o2Uef?=
 =?us-ascii?Q?bwKFvJqRe8Kegv/wCrXJM89bTeA+ticV3LTBJfcz71ND3dTvwgsRokgPP/ZX?=
 =?us-ascii?Q?td5f/rJg0+F0d3JiS2j+SQJeV05Bd+kGQMPjUjm22HUjhijFi2Af4Ggd2vDH?=
 =?us-ascii?Q?83DyxP/VKN8+6zHDGpZOVS75ix3HylRQ1acMn7Yz2mgAbWS76UXWuFBMoL53?=
 =?us-ascii?Q?b8eQnB/XGGHFBNeQAup9+Vo1finkjT3Fy44ZgivhR9iDwmHuaMiE4mX1Mox0?=
 =?us-ascii?Q?/a0yqxoIbIJfLG6/n9wZpIxUtFDHTR3UvX8Tvfijuk4BVg3CVRwq/PuqPkJl?=
 =?us-ascii?Q?XNXlYr+nFcwkrbEhGXCfio3fuuRJnuvqgLrNQg7AOJf0ceSYPbJaVmBFWAlP?=
 =?us-ascii?Q?r3BNQSbZaaE5tIVHifYu6EckJhdevf9KCl0wXduuIkvzxF9TnS7f22mGRlVU?=
 =?us-ascii?Q?8hgVZn6dHqshp5W4lWxqiIatmds/ans/PmLjS2lR5jItApfDIAmDN0+8eGiL?=
 =?us-ascii?Q?/USqUDNL/U8Ka4P2itsxWwWXqc+10Kq9Ixe+ozBgLA06s93uw3jMQRzMSs9y?=
 =?us-ascii?Q?mu6ZmZhuJaqqtYwusC4r3JOCcGruKdI7d9IX3akBgdYCKg5MlRWJcrIOOTKS?=
 =?us-ascii?Q?BtA+MDKeUQhJbGg19Np0TF5AObRisKG/k+6mhKGhLtTmKyO7HBMLWuC4/syS?=
 =?us-ascii?Q?9t/2ypcL4sXAMzGqaxEO7vluX+xF8FjXsLyaQWo3P9ZRoBNUQaNeOTjvFKND?=
 =?us-ascii?Q?SYXTdGZ/dJY4lwvEwCeZO653fTS6sdbVtSlVymeFaX/u6ye/08mN/RR9mr/m?=
 =?us-ascii?Q?gDgmBPH1g1oX1DZjXtOoup1w9TNHfWTkH5OVYxvDxlAOsPe2xmB2Q3ZZ5sws?=
 =?us-ascii?Q?V7mu1Z0imnpVMgfXeJE2DbT3//z59vaZdwjvQZk2sAdYjUMSY3Bjk9tPA78z?=
 =?us-ascii?Q?iwUDffZZy3y01lkjGX6KPfJXyX0nb8Vxviz9tHAAgJ/bv1w5Tz4/wM6kC5Lg?=
 =?us-ascii?Q?zqoXSgcZCRDkCvJbhDSt3VWRD3krk7Yrh9NyGMILs0NwEOnJ3jmoaoAvC47Y?=
 =?us-ascii?Q?vOGhivIXWUiLMqkZAus5fhtaclVwKW/rE8uI3IT2GbSa6Y6pVHtM3Uqa5KDY?=
 =?us-ascii?Q?AYO5sbgyUcZvEuM9xeK8xXSPo5XyK979zKiFh4SgnCyfjTdblgIxlOVtkasF?=
 =?us-ascii?Q?u5LDhtmQbj0G67FOT52KzMSyXQEAxh4r5Ev3YmaxWxkWhVbIrt0wFyOS0mlI?=
 =?us-ascii?Q?NffpgUQXFR6uc2fiQ4NqrwA4DDHTw5zogF/MXgxZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0202c9d8-6934-48cb-d33f-08dcdd234f2e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 05:31:30.5169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4ZNkPL+n2KTL1Kef+WR30+ZLfJ3ftHIE/KiFVS+6XC5sdpfmLWp6n68oBSu6Z7m+ORrT9g2SvZEjmTbz20fvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548

If we follow "make help" to "make dt_binding_schema", we will see
below error:

$ make dt_binding_schema
make[1]: *** No rule to make target 'dt_binding_schema'.  Stop.
make: *** [Makefile:224: __sub-make] Error 2

It should be a typo. So this will fix it.

Fixes: 604a57ba9781 ("dt-bindings: kbuild: Add separate target/dependency for processed-schema.json")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 265dd990a9b6..7aa71c70305e 100644
--- a/Makefile
+++ b/Makefile
@@ -1645,7 +1645,7 @@ help:
 		echo '* dtbs               - Build device tree blobs for enabled boards'; \
 		echo '  dtbs_install       - Install dtbs to $(INSTALL_DTBS_PATH)'; \
 		echo '  dt_binding_check   - Validate device tree binding documents and examples'; \
-		echo '  dt_binding_schema  - Build processed device tree binding schemas'; \
+		echo '  dt_binding_schemas - Build processed device tree binding schemas'; \
 		echo '  dtbs_check         - Validate device tree source files';\
 		echo '')
 
-- 
2.34.1


