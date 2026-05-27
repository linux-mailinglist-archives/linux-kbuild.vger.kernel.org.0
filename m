Return-Path: <linux-kbuild+bounces-13356-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH+3AWrbFmq2twcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13356-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:54:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A3B5E3B21
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D4F2B300598E
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 11:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C281A402B86;
	Wed, 27 May 2026 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MKq9xx6D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CFE40242D;
	Wed, 27 May 2026 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882785; cv=fail; b=M+low+GaA4sPWLtcmV79R1Lce6/RXHhcZLb1jKU6+Y/aQ8IYP99kAMJjFk5ouSYHUunfMEjUS9j4cHo+zko/LISX/ateom2KZ65b+GnmPSXqfmzvvQmMB52mzEdYIFhDT9NEoQ1fS2IFV8vT1m8psN1suJv++XZ/6tKVG6sqCog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882785; c=relaxed/simple;
	bh=FlNN4Eq+fE0xlUZoMLv3UVvs8ExdKJHc5K9L46MmY9g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Bzu0/oWFx9CG5Mp0+vbPUU4CBCeSg9L8mN418Q6VuXs+1E7iex6mQVTc5xXjIdlWLYvFAIRdEfodp+xebu4tgixSOQfWwIuQXP6htkCOUNeJetilqoyht4smh1HlyiY5qgA76ZvxUpplHiPGyaSdOWVGaamWns/6nYwL/pSSae0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MKq9xx6D; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpIxpuIcbDb6pdS8gzzsLKkB4h1XQ2OuYaSQAn7mLtXXp1nsfEURDCNIuoIttPiVJ/eFWT9OJY4NS9AMojQ4xODtkAYG77LrV6byKkwfyz5rVRdWTtf6jU3Zu2phpJhmVquzz2gzTLIMs2iyoLSwG77ASmoJFPSZbD/NtEoUUzX49pPymhK6QunJunl6m2SzgjxaudJQCEUKbaA1y7nXSfP6eE0dqfNBLE2ag3kiP/oa3YG9fdjH+D8zqsHUO6akf1AlWpaICUZj98Q6p6OiO0NjcqFBuob0vCfBIlpBn1hQHpQZFDTJd2dw29MQgPQw4Ium9wKr5S4MaPj41xDyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSiCvFdZB8lXvNnSgIksF/dXxonUalVvnWheZfQxb/o=;
 b=UT9xO1WulqiGiDfYJi00olOYA5yqexQyBKooVkRvMqexOigsAIBKIfRjSINBbcCPWLuDeaTJcBDAnaqlalYYHgtNqBS0pBFLVfPercieFlAZBSVCbNYgPYIMf7lIDRwTcgnHxkGLU54pHL09trsiglrgopMeFzPsQHigXmY0bNHwP9jd2cJBSlofzMzhYnwgULf+p2JpG26HApoY/DlEluuBRQ3CaJiv7Mqj+lGo2Aq1uOE9ftxrYluyE5wG6IXWcLDH4/8loptYMW0QyxEKFawRcu9wLD5ioc3sHzRHHJV5sh/x46arCgJGUwLb1lQs9VmtUbej7UZ5wKHYxu6uvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSiCvFdZB8lXvNnSgIksF/dXxonUalVvnWheZfQxb/o=;
 b=MKq9xx6DJNNCh/1T3hIToa/EYF4el1sxtQDof+WJxzLy0jb+QsLkyhARTNnZi9vDmVkXiwNKsUUofUZxXvoNIjps6eYTuZGkYDmIJcwaUP/ayQTTdzv/60jncX3PNoZoJxx+ACNGlskFR+jGUTGGzhTzVWeVYj0CccKu2lmNq5rZDYnbGy4b++VcOOZJmdLJBy+wevvhsAds3Yr6xK6bcps1dxVArkhsOTv3SoAC5k4tTPHrReAOQvDBxE8I8yq+UEWcZ3eTMPZMvcHsiOSPWYq9T8bU6PVWARYiqKwLuDt4u5WjLFxMyzWTtp6XXQScfjP1GxiPg0+a2cA6DYXK7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 11:52:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 11:52:56 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 20:52:23 +0900
Subject: [PATCH POC v2 7/7] drm: nova: demonstrate interaction with
 nova-core
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-nova-exports-v2-7-06de4c556d55@nvidia.com>
References: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
In-Reply-To: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0044.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 91aa534f-ddde-46a3-09d3-08debbe67d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|7136999003|22082099003|11062099010|921020|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	CIMMuv3lfOFgE/GjIZRSMVr99StGceAs1LHNE7X8JmNVPyhELVBqStSNMp3jOeT1MBDJ4V9XZxehqANxaBVs0CwaiUrhT6nvnSAKee6e1BbzxN/8IwCYks3LFAPUhX+oJYtsTd5k/FmXiIT8ckyp+4ZnYVwCmGZpiWwbSik9Teq1q7QegCXEbnFbXqNuokUfxAmTFuj7xEQuTqvlq/FlEZ6PErHubeV5wgGNn0/8yFKskTEZ7kOkAc9fx446WyJv4Y1xrdW7NB6Y5N4OQxDMBJgfuyemSHZFhEaD9JJo5M/BNvMSiAkL7hh4GLXA8YYH4O67iTP/FNnlSLs0lHaVUPfGkRVJ+XSPrWz/kytypDTgUhauHZlLoVptcDBCORn7ettNLxU4oJZGVSe7pcd5GfHQ+W8Y09uXCDpqtymiF8BWyMQFyMNZICY2Tz47+uin73Y7W2TUYY0Qds+7WURhUYYeQIRxASsXxELnKm4YiVl/aRSXvpXTVOvJhGiKE3njDutLReNrrneNgDavm+ZfyyFnRd8pYxquDPb9K+uCV9D3EaatT77LNTe8fv/ILwjFa7omNC4utssdWYyPM/YPCYpo75nxNDxJq897rgbr1pNKvdNPxDips+5gES28I1doIcXTratH7KyByw3N89xIsNfsrNauRolftBvnpWs0P+zVCe1armQKGTeZUu0+EtSdtyLwfLM9+GxYUt1yGbcc9VEiyY0/Oq9kZYkNEmWEYOc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(7136999003)(22082099003)(11062099010)(921020)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTRZTzV5R0k3MVVNSWo2dHZmVWJJK0Y2azJRUHFqVnFqMTNKV2paekREVGNZ?=
 =?utf-8?B?KzNPQmVHN2JnNjREQnZrR3VJaVVjdXRaeVFkQlVIc2RpczRzd2xWNHROeVBa?=
 =?utf-8?B?ZXdHYk9XZU1tMDFUNFdocC8rUjg4T2xvSk9RbzFldmxLVFBVdmgwak5WejBn?=
 =?utf-8?B?NDQzdzU0cGFpdFhaemMrVGhDaDhMTmZnWmNRNGU3K0pzSlhhOXhEZUVValNr?=
 =?utf-8?B?bVBJYTR1b2FTdFBaYitlaGtBdllRT1N3TFFOendHMjkxdUFPaXA2YUJ6NDFG?=
 =?utf-8?B?dTA0cmhmNHRZUFpTcFFXcUJLdithbFV4Rmg2cEZjUHhnUTQzcjg2SFJ0UE5r?=
 =?utf-8?B?VnN6VjJZaW45ZlF0bzV0c2FsalVVUEJqb2hwbG40VUlHdjNDNUxWTjRveHQz?=
 =?utf-8?B?RWRHaStOcHdValJ1aU9qREN1UUtGT0VPaTF2NitzMnFWay9EWGZhT0tUSENW?=
 =?utf-8?B?eWd2dk9UWE5yTkxnRnJubVgwd2lUTmdEL2xsc2FXSnNramJjMmlzNkMzS1dm?=
 =?utf-8?B?cnhLS0hDMWhHWktkNVFvWGRFTTdJQVovbzhZUGtTdFNZUmR6UkpXclpLeDJm?=
 =?utf-8?B?dFI1ckVDdDJpTm1xZFVEVkZiRGhOeldiN0dudkl3blBqNVZVTzZLQWNGMDNM?=
 =?utf-8?B?dVR2YTA4OHRqb3lGb1VIc2hiSGdmN3lqamkxQWJTSnJlRnlOemVPVjZWbzlq?=
 =?utf-8?B?QXJta0cxSjJqcXR2TTRML0hIMFI4aG9MU1d6OFhFUEt5WTQ2NCs4UUtJRWtv?=
 =?utf-8?B?MVplSEZBd3cxcjEvRllOWGhaL0pWYWlQSytEMExmLzJqQkNtZnY1eWlQSm5Z?=
 =?utf-8?B?TkhVVGNKV1puNWVRdkNoL1p3dm5qY3JLa3V2L2ZHUytBb2hBNGdXcnZRQnN5?=
 =?utf-8?B?ZmN6eEVzZE9pRnFWeTFmY0dXM2Y1bFQzVmRVYi8zd0l0WDNaNWNsSjFEV2pI?=
 =?utf-8?B?Sm9GMWZJNWdpc2M2TDJmL3pwbUdXUXlVSWFVQkRMRXN6MWcwTEhUd3o3OXZD?=
 =?utf-8?B?eVF2MGRJU090eE9RbGJkUkNEYmoyM0h3N0kyblhwUXF2bmRLcDY4YUtvTTdN?=
 =?utf-8?B?c2NZVDMxVVQ5TEwvOXRSQm9SWDd1S0RQVjdpSGVyRW1qbk5lZVp6Wi8yMFBQ?=
 =?utf-8?B?Mm1mVDlOeGk3enpjcDhlY3RLcHAvMGszajE5dEVWL0UwYStBL0lwUDhnRUR0?=
 =?utf-8?B?UDRVNmJ1eWg3aTVNaS9RZGd6OGJrQktxaEM2TXhMbFpVMHh2N1BvSmtwcjdF?=
 =?utf-8?B?NkNDOG1Cb2dhTkQyVGVTbEhvc09pdDkyVTcvWXozRVRuYlZKc09ESTNaRFhT?=
 =?utf-8?B?TFNFbUdzZmZHYzRVNEdZNXRnUVZ3VHZJaGZWdWJkalJJbHRGdGdvWTBmcFFx?=
 =?utf-8?B?d05aei9QaWk3Z3VZOW5SZUVDT3BSc1c5Vk1CTHpzWU5hRGp5NlR6eTVvbG0r?=
 =?utf-8?B?aSsySnpLUUo5Z1psV3gvcy8vcnB1VUZybURtamVnZkU2aUtKSzFsSnYwa3FH?=
 =?utf-8?B?K0J6NWxOMkhieUhIYVYxMUQrWkV2VWhFOVkzeHhBaUFSTTVtSlVlaHo5OERM?=
 =?utf-8?B?OHVGTmhtQldqQ2ZDbWVYRmY0SXhoN0UzVmNBMnY3WCtaZzZBQjRLTVlRRjJj?=
 =?utf-8?B?KzJrN3pqME5MUVc5TFNFR0lWRHBoWjdaRzk3aUUvZ1hGeHFXdmh6K2NKU3I0?=
 =?utf-8?B?L3ZvU1ZaUFVRMWgxZnRZM0lZUGhLakJtOHBOWnpPL3JPUUlUL0ZEb1BmMmhl?=
 =?utf-8?B?cTFVaFhlejQ2N3dDb04rci9wNDZHZWRxaHRvYTVPQVNiS1ZDbWwwL3ZGYkox?=
 =?utf-8?B?bnZoWWxlSHdPNnRBUGNPSGJMbk1uUGFSaWMxWW93R3dpZmVLbVI0ZEVNYWhp?=
 =?utf-8?B?NUdYQUwwV3phV0tPRzlYYWhvU1RjRWhsSzFpVzJiRDVzK2x5OURyZFNsaC9y?=
 =?utf-8?B?V1J4VHYvbWY5TUtwRVp1L2pNazI3UWtubk9LTFpaYjJadVNHM1ZtbjJIZHdh?=
 =?utf-8?B?T3c3NkY4ajRINXBWNldvaERPQURNSWFCMWFMd3cyeFFsUEQyWVBXRGdCMGgy?=
 =?utf-8?B?WnlYeXNNNmFzVjE2QU82U3JLWG5yRU5OMHNIRkh5dE13NmRZYTNYVzlPYldJ?=
 =?utf-8?B?K2ZsZFZ6cGVoS2I5Q2RRSm1lL3BRN1VhV25McWo2THRST2daQ2l2Z3YzbHFU?=
 =?utf-8?B?dm00RWNyMmpuK2xFcGVQQ011c1hWSEF5dEhRTGowbElDc1lVdGdXTGJ3eGxJ?=
 =?utf-8?B?bURWOStSQUJjQk5xcjNkdFRZQnpIZ1JsaVA0WTJwUmQrMERQTkJkaWVBMDBN?=
 =?utf-8?B?ZExlUDY3S2ZPSWZUci9nNi9kajhieFR6K1Q4TzRTODRxTlUwcEczZjZNeTVr?=
 =?utf-8?Q?IgCb8aSlFzdes+5BLPDfBR7MA+XN72nqDSIUb5jtegQMO?=
X-MS-Exchange-AntiSpam-MessageData-1: 7z65Pul/iqdStw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91aa534f-ddde-46a3-09d3-08debbe67d9e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:52:55.8813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fk+dzGymt2+rkgGObyxpYCH6VcumAIqXymebkuYmhrdQKLhiYMU781LcMxFPmGO8nAKqoXODT2J4ZR8Mwq5/yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13356-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 89A3B5E3B21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Export a few items from nova-core and use them from nova-drm in order to
print the chipset of the GPU being probed.

Some documentation items are added to make Clippy happy.

This is only meant for demonstration purposes, and won't be merged.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nova/driver.rs     |  9 +++++-
 drivers/gpu/nova-core/driver.rs    | 59 +++++++++++++++++++++++++++++---------
 drivers/gpu/nova-core/gpu.rs       |  9 ++++--
 drivers/gpu/nova-core/nova_core.rs |  4 +--
 4 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 4289df7de01c..2a3f47974079 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -9,12 +9,15 @@
         ioctl, //
     },
     prelude::*,
-    sync::aref::ARef, //
+    sync::aref::ARef,
+    types::ForLt, //
 };
 
 use crate::file::File;
 use crate::gem::NovaObject;
 
+use nova_core::driver::AuxData;
+
 pub(crate) struct NovaDriver;
 
 pub(crate) struct Nova {
@@ -60,6 +63,10 @@ fn probe<'bound>(
         adev: &'bound auxiliary::Device<Core<'_>>,
         _info: &'bound Self::IdInfo,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+        let aux_data = adev.registration_data::<ForLt!(AuxData<'_>)>()?;
+
+        pr_info!("Chipset from nova-core: {}\n", aux_data.chipset());
+
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
         let drm = drm::Device::<Self>::new(adev.as_ref(), data)?;
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index cff5034c2dcd..49cb1c046905 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Main driver module.
+
 use kernel::{
     auxiliary,
     device::Core,
@@ -20,18 +22,36 @@
     types::ForLt,
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    Chipset,
+    Gpu, //
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
 
+/// Data passed to the auxialiary device registration, for the sibling driver to use.
+pub struct AuxData<'bound> {
+    gpu: &'bound Gpu<'bound>,
+}
+
+impl AuxData<'_> {
+    /// Returns the chipset of this GPU.
+    pub fn chipset(&self) -> Chipset {
+        self.gpu.spec.chipset
+    }
+}
+
+/// Driver-associated data.
 #[pin_data]
-pub(crate) struct NovaCore<'bound> {
+pub struct NovaCore<'bound> {
+    // Fields are dropped in declaration order: unregister the auxiliary device before dropping
+    // `gpu`, and drop `gpu` before `bar` because `AuxData` borrows `gpu` and `Gpu` borrows `bar`.
+    #[allow(clippy::type_complexity)]
+    _reg: auxiliary::Registration<'bound, ForLt!(AuxData<'_>)>,
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
-    #[allow(clippy::type_complexity)]
-    _reg: auxiliary::Registration<'bound, ForLt!(())>,
 }
 
 pub(crate) struct NovaCoreDriver;
@@ -93,7 +113,7 @@ fn probe<'bound>(
             // other threads of execution.
             unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
 
-            Ok(try_pin_init!(NovaCore {
+            Ok(try_pin_init!(&this in NovaCore {
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once available.
                 //
@@ -101,15 +121,26 @@ fn probe<'bound>(
                 // (`try_pin_init!()` initializes fields in declaration order), lives at a pinned
                 // stable address, and is dropped after `gpu` (struct field drop order).
                 gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }),
-                _reg: auxiliary::Registration::new(
-                    pdev.as_ref(),
-                    c"nova-drm",
-                    // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling. For
-                    // now, use a simple atomic counter that never recycles IDs.
-                    AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
-                    crate::MODULE_NAME,
-                    (),
-                )?,
+                // SAFETY: `NovaCore` is dropped when the device is unbound; i.e. `mem::forget()` is
+                // never called on it.
+                _reg: unsafe {
+                    auxiliary::Registration::new_with_lt(
+                        pdev.as_ref(),
+                        c"nova-drm",
+                        // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling.
+                        // For now, use a simple atomic counter that never recycles IDs.
+                        AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
+                        crate::MODULE_NAME,
+                        AuxData {
+                            // TODO: Use `&gpu` self-referential pin-init syntax once available.
+                            //
+                            // SAFETY: `this.gpu` is initialized before this expression is
+                            // evaluated, lives at a pinned stable address, and is dropped after
+                            // `_reg` (struct field drop order).
+                            gpu: &*core::ptr::from_ref(&this.as_ref().gpu),
+                        },
+                    )?
+                },
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index cf134cab49cd..5636659f24a8 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Core types for the driver.
+
 use kernel::{
     device,
     fmt,
@@ -29,7 +31,8 @@ macro_rules! define_chipset {
     {
         /// Enum representation of the GPU chipset.
         #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
-        pub(crate) enum Chipset {
+        #[allow(missing_docs)]
+        pub enum Chipset {
             $($variant = $value),*,
         }
 
@@ -183,7 +186,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
 #[derive(Clone, Copy)]
 pub(crate) struct Spec {
-    chipset: Chipset,
+    pub(crate) chipset: Chipset,
     revision: Revision,
 }
 
@@ -245,7 +248,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
-    spec: Spec,
+    pub(crate) spec: Spec,
     /// MMIO mapping of PCI BAR 0.
     bar: &'gpu Bar0,
     /// System memory page required for flushing all pending GPU-side memory writes done through
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 5a260062295f..5166e10ce8a0 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,11 +13,11 @@
 #[macro_use]
 mod bitfield;
 
-mod driver;
+pub mod driver;
 mod falcon;
 mod fb;
 mod firmware;
-mod gpu;
+pub mod gpu;
 mod gsp;
 #[macro_use]
 mod num;

-- 
2.54.0


