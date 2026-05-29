Return-Path: <linux-kbuild+bounces-13407-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF/6Gku1GWoRyggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13407-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:48:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 827CE60505F
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E88A93090CF3
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 15:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C7E3FE37A;
	Fri, 29 May 2026 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pE2YcKiF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F713ED5A1;
	Fri, 29 May 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068503; cv=fail; b=UkB7QvjTpnlfl5AEE0mjbHPc1jLqv3Vpl4oZfHVpDS5QPXeoRUUXmUqoGYjeaDi0IOZ7e31khT6gGBXgA7VFAD6MViG5PbAdi1qMpbVjnGiwGmf6Vb0D0sFF3pLkR7ICQ5HSFWRWATRwFI7WHmDHmTpkqnyttvNH5eDoZ7VUZvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068503; c=relaxed/simple;
	bh=WnOrCqO+y8Oq2sTEztylH+iZ783CuhLvXnAvAJyhJDs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D3JyFz4L+DFXFHDGbLdcRMqzlAbgmZiCrfDinPQold2XenTFXvCgJ/ho6oqgFDoUUaZtYJ4hPxJLf2Ajl4Iv6Boa4VhTkyRuMpstmjUNXAirzYUfS6nxerY5g+sEKuLSliQBGHSsYRhFHAUnx2sTcAW1/DtFtX87cyJ9kzkJTcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pE2YcKiF; arc=fail smtp.client-ip=52.101.62.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDhHKmBGAioCmcuoc9GDJqg6qkmXlzcBjtvC+2lJz7lZaD1jSFIVdXyoN71MNH9dGFtafs8p6aKC9/EbyPbc97u1PXXBTxQlvUjQNYXCmFLk00d85Q9U5jbYLPC3+eHXhaw4WsvnwBselmjnkRgc8f2UyDnPbXEJMoQ8jNeh9h7z7UlFgEl3OPpNJMT4NGTJlQb/l80OzxYTVFHTFCSLlusEjtcSSVp5kxBDBpKgPDNgUGrjyczkFQB4Qpd3ofUfw7kWgz15vAWSagkAlcBXVzIVQ3MSCVx8YvR2cjPsdTwrWKtH6FCun6SO7Hgfpf4LSTtb0fkfKktiwO/m83ljtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAkkCBy2ZVoFSEz2etSYuD69CLmQ2/Nm7HHXy/jMqDk=;
 b=E7sK3dXEejmgBPuuM5hFVpe5y6mRx2+tt1MbCdZa3gdsoAGiVjuTC+gmeQqGZiXKWm3socMllS1g40bG3V74WM6nYcAnVp0QjSFNX9ApKYwUcHbFQwXndcExDvk9Fl3mjuye2C+yDbMJ5Acwmmzb+7EI0JgTU/x1GzhMr/PYu7DQuZHJmIhkDfAaRKvyhqBm2yKAubzb8nby9pC/k9oW1kYU8kdF2cLxsR+nltjgPAWG2WLkg35Eeys5cs5HhvgisCmFYQzp8Kw/LhpGyABvWWDevOWy6fpo9G/rcQvUzN68ropC0pGEeaEP23XsgBxqtZ+JGLpb/GXSIi9uqsyqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAkkCBy2ZVoFSEz2etSYuD69CLmQ2/Nm7HHXy/jMqDk=;
 b=pE2YcKiFnBscI1L81vF70uAgTnT2c8xYW2rgzwQDMfTTmBrGsL/ta+QZxmCZo6Qf9AYye7EmNV6JOSZiOBQ3t31E3WX5axbRUjF0+dkN/tJrKCtSAFnnD8zdSEKPQ6uBlaJbHqgfaDJGumgc8IEJCmA36o+OMdIp3ELBpMBlIwMjVp7PwtEtqBaZxrVfhL4//mxMlH3bIcbEwrXsCs/98vibGIZN2TT54wEYsUlB273CZAMdOWxzgdYCBtRg3d6sdl6AQhXnY8fycQy/v4HgV8TL67MAOcg7zk8lQYqJx97EuXZxaN/IiL2SkkjWcscjdvgipK2TvrdVCg/mnnnK9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 15:28:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:28:16 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 30 May 2026 00:27:43 +0900
Subject: [PATCH v3 3/5] gpu: nova-core: emit Rust metadata for dependent
 modules
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-nova-exports-v3-3-1202aa339ef7@nvidia.com>
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
In-Reply-To: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ae31a8-804b-47f9-bfdb-08debd96e7a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|22082099003|18002099003|921020|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8/LerZD7pVnr7JFZmnLN7F3awhMf/l4NmtKkSSZdyyWHDAoPIgE5HZeUVt2Tx10xmOgUrfjcE/YtLO6vspR6sN7PyNFTDlXxv1GIWlGtOnQS0IghMvbRK0F7yAQ+b1eEjFMireyAQJpcawuzSXMYZP79X/tJny9gSahpOvQLnbXov4fy+Y2eqEjnfXVPs4P+HgasdEUwLR3dvPhP/tWKvXRCJkD1PcmZ6RaM2/e41cFPLhAwYnSRO+3M7yu8xjLGOiQtwPuyJW7NQ75Q6QNWPxFcP17yDOfwRptrRKSWoW0GYPGo1v4kIwoba9v7d/GZJZUQVdBvaQxJHDi4grvUYSb0Hc9Rdnydhltf1EvPv79L0o0bP6zkFCfPo561/fKnD0s2UoIrcoov8S3sMzMfVzzBpwUhlOpR9AJMc5QVQZdMslifj+UDL/0Hhbo1nkE6hIlSr34+0WV7jx1Ht2L+nmGsip88Onhx9JNmzWJOMP1uvZ2gXHUxBRZXLlqBBuH+7md3m6oKILcjg0p5ZIju2zivUQY4PsoCywuCBtsCTOxZCSaiqdMQqcaNhMKJKNYUdp1aBm9FPmnambeQQWUII1Eos2eu+AQsZlTYnNSanim4mNtbwCQtG+mRifqCq2fYFplOikVry8nUJoqJw2sr8g82yQ8mMclna8HbnOt6h3CDbpnjfugbLIa4dL8sPSvoKDemw9tT7WsdbSaiU9c8+3KTu0JqtXORIBI5FF75kF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(22082099003)(18002099003)(921020)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnNsOFRYekFVTjg4ZlpsUHBTWENKeVNjU2NOcUlqdUE1L3RHMGN0VVoxejRw?=
 =?utf-8?B?Y3RualJ3L1ZPWVlBdWdrbEJJUjVVVUR0bVJDck41YnVvY3VPcGQrMjVtQWdu?=
 =?utf-8?B?em1XcUw0NVhZWk5ESEYzQXNZZjBoMEpKVmRGbGYrTGFNMHh4OThaQm84V1Nq?=
 =?utf-8?B?aVFHVzJzVFlzcUtvaENpZEREVWw1MjdNREFvdjN6ZW1NanBOa0ZIZVdicjVu?=
 =?utf-8?B?VnVsR3dUVFY1M28vNkt2RFZsZUVROHhaRGRGc25pVmNRdU80SEx2eWtzcW51?=
 =?utf-8?B?WGEyWk9xMlNYb0w5NjVWS1MwNFhUY21HeXovT3JmcC9vK1orekh4anYrNVJp?=
 =?utf-8?B?NDhxWGhobDFyZHM0S283SWcwUEUxTnZ6QVB2QzhDMmprKzVUNzB4TFpvbURi?=
 =?utf-8?B?QTlYSSsxcnFGYlFoeFN1czNFZTlDOG44czVFT0hXMWx0SnNXK2RJTTUzK0Mr?=
 =?utf-8?B?ckVsMFNmTzhzWlUveVRKNTJITllnR05oN29zbUIzckhtSVlrY3FTR3JFN0xj?=
 =?utf-8?B?dlV4dllNLzM0bDhtRTFNL2tsa2JCTllXVGRiNlZyeXVxUlB6L2RuWG9TTzRR?=
 =?utf-8?B?aHpQd1V2WjVhSldERFUyTHJHR0JNdHBHRGI3MzNQTWpHT3FLOStndUtzeXhI?=
 =?utf-8?B?WFlqN29tdndyMTZUOEhNTlYvVEZ5S0lBSHp6VVlmcEwzV09tNmt3VzBiSGZO?=
 =?utf-8?B?RHhMUjloaTVObGdvQXBYcnhkeTh0R1FEVTloOFd2WVVhT0xIUGszUkpQajg1?=
 =?utf-8?B?eTFKVmZzeit1LzR3Q1p5Z285TkttQU5lTjIrVklBVXk1NzRKcGtzTlQvK09B?=
 =?utf-8?B?Y01NUm41eUg3S1FJaS85SFpHbkRWd0R6R0g2QjhwbDZxUktTSTFHdGNNNHFu?=
 =?utf-8?B?SDBnQjg4TlQ0QzhDKzZXQTRoRDc0TlNROVNiR0NxT21XWHZlMG9Yd2IvM04x?=
 =?utf-8?B?N0sxUWxib3FFUnFZL0h2V3B5UXpwbXRIWjEwYnAzTi9raVZlOVVXcFRyVDZq?=
 =?utf-8?B?MTBYVEE4b3FESm1LT1d3RTl6Y2VpcUJyZHM5LzU4NWtLM3N4TDZoellGd3NE?=
 =?utf-8?B?U3dXNTkvTDJoY2dpRjB6VnZLTFVXVlI3UGJGbld3T0loeElLV1dJNnZZNmNm?=
 =?utf-8?B?K3pYdGc0Sk9walRrZE5ZYXNGZGFrYmppR3RhVlNPclVsa24vQWNsWW5RNE1a?=
 =?utf-8?B?ZzlJSkJObTd1QU93bDY3ZVdYRE02MGpydVQxRzRsQUx2dmYrRlJ6T3gzU0Vl?=
 =?utf-8?B?dGh2VEFEdFVWdmNud3lVT2ZmZ1BsL1hrWU1Fbys3bStKUExldm9oK2dhWVc1?=
 =?utf-8?B?OGRPd2c2UFNyZ1lDdWFLZitnZk9xa0MzeGxYaEYzZW1CeXR0ZE1iSVB3bnNC?=
 =?utf-8?B?bFBkTGM2Q2w5b09ZOFhyOUZWRVhoZHpyVU5EQS9SamNJUGxicEh1M3pxNGRj?=
 =?utf-8?B?cTdweXJzMkdld2laenJ6cG9mdDJvT082eHJJRjVIMUVCODhJWThWSUE4aWxX?=
 =?utf-8?B?OG43T1crM0pMQTRLdFNLK2RSeWlWQkpUaUpsV1JETGNCZTJUNmVpVjdDTWli?=
 =?utf-8?B?ZFYxSCt0dHVuODUwQTFnbjhRTUx2dGk0YTkraVh3MDlZTWozYThmeGk1aWlW?=
 =?utf-8?B?K1Ntb2MxeHAzSEt3S0oxWVdDU1pxR1F6Nm9LSmhhMFR3ZnFTT0t2ZXZtUDFt?=
 =?utf-8?B?Q3A4ZkRFMDJwakZoMElEZ2lIOUo4cDRYMWxHNk1Pa1lZS1o4RHFmUUVGQlh4?=
 =?utf-8?B?eHRtTUUxR2pPS0g2S1NKN2dKckMwKy9iT0pFdHAxRXNOMERrS2ZGbUpUUnF3?=
 =?utf-8?B?cVNrcjZQK21odTJBbVhWUG1aT281MkppYmVtYWVNQ2VFemNCMGNPeHptVHk5?=
 =?utf-8?B?VkErWEtYOXRQMFdIYysxdm1aOXk2WkVKL0Y0ZDgyWjYrQitlWmdMRUFwRFdE?=
 =?utf-8?B?WjZaM01sUEtJQ0VnNnVIM2oycnpEUTRnU2daVHZFWlI4dW9XMGFHQlF6VDYx?=
 =?utf-8?B?VTFpeGJjd3Q3cUdzaXVFUzYxb2hnMlFGUmpHR2JpSjQyQUN1Ty9PMWY2KzIv?=
 =?utf-8?B?MkowWlpHSjFGek1XVndreU11MzNKVUt6bVhNVHhRRzJmc05wemZCYnlQb2tN?=
 =?utf-8?B?Z2xlWUpmMHJPdjVWVkZjaEdSSjFjTnB5TFkvMlIrYit0citEMkliZVBlWTl6?=
 =?utf-8?B?UHVZNHZtTUVnWncrNjZGaXhiMGY1S1BTeWhtanU3dFArdXVoMlBDZzZZTVU4?=
 =?utf-8?B?ejJvVmh0T3J0WDBhaU1EdWJjYVgzQ01zK2E0Q2lUcjYzOXBPZktwRklUd0xr?=
 =?utf-8?B?dXF6YUhuZzAzb0RPNmRiWkRGUHRhU2RLVmgwaE9FSnFkR2pDQXozS1NtTFQ1?=
 =?utf-8?Q?xwU+T0NNa2KDksNUODXVw5OKqLpnkrTELQ2/SgCsTyc6i?=
X-MS-Exchange-AntiSpam-MessageData-1: vE76CvshvuEQCg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ae31a8-804b-47f9-bfdb-08debd96e7a8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:28:16.4239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQFMxq7zgmTHTSwf2NYXDLc97dWFVG4FPltPM52B7BQE6+3P0sGZ7rjVpUjk8nrRLJl+PXCTstEdFnvPG471GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-13407-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 827CE60505F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Emit nova-core's `.rmeta` crate metadata so dependent Rust modules can
resolve nova-core's types and functions via `--extern`.

The metadata is exposed as an explicit Kbuild target instead of relying
on an untracked side effect of the object build. This lets dependent
modules ask for the metadata directly, including single-target builds
where `nova-core`'s object may already be up to date.

This is a workaround until the build system supports Rust cross-crate
dependencies natively.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/Makefile | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
index 59ac25488896..b8ccea78b2d2 100644
--- a/drivers/gpu/nova-core/Makefile
+++ b/drivers/gpu/nova-core/Makefile
@@ -24,3 +24,27 @@ $(obj)/exports_nova_core_generated.h: $(obj)/nova_core.o FORCE
 targets += exports_nova_core_generated.h
 
 $(obj)/nova_core_exports.o: $(obj)/exports_nova_core_generated.h
+
+# Dependent Rust drivers need `nova-core`'s crate metadata.
+# Expose it as an explicit target so they can request it directly.
+nova_core_rmeta := libnova_core.rmeta
+nova_core_rmeta_private := .nova_core_rmeta/$(nova_core_rmeta)
+targets += $(nova_core_rmeta) $(nova_core_rmeta_private)
+
+# Build in a private directory to avoid racing with `nova_core.o` on rustc's
+# intermediate object names during parallel builds.
+quiet_cmd_rustc_rmeta_rs = RUSTC RMETA $@
+      cmd_rustc_rmeta_rs = mkdir -p $(dir $@); \
+		$(rust_common_cmd) --emit=metadata=$@ \
+		--emit=obj=$(basename $@).o $<; \
+		rm -f $(basename $@).o
+
+$(obj)/$(nova_core_rmeta_private): private __modname := nova-core
+$(obj)/$(nova_core_rmeta_private): private part-of-builtin := $(if $(filter y,$(CONFIG_NOVA_CORE)),y)
+$(obj)/$(nova_core_rmeta_private): private part-of-module := $(if $(filter m,$(CONFIG_NOVA_CORE)),y)
+$(obj)/$(nova_core_rmeta_private): $(obj)/nova_core.rs FORCE
+	+$(call if_changed_dep,rustc_rmeta_rs)
+
+# Keep the metadata available at a stable path for consumers.
+$(obj)/$(nova_core_rmeta): $(obj)/$(nova_core_rmeta_private) FORCE
+	$(call if_changed,copy)

-- 
2.54.0


