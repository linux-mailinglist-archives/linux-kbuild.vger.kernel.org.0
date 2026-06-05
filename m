Return-Path: <linux-kbuild+bounces-13595-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bDtiJ3fcImofegEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13595-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 16:25:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 155BD648D43
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 16:25:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=oBl1zhvq;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13595-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13595-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 387A930492A7
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 14:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58C82773CC;
	Fri,  5 Jun 2026 14:19:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90483194AE6;
	Fri,  5 Jun 2026 14:19:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669160; cv=fail; b=R2C4xk35Yg43z0K8kmCCGEi4M+LFe4fv5vArWapaDNY8Jx24B2wJqAi+zKDCXT/Cb3anrJhX33CvxGIubFMGSfXPLv6SzbnzG6EKBj72TNVAJw7VFy2koMmcecXawAbqJws5oEbTo5ALu0AirblDPTM2As4hkVHpZz2Hq+n9bWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669160; c=relaxed/simple;
	bh=dQnhKg7uqyjXzIuhiqz5aVc6O42+jVxZK0QD45fPV6I=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Yw/48MLtVapdVEcUmNXOjUtEedLGIKRDbVg3zOXQVlh3P6SBfBhkq0W8rIEiNAINvtwq8dWBvr037pBjqIwtlgA41oqtVl7UK5GdK/8yPthxXeVlJTUEqExp5ifiSiFfv+MSxuy4CSJKsFNoBg9/aNUrurkNUiIzt6Vv0kdVjwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oBl1zhvq; arc=fail smtp.client-ip=52.101.43.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbbpGt/EVo+IlTXdZAHVbRd4WXxd93odmnwuMQUTvr0mEXjpWQ/IpORvcxU3hmEo3HAMyt+7bavQMFnZ8/MNbH0GydRE3uU7qpEFdayKUcD50HWdoLZzJJmoOq2v+8CWiQHA3K1yKLTb0vYrdMD+H03VgfBjzWWgGEwLrgcDnrRHXFz3MT288IKETt+jTLUqHk4oSca4RCBI5+VHRnNsx31FoPnfSSMhvf/se7XH++dZAYm5JrChWvJX73HO8EPXICroJVcNONI+Zmj23Dsys3wadNfz2iLyplklahUNwXZa0GJQRPrCH5onf0dxN5Uan+krn29xfoCNp4S/mw6voA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNpgEOmiDuVY6xL0XFcfkpIuVQfY91pXoUjoLjF0CZA=;
 b=RXk1vK0qn/M1Mny9zOHWzKYljkPJUkmUw/JcofwUDHwGLfFixKWeKZS3xDL7XdLn2MasWlD8+whhO4r5hyHF+SLRGrSJVB9dfcOVBMqeIM0p6dyBL8vtF+MzXu6ytE27R0H1mJsnEdai6Hj7FwhcKSeE/LiIY16F3A4WOgFTX2hb+ugHQZQpBNOCFnbPbHqE071t5T30GwYLwfW1v90wihNljjwgfQBSzsWyrGcd94D6BY4eRDlB17DStUCwsvXKGRB6/9G3FdtxYnAinE1G15eMUV61GPmnjPGzyPtfEulUh3E5Z80n/hR8koxZbXfh4L5BBLxjHa92ItyOT0iRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNpgEOmiDuVY6xL0XFcfkpIuVQfY91pXoUjoLjF0CZA=;
 b=oBl1zhvqmmwOkPnIiijccBukH0UxTsjYgOtDotX1/6gV2BrcDP0IoDDCuma26DTOE44Mh6UU56bbC04bDmbbJW75bVwg3a2maNv3mVRO3FxWWTjwjpQtW5VdKXNxWjoy1cFwIIbqnOPhHqfoXpsV0IK2IKOEx71i6yOIiPSXRG8e82U3Ujdpm+YzxaFEpJOJrcowkCJ8IRrrZwrd5z9qZ8Mr6FIFt4864I8a04/dT6Frsr5B4yJsJF8i3xNM3+aU79aWG4m/Y0cgzxoHeb+Kkzmg01p5rHqTavHh4gKWvpB9Fv5dEvalTudj7B4pakK5UzNyQXGUFPX5Ptw5mj18yA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 14:19:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:19:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 23:19:12 +0900
Message-Id: <DJ16J7OSI38Z.2Q7N17PWBS2DH@nvidia.com>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Joshua
 Liebow-Feeser" <joshlf@google.com>, "Jack Wrenn" <jswrenn@amazon.com>
Subject: Re: [PATCH 18/18] gpu: nova-core: firmware: parse
 `FalconUCodeDescV2` via `zerocopy`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-19-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-19-ojeda@kernel.org>
X-ClientProxiedBy: TY4P286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bdb944-32f8-4ee8-1441-08dec30d6cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FNWSdx62Ag079P2fLII/GugtHaspUgbhCpOmAzdOPnllfh70KD5JtbACCvi1bF4MnUjYDCxo0gw52STzGXxjq1boG6Z33y2Wc4G4LIh8pH8M0pMoouSn2AiDH2ZHctRr425Ps+1vw0zY00Xns+MXbkGIOmD7COYzWVNtvXp/m05mW01QsrbA41GAQWWMN9HvN/Dc4/SZsXI7tnPzCwF+/mceLdEeIlo1IPI8Z+K1+ATHJYUnOKXFcfxzQmTMOIzfOx3ybrZ0treOHtn16p4tNi/ewcfq6ZyKBdWbh1r+g8PpeUbB7OeX1+9fzdOYgn39z0HpOMhTOmOgFD4ZLksESN2Y5AXumnGOELFn3LaGK3MrJszlE1bYrixArdoOa/3mBXLo7PI/go3kKQiA/rgOouGrVnPqSy8teyzmGkvIOe23dGgSIOI2smstn4Ohokb35ii3+C5gtKmP/98vW2nh2oSLFfYTv6+Ek5zBS0NlAKqo9MPCTKOXL33Eh/waSRwqGPxLaiBUW1Yt5VJRBaJsp00BDBmbbMsE5p8ERA53P3VMBesgls8RLtfgUiCinzrJB5JjNMTx9/UqLCV8mv5W6sereL9rdqGe9qFu9hWtz+N/sRCXfNepfEGM5948yjrKE9lIdWsm9CSDoN9xVm8WlatE7+GZ395m4uzNoVi8YzUj8INcFXUX4nq9dog886KL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHhiQ01VNEVvZUZtYVJ2RmdTcnd2SWU4dTVLWndlNi9jOHFWb2J4L3Yxck80?=
 =?utf-8?B?NzhraDNsVEFEeXNJMWNxWGc3VjNFL0F5cUhIbHViYXExTTA0K1JwYytxZTZL?=
 =?utf-8?B?VlJhWmc3ZTM3WWdPMEppTnNvV0ljQ01zYTRJc0g5Y2dnNVU5c0J2eXJ6MnZD?=
 =?utf-8?B?OWJUOTFNNGEwZ2FtNEZWNXkxWjRKRWsvUE9ubEg4NERTZGMzNW90TWc2czM1?=
 =?utf-8?B?ZU1HcWlJcWpjWGhRazlLdHB4amVKQWE1QzNJeGR3akZSRDBKWFMwYW1qWm0v?=
 =?utf-8?B?L0FPeDV5RzFwYjhiMm1sSGRieDV5aWk2WUtrbTN0dDJxV3U3WFR5SkRrK0c2?=
 =?utf-8?B?NGpDbkdUeXYrYTE3dVBRRlZZdmg4SEVoZHpBaWRPSFczS2k5WU9uT1dmdGVW?=
 =?utf-8?B?OTNKRU5Ncm9ja3NJdnNjeGdrYkRrcTArSmVSaklrd0M3aEFvYW8xYUVVME5M?=
 =?utf-8?B?bFhZYndvTDM5TXd3UVJQM0JiRzIrMXduRmRhWHR5K3dyNzBib0MwU3VjK3Rq?=
 =?utf-8?B?d0JOR294eU1lV0NVYU9KUENGSklWZXdzanNLRjgyL3ordDhVZzRwUi9WY2hi?=
 =?utf-8?B?akFzSjBKS01zV0pWbFRha0M0OHAzZElhaVc5Y2RjV2ltck5kR2xWR29sWnZo?=
 =?utf-8?B?WVVuaTcra1Z3QW5keHNvVm1KdmdoV3FEYjRsUUs3TlROV0FDclc5UFVvSTAv?=
 =?utf-8?B?bDVEdE1WMDFMalByODNJTGpVbTlZalVRVzUvMlA2TlYrc2JYdWhrY2lrMFI2?=
 =?utf-8?B?VDZpa0pYZW9WTU4xK1k2RE1uQ3diTzJyRFpYUDN1c3FUSWxYc1AwUVBZQzRF?=
 =?utf-8?B?Umc5bnR6YldmTUIyZWFjSGZtaTVyOEFibUl2eTJTUDRBSzhXMDF4c2hRckFu?=
 =?utf-8?B?UFhZd3dnUDVHeEFtak94dkpwYUJuYVEydVpSeUVLM21qWXlQUzV3QVZ3THE4?=
 =?utf-8?B?YW5mV3RBdEFuQU9nSm9oemkreHJFdmN2cUY3Z1l3L2VEWVdPNnd2a1JTWDZk?=
 =?utf-8?B?dDFlUTlHV3kzcXVaQjN4YVp2U1FqOUJNaWVhSlQ3N2VLMVc1SXFXYmE2SVh6?=
 =?utf-8?B?U2dXdHJuK01SZ05nM0xoei9hOU9xVzlGaC9yalJPZDRwKzNnalpsQ2llOXRt?=
 =?utf-8?B?MnRCTDZ1aGZzWnpGR1VwQk1vcEM0TGdpTStHOWZZUWNRNGlyR1ZRS1R6VmpO?=
 =?utf-8?B?QTR4OXBzUGVud1JOenF3YU5idmNvSDN3aWJ5d2dtSTdTSzBtRy93L1NWTDZu?=
 =?utf-8?B?WlV2R1JkUE81Z0xqY3JtZnF6SXlneHZvT3orVExjeDF3Umpib3RFcE9oUWxw?=
 =?utf-8?B?M29MZ1hNbXJXZ3hnLzRUVkFxTFo3a0hSV0FZckxQRzM2ZUZjUTlDZjY3YVo0?=
 =?utf-8?B?OHpweklvMUhyVi9OaE1CVU5rQ1RNdGZMdGdVUjJYRCt2WWRIajVuQ01QQVNB?=
 =?utf-8?B?VmR3bUxnY3RwTjlQNXVRNW8vQ0REVGNkK3U1ZEY0cDBGYWlVUEdwRGFOQjdo?=
 =?utf-8?B?NTh1Yjg1d3NHaGgzSzZPRHRYWW1TcTBRY2RsQmRNYWJkYXpBRXcwcFRjd0xs?=
 =?utf-8?B?ZmhpbGtxdzR5d2ZTemlRRTZ2c0tYdE5LbkViTzdyNDQwZUZTTVc2QnFFS2lN?=
 =?utf-8?B?aW85dGFKdzhKbWtvL1A3WFdQdUxoajY0eG5OUm1rRmt0Y25obUkvNW1lelpU?=
 =?utf-8?B?ZjZJejRvc0djMHdDYVA5V0RJVGtyTGpOU1hCbG9MSm9BNTFncmRoemI4RWdn?=
 =?utf-8?B?MnpHSWRBZFpLdUpOWUpFUmhMNFpnVjdmUUlkRituQWFuWWlPY1JyN1RDSFd5?=
 =?utf-8?B?ODV2b3ZUaFBrTW5VVlVvNVNTalRCWHlvcWxQdVY0emZBeDRDWFd6R1BBZVli?=
 =?utf-8?B?QXM1dnpYbE5teE5zMUZoNitEUlBpYmNnZkd3UFd1NDlUZk9QRndDd1NtRnB1?=
 =?utf-8?B?eHZzSStuMzQ3Q3ArUE5uQnZjQUNnM053V0dMeGNMKzZTTkxIMnRYL1NyWHRD?=
 =?utf-8?B?OHNKOWd2TXZxbDFNUHYrVUdmTndDWUZadzE0cTNsb29tMjR6NWFpaU5TS2lq?=
 =?utf-8?B?Z0ZjMFZFMW5PTXFjUXhSK25jZWxKL1dZOE44azgvbVp5TWdrMEVDK2VMdjBt?=
 =?utf-8?B?QnpNM2FEYnNSZmtjcXoxS2Y0UktBek9hdjVNamc3WUtWaXh2bis3bU5TbXBW?=
 =?utf-8?B?NFBqV21DL0dMVkc2VVI2ZjVJUmwwUkdmNjI3VVM2dis3S29acXN2YU5VUmxi?=
 =?utf-8?B?eHlHMXUxMUZPbEVVYW5RR204UElSbGVDZUtkRlJyenlINmVKSGcrM2p1citJ?=
 =?utf-8?B?dFdmMWlTK1lpdnZDTFlMaHZwRk5kcnFhSnQvT09EajhWclYrdlVUSmU0L3FY?=
 =?utf-8?Q?3yMHHOyvXhiJ2PfSL6p2izjExCQxA+7oSIMyuZhBQG0ZL?=
X-MS-Exchange-AntiSpam-MessageData-1: +SXKbySICDVTQQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bdb944-32f8-4ee8-1441-08dec30d6cd3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:19:16.4366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgqEqCT8AmDn+smyUjhDgDbq0JvezXzURUSDwdbM8eKmKkqVRX1ki2RLBR8N3wB4gygfwrf58mxYTN117CSB1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5676
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13595-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,m:ojeda@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
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
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:from_mime,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 155BD648D43

On Wed Jun 3, 2026 at 2:29 AM JST, Miguel Ojeda wrote:
> Now that we have `zerocopy` support, we can avoid some `unsafe` code.
>
> For instance, for `FalconUCodeDescV2`, we can replace the `unsafe impl
> FromBytes` by safely deriving `zerocopy`'s `FromBytes` and then calling
> `read_from_prefix`.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  drivers/gpu/nova-core/firmware.rs | 5 +----
>  drivers/gpu/nova-core/vbios.rs    | 4 ++--
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 6c2ab69cb605..d97da0c0856d 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -48,7 +48,7 @@ fn request_firmware(
> =20
>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>  #[repr(C)]
> -#[derive(Debug, Clone)]
> +#[derive(Debug, Clone, zerocopy_derive::FromBytes)]
>  pub(crate) struct FalconUCodeDescV2 {
>      /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in Op=
enRM.
>      hdr: u32,
> @@ -84,9 +84,6 @@ pub(crate) struct FalconUCodeDescV2 {
>      pub(crate) alt_dmem_load_size: u32,
>  }
> =20
> -// SAFETY: all bit patterns are valid for this type, and it doesn't use =
interior mutability.
> -unsafe impl FromBytes for FalconUCodeDescV2 {}

I can't wait to remove the many, many instances of this we have in the
driver. ToT

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

