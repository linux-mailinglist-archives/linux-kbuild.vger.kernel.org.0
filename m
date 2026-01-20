Return-Path: <linux-kbuild+bounces-10703-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 699F4D3C2EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 10:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 39ACC4C5F7B
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 08:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18703C1974;
	Tue, 20 Jan 2026 08:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MRkfPHq8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCDA3C00A0;
	Tue, 20 Jan 2026 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899277; cv=fail; b=PJwBfQMdXH37MiAKrnInOUkE8Y+KezjQSk45yFif8yQki5CTCOyoPbkiSmXjl6E1dYAC6egI3m+1LxnLMFRih10NLf0s8apAUmuSlxM7RZPgiScZyrjAYv+af4MzBBaMKwAGkOi+Mjrgz9VX2W3Bhd8jV7RR5beAmLFYo/Zuqzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899277; c=relaxed/simple;
	bh=IAOC74cf7Rje5+xL0CoJT3PlSieUlDMVjc1/LtW9vlw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NmC0rHb1pfD8I0KWVOj0OzHlP2Aqt/zIDHwNg9p7TMvl6zq2KoK33VrDHuCieZHsxQ/WF+JZ5tKMLMnuqQ6AGsV7RH/C/5a2BNhuUVi1ivPDN9WkB2/xiJBSJyfigC7aFYSKQl9POkfJ7aseNLOpa73Imhd8bQM3QlTzPMtD/R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MRkfPHq8; arc=fail smtp.client-ip=52.101.53.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3MnqIDHBO7/sRu3mt6C8gYcAu4wtNhEmCc1sG4EIv8B5W5nnK2IQSe7gqw1X13bM+1ff7Fu7EgwvoP6T0NSL76E8Usq4ZF1FLos2yAxRfWmMZOr9rKu2mAcROKKuYohOSXKPjRanuyU022k1SGZ3mI9EAXJaxHOZ2KZX9vT1bmtQNFbcJkPOGPHcK1/V/8rGp/cbNwEQhFXCfoZFpHDb+2hEK1eJLOQU7qUguMs0hpO0HR2TfT7nMadytbWfFOH6SuJa8MwUhDasmrjgTb+2azVbvRk/xebOni2LsGZ80s+1tLVxb06B6H3D0ngTLBerDk9U12rm3BP0VwZrIlcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRbGORwFNqN3L0ohWKNWIKn/Ty9E6UB47wAK0dm1pzg=;
 b=DJsLTl0ZpFGO5ctit/BSNTsiZFuczTZoWJy1h8+FtIGA+BvJUSpPeWXEFJm0sYXLXO6ROKlrp9IO1E/qBu8qvKkUNbpyCepD9VpHKidVkJY2WEA0hhQI/gIPVwYtzJ7sXxV9hCdJYSQngr8SXWmPBDbq5/3speRvowRdjoQtJgIOesWIWanCYNry/WTVKGG3FjDpITvf2UtdRTUzMr+77BhChu9IXvTWcU/2J9ah4XlqfLS9HRa5YgGQGSNqIH+Zxkt0QXwSm0f77JsQumGh4PMd0WDYbGp/J3LPhItZgMl8Qxp7stHpgNPnHulgLjTjMwn/ikceeRLQ5yZD7PVYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRbGORwFNqN3L0ohWKNWIKn/Ty9E6UB47wAK0dm1pzg=;
 b=MRkfPHq8GCbXdkngevn+ZiLp2jV1ANgCtF5lGEF/eGbN9yEirkoz++tpL5krG/85dozmR55Rj3npzEZZ1E9sA+pfgt3HD/0XrhVsnph6cYU1psWwKxr0wCmMse1RbYif8k+mov9WPt/6m7kzpyjaFBzxbRGEJ/mnKncaXqsMM9qEl7Zmar2J63PPGA5nqXwd0MPWjvYx6u6ZFtJBIHQ7rpA6m9L/R19fuJZk+ETdvB9/GUrchozspZk7h2j/Wp+uFnin+FnvBpyjZHgz5N3mSogh21qdze1htNToiZTlkVy/ZWl9Y90MknJZFR6mmz5zDqaipFlQFQbih0SdxaMP8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:54:31 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:54:31 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 20 Jan 2026 17:52:54 +0900
Subject: [PATCH 5/6] scripts: generate_rust_analyzer: add pin_init to
 driver crate deps
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-ra-fix-v1-5-829e4e92818c@nvidia.com>
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 8873ba58-9b3e-42d5-c5bd-08de58018709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0hEYzdRQ0xNMjVLOUlGMEh1NmMzUjJ6eWNUK1lEWndva0VlazNSM3JPQjZ2?=
 =?utf-8?B?djZEZUQ2N0FHUlBHTG1OQU92MjV2Zm9vaHRvWGprckFNOGUyUU9FQXFUV2Fa?=
 =?utf-8?B?VGgxT0YvUHMrZ0h5Wm96UFFYakRLWTkvSzBKdVF4OHhzRE9YTlIxSmVQb0cz?=
 =?utf-8?B?ZHZJOHdjZ0VyZDNzQWZ4RzNyMFZBaUdpSE5wMUlSNDRCclZPQ1NtcWkzZW1U?=
 =?utf-8?B?RXhseStCVjJ2cnE3Ykt6UjFCSm85b25ydE5HTlVLN2NxcWdvOE1iOHN0RnRK?=
 =?utf-8?B?bnd0OVlZbVFnbnB6ejhTZFdUMFprRUFoS3VLVzFONmdyWEx3T21sdHVFeEZC?=
 =?utf-8?B?Zm53K3FOa3kwZm1wTzBXVHE4ZS85eTUvZ2dIMFVQeWMzWllmU05WTzNUOEFG?=
 =?utf-8?B?ZXFvbGV4M1VZOUlLY25YTE9sTmZ5eUw0bjJtRWFTNXlYVzJwbjFzRUdDa05w?=
 =?utf-8?B?NUc0RkR4T3hnWmtlazc0RXB0cDdEeXI0dTZhT3BubENLMXk0MnFmMnM3VGgr?=
 =?utf-8?B?SWV6elQ4T2c1Rkc0NFlSSlNwUC9GenJtaE9adzgzMUt6OWxYNTJwKzUyWHN6?=
 =?utf-8?B?Njgvb1AxSk5FMTFSeEdWdkZWc1pYY3RsN0I0dW1ySDdTbmlWVXEvbUhHM09r?=
 =?utf-8?B?UkRFYWw3WElBaVYzVjFicTBOODlZcktrRC8rOGFuMkVrUDZ5bHFrWTFsdy95?=
 =?utf-8?B?Qm43Q1dDajZhYytHTDBSdnRYUzhnVkNFNUpzSXNNc2NOVEF4Wkh1MkwzRmJs?=
 =?utf-8?B?cDJucWFhK3k4dnJ1ZUtGRzhuMDkxc0o3dnRGTWVCM0NIcXd5V3lRdzJBWktS?=
 =?utf-8?B?ajU5S2JZdG1uWXZTT1Q3cnJoc2RXRllJRGVhMDBPWkhmTzFXdXVtZW9UZm1M?=
 =?utf-8?B?R2dIUVFtTUxid2FKamkyYnA5VDNpbkl0aGRvSWNuMDV4T2JUVFhWQUloSUoz?=
 =?utf-8?B?endPVStQYldibmRlMkIyenA4T1dOT2p4dnlDdXNLcHRVd0R4THFpSEthTG8x?=
 =?utf-8?B?ZVlERkdzNkpRRVBsQ3V6a05lcm5hMmw3OWNFUTdvd2ltNWwrMFdFSEx4cEVo?=
 =?utf-8?B?d05oOGJZblQyUEIxbTVySStINWRVWEZyUUR0bkMweGtqNEhTeE8waTVGb3lD?=
 =?utf-8?B?NHJUTzMzNk5IQkFXZmxWNkN4NFlMaFRGc2ZDZDdSa1IvbEZCdWNId0oxalpy?=
 =?utf-8?B?V0lRSnRwL3VvSVlCMXBoUVowczM4b0ZPcGVBckhwUkdQdG5tVkRIY3pYYmdG?=
 =?utf-8?B?ZGUwN3g1Y25jcSsyZXpQU1BkTThDQ1VuNHV4cEJEUzBPb0hIOUFiL3IrZmhs?=
 =?utf-8?B?Sy9wVzNqdUEzSU5xb2VoNElVR01oQXFoeFlBa0NLZytjdGVuWTZiaGxFZ2cv?=
 =?utf-8?B?SGowUDBsdEFqQTIrVC9ENGRwM3VpbkVpZ2N1N0l6eHhzeHE2Zlg3SDM4dm1P?=
 =?utf-8?B?S2Q5ckM2RG9XTmZvenFWQUJRVmg5MGpvYmlwQUFjekZmbXV5OHpuRUljcWpi?=
 =?utf-8?B?WVNVNTgvUFBuMGtWTitITlRkblE0S1FFNGMzV2NYTmdXa21qbFhodkF2aGRZ?=
 =?utf-8?B?MTVJcDNpWkJHS0xZcXdMaWRvYjNlYlhna0NpbWVmUGswM2IxaXJSR3FsdWl5?=
 =?utf-8?B?ZWNQeTJqV2pKMDdzN3h2Z1NIRmp2MzUyRUp6UkxyZXVwOXROeE9yTlZjTzhq?=
 =?utf-8?B?UzBLME10TFdvNHFNOFhHV20yZE8zRWJuWFFRWWZkOTBLNGg1cW1GVVdqa2Fl?=
 =?utf-8?B?UEVwMXQvbDZoKy9DdzQ5V1NWbUJmU0RCRG1sakVKc3JqRVFaM2dKb09lbnJo?=
 =?utf-8?B?SE02dUo1cDZHeUhSdGo1clIvZytCU0Q4RkZ6UTA5K1FsWlNodEcvZkNLUWJS?=
 =?utf-8?B?YkNrV1NSYlhQUlJWampNWW1PZ3FnQmJET3NMVUxKNVdGN1Z2Wkc2emlQVGc2?=
 =?utf-8?B?S1hvcDJ5MUI3dHpNb3VEd2ExcHE4MXdpQzFiajRDbkFwTjQvM3dYMUZaMW50?=
 =?utf-8?B?aGdtTjJtYXVNc1dTNWxINll0ekdKaXlhZ3UyN2FHb3BxcU9ySFlMSk5Mc0dQ?=
 =?utf-8?B?aTNPaTFBVk90V05SOE9ueGlHODdqMTN6RmdjNng3b2plZjMzR095R0RrR0Fx?=
 =?utf-8?B?K1lmTnpZR3M0N3lFVFprN0xhdTdaRmFxZm1GTGloelVGZFhKb0t3RjlGY3Jp?=
 =?utf-8?B?K3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHpMd1cwS2dZL1FtSFFldW5KTmM3S1Y2V0gzeEhsaEl6R1JpY3hJK1hDVHJG?=
 =?utf-8?B?MkJna3ROWTg0NkM0dFgrV01ZZW43SWRyaHAycDRHOWJyMlFrNjBjSXRaV3ZG?=
 =?utf-8?B?MGozVThZK1ByZzBOcDVBbEFBa0c1dlF1UXdzb0diTHNxRUJzTWE4SDl1cS9R?=
 =?utf-8?B?MUhVbU9wdzBjb2F0bVdGVC9jWDJyeFZtZElmRzI1RlB5bjlLRnk5UHpFRmFL?=
 =?utf-8?B?ODA4VEdnR2F3OTE5amswTGExWksxWmxmQnVVZnArZTVraEkvL0RFUHFYMzlE?=
 =?utf-8?B?SzA0Umd3dDJ1cE5WSDVwMkUwaW1ISlBrcUpGdDEwZDlkeEFOTFczSEo3QzNy?=
 =?utf-8?B?SVQ2Z2RXdUVnanI1N2c3aE1BR0tMaDdUemRLWXEyNnpsNFR1MlhtZDhMWUVi?=
 =?utf-8?B?L3h1bHBqMUlybmNJUTY3eFZKc0lHcnZra0xFeXBEWnVZaUZoQitDRHI5cjR1?=
 =?utf-8?B?bUpOa3BnWTVucEJBV3l2TEZWZHNyZzVrQlM5cmlySWdidlQ2TnU2Sm9xZUk3?=
 =?utf-8?B?WjJyVUdheCtBQ21ZY3JoM0Y5bEZjYzFaMVpvV3VOQXprNFNOdXhPSkQ4OHZw?=
 =?utf-8?B?RUhCM3FZVHcrT2ZSU25NVUhZTkF2UkdrMlRjdy82a2xpcWVNUkJuMlYvbEJ6?=
 =?utf-8?B?eWkrdlNlUHdVdy9IcWhUd3had2lEZkNYK2ppQ2I3anZnZzVZS1J3bFdaQU5B?=
 =?utf-8?B?VTljY2ljSmFIQWNTajFmQ1B3bWgyQkJLNW9uVVBRSWc0ZmI0YWcxaEtzY1JV?=
 =?utf-8?B?L0hnT2YyNGZPTWM4cGNQWHBxUS82NjJ5eXo3dEtoTnZ6UFRUOU1GZVcxVlRS?=
 =?utf-8?B?T0JyQVkwMmZYQ3gyMUk5bVNHcjh4aGNkb3BVTy82aVJDVUZrV3NhRkpQeU85?=
 =?utf-8?B?R1Vkb0phMTdLUk5vWklJbFI4bHJUSjVhQ1RVakw2MjVjZnRXK3ByUkhUVndk?=
 =?utf-8?B?Z0xlbTRQb1Rvb1cvK3EzTVR6Z1ZTd1F3WGtUL1R2VFBSbEFrcHVTWEd3TGdl?=
 =?utf-8?B?RDZYcjZtYWQzZkRxRkJRU25HNXRJSnNBMzJGWWs2TVpDbEJEVW5DMFhDY21Q?=
 =?utf-8?B?R3lIc1VTQkI3RW53NjE2MEVFUkNMNmpiaUgvMkRxdEdNMXVKeWNsYlE3Um5F?=
 =?utf-8?B?WlRmUGo2M0NYWi9CRS9SSUJ5ZlhraHRLRVM5aC9yUXJyTEVYd1U0OTdZUjVp?=
 =?utf-8?B?cWhIMGNzWGQ3c1RWS0ZJNlNlem10WnpvUFoyK3V3ZlIzSFluQ2tZZDF6Q2Ft?=
 =?utf-8?B?RkgxN0s3ZVNPNXdUaVI5cmg1Tk1qSVhRWmE4eklQYWc1MUd3ZkVsazhHUDEw?=
 =?utf-8?B?cU8yUG1RaHlqbkpBWnlaODZtK2pKUFMvV09udnVIN3NIbm9ialE2RmtLZFc5?=
 =?utf-8?B?NXpxeTdRWkczOEtwN2V3aG91VGZhZ0J4UjVSQzJRNzZCVUlQUWVBMW9UQU15?=
 =?utf-8?B?c2IxRHZxdHF2NTYrRjZpVzcyelpwaDVaQWtnb0l2dnZxVkppTTdxSThGS2VE?=
 =?utf-8?B?clVNSkh4R1c5Tno2SEhOU3dpSW9SN1IvMVUxNlA2YVpGRGpncFFjOW0wblpI?=
 =?utf-8?B?K05JektXUFdkQzZHK1lRbHg2cDlweDJzZkZYdHY0cjlrMXdJR0VCc2E0YVVn?=
 =?utf-8?B?Wm5XdS9DUDk1ZUIzdWR2RktadDRzZnVwR0xXQzhUOHFIczkwcUVTVzFLVmIw?=
 =?utf-8?B?bkdERUZ6eDN4RnFNcjJ6SmNFcFZwYVh6K3pqazRhL3NxY04vaVAyRkZEWmxM?=
 =?utf-8?B?RVFXRDhpbXdsa0l0ZUlobTJzNmd5UW1kZHZ1a1dpMFVzQ0w1U0g1b25PVSty?=
 =?utf-8?B?WWk5cEJIY1o3bHZTUUhMMTVRbmlPUnloR1IxQXQrV2ROeW5FRU83TXhDa25i?=
 =?utf-8?B?aG04Mjl1Y2xqMlgzM3hLNklpZUpzRE56ZVp2WjBvWlVQRjNwd0hmalRxOXBo?=
 =?utf-8?B?LzdWVlRZMnEyd29sV3I5dTh2QW1CeU5UZTVCZEtROEpFaklYbmJiaXdzSm9h?=
 =?utf-8?B?R25ZVjJsMXM4aDVyM2RoOE1FdjBHYkhLMzJBLzR1R3RYWXRrWXBXTGpJd2p4?=
 =?utf-8?B?Y0RVZ1p6R1kyRG5GNVVwWHd4R2s0TG5ucTAxalkzS1lpK2pIdVB2dVp3V0dU?=
 =?utf-8?B?UFJGZVRRNDk2b3I5R3N4N3NZRkt3R3hOM0JrVHJSc2JZbWg3Qjl6SWkwcHJs?=
 =?utf-8?B?azJNazgremVsc3pqL2lOdFk4MmY0RWh5MUR2VStXNDA1bm13eTNySWxFNHI2?=
 =?utf-8?B?ZFYwWEdxa1hyZW9NVnUrQWlIZ1l1RWwvekN6T2ZxaEZTdlNXSDN6Vm1XZUgy?=
 =?utf-8?B?S0Z5TDg0TWNYTW9sbFZ0cW0rcTBQbG8xdjRUY3lPSy92ek9pNFJPd2ZPWWli?=
 =?utf-8?Q?Ef7KXyfN0LRSFUckatVZnnRJqhEXzBOZLjQgaUCcBwgiA?=
X-MS-Exchange-AntiSpam-MessageData-1: 1IyDl8LJgvodAw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8873ba58-9b3e-42d5-c5bd-08de58018709
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:54:31.7590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yw4qsp51YFG70pIYTEzpGhpexyX1PMESTPUwui1xcq8UyMdVytUYKbWHZNNWvkbiD3pKqUgk0jfeVHFjIwBsyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

This adds the missing pin_init dep to driver crates.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 0d93e8a8e4bd..ba2f6b0fb99b 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -234,7 +234,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
             append_crate(
                 name,
                 path,
-                ["core", "kernel"],
+                ["core", "kernel", "pin_init"],
                 cfg=generated_cfg,
             )
 

-- 
2.52.0


