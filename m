Return-Path: <linux-kbuild+bounces-13287-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBljHg8wDWoiuQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13287-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 05:52:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8C5875F6
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 05:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CE3A300611D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 03:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F3736A367;
	Wed, 20 May 2026 03:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="puO2318v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063736CE14;
	Wed, 20 May 2026 03:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779249164; cv=fail; b=R2LRcsocSxXf57i4uQCu+pd/8c16o0BBoomwVnJvy6dGqPo8s43ztNu7RrQWgjT/44J5+Yhswa2Vt+16P6fRjFt3+4tVnlVnmYem+N79/WBLfN7AiFReteKmi8PMRzWDKG1RDb/zes/iRivm6lBiWKGtztSs3fjiIuRC+RloG78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779249164; c=relaxed/simple;
	bh=BWqAXC2cXPiQbinnXIcxTfc9xZGO8fyy8W8fifUUf5E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AkDABR+zNCCc/OO7NCmxaAdfsZWye22T28hmc5Co+w3CdUxu0oKU8BuIqchP1fEoyzCNHyoZwW2ixdxxRy+m58WXRPUSCkAF9VOpyiKbk94cVpSEp2uOgnJVcSpR/ElGddsGmHrLqX2FNr3TFFxBGzyyOLZesKaWIkoJ7HMtlrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=puO2318v; arc=fail smtp.client-ip=52.101.52.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3Qq/Qh0U4IW54RmJxv7/B6ocwhnL/yQ5QAeY1BghYC0YCLugeoC/KDiJwCyGvSZc+Ze1OpVdpor/7erpmXu6YJVit1CLzXmOCiPLqNRJc2MXYZ1lmCwOBDrIG+rQh2Awg5zb0yh+2ATM/QvtRWTs1DHje3ESHwEKobDZJ8R6ZGJQeTnqB6ZUzO0+Si+4RBhCyx3cnFLCt1lHcnOr6xm0nzcAnxFIXAs2mhVrRCb3pVUHsBvzt9AWX+0xFHl2AxY0Ubtt5s27XMvBqQmmKMlh5YW9okJ3bzRayoFmATcRdUxc8J/0Ke096D8aHk8kJ7UZle9cdd1YJGz7jY/w8/FxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYdC4W5pOb6de2OnN2VcYAtP9CS+gRIJ5ahHxt5F+qQ=;
 b=UXh2nVVLupbGy12CGdSPhH36TVDkfsje/d+DD13aJGU5FI4DIZaU6Pzrmtr5OoEEKjJM7ne78CJ1NUyjJTFDOUh32a8XuyTWllaaWMDjQQukDeWskdLEykkN0plAfodF03VPEporYI5uQJceZayOEwYPXruY/Vg5QY7upTl7k8tGYeTcIoLx/ao2rr3NIn5Olwm9X07WCSk1NEFaonbCmzKw1/97uAALrZOfPxS0suQrnZG/gquRCbISojdTInW5oxH0dDO36pUKuDcKKGeJCgcE1q5LjrT9XqVqajWxouwsI34pQNR8/duwmgC/atdWZ46NXQaEE7fOssi8veJCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYdC4W5pOb6de2OnN2VcYAtP9CS+gRIJ5ahHxt5F+qQ=;
 b=puO2318vaf3GZrnKpmvx9TJUbdm2qxIB+YsObfA16Cc+cyEDlN9QcBFJOM55NqSdGj1D+kNkjvKS0vJhZtpivpHZqBvtDBjRsWl4N1zKbLL7Su+uPmy31uWLME/q40HKLPXyTdjOuAHu0fbUKdVOcl45ny+Z9e1Z0zYS3Wi9Kq8bzr0FiSl/V6sI4HgqJWQE/ppvDfFByaKK+K50spXAmMEwpdXdateMee8sGApPJflI5UpbvZzs6TPDABqcDko3Mi5dSR1KjxjuX633X9ks392V3hyj4QcUmTIAoQp6wCmBQivwie3t1c/GokJ4DVyJIiNYURNLociQZlp2PpGo/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 03:52:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 03:52:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 12:52:30 +0900
Message-Id: <DIN76NTFEU1N.1RT6G4IFD62RG@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/7] scripts: modpost: increase buf_printf's buffer size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-2-7ca31664e983@nvidia.com>
 <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
 <DIN5QTIGKQ80.11TOOMMQOBGI@nvidia.com>
In-Reply-To: <DIN5QTIGKQ80.11TOOMMQOBGI@nvidia.com>
X-ClientProxiedBy: OS3P301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6c622d-ec9b-44da-098a-08deb62339c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|4143699003|22082099003|18002099003|56012099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	8mCkHSEKfy+6cl2gJScKFwjf36Q8UMnwJsSPwi3p/Jr0I4NmwQrWwvNtSDsxNJO93oFrD7jP282sBK0v3lCyoGroyXNo4+KqRYMsDxSFsEJREY87ueLlr3fCLXBoII2X1GN5VO37nD8cnLbx6M284Sit/mA2gv/iKpxwn/aK8h1IV+M/8vmS/NK2mXSGAAVFvYdnEBfzccy8RIUF7Ev4eX2oIEhjeM29kXkhRHRGCK9u9SjziV0Yc1+Da46a7nF8TY0219dKKQnkPyKwQuHYLQ7TO/1o/Sv1VyVaOtwkK16JkqVNcayEZcwgnhdMrnDz5dFRIfqZr6EscxWrEtvEJLgnOCVAlQ+Gb5X53jmCRRH40tUNz94ylyhbL+5uQa6yTbAE23ZpMxhGH9nqg8ronthxZZ8KdlPu34PuecBbusnAdFt7LKnzrcNzd//ugOHlRHwvVFtNTfWaZohDbMRpbJDztbuKgtNRPFxGCS6Tot+pLxp9a0nZKq5diMdxGOjCfri8l6Eu7F31WX8gnnRoR0h6FSRIbcWNg+j254uxPXCRz26fu6SPjtOva7Ke86FK7S0TbNEbRwP2Nwi8/xSGmZi88VIQgFE/5Fc1RYvDIWghdqVq6DuUMR+YhF8IIA+aJzsSTudpEvbdQSOZ9ZGKk1iL50iRgKACe9dP4qDpgF75TV9cyhsZdYFN+7Anw11S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(4143699003)(22082099003)(18002099003)(56012099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXRFZGpNK1UxdDh1ZXE1TjFQb3ZjbUx3TWF1amkybDQyMThjMG9SSlI2Qzlk?=
 =?utf-8?B?d2hQSG5ud2ZVQVFxU3Y4OWdwcE0yMVBwQnRJclpmaXc5cHI0RnVZUDZOUkNL?=
 =?utf-8?B?VG1aQUpSMVNoVTBmWG5YNUpQYXZrVXQrZWo1VTNnLzFqVkNEQ2VjVUJ3QW1w?=
 =?utf-8?B?TUNqeWRvWUlVV2YvWXBJaXBLaFM0ZlhCOU50akkzblVjZE92UHpyRlV3ZW5j?=
 =?utf-8?B?YnhHZGtyaDdoclZZWDk1LzBmSVhQdFIrZVltM2Y2ZkpNN0sxcTlKZGNzWlB3?=
 =?utf-8?B?YVhSUy9Pek04dG5RcU0yT1l0Y0pMT2xqZzlKLzdsNnZGQzVxVmdONWdhR3My?=
 =?utf-8?B?MWR0WG1qWnJaM281eVpCcWlydktYSVdUZ1RJSXJJMTRDZS9kc04zdHlwWDF5?=
 =?utf-8?B?UWw0WFdkVlRXU0lhMHA2RSsyZTR1VEJ1dkVlR2ZFdkZORkNNT08xM3BramZr?=
 =?utf-8?B?UzhCMExvZ3hmeXFxZWUwU3hQdHRqbWY0bWdXVSt0UFE5RDVmWmY4OFAxUnl4?=
 =?utf-8?B?NldzVUJhUUlRRjJhc2N4b09IQm9Uc21vWnJUeHA1MXFQMVFPU3MwOEZLTW8w?=
 =?utf-8?B?cTNnZ0VSSUI1YzlTTkIzNWYzb3FRRWRwc0RVYlhwRi9QdDFTbFNGdzZjenND?=
 =?utf-8?B?UVBjeEhqSGxNQjlUTE9MbVdoZXc3d2dwWmFaWGpicWtZQ3VZcWFDaVhrR05q?=
 =?utf-8?B?SEdhYW01L1NCaUhlU1dYQytXVlc2MFd5Z0JCR083dEwzeWgxWUsvdEdxMWhD?=
 =?utf-8?B?cjhqWlBIcmk2L0VkRFJqRFFQMVlWTVhwNTV4Rnc0SjVmTndtS3lWaVNpWnhN?=
 =?utf-8?B?TFA0b0pEM214QWlGNU9rclVUQVhPQ3FkNzB4bUJQZDE2RExFckRaRFF0dXRq?=
 =?utf-8?B?S3F0a1I5djRUMzNPM2J4NjEwdjVZb3VNdEwrZVF0Zm9IWXFud3ZQcGkxT1I1?=
 =?utf-8?B?MEdwa1NJVTZTQXRpa053M2ZkRnRhcU5ZU0VKOWc5WXZncThkcVpIVWx2a3Fs?=
 =?utf-8?B?LytGbWNISW5kQkxRN2IxeER0TWJic2ZrMGgwR28zeVJrTk9SZ1lnblozYkNS?=
 =?utf-8?B?Qm5MeDljWW8rTGN5anNtQ2hjS0pjNUFQbFcvQW9EWWJjbGVCWWJnMTFGN2tO?=
 =?utf-8?B?bVpsQVJDNzhnVWdBdW1wWnM3TDcvMjRkQ2xWM3RRU0sySTg4UE5NdjNOcDdv?=
 =?utf-8?B?SEdjaEYwVDViR0dDMW5aKzZpYXRNZHJWejY1ZjdBY2hmMGpTTTMxU0pFWjYv?=
 =?utf-8?B?SWRuSW1vcnltVUh1d3prWklPTjdxMkErbVhLWE1EODdKOGhBTDk3VDlIdlJl?=
 =?utf-8?B?c1FmV0grTVJoc1BRelFOUkdZVnlLVnlDNVllL0hrQU9wdC9EV2hvUnJCOHBv?=
 =?utf-8?B?RCs1S3ZOOHBEaDVJZ1FsQkFBeXNiQkk3M05aSW50R2kxYkZOUlBLbHRPekN2?=
 =?utf-8?B?UzYxQVNSZVBRSy9YNXFEY1lwZFgzaVdtMnZEWEFpd3R2M0JzQ1FlbitRdHpv?=
 =?utf-8?B?dTlxQzlQdnNmdVlkVVlScVk0MllRdEdsRmJrelRSQkloR2hLR0NGalFqelp3?=
 =?utf-8?B?eGIzRWpRN2pNeFBuZ01nK3pnRVgxRXNkVDZDTHlocnNFZEpwb21sWXhsVU1o?=
 =?utf-8?B?eGljdkx0MGZHK2hVUVAzWFk0VUJiMm5kR1JlYVBlcDJreWhpcTREZXMyUmdW?=
 =?utf-8?B?V2VzSjNBOVEvdUF1djk3YkpHbWZhTWhUaUhSb1h5VHBFUGtCNUVCN2tVV2Z6?=
 =?utf-8?B?STA5dkNjbHhhVkUyN3NESUlnWTE0TnRoSlVsOE1RWXRFVE9tV2xjRWoxOGh6?=
 =?utf-8?B?Q3lWQTNaK3hOMnpna2VQNnZwZGRsMFVCMFpEZHBZNnI1RDBHbmJBbFB6MWxP?=
 =?utf-8?B?Zi9aNW1iNmZxS09EMDdxRHQzbEtzYmg0UEt2RHlGTjlxV2l5clExTCswZDNC?=
 =?utf-8?B?Ym1GeWhNVVgyZ01tUkI3ZnppTHdPbjNySUpXN0ZKdFBHVHdRd1lXay95ZTg3?=
 =?utf-8?B?YlZMeUVYRDlTSytuZFlKRzM4QTJXU0ZwbjlTU2NsWHpzUFg1dnFKM0hrcVA4?=
 =?utf-8?B?RGZkQ0J5elNJSmFsUWtDWlJDZ2w5bFdwMWg5V0VuZVZsdjJ2Q2QyZkZJT3N6?=
 =?utf-8?B?S3VCN281MEVnWWM1bWdOVndoME95UWtKaFZlRHBUZGdVMXJaWUhxY1FaOHJG?=
 =?utf-8?B?eVdESjNSK0VXYUt5bUlPbS84VUN6N1dkM1Q5MDZBbmx6SjdwOTRNemhsRitE?=
 =?utf-8?B?N2dFSWFlMW10VVJJbzVjaUJramNmNUU1RU5uRS9WWFMyVGRFai92NUhYVWhY?=
 =?utf-8?B?dlkzSHZmeXZLcFZOTi9RcUQxWEFIV2N3enRodGdSZmVucW9nRHZEQWRpUy8w?=
 =?utf-8?Q?9vKDzWK9lUSnEPvX5AJXU0nKPilVHSTAMk5isMVzx032b?=
X-MS-Exchange-AntiSpam-MessageData-1: CweFtapr6K2mwQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6c622d-ec9b-44da-098a-08deb62339c6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:52:34.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kC9Rl3s5fB3lxkcCS+Oead/ezBFaAQB5FBU4zoU0grxUTHq5Se5b0SmIgbbeHgycHQ1LUFIxmH1ZLa4aMXdDVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-13287-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1FA8C5875F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed May 20, 2026 at 11:44 AM JST, Alexandre Courbot wrote:
> Hi Gary,
>
> On Fri May 1, 2026 at 10:02 PM JST, Gary Guo wrote:
>> On Thu Apr 30, 2026 at 3:55 PM BST, Alexandre Courbot wrote:
>>> Rust tends to produce long symbol names; when trying to export symbols
>>> from nova-core for nova-drm to link to, the 500 bytes of the internal
>>> buffer used for symbol name formatting are not enough, making modpost
>>> fail.
>>>
>>> Fix this by increasing the size of the buffer used to format the symbol=
s
>>> to 1024 bytes. It is a stack buffer, but modpost is a user-space progra=
m
>>> so that shouldn't be a problem.
>>
>> I think we should make sure all constants related to symbol names match.
>> KSYM_NAME_LEN is 512 so this should just be that.
>
> Do you mean we should use `KSYM_NAME_LEN` for the size of `tmp`? The
> formatted strings can be longer than the symbol name alone (see the
> example below which wraps it into `KSYMTAB_FUNC()`), so this should
> probably be `KSYM_NAME_LEN + something` if we align to it.
>
>>
>> The only case that I've been hit with very long symbol names so far is d=
oc tests.
>> Can you provide an example of the case where you're hit with very long s=
ymbol
>> names in Nova? In many cases they're just functions that are supposed to=
 be
>> inlined but isn't.
>
> Here is an example string that doesn't make it, it doesn't seem related
> to doctests but also doesn't occur on all configs:
>
> ERROR: modpost: buf_printf output was truncated for string
> KSYMTAB_FUNC(_RINvXs5_NtNtCs1EKtwoKEMO2_6kernel5alloc4kboxINtB6_3BoxINtNt=
NtCs1peUGmbrgHn_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16Reg=
istrationDataNtNtCs6wA3Ay79aUn_9nova_core6driver7AuxDataEENtNtB8_9allocator=
7KmallocEINtCsfxcgfq7FLKi_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtB=
a_5error5ErrorINtNtB3x_10___internal11InitClosureNCINvYIBH_B1L_B34_EINtNtBa=
_4init11InPlaceInitB1L_E8pin_initB4t_IB4N_NCINvMsd_B1O_INtB1O_12Registratio=
nINtNtNtBa_5types6for_lt15UnsafeForLtImplDG_INtB72_:
> 608 bytes needed, 500 available

So if I add the inlines in the diff thereafter, these errors are gone,
without even increasing `SZ`.

The module also appears to be smaller:

    $ size /tmp/nova_core_base.o /tmp/nova_core_inline.o
      text	   data	    bss	    dec	    hex	filename
    103856	    736	    288	 104880	  199b0	/tmp/nova_core_base.o
    102718	    736	    288	 103742	  1953e	/tmp/nova_core_inline.o

Here is the diff. I can try to fine-tune the places we inline, but they
all look sensible to me.

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 2f8c16473c2c..592fffc72e52 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -433,6 +433,7 @@ impl<T, A> InPlaceWrite<T> for Box<MaybeUninit<T>, A>
 {
     type Initialized =3D Box<T, A>;
=20
+    #[inline(always)]
     fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Init=
ialized, E> {
         let slot =3D self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but =
not dropped,
@@ -442,6 +443,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) -> Re=
sult<Self::Initialized, E
         Ok(unsafe { Box::assume_init(self) })
     }
=20
+    #[inline(always)]
     fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin=
<Self::Initialized>, E> {
         let slot =3D self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but =
not dropped,
diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 7a0d4559d7b5..36d4bf1959fb 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -151,6 +151,7 @@ fn try_pin_init<E>(init: impl PinInit<T, E>, flags: Fla=
gs) -> Result<Self::Pinne
     /// type.
     ///
     /// If `T: !Unpin` it will not be able to move afterwards.
+    #[inline(always)]
     fn pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> error::Resul=
t<Self::PinnedSelf>
     where
         Error: From<E>,
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 18d6c0d62ce0..973f15165606 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -712,6 +712,7 @@ fn try_init<E>(init: impl Init<T, E>, flags: Flags) -> =
Result<Self, E>
 impl<T> InPlaceWrite<T> for UniqueArc<MaybeUninit<T>> {
     type Initialized =3D UniqueArc<T>;
=20
+    #[inline(always)]
     fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Init=
ialized, E> {
         let slot =3D self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but =
not dropped,
@@ -721,6 +722,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) -> Re=
sult<Self::Initialized, E
         Ok(unsafe { self.assume_init() })
     }
=20
+    #[inline(always)]
     fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin=
<Self::Initialized>, E> {
         let slot =3D self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but =
not dropped,
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index ac316fd7b538..381a06ee0d59 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -367,6 +367,7 @@ pub const fn zeroed() -> Self {
     /// This function is safe, because the `T` inside of an `Opaque` is al=
lowed to be
     /// uninitialized. Additionally, access to the inner `T` requires `uns=
afe`, so the caller needs
     /// to verify at that point that the inner value is valid.
+    #[inline(always)]
     pub fn ffi_init(init_func: impl FnOnce(*mut T)) -> impl PinInit<Self> =
{
         // SAFETY: We contain a `MaybeUninit`, so it is OK for the `init_f=
unc` to not fully
         // initialize the `T`.
@@ -386,6 +387,7 @@ pub fn ffi_init(init_func: impl FnOnce(*mut T)) -> impl=
 PinInit<Self> {
     /// This function is safe, because the `T` inside of an `Opaque` is al=
lowed to be
     /// uninitialized. Additionally, access to the inner `T` requires `uns=
afe`, so the caller needs
     /// to verify at that point that the inner value is valid.
+    #[inline(always)]
     pub fn try_ffi_init<E>(
         init_func: impl FnOnce(*mut T) -> Result<(), E>,
     ) -> impl PinInit<Self, E> {
@@ -417,6 +419,7 @@ pub const fn cast_from(this: *const T) -> *const Self {
=20
 impl<T> Wrapper<T> for Opaque<T> {
     /// Create an opaque pin-initializer from the given pin-initializer.
+    #[inline(always)]
     fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
         Self::try_ffi_init(|ptr: *mut T| {
             // SAFETY:
diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/interna=
l/src/pin_data.rs
index 7d871236b49c..945254740f61 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -395,6 +395,7 @@ fn handle_field(
             ///   to deallocate.
             #pin_safety
             #(#attrs)*
+            #[inline(always)]
             #vis unsafe fn #ident<E>(
                 self,
                 slot: *mut #ty,
@@ -409,6 +410,7 @@ fn handle_field(
             ///
             #[doc =3D #slot_safety]
             #(#attrs)*
+            #[inline(always)]
             #vis unsafe fn #project_ident<'__slot>(
                 self,
                 slot: &'__slot mut #ty,

