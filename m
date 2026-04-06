Return-Path: <linux-kbuild+bounces-12697-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N/BXFh8G1GnUpwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12697-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 21:14:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F93A68C2
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 21:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34BE4300B44A
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 19:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D7139478A;
	Mon,  6 Apr 2026 19:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d67YKGul"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazhn15010016.outbound.protection.outlook.com [52.102.133.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDAF3264DC;
	Mon,  6 Apr 2026 19:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.133.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502462; cv=fail; b=FICvGaGPNvDYUiLhV48AZuB3t38xyJ2sWO03P9IOrSdWeFlHSSxkZgjpHhNJNB3ymUVeyPzMrbUbLeixnpcUwDE1UMLZxh7q3p7kVbUNud0KLh6/Q95gD+sCEFy7/91E2yuvPn8q5PYYM2SqqVC8vOXAv5EUZTWG3QKo5/OmVK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502462; c=relaxed/simple;
	bh=n+WQOBBqaOthesyFGhqRo5vXCJgIgcS9eNzy56EC3RQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Edzux1a7/Uvpk6qUzlFY8uR5O6n5hGuHCsiQdHaayJuvsOYHcWWcI6Mc/Ty/dub09nOu3hqosXHhXnhz1OYdNYalwKDRJDTGEFLPChBYQaULmM0vBurDAwbVQZRZSnSCQyo1Gku5RkBddfNd4ELB02o6V/tju2vIQON4eRElN14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d67YKGul; arc=fail smtp.client-ip=52.102.133.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqp6upBX2//zCFoSnOUSeq38w+Uvb5wwpsWXV2JmzaczHjEfPRXM7fKkzobBGDoBRs8SNxQzFHKReIWPwQ2b5kxFBsLfELdvm/Ww2wiuGbkafA63j6BQIcF4ERaTiTljfPSldJP09mHMxAgboVqNdG3plg//kZrc9EfIqv2Vft1H+ULqQjfYA1OsuYq8+EJC37vlmYcfKv2QJfR550fqEa7qMILJOEgAAXx9RLgWCBw+kJNWvbNlfENVAnODgafaT/k/2h+a3nSFEWPbAP5rFoZzDlzbSNLYiRZX5/O8W3xyLVggFAE/TU/Az/KXXtq3otKj8PORFx+28cOfT6M0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cg1NIKkNKP6HRaOr5ZhaLAxepQ++fwiUmjbXuLNy7Is=;
 b=at0o1F0TbRRHDl9tsk2msAIs4hx5ogBE+en5TIcJir5toPObBnw2hQFNcK9ojbTqMzxozvN96ApwSS1kv2b06agjWCcAhKDWdWhM+YVsYlrV55T1Yviy84pp/+Y00S+nNyoU223q5lhMlcBYSFR3DNbA7Y0Td4iiaU5YheVx9q9GAS4lY4OABAbpc0t+KXyBLzd7ESSgiUfsKQN11dSpSESCt+fzGihNeD93jiqjGsPKxuWyRXUXctRmJR0qzPffM1rsX5CdqXP5GC4gJP5TtfZjUsAUp+RrTlPpDl0gn/M9+zknk0CLBd41Ek7sUPm70jQGpVANQcvqNO03lNC/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cg1NIKkNKP6HRaOr5ZhaLAxepQ++fwiUmjbXuLNy7Is=;
 b=d67YKGulT87ze7SVqbS2X/WsLdQRjieFq/wBilBpWJPPkZQXM2ryK5kY7qoflrEUX23AXXedwHXnGuFce05sdPdK2Lsyw1dmaxG3pjkw37kLA/YcEd1U3mxeKQBSpCWGdXylTIjdz23FkPyOscXJgdjSzAmypCT3xpUpAsv1ohLjnJDDbi6essUxX9YLunzcFJaILmiCopp5xTEvPjB+S5Rfy/6HeYK+jChrMHW7sAiBilQtCz4nS/VRmvM1TmLtVaLMpw9ssxinmgvTtMu4HYoniwKK8mId3l3K7bCyStPKlzZBUCW6umll4TT2EX+3rIgbWEHX/uhJfmzpQvhBjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ1PR12MB6291.namprd12.prod.outlook.com (2603:10b6:a03:456::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 19:07:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 19:07:35 +0000
Message-ID: <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
Date: Mon, 6 Apr 2026 12:07:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260405235309.418950-1-ojeda@kernel.org>
 <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
 <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0067.namprd07.prod.outlook.com
 (2603:10b6:a03:60::44) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ1PR12MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a71bce-f023-4e71-28ba-08de940fc346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFlJS3c2OHdMQlNjc2NHbnhMY2xNMW01YXlQT2w1ZGdCUFJReGF6dlpxSVZI?=
 =?utf-8?B?ZmRGZnppTHVXRGlaUUVaRkxrNFVmelFQUmtZZzVLckYwbVovaXliODRoSzEw?=
 =?utf-8?B?NmljY1dqN0xPSC9iU0xCb1Z1NlFwZXpsZlI1WWtsSmJpeEFweWU0VnlmbmFo?=
 =?utf-8?B?eXJRYXQwSWMxMmdERGNBQUJrWEwzTWhvQzVwUnByODlJaitHdDlEc1RUcDhp?=
 =?utf-8?B?bFNGWWkwemloMUs1Mkk3cGtxUlU1ZzJHNWxOSmxkR29ISUh2dzlNMVJxUXNK?=
 =?utf-8?B?dHF0UitwZmZrTXFuZVRKT0dzWm5rRmRobk5USUo2Nm00V0U3SWhrR2d2NXZW?=
 =?utf-8?B?anEveHU2SHhNaUZPMko2T0RwYTNzdVRJL1AxTzdJT3hpc21yTWFiUnZxT0FR?=
 =?utf-8?B?Y2dSZk1CWVUyYnEzbll4c1hDS2gzZWxUSll0cUhncnhuVVdnY24xdEFPUzRQ?=
 =?utf-8?B?dDVTN0FXK1NIZG02anJoaE54dzdJN2lQaXh0YytuS2hsVFpMejBYclB3WVNP?=
 =?utf-8?B?OTNJbTdyOS9xcjk1bWxxNXY3MnowOE15ZWhHdi85c1VDQ3JETkxkWUZzajcv?=
 =?utf-8?B?UWg3aERyeFNHbXFPNmEwc1JKSUpqZUsxR0ZsVmhJY0lUdFFiUWtqQ2NlanZY?=
 =?utf-8?B?Zng2VmNJNFl3RDhSNS9LanV6a0c0Z3hkaXVNWko1bHd3MlRmNXEvQ2UzQWlU?=
 =?utf-8?B?NXIxaUozWHBIamhRK0tDUytTT0g3TWM0blQvV25iUHlOS2RJdzZORkdmZHRF?=
 =?utf-8?B?L2RFZUREdmhPTEgrbzZHZTdIaDFSNGoxcUNnTnFrYktlK3dpUzlPdFhHVC9q?=
 =?utf-8?B?dGxHcjUvcUhWWG5nWGVNcmpuYTluWEY3akhWRHlvOWdLYitxY2gxRVMwMDJS?=
 =?utf-8?B?SkgveGwxYTJDWFk0NFU1bUowMjFxb3hrQVdxL2RFekJBR3ViN29oUHlNdnpm?=
 =?utf-8?B?RWkvSHdVWCtuVWhrbHRYd1JkMDkxM0pRWVNnSFQ5eEJMT1RDRlJ1NGg1bTJR?=
 =?utf-8?B?c0ZvcE5heFZmK2FsRHRCRUxBMG5aUUtVa3dCQWN2VG9xYWtiUzFRdUYvMjBq?=
 =?utf-8?B?bEczK1hiYVI1UVVLeitZVy9VdXo2MllpWUNNQjRISWJIK1NyTEJRNmc1SnBv?=
 =?utf-8?B?cWQwMTUybU5QR1paaUNZK3lzanI4bVdoOC9BYmNWRFZ1MFRqV3VVUFdWcEZJ?=
 =?utf-8?B?eTkzYnBqQlYrWXNuRVdBdW5lWlBzMkxCRmN1eXphWDB2OWRJRkViYWtPTmdw?=
 =?utf-8?B?NndqYVVWT1prOFB5UGhCc01MRmkrRGF4U0d4eG1rRjJxTkQ1U2ptZDAxZE1a?=
 =?utf-8?B?RHJvR2xzRUlPSzdZR2ZNczJtdmVpMjU2T2FXQmlNSzEvYjlWc2dESkFPS01r?=
 =?utf-8?B?QlgvWEtQWWdVN241OTZFZGM2Y2Z6TWpMbkNyM0pzSE5nSmczb1EySm4zZDhx?=
 =?utf-8?B?ZEdLNjVURkgySlUwcy9CakxkZGQ3Rm5XNXJKMGZsV2VmTnhUUmVSSXVZOXNy?=
 =?utf-8?B?bElZb3dDT2s2ejltM2hyNWw3OUdUZlNrSzlVaFFFUGdEY0VvWjZxMFV0RmFJ?=
 =?utf-8?B?dkxWNUNJS29ySFpPcC9wc3NkYnZpdUlsZmtDMmE4U0pkb3NpS0sxVG90dlc4?=
 =?utf-8?B?SHR2SStHcUJlRzJqYmdFQVZOV21XOWJvZWFtcUszQ0JnK3JUS2U5b2srMlhT?=
 =?utf-8?B?TCtEQTVNd0szbUpKN3o0WW1GUVlsY09VV2Z6RVhMa0Mxbjk2NlQvU20zZ1Jt?=
 =?utf-8?B?WTRLNUx0aE50Q08xN3JCZDN2S3VBc2xEeFc2RlB6SGEwT0E2ais1NDBIV3M1?=
 =?utf-8?Q?W5irxu9q4Mx/7zzirdmwk5FzhJUf6UETsxpH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzhTTUxPZlRBMkdIK3ZXbTR3a0Nnb0kzVEYwR1dzYUJNQ1MwSWhQdjF5cFpn?=
 =?utf-8?B?S1N3UlEwcmo5RXhXbTVveDFNeU1VRENhcDE4WjlGN3g1RTVyRGVmK0NPZEVQ?=
 =?utf-8?B?dXFUV2FlcW9ZcTBnOW5ZNTFVK1Vsc0lZMFRnOURxekRYMkF3VXRtZmlQQTYx?=
 =?utf-8?B?aVZnang2a3hkZUpLVTBTRFlsd0xpWnQ5THppNGQ2YXF2Vm9XdG1tVHNvbUdh?=
 =?utf-8?B?NXhxZHhTTDRVd1ZVdWZ3TENZQzZJcFB0MkxqZUpsenNZSGs1U2xOdVo2SXRI?=
 =?utf-8?B?bEtVZjFoSDlKbUoydHNlYmR6WWJRTE5udWZId1ZKTjlVNkNCK0duTHpYOTMy?=
 =?utf-8?B?TFZHWmdZTnFiQUFtNVZYK09ycGxtTG5uSkpQbCtuSGcyWUhBMTRrdXZQcWIw?=
 =?utf-8?B?aThpOUxnQlZwUlNvS3d2Zm9LNmRaay9rNW5GZmZ3T3RoUTdLMEJQeUk5aXFF?=
 =?utf-8?B?eXFGdHYxU2o4K1E5N0RrM1Jqc210UE1sRENEdFFwL3Uwc1BKL0VVM01yVjVP?=
 =?utf-8?B?RFBtZlM0R0JlekxDcEgzcStCMnZWbmNIYkxyc1FUckF5V1JwbnU5L09rUm9n?=
 =?utf-8?B?cUdTM2dvSjVOaDVpZ1ZGZWpDY056eDNGUmN1T2E5WDJjaXJGNzNzdWwweFpE?=
 =?utf-8?B?N08rNWw3TGsyT3liVG1kUlBDd0diOHYyZ01TUFNNT0ZIVnpvV0hWTDdiOVM0?=
 =?utf-8?B?WFM2cDl6RVpobU1CeHBxY2RaZWhzVGR0RE40T3c4bm9YVlJvUlRnUzJMNGpN?=
 =?utf-8?B?dDlqTHJ6bTQ3ZFNGM2RMbW8yU1Z3bEZGSituMm9rQXNSUTBoeEdlMjFTWXZj?=
 =?utf-8?B?UWFacjQ3RCtFOWpxcERmUnozUEFYenVJcjdQUWxwRDJKRncyckZ2UTlKb1VD?=
 =?utf-8?B?QzBPSTVNdDJOK2o4aVZWTzloTXErb1hqcGpHbmpIQjNocGhRZlhHYVRtNis3?=
 =?utf-8?B?QnNZclJOQmhKcEtEbHkzdkVNUVYyc0J3VWlIS1FjOG15VzNuUkNCSFRDbmRw?=
 =?utf-8?B?aVpzalFTUjdXOWFKK0Q1MC90MEx4Z0t2SENWMWhURGErTkl1bVVmcHdNK255?=
 =?utf-8?B?ekcySXFwbTdBVitjWlphOEFsMFEwTWxxRU5KOTY0RDR3eGpGRXVNaHRWNDBU?=
 =?utf-8?B?K0Y0cGZLWEVzZU5TSWtldXZINkZ0NmZFSTZqQTJvbUVDVTM0cWN2dzMydjRu?=
 =?utf-8?B?c3VlUDNzK2tzLytqUytFVktWSHVDWHkwRUlvcEhjL1h1L05lYUduWWZLNTFU?=
 =?utf-8?B?azVaTU45RTJodEVJRmFFN3gzSUFyTzRrMFF5MEJiMUxxdStaL1NIWkpFQ0FD?=
 =?utf-8?B?TjU4NXBPNWZqVmRTb0kzNFBoOHQ2TTRkUE9hQmxQc2pvY0wrcDVNNlVETHpR?=
 =?utf-8?B?NGROYndJK0NUY3NRWnlLRzdqZXdnRWQvWVY1Rktta0FXWlhHTXp2UlVhQUxC?=
 =?utf-8?B?VTlSVnp6UkxlZjFhV3NqenRCNGpKaTZodkg2am1RNTlBK1A0VldEOENLYWts?=
 =?utf-8?B?eEZyMmJyRG5xTVU1MFdXODgyeGY1bWNVVkhxc00xSFdPdmRjOHQrMzVyaWNa?=
 =?utf-8?B?L0NYaFhodGFqZXE5T2lubEs5cmJ0M1N0Q2I3QW9OVnh3N1hXTjVpdkU3RSt3?=
 =?utf-8?B?and5bFFGUGtsMzAxb3BtZ0hiSjVBOVZndytlRkE0SWE2eG1UZm5lNEpObDdO?=
 =?utf-8?B?ZWZKZ0JRSmdwR0hhL1NkMDVxWFZuZkJRT0VDYlNvcmtJWS92eEVnMWlqUmRl?=
 =?utf-8?B?NjE5VjVGZmJCbHE5OE9UdG5Vakl1bzZ3NzdyOVlIREpBMFlhTis5dU1SZzZ6?=
 =?utf-8?B?MjF0TTE4ZUxUN0F2cVhodEFweTQrR3MxSURtME1odzZWL2VML29KRTJoTFdJ?=
 =?utf-8?B?N2JhdHRZM1hTMDhEcStmTTFjUks0dVZFVlVWTGFudnd3U0dRR2NJb0pEbURX?=
 =?utf-8?B?aVh2SDZOSUhVb2pqSWNSNndaaU4xM0xQMnZabUVQUkQzeVFKWm9OTGFsRHFD?=
 =?utf-8?B?M3A5L0hmQW03SjlhbjlDcUxNUXZQZFlwcG9naURxZ1BoN280TUptdGh0ZkJ4?=
 =?utf-8?B?bHNKd1BkV1NKQzFXM1VwM240eEJpVTZOcHZ3ZUEwL2lEdVIwcHYrYXR3YXUy?=
 =?utf-8?B?L21xN245anBRRWJmQ2E4RS9qRnZIYzdiMDlvMUxBNWtzL1FOSU5wN1FiTkpV?=
 =?utf-8?B?cFhSS3FhbmJjejIrUExEb1kyWDNZazFhOWZQcks5R1NDR0hWS0xrTmlxS1VX?=
 =?utf-8?B?UFZQOWY1QTJLOW1YQ0N4QVBtdXdrQ3RvL2Z6U0N3RG8ya1RSdnhrQjZZaXBL?=
 =?utf-8?B?OVFjYVlKcHJOejhKSUYwaXcyMFdsNnM0djFDRkQ0aUgrM3pVdCtIT0VqRDNH?=
 =?utf-8?Q?XpTuRoTqG5MTTtvF+BrCZafTreg9+PJ6x5QaeAgKGhhLY?=
X-MS-Exchange-AntiSpam-MessageData-1:
	3gFyzzHb9o/A+pTLUaQ50bc3K8Ru9SQVuMpbOL5FMFL+5rjc3+SbavrHkuPbL9a8NSl3k6TtHSV683H+6cnXgsrISv5P3+kfdLk=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a71bce-f023-4e71-28ba-08de940fc346
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 19:07:35.6314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57PtZqWpu68ohPoxp2oY8nU4q4sbLKScJGLKONgmVyOp/8KOGqyy7BZugD43u7ukIjp4mCdXetiRj7tbnCbcnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6291
X-Spamd-Result: default: False [13.84 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	MICROSOFT_SPAM(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[Nvidia.com:s=selector2];
	TAGGED_FROM(0.00)[bounces-12697-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	DMARC_POLICY_ALLOW(0.00)[nvidia.com,reject];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rust-lang.github.io:url,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: 6F8F93A68C2
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On 4/6/26 12:01 PM, Miguel Ojeda wrote:
> On Mon, Apr 6, 2026 at 8:51 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> Looks good from the perspective of this patchset. I am seeing
>> one remaining problem that we previously came up with a fix for,
>> so I expect that that fix is staged in another branch. But in
>> case it's not, here is the report:
>>
>> On today's rust-next, using rustc 1.85.0, at commit 232e79c72f57
>> ("rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0"):
>>
>>   CLIPPY [M] drivers/gpu/drm/nova/nova.o
>> warning: consider removing unnecessary double parentheses
>>     --> rust/doctests_kernel_generated.rs:4240:14
>>      |
>> 4240 |     pr_info!("The policy details are: {:?}\n", (policy.cpu(), policy.cur()));
>>      |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>      |
>>      = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#double_parens
>>      = note: `-W clippy::double-parens` implied by `-W clippy::all`
>>      = help: to override `-W clippy::all` add `#[allow(clippy::double_parens)]`
>>
>> warning: 1 warning emitted
> 
> That is already fixed and in mainline: 487f9b3dc6e5 ("rust: cpufreq:
> suppress clippy::double_parens in Policy doctest").
> 

That's what I thought I recalled, too. Weird that it is not in rust-next
already, though.


thanks,
-- 
John Hubbard


