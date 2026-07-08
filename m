Return-Path: <linux-kbuild+bounces-13949-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kidaGSssTmo3EgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13949-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 12:53:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E937248BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 12:53:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=XYRRrcO2;
	dmarc=pass (policy=reject) header.from=nvidia.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13949-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13949-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BCCB9304C7FE
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2026 10:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE44433BBE;
	Wed,  8 Jul 2026 10:49:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C58F3D1CCA;
	Wed,  8 Jul 2026 10:49:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507787; cv=fail; b=B6NIQ14O8FgvKwk+FchQI6TGBY6qfcMY95Nv7QhunyviTi3vVo5gU662VfCPorD69OaXy46o0L5UqRUoGShwWWAV4Pe+wXmJ5EJFG+QJxOqTFT81811kAGVhfSZYIsOdoRFZumfTz3McAYCOm67LGxkZwGlt+L3cYF8jsr2pjL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507787; c=relaxed/simple;
	bh=RtQ6jZoW1vBJD7aINZd5xjqooPdt7s6yXgGZv2NfPdk=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=rSEH6gaD3wE5N9GxAkhkE0H1vxoCbPiYsjfCIPraQED2pKr5L6u1czKm0jTB9NRO5tdoKPJgQap3YeQotL4D7RJphrQoNSdF7h3IHvPfSkcc9Id2iMM+8D72sqab2tJFpuO8zzzrhb5R0Yzt6/GzQZcvXuYO4xjfLPSWOZRG0pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XYRRrcO2; arc=fail smtp.client-ip=40.107.208.11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrGyJTYYaS/9ViLuzERWw6ERmz7oBtJ6dgVJoCsqvpNkog4I/plMZlgDbHgmBO74VCJLc2KCrldbrjE+GlppnJkmMs/GWKKlg94C3OAIJjTWdiWeSxl+QQH49dc1QYbNJyylOvGXV1u1tlUMOB9Zksz9FwvlPnK4fZ+WEkWiu6LJviajfYi8a8IU6M2L3R/CPHmXlkQNFH+J9anEjq/QFGTUqALGPdVIFLoQ32niZoJnO21hwnHGJBNT/pyOd5/x3dtmaBixYkEX+gk2Q9KSCFJgSTGJWGl50BGD3VNY7AQbAv+p5ZpuJXOKM3qbqyiP9q5MrjKaC44buGJX7VoLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puWutarde392r9HR6szZdiLTp60v2Qy1sulvkx7av+M=;
 b=cCQfvKQdHMcyiXarGrn1r4Vx8MD6Wn7aD+xvCooL4JpmHQ9/L9Mnjc7GSeWJa1/9w7IIixzsXAyFNJxUW5C/QU2B1nl7J+Ig4bMEEdAjdb82P237JmNhKdur8xGElzuKeq7hqBsOee4lKk5p60FlEzum9pNHST/1RQFMf+FTCz0gYId3VkQxaWIDOZrf7C2QIRgonyt/K2rzcRQ4HcYeXO/1Y4oWUEMr5mT/pCkGTRfKvCFsRSGm4eCAWBLnsLCDObW5z3t0TaZxcLpZB5ZYuk8wN6rb9uveH0oaEr1oRI3Imj/bQ+x+oyc6S1A/4J5GXHivl3IiN0seMGZN8rsJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puWutarde392r9HR6szZdiLTp60v2Qy1sulvkx7av+M=;
 b=XYRRrcO2Ur8LMYr/mQFHdT/7snUXEjtfMT5PrYpj3KNozwOu1zlLX9NvKbVBcrq1xVWFKcw2IB1iObWkrArtsIRPr7oimeB1eYtgdUbKL3LiCds+93dklSPbMlIkqk1NjZkjkU+nso+6fsI6n8ba4oNwjEso8tlB1lcom1aXNIXR8kkNVRiRXGjSaQiuW9vedTEVzB7vN638Adg1q10SXWIdHMX5SZwgEAq9JtEXSyWBiVhWbAh7MCKl8uEwwed8PqAVP8uf8ew6utnXsQIoEO0fgZnaFL2oRVTtAT8ATcjIb99ke5KE4bTYu5wPkGCGMnNHzGj9rtXPr+Fn6ObttQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 10:49:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 10:49:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 08 Jul 2026 19:49:26 +0900
Subject: [PATCH v2] rust: allow `clippy::unwrap_or_default` globally
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260708-soc_unwrap_or-v2-1-007ed724cc7b@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2RqowgZP/IchpJZF1sSWtFA1p
 P9uwbOZ00tm3qzgyTF5uGQrOArs2ZoE8pCBHpW5k+A+MchcVjnmKLzV3WJeTk2ddYL6E1KFZ4V
 lDWkzORr4vfuu7Y/9cnuQnjfJ1hjZz9Z99sNQbL1/7lCIFK0KLFHJsh4aE7hnddT2CW2M8QtTj
 RaavQAAAA==
X-Change-ID: 20260707-soc_unwrap_or-ed37e674a759
To: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 linux-kbuild@vger.kernel.org
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:604:25c::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: aa054d40-b3a3-4de1-f616-08dedcde9722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|13003099007|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J01/yHcUEljoxKco1xSFSuKpBhRhOTwv4705gdSd4x7gcTkzEHHJ2/aKqcwd9XX4ZSqdZOADivL0G4XpOYRFCDIckJzcadRbuzk5xhespE9XvdmM/9nNcgJg12q9MYYvlncaqVgBnxiqrIkKslw5ziY9kXc+JdcX5MasXew3hBISiafrAv9Aja9DH+YYgy/LxV3rTnuOshNnfiNpwxALb8qL9AfEDNssKRaK53ygWWd+FNEX6De6/kpjB/B2t4swwexBu83sbqblRKFgJENIdNVojptbuv1uu1k5v/ScVC7gY5LvTB4jswZAOHQMhwUav69zD9Xe6cD8WD8wx5PJgexbUOyvGEyWL8SUAUQSM2vCeQzzJwnW6bzJpSPE1atHzyW6jAaqiH9Vh5ng8evdChP+cbQsMHlXtXFvbkSVoHEK98TA2D5xl/MzDth2dPGvM02Q7WtEuj66sydlYxHAEmbw10hYBgqRss0XqBTuzv2Xts4DT8hZKQzCqItSA4MLIE6kS+KcXEyNID9gq+s1KfojAWJk8IZWVw/69cfWe7ai7WxVV2gEPs0D02UL9XEzy1nXpuIPqpfX9zP/vRuS/mgjRsbUAYF3iYWy20lc8NB+vZHDSAzb7zyw0W/ulyx+hjtT0Fwkxh3V8RfAkLlkBXcyeKSS3VFVQ7+eLpu4xdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(13003099007)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm0xa1lyN0FjQXdHM1VLZlEzYzZaS2NBNk4wTlZlbWRNa0NnL2Q1eXpsQ2xZ?=
 =?utf-8?B?a3ltWDZpbGxoczhhMXdaT2htQkFZd0lEdjVmcGFKdnlmNk53TUdDeWhQS01X?=
 =?utf-8?B?NVpnK05IZit2b1ppWEZza2JubEFTQlBSdU1GRUkzZHVxMElTME9BZ3k1N0Ft?=
 =?utf-8?B?MnlUeGZ5dVBRN3BIWTNON1NDZ1NRNmgzWFdhNFlPNlo1eDJBcXV0eGdRZjdD?=
 =?utf-8?B?dC94UkhBd2xwSzhaQkIyOUpzUU9sMUNsQUJhUlVtTXo2eWlCY2hJRkZLeUth?=
 =?utf-8?B?cC9WdmlTUGVxWE5Nb1FJamVLRi90eHlsYnNzOHRINWpBM1cwa24zTHY0Wmdj?=
 =?utf-8?B?ZVZ5amswZncxQy81SXdTMktrb3hhVjUxVGkwZmszYVVQNStaQVpDcUlZR3VH?=
 =?utf-8?B?OGpOTk53QnpEd1Vjb0IyMHVncUFDemhEdEprbndaSWl0bDRUVzhqTzAxWkY0?=
 =?utf-8?B?TEpYbUEvd3U0dlJWcEZIZExTQ2ZNbC93SVFtNVh5ZGx0VG9FZDVqakV2M0Iv?=
 =?utf-8?B?dWM3S08wRjFYSGUxREM5aG9pZkRNV1Ywd3RWUUM1NnhYRStrc0J2cDU5TjMy?=
 =?utf-8?B?NWRRdVhzTEg4ZzJISWxNeGFPdHFhTUNmN0lITFE0OUNZOTFFbDhsVXUwZTUz?=
 =?utf-8?B?aWNvVVJFRnB1Zm1seTdSN2hRenUxN245YTl2YTI4NUVONTNnVlFHVkN2bWhh?=
 =?utf-8?B?cWdYTzk0Q0Jnam5HdnQzQVk2MnlDOVhPWmxxdDhoS3JnRTkzMkxaWWo0VEtn?=
 =?utf-8?B?OXFxOUlENHJEbTFlNWxnVStyQWFycm1GTDU4cFVaU2p3SlQwSlpmMHN1ei9Y?=
 =?utf-8?B?aHgxNnl1WHAzTVdXRGZyOXc0YUFOSUpQdEdPZGxRNnJ5WGRTQTl5KzMxd1Ri?=
 =?utf-8?B?azNaeStGWVJMVFJwNUtoUTI5ZnJsSm9OalJZZXZ4WFhIdE1mYTBiczY2cTcr?=
 =?utf-8?B?ZlZXbDhKcDRQcGtTTHoxbHZaRmZpbWFpRysrcU5laXdWMHVDNzc4WDZqK05I?=
 =?utf-8?B?SmRUSWptaTFFRGZ6bVFvbnlsK001ME5LdWxjUWE5ajRzMzNibEdZRTdSK3dU?=
 =?utf-8?B?WW9FbTVjT3ZUSzFiZi8zU3NrZS95SDFjaEtLb2VvRkpMYVhKV2dDRWNuUDlh?=
 =?utf-8?B?TkpLd0twL0gzVU92OWs4VUtySG5DNTNpZXdqdWRIY3FPME43YUF5dlBKRUg1?=
 =?utf-8?B?TEJYQkFjQlpjVlY1b2xBdDVQUTdvVExiVk1Ybm1VYTh1ZHJEK21yWDFhU3Ax?=
 =?utf-8?B?L3ZyaGpuSnYxUGt6TDUxMGF2c1JvVGdLQ2VzaDlGcVp0QlZkTEdJTGtHSS9S?=
 =?utf-8?B?RWhxT3MzMVJ2R3NIRWpzWjJhYUJ2eDdFYk9aMXFwVTN6d3RESUZ4dWxkMlND?=
 =?utf-8?B?YkhnUWFhNHpneFpGZFdaQko1MDVneXVEQzRDVG1uNnpyMjBtN29nUGx4YXhQ?=
 =?utf-8?B?N2ZjRnVNUG01WmFMRTU2c1Nnd2JiMzZuT2FaVmJZMjVVVjVIbEE4YlpXTnYv?=
 =?utf-8?B?d3ZHVTQ3N1pGNmFLcmZyV1ViZlBaNDc4d2s2eWgrV3ozaXkxTkt1cy9xallP?=
 =?utf-8?B?OVppa3loMklMaGp4Qyt5ZTlPVXQwT012czAvdGFmQXUvZGF4UzQ2N3J2UDE1?=
 =?utf-8?B?eDJiY2ZmUzN5VlZNL2pwNklUdnc3OGhvQ1ozNWhycDEwb1YxRVlDS3lubExr?=
 =?utf-8?B?QkFWbTRlVDJ2bWpSM29mckQyeUlVM083dWRhVXVLVFBYZGRER2tuWFpHbEd1?=
 =?utf-8?B?TCtEbU0xMkRDbTBySkxLdk9tNVhqL1A3OVg4Y0ZuVURKRTdhbXNTVExucS9X?=
 =?utf-8?B?Z2ZPVWxTaERyYmZDVG05NitCNjhMdWVhbXRrK3pKNDdXVmZoOS9kZ2pyVlph?=
 =?utf-8?B?a0grelJTRFN0dk8zblhRYlduMzM4MEFrV3ByKzlFUG15ZTg1SVVzMjZQdkIr?=
 =?utf-8?B?eCtDSVR6bHdFRCtwUkNWd2ZYZHdIRmIrdlN6NGtoK0lpSlJONHlldWtSVGxH?=
 =?utf-8?B?QXlFSDBDc0ZLWGNwSkVsZjBldDRxVTdCZzJJSjhZL2lmSEw3OHk4cGNLMVNT?=
 =?utf-8?B?UzV2MHVKdE0yYTNPbzBTWGJ5L0N1YkdyZjc0bEM2SDVkYnBGb0YzSUJiYUFS?=
 =?utf-8?B?ZjRoTFM1UmtsYklmdVdyeTlaSmNnbS9JcFZBZE03dUlRU3VjNUoxbFhBeU1F?=
 =?utf-8?B?dkI1Nm5HNlZVSU1ldEZCakl5a1IzRzBuYlNQeWZxazdQeTZhY1VPeTJqYm44?=
 =?utf-8?B?TS9yT1g3clE2ZGZrVk5NaWx5bVVvckh4YmJhUnI3by9tZy9qbVR5aXVIYlds?=
 =?utf-8?B?dWJBcHBGZDFqaGxFOENqZjVmTkhVRXdnVENyVlRVVVovdW95R2xTUE95SVhV?=
 =?utf-8?Q?MkSF5mc4eKiOJI6Z/wKRpO8kHAa0LIaImQtRCJnfRB7Ev?=
X-MS-Exchange-AntiSpam-MessageData-1: 42bEIVqoaCeLEg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa054d40-b3a3-4de1-f616-08dedcde9722
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:49:31.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UZh2sO9o4RdkXsPFHfEWypOziAu4OBfNvHHKqJOvM4nA4UOG8ysozJ86tRn1owioOHayOvDYtaSWpVgRoMhQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13949-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:acourbot@nvidia.com,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:work@onurozkan.dev,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,onurozkan.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1E937248BF

Starting with rustc 1.88, the `clippy::unwrap_or_default` lint triggers
on `rust/kernel/soc.rs` if `CONFIG_CC_OPTIMIZE_FOR_SIZE=y`:

    warning: use of `unwrap_or` to construct default value
      --> ../rust/kernel/soc.rs:66:10
      |
   66 |         .unwrap_or(core::ptr::null())
      |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unwrap_or_default()`

This is a clippy bug [1]: the lint decides whether an expression is
equivalent to `Default::default()` by inspecting the optimized MIR of
`<*const T as Default>::default` exported by `core`, so its outcome
depends on the optimization level `core` was built with. Moreover, its
suggestion ignores our MSRV of 1.85 (`Default` for `*const T` is only
stable since Rust 1.88), so we could not apply it anyway.

Disable the lint globally rather than working around this single
occurrence; it can be re-enabled conditionally using `rustc-min-version`
once clippy is fixed.

Link: https://github.com/rust-lang/rust-clippy/issues/17379 [1]
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Disable the `clippy::unwrap_or_default` lint globally instead of
  allowing it on the site triggering the issue.
- Link to v1: https://patch.msgid.link/20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com

To: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
To: Tamir Duberstein <tamird@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
To: Onur Özkan <work@onurozkan.dev>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
---
 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b9c5792c79e0..22be861c5e7d 100644
--- a/Makefile
+++ b/Makefile
@@ -863,8 +863,13 @@ export WARN_ON_UNUSED_TRACEPOINTS
 # include bitmasking and shift operations. However, because it generated
 # many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
 # lint which is not enabled by default.
+#
+# `-Aclippy::unwrap_or_default`: the lint is buggy [1] and ignores our
+# MSRV. It can trigger depending on the optimization level.
+# [1] https://github.com/rust-lang/rust-clippy/issues/17379
 rust_common_flags_per_version := \
-    $(if $(call rustc-min-version,108600),,-Aclippy::precedence)
+    $(if $(call rustc-min-version,108600),,-Aclippy::precedence) \
+    -Aclippy::unwrap_or_default
 
 rust_common_flags += $(rust_common_flags_per_version)
 KBUILD_HOSTRUSTFLAGS += $(rust_common_flags_per_version) $(HOSTRUSTFLAGS)

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260707-soc_unwrap_or-ed37e674a759

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>


