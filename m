Return-Path: <linux-kbuild+bounces-12526-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHYpEZQuzWn7aQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12526-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:41:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D042437C50F
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44B7B306207C
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 14:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A806344B675;
	Wed,  1 Apr 2026 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mNgvTMtu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022137.outbound.protection.outlook.com [52.101.101.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4004B39DBCB;
	Wed,  1 Apr 2026 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054293; cv=fail; b=mm4ePqOBAJCffkTlhzN8sZKbsTsXMVueFB/mTVLvDI5wuTqcOvydfyOVSUeHjUHL2tAeO50M5dTR7RkgLdIVxbEcyxmDiKs9cKvP3ntQkf/7uToR+mA/7puyIIw/tsQOI3vNp3gqYVqeeboOkIzF8ha02H6Y6DM4YXJbWsfUIPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054293; c=relaxed/simple;
	bh=RAUsNA2w9AFIkdBMyDbo1SCXfIoUpikL1dLfBqTSlzo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=DPEC+uyWZ7PFEZ0sIWoUald2mgAvl3/CQHKQyTEBPhVxGneCFvRwwUhN1D00FqUAI9VTrFsHzo8+AQOda+YFQLNL3cOdHXec1x/Gtnu+TArMl2in4Xt200Yc8oBtuB2+S/Vk8F4epYNduVJI4rnQKM1KewQCXQjXUwYzCwHTKUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mNgvTMtu; arc=fail smtp.client-ip=52.101.101.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVp3XJ2odzN33Tw987mi5KtbkPzd+VCRL32txyye27urJmld24ZSNpml32eU908HK6n3vHnM2jiuCK1Gypy3ScY/xnRXu8SK62idecUcCxUk6Gj3qgOcF1sV8az+rA8cn1eHPI+F2ExK8E5dq4hkGvuoghgOn6Eg2aEkJmmzEM5IOBsSDYVVBlfOcV9SBgKlmfyIE42HrEZCnOJPMciGtlwpHkezKngnnpuSQ300sFSyEbmrvT/udk4T+B2t51D+eN+0psZi6zfpmLlPKaBELLmHoJErXiXbBhZ0W30JjiQ2UxLDTH45hEBPIDUpJOCGNXUDytk2ab14zkCRPg7LzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwBEH9xXKxxOTPSZvCZdTjITmBARhR6PPm0yx9b1YSY=;
 b=YxbXQwSEd5mckOA+/xteQ1kJIthG3PjmEQuok+sWZ1WGsi8zBjAjp3CR02BMPa5oGvLTlflD6oq0J/OiMYrbkQlCQ2mCzbn4SpRS9Oxz/eaSzNdLk/lRLF/XaLNoGwnR+0rb9Zox4D7xc4BOnhMUFXjGLdVKRu3FspfxTYMKwx8ul4SJMCeNgwcAmazaiZcuM31VkDX+v0h4ThPR98VGLZWUaeCklqrwl2hJRyduoLul88kjukYUHk/gO9Xr9RYNC1OQpqNPWVoGJ5Xe6FkmTeDzxGMXDmihZJzkbIaCoziHaBdVhoUBHtQkr/4W/8a79QpJFYzGHtxXE7CATpce4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwBEH9xXKxxOTPSZvCZdTjITmBARhR6PPm0yx9b1YSY=;
 b=mNgvTMtu3IfqeNu6WwTyGRRF8lEA7Q2Rg6ncRJvMdK1xSU/MzVpB6sWyDyI/M/bwPTEZdA+V3QWWYeFrPSy1567MD5HPCSu1SCbW5Wc+PODnyFc9RNNTJifgDon7KIzGVKSP/VOCDtmFS8In+73cK6TERkLy9B6cno6Cl+ggwC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8656.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 14:38:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 14:38:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 15:38:07 +0100
Message-Id: <DHHW8AH3TFZS.1SKSFBF7DN7UU@garyguo.net>
Subject: Re: [PATCH 14/33] rust: bump `bindgen` minimum supported version to
 0.71.1 (Debian Trixie)
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-15-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-15-ojeda@kernel.org>
X-ClientProxiedBy: LO3P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8656:EE_
X-MS-Office365-Filtering-Correlation-Id: 073c5dfc-09f1-4329-8d76-08de8ffc4b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|56012099003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I2Gbz2lFcHjVemNYXxm8er/wFIEisuPh4w1IIWfsnbZJabahITMY7dC2j0qUoy8X302tEbN2khHdKbW+VOZ1TNAVAQ/h/ijYAC1JJ+QIH0UV01+EjcvsFhyMXjjGm4U6F+Gr9eFCDBzykWB4hDub9qXkn/7V4byA0rtaQGGtFTZmpR51Xm3ovH+2c9hMaE8UbUV6aOOMChEwsvmYYD24kW8l6K0nAiZdIhxFUXWhYZ6v54WJJhnefvCGO8gr1jhwiDC8xEoTNlFfUz0R6pPdJxOv5qmA9VjdHK9yKy7yrcqyHnYXNZn4SYMEhjo3yOVLCZeOZUP/lYoCSf52BOs9dcELu4vS57z4/PWKkhIg1dGGNfkryzOvZfGxiGg2BxwyeWlzCnXY1i0pmbjk4nwND3WIJZuJERjT6xNoP/MDSgkoRqFQ+LSXn0e5u9jDlxg5WBxvqBLB9q3f7YmMuwB14JRgZ4ImttzIni5z4ObuXX2F+/rQyN1qTxHIOtWixDiD00FYfkoSyEmXvzwxHivBeayWWfs1YDlsR6Ngz9wcI4Tx/l8vS03un9cGh3BZPNKjieY0pqgEkKPPkckgSAvvFjNgdDotfXgWkVEZM8Ylt6wS/BISlDpKo8HIDg9jQdJ9OIYL/GYgirX+trjm1kiUn/3/l44677VKLfk/DQEOefT7td6Z+jMyFQcV7uA7BObJ8x+LxJ3GYh9upGkrgjoFLbO/r+4fYLa6LseVmJ1L+wg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(56012099003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emFRb1JxTzZLNHhtaEcweUc5bU44bElxNlFVQ2dHdUlDWHI5YU1HcWY3a0ZX?=
 =?utf-8?B?Z3lYWk5tRk9YenZwMWVJMjJGaUJIbnNiYzFtRUw0N2VzRVo4bSs0MXBKalNo?=
 =?utf-8?B?TFVxR0JVaGNXQXJMSENpMzlwUmU5T3hKNEdSdGFYWTlZZTUwTjRNcVlqR3cw?=
 =?utf-8?B?bGU3YnFuR0orUWFRRUFkdDNuVjluOSs0U3FVK2RMYXYxRGNBdTlzZTVUbVhx?=
 =?utf-8?B?SWdUdGhTclp3YXZFVGU2QXczNFpOcGpqaEpUTjUrYzZqVEpGREZtQXpaeU9p?=
 =?utf-8?B?QUxiUk5CUlltMjRBaEhneVRCR0src0FickNkWUg4dWZRekdlNGNnN2ZUdDBl?=
 =?utf-8?B?Z1hYR2RvQjg4OEdCTzlnMFRudE5ERjBQVWd1bnRLS3h4anNydWtNV0FDTTds?=
 =?utf-8?B?NEh1TjhueEJsVWtnaUZtQmZGeGpyVWZXTmZHNWEzdjdCY0Y2bTNBdVVPVjhM?=
 =?utf-8?B?L3Z5U082dlEySVE3N0hVd2VBTkp5bHFrR0w3b3B3c2VERjBoaWo5dy8yTnFt?=
 =?utf-8?B?RUxVYm84S1M1VTlTR1dCaDZaSWloeWJINU52c2h2UTBrL0p6RDBNaDRDUDMx?=
 =?utf-8?B?aHNhcWx5aUVjdERGd0VQendjNGNTV1FVVHl3VFRNL01HUm1LVHB0TndwV0Rs?=
 =?utf-8?B?Y3ptSThNaUZER2ZvYWFMNEpCQ0U2M3lzdnU1NE5tNG0vVm1QRlJaNVVOdTI0?=
 =?utf-8?B?V2NjZS96TjBNUFBEbWtFSUtmMDlaYi83MUdXeGVlMFdnbDgwK3RBMXdXL3NB?=
 =?utf-8?B?QUxTdjBIdUJEZ050MHl5b290Um5qc21QMDgwTUN5bG9JVWVvbWxoclNwbDBI?=
 =?utf-8?B?c2tsL1h5TzZaeElZQ3hCVnNpWXpRN1JTb3Q4UVZNMEhjZjBNYTJuN01LZEhs?=
 =?utf-8?B?b0tQRHVUSmVYeHZ0RDh3VXJzYXFFOVgyZ29mMEQvOXBiMFBISUprQzM4KzlQ?=
 =?utf-8?B?TzJlVHFldVZXNEVHZ2RRYnBsTmpzNjhFY3ptb3Q0UjFWNEJmaTQyaElPODdV?=
 =?utf-8?B?NFM0aFBKVmFyRWtONFl3Skx5aG5hOWdDTUdYcldhQ0VldHlVU3VvY2lmQnRs?=
 =?utf-8?B?cmN6aHp6QzczR3NHdFRteFkra2VKNHFMLytwWVd0aGtOM0FFQ0tSV1ViV3E2?=
 =?utf-8?B?RGc4WlBieklGV0RlVTZMRWpHYk1wbG1NTDRMbEhTK0RrbUtxRVB3SkZjUjNp?=
 =?utf-8?B?YkJ6MjBKcjVWeldsL001dlI0R2ZwZ3BSN2ZkeFo5QUVjTVozWHJBRUJZc1dL?=
 =?utf-8?B?OFZ0OUtoT0duLzE5OFIzcjJnbS96N0h0dW1kNUxrQiszQXNvcXBleXBCTzZJ?=
 =?utf-8?B?U3RkZk5TcHJTQ09oZXpHMjZ6c0F3ckNWSXd1OTFjdkpweDdTRjZwQUlRbDVn?=
 =?utf-8?B?VWpkVTN2QTR2dE9yakRDQkVhcTU1VmZNMmlqRVhRbExUTVJMU1l0My9Lci8v?=
 =?utf-8?B?cVkvTUhkQmlSSEF6dllDdlUxSDc3L1hqallTbHp2R2s5VU5aOUJmMXNOdU5V?=
 =?utf-8?B?MkNQbkhuZnVUaHpVYXNuNWdQRVFISklTalE5SldEUkhrRU1jVU1xbnlCT25Z?=
 =?utf-8?B?U1VDZEpRVEtDRlZ3dXB2aElUL3JvajBtZzdzL0FKQWRsNGpUeHZBYS9CalhC?=
 =?utf-8?B?OXdZTVVaTjZuam5aMDgrM2M2aXhTQzU1MzFER2x4R3MwL3NlbzJRemw1di80?=
 =?utf-8?B?aGtZTlBLbmE1NG1YRyt3bEFORW53dGtIUm9vRU9NNHFwWUdvby9iNTNWa1Fl?=
 =?utf-8?B?RVNDazUzSjgxTHk1Sjh1VHc0Y1dpdDJKbkoxRXY4Wi94WnkyTkoyWlZlUnpL?=
 =?utf-8?B?N0J4bEIxRWRxelVsck5KQTNnS1plWStWMHd4cVVPK0RpMC9mbm1WaE5VUCtT?=
 =?utf-8?B?WjlkWkhlcDFyK1Z0Y0o3d3YyMmFDTE0wdzN3UGRYSTBjbGlldzZpanhLQllj?=
 =?utf-8?B?bHorcFEvUEZINStZb0FOeGVtUXp0Um1lM29KbE5Nd2ZEdnlydjNKODNuOHlQ?=
 =?utf-8?B?TFNpZ2FsOEpmSmEvWHNDa05KYkNoNkFTMEZncUh5ZG5jYVNjRTZucjNESTU4?=
 =?utf-8?B?c25ZbFRmWm1jVjAwUm4wQjdRRy9oVms4NkdQeitkRU5JOTJXa3ZxNWZneFlF?=
 =?utf-8?B?eEF5OU9pdDE1d3Y3cjVUem5HZEhYN1ZJa1Z0TTNvMXhPM2Evb1gvMy95R1hN?=
 =?utf-8?B?QUhhUWhCcDFkUGJRd3I1QXdXczJKcVNkVmNvTFhkNDhKNWFZaHkzaXd3eHJU?=
 =?utf-8?B?YzdhMlNqTjBobjlNRUpGWGQzOVRjMVZ3bkVudnlLZTNpYkhaeE5QczhqcXVQ?=
 =?utf-8?B?NkljdFRaNnFOMTBBNzFQNlJIc0hGMm5zdDMzVmdjTlVPZkEvNE1Edz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 073c5dfc-09f1-4329-8d76-08de8ffc4b2a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:38:08.9637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dDp/jjDkF/i5e3fLYozTq9BpYHx5oxeVjDTah023yPJUkLMEifNgNuWjLMvstQswK4fnXaBVMn3zkSuI0BiwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8656
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12526-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,launchpad.net:url,lwn.net:url]
X-Rspamd-Queue-Id: D042437C50F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's `bindgen` versions as our minimum
> supported version.
>=20
> Debian Trixie was released with `bindgen` 0.71.1, which it still uses
> to this day [2].
>=20
> Debian Trixie's release happened on 2025-08-09 [3], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
>=20
> Thus bump the minimum to the new version.
>=20
> Then, in later commits, clean up most of the workarounds and other bits
> that this upgrade of the minimum allows us.
>=20
> Ubuntu 25.10 also has a recent enough `bindgen` [4] (even the already
> unsupported Ubuntu 25.04 had it), and they also provide versioned package=
s
> with `bindgen` 0.71.1 back to Ubuntu 24.04 LTS [5].
>=20
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://packages.debian.org/trixie/bindgen [2]
> Link: https://www.debian.org/releases/trixie/ [3]
> Link: https://packages.ubuntu.com/search?suite=3Dall&searchon=3Dnames&key=
words=3Dbindgen [4]
> Link: https://launchpad.net/ubuntu/+source/rust-bindgen-0.71 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  Documentation/process/changes.rst | 2 +-
>  scripts/min-tool-version.sh       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)


