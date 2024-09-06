Return-Path: <linux-kbuild+bounces-3434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1CF96F73A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3BCE1F23874
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 14:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7F91D2786;
	Fri,  6 Sep 2024 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oLkB337h";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PmGV60zN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D9A1D1F73;
	Fri,  6 Sep 2024 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633938; cv=fail; b=i/JbH7VQP/ws05qOlfs/YGjOt803SksME2lerZ0QbJutBesIQSQ9Krrrm93PncVR1J7BQ57Hjujloyr/X5fs+j1mJkUf7J/rjyTGYbsltwwlMILqoyHLqNoXMJSVDKNYbI/uQnl+mjUeoSwY/bvR/h6iQLjK3DtZpeRbthl2eOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633938; c=relaxed/simple;
	bh=4keTUewJapTO1hiSSZeuY1Wotchhqw9piHLcrakZDh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o5zk87nyBuuoWeyT90xsljHK9pnmQUBWYAofMjb27HerhmfnGJnkBqPGZ2+qu7lXhiXZWw3epXh+J12If3jmjtfOKEGxtv2YLafFVMiYRfxUmVUq7Xcbj3aygb6WGAej8S+q0Q6QeKfB8AtyOReXq8N60nuyfUNSaWf9uwhl7LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oLkB337h; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PmGV60zN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486DMGpI029257;
	Fri, 6 Sep 2024 14:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=vCV6jYxgOVsdkWy7GS3x9lfzdB9N0ixHt+72Ty+qzcY=; b=
	oLkB337hzkEhRX9otc+yiI5aFqluhlVRzZCJnxluMvc5uzEcSgirpvfkK/62nvla
	MugTml58jfzUHA5DxU4JCDBu4iggwRHbL0m4pleT2FHXh2ga+it/p03V+mdObYT5
	xsOAgMx95EtM+xm0MdyAQcltz3hnxUVUr5y0Y5q+P+iC1scajL+5pyzqGflEZjrL
	SeIWXk+RjS71IV24gqpknzue9QMAGWP5DORc23hQ83E4G2dRT9UfaWQgN+4fEzaZ
	2B26metbTOKRubVpjds2qeeZ7m0ALSXMiruLuPD3HR6M5zYxUHL+tFkbMfbnWvo9
	VR0Src80hCxN0ush1zapYw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwjhtgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486DbpQj018335;
	Fri, 6 Sep 2024 14:45:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41fhyh1w8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugYc+DGcj5LV2wyxN8LhBymfIe/GlXOgm6xGt839JX2kX83VuoQvREnMrO/lQ6XnoTxdi1BswOnspUBWGnkJUD/2EJqhh3Q/ESFu62Fz6GUlYSyl4gbd0mu2J6j1nFcXoKy0d9jT45pL7DE8BV+Tm0Wtgb5iUvj3r0mMoZDF5PsvKWgmtj2cmD52KXsSCsCq1jmi6RxsHpMreX3Kj1QtPxfaH8JwSUZ83qMn9t0idtBy1kVcIzDaXlgVk5Lw+jjDbz63vnZ/0TikFqqhujGKlwEljVx7/y0YnwJYD5Wx6JXPcmr7MFqKmhJgLKxqnxBI49NtB+nxruwRjBCt+bsIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCV6jYxgOVsdkWy7GS3x9lfzdB9N0ixHt+72Ty+qzcY=;
 b=m7BfZMvkQR/tFmosaLzl04uuV0seGw6NgmDgzLXTDxDL6QVsQq0l4u1Sj/7pkow7OtsqfAY502IgDoH7tzLdDUuVVUSumkqM3mBnVmGl1yWPrZl5hTvyoudwmGByDr52yqXKsUrtULMEG8Vx308+LhlIeHHNddwnHuH2IxFsSoZdvT0VIH8fuRCJwCgJuICrrPfXCLY5blhwF6V+acwxAV01Ys43QwgZUXtj4n0uvWTR3EuTMw+lNf7RSsZv4nwZeLJ2b+RcDmX41O00O2IlSMm4cuK1kVmlEv6lA2bj16W0bqaqzyFgie4t8DbH8eGR3WDEhvjzjOYLOKPexfo5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCV6jYxgOVsdkWy7GS3x9lfzdB9N0ixHt+72Ty+qzcY=;
 b=PmGV60zN6/1QY2WpEMuFDtxSsNI5i6UEhX0oODDUtuD/vzAPT2P+HuESTJZBk2Ib8a9YOPb2+jXP8FGoMhcXpmdLVoCjYIj1ux33VqJnV7o5LnxHk28ZkzegW73Zj6AN18JM4apF6FRxcIJ4Gaw2YoMYsE2Ad5DMd6vR3GCBZpw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB4791.namprd10.prod.outlook.com (2603:10b6:510:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Fri, 6 Sep
 2024 14:45:21 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 14:45:21 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>, Sam James <sam@gentoo.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v10 3/4] scripts: add verifier script for builtin module range data
Date: Fri,  6 Sep 2024 10:45:04 -0400
Message-ID: <20240906144506.1151789-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240906144506.1151789-1-kris.van.hees@oracle.com>
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b75181-4e01-44d8-f43e-08dcce8288ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qZM3wqrBai733mIe7w1eJyFygqw/ASgAsBc5RqtX2USeSqPje1wN5+88uuKo?=
 =?us-ascii?Q?NVCJjJBs7NuUjr40O8qvHueMMi0Bfae2Oi8xbiw1pgMuSDbku6Xd2gXPXugT?=
 =?us-ascii?Q?BnrijgxiQbhJwY/ihwwNSH0idwrXJ0whVTq9c7Zp8CXFYefs5ye8dGQSpeo0?=
 =?us-ascii?Q?hcc4pedmI0OaXR3Q4zSIL5M4ZPWB88xwl0bzOawpQcf04DWov1avVgmSrx7e?=
 =?us-ascii?Q?UKWQRWbi1o1r3PMa3YAPkycCDNEY2XA0fxV5gLa4aoBfdWOtlRsrFSzWKTXT?=
 =?us-ascii?Q?WC96ZRHOLp0/4OiRj0xP2nMvA+SiDdFE2L/xirTILhh6+yIp7WVDEVLt2PWR?=
 =?us-ascii?Q?JBPVauzHLuk1gifJvr972uw/R/rejJzc2DH3rzIg97z7zLng8UhNG39dTgvg?=
 =?us-ascii?Q?8MexaaMdM4Z86AOgucAiDrEkkPW5ICGsg0bEJnjV5mOmi8bYG4AuHeHFQy0n?=
 =?us-ascii?Q?6E+w+B6H5WEUAnl6dObgCGH1+zM6LBp+Hz7AMt9Lyn2R98FxiJfs4nGQlqhZ?=
 =?us-ascii?Q?PT6wQrJM3m/X4VusZRNBSaxSnxnQBOHv9iD6/+pnjUiLY1Q/VJmJwoIG8Mna?=
 =?us-ascii?Q?C8voBQRydbufXZ7jXXSXUih+pHZPxr0xef5y0qWXIYlPeb03vn1kkZNGQmt2?=
 =?us-ascii?Q?NuQJkyJ5GkrbWMrWzUQdEN9bXqx0nQCU6IJ5VeUVPBm4rs59m7WvwhI4w9UK?=
 =?us-ascii?Q?gZ0+mnEkAEuRfvAN6fQ5wFu7KEjo2Jsf5qtv+Qdh3SExU4c79CifHcpl4Fth?=
 =?us-ascii?Q?gl7seNlaPwokclAYoTImnpG6h09qDzuXqJwHlDc50VVuj2IgUoPTgrjOdVqE?=
 =?us-ascii?Q?nKJYBPDa7V0OISNMHrAMrMcGs1gPdY0WQZf1JY2rB/7c+BBdjPHKNGQ2qqpD?=
 =?us-ascii?Q?zvs0ld+FVi+HYBfiFGkMb6PHFUHXm//D9SA6GJrKwLPOPOw58l8Rrqpx2aRa?=
 =?us-ascii?Q?Qik/AK4KS0c39XyjZ5VR5F9/Qkzqcb9OYveAxqIMFaqLSX5x9/cEzPSfymV0?=
 =?us-ascii?Q?uolzTfndCjcekXiSKQ41E5epabuvqOJUYfA0B53dR26PIHkmXgm32osiYvnS?=
 =?us-ascii?Q?T3bhXlgE0xk88YeIndhZfgUYDymVodm4vfQKwXFasvtYtyUbqb+SUqEBoyWj?=
 =?us-ascii?Q?gA6mhQQ9OMkSlTt/aHYuZRRCJkvXXSYvfW43eHcO28ZwD3aXkEzrNC8RIQ1+?=
 =?us-ascii?Q?JX2EPP1+DYOQpcsJXzi2H11bs/C0EjEV+OXyO9xeDtusTW8N3VhALy5LSzT9?=
 =?us-ascii?Q?zb2rEXy+SzmKB6H735OjIoYSJBsSpi9fT960azkGANkye28tMJVOUuxpBJhx?=
 =?us-ascii?Q?FHfZQ7bxZvMIgFSHRhf2PM/nQaRO89owIj0UC2GG+Rc8lw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e9L6r/qKLJDu+G1GRgXfzOs3jcGiYt4HVnnl1vWTB8OpFssUWeig031Jt8jm?=
 =?us-ascii?Q?0uyglnNM6BuG4X0KMHybjLwqQNsXFFVXGWG+ZWJB/0YyednKNTPbB0j5GM2O?=
 =?us-ascii?Q?ANimAkSbARtQDddIkSgiaYv6+M6h2lzhHWPRLlApBP8SoA5bCk1fRnhzJKmo?=
 =?us-ascii?Q?2YEEvwblc3T9tJmoM9G3OZ1DzeywsUevuGbekZsqwOHZwA0J+2erFpR3i9en?=
 =?us-ascii?Q?z3RRem33LqbMvFv3+MbNJE6IrrDZLg1VcXIeN4R/dU+l8D0sadD+uV9BZ1oi?=
 =?us-ascii?Q?ifoAbBygK2le/81RRMSSIDcng7hry2pZ3THCjy0ZWLyVRvXtz4edryRuiOZ1?=
 =?us-ascii?Q?6zvqG6Q4vIllzgkGcvSVKv9urq2ogw5OkQ2aT7kqrN5yYE72uR2zXH9hAUgO?=
 =?us-ascii?Q?RzpSgYfetCIKZx6wEm7LJPb18rHxQeH+sk/Siul8euJgbvP88GRKHnmgw/oS?=
 =?us-ascii?Q?T2afSoDHz0mW8N+bCHwGQbAB2DtezgjD7iPl8IllgBW1PxhlqrWxbusP0oWC?=
 =?us-ascii?Q?kbcD2KQvp4jAd8JzLkOguuvi7ofNd2U4c1za4HgjJffUtKXOoFSqYH1KsyFb?=
 =?us-ascii?Q?2WT9PfTUnqXQM1fUKWgXkaYRDMx+D3KohuulNnWm/uU0yDccUZJ/bLY5eoOa?=
 =?us-ascii?Q?ocfT/9dL0Wqqp26NPhzhTeKo9RDMgI4Rpy8994L52U6Rj4oak3fzZY9Wp/ss?=
 =?us-ascii?Q?9UURJqzcBift3qfEbR5XfKenkkX0QzQpvTuaT/ELG91dLnOEJtzckjc7ms3f?=
 =?us-ascii?Q?S6FTkloX8/DAzvAQR7GHUYIxtawKBzKI2wkZWaBcHtjPVwSuXFLHhxG9opxC?=
 =?us-ascii?Q?5vwllNY9mEco8wCObLsFlFCahMTTDv4n9B9WALWUCabxzRa00A0Xe4Mn19PX?=
 =?us-ascii?Q?plKFOV3qd/xEp0IPC9FlK07sZ0rV2NIIIx2OYU5V+1/aC9AiWmS5mBv0pK8n?=
 =?us-ascii?Q?kKtCAu7M+Zjh9KZE0GKN7YLKbTu8ehS+vwYpNs6Ulud/O0ZPN8T/Yd/j2Xd1?=
 =?us-ascii?Q?zWyCMUo3NLE0FhpWNib9S2OoefBGL5GL1LnRSUyhacQKA4AYXfCnpfDs0qWu?=
 =?us-ascii?Q?LlFIz0Td3ed8PDTijKucRUp/eX5mPL1LyWo0HavngnToFf3dVS6lV4I0wGfi?=
 =?us-ascii?Q?IBijMKH21dfS0cGKL3T3VNgXIwBRT4/Vdgqsi2rnozlQIp2FATpglBnJFP5+?=
 =?us-ascii?Q?q+8KhigN9j/pPNiQR+pkPXojeey2tsy6gJ7d6HuMgzAc6V1QTk7X1eXWOIEe?=
 =?us-ascii?Q?YFiHTLkwry0COcYmi2zDcwnCd93CuNv6D2YGVgoRMICD2axnJBc+lmf9ldSB?=
 =?us-ascii?Q?DDooG8KlPcLKz5jQFI83t/sepSsmy3/dtTNxlocnADaR1gvO+k97yhldImZW?=
 =?us-ascii?Q?Kl6mKZtjyBnEH509iK4G1D+2pn7VWvVbFiv/oiZWmAVXvsrT1y9Zj42IHLzx?=
 =?us-ascii?Q?fTuO0FT2H0CgJCjx18FJxnGEzjvV+Z3XCOEew8YI3H+sByRnRexOykzqq5LM?=
 =?us-ascii?Q?Zxqf+rwOgRIMAH3ZbCOWr8i0+Nz4imFVROtPk45nTDLMNcQJji8DDZcOIyjb?=
 =?us-ascii?Q?d30qs3Xag7xubIyGcKAmAB/irxMp2IyiOEBUj6Mlu2x2sq2Idc80cR0jsTpL?=
 =?us-ascii?Q?VAar3GzoZMkn3pyLitfwpv4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cfuO7lJuiULNWlZwfVxfaOoJdF/9VprV94ZHUDRe+nCZVlWfmnEU/TeHFxzsM0O0aYAF4gGCZRQLSpuTxVquGIBdsXNpfoPQ+mZvtOScShOhsNoML9I87jbrc3LSOqkYoWQyMC/KKJselyVA9Hu2nN0M849ntyFjxPYZSn1ESmXj34M7HJBJ7o+yl5daBPMlWKAQhVEP8m8jmZ92He/1oqkEUJONJsvznp7JiqdH4gy9t8Vl+ssiqYzxHc/5uw6T3l5q4pn7/0kGn4VmNPnilHwy0GXDVCnrjEj8jQZodV+Pr8pIYrKZtBfKZSaFTbp1ws39wxceUTCfd9xEzBjJNprxjsVBOefnD2hmKgZIZtZI18nZkue7X/ag1yo601YR2bb4nuG20ueVQg9xyBeuMh0yk1KWbSnsbUiz549RzgkGulauKeAak7fbKIr/nxSYcqgCETD/SRMbhIXB2ZtnysRsVTN1a67kw2C8uaNwBZmqA/30bYDSYDIp79kBkg1tX3zpcJmufs9tVdge7toBTwcLiNGUpkoqnuRsWrGNtoPFrdYhJ+vp6BWRXVvBuMqKFOIEc/g0bbWSxE4IrW4iZmnrUAyhe6vMPmIR3iIWUAw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b75181-4e01-44d8-f43e-08dcce8288ac
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 14:45:21.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZW3w2vJWRl2c7bQRc1BZ2NxpRJRrUK3hIJMOU5PXCko+WijEMCchx92wa4WqApRDtwm9/hnAFqi4Bv+gFuQpGPmM43xAWyUT7V9v2bkvBG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409060108
X-Proofpoint-ORIG-GUID: kEcWjBXFw8AjDp9H08DFCGDfBFfrskix
X-Proofpoint-GUID: kEcWjBXFw8AjDp9H08DFCGDfBFfrskix

The modules.builtin.ranges offset range data for builtin modules is
generated at compile time based on the list of built-in modules and
the vmlinux.map and vmlinux.o.map linker maps.  This data can be used
to determine whether a symbol at a particular address belongs to
module code that was configured to be compiled into the kernel proper
as a built-in module (rather than as a standalone module).

This patch adds a script that uses the generated modules.builtin.ranges
data to annotate the symbols in the System.map with module names if
their address falls within a range that belongs to one or more built-in
modules.

It then processes the vmlinux.map (and if needed, vmlinux.o.map) to
verify the annotation:

  - For each top-level section:
     - For each object in the section:
        - Determine whether the object is part of a built-in module
          (using modules.builtin and the .*.cmd file used to compile
           the object as suggested in [0])
        - For each symbol in that object, verify that the built-in
          module association (or lack thereof) matches the annotation
          given to the symbol.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
Tested-by: Sam James <sam@gentoo.org>
---

Notes:
    Changes since v9:
     - Fixed support for LLVM's lld linker map format.
     - Reverted additional of build directory as optional 6th argument.
     - Updated error message when .*.cmd.o cannot be read.
     - Added syntax output when insufficient arguments are supplied.
     - Return 1 if verification failed.
    
    Changes since v8:
     - Added support for built-in Rust modules.
    
    Changes since v7:
     - Removed extra close(fn)
    
    Changes since v6:
     - Applied Masahiro Yamada's suggestions to the AWK script.
    
    Changes since v5:
     - Added optional 6th argument to specify kernel build directory.
     - Report error and exit if .*.o.cmd files cannot be read.
    
    Changes since v4:
     - New patch in the series

 scripts/verify_builtin_ranges.awk | 370 ++++++++++++++++++++++++++++++
 1 file changed, 370 insertions(+)
 create mode 100755 scripts/verify_builtin_ranges.awk

diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_ranges.awk
new file mode 100755
index 000000000000..0de7ed521601
--- /dev/null
+++ b/scripts/verify_builtin_ranges.awk
@@ -0,0 +1,370 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+# verify_builtin_ranges.awk: Verify address range data for builtin modules
+# Written by Kris Van Hees <kris.van.hees@oracle.com>
+#
+# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
+#				   modules.builtin vmlinux.map vmlinux.o.map
+#
+
+# Return the module name(s) (if any) associated with the given object.
+#
+# If we have seen this object before, return information from the cache.
+# Otherwise, retrieve it from the corresponding .cmd file.
+#
+function get_module_info(fn, mod, obj, s) {
+	if (fn in omod)
+		return omod[fn];
+
+	if (match(fn, /\/[^/]+$/) == 0)
+		return "";
+
+	obj = fn;
+	mod = "";
+	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
+	if (getline s <fn == 1) {
+		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
+			mod = substr(s, RSTART + 16, RLENGTH - 16);
+			gsub(/['"]/, "", mod);
+		} else if (match(s, /RUST_MODFILE=[^ ]+/) > 0)
+			mod = substr(s, RSTART + 13, RLENGTH - 13);
+	} else {
+		print "ERROR: Failed to read: " fn "\n\n" \
+		      "  For kernels built with O=<objdir>, cd to <objdir>\n" \
+		      "  and execute this script as ./source/scripts/..." \
+		      >"/dev/stderr";
+		close(fn);
+		total = 0;
+		exit(1);
+	}
+	close(fn);
+
+	# A single module (common case) also reflects objects that are not part
+	# of a module.  Some of those objects have names that are also a module
+	# name (e.g. core).  We check the associated module file name, and if
+	# they do not match, the object is not part of a module.
+	if (mod !~ / /) {
+		if (!(mod in mods))
+			mod = "";
+	}
+
+	gsub(/([^/ ]*\/)+/, "", mod);
+	gsub(/-/, "_", mod);
+
+	# At this point, mod is a single (valid) module name, or a list of
+	# module names (that do not need validation).
+	omod[obj] = mod;
+
+	return mod;
+}
+
+# Return a representative integer value for a given hexadecimal address.
+#
+# Since all kernel addresses fall within the same memory region, we can safely
+# strip off the first 6 hex digits before performing the hex-to-dec conversion,
+# thereby avoiding integer overflows.
+#
+function addr2val(val) {
+	sub(/^0x/, "", val);
+	if (length(val) == 16)
+		val = substr(val, 5);
+	return strtonum("0x" val);
+}
+
+# Determine the kernel build directory to use (default is .).
+#
+BEGIN {
+	if (ARGC < 6) {
+		print "Syntax: verify_builtin_ranges.awk <ranges-file> <system-map>\n" \
+		      "          <builtin-file> <vmlinux-map> <vmlinux-o-map>\n" \
+		      >"/dev/stderr";
+		total = 0;
+		exit(1);
+	}
+}
+
+# (1) Load the built-in module address range data.
+#
+ARGIND == 1 {
+	ranges[FNR] = $0;
+	rcnt++;
+	next;
+}
+
+# (2) Annotate System.map symbols with module names.
+#
+ARGIND == 2 {
+	addr = addr2val($1);
+	name = $3;
+
+	while (addr >= mod_eaddr) {
+		if (sect_symb) {
+			if (sect_symb != name)
+				next;
+
+			sect_base = addr - sect_off;
+			if (dbg)
+				printf "[%s] BASE (%s) %016x - %016x = %016x\n", sect_name, sect_symb, addr, sect_off, sect_base >"/dev/stderr";
+			sect_symb = 0;
+		}
+
+		if (++ridx > rcnt)
+			break;
+
+		$0 = ranges[ridx];
+		sub(/-/, " ");
+		if ($4 != "=") {
+			sub(/-/, " ");
+			mod_saddr = strtonum("0x" $2) + sect_base;
+			mod_eaddr = strtonum("0x" $3) + sect_base;
+			$1 = $2 = $3 = "";
+			sub(/^ +/, "");
+			mod_name = $0;
+
+			if (dbg)
+				printf "[%s] %s from %016x to %016x\n", sect_name, mod_name, mod_saddr, mod_eaddr >"/dev/stderr";
+		} else {
+			sect_name = $1;
+			sect_off = strtonum("0x" $2);
+			sect_symb = $5;
+		}
+	}
+
+	idx = addr"-"name;
+	if (addr >= mod_saddr && addr < mod_eaddr)
+		sym2mod[idx] = mod_name;
+
+	next;
+}
+
+# Once we are done annotating the System.map, we no longer need the ranges data.
+#
+FNR == 1 && ARGIND == 3 {
+	delete ranges;
+}
+
+# (3) Build a lookup map of built-in module names.
+#
+# Lines from modules.builtin will be like:
+#	kernel/crypto/lzo-rle.ko
+# and we record the object name "crypto/lzo-rle".
+#
+ARGIND == 3 {
+	sub(/kernel\//, "");			# strip off "kernel/" prefix
+	sub(/\.ko$/, "");			# strip off .ko suffix
+
+	mods[$1] = 1;
+	next;
+}
+
+# (4) Get a list of symbols (per object).
+#
+# Symbols by object are read from vmlinux.map, with fallback to vmlinux.o.map
+# if vmlinux is found to have inked in vmlinux.o.
+#
+
+# If we were able to get the data we need from vmlinux.map, there is no need to
+# process vmlinux.o.map.
+#
+FNR == 1 && ARGIND == 5 && total > 0 {
+	if (dbg)
+		printf "Note: %s is not needed.\n", FILENAME >"/dev/stderr";
+	exit;
+}
+
+# First determine whether we are dealing with a GNU ld or LLVM lld linker map.
+#
+ARGIND >= 4 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
+	map_is_lld = 1;
+	next;
+}
+
+# (LLD) Convert a section record fronm lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && /[0-9] [^ ]+$/ {
+	$0 = $5 " 0x"$1 " 0x"$3 " load address 0x"$2;
+}
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && $5 ~ /:\(/ {
+	if (/\.a\(/ && !/ vmlinux\.a\(/)
+		next;
+
+	gsub(/\)/, "");
+	sub(/:\(/, " ");
+	sub(/ vmlinux\.a\(/, " ");
+	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (LLD) Convert a symbol record from lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && $5 ~ /^[A-Za-z_][A-Za-z0-9_]*$/ {
+	$0 = "  0x" $1 " " $5;
+}
+
+# (LLD) We do not need any other ldd linker map records.
+#
+ARGIND >= 4 && map_is_lld && /^[0-9a-f]{16} / {
+	next;
+}
+
+# Handle section records with long section names (spilling onto a 2nd line).
+#
+ARGIND >= 4 && !map_is_lld && NF == 1 && /^[^ ]/ {
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# Next section - previous one is done.
+#
+ARGIND >= 4 && /^[^ ]/ {
+	sect = 0;
+}
+
+# Get the (top level) section name.
+#
+ARGIND >= 4 && /^\./ {
+	# Explicitly ignore a few sections that are not relevant here.
+	if ($1 ~ /^\.orc_/ || $1 ~ /_sites$/ || $1 ~ /\.percpu/)
+		next;
+
+	# Sections with a 0-address can be ignored as well (in vmlinux.map).
+	if (ARGIND == 4 && $2 ~ /^0x0+$/)
+		next;
+
+	sect = $1;
+
+	next;
+}
+
+# If we are not currently in a section we care about, ignore records.
+#
+!sect {
+	next;
+}
+
+# Handle object records with long section names (spilling onto a 2nd line).
+#
+ARGIND >= 4 && /^ [^ \*]/ && NF == 1 {
+	# If the section name is long, the remainder of the entry is found on
+	# the next line.
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# Objects linked in from static libraries are ignored.
+# If the object is vmlinux.o, we need to consult vmlinux.o.map for per-object
+# symbol information
+#
+ARGIND == 4 && /^ [^ ]/ && NF == 4 {
+	if ($4 ~ /\.a\(/)
+		next;
+
+	idx = sect":"$1;
+	if (!(idx in sect_addend)) {
+		sect_addend[idx] = addr2val($2);
+		if (dbg)
+			printf "ADDEND %s = %016x\n", idx, sect_addend[idx] >"/dev/stderr";
+	}
+	if ($4 == "vmlinux.o") {
+		need_o_map = 1;
+		next;
+	}
+}
+
+# If data from vmlinux.o.map is needed, we only process section and object
+# records from vmlinux.map to determine which section we need to pay attention
+# to in vmlinux.o.map.  So skip everything else from vmlinux.map.
+#
+ARGIND == 4 && need_o_map {
+	next;
+}
+
+# Get module information for the current object.
+#
+ARGIND >= 4 && /^ [^ ]/ && NF == 4 {
+	msect = $1;
+	mod_name = get_module_info($4);
+	mod_eaddr = addr2val($2) + addr2val($3);
+
+	next;
+}
+
+# Process a symbol record.
+#
+# Evaluate the module information obtained from vmlinux.map (or vmlinux.o.map)
+# as follows:
+#  - For all symbols in a given object:
+#     - If the symbol is annotated with the same module name(s) that the object
+#       belongs to, count it as a match.
+#     - Otherwise:
+#        - If the symbol is known to have duplicates of which at least one is
+#          in a built-in module, disregard it.
+#        - If the symbol us not annotated with any module name(s) AND the
+#          object belongs to built-in modules, count it as missing.
+#        - Otherwise, count it as a mismatch.
+#
+ARGIND >= 4 && /^ / && NF == 2 && $1 ~ /^0x/ {
+	idx = sect":"msect;
+	if (!(idx in sect_addend))
+		next;
+
+	addr = addr2val($1);
+
+	# Handle the rare but annoying case where a 0-size symbol is placed at
+	# the byte *after* the module range.  Based on vmlinux.map it will be
+	# considered part of the current object, but it falls just beyond the
+	# module address range.  Unfortunately, its address could be at the
+	# start of another built-in module, so the only safe thing to do is to
+	# ignore it.
+	if (mod_name && addr == mod_eaddr)
+		next;
+
+	# If we are processing vmlinux.o.map, we need to apply the base address
+	# of the section to the relative address on the record.
+	#
+	if (ARGIND == 5)
+		addr += sect_addend[idx];
+
+	idx = addr"-"$2;
+	mod = "";
+	if (idx in sym2mod) {
+		mod = sym2mod[idx];
+		if (sym2mod[idx] == mod_name) {
+			mod_matches++;
+			matches++;
+		} else if (mod_name == "") {
+			print $2 " in " mod " (should NOT be)";
+			mismatches++;
+		} else {
+			print $2 " in " mod " (should be " mod_name ")";
+			mismatches++;
+		}
+	} else if (mod_name != "") {
+		print $2 " should be in " mod_name;
+		missing++;
+	} else
+		matches++;
+
+	total++;
+
+	next;
+}
+
+# Issue the comparison report.
+#
+END {
+	if (total) {
+		printf "Verification of %s:\n", ARGV[1];
+		printf "  Correct matches:  %6d (%d%% of total)\n", matches, 100 * matches / total;
+		printf "    Module matches: %6d (%d%% of matches)\n", mod_matches, 100 * mod_matches / matches;
+		printf "  Mismatches:       %6d (%d%% of total)\n", mismatches, 100 * mismatches / total;
+		printf "  Missing:          %6d (%d%% of total)\n", missing, 100 * missing / total;
+
+		if (mismatches || missing)
+			exit(1);
+	}
+}
-- 
2.45.2


