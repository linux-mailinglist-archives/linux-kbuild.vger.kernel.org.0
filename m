Return-Path: <linux-kbuild+bounces-8265-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7C8B17E9C
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Aug 2025 10:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BA5358005D
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Aug 2025 08:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935261F5619;
	Fri,  1 Aug 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UpxG3NQk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kroT2a4G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A741B95B;
	Fri,  1 Aug 2025 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754038311; cv=fail; b=kdDYyrbgNXkNd/rSskLtbK+BXeNH4kd2f+i2cTB+TfTN3NQ07xmfGoPqlLuw1j9D5D5HOGIHhPb+2vb49+XfyjQkQwQqsAoj6QuRDtVvtan5VFdex/VOxieRbqsKU0wVb5wCEYqDJ92eBsQl1RkplPl092/cHVzAkLHfkxMKqqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754038311; c=relaxed/simple;
	bh=eOA2ISKFAFjBYoFEdT6RJ/7Zu4HhMelkCIm2uwZI+mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h42V+6xhkFLn6uPQdWQWyl2ryFshrlpQU9WgesIkTSfSNRWEsrpit9fJ2jXzQkKbwVbCG45NJ8Et56mJrM+nb75o3jpb+eDIZOmIYNF5Mz+5WoYFwxz46O2c7cWlR1mK7rF4KGt+EdPSPp8M+E0+YFzhWOUVrbdUdUTkKnvc87k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UpxG3NQk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kroT2a4G; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5717C4mC005758;
	Fri, 1 Aug 2025 08:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2SDka9zHmNYTk23K3X
	del+78DNP7oyfLglXJrTvKtd0=; b=UpxG3NQkke+hURgKuLAbSJLu4tFbwWesT6
	hfCk/3lgnj2Ez6EsbrjRwVWIHvgIJnUFnExyeh3FtZtOaGg7GNIieRoHKDb8eM/m
	TalD8Sp7ML+a/RHgcoZ3cs2G3D2QL8J24Qys1jmUhZgy9DOg6X8HyVgv+gPiz7kx
	YCM6Y/LTNq1VkODDHWseQkhwjX+nUPHvYjZRprYo9Kjxqogdi8Y7M0T8CT92snS8
	fTh9q8UUEaZ/LiXXw/wzcq6nkHMZor/UxxqvbI/MDb5TxwD2SLcD06ACpMe91SyQ
	mR98w8TLzn7w+yRMGgMns2W7EYCHY8OSlAAUqk035p5kVmtNLJ/g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 487y2p2r6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Aug 2025 08:51:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57173hpr016669;
	Fri, 1 Aug 2025 08:51:04 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfkvuk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 01 Aug 2025 08:51:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hh19Di+F6XyXrBVD2cN7Xq9z1S8Flfyai8YjwXVIQyzyP744xyZDEb5wpSmGszJYjST/OHd/PeWemumQICRbgvm3afahPEvXMQPNkHyB4SaGFri9xN1T0zYspw6Q+IKwZ1XHMeHsNWEvoNuon3BoIqua134xheAmvKo+YNQAN3iy/EFYXP+zl5rqrg5/ludAvVQorZ6p91k+gp4fTqUrWnw/rWwEkAR7KB8RhkIzHEz60NOt1MWr5tgUVAXF4j9eHWrVlflKR9Y8JtkrAqKHlDia02i3kxKd6fs3szvF+a0+fdLZES0pR1V4PJnYrjoUzaw6pCenAB7QK49MXxkISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SDka9zHmNYTk23K3Xdel+78DNP7oyfLglXJrTvKtd0=;
 b=oYSnJofTFFimsvduFe5ugQvlG1ExwnSCpTIuscHkupN670JQ5G0aOHZ1cHAHyVnZ/92ywe5Z6EnQkevLLX0pcC5kPFdET/ZRF7Fi4FUxohQiaZLuKYiMrYJXXRrps+LofgmS2b1N5NEWIRjAY60gnuXVmwAwmfN2DtGXxae8VcRMWPaa/4enGH6vROVfedNV2NY12gKlsbXvjRhG+JchnwtP8DoDLdZYiVh12FP5oQ0sy2OsBOHGPAK45fMvVkcJZj8sfvnVnOAe6pNG9o6loKtjQOEZSKEwqa513SJASkuG2dvEffYc4CFiXgW7e7eWrpIbQAD0Ui9sr0yz6x1Y4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SDka9zHmNYTk23K3Xdel+78DNP7oyfLglXJrTvKtd0=;
 b=kroT2a4GpRelUvsAc/+0ovZncbe1TwlsNb7u6SWyjLXhXVe16xb1vvN0lw913gel+HtZRo0p4oC3h+C+TJexMWhq2AFG/THbdY5WMjJoa1lQvWlzlwiILaJqckzU2arXhcVvUj1S0MvAHBnz4uRVTiku3LUAUhKKEeAjfFuy8uw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV8PR10MB7822.namprd10.prod.outlook.com (2603:10b6:408:1e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Fri, 1 Aug
 2025 08:51:02 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 08:51:02 +0000
Date: Fri, 1 Aug 2025 09:50:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: WangYuli <wangyuli@uniontech.com>, akpm@linux-foundation.org,
        Liam.Howlett@oracle.com, jannh@google.com, pfalcato@suse.de,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        niecheng1@uniontech.com, guanwentao@uniontech.com,
        Jun Zhan <zhanjun@uniontech.com>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] tools/testing/vma: Fix function parameter declarations
 for GCC 8.3 compatibility
Message-ID: <27488afa-1d53-43eb-bc68-8e950d804000@lucifer.local>
References: <EFCEBE7E301589DE+20250729084700.208767-1-wangyuli@uniontech.com>
 <e7554f93-03e8-4315-acb7-a55312354485@lucifer.local>
 <CB890ABC56C2FA67+56b95783-ed70-4744-9fc5-f2d93ddf2c12@uniontech.com>
 <37b606a7-17c6-4865-a78a-ddde1bc15649@lucifer.local>
 <d31803bb-fb32-4a94-aa89-83b02757d650@suse.cz>
 <12cba6b8-6853-477d-aa6d-23180c2fec75@lucifer.local>
 <671CE9DD76801AE4+34f3e3b7-4684-4fe2-80a9-93de1dde9c31@uniontech.com>
 <20baf9ac-9328-4110-97f1-91e9e76b8914@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20baf9ac-9328-4110-97f1-91e9e76b8914@suse.cz>
X-ClientProxiedBy: MM0P280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV8PR10MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 64899349-610a-4df6-a26d-08ddd0d88aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QzMrAX6Mqp4Ck5bhkihjWRSDbPhSCy3r3Cy018COlJGLsi4GOJcqm8s6zm6d?=
 =?us-ascii?Q?w96GbTx60eubHtafpXUqE/cTunink+NBohxXZiz+4KixA/5qxP7LOImz7Ueh?=
 =?us-ascii?Q?7JCmn9avplD3q1gpWC+Ds8KRpOmdjpszlJcqPWE/Nt5x9wR1SgB+XrLoZhTf?=
 =?us-ascii?Q?1pwK9lPd2rt1OZmbQVzALwcBlknPQvRGuBf9rFkAxv/DRegbw0ENMGKH7zOt?=
 =?us-ascii?Q?AUN5GNgQOw8xJAtds3bs47z3V4bjox1jXoHyri+F50nO+PMqJTPJ2aVqJArU?=
 =?us-ascii?Q?FQoeWC8b1chGdhpmuGfknLHrx/2GTSh9ZdS1kkRi5iPVJTm48HOkJdizrt8m?=
 =?us-ascii?Q?EwRCjvtMXh6iIHG7HhhaD2blCveTFIRj57Y+HMw1HquS+ZL/UKi1yE1VRrEe?=
 =?us-ascii?Q?5zooE92lciR7NvB4ke4Ryr+eIpzH1ct1a3zISZGtbavP+ruwpnge/R+FA5WI?=
 =?us-ascii?Q?nve36xYlB26pUJxqyBIwkVhnC0vdC/ZYNXevjGeR5yRn1w9Zs03h4DWioEs3?=
 =?us-ascii?Q?vbGjLjbvokqyij1GkCX+xGkUuMZECsjngYF5ah6lkQbCycVRmiqn5EJfjcYL?=
 =?us-ascii?Q?AKsqlkoR1+HWETRDQvB/PPhKivQG7j+4vcUNk/AdGuPn3BoJcjhzVDE55fJb?=
 =?us-ascii?Q?zbRHqyYi260pbYUr8c27EVe5SefPfsOlCFtUBqRjLWIPNbjGfxgxY8YZJDOd?=
 =?us-ascii?Q?3EF5HfxtlEqeTN1coRAwz2YaCDVU+tqfELXhzkp3chIInmGu4mWOl1ooT8c/?=
 =?us-ascii?Q?ufwYpQlxCfvR8he6ZOFWbOnDWMyivFKK/Uc5vVJZ9UlyqWqlVewthVjAY4aO?=
 =?us-ascii?Q?Mwht4HoK7f8Dl78Wmi+fihjFrj063QVYUfhUOT1/sEb0/By98BCMsKciAPuC?=
 =?us-ascii?Q?AlT5NOASaDMIw6RalztYWYFsPN2UdvJewo3+msEPW+ExzPnURbV/ui7+9dBS?=
 =?us-ascii?Q?U5UHlqDDpI6EYT/cqBJ12zoxVS1QXLPpLydcduqEDlPRCj/1ByqPdz/dy3qq?=
 =?us-ascii?Q?SESkx/+UhV9hV+A0pNtOOUT7kRroRqipqg4arLgraqnNaKDQs3zYkvQh7kC7?=
 =?us-ascii?Q?51LCnOBBp+cyz4Xes6ebFETfkrAUcuWQZYrNAEypwfj45y/O07fykLtXIzPz?=
 =?us-ascii?Q?NcXJL7mLyJR0UCMfFa5W3XDlo5Qd7WOP0RvKTfoS4hFuDqaUgY/yoj/Ap8/w?=
 =?us-ascii?Q?Asr2M8pujQ5kHElH7/JJ0gDMo1eNr2FiEsVl+zuuQ6eCAeiTWAhVozPXSH9n?=
 =?us-ascii?Q?+ex71XvSTr8nijidWBdiqS+yPJMCrUpDtVHgIY39IfXc/RCGgri7J1OhRSXZ?=
 =?us-ascii?Q?ECME+rBHfPUEQ7iV4mx0evYIg365O4f5WyWsvZn47NO4zD4E2HVMAWvyVhGN?=
 =?us-ascii?Q?LhP9WCs0y2TBfizp0xZfD749EUbQtxlzrFtXFkaZfCryGdWBJcso7oMEeQKP?=
 =?us-ascii?Q?JaILQoUKR5I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xvmDQe2m3eRECtAYpBzUnfMZKLaBddRJ989FsjRKmfR6VAdG50c1RUo7wFUk?=
 =?us-ascii?Q?aDLJyiacXRPLp982tnMIpZYHubwD91mp37ou41ZRY7dRcwOR00ZdbN2PH3xk?=
 =?us-ascii?Q?c0zrJSJd34QeOESjUtT66pW2lqvSg2fZAR6/ho0VQEE8zdyg3HDwCqkx8fIB?=
 =?us-ascii?Q?jrTleINtlwYfTkk9nc5NtwPZLS12xObSZoX38cAC7ChLud63OvrZpZ4l14OU?=
 =?us-ascii?Q?ibAscreacP9vVkj3Pl+PybUmYSjIJHGVhSo5EUpvHJExglfUNSgSQd+jdgGa?=
 =?us-ascii?Q?iQV4to1l8mcqTsbhbzDAefJ8SdQHo3C7xyF3UWz9TSC4As2aGl0Oy1LgsB+B?=
 =?us-ascii?Q?XTWBdirSzYRXpHyRZ+vZ5wckUgoGR57adiuXHZ3PqMLCFRSk8YPrYH0tvBns?=
 =?us-ascii?Q?CS3066gsMegPHAdwu1DCXG41FSW6RU72anmvC55Suvo808try08Kg6hrmWkt?=
 =?us-ascii?Q?Fp/9ZvGicen8MacQLvomNbA1leF1xm6YC03MyLsIhbPyRbrBBy1kje2Mn/TJ?=
 =?us-ascii?Q?BZWwoN1x1k0KefCEe2NAi+Lt7uwCcKAiZukmGEa4ijJyHAT1zQzhpr62u4S7?=
 =?us-ascii?Q?DgRhRaDgmi2yH+LeRDQ96KT4RCUnv3ZVDQxehmLcDpeixsTMCRBmKzaoYSJf?=
 =?us-ascii?Q?5znDgmgLT/TVzvdHFQWEBieKyUYm1I6yT40mlUYTRXZ59t7t0R/0IXp8zDMA?=
 =?us-ascii?Q?5D6H8BfUJo0q2lxrLyP3+kHKmKyyKhBd/q0mgoBfhGnl1vQF/ttBo2jzNN96?=
 =?us-ascii?Q?8eJgWx7iLxZ3IC55mAJvlTZ92h/uhJe+fDXFEx5sXVhhvWOAQKEYl1siFxRi?=
 =?us-ascii?Q?2dYwhIOGSMbXyEpRmebpk04E0KwDvgsBsSi/X1Zv9Vodc7s4M7X3osWRjnii?=
 =?us-ascii?Q?HsuguDx2vbtFCZJ7epBqNZkt9x0IV/U+5tb+Ej7HQ7yQw7mZfPSOuaHSNwlN?=
 =?us-ascii?Q?7w/k38Krygit4Pop/YxQDuIs+79j9WFrO0I6itCzItO+MoCbPFqDfRzh/4ct?=
 =?us-ascii?Q?dOr3MhmzHBslltjc3eswU1m0sYCkmmPHx+3gDiDy+4M8se/sGFbA6RqbcYpR?=
 =?us-ascii?Q?MiCNWjXDdqYJgnuScxAPV+7o/nv5ppvAmvVyH55f0esB/BfeZNWX71qus35n?=
 =?us-ascii?Q?SONQJsgMoQE/yziKs59UrPp2kNF1s0XaRkslhcj4rpQzxE0BaoYeLbM62Q2j?=
 =?us-ascii?Q?geUyZzOxEvJ9dzpBL9ERUDkXRYAgt4Q8Ipw51wN/oqG4OTHgsnJM4c3a6w2n?=
 =?us-ascii?Q?g0igYUSLraWEYxXTJd5eSspsZJ7+UU3YEwX5ZjTwC18DeLH4tiW6+7gxkgOm?=
 =?us-ascii?Q?BGQApGAMJcYocZojp5pHly1vF0p8VwXGABHHnGxqw1lHcKK6V9giJyGf1i5T?=
 =?us-ascii?Q?65z9PgLk/Ib1WYUZG6pY9tRpD4g8SSd0GOOFSTCsYcoeDmPkqA67OUf0oJcU?=
 =?us-ascii?Q?1Tvx+7KLk3WzgahDhKXtLg9aP+WI3/UYoJrp6mFmwYNA+UKgQ2GY8dCSPDso?=
 =?us-ascii?Q?qQ36hk9TReO2wIkF/HbX8llTqor7i0qHe3zeS7CxhEkF++LbSLfn/wB65PWL?=
 =?us-ascii?Q?u6Oqg1cUQ7XA9IfT2F+7xTm8MTp8uvR19fR/eikGz5GV8XWmhmQR6wY4PyMu?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wj3qYxsrEgRi93Tvw//HdiSicdP2tjdDn80liiX3LgU+s29/WMua8oMFtZwd21YMcNiU1OvcCh1I1Rx9Z7TkWQESxPcnH+fc5dO08P+dOkpcCocddqRSRysZXcq0ZY5UgmlVgXs9EPu+1uG2mqNSX6D0qLv7EF6dTFJcUqnjUzOgThVtSDvSq23dXN/O2I4dDHHOVp/xf2dXNzZHl2CcsQjPsdCviZuTCwMJ6t9d1gO+dwWYxKJioM7Lxo+89i8gaE8kAJhBs+i1SYv5FzH56LlYtEZgNgEVDGLJXSjwYwM83jF3Ho6K8C+XyVMvxT5I+zp+0eyUvk+t1eLe0yv8/tvEf484dSHiKo9r5OIyu+fOcNTId/CgZRMEdNEe0AS4T9+gZBMTl/ZxlISqmm0RsDN1GRwnn0fWuXNPPfqzQisJQDSH6Z6Mx+EDWNTz++DlzPIq+P77OwwcAReUSxJhDHyRUuVooqOVMLrLYEvGAfLidZbZpb26ltbjVzOp8mp3JaqatlFD6qyQbjrJgmTaCADK3OqZcRkPHbiM//FN22AJEiDPyQjg6ouezKZy+wqE1nOmRKacCvl/ox9hGebvP735k+3gCwNsojU48wZym/s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64899349-610a-4df6-a26d-08ddd0d88aee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 08:51:01.9656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fgnDT5aqQiU7+Lk6bjVTzXs5JlzyZPPD5v8Qape2h/AofBX2NyY3YCpuZSvNvhizNwOensEylX2yroNDs+HIc8P4PToV9gflREezgzmPlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7822
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2508010064
X-Authority-Analysis: v=2.4 cv=COwqXQrD c=1 sm=1 tr=0 ts=688c8016 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=mDV3o1hIAAAA:8 a=cGBPJTywlIROhL6hUD4A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12070
X-Proofpoint-ORIG-GUID: AevfMGcf01RVYcrkPJbLkOvqOAMIFrCs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA2NCBTYWx0ZWRfX7m9bfAQRsfLw
 V+znsmlrkqP0r6INb/ad5JD/uNv9Ht3t4dxMkfX0JMWyEePMzSP7xtok8SunS8S2G8JHGHaWZCK
 ezg3T589KAOD2Grdlt3gTLtI8RG7sFwnyZ2zvIBdtUnI/Sc16xcTcDIQhy8iGaNL1u0T5uPux8Y
 jqMOZsoqAkP5TQzN6Wpi6lJMkkBlq8Pn44bchB0+86QRlsWZ8gB/q1P9aRVytOBG5Jhl1KLuBOY
 nB2j3IX9rTRv0zKPIHYNwB0liIbw+RrxEDTerGg7/nsILIb2KgYwHudRSWZKx2VA2jKPSMfp3C8
 pa+e6prS2WTEm5IT1O3cAmFYA/gT3inrtIu3rJHE5d5I0l8f9XFcj5PJojrV/aFXdZ2wt+rs2jv
 jpNAExXcBEw5qW1DPPZZoIVtLnJhgEEfu+aLXjr+nJfPVz+v6+phtq+vuyRalF9KfnaBCIjt
X-Proofpoint-GUID: AevfMGcf01RVYcrkPJbLkOvqOAMIFrCs

On Fri, Aug 01, 2025 at 10:04:11AM +0200, Vlastimil Babka wrote:
> On 8/1/25 07:57, WangYuli wrote:
> > Hi all,
> >
> > On 2025/8/1 13:14, Lorenzo Stoakes wrote:
> >> WangYuli - could you check? If it's as simple as this, feel free to send a patch
> >> making this change.
> >>
> >> Thanks, Lorenzo
> >>
> > It's not that simple, of course... That didn't work.
>
> Yeah seems I can reproduce it with gcc-7.5 and it doesn't work.

I think we should still add this though to make it consistent with the rest
of the kernel.

>
> I think there is a difference with the other instances of omitted names
> found by grep as Lorenzo suggested earlier - those seem to all be
> declarations. But here in vma_internal.h they are (empty) static inline
> definitions.

Yep this seems to be the difference.

>
> Seems like newer gcc versions got more lenient. Haven't found why, but seems
> they want it to stay like this:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113825
>
> But I don't know if there's a way to make older gcc's lenient too.
>
> > I'll take another look.
> >
> > Thanks,
> >
>

WangYuli - apologies - this is my fault entirely, I misunderstood things
here.

I was wrong to dismiss this out of hand, I guess not many headers are doing
stubs like this, and I mistook this as being a general thing.

Could you please do a v2 where you add back in parameter names (and add
this compiler flag - I think we still should), but could you do me a favour
and also fixup some horrid stuff here?

I have functions like:

static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
					 unsigned long start,
					 unsigned long end,
					 struct vm_area_struct *next)
{
	(void)vma;
	(void)start;
	(void)end;
	(void)next;
}

Where I am trying to avoid 'unused param' warnings which... won't actually
arise.

So could you eliminate all these horrid (void) things as well ass adding
parameter names?

That'd be really helpful, thanks!

Cheers, Lorenzo

