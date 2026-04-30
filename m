Return-Path: <linux-kbuild+bounces-12954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAsnOMJt82lf2gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12954-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:57:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC654A4554
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02F703055D72
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 14:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C92436351;
	Thu, 30 Apr 2026 14:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V/SX81kJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013032.outbound.protection.outlook.com [40.107.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958842EEDD;
	Thu, 30 Apr 2026 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560938; cv=fail; b=beRDe0RJbHTp153nmXQOpwG4lbGY9U2f7rbXZio7WOR+dlSpMaBH0ob98rcbu4oDF9KGaGeSECmpT4la5+BPYPo1OJwUNWigBqv4xdSm26a7EBvDSyAWlHqFat0Es9A6N4roedoW23mUNtX7TptazYXaWlhDKujeYY/52nR39jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560938; c=relaxed/simple;
	bh=tkStXHI7nB2ijkfKgtGldCRumkNk303grWJvnYu+4rA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=V0w5lRS4QUPgOP+OVJf9BtDTHBBzvevn8emZAFB10AxYOpeVXWqXZCL5l/6CyEnuJrf1nNm4qQoUq6TkTuPgODcWjchSbPMuGBL7qAJWiBJUdfc1RIzAkI2gOI+odMG5zLNNKDbBWJHQTxIXvlxjI1TxDvwotO7qZbsa4pAbGF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V/SX81kJ; arc=fail smtp.client-ip=40.107.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CL0UA84c6StZc4YWfo05tv+by3EVJkSzByGLla67K806oTqbAMd/EfxA31fDNIrdIF6tTuWn/zLVbSVKRVvWOh/lUV2aC0SDnlQzjazOrZcnrT2/b1tzToyJvdkNVtHFQaXE+0phDcJdggKwIFFf4WATptHwpCY+5QmLEEF7zSVh/5CMJ03W2TFCWUCsmG5BRih6tPsBCR0kvLCPIZG8G45kYLDTiawOUIkm/a90MAlJuTYVOijzy7t+jjr87hLHAqd7ymnp4xW+4xinrF+tEiDcVurI0gCIL01hXsWhTKU2cXjlx5VQIdoqjcJ++PR3q0unIxSmyEAYnaw8duMhng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTAUmqNtl8OYHjcTnb0ZZO/QrbfRkxhGtFKEVHiiGys=;
 b=Yv94ZUsELl5Nu/zhLcY1siODXZ/k+cLnmDO2J0wo0Ui5CPfs+Uwr1ti3/eIK3s41IGPrepy7bvgX3zTxGdyTAI+QOzRCIwXNTtzmAPicJZrXPe6TXp9gCIymsh7Jw7JoyRWhiLlBJq/PiX2aOD69m7b6sRlI13uQsMJzJaMTuvkcrFz3wdEwEvAw6u5NWjcOrJSxlNvJkOt8iYyQJEPLVxafmUoySgpRr0BFIsfXSVy6Zw+S4b2PL0iwYH+OefAoUtTdRH+/bJdeBwZqCD7NmpxTkyMSYxFM0QPnIGJOOJFtZznf64CZr8VYqC3a4kxXFxOo/kp1lIOYNDlJV/HhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTAUmqNtl8OYHjcTnb0ZZO/QrbfRkxhGtFKEVHiiGys=;
 b=V/SX81kJAApNrovTOoqCNh2ngRw2ELobfkyq1L0GUemfdrxBI9iDv7kHPD3XP0YTof5pTcaN0ZB46y9E+lO22raqXe/59/o458ykB8H2QprhLmP4XMCIjgPOczzr7xUwSek2j9SEnvhWQuG7+k26Tx3NHFDYTbO5opgQ0Mqur34gLIqefwOvrRhGmWoDHk/BgCWEzrmBmHqnA3cj3tP4Sug90Kp7BriRFP1JfPjlKg7Et3PxSnVzXsE0FQj+Cp2rueyv3qxj1lQeO0tWyVZw5kCGQ3GNWUTZsW7g+UJ+Ruxk06rIszE03WKcdQ8RPEheEhDQwr/zQuLvJO2d76pVYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 14:55:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 14:55:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/7] gpu: drm: nova: enable calling into nova-core
Date: Thu, 30 Apr 2026 23:55:03 +0900
Message-Id: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDWpoglXEYuqKWPRSgeRiLsrl
 m/x/wWMkZChzS6IeBBT8AlFnoGdjZ9Q0JgMSiotq1IKHw4j8FxD3FjUUrmm0bY2ZoCUrBEdnd+
 u63/zPixot/cB9/0ASaf6RnAAAAA=
X-Change-ID: 20260430-nova-exports-502f996c5aab
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 910f986c-856c-455e-9e9a-08dea6c88322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	zEV/8IpiaecVBNyuMYVmW5fQ1hPDZAaNjQA8BSYYfLtc9rMUX5gSVq6Y7nJ3zKeT4H2e03MErdY4YNNtdCcwiqklgUWCCitP0ysxeVS1HbRoJm985JCubfTkY2ltVZ33Gw8JWXFlsZaVa4871HFCxkJynJYxiSlkcWsKv3JfTGo6l2NcXSejA0eJDXkPxluNWRy7Gv4DwRew8pGJ9zXN5MV4uIXF+ynRg7AVhrLf9RTmJXffW/C2IbceTwIRTs+KiO1zxRZ6bcU16LnTkONEnPT4En1gT89tFVViDzNB8wrqntj6yNhqH2shbF45XFF5Fcu69iak+JR27XC8OJ7DEL83hoMWxDdIvdwS164w63GrkdP/oBap5vJPpKq9SIxUV85UK7mW+vMA1py2JyFl5ZPvvSA93t+ESicLX3HT3FkUVcH5rtWg9VxASXxHWDyzEXpbJZLY6l3YzivwLejrjghmO+2rLoV61aIqsYLeQIto2yv5SRF9Mdamdp+EMkI/DHKbtNqqQlXqrE04Al/ksoxwlpb4ZtW1KaBhvX4lC5wI77JinGdgqqkqkzuWlQi5Q0i2DPiK0MZIdCkTkoWEIHu51kK+BqicZW511CA7hyUI91mGleFRwiMyD0AG3PEaqSMpOwMGZMVXMSsn0ZceWGPIxu7W7PtrkcjmJn3gZkjNCBOQ+tSGGbiZuNw0Lm8d1+GZaloVvm33olct6JzvwAPwUl+mlCkW8yExAUOkevKd/bhgtre72WHm/zKdECu2HbsvQtvVm/s0vH2Wqa9yJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk51dlduWkJ6ZVZ3QkluZlNiM1k5M2ttTkxVNkZrLzBXVWRhZXZFMU1oQ2lL?=
 =?utf-8?B?dVlSVENKMlhaSmxyV0EwQmtkZng5aFc2dm9SMHZJUVdFUVlscjBMUkZ0NVVN?=
 =?utf-8?B?eXY3cWNNTlJIWHd0MUNBN2tqMzFSbXFrNVJXWWI1MFpJNGdnVTZMU3dmeFdG?=
 =?utf-8?B?cTQya2pQeFRsWUdhemxzZUhRY2QwZ1FSYlNtSlgzQ202QjdrMkkzb3YxTTZ5?=
 =?utf-8?B?UEllNzUvaFNkMDRTc2ZqZjdaZVVPOHVIVzJ4dmd0bDJpSngxckxlOXlTWUg3?=
 =?utf-8?B?OXVqdzNNRmtCczhyS2FKOWtsQnFsNE1yc3IwUFN4NVlLWkEwQ29hei9nWXcr?=
 =?utf-8?B?YVFLUDhxbWN1aTN3MURTY1N4eTExTklpWWNjd3Q4K05pTnVVL0o4aHZyb29k?=
 =?utf-8?B?aVRLMmUrVytQNkRSOEpEM1YyanVLU0ZVcHgrbElWMHFGNm9rbS9NUHRVQ2V5?=
 =?utf-8?B?SlEvSjc2K2pUZ0hTeHNqazhBTDdRclJQaThuWE12cmtvby90VSt3S1VFbGlu?=
 =?utf-8?B?KzlyK2ZDYTRVeW4xL215K2V2S0t2WUM3akZQWW1EdERKZGVrN3QxM1VOMlps?=
 =?utf-8?B?b09aaVJZSEF2Z0ovbEl4Z3JuMVk4QXJlTStINm5uelNGZ3RsaEFHSWpnNEhu?=
 =?utf-8?B?eXR6VXBvcXQ4eGFZTlVZTGJ2Q0NCYWRRaW9SSmpUMG5EL2R5dHlEMk9hM25n?=
 =?utf-8?B?NkN6V29MZUFXeHhGY0pvb21rMGptNXNTMGt5dFNadk5FUENqdHljUjhMalhQ?=
 =?utf-8?B?bmszRFdSRGJoaTF4SkNxbm9CdFVpWHNKVi8rTlM4V0oxUDhXWTR5cmJ2all5?=
 =?utf-8?B?V3oyRWozRFFBVGFQT29WbkNLVEplekRJWmY4enJJNGlqUXZUVkphZzRvR2ht?=
 =?utf-8?B?TjQ1dXllRjFCNTNyWmNybStsaURZZzhJYkxnNEhGQ25WVWhIN010QlFadmZU?=
 =?utf-8?B?S0dCb05GTTJzeGZCNmRMREEyNGJkZXM4ODFMTGk0amZ2NnJFSklteHYySlll?=
 =?utf-8?B?VnZZSHppVzhEOEtBc1M0T2R5SWRtUDI3Z0lmeTFuQ2lkQy9XRWlyNmUyblJ0?=
 =?utf-8?B?NHFEazhzU0gxQ1JEQnU4VmZCMDRZK3pQSVdCY1dGNk9EVVo5SWJYZ29vZXRL?=
 =?utf-8?B?elRicVR5NjF6UkF1cHVCVWRMQmRrS0VtVXJEbElhTndnNFErcjF4QjdtR2V2?=
 =?utf-8?B?c3NmKzFiMlArQUlvUytudkk0RWVPNm0zNnZlUHFFeWFiKzhSeVZIT013RFN6?=
 =?utf-8?B?OTFRT2dFYW9ZWHBtRDVJNVJ0TkdJT2ppbE9JcHE2N1BHdWxrYXgxY0lkbXl2?=
 =?utf-8?B?dW9odlhOd3FUVU1mYUpNRGVCTjNYaVkya0tXMTM3ZG9icGI3b3VCYkFtcmh1?=
 =?utf-8?B?aWw2RUlQcnQwMy9DYWh1dElUOE1KVVhTSjZXRkNEM29DKy8xSkRuK1AvS2Ro?=
 =?utf-8?B?ZFhkNlBoc3VMRXhucnlBNmQ0MEJGWFJWbVlIcUNDblBMRktyVzF0NjVaQXcx?=
 =?utf-8?B?V1BJaHdlK29ZeGxKUFlEZ09MbGs0dTBTQXB4Njh3YWRhRVdLZ0JRWXZJSGdt?=
 =?utf-8?B?RWV1ZGQ0eTQveGIyMUk0TmdoSThUdnI2b0JFbHhiNDYyeDkwRkNucEJlZzVO?=
 =?utf-8?B?STg3SGVKaElET1AxMU4xaDluMU5nWWJpc2IrVDAxbTFsdElkUURsOXFLa3hn?=
 =?utf-8?B?dk1rWE40dVFjWTNpc1MrY0YzS0hxNUpFdHQ3WTNWWXdNcHllQzBtV1g1NEty?=
 =?utf-8?B?ckxDb2huOHVpekgwLytuVm53YUVEbEpZOVdvdGt5WUFTRmM2Y2E3YXFXR0dr?=
 =?utf-8?B?NUY0RVFHTGF3YURyWjZjWVppdE5MTWVmVmFRbE9iYTNRZHhzS0Vid1ZSTmsr?=
 =?utf-8?B?N0M5K1NtQzdtL2dzWS93ZWRLc0hCSGgxbExtbWw1Umd0VVBZRUlJeHBjdHA1?=
 =?utf-8?B?NFBoSjFMUjVxV1ZuTUxpajhFaGZ2dXNYZ1BnbDV4M3I2VTY2NmQxNHhmVUNE?=
 =?utf-8?B?d3Q2L0pFZnRqQ085cGRkOWxpajIvSVVhL0J1SkpxZDI3MDVHVFN6WjFFRVli?=
 =?utf-8?B?NlU4bWNTRjBnZWp1SmkxWTF5QStCUVJ3TUFCUG9aREJRUHR0QUFXMndLZUdG?=
 =?utf-8?B?ZmU1NnFUU1J5ZE8vbDgyRnJqSExlVkc5MHI3bk9XUUVZdTJGS0RvcllEMXI2?=
 =?utf-8?B?YWxUYjkrb0V2cWZJZzM5Z1BudW5LbU5CVGF6c3J2dmdKVlNMTDQ4REJUcXFk?=
 =?utf-8?B?Z28zK2R3ZHducURuOXVEK3JMMXF4TkZmVGtmK2FlblBDRGVZcDA0V2xDVWVO?=
 =?utf-8?B?Q3p1dEs0YUxkckd0ZUxXR0lESUVUUUNqNFk1blpJcUdSc2d3WU80Wk82RXh5?=
 =?utf-8?Q?rAK05yDcS5RcDil+KjA1pqpvjXzUi54EhjCUJ9pi1AXUE?=
X-MS-Exchange-AntiSpam-MessageData-1: P3OiVYx1ibMpBQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910f986c-856c-455e-9e9a-08dea6c88322
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:55:25.8927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQRE1qwDAt2GJcK7mvhQc7ChlEUrPOj6kLdDX3/yGj4anbFa5lorYLCgmbtLMNhmadMLOUSunXSn/FjMrYy06Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-Rspamd-Queue-Id: 8DC654A4554
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-12954-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

`nova-drm` is scheduled to expose a user-space API to receive IOCTLs
from user-mode drivers, and to call into `nova-core` to perform the
actual work. We are about to reach the state where we need the ability
to call into `nova-core`, but the current Rust build system does not
currently support this, and the solution will likely take at least a
couple of cycles to be merged.

In the meantime, this series would like to introduce a Nova-local
workaround for `nova-drm` to call into `nova-core`. It generates the
`nova-core` metadata that `nova-drm` can use to resolve references at
build-time, and also builds a list of exported symbols for symbol
resolution when modules are loaded.

Since Rust symbols are long, this work ran into the limits of `modpost`,
which the first two patches try to address: the first one, by detecting
and reporting buffer overflow situations that were ignored until now;
the second, by increasing the size of the buffer used to build the
symbol names, so `nova-core`'s symbols can fit.

@Miguel: I expect the design used here will allow us to smoothly switch
to the new build system once it is merged; I hope you are ok with this
temporary workaround.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (7):
      scripts: modpost: detect and report truncated buf_printf() output
      scripts: modpost: increase buf_printf's buffer size
      gpu: nova-core: rename module from nova_core to nova-core
      gpu: nova-core: export Rust symbols for dependent modules
      gpu: nova-core: emit Rust metadata for dependent modules
      gpu: drm: nova: build after nova-core metadata
      [POC] drm: nova: demonstrate interaction with nova-core

 drivers/gpu/drm/nova/Makefile             | 15 ++++++++++
 drivers/gpu/drm/nova/driver.rs            |  6 ++++
 drivers/gpu/nova-core/Kconfig             |  2 +-
 drivers/gpu/nova-core/Makefile            | 48 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/driver.rs           | 20 +++++++++++--
 drivers/gpu/nova-core/gpu.rs              |  9 ++++--
 drivers/gpu/nova-core/nova_core.rs        |  4 +--
 drivers/gpu/nova-core/nova_core_exports.c | 11 +++++++
 scripts/mod/modpost.c                     | 13 +++++++--
 9 files changed, 117 insertions(+), 11 deletions(-)
---
base-commit: 11a63a5335eb7b5da4ca38014fa83be5d437144d
change-id: 20260430-nova-exports-502f996c5aab

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>


