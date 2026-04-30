Return-Path: <linux-kbuild+bounces-12955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGYeJPBt82m42gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12955-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:57:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C93094A456C
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD0D9306CC78
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 14:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33826428851;
	Thu, 30 Apr 2026 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m70fk+gr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C187343634B;
	Thu, 30 Apr 2026 14:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560941; cv=fail; b=txM9uSli8QpuSHpDfpO6lVpAK7Q8l0LJAUNAKoSa7t6tD8Vy1aWY9c/9diEw4nfCDzb9+hquhJChnANLIFSkNQEFlTYJCBUS9OB2UqkQkGmeF7emuk09APqYzXWh1B4nJCF5ie2tRA80sGjv1AV1CPnklfv5HhIODlk/js/tdXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560941; c=relaxed/simple;
	bh=u5az7D1Xx/mYZFI1d+zR9AWh4jRqj6akt5xqdlBV7g4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BgT34hJA2brqEC76PAtApplOcfRUjFSa1bgAWKWyoRZs30UZuA25GTBV7cl/RIe5XwUXBu5IWIF8q2Z8tAPTDARneNf7DqVSPtGF/3Cot5l2rJg+xMnfTSmcBsg15BX30J2jBwjGqKjgD53rTQqUn+ulk/bw3w0Ho6JGgWVTOAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m70fk+gr; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9dbJUFdqG2bwiRjdgVru3eA76kcM0x9kXkgqXawwby0Eg6huTEyQ54yxzbRy/h1v0+L7+hfcTcI53Mu1wT8YEEg8JXcutuJi7lX70gZrtgWgOrBW/eNy8DpjUTZBzcaMd1dzwW/SShK1BsKQDkf+cihr2E52GRx5E4SINcSOrW/474vMENFaQv6bU7e2d/3E9jYRMoxPD/t2zn/7oGmCpedYul3gS4bj/DBJcNk6LxJOyAHdudPIKoGS7s2Bp1z5GH5pyL0Gwz7lhPAnDgjKSmaeSlvPrEQY9116LjG0TWsu81nRKCSIHv+3vYSTIEHtxujO9nBmXw+Ts9yzd2YYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVdTy1k+jQ+s5CSQDQRBWn13Veqk7Dme4lG7WsF8ou4=;
 b=UNKYpIMIniI7UMEP19SgXIJNJ0jqpRq1gMnyKTMju3rI4Ln7OrGenp0si1axMBNkGFoUIQ+p/WPUUzd5dFNvQzFW4mSWLVst4yrhd6WGSfLrdoDOShPIlVdE+zsCIkkyBFilqVrVLmYlb4Isju87Rm5641Ar7FcBjrOS28QKkrfr5FCWoLhx5BUlf3ee3qLbWCqC8W0hhsOcYSh1bASwybkAAfZbAMUQd7A9lnt1pwxXqfshwfMlDBGsdSYJlttald3uN3ALcDq97TG5ujkpxfmCY51sMFZfDF8A8j8NoV71+I7e/wXxvMbPxoq1TlDKr6MOqZ0p/rtlKlfDbDl2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVdTy1k+jQ+s5CSQDQRBWn13Veqk7Dme4lG7WsF8ou4=;
 b=m70fk+grUAn7FmdFpAfG9mjgLgUXpKdOQ44W9eDsrPMgHnzPK0P3rUKYmk5Pzbk6k6jRNGzW9IpUII+09YJLJSIin39ZdSQ8Y9lfsrv5diUKOm13MwDNYGBLby/gts0GT1GZfb/ekUnw8XEzUqN/k5u8XyJDQY6+wD+Qi/osnuTMLrgtsCj9TFYIglXN7/V6MxL2lHKwL6IxFMo2Z1tP/vI2bm9rGRmO4E8ooXTAmhx6tRa3xF9kz1Sf+p9KhPdAQ5KS441xx3px3spu0fy5THiS6NM0Du/nfv5qaYATp8XVDRXwviRZv32AXXVHFH4+/GMxpqG35b3RAWDP4hRUCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 14:55:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 14:55:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 30 Apr 2026 23:55:04 +0900
Subject: [PATCH 1/7] scripts: modpost: detect and report truncated
 buf_printf() output
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nova-exports-v1-1-7ca31664e983@nvidia.com>
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
In-Reply-To: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: b80423cc-1e5c-4d90-2651-08dea6c88535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	QGFUQAAIa5qHFrKBzfwdpQDvOcpLs1tByzmAEekTlBEWxM9NK7wC3ZOtfXEsdeDhO17nDyZ1e3wmPiAjv+kA9puOzzBdzwHXqh9dL3n6TEObhN9LcC2ksdxfLF5GiTtdT4VyJDqmDOyWqOb+G77h4M6af0jTFPJ4f7npBOuaCUbuv5BWQmR+EbANeD4jXcsSOhTBfaqN7p2m3FpYwc4/6URstgIWfGRFCm44tKQg7ZgvL5vD3hlRgP8jTWOQGV8Ch9dxJ/WVKgcw6bUVCaXjVMWe5q1BJx2kwHzr9uw0LSBZlTxmyEVeqdug+NtjXZt+2VU6o4NIGgdK/QdaXZdLDHgKq2rVJnUBUXf8gbi3ZNG1aed/o6/q+G2AfoDnkQ538lZiE5w4/sO66nx9Ygw5697FEu9TeXGlN1fWjPF2LhAqca7lgDyYswdGY/A3RhSFcLsA/cjrq5wq7Lm0/DheyQGgEHJ2SHGbdthZV17YJbN4iE3QkdaY3sXpxNTUH05fE0KIpSnA6JSAOAAJai1qPi5+P9kbSRiDG64uL/wVnstz6N0uaU/748lbAu8TX8ssFDPMlcJfl5WFNS3i5h6E1wKCpWOVeSY+WoH0vYC09q0yh6SKR/eYjCjeT2V14QrU/x+fkJhE44cdi2Sg/dtRa1TlVmg0Yxh4pJTxvLDm9iJi8Y6AEw9n76Yc3JpM7CiEY1bvSCX2EjR8HT1N8iSuTMSzBB/MnTS7kPDtwmICuHT7V4M2L/zjCQKNHhEA+pESTIR9HwiyPBuInRaWB4ePnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHF5a2hjaW54bnBmM0hZSFJWS2kveEVmeGFsaUtKUXJTMjYyQnN4L0lwVHlr?=
 =?utf-8?B?Q3NkUm5seDdMREk1bktBY1VPVDJtanlkaHZleWxub2IxU0lOdnZnVzVDeWZG?=
 =?utf-8?B?TmoybWlCTVBxK2lWaWJqN2tHRVk3MnJqZ1ZiQ09aZnVRNGJCRXNNTW9QWjFG?=
 =?utf-8?B?VkViSEc5MmVVbnFGSnpqNUpCMXRxV2dDa3lEN1NuemJuZ3FuN3htZFFJd1VF?=
 =?utf-8?B?YlM3d3lVaDFlYmh4QVVaVTBJbTFCRUpKV2xmbjJGZnV3ck5NTHVodFdZRGtj?=
 =?utf-8?B?aGgyV25QVVBkYWl3V1ZNOXltb1FVU2VydjVSNksvOXlucEJmY2pKanpGSkZT?=
 =?utf-8?B?eWVIWEFIZVQ4c2RlajhDTHFtNXdkS29PWjBRbW9kT0YyV3VycEZtVnU0ei9x?=
 =?utf-8?B?eW5hbUNiNk1DM2pueTVBQVVtbUUvYW93eGRBajZuMS85N0M4b2NzejJDNXd2?=
 =?utf-8?B?TXorS0FuQXVpbzRWWGxFTGxEWlNmSEVtWHFseFBzaWxmM2NhQzI1VXk5ZUF0?=
 =?utf-8?B?VnFxL05Wc0EvN3RrOUVzV1hiWWx0Rk5MYXl0bEltRnJJbWJzZ044VU1hbEtQ?=
 =?utf-8?B?eTBEUlNQTlVkQ09mY2pXKzB0MnF4VmJMMWlrOTB4RHZ0TGpPSllzQmw2MENx?=
 =?utf-8?B?OVNVZDNoYWMvaGN4eDBUcHNQZktOeE5TQVphYzFhVGhaK2tnTXUvMmZjSVBM?=
 =?utf-8?B?bUI5OXI1NXNaUUtHbVZQRnhvSWNwNHk2Qk5ybUh6ajlxa2xEd29QdDlZdXZM?=
 =?utf-8?B?VVhHK3BvQWhja1ArOFdISXZiU3U0Mk96NW9HandJSDZXTkxTTDFadk8xcXZ3?=
 =?utf-8?B?S2RDRHNHTkJ5Z3d0a3ZTNlp2cWNhZTFacWVmcFNZUzhFV3BnQ1FGOXFMRUUw?=
 =?utf-8?B?UFFES1Rwczd6MEtXUHhTRjFMQVVKZjA1ak5HamtDeGVMNDVUSUQvUDhWWFVR?=
 =?utf-8?B?cXo0M2hsOUJPWHlqODJYb1RJdHBoNTFteHFqNDN2RHVrVm1KeFBDSitzT0NN?=
 =?utf-8?B?Yjc5azk0TUp2RFc4Mi9xczJjNkdmbWNnYWJ0dWxnWTJjT2FUWjlkaUlrR1Ax?=
 =?utf-8?B?TFlLSnc4d21VZUtKRFJpMWZLcnE4dFQ4bDZWdGJoVXlLL0tiK1gxWHc3QU8v?=
 =?utf-8?B?Z043SFdmczlYaGdBYUcvY0JJQ1BUblYzcnE5T2VFQW4wVG5TdXU0MXJJNEZL?=
 =?utf-8?B?bkMwbXVzWnRVUTluZll1WmhuYUFYUnBhWC8yOXJCa0hBZzJ3SEhoK2tZT1BY?=
 =?utf-8?B?LzdDZ1RGTkpNSHp6b1VBRm5NTWNvMVVKelFqdjVUUC9EMlZ6dmFyeGFQalVa?=
 =?utf-8?B?eDdzaDdteVZ4eld3NG1WM3Fjdkg1a2psSW54WStkeXNOZ0I3Z29aR3dmRFY0?=
 =?utf-8?B?a0VMSDQrYTZ4UmZyUUorRUlDNXBHc0pxdm9QQklZQmxKNWUzb3NnRUtKT1Jz?=
 =?utf-8?B?Y0sxZUVZbDBHcDNZOEV4NWw5ZFJZVCswOGFRTjhGYS9URE9zTzZ1UWlrZmV3?=
 =?utf-8?B?eEs1ZkZTaWJvMGszT3RQR3hLVjRoRm11SzNHMDdONjd5MUdOUUFTa3pDNzhT?=
 =?utf-8?B?T1ZpcXREMjVqeGNhWDVIQ2xydjZoU1dYdG9iOTlzdW00OHVCOHJ2ZU1QWGJC?=
 =?utf-8?B?QU9tVzhjaGFHNTZBT0dCamZYTXcwZzJqVmFtdlVmSmRyS1huNnA4Qm5KcmQ3?=
 =?utf-8?B?eEUrOHhVa01vUjdMQTk3SDJIcThKQTNzN3lNK3ZBYWFvb1pZRzBmWkZkaTVo?=
 =?utf-8?B?dFhyNjF1bGZPOFlGSk8vVDJhejdkVzM1WkpWQUZ4T1lKMHVNUEtwSEl0N042?=
 =?utf-8?B?REZodjg5cW5mc2owMDk4M3BlQXhXUmMyenlQcUp0R0k3c1Q1L2FrRUMwazYx?=
 =?utf-8?B?L2tqOWpaWFVaN2IvZStpZnRjN0ZjYWdwekY1YW53MXg2UkVLT1RLOEFMU00x?=
 =?utf-8?B?b0hEZXlJL3RtZWtXc0J5dmlTaTd0WC9PbmxTRHBtY1ZidXJDMkVxNHE4T2Yz?=
 =?utf-8?B?WDN4Q214QURhdzdJelZ4bzBZd2dzck1USXdlNXJYOUozcnl2a2JzYkZmNHNq?=
 =?utf-8?B?Y2pHTWNQdGhHTjc5Y0Z2VW5nWC9XVG9ySXNseFJ1Vm1STkxnQlI3ajdLakJT?=
 =?utf-8?B?bmUvUyt3Z1FMWEdGbjlCRWxBWTkxU0pxT2FwcmJxQjBzd0diMjRFRHZGTEdu?=
 =?utf-8?B?MDZwWGFCaTlpbVNVcEx5TUQ1Z1QzODlUNUFxSkVFZkJPVy9aNDNETUFmdEZ6?=
 =?utf-8?B?WWorQ3grNWozM1JlNG5RQzNPbm1kWHlyNHppTUtqZ0l6ZnBPeWNHcVBMci8v?=
 =?utf-8?B?OFJ4VjFVV3poL3hEZnFrd1JjNlUzV2pUWGV1TDNLREdWUHIrN2ZMajQ0U0Qr?=
 =?utf-8?Q?sARkbmLx3YH3zOIRUmvGBa8+qDXADtCAriA7Yb8QWhT49?=
X-MS-Exchange-AntiSpam-MessageData-1: brRjXzR8lcytZg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b80423cc-1e5c-4d90-2651-08dea6c88535
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:55:29.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmyNvJG9ctX7w0jVh1s9Kkjc2l5W/OWt+e+7MRMdMcDe7wThh1MAaoY5NWU8dNHa5FBxUqY0VxOgPvPxjMdhAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-Rspamd-Queue-Id: C93094A456C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12955-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[nvidia.com:server fail,Nvidia.com:server fail,sea.lore.kernel.org:server fail];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]

buf_printf() uses a fixed-size stack buffer. vsnprintf() returns the
number of bytes that *would* have been written to that buffer, which can
be larger than the size of said buffer if the formatted string is too
long.

The problem is that whenever this happens buf_printf() currently passes
this length, unchecked, to buf_write(), which silently reads past the
stack buffer and copies invalid data into the output buffer.

Fix this by detecting vsnprintf() failures and truncations before
appending to the output buffer, and report a fatal error instead of
producing corrupt symbol names.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 scripts/mod/modpost.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc1394..16f6bc20b058 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1689,8 +1689,17 @@ void __attribute__((format(printf, 2, 3))) buf_printf(struct buffer *buf,
 
 	va_start(ap, fmt);
 	len = vsnprintf(tmp, SZ, fmt, ap);
-	buf_write(buf, tmp, len);
 	va_end(ap);
+
+	if (len < 0) {
+		perror("vsnprintf failed");
+		exit(1);
+	}
+	if (len >= SZ)
+		fatal("buf_printf output was truncated: %d bytes needed, %d available\n",
+		      len + 1, SZ);
+
+	buf_write(buf, tmp, len);
 }
 
 void buf_write(struct buffer *buf, const char *s, int len)

-- 
2.54.0


