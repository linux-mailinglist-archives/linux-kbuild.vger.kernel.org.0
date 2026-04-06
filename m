Return-Path: <linux-kbuild+bounces-12695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABBOOE0C1GkwpQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12695-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 20:58:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED533A671F
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 20:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFA303017C1F
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 18:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0041C394790;
	Mon,  6 Apr 2026 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f2/NW3KH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azhn15011001.outbound.protection.outlook.com [52.102.149.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388338F935;
	Mon,  6 Apr 2026 18:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.149.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775501497; cv=fail; b=IdFQKCigUykEn7xOD4CaUpFqjVfnS/xbUYpZuXXKmoPMUa0PbWvuHW3MBLBqK+/XFpjTjea6NSX/Dl4sw3UekyC28B/+I9LKThrxBLj/OAfQqaE7go6cZVtegIR5Iql81aw3EH6ionTuJ9z6cR83ND5psRVjNcuFExSnSSgJat8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775501497; c=relaxed/simple;
	bh=imBpHQMtBcXNoTaThVIqBMcBFYux2WdkJLapvNs6mw4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WhDHlHyn5txZfjK+Sy5d4h1IDCkCt8/d+nrlpJKzJJXyWJxHIdnmYbfnSTogFr8L1vo0l1gHC7DLrMH6uYsgDoVdiEj7upA8cCcS1H2GmgH2lvQcoQXgOnLX0SYXxBP9Ig5a3QeNJHwPKOWkPzK0xdAYw3S9a9LehI/JhKDHbzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f2/NW3KH; arc=fail smtp.client-ip=52.102.149.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYGdLQqiQuNIfZ6C+MA1mK9/bAuPyXa+czF75ITenP2cjPOeJC4cJCbAS2lDJ569TvYvz4gIh8bC1CklL9WEDWhJvLJWF2OtCBZDYYPctE02d5xYETHLgVDDt7t9x6fTprYGwfDui0dBcyXLQMzlMhAIeTaWMZBpmtzx4h/3sqIt4Hpu8qtrldkVjegzLxUhz/PYCmsBRivlWpJD7hJ5xgcB5eE3ykoJ7SUx5h1hIaeCa+gPdnk0DXIbQabktMU7RICbU9yn7srCB8vm4DJuC5QztLRRn+JR52LOW6qnJTDrO3c4eTZmbjzb4/sQRGvrcTK+WlBmLbwyYweneVfvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQ/oaZt7Gi7V155VQhElkkkn90FH0pDYVl3Oy0+y6FE=;
 b=oe84d6U7DN6xzg3CkVHPg8+S0qRQ4sDENdKZgrYMUJB4pnKOP8OGdEtZTNlrHiOpdU9MdgdYCYpmrhIvogRFzA29tLkeGFkJyZ5qVCckp9uc9d6og01svWDWwFmQAmqEc5U9xTdyQYj0CzSGBuozV5IaHurTklFh+GZ6rqJxR1BRJZL5P9TDNxFffAf0BaDjW8ayAH34TDgct79MUk+/14w/dzLGATTiqlqSV0axzku/8qa0Eo20plSSTyem2pRfeBCXr7mFJDSHqi+OqkEIv13ToJFGrFwm2B+d8tFasS1LD37eWgXkK0O8+6uI4ZbbGFCKxarkEswksafIW2oFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ/oaZt7Gi7V155VQhElkkkn90FH0pDYVl3Oy0+y6FE=;
 b=f2/NW3KHpq9sCiH4sV15+h0t8USTzSP6adMLNKKMe7qIYaka5lbwkeNMWvcAjFosccR0JGoht/6H4CEXpFIrpffqTNBrmqyw/kFbOK0LfwbXp6WppfTYOw0bRQ1Z3DGmC7j1m+mvycCAwK0AhvcL4d9AAqSHl3ijrkrNyZ/frfu0ZN9qIzZtx9DE8hC8AW+bhDvkAKmNYRZMHbB34AsGsCzNAPXNfYy5+odq7N34o3nDaF5Gy9gG5yllZOqSpUdCqRBkYWGk1ol/ZbjZnVi7QM8bd4ZcCqo4oNwuvf10yCx9/uxDkvLs+m0Jip8dmNjCYmDZTuRCCCHR8Aih+TLsCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5686.namprd12.prod.outlook.com (2603:10b6:510:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 18:51:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Mon, 6 Apr 2026
 18:51:31 +0000
Message-ID: <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
Date: Mon, 6 Apr 2026 11:51:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg
 <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
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
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: aafe8544-3530-40d5-8fc4-08de940d8452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTBaR1JkYndvemRSbjBoTEx5UzVwWjB1SmFYNVg5TG5hb0pITFFhSThDbHhq?=
 =?utf-8?B?VXYvRUlKMTBOTlh0MjBVZFVoVTlUTU5JNWZwR3FlTldYK3NINWNHbVh0NDYy?=
 =?utf-8?B?allFTExLdnYrSmhVQ2dQTWpjZ2I4dFB0Tno1alpHTWNvTE9kb21sRysyNXdy?=
 =?utf-8?B?T0pYaURrb2FQN01zTWRwS1hHMTRuUHhtbllNZjBmczNqSnA4N0Y1N1FmR3pi?=
 =?utf-8?B?QS9PR3U2dExwU3RYZDFMb012ZG5qbERPQ1c0MlBKYnpLNEllYkhlQkJMcXBy?=
 =?utf-8?B?M3NhVkhhSStnajBvT3pqaThtS1pZNjRQdTFFblJhQUdKVWFGVVpyQzQ5QjBs?=
 =?utf-8?B?b2ZDQkJKdmVPQkV5UXkwSjl0NXpsMmp1M296UzE3NlBKN05UNEJ1dzNrWm9G?=
 =?utf-8?B?NXAzbHZjdTE0aFhIUE9oRXJKeDI4SzFCMlphNFhIc0JIWGhDeGtScUpFOWRy?=
 =?utf-8?B?RFVHU3lpcXM1d3I0QWdGVFFpTjcwN3U2b0YvV3RSV3dUOFU0N2lRN1Nmamxy?=
 =?utf-8?B?ckoraWc2R0VFLzUxQTZhdXdQVkxhQVBiL3Fmczg1RWxpZDFPVCtFYWtUYjBQ?=
 =?utf-8?B?MXhCeExtblcrZFJlOXpzQUREZDZMS0VpMHlwQU1MWUgzZGtWM0pHdU16VWhT?=
 =?utf-8?B?eE54enBVNDlzSVJsVnhTRkZtL2VnTVRIdFNHSFErOXFNWlQyRSsreGttMDFk?=
 =?utf-8?B?anZXVVFpSnl2RktLOXBLa2l5c2dueDlJNEFVL29NOUVFaEhobUNuMkxOYmxL?=
 =?utf-8?B?UldBR2M3YnhSZlV3WUFialpwaHhETE9pTUljd2xVMSt3UHJXbmI2ZmlYR0Va?=
 =?utf-8?B?d25ON1NwSFBQSGI5TXVPSzhDYzhPYi9sUzE3aUV2ZUt0UDFDbTZnL1h3UVU4?=
 =?utf-8?B?cW5xVHR2NERVQXJrdDBhUHZFZ3ZkNUU2ZWVOT0gvNjFYOUlOT0owRFVBY0VG?=
 =?utf-8?B?WWxqcURQTER0Wm5PSUYvcU9OVjdVeStLRWM3L0hEbDhiYUlHLy9uTmlGdzlq?=
 =?utf-8?B?WHdvMEE2c0NWUkdiSE8yTmNSdmN4WkxpNGYvRUo3THRhTFo2YTJCTU92b1p5?=
 =?utf-8?B?NHRnUWdQdk5RczV1aUgxZDNZbzVCTm4xaXZMaTNmWXkxNGlSM1haUktjWkRt?=
 =?utf-8?B?N3BqQkZWdCtLZm5nWVFBb0R4ZFFzaXhiRWo1YTU0cWVkZjYvTTN0TUh4SjBP?=
 =?utf-8?B?ZmpNdnVPUUlqMkR1MWFsN0R3Z05ZMWlxVVFrVUw2N3V0b1E3Qjh3MURaUVg2?=
 =?utf-8?B?eWZCcHpQVzZiSDlpR3JRTllES2ZFNW5sNDJtbXlCeDVSZkVLQ29pVkpkYlRy?=
 =?utf-8?B?UnVDQ1ZKd3pqYVZFWXlOK29rcVhvMndnTmV1djJFT3A3S1VSZkowVy9hTys0?=
 =?utf-8?B?ZUpMZjRNR1lYbEFWU0FUQ2cwZUdUWElLS3pNRkpRM3hPM3FEdi8zTGlIUVhv?=
 =?utf-8?B?ZWZMNVhnWFdTbkFqbndkelc2VmFITFluUmE4Sk95L0p6VFV2MllQN1FrQkJF?=
 =?utf-8?B?Q3lNRmhINkJZZXZSQmYzdGZjRTZVZjlUUzBaUXlHZXVtOXpOeU9EOWErcE5Q?=
 =?utf-8?B?dDVXOHI0eURmNDI2Mkg4TmFuSi9wQXpoL3EzUEF6cGZDSWZGMTB5N1AzUHZ2?=
 =?utf-8?B?WHVyUVVqd2lpSlZRd1hBTkFVUmpqeXlHQ3N5RXMwbTh4ZDJ0RlVqeityeDBZ?=
 =?utf-8?B?aWVTeGhCY21xQ2U0blpYWjBZeDZmZHhzUmFVeHlDZmtqNUIrdTNzUFBUamdE?=
 =?utf-8?B?QnBsVVBIRFRzVkYvS1hNRGVmWDdKNzZwYWdZNS9PNVdvTVNMT3BrMSttMDNW?=
 =?utf-8?Q?pN34Xuh8zcKh/75MNZgKY5oVlrZfjORQrOaCc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVA4aFJMQVZMWlRRaWduS3M5VUV1OFl4cWJkcFdYRU45VHpoTDMrR3RaZGdJ?=
 =?utf-8?B?NnZwU2xoZzUzeG9aZXJjNmd0a1R3VFJGZmxjQjdoa2FaM0pPVDJ6NlhGRU9S?=
 =?utf-8?B?WEJ3elZwVG1mNlBMaW5UOW1QZXYrODcrKzBUOHNIWGkyWTlkdjdoK1V5Wngr?=
 =?utf-8?B?WTc1d1RsRnRGUnBoOVl3eFF1aDY2U2NPSXNsMjBYUWt3dnd3NHJiaWw0VnI1?=
 =?utf-8?B?b0NYMDEvWTJ1SWZ2WlFXZnRQL2NuNWlhZnRLMjhhanIwcFVpUjRJcTdiZHpa?=
 =?utf-8?B?aXlZZGhvS0YvcjNhREhTdmVDL28zbzVTTURGZnQ4c3U0MVJFSmxHZ2dSajhD?=
 =?utf-8?B?cWczbDhQdXhiS3VFZEcwRlJ5cGhLQWhyTXNzVE05NXVsbmk0eG1CS3BIMTVQ?=
 =?utf-8?B?SUR1cFQyMGdzd1hpajlaa2hEdk9WNHJnZTlsV0pzNERMU0t2WHFMQ2k1b1BB?=
 =?utf-8?B?Mmh5dDZGeEtHNEVTbGkvNEVSSXBzdFc5UmdXOXN2RU1DVjBQbTBSc2pjZlNv?=
 =?utf-8?B?Q3BxU21EWGZibzF0NVNGa0NRcU5xMktKdzJOeW5jOGNDelF0VER1ajdENVFT?=
 =?utf-8?B?TVZicE94UWRwdTgwUWlxY2hFOVdyY2NYdTBMdis4OW1hQlZwRittbHplTmdO?=
 =?utf-8?B?K1UyQlFzUkRvZ3hQRzEwbCtKd1VPSTVSOXhTYUVyaE9GOFJldjZFWGZEcHJG?=
 =?utf-8?B?QmIrNXcxRmNxMzlzTTNibzloYW9Nck5tWDhhcitmUmxZL0JjRExoMVdqT2JO?=
 =?utf-8?B?SVdWSVFiMTZHT0FMRjFJNk5Ld1FXYW5YTFBMTGlkanV6amRlWjREMjZkcmJ2?=
 =?utf-8?B?VkJ6UWc4aGs4c2crbFppMU5ZVWh3a2RtWGk1YnJBbllDbURFeFU5bFR3Rk0x?=
 =?utf-8?B?QzNva3ZTT3VQc01ReEx1ZzlYcTRNT1FHbGVTclg5MDRvRm1TbXQ4N1BONUVJ?=
 =?utf-8?B?ZTVidUNOZ1hITXVKaDRqOWlkSWQ3ZU9VbVZkS2IrbnFHVkxYaVF3L05BUFQy?=
 =?utf-8?B?VnUvOEs0alFhWnZUaUFYRTNUNG02QWJUaE5sYWhJbzBtYUU3NGRBQk92TDFT?=
 =?utf-8?B?TFdBKzM3bFlDSVErWnJYZVMrNm1GSGRDd1kwWHp2eVNKUUx3Q1FrUjcvODBs?=
 =?utf-8?B?dkdrOGE2anl4S2w4YnlwcDREdk1ORC9CdTRGOEpYSGNlaFpMOUkyeWV0N043?=
 =?utf-8?B?Ymt5M1lMQWg1NE8rQ05qTWNKd1RWZ0tqNm5LUUs1dnhsSlVUWU5Wc1RXS1lC?=
 =?utf-8?B?Y21ablpRdzBHeTlJMjVnNXRQanE3MWo2RE00NG5iL0VuUkdvellvcjNtUVRx?=
 =?utf-8?B?TWpvZzVhK2tranFwR1lJdHg0U0Z3RmNjYXNqYjdMamR3ektxL3F4bzlZN3NI?=
 =?utf-8?B?cnUzWnVoRjNaQ1lRaDJCbTNPVllPdGNaR1BRWkhkOEw1L2d0dVd0VnlxRDhP?=
 =?utf-8?B?UWRpZ3VaTDZEMHNQWE9ZTDJKbDJkY0hNcHoxcHZFTTFWVVFYSzYvZDJYcE42?=
 =?utf-8?B?d0M1L0ZzY2tVSmtibnVqV010Z2lwSk40M3NJWFloU1JBS2k5UHV3OEx3dTlw?=
 =?utf-8?B?bnBoY0ZseFhSSVFuSzl2M3dEOUJiMzdLcHZSeWxxaE9STjRJY2xJU3VYQmtZ?=
 =?utf-8?B?TDBJR3N5MVJXUWVBZEpDZmpTNUVPYUIrdDFYZjl4SkRMWnpJSDRJR1NVZmRC?=
 =?utf-8?B?Qmo3T2VsSDhKRElqejJZL1pNalVEelVzajlQTHdJL2J0T0g4NUt2Zzhkclk5?=
 =?utf-8?B?VndaTkE3MGFJbWdOdzFJMUJqYXl3aExZd2VQM2lNQUlrKzVMek0xbDd6YkJa?=
 =?utf-8?B?RXJKd1dENE9vcnZtK3ozVmMrU2lMdytId3ZLSFBPanJ6V25Ddys5ckh2Mmoy?=
 =?utf-8?B?Vm9LVU4wemdISmw1eThyZ2ErSnR3UUhHZmFnSVB1enQwM0JxZm1ORTNlOTFO?=
 =?utf-8?B?MWNMZ3g0emJkdHdkanpuTXRTeFlNejk0a2VVTHRXdVNtT2pFK3lQTk9CbjZi?=
 =?utf-8?B?Y2hxbG1tclQzMEVhYmxYL0JTMjlsZmx6cmlwMmxOS082S2xlY3c1TnZnU240?=
 =?utf-8?B?ZlA5aFRFbDRCZ3NNT3FScWQxYW9hNE1MWEdRbWM5dSs3OU9WaThLMDFYM1kx?=
 =?utf-8?B?RTdCN1VNZUZHVmI4ejY0MTNIUVdEN2c1dGZ3aXAvUEI3SFBpbmc3bnhybWJR?=
 =?utf-8?B?UkNCYXltcFo0L3BCbWl6UEs5NHhIVDRoZnh5L0tQaGpaZE5wZjR1b0FQaWhH?=
 =?utf-8?B?Njc4bVhnaThScHN1YUFmUENtREtBeVZEMlVJNVpONHlCdC9wUEJYWEp5bDRW?=
 =?utf-8?B?NTN1YTFKN0dBWlhQWHdWb2JDRXFuRkFRSml6akJlZ1cwTjh4dDJBOUJMZlYx?=
 =?utf-8?Q?g+v8S9IWuWpntoX+VvXGwdXUVbG/s/vokeV/y7V4t17p9?=
X-MS-Exchange-AntiSpam-MessageData-1:
	d1STF56rUgx9SgLNxuDxTYMQEOPR46JCUH6QycBuFB1PewVpHoBC9QTxb6ALFf9P0/jWP8jp7JhrhZ5oyfy9ubSOACp4Qwr3Z+M=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafe8544-3530-40d5-8fc4-08de940d8452
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 18:51:31.0239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WWixsHyYnPDDB+wl7GBU6jSWzkwShE2sLNWroQ5v8kF54O0rtDTfWTm2Pz/Rv3my58ztRX+7piIRPJ0J9FF8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5686
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
	TAGGED_FROM(0.00)[bounces-12695-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,rust-lang.github.io:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8ED533A671F
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On 4/6/26 2:03 AM, Miguel Ojeda wrote:
> On Mon, Apr 6, 2026 at 1:53 AM Miguel Ojeda <ojeda@kernel.org> wrote:
... 
> Applied series to `rust-next` -- thanks everyone!
> 
> Let's see if we find any issue in -next.
> 

Looks good from the perspective of this patchset. I am seeing
one remaining problem that we previously came up with a fix for,
so I expect that that fix is staged in another branch. But in
case it's not, here is the report:

On today's rust-next, using rustc 1.85.0, at commit 232e79c72f57
("rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0"):

  CLIPPY [M] drivers/gpu/drm/nova/nova.o
warning: consider removing unnecessary double parentheses
    --> rust/doctests_kernel_generated.rs:4240:14
     |
4240 |     pr_info!("The policy details are: {:?}\n", (policy.cpu(), policy.cur()));
     |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
     = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#double_parens
     = note: `-W clippy::double-parens` implied by `-W clippy::all`
     = help: to override `-W clippy::all` add `#[allow(clippy::double_parens)]`

warning: 1 warning emitted



thanks,
-- 
John Hubbard


