Return-Path: <linux-kbuild+bounces-2545-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A904F931F1B
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 05:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2545D1F216CC
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 03:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CADCC8E1;
	Tue, 16 Jul 2024 03:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EI4Wle9Z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="at2mSyxi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845BA1170F;
	Tue, 16 Jul 2024 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721099467; cv=fail; b=VfOj3OhFjNAxrn1KJi2UwG4ZW5tXxRmcOtlfA+GuVFdu0VgDW+8wx9iFRSjdJd7Bw55oCKxUeBguJqdPRjdRnSwL0QD4QJo8byyTiEBKnbvxD79zn7alSZniNGEPqZ016LRSweEkAsbT7rEReMciWQThqtZ6PMAQDehCcUZ37AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721099467; c=relaxed/simple;
	bh=ezX1iSZbNBUbOoX5Jl+OyyNFcMohgdB+Qi7mql3VFhM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Zw5F9LILTSjAWGkxNuyd0v8LjLW8kUK88AlUrUgZPaj2ijvBIFoCfHtnxRngDnL9tPk841sHqqDJX3HxXKbiQ0L7x9p/M7invPcxFlTw79UKYlv4/WvlmFahawLVn1WANLQknfclbSHs1yoUpCKfb02AvCqZbzK4/BhgaXEM7BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EI4Wle9Z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=at2mSyxi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G2tx4r000755;
	Tue, 16 Jul 2024 03:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=bx5k6U0Kxb/pXN
	Ey+lmBTHdVo0ia1su4zie0QioEPG8=; b=EI4Wle9Zl3F3jSiJ+fVS6qV4n2/5W3
	Yb4fOwGMH064Dl5EKJtIBvs8RZWjPF30v4ChGccBhsO5bsE6/sgnb9B/i5zk5CLW
	84Fj8au7mGxCezz7wUP7OmYBDp2dDl4llq658zrR7o2i+nqmR+BLWqTZTRRUDLtY
	vxHOtvZm51ST6JjbxnLcdqgrEWn18E73KeuYJSRdlZ7P++LTlrmcYh66f9feOhSV
	HKuJSmncjTNLGzN2zsorgnPoa/omMjRWPGkwl3PDNByWIGLnkjtwAk27ICIcXH7r
	8xIUwXPP/PxubBv/o2uMmc0mqnPTyzGWy7zE+nq8ZaSTaKeY1jfTGTOw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40bh6svppt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:10:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46G0tc05005946;
	Tue, 16 Jul 2024 03:10:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40bg18pncc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:10:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+lxoAb/RLDXvlmKAsxFGLP25Sv7ki9FotQ83B+IPk5Iy3oXxeDcTWdWOYhGCGM1v+gkuBdJTjEhfZjO/Nbj2FP0DZ1cREklmW2GtVmAnrRmcjwgcI3/m5+WymcYKbxPAFvPOHdsFMVn7VQPKrMXbAPSOyU901ZutBiBOUPlBeWf1h3WGkryYYRTEcxEmKFbLIEZnZxQUPNPDsH9T6uKh4xq1Q4fDVDIs8Fa7/Hwlo0ZzCzGSCIn4VKD/wT2ZC2g+zsQSOniocKTJfIr1XURThacSySJs9POklZeFNMPcljHZ507E8atYyGAmkcHRsOzC3560NMg4qRBgwPR2rsceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx5k6U0Kxb/pXNEy+lmBTHdVo0ia1su4zie0QioEPG8=;
 b=vS4klZbXr5AlS0CHMeSblaQB8RqUd6obwKJu6/k9n7rSeNtl2hjAupkjJSOzVQn0rfi3xZVzst53CuKUQUrdO/n5s9kW2q5/AZ1L7wuJ3heh+s/PEqBaquMmgv3Dmthlj8KOhmUah/atxLyI/F0Epsdq7/70JxeJR9bShrGfKopPOdk+WNmQWPO1F8kLlbJcvG2Lfs48xngMKI7XYPd8ld/tKuwii1wowxvb+kg5jw3V9RQaFsnMW/aq+3VNn3AANnTR0XEYt8upA4j52spXCbzmQe27d81Pj2K6fTJ4O4Jypap4/FDCuj5oU3V3tp8clvj7AbNhg5CU3wsCh6rwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx5k6U0Kxb/pXNEy+lmBTHdVo0ia1su4zie0QioEPG8=;
 b=at2mSyxi4Trmyj2nRcQqTXbgnCa99wtWxUCJTmtxdKyPe7Rz0j8UGHAsxFKziGnZzpCrjtU4PYs5EHDqWSKcgJ4DPo/hsYb8q84LfrnC/0x9S28dV1owUMSOSFr/M2NyLYuzzhHnp8NnpK5XUQZw/TSmlm5n6wSacWzR/LprVYc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB6380.namprd10.prod.outlook.com (2603:10b6:510:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 03:10:53 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 03:10:52 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v5 0/4] Generate address range data for built-in modules
Date: Mon, 15 Jul 2024 23:10:41 -0400
Message-ID: <20240716031045.1781332-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: f01e73ba-ee21-4757-0ca3-08dca544e6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H+P596ZqomU6YehE/NOfwxn87uu/lAuHpUw0SCy3WWrLB7eeoal6m+Tdwiob?=
 =?us-ascii?Q?kh+li/iNJFZKcTk/FiecYZu7Wp3fkp1L9ge/zIj73ivgLmVuef/59ynueOdD?=
 =?us-ascii?Q?7iSLw4BRyr9Mi34XhaNlQy8GBpd5tSv2uCUJCIb6Uk3INIbesJm+xR5d8QPw?=
 =?us-ascii?Q?hwy2xs+lqZ00aNV1AP2iMuRq6+B3DKcDdYfeXTyfm5x/hmzlFUE6m/z6Ol/S?=
 =?us-ascii?Q?i2kyYXdfFCmBRPom9gJCMcmJviVAFtPOmAxXndgAZb6BFDCfq4nVQObX6Rfp?=
 =?us-ascii?Q?b5kqQ36OpBzu1o9aTJzBHDTqv9n5pSwwRCadS1zzLH4+YqT0ImHORuaUkDSy?=
 =?us-ascii?Q?i9drQ5FRt/sHJa6G6dW02XA9TuSo87acIEkJ//LWix+22Hj7KQiv6c/ySGIm?=
 =?us-ascii?Q?/TBInWjS32IPMQTmj341erYLYMmVSRzvnvsXQhzeLDMNVbF6f76KIWSIh+54?=
 =?us-ascii?Q?3pFdveKzOiRdc38Jku+DuW8KjFKOcvychBAFeWbMWE91m4cqlxJlIwzNtxA9?=
 =?us-ascii?Q?iaKrRW/FDETICA6FLQuCS5s1g6+QAj4waE10s0tAWO9A3RdCp9q9+Bh5pEDe?=
 =?us-ascii?Q?g3+DNwuqWf2HYJspXJxVtu/ZVrcOpfkCL6saSJTMJV2tYUMqU+EJKXWlWysa?=
 =?us-ascii?Q?PW1BY+ZJFIvEzEfiVuYj6Khkg20MQhbS4RsS3oKhvWGRuK4nNcGOKARViaak?=
 =?us-ascii?Q?QwtuE8CKq78Xh5Cms0QaKltAFyi+rNFtHE8AKIwnzIU9DMjOCnWXC7wewRiJ?=
 =?us-ascii?Q?L/JskSOoNvYUtvOBHra/GE8JAVFxu5G7TD6TrSvBDer3nJ0OoQUeLeKg3oD4?=
 =?us-ascii?Q?rlECj3+8544WnGAOKOO+TdzMwcOADVug+xanatuEWHQRcuvvpneT5YvflUO1?=
 =?us-ascii?Q?vvhinGiJZNyBK4H0PmAbEBAiR5Rpv4TGjhtBlBK4JToPOn4rhuHeECEsSpQm?=
 =?us-ascii?Q?5I3LfOP5Yx+ciu8+tbxZ4rHFHSSnACus4r3wIbo7+rc6lMjdzjnwXSLRnLeP?=
 =?us-ascii?Q?VKZpPcSTLFKMKiMDWLD2DvlssTxSieIzLsPqKh4mDYDcr6xOC7ux9CIm2kG8?=
 =?us-ascii?Q?FaQcThd0knZk2uYbqrDLl0tQ8gnYywIcckM3QieO2pHFTvK2VX79bX6fepWD?=
 =?us-ascii?Q?eKrRMwSvsfsnkloN4XGGPg4s/YidJp1CLFor2Icr9qis2W2xVCqSN4JI/HQY?=
 =?us-ascii?Q?rZ4D/dDP1xDiss8n0OL1goEz0+3aHiGjblZI++G8erMArpp7XRAX8f4rH6Ij?=
 =?us-ascii?Q?zKs9KkQfFaEvAWp9224S3s5lM/9Fsl1Q4IwSmf5/8xZWMq+sJGWJooXyK4YA?=
 =?us-ascii?Q?Nes0h4Ov/5CAcuEBhOBvuVYbZN6tYp+BtsacOa9j8R3kAA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DcQSvB+Cko2JPBMRJZdvi/2TkaHVvs73a4ZyKVYw+7ecfVVpOJ0IoBCajRNq?=
 =?us-ascii?Q?D32ujseTsrQH4JGmmGMpGwMtz/mc5HT6IoMamP5h3oH7Z0onx4JtsxX3Gobd?=
 =?us-ascii?Q?DgofXwghFRJWNC265zFQkaOmXIhDS6hLhbN0Yibdjsd3GCfTqqYuC/QfAK0H?=
 =?us-ascii?Q?DnRLdVubfMDbJHUKAE7Pi1PoddZ9dqzIpviEUaVQTNUx1MHbZzec/pcfNm4f?=
 =?us-ascii?Q?df5A/3agMepTSbvRtTt1Q2BzIrfG/AqKYXIRG/RwBrsgaDSUtoXrbZbKBp/u?=
 =?us-ascii?Q?dqX32NFhGCgkldd0gjVxNXe06b9jqaGKe6P751wFj+qHumR3+NVEvJbFewY+?=
 =?us-ascii?Q?pUFCLJaqDdPVvvNzHJEW0+FzfXsnXQ3rpkA8vcsiQQ3zAdfWgwPdBTq1KbWd?=
 =?us-ascii?Q?rH6uh7T9ubnV0eMdEAZCe0kOpRgpwbuGVge9OlW01kp/2BPA3WfNqFE9ee8d?=
 =?us-ascii?Q?Du4guVH/rxzWWBIf8SWgdnMDQAgYW+kgrkvVOmrArGXIYYRExjugLbPf92+u?=
 =?us-ascii?Q?4IfAjdMpkeukpZKAtlNlh/2emiFJnsoNsmTFlu1O9mUjMGaeSC/sZuKsh/Ck?=
 =?us-ascii?Q?q6UkV6bISQP95njGQQqkPSznz24crIgNqveeljyDOjZLXGnzTidltqYwNQmC?=
 =?us-ascii?Q?2iShc+mH6hNowluLTMrYYbXOQ61adEbOUeDwepsJHhW/rgg8ICr1ttHLZ8jD?=
 =?us-ascii?Q?8s0hCX9OImNAZc2LNoKSaMEjW6tA4YyQRZz+bukz0zj/gqQJRUUSH+xrBWhL?=
 =?us-ascii?Q?JbE2V4RWLBgdnZTJznFRoawdO3aYVtbP4GVWS7/WPoauP5X9s0+603lSGfkk?=
 =?us-ascii?Q?HxsUt+zoZXU3eX4OjZfBgVtBpEjrqonbm1UUK4gh+uTkdWlsduWdwiwdmPYT?=
 =?us-ascii?Q?1+ibZi8RZXMvGKReKR+32molTrvVy+9N0lC1/UUcQ6TX5IuFZYGaeSSbf1rp?=
 =?us-ascii?Q?F48AhPgBVwrv4SscRYqaoE1wAEYXhn3M9P/hoYDxhxas9e74WrLB7HEYaRTZ?=
 =?us-ascii?Q?lH/l5o1pTbAb9HZlYqflmXdxYhTVOupb4Ks/bSRTgf+RVM9lXT3SEU020v00?=
 =?us-ascii?Q?VLKV+wK/R+EOAOQOSzhtEom9LYbUqok2weG54yUyadepHOpj67yV/0RWtsmc?=
 =?us-ascii?Q?ICFVHKabNV9wd0hIGrRFJDTpRbuykhDMiq4KUtRHY3qcc/9mTEogfRDcNB75?=
 =?us-ascii?Q?ahDhH/WY84BjhvEywIga5t5PwkH5a8Fna2XE3SEvEes8Q7NbRxmgJQeptXzi?=
 =?us-ascii?Q?d5v8X0DusfjL1FS1YpGlSXrjBRiYPH8i3V65Nov8a4sy3OaJBU828aUBpeBE?=
 =?us-ascii?Q?GT1lwDZSXWz7md/AnlSaSnSBVUCD+JUfIGJ0IS1cV2D9EnNO1+7rAC4tNynY?=
 =?us-ascii?Q?uTBRI102DaJ3sEviKjNhAKgkN8Kwi87KGdqaeOG2kcr4BePLS/9bvfgTXVEx?=
 =?us-ascii?Q?D7j8dnshxrJheno6K28YYgH+O9ENC5mHWqVK5wrCqrPU5M4lmWiGElgism1h?=
 =?us-ascii?Q?sVIYwilXA+jqs/aPaamLdhOZ0T2XiEsJzOBpj8W1L2p7Xy9ATTGurB7XryJJ?=
 =?us-ascii?Q?+GTPPsVj4itubtTFNaVI2kAh39P6AD/SWiMcRbJPXyf2WnkRJZJ70roKv94N?=
 =?us-ascii?Q?Ai6dPxTYuE5uthQwZm0vVNg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Q7L6t1+S6y9rs95N6Bg0YDQL3wM5izEYOhQadoIy5pglr+EbJ82pxwU25orJtUtYRGVnH85RzLj3kFY+YeeJ5wTMXD6EhV/iTpP8PQi8r9m9t6Ck8Pijn2ZbiWDDuU5bVAxH4OceRgHypWM5w/vkdtxx2BA2Bby5MTWwoIZPTes+yX6WbZFGJPL3MnCQCK3Phx5m5jCGlLbLnAEiuS0pLTgKmx3nch3xJHt71quTI5px36gUce0L6oPPhrWHyM4eeoQIMDQUybVTxcqCD7LYWmrMrQSr89s843xuFwWsM8GcP3nVZQC7EbSzqvPiL5SY2SUbsVQt/9Cmtt66wLOj5XKhTjTl7iooyL461dPQ6+7UnM7LzUJm65L+JAWjLEisCK1ZC+6z78NcVnmQlRC3zxy09jzre/yqXqz8aCCnVmTy7VyZmIuMqHLXIX50QNpHmv27Wgs9L2q4w8uxtuxPlmxG6LsgqZ8PCJUH32Gcd6OuNDMRAbF+iauABRjQuFb4Sg5DoCd3c1ydb0pu0N/6mAAb8AgmMA/BTA4Mq7WxVNEao9QfIfaf27VNv3PNdgoNRxCVRsbxpGk0uqJ8kyZK5gWGHpkW6gBANzniWRbM4Vo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01e73ba-ee21-4757-0ca3-08dca544e6b2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 03:10:52.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcQjK1PbVHUzQYbLpubcxx+IxJAnESo2yX9xwLhQx7Y8oG+zVuagXBNJdaogs2OBdx9myalpeJRpCNy58tPEUMkQ0l6EvpkW5Xmo9NzyjDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407160023
X-Proofpoint-GUID: uGqULbSG7pfRgVTJm1cb9Hdc2U_UINwI
X-Proofpoint-ORIG-GUID: uGqULbSG7pfRgVTJm1cb9Hdc2U_UINwI

Especially for tracing applications, it is convenient to be able to
refer to a symbol using a <module name, symbol name> pair and to be able
to translate an address into a <nodule mname, symbol name> pair.  But
that does not work if the module is built into the kernel because the
object files that comprise the built-in module implementation are simply
linked into the kernel image along with all other kernel object files.

This is especially visible when providing tracing scripts for support
purposes, where the developer of the script targets a particular kernel
version, but does not have control over whether the target system has
a particular module as loadable module or built-in module.  When tracing
symbols within a module, referring them by <module name, symbol name>
pairs is both convenient and aids symbol lookup.  But that naming will
not work if the module name information is lost if the module is built
into the kernel on the target system.

Earlier work addressing this loss of information for built-in modules
involved adding module name information to the kallsyms data, but that
required more invasive code in the kernel proper.  This work never did
get merged into the kernel tree.

All that is really needed is knowing whether a given address belongs to
a particular module (or multiple modules if they share an object file).
Or in other words, whether that address falls within an address range
that is associated with one or more modules.

Objects can be identified as belonging to a particular module (or
modules) based on defines that are passed as flags to their respective
compilation commands.  The data found in modules.builtin is used to
determine what modules are built into the kernel proper.  Then,
vmlinux.o.map and vmlinux.map can be parsed in a single pass to generate
a modules.buitin.ranges file with offset range information (relative to
the base address of the associated section) for built-in modules.  This
file gets installed along with the other modules.builtin.* files.

The impact on the kernel build is minimal because everything is done
using a single-pass AWK script.  The generated data size is minimal as
well, (depending on the exact kernel configuration) usually in the range
of 500-700 lines, with a file size of 20-40KB (if all modules are built
in, the file contains about 8000 lines, with a file size of about 285KB).

Changes since v4:
 - Improved commit descriptions to explain the why and how.
 - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
 - Improved comments in generate_builtin_ranges.awk
 - Improved logic in generate_builtin_ranges.awk to handle incorrect
   object size information in linker maps
 - Added verify_builtin_ranges.awk

Changes since v3:
 - Consolidated patches 2 through 5 into a single patch
 - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
 - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
 - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
 - Support LLVM (lld) compiles in generate_builtin_ranges.awk
 - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
 - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=y

Changes since v2:
 - Switched from using modules.builtin.objs to parsing .*.cmd files
 - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
 - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
 - Parse data from .*.cmd in generate_builtin_ranges.awk
 - Use $(real-prereqs) rather than $(filter-out ...)
 - Include modules.builtin.ranges in modules install target

Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
 - Moved the config option to the tracers section
 - 2nd arg to generate_builtin_ranges.awk should be vmlinux.map

Kris Van Hees (5):
  trace: add CONFIG_BUILTIN_MODULE_RANGES option
  kbuild: generate a linker map for vmlinux.o
  module: script to generate offset ranges for builtin modules
  kbuild: generate modules.builtin.ranges when linking the kernel
  module: add install target for modules.builtin.ranges

Luis Chamberlain (1):
  kbuild: add modules.builtin.objs

 .gitignore                          |   2 +-
 Documentation/dontdiff              |   2 +-
 Documentation/kbuild/kbuild.rst     |   5 ++
 Makefile                            |   8 +-
 include/linux/module.h              |   4 +-
 kernel/trace/Kconfig                |  17 ++++
 scripts/Makefile.lib                |   5 +-
 scripts/Makefile.modinst            |  11 ++-
 scripts/Makefile.vmlinux            |  17 ++++
 scripts/Makefile.vmlinux_o          |  18 ++++-
 scripts/generate_builtin_ranges.awk | 149 ++++++++++++++++++++++++++++++++++++
 11 files changed, 228 insertions(+), 10 deletions(-)
 create mode 100755 scripts/generate_builtin_ranges.awk


base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
-- 
2.42.0


