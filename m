Return-Path: <linux-kbuild+bounces-8257-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62160B16F69
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 12:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 574E2620D9B
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Jul 2025 10:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB9E20C461;
	Thu, 31 Jul 2025 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n2+D3R5m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cZL5Vg2Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A2A1F8690;
	Thu, 31 Jul 2025 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753957482; cv=fail; b=HOcOyKAsNJjfcae9cSJSfe1jkd6eNMLXuM/dOvA+M1T+LxIehbzZcqBT90QPXbBEse5JIR//cfOqx7KC67VmZ7JZYrVoTySh4bERrLTvhGixCVITlOjzyWaQGjnMUDCN423SPQeG7Zesf/JkZ85F9TY8C7Bdesp7VuJtpi1onr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753957482; c=relaxed/simple;
	bh=4r/JO3xQC5fIe6cnqt93VpsuRy2plKoU7kahYA2VISY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ObLYExuji5+NeOry7HrWcREWY3PlJTFXVUCgFSxsyxq82nLizOK0Yj78c2n8qJfFE31jwvk//PCvWqX0HDLPI9n6g+3WA0HBLUeLmHVDVhYFLgiw46ZKlRUy1NLBPmTIahA9SMejQcPF8Bn5vPY9kRwlar6G2N1rySvpvIBoLJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n2+D3R5m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cZL5Vg2Z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V7C4Fu008506;
	Thu, 31 Jul 2025 10:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4r/JO3xQC5fIe6cnqt
	93VpsuRy2plKoU7kahYA2VISY=; b=n2+D3R5mLhwKwHvDgXKVHx8kmn2aLXBEDy
	DI8zqcAKk7fpKdYmsqd/1oFDNhKAy803NmKHZxj2VJSiXkVd94QyADbkM+LlHxLE
	Z2dj+Cr/wBy2DqMfSuym7YEfT+Lrk4nPtuiZnv9e/XQsKiChuveQcBubJruCmZZd
	1vb7tt7hxDMoLONbc2nlrsGuu2cZz7ZycO5jAlW7SSrs6ESLFuDw/KpMn8PWdG+0
	bsxlnsGATtRuLqr5SosXiPK385oe/LhD9el+sa6hRCER/JDKcT9W+h8rkqrkhHo4
	ISf0WTZZjW2vCp2IOJJU3Ka9hbUd5XR6Wgf9k5Qc9g12jvwJU4jw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5x3nfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Jul 2025 10:24:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56V8B6mK016669;
	Thu, 31 Jul 2025 10:24:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfjmuyg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Jul 2025 10:24:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJupLCznsoQJ7DXj+kX7f3uxgA/CfxstFDDuzOLfeiwKoqn3ccfulSPwT3KHjmzsIV17zzBs8kmUzH5sO5F9fObn36i/bVXxNf4JOXyZDzx/R2nwlhAnHmyYoOs1jr1Gn4cycGq6aj2IEgQjYCXqCftDTtWZGy4DsSQAT24Sr6vpHxfvDJGOWeWXxdZ44U+1EELUDjozsZCNRqzyxnBC/gj+LxYsm7QFZqBvnbCGwYRPprhgZ5WTszvDjEflV3YjQFhiYHFNKvtE5wdjvElv0ytttbfbBHurLiKa4rrxMlxQSocQ+VhzH42AwFJFx1tt7Tk2aNei8kM3Leq1NsOSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4r/JO3xQC5fIe6cnqt93VpsuRy2plKoU7kahYA2VISY=;
 b=LFg6e4F7zkK+umi0Y9HQag427cP4ZIZRC6+U3eWU5uXdYyoyMVjmoHoCazolNUF49kWij/ewxfx9DfK2J4MGpffZsfuTHmTct5vK7z/7xDx+komMtCMc184OLEb8zNd9eriulw1xxjGfIeVE0Gf9AmD+U61auHipxvzbOY9MY5P/6FXgOibcHXH3ItQ2w+TxirZmv7hI2pShUql/lPrUzojsPtIdfp1zbQocyCCNYglR1V9pSRLoJes+4QAlOa99+sNsKBue14AD86zztrVAZjG0/3Ou42RGtgIG43twUb1d1/fmw6e7i+65quL3R0ZeU8lTiwGKDR/ZMscab4a8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4r/JO3xQC5fIe6cnqt93VpsuRy2plKoU7kahYA2VISY=;
 b=cZL5Vg2ZOn89nqjgljcVuMj+53/bqEG8fOs1z0MgJUtC8HE5muIka9XmInwCUTvJlpb+Tf+is1zPAI9SsN/wi45LgeB3dJ7meufBbH3A1x2Eb0pLHIwYMUAeMmJBo6DYIYrVnwmBekKyKOVQUx2TwXHY0+Wo700bMp5/04CKhzQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB7052.namprd10.prod.outlook.com (2603:10b6:8:14c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Thu, 31 Jul
 2025 10:24:22 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 10:24:22 +0000
Date: Thu, 31 Jul 2025 11:24:18 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, niecheng1@uniontech.com,
        guanwentao@uniontech.com, Jun Zhan <zhanjun@uniontech.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] tools/testing/vma: Fix function parameter declarations
 for GCC 8.3 compatibility
Message-ID: <37b606a7-17c6-4865-a78a-ddde1bc15649@lucifer.local>
References: <EFCEBE7E301589DE+20250729084700.208767-1-wangyuli@uniontech.com>
 <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>
 <CB890ABC56C2FA67+56b95783-ed70-4744-9fc5-f2d93ddf2c12@uniontech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CB890ABC56C2FA67+56b95783-ed70-4744-9fc5-f2d93ddf2c12@uniontech.com>
X-ClientProxiedBy: GVX0EPF0001A03F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::484) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0a1a9c-fa5b-4b0b-1646-08ddd01c6ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H0Bvhyo9muRR8Q+kxo0sXR47lYWXaBHukQScqUyCF/8DiWr/GtGO39Q7ylFG?=
 =?us-ascii?Q?zkfh6juLyTGdETVlp2rv6EzcDI0Vy+ZxJ2uIOwqKcA+NKuk7ieY0unP5/Yil?=
 =?us-ascii?Q?3D/02Tnlaea8gNFAZHkYeM6+5UWRHBrm1Wgb8fOoU5t4utNk3qMqEvCMArwb?=
 =?us-ascii?Q?4+k1V2OUIg3IPYwDv1IefRC1SLvbdOZaLC5oDyNdAkC1PdJPwZ8tav77ONJb?=
 =?us-ascii?Q?FT2CQDdEKzUXWlQXGbPGQqutCYBphugQUvDa5fiKhLvFViM8S0KOVoauFVr2?=
 =?us-ascii?Q?goQmDnXnINpv3btRfwCWRa3Asd4A2tBdk+rQFE1+0in23U1zzjN9n8mNEvI5?=
 =?us-ascii?Q?l0VQZuQjXLfIGAJxuXolTvhvH3rVL6UW+p8xHS54mERJwUvElN8r61h+KdEM?=
 =?us-ascii?Q?IFvU7PJxrGlZfddeTRD/yID9qEVgxOf7SA+rwCDeHtLrP6egV3/9/fM3I8TC?=
 =?us-ascii?Q?QYc+w5He7DbT6ySsKjK2GKXKX55yRchwFo+y+Kf1BXufRsp9zoickI6RKqSP?=
 =?us-ascii?Q?iLOaXV2j3CNpyrvZ02FHYNvZHe62/OhemXWq73FNldM4W1aaU9nkxjJjheWp?=
 =?us-ascii?Q?luqJlQm96esX1oL0F8YxcKKLmjxfw34QahELuVyQDsPiFhli64bSMixEDkWZ?=
 =?us-ascii?Q?7YWeuuSay8X6hhZvmHXPosTryLKjJYBDfdr9O6IBZ5mROMZU2UzwevSNqCWm?=
 =?us-ascii?Q?z4yK7A3Da880yc4G4p1nJGpAoeLrsyaCAjdfjlhiubPpHcJ+MWx2aaPtotiG?=
 =?us-ascii?Q?vEF1ZJKWPaaZhlwwGGmV41+Bsul3t34QdCEIr/sVK+hUFcGEchCq7lh3fphd?=
 =?us-ascii?Q?95Si3o8Z6sWBjkRVYc5/+P5yfoGHtnDny2pzf/CmzG8vCNdl+7O/0gN4jeh3?=
 =?us-ascii?Q?fsraAMT+4hd3HmNLtoLyFJ6Objb6YEv0q2luXHdY43p2wrDeTT2y5guUbrqz?=
 =?us-ascii?Q?Udt2Lb7YWxM8o+dLut0WZ1Fzm56geOE/sDWO0gEwkbmIMmguP1mmxcYKbjZY?=
 =?us-ascii?Q?OjgmOQjJ7OVP2Z7gsNQS1xUQ7j6XntQE1SlTFCoMshYs7r1oO4RHNAZGx5yi?=
 =?us-ascii?Q?vD63vYutbU3XXRa+pOiRe74GS6iK0/ambp+jnw6BeOmoUohKfdS4CljkaE8b?=
 =?us-ascii?Q?qv70voz5GMCiqqD5foSNB57fJkTOlzD/rrYj6GZddxgSw2nAfpbXerWhLtam?=
 =?us-ascii?Q?U2cX6BozE/DWyPuAOO0whp8sUgA3etErru4EThBs43iRMPJUqiRkjnb9RYcJ?=
 =?us-ascii?Q?tkctwVXLj4rgyAerYZEur9RfQMRQUTqZ9ddM34CiWQsGrqr+IxRAmsjokFQ/?=
 =?us-ascii?Q?HFBvOiuUHlexowu6aXdoLLhv5RsMmB407rOH61yw3Z+qaheFRAUX6kyXkKX/?=
 =?us-ascii?Q?e0rX0uvMmjq6R3v3LoPlED4q9j1IBLh0B92hVLxjg9N3OiYjAQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1e8uf/yppARpl6mOM+vyDStuMlkGP2dRxIWcxh4BATy+ZmaTqXb0Mq+F4jRY?=
 =?us-ascii?Q?5Zs11fTRzN54B5MiIkiv2sNXzKAA/rBBu94UNjz45hXGJbC8D2X7hDuTy+4F?=
 =?us-ascii?Q?1u543/y3FHrvKf3ekL8kNLGzwI9KKeVqsaPngSr9ld6+gq1F4grMUwcqtP3I?=
 =?us-ascii?Q?Wlh3NMArrkdeZwFxQK76oDlje+BHTSp6RpEyouJA9t6GsV+OEqPPDGOik0sx?=
 =?us-ascii?Q?cEwrfQT36HlWvVVamQs+ewhoDukn3y6DujzCyQBMR/LI/tzoS3u48Gj2LkKa?=
 =?us-ascii?Q?6wz04YzzXJND02tyh58z8PkEUzO7/sgv4lFb9QgKShLaJp7FTVka0eFy+Avb?=
 =?us-ascii?Q?nyppO0hUY7/mDgQTFLRs/x8nJwvCP4tWhePgJC+yGPQtuV2JiK+7eYIOl+ao?=
 =?us-ascii?Q?jDPQ7ktMPXh2WrZlRS6mT94LRw4SciQMdrAPTdwzph23uuhwg2vuUO1jsrC+?=
 =?us-ascii?Q?ft1a/jOaOYQYfPKQORnC06c4A2/dm5OqF1hPYUNhLkBMVgYlBilMrAghqP7V?=
 =?us-ascii?Q?BwyId2drVZ4e1nwVqPCa0wFx30DxGur/FeLqy++DlZfWnfIjS2Ia33k9Ud0e?=
 =?us-ascii?Q?LGg7cptoGlM0NvAcIKoRWvnfWcGRHTOQrQX8qKHgpOKxHQSaw1fZbO3tMTzA?=
 =?us-ascii?Q?XjXW7IhuykvmC7UM9pDK+hPC4hopLmTOdaaS3gOSnekVVEwHh7WWaJcQRjwm?=
 =?us-ascii?Q?ge+E3rp4TkZw7V135pkPPjY+yPqe/dWyHTuDN7pMXVsO1wQTqdoaBW6vH1/P?=
 =?us-ascii?Q?xF+P6AV2ELlfLXqJI0IQZNJbAJaecCuiIed7R79209MX1ldlqLQVxjanU6yH?=
 =?us-ascii?Q?0NkwKGxoouvhWpgQtLJHxFgFlkVsP5UEMOBZDW5TGFYVGcE/GE5kHl7yC97D?=
 =?us-ascii?Q?uBtbHvud4Kz4CEjoKYLm5fZodPmwO7SrFaSBdWrAY3xziCuMIx40ck6cBda1?=
 =?us-ascii?Q?WifP16PqNoURtPZwci2cLv7412dFwAI3yw6pDe0CM2WrEFzjSRqdn5tgyi6g?=
 =?us-ascii?Q?aBLZVY/VDDmS+B8uP1gwIjiqdYrKs+nRRqflJZIlaFyEkkzlDM4SkCzXC2HA?=
 =?us-ascii?Q?tqCNwCN/RxYz+yofSZPE7lcMJfcz/bV4bnDK0dQ6Jww3OdOZTbxABcWDs9F6?=
 =?us-ascii?Q?q3xOxsGATsZQfrmUiFqDWobkvbcg5F84NHsM7ll0v85p1T1GSZlVswL1tDv9?=
 =?us-ascii?Q?IKaazZ7SQve1gh5E/ahIG/jkkLF35u+SO9fqys/GgVW4v3nhxL70lZQYurMT?=
 =?us-ascii?Q?EriaSRSxP2MtNhD6G7SYffFPijLgvaJDjgf+k3W2p0dO1zud7GybFqerCPp5?=
 =?us-ascii?Q?VNH3TqoX1UHPcw8gWkCqiXUQWQpRYmTCAZbJzgA4DZT3gQngIuYT6LkhR2zd?=
 =?us-ascii?Q?6IqkGm70VYQO7iYc0MIAx/Mhm4kesU9IfKHQz4XW76qm/tgfxQ7eLgDjtphB?=
 =?us-ascii?Q?CjBXPRnp941jjrTxGjWRDSFpZ1mOjYWPsxx1HeJDF9+k8ATYAKcK5mIkzFFN?=
 =?us-ascii?Q?eL5o1au95nu9BoptZYxklqioGnxSiKPEEYaMstPD/6fBqecNSYVY2Je1s5re?=
 =?us-ascii?Q?Fq5wQj67RNVwA045JECbeFm0mSq0DhfS5oYfhoxaWHfGSLGbxRCS2dxAtH/H?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vKqS3b4QIzDIa1K/7g38++xmsvt3K967j6T7tifXjnNiN73OIPS2q6rU4uFpjo0chvvoxEkvcc4gPcdQEWP/ZWB9hMyh0w91ngN4cHZw8lzwonK1JzacROCE+pzAe5x/aI2YlchRRnaZbk3GG+JcAJ3E+rh27S3rmk/0R7WqEvq6tnlMBKEGdZOCemb4/myyy9+6/Qw1JsNqFFRhVkQ0NgJVkBxMpNyPo0d6kcv7udfBwb9/5CmCy3I2dcEJywKRWAEub1wZUmVuPIRYJZZKFJ26oMTQuBLdDuYRWUgqo33MdRcBNs2oMLkdf37wG4zOuV8daWxOUu+n5mZgu+EdzHwEGmKHeW69sIdctruE1LLVbdnzkX6DDJm9ZMaaHGYhrlQaaoFWiMoq0hPiV8LuQb9rxnqAqnmpvMWiwk3kY1kVmpNzP3P/UTtemnb6GacbIpHNyGVxMmdcqBR4foj498wzEQYq66pTeHqA/JDBGfpyo9tLVsXdScNDNrU4qs2uuXHc9SDD1YyxsQdr1Z5+Q6YOkVTEZchOy0cO5NVK0ETF4KC8pbjb/CoP0KMNgsmPM7mzAcpFOXux7INtOPX2nisOTUfnDbWYd7TY5gA+QDY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0a1a9c-fa5b-4b0b-1646-08ddd01c6ad7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 10:24:22.7301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lydFi+Fgt0cA18k35lxTC+iCm2XWY8HscOS1upO/hXRzppfYT9HJORDX2S2MSjKiGeZ5Ofx36MuAWD4u7sJX9MdrPhJsl6KArvUioE0GxFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7052
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507310071
X-Authority-Analysis: v=2.4 cv=X+lSKHTe c=1 sm=1 tr=0 ts=688b4459 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=oaCHvavfjEh0Y3Z-BGQA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12070
X-Proofpoint-GUID: SlqE9MxYdLjHNEKcqoryAGHMWKDrGnxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA3MSBTYWx0ZWRfXxAw41djPVVkN
 rNLKFiiO9orUu9Xy0zHyZ6t7iwq3PCHdiYYHWeAmTghU8ksn9B6d+u9z44PvLMmaRzFxtrnYqK5
 CmTAYuEp8OAJKvwrp0A/RWerbjclBmJU7B5PTkbr6TOuyR1IdtapHNFyBmvt4stYEZUeThgsvOu
 Funr1iNDOviCxBdzoge8t4G4Mn++IIrBEnELU2emyVAN3qyCuWmYkz4Yfe1Y+mNuD5BpYWslHT2
 MWImGUQms2I0PMh39tAAWcmq+j8dWFkByx+Xw+nDPjiphZpFxi+fQrwOmj2R7p/mHSNro/z+I7l
 SdWaIORv5QpzqnDcJFG9s2QjgTB39eyyfvjinoXrnneHH41wbxK6lys2AZMlXObalwJWjdAJNX/
 velA0onxX2XA0BzkaCHeSUMaAgBAhIIfeKq/Fjn0s0BF4Ek1Erzw4KghrZI1TUNw+I0YHvhO
X-Proofpoint-ORIG-GUID: SlqE9MxYdLjHNEKcqoryAGHMWKDrGnxy

On Thu, Jul 31, 2025 at 10:55:32AM +0800, WangYuli wrote:
> >
> Thanks for the heads-up! I noticed that coding style in the kernel code as
> well.
>
> However, GCC 8.3 (which does meet the kernel's compiler version
> requirements) can compile the kernel code normally, but it can't compile
> vma's test correctly.
>
> Could the issue be related to differences in compilation parameters? I'll
> need to spend some time looking into this more closely...

OK thanks please do check, am happy to have a patch to add a flag if
appropriate! :)

>
> By the way, this coding style has been a GNU C extension until the ISO C23
> standard. So, until the kernel's C language standard is upgraded to C23
> (which seems unlikely to happen anytime soon, perhaps years down the line),
> it actually makes sense to modify this style for a practical purpose...

Kernel always uses the GNU C standard by convention, so we should be good,
but indeed I think this is the case!

The irony here is that I actually intend to change stubs in this header to
remove parameter names (previously had review on this :).

>
> [ Cc the kbuild list. ]

Thanks

>
> Thanks,
>
> --
> WangYuli

Cheers, Lorenzo

