Return-Path: <linux-kbuild+bounces-3193-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A43795DB13
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 05:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00FC52837F6
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 03:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD23C38397;
	Sat, 24 Aug 2024 03:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cZtPWoUR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NMKw98d4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780FB1BDDB;
	Sat, 24 Aug 2024 03:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724470708; cv=fail; b=YeIOqKwaWm9Y9xokcogjhSyKj88gnyWFxkuV1GeSeLap1JD0uWA7eUtBxNkoqt7i4uUBDcJj7YuaEQ6fPInZPMNfZ0JrSeZ/flM3h4Ol7TVp4xxzmwQDFX6rXKCuwy1HbJkTi5fIZZN/8SN/AXq3d52YaNZAl7VPt+GGUIIAZf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724470708; c=relaxed/simple;
	bh=YrmsrHdvhN6Bi3OLDiVY61cRYA/t9f/Heq9ACtkmqXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGE5cXojjr2bOsVhGI5804RViAqwh9NWSslsenD7QuI0QNSAWwF7eKt4j3rHpLlnBrg2nUSvM+EfPqKQZUNNoO68qUwfTBkxomR5m1BtM5yR7I2tjU0Hk/WZwuo87Lx+/FP8YghWF3x8BCpafwBxfoonEGCNbCP02K8F3H+pC9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cZtPWoUR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NMKw98d4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47O3Nxfu006066;
	Sat, 24 Aug 2024 03:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=; b=
	cZtPWoURth0neubi6KzQ6JXjfUsAlqTyaqiQ6xEA+GYvcri2BqrC9snF0BW29suQ
	DhMR0Vyg/njjDp6CMBgLDxp4U9MIu/WFpbfwNKTUd0k2opuXCqa7InNEIVVZoSHP
	23A/PfOXDFtpQ2N/HmUACOQh7Z18s8Cxb/gnd1JFWU5YlVde6Fn+XJD36aKPUUm3
	BwGWPDkYY5ujVKla8XHPhvTWHzzHYvzo9BBq9Htuo0HDr+Sbmkj9LgYrXXmeJ/dB
	e4BPsLWsIxYX8Ui9stHISqYKX8LY6Mg5q+nuoYcGD2C3aeLBXwCIpuwgbeJ1uh0R
	v8MFl3kq03g1ra7MpCJreA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177jc809j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47O2H5XC027814;
	Sat, 24 Aug 2024 03:38:18 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4176kgh9s0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpqXFEL7LRZtZVqKPm+UJoGlOx1HGyusoFBn2jbONFY4T/gL6WDnk9Uwj8wXiZVGZlVjkmV9xDOIysECsujd/bp78oCSXGXmEeeHg/cRX3Job9tL7q6a4eTRbfxypKwSDsseZmrOLcJPj8G8iCvFwE9WYwHIWMUtgzXgo/bowt4oYNFZkUS6ZKf6LT+JzjaQ5XhneR3cfjgSY0FTU/oBUxyXQPAqTKsMxE9UnPHivVW2H3NOpjZtaGq0ADrsrIQfoS9e6hhcGFAeK2ts3MXQ4Lym+V+mnqeekjIFz5G7vArozjRKcN9VswHd9uqbRkshaztrin+GE3n2kaWtR+M11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=;
 b=kX39+saKq/YE1IdKMaAvmmiJoQSkwWR7n8/MJy1O9ixZjbF7eXTCwLC7atVDyygenvdZigyP/KftRDZt4wvjDw8zjri9SkmDPP4jcp+5ML6A4O1+d8S15OxtcEI8HSWHZRX2THoTPJYacVjZcA2jH/fu7xFYi8mP7C/8FoT4VNbQCJWSXdnaWfojVtE8fZLCyxJ0qIwN/dMaierFc5Ni+1KqyNe/aYMmgAhMz86EdMu6HfOiIF1ZOjtevk8pZXRJBkFXBioEgalHfydhIkJwsTdH4ueqCgZ3c3CDa6gvFc2BZ1y+zU4MsXM8vZ0EUK2v0QzBcO0WFTe97g2xjHaMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=;
 b=NMKw98d4SbwZ0MgmAjYxCuGX6x1DDIdF0x/cCaFfuZbKmdw3V/5nQO+tchsRCqEPDbRrFUFLZiFWcXu39eB83jROlIZR2865vV0gn9WMmvD5KzugeE0CJDm4R41Jm2y6dYyfGJgNyMNbnrwdVq1gyc3fVp5oRVvBScg8zyTHDzc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5171.namprd10.prod.outlook.com (2603:10b6:208:325::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Sat, 24 Aug
 2024 03:38:17 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.011; Sat, 24 Aug 2024
 03:38:17 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v9 4/4] module: add install target for modules.builtin.ranges
Date: Fri, 23 Aug 2024 23:37:57 -0400
Message-ID: <20240824033757.52005-5-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240824033757.52005-1-kris.van.hees@oracle.com>
References: <20240824033757.52005-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a94b779-8d45-4dcc-772c-08dcc3ee310f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yTkEKpX1fw2coJ8j9TE6qzuglIv4Sgqqp9siS+cH7eqUivfIOeFUdHL2Mst2?=
 =?us-ascii?Q?7hA7Q6SpLMyzE+moQsISnaVgdjuapGwUL9dIZXTr0G/F/07EifAXFaBW3Fr3?=
 =?us-ascii?Q?6ObIhFcjqDQixkDqsWIXhL/zqrRofo+XK2Bvuq4y44pEwOCyM97QXPQNLjHh?=
 =?us-ascii?Q?LrdsL3+K5VQbA7ggcHl+1KTmuPOumoQM36r8RPlEXnA9ANc8seBw7xqLnEmS?=
 =?us-ascii?Q?LIM24SzDpjEzwZDWg3jigZhb/GZ2kxTcfNO5ROPve1+wuAAUk285Enec8mfr?=
 =?us-ascii?Q?jScjQdVPGaa/CxIvJGv0FwpBBHDFOx0Ryfyp2yNekpdOXH2lhVVS6z6QPEe+?=
 =?us-ascii?Q?L6lX5mRNOGxXsirxxZMY6mdPcwqJ26bhWMa1t/KJQf7rLnxXFamAndZfVTT4?=
 =?us-ascii?Q?LWlJgYi49VvakKwPJYzhAl7GG/Hoc2WB53qEsnivZtOERdJD/VJJzhGdYlZC?=
 =?us-ascii?Q?G1Ljj0go4K5GlaEcu+QeTjgz0C9Zi5NMNsjmuWQwmaBG/MXl+mEHR2QvcJAQ?=
 =?us-ascii?Q?K+YoWgWZwbhW2g7ZzCbbC/qhhlgMjzyoWN18BGVh609ygkoencd5g4KSHoTD?=
 =?us-ascii?Q?E+P0mbcqTyemneCH7EPd+Ymbog+AiTtwCSbrAw3BMmpsCEIhhXc28FrxwuW4?=
 =?us-ascii?Q?6ty1S8dhcXSsKgWMHFHsqRyJkypHqoIpOdlsj2hOYMGGkCbDiUgVZeM2uMVW?=
 =?us-ascii?Q?qSRvPKpoegXyYCMsxLyH6/JINLYENoeqvxpNz79T4r6uALBItQl1YRwW2GTQ?=
 =?us-ascii?Q?h2kiY9scf+hynmp2TX4lVHcEP+xWKZTAGqRvkRtm4yVxccM3+fEWO8XCnOoU?=
 =?us-ascii?Q?5SmHz7kCCzZF9+m5bTsiQ3NQrhYsZUzFHP91ei3bmP1QFjDXB1jmPkaKBbfj?=
 =?us-ascii?Q?fYrWUnL8bXD6Tp2tebNjxeEWiS3Jj5L34f4Q4WGPv5IdoOPj/vksa3C2Sw3F?=
 =?us-ascii?Q?YGwGQxPkgUT/chxjyR4zbO71y3zjLlNBfDqARWrWjSMYgPFRVJhpLG2Vzchn?=
 =?us-ascii?Q?+I2CxsxiJPfuUm0JH5eVIVsYPuxr+NY8Deux3KRFtB+QnXJLV13dmQy/Bjfe?=
 =?us-ascii?Q?8LYd86q6rb00U1LhPp8JSoPc4WyVpNw4JS2ZS9i/8Yh8C/Pot2lwB4bLHFKn?=
 =?us-ascii?Q?3FUv54RuC88i8SM2NwghsuFJkEL9JONOL0+5RTvoQR5IxLJoWDTyKOVsKGTV?=
 =?us-ascii?Q?B9ftZoJ39fYId29TXe8xt766NDX5oK+SlNt3D8AQCWtyYgv6vU2SmgmYow5j?=
 =?us-ascii?Q?aFbSFs7wp4YjryZe2izfLVGGVywQDYlodaIyWZoTZYZR6ViS1HwLRl+H0Mpa?=
 =?us-ascii?Q?j8Odf1kMflnqg1K9mctZ/SXuLCSKGDKLlsta9opoiJmHyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z+hk7rFZaJ4kdRE7g4bRn4j1ElKIg0ZyosD6mfz7vB50xHoo8iCe+XuDkYhJ?=
 =?us-ascii?Q?0rwVHYku9iicJdMA9lo0DaaupnviHrHdtG2fEfIMQQWofy8nWrj9shLnb/QZ?=
 =?us-ascii?Q?NdRNeBI6/IkRfMYOIxEttpsrFFknGM9/9gCo2iC/QUpeWMiDsyuM0lsR0hHr?=
 =?us-ascii?Q?GeKTVhqR9+JcFmMT2G0YU/4e9SygIWdbXyMtjbMpgVAf6sZ5vIPwsjKQ+yyA?=
 =?us-ascii?Q?m19sUAZ/fYvE9cpvDQo7U60rgFAs7yuANK+wikv9KQV1/ouEfc5WYnZTiqan?=
 =?us-ascii?Q?8W9Uw934Q1TCO4hPWVyipUCjNjav08HQzXfNvCOkpK0F+Cf7D9TyEXrnqzWl?=
 =?us-ascii?Q?+KCWrunGGPATkvdSYyf7m7qmfQmYF7D0wWhis6SU6Rnb9AUq8Lt7O8MqE3D+?=
 =?us-ascii?Q?RuXfEc8aC77+oPiET7xiR7H+zLVL0EfyMT2Vg/TLdbKcuv59OKP3Pj2XmCOS?=
 =?us-ascii?Q?/m0liQcF4HtQUsWm1myCKGey0Vwn/PSjMCFH7OhK+bAPlIlzMr0ZYPXEvO0u?=
 =?us-ascii?Q?FLMzlLhaFvEmePFmIgq/2uNFm5I0dw9aGCRBznViJg9UbLyjBaOrFUSlQqFS?=
 =?us-ascii?Q?VsqQa/rcReeP/5ljzz88JWHtjpPSuD5xyq/mt7KUV46OWyH38iGaSNkmelNr?=
 =?us-ascii?Q?X1oWILCFLmJUduAfE0kWLF2d3lJWtIww8i7+kCxV8nfrYsQq+H/+k2NynNqP?=
 =?us-ascii?Q?iuhC4+s2xLXwnd2UPBDJpXajl8imIoqLgNcVjgz8w0vTYcCWe3maORGjBtCm?=
 =?us-ascii?Q?DvF6+DnW+H8ozrP254fF9sUtWahmpCfwoV1oeel3bVjEBALaUGBdwkIqWFWx?=
 =?us-ascii?Q?GfoQOJ1VSOeaLPvwn712oHH0KrhfCA7+BML1m0Y83DC5vUmk4VWH1B4ieX8F?=
 =?us-ascii?Q?G4V/+TDDEb2DWtf7CN/B0JrzJMJUqPqWCBYQ77Xz0c4jgpLVeQwxsaiAiIWh?=
 =?us-ascii?Q?pROZiIJ1SdOam0+nwnZ7bG+BsLx89LOa5jusfw42RB7wC7bI4Vzydcco08j5?=
 =?us-ascii?Q?NUbBXLwVfa74Gg6g7bM05k0rwpsAML/guPbNrszGpMQZWRUr/yuHoO8nL/te?=
 =?us-ascii?Q?eMzgu4gqZMWaZIoPSq8DR1pGVpR28wzIeLP+woVGqiLSg089wFv0J8xbXAPB?=
 =?us-ascii?Q?KcI0vQbwdyq3aV3pjtABBubATjG+xN+TjkTdeHIpuKRJiGF4kA5uWprHeLfN?=
 =?us-ascii?Q?DPVKJombQ/7cf2Jp27vPlzT1hLK36m/outyWabouitUgBAlkvzIz9VIMT7u5?=
 =?us-ascii?Q?SIk7SGV/Rb1oaa4cf/hjS3OxYuwydWhovkrZaSlysaZ/NO4r2KBycJHun3Yd?=
 =?us-ascii?Q?6nFwltJCmYsdPCS7rKJofwTUoRyTiFbIQpOvyuaFv5V0VAnV0uXRVwSL6CmN?=
 =?us-ascii?Q?1ngaou9e9oD+FusTgQJC42LBYLjUF6cel3vpQi+weIDcNy0Q29V4YoRG/7eE?=
 =?us-ascii?Q?f8pSaP7+6jNs0GGdJIQ5t/w7dj/weXbMmRHMQUaZUwhB7cNgUJBJOWBchj5U?=
 =?us-ascii?Q?J793mD/BlLMEJh3hyacYD43Z2MCgEr9nPWbko5+Dc83NNOLfY5+uGqg4gxwP?=
 =?us-ascii?Q?y1Uvlfk0fV4NIDK6AtQaWZ0dZGuzelpQ4racjYHASNmOPqJ3fkg798+y/Uev?=
 =?us-ascii?Q?90e65k3aAdPl4POznvqCm/E=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gULjw4rBMSF83n/NPzhSgWinBVJdFGbqwTwmD6iV2Ee6OiNarZ5pzmrZ8GfcPRpqtQKxn6KxxPP5/i3bFAfrq/o45ND1xnFpwOvsaWUjExxFB2uDQd8LPiAm4pDndvSpWAJTbot+oxLtK+OwKfeam07UiLLw9IkGJbr0GD3ox1tPVSqMwXyJpEmKDUYBCHRGrpkJS6f6bs1ELIgemTk4Ovei/PlrJGoCvbHgS9xVl18fSw4YQtvjMOGLyNYLBvgva0f/9kK5J0SLp9Lcr01c0LL2BI1B1ZJ9k3HNCl04utsiYBI1XbXGeh5nhzx0+QWyD6p+YFmZW3rmKNgahozPSGqoLgnyLcmmlxHiuQMXjoiCK0+Dwx/DuosLJvP5N95U1SQXa7ZuJVD3vzWstHfxNZjokxs5O0c18zhWZS72fcTzAMhxP4g2UxMea2Pomj+vWhZlu2Itj2sAdKshSF02QLRIq4PZaXOH3C9EFkS5I+iZqJWAjhMZnhAG07JcfmKlqcnM6NvhTrdfJqdpuqSKyLo9IqT4S7pMSavVkrtm4Qkcdt8cROtDcy5LN4DpDDCnLIOMKMewEXovNNO6P9eHoV55RVFsrJ9aKbskPyKzljU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a94b779-8d45-4dcc-772c-08dcc3ee310f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 03:38:17.3146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEwyPPw1bkHuW3uj9UYtls6mZk01A7iYPrWkeDEq8RerTIVSBOjKMrNavSd+bA0pBbHQqFvFkuoCdjN5MXnbuhe4QlVXz6yyz9+43+720Cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-24_02,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408240019
X-Proofpoint-GUID: Icz9bbXmGphPQzklxdZuKCxk3H-ELp-r
X-Proofpoint-ORIG-GUID: Icz9bbXmGphPQzklxdZuKCxk3H-ELp-r

When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.ranges
file should be installed in the module install location.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
    Changes since v3:
     - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=y
---
 scripts/Makefile.modinst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0afd75472679..c38bf63a33be 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -30,10 +30,12 @@ $(MODLIB)/modules.order: modules.order FORCE
 quiet_cmd_install_modorder = INSTALL $@
       cmd_install_modorder = sed 's:^\(.*\)\.o$$:kernel/\1.ko:' $< > $@
 
-# Install modules.builtin(.modinfo) even when CONFIG_MODULES is disabled.
+# Install modules.builtin(.modinfo,.ranges) even when CONFIG_MODULES is disabled.
 install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo)
 
-$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo): $(MODLIB)/%: % FORCE
+install-$(CONFIG_BUILTIN_MODULE_RANGES) += $(MODLIB)/modules.builtin.ranges
+
+$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.ranges): $(MODLIB)/%: % FORCE
 	$(call cmd,install)
 
 endif
-- 
2.45.2


