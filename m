Return-Path: <linux-kbuild+bounces-9532-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FBAC491B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30ADC3AD781
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 19:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1754F337692;
	Mon, 10 Nov 2025 19:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jca37Bys"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37983337107;
	Mon, 10 Nov 2025 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803267; cv=fail; b=a6RQqtmCxgmzb54BrmJMuLk+SQ3XTev1GgiI5jbS09o/NmDOd9uwfUfRT0Y50Qi2RjWuO4sD8IVW30XsBvbQgivT3iO+/1yAZptheGTxapCG3uXeLSfv/ZkT9oDvqBacQWSyyIE23ig2nGdjG97Wzx+KQFQsKpaTzBZzSkjnmV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803267; c=relaxed/simple;
	bh=jPQDMZWJ8+Ju/TOX9icAdfR73ORRwAbT8et7mup5zGM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oaY/GUX2nobqLWxsY45Iq/pj7A1MI4C/toFU+7V8jvR0dXKsXItXC4sc/3aGqIEkE7ntJheRCdBnDGO1RV/hFPkJ9fLvs10x8qVonNE7C366MjXA6hVB/vfelQYjn+STj2DkTEQyHivgvws1XnOWdl5XK3/uI3HSLbCbtFrk6rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jca37Bys; arc=fail smtp.client-ip=52.101.43.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxOY2o3a8JjzXJhTL1lepkxrR0p6F3UqHGePThY18M+nD7xIPwKSh1IgYmJtNn/2F7I5ZN6hUwx0rh5wFRdEDUKGYsIpTz/2QD0U3DfeqnyYxrnLgAyZ38ulB8XGnfblBZtN1X+TGwrdhvSGTlpDFhb66ZQu9CStxxvspH86wFPRmw5trQyGqlG1vCzp0MwRVTQVB7rLdPnIPmpPEyM2gkiwkRiDU1pG3N0XRZjJBhKsUKBHbtHRZHSlqp9lP5blHRWLrkUfOFFHdwFk4pvfMfpa5hOEf01IT0iBrP6MAnuQ4r4yNrzchC7Ib10E+yZj5mT1boHNXCoS+X8t/LcsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpmL6+Pn5Rvm/mwX5FItjFO+HdaOy4EM8rJhDzt0YGE=;
 b=RXcrBADU20JNDEyFb3K+R6DZOzdsqp+eXj5WFEcYjKNjNyalwEaCrAqZ9Md/ZuAxF+PYfOIFsBrQQUzofGnduADj4Ww4Ifi+s0+gP6RIMNR1q9aIO9L7g7TEvz4Q6ypRIAOlVh120CnHU+jqWEh6Wku7tu2Chg+SB+p2L2S6E3yFJEORELMV8MHpcFUnY4VzZ3E7AMfAQ+FflZ4bNR2Zu0WrtHASNhDfoRtAeJodbHtqJeqmxXhpriklvLSMwH5TorSmPj65URy+zW/jMVOQf6BP+LWVQYbwReBufAdz9tLhD0DTxR1UX44b6q+oJ+AmXEEbx03F+W5pqppY4cP58w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpmL6+Pn5Rvm/mwX5FItjFO+HdaOy4EM8rJhDzt0YGE=;
 b=jca37ByskejcFkCIpOvFnxV1pMypL6VYl9kavck+FKAC/G6mkGJpjMRcl6xUxt1nqjNoDOekwtvGmi/qlnzIM7lqtlmDrTotHHE6bUKrr1r+vy1rntB8bJB2UgYnIYPlz09yCZIfx56Q58mdgJMfgO2ksJVJso9YKSjmYpjy37OCH2Grieb722KtDcjIQGH2Xmx7NBmg4v1lQ88GMzcevIGWBVg+JYMycJ8Ib8wJLBHoYXdonB+wTqmaPxrNfzeHbYMhVASreFHHEsTMgjqTXHgIAwgAzxSIk1w4eNnDX1rc2Ps4o/8y8ZGy0zPWriVwCgeLKX4ywONTlNIk418+AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SJ2PR12MB7845.namprd12.prod.outlook.com (2603:10b6:a03:4ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 19:34:21 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 19:34:20 +0000
Message-ID: <98e549da-b7d5-45bc-8a9c-d05eb06a75e6@nvidia.com>
Date: Mon, 10 Nov 2025 11:34:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20251110095025.1475896-1-ojeda@kernel.org>
 <20251110095025.1475896-10-ojeda@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251110095025.1475896-10-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SJ2PR12MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: a476c3af-4329-4700-d779-08de2090255b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2JMLzdSckhHOVlLdjN5UnhkUFJYckpnVDNOendmL2dQb20xS0dyY3ZRcWtu?=
 =?utf-8?B?cFBrVytVTmkwOXRZL0VNYUNFS0F3TGdwcFQ4NGZCSjFEMmZVWGZPODlQcWFM?=
 =?utf-8?B?V2dWTFVtdUNXdDd0VCt3R1h2bUtrRTd6TGNZaUJsbHIvNVllMXNBV0dXMGI3?=
 =?utf-8?B?VkVlYkdScWJoVEZxRmNnbWdnVWMvclpDcnpjUktBRUExL2grUUQ1UGlLOTVa?=
 =?utf-8?B?a01MNUFuRFVsY1p6Vm5JWE4wQlFuQmJ5S0gvcTVySURQNXYwQmRFT3VqTkR4?=
 =?utf-8?B?WXVGSFhJOUN3VlRodzdtNk5uS3RpREt6S2d6Rm5yN3BwRFdyWW9CMVBvWVo3?=
 =?utf-8?B?eDN6Rzg3czg5S3NQSnJLdE5lSlJ6V2xCSEdsTzhiM0hUMzBpQ2JwUGxKMHNs?=
 =?utf-8?B?T1UzYkdaQzdNSzNSLzBQb2VuT0VxdEZYc24zQlh5OFhyYTA1L3I0cDRxc24v?=
 =?utf-8?B?ZlU5WVYzMWVHNW9LWTVtclZGS2xsbVYvUjJsZFZvd0gxOXdBTzl6T3Z0N0Iv?=
 =?utf-8?B?bkx2SnplZHByUm1FVnZJZWY5a1puZkxEZjNQdEpXSFIwWlRTL1BVdVp4ODB5?=
 =?utf-8?B?dElaSFJnczZGd0tNMXFRSHI5blE3N2EwMWEzQmQxSVRCWmh0WlVjRy9KQlZr?=
 =?utf-8?B?c0wyUkgxbU9walJoUzJXYnJqWE1jbXBZZEo4ZmR3ZDJtbXQ1Y01TbGtSU01N?=
 =?utf-8?B?ZVZwbE5tcVEwSVBza1dtQW5ob1RxMFZrczFUc2h2cXVWSzNVUy9XTEdxWGZI?=
 =?utf-8?B?TWNIKy94VVBTcHhnd0RydStPaGEydUprZnp2TzJpMER6RkViOHVXVnFiMjVN?=
 =?utf-8?B?d0NsVWhJQ0RON2FBbk1WbWxzL0xaeFZENUVmeVUxem9ycDFnS2Zsd0kxUnFk?=
 =?utf-8?B?S2FWNjE3TWxHRW45aXhsZUlBM0l4NFdYVnVxcFFiMU9OT1JNOVk3WktGNlhr?=
 =?utf-8?B?V1c0YTVtWWtZeHpqSkRHUHlLNzJkaS96Vk40ZzVmOTNUNUkrSHF2YmkvbHg2?=
 =?utf-8?B?MXZUWkdBd0Rxek9xY1JlSEpWa2tLRmt5Qk8zcUN2bk1xY1ovV1pJSEJ3d3By?=
 =?utf-8?B?NFA4U3hER3hHeWx2czhIR1I4d3hVYmo5QU1LVmhESnczbFhSd3c4eTR0Q1FT?=
 =?utf-8?B?MmtNKzB6bzdHNlZadDRnTFUvQVpobFdaUVdTQ0ROamFObThxSmVjKzVrdEdM?=
 =?utf-8?B?ekl4RkdLK2N6SnY4dm9mL1NCekhLOXNMMkc4Tjh1SXR3MEtqbjNMQU9UeHYz?=
 =?utf-8?B?K3BOM0szWmlYRFozL2pwQmZmMzZ3VzVDakVpNmVTemFDcjBDUThYSVlrY2Vv?=
 =?utf-8?B?bEwyUmptUlozRkZHOU9XQks2U3UrZ0xTWkl1MUlHTW1sRTN1UFJ0MHh0YXFD?=
 =?utf-8?B?bmNWTFdtSzA1QzRGNy9VaVFQUHB6THN1d1BMQUV3ckZNVU14eDFwY2NaNWJn?=
 =?utf-8?B?SWFtNjJveWZBM2RLWllOU3ZnV1dScUk3MkJIRlR3dllyRUFMSHZmcEQyTnhs?=
 =?utf-8?B?N1lnbmZrWCthcnFqMkcvRjNoRjhqbDV6UzZPa2lZN3daTlJGQlJJS0l3Ympu?=
 =?utf-8?B?d0syWGdJby8rT0FMb2pRcTVtMG9iWTV4THFhenVNY3huQUhyMm5LTk9OYUVO?=
 =?utf-8?B?ZkFib3l3bXV5bUkrdHo1K095Yzk3MmRxZFd0Y3VkQ1FqdnZDWUIyVXYwdUFZ?=
 =?utf-8?B?WWdteXNaaDVlT29yVFVLRDYvZ3ZBTm1WdGNyNk5vczFDRG9BeEJhY25iZDJV?=
 =?utf-8?B?bUhBcUdmWjZzRS90dFFGUHFVdkNtRk1CYzRTUXV5eTNWQ0RZSlRuZUU4Vnll?=
 =?utf-8?B?MlRjY0VYbERtSWJrYmZIVW9TTTBiSjBJeVlzNm5DbE82ZlJNZzNkbW9hRGta?=
 =?utf-8?B?RWgrSFBacmhFWXJBdG1ldituQmZVdHI4SndzY0lYZ3pPYm9LSm9MaXZSOWc4?=
 =?utf-8?B?QkdnM3BhRTNLV2w2UE1rUGs3aW9saWozNmM3Q1BDQ2xCYzBwc0wwR1NtVXU3?=
 =?utf-8?B?NnBnOURwTmNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4116.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWtLSXlXV1MxYXpYbVprK0V3VURxMm11eDVncHBkWXhHVWFtN05JcXJTZjNp?=
 =?utf-8?B?cGsyMlJXYURkY0VHOERKSjZlY2c2NG54QUlmMXZabS9ZVjJSVUtxQnlVY253?=
 =?utf-8?B?a0NtZG1ab3drUjJBdnlEOVhVN3lJbitmMDBqUXAxUnNYM2Jjdll5NUxLczY0?=
 =?utf-8?B?endmSWpKQXNkVGxGK1Uzdk91eUQwVGlEVldyZmEzZFgyYnNYa1FPRXVpbko0?=
 =?utf-8?B?cmR6YUJFTWtuNnJkZzlHbXk0eFp2bkVCYTBna3hOL243ajFqYlo0aVNjVnJr?=
 =?utf-8?B?MW5XdE81Vmw0cGNuNmVwc2NsZi91bWtDRjcxZWR5dldEeHRMSS94QWwzQkZw?=
 =?utf-8?B?R3VUQWVJNXM0dnM2SVl2KzVKVUdJSWIvRFVHQ0szdWgzR01Xb0trNStjZS8x?=
 =?utf-8?B?STJKY2c3ejlDVkZvMjZNRXRXUG9ydWVoMi8wTHdaUEFaMFJ2aTRwNjhRYlVS?=
 =?utf-8?B?a2IvMTRGQUlucUJDK3Z0YTNtaHJPK2xrM2VRcERHNlBzRHZFV1NlMnc3YitR?=
 =?utf-8?B?VGlOeUd5Z0hMMkJQMXd0ckwxRFdQNVNjbkxnYTFaNVdkbkVpUTIwdU1pRG5r?=
 =?utf-8?B?alluOWQ5ZVlBdCtpNm1WSzdmZzVaeGU5Q3pRM1AxaGJsRVQrOFFocGN4b2Ns?=
 =?utf-8?B?SUN1T3J5aUMvMXF0NzQ4M3RoTG16TjRKZWovTDJmYWZmQWNnd2MzV2xqOG9X?=
 =?utf-8?B?MmsydnJ3UGU5TWxiQzhiZVozakJLd0dBbm14SWhwTzRHZFR1elBySFNKOXZp?=
 =?utf-8?B?bUVqSklvVWhma3M1WlZ1WnBYc0c2dXluOThjSFBhM2xoZVFZT1J6S25qbk5L?=
 =?utf-8?B?SVJNdGJtZE5EeUhtdENhdXQ0U2xVY0t0Zy91dGhHY0cyaE5vK1VEUUxUVy9j?=
 =?utf-8?B?ZUczTllIVnNJbGNEVVdLWlJXcitFZFQ4elRibGJiSU4wUHR2N3VhdVpEb0tR?=
 =?utf-8?B?dW5odElXRUJDWlFTUGJtOGJlTytNZkhYQWVqT1hhQXkwQTlSTXNUYkxOazl2?=
 =?utf-8?B?N1BmWkNYTU5IVm1JTER3SHEveHVPZEYrRit5L1hNUGFidkM1R25EcGZ0S0Vz?=
 =?utf-8?B?TVRZWGVKMnlqeFJYTzBYaHh2QUdFdDI4UkJJSzZFOVJGUmRMOW1ucjhXVHVR?=
 =?utf-8?B?endhR01uejFVM3JLSFZ0c21GZDNmZi9ITGJxcTRKSGgvQkRrUzhNdjlQRDhO?=
 =?utf-8?B?T0ZibmxJaEkwTDBHQWVNS2VJS1EyVFhZUTNaT1Q1REZGSXBuUnROUCtFTWRI?=
 =?utf-8?B?VWtnS1BKQlVDK1U0TVBISlU5ZEtyYjdwSDhWMVV3MGdTNmFLM1lhd3pVc0Qw?=
 =?utf-8?B?cVMxbkxqZlpiZUhNdWNpY1ZQeTZpMHFiMDM2cnY1QURQQzlhbUovUXZhNFpy?=
 =?utf-8?B?WWFaMzRkOXQ5NTJJbjM3SUNhSm9MUXY4VjdIRC9aeldzS3R4UC9JL1UrODV5?=
 =?utf-8?B?ZW5Fbml3c084blI2WjVuU2lJeVQ0VnhoR09QU1ZMU1ZsSWpBaWwwbnE4TnAx?=
 =?utf-8?B?Q1FSZ0J2QlZvUksvUXRyOFprRmV5NDhISzg1alRJQ3dsd1RsZlJHalZ2NXRY?=
 =?utf-8?B?Mjd6anh6SXF2Ly9yNENLd0RTL3ZCSkdCM0tuejRTdXNNbE51cXl3MzJFTEt3?=
 =?utf-8?B?ZVJGcW9oSCs4UC9pYWZQdTZlbUp1YVRQeWcweE0xelgveFgrT1VOdytWSmZR?=
 =?utf-8?B?bDFnVG5sSE4yV0ZUOFNEQUpDaFhpbnFEeGNMR1FLQ3NGSEhHczNnUnJJZmV5?=
 =?utf-8?B?Q1RDakh1RXNKeEs3STJTdURoNWg3V0l3VjB1cnhWOGpkNzQ1WmhwbGxhL2lo?=
 =?utf-8?B?ZXdBOTkxWlVCa2xWMDZJenZ5d014dWh4M3NSUXYwVGNmY1FjR2Q3MzZBWmhn?=
 =?utf-8?B?VkhpU05zSHVPZVBUQWliUzd5eDUzam5CSzRLYTZNbTNNK3FMSG1WUVlOeWVB?=
 =?utf-8?B?MFU4TFphRW91enV4TUhUT295YWtweitIYzdrTmdIemxEbmJwOHMxbUw4VnEy?=
 =?utf-8?B?QS9LUmxWUW5lOG5SYmdUMU90WnJMbGN4cUlDTzNKRk1va0VGdTF0b20vSnl2?=
 =?utf-8?B?aWpmTUVwVE14U2NGV0U2b0N1ZndicG13cHB3dHJWajJydXcvTFVNMDJRYUVi?=
 =?utf-8?Q?iv8C3pbwKqhmcjkIN0wMcUznm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a476c3af-4329-4700-d779-08de2090255b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 19:34:20.8641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTr8wk/WYWocFrGAEhZCNSRn18c7qPW+bNoGvPXnLGcGCWIa0VnC71suMacC0owTvOlNKyibKQvSgyUUEPA5tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7845

On 11/10/25 1:50 AM, Miguel Ojeda wrote:
> With all the new files in place and ready from the new crate, enable
> the support for it in the build system.
> 
> `proc_macro_byte_character` and `proc_macro_c_str_literals` were
> stabilized in Rust 1.79.0 [1] and were implemented earlier than our
> minimum Rust version (1.78) [2][3]. Thus just enable them instead of using
> the `cfg` that `proc-macro2` uses to emulate them in older compilers.
> 
> Link: https://github.com/rust-lang/rust/pull/123431 [1]
> Link: https://github.com/rust-lang/rust/pull/112711 [2]
> Link: https://github.com/rust-lang/rust/pull/119651 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Makefile                          |  3 +++
>  rust/Makefile                     | 32 +++++++++++++++++++++++++++++--
>  scripts/generate_rust_analyzer.py |  7 +++++++
>  3 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index fb4389aa5d5f..6ff887523eee 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1830,6 +1830,9 @@ PHONY += rustfmt rustfmtcheck
>  
>  rustfmt:
>  	$(Q)find $(srctree) $(RCS_FIND_IGNORE) \
> +		\( \
> +			-path $(srctree)/rust/proc-macro2 \
> +		\) -prune -o \

Looks good. But for future code and commit log readers, should
we leave a small comment, to explain that this was vendored in,
and therefore excluded from "make rustfmt"?

An alternative approach might be to create a "vendored" subdir,
to make it clear which parts of the Rust for Linux code are
special in that way.

thanks,
-- 
John Hubbard

>  		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
>  		| xargs $(RUSTFMT) $(rustfmt_flags)
>  
> diff --git a/rust/Makefile b/rust/Makefile
> index 9eea6563ef35..a614a23023cb 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -27,6 +27,8 @@ endif
>  
>  obj-$(CONFIG_RUST) += exports.o
>  
> +always-$(CONFIG_RUST) += libproc_macro2.rlib
> +
>  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
>  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
>  
> @@ -76,6 +78,17 @@ core-flags := \
>      --edition=$(core-edition) \
>      $(call cfgs-to-flags,$(core-cfgs))
>  
> +proc_macro2-cfgs := \
> +    feature="proc-macro" \
> +    wrap_proc_macro \
> +    $(if $(call rustc-min-version,108800),proc_macro_span_file proc_macro_span_location)
> +
> +# Stable since Rust 1.79.0: `feature(proc_macro_byte_character,proc_macro_c_str_literals)`.
> +proc_macro2-flags := \
> +    --cap-lints=allow \
> +    -Zcrate-attr='feature(proc_macro_byte_character,proc_macro_c_str_literals)' \
> +    $(call cfgs-to-flags,$(proc_macro2-cfgs))
> +
>  # `rustdoc` did not save the target modifiers, thus workaround for
>  # the time being (https://github.com/rust-lang/rust/issues/144521).
>  rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
> @@ -128,10 +141,15 @@ rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
>  	$(Q)for f in $(rustdoc_output)/static.files/rustdoc-*.css; do \
>  		echo ".logo-container > img { object-fit: contain; }" >> $$f; done
>  
> +rustdoc-proc_macro2: private rustdoc_host = yes
> +rustdoc-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
> +rustdoc-proc_macro2: $(src)/proc-macro2/lib.rs rustdoc-clean FORCE
> +	+$(call if_changed,rustdoc)
> +
>  rustdoc-macros: private rustdoc_host = yes
>  rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
>      --extern proc_macro
> -rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean FORCE
> +rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
>  	+$(call if_changed,rustdoc)
>  
>  # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
> @@ -194,6 +212,10 @@ rusttestlib-build_error: $(src)/build_error.rs FORCE
>  rusttestlib-ffi: $(src)/ffi.rs FORCE
>  	+$(call if_changed,rustc_test_library)
>  
> +rusttestlib-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
> +rusttestlib-proc_macro2: $(src)/proc-macro2/lib.rs FORCE
> +	+$(call if_changed,rustc_test_library)
> +
>  rusttestlib-macros: private rustc_target_flags = --extern proc_macro
>  rusttestlib-macros: private rustc_test_library_proc = yes
>  rusttestlib-macros: $(src)/macros/lib.rs FORCE
> @@ -440,6 +462,11 @@ quiet_cmd_rustc_hostlibrary = $(RUSTC_OR_CLIPPY_QUIET) H $@
>  	mv $(objtree)/$(obj)/$(patsubst lib%.rlib,%,$(notdir $@)).d $(depfile); \
>  	sed -i '/^\#/d' $(depfile)
>  
> +$(obj)/libproc_macro2.rlib: private skip_clippy = 1
> +$(obj)/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
> +$(obj)/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
> +	+$(call if_changed_dep,rustc_hostlibrary)
> +
>  quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro = \
>  	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
> @@ -451,7 +478,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
>  		@$(objtree)/include/generated/rustc_cfg $<
>  
>  # Procedural macros can only be used with the `rustc` that compiled it.
> -$(obj)/$(libmacros_name): $(src)/macros/lib.rs FORCE
> +$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib FORCE
>  	+$(call if_changed_dep,rustc_procmacro)
>  
>  $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
> @@ -474,6 +501,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
>  rust-analyzer:
>  	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
>  		--cfgs='core=$(core-cfgs)' $(core-edition) \
> +		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
>  		$(realpath $(srctree)) $(realpath $(objtree)) \
>  		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
>  		> rust-project.json
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index dedca470adc1..00c6b7cc94b7 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -86,6 +86,13 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
>          [],
>      )
>  
> +    append_crate(
> +        "proc_macro2",
> +        srctree / "rust" / "proc-macro2" / "lib.rs",
> +        ["core", "alloc", "std", "proc_macro"],
> +        cfg=crates_cfgs["proc_macro2"],
> +    )
> +
>      append_crate(
>          "macros",
>          srctree / "rust" / "macros" / "lib.rs",


