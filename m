Return-Path: <linux-kbuild+bounces-11080-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o6UYJi/7iGk20AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11080-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Feb 2026 22:07:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A310A28C
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Feb 2026 22:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7273C3008D12
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Feb 2026 21:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79786344DA1;
	Sun,  8 Feb 2026 21:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WZXWT20P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC82D63F8;
	Sun,  8 Feb 2026 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770584876; cv=fail; b=D5VHjRk7iZ++bTeH4JlFO04PL2KxlmM52eNyfVZEabg5iahpGt8jCHHLaZs4B+fLBBCNuZL5YqYhVcXSl3tpBTs0qxTfwdT6vKMJXndHo2EZdwQWN7eLnDJmIvL/ZgFUPYJXPOS+Wl8zFgsoNG3dsdEeyne9ITdKJtt4xwYeE7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770584876; c=relaxed/simple;
	bh=bEXaOhNatTpOTwgwoIizj3imJKGejyvBSw3mwWavpkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cvBSNOFcrFqxRNpSnw6d1m+hG5PPjlmDqHy9UXV5SMCFZ2TX+WTaUewSMEerxSnoNakPT3oZs3/8UP4vLsCgnow4Ed+Lly1CgLeE1RCThoiS/mP8rQX3IlY8fiEcQO2XdZNVHRJkdibAK40WnmcwXek/vkut8veJn0r1vmnRf98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WZXWT20P; arc=fail smtp.client-ip=52.101.62.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGL9Oqj/24YWcpp8Eywq+YS9bKSDjnn54b200f8P7EL0Vyl/dcnIUeYOO92n4BHOInhc3tmqnV+cGXc7LP7rTD9cYrbqRnmoJxOo1gugnsprqIaVCGxXIvPoJ+x1cPqrFAln1eltFLXANx/WBN5CwB6nBRr+/TroTyvws95t+87u1d1mYN5QweX2bM/6yleqgrIYFm/yUi3ws0sEQ7UgN1UUD5LDt2s63qJi2TiHvctC2ZP2758zg6ROsWK7HGK0qjPWvPQXGi0L+w271+KiqF3Pd2kdloL3ICSxY3Z+z54NtA/nIQfbAca+yUR4yTWMsSXYSffpRYVZpTGt4FAlpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxB3kS0tYgml3llyvHfaqlMGeZQXYXSNQzLiP0WFRcM=;
 b=P4/fkwts7JPx3OIpWw3s05e84iAPKOd+hFYISNF1Z/25INEbvVElTJA5yOOvqJuFlJFXAT+ic4njog7BGofuHa0saAPBHZVusQpG7x6abOvrH1UJ0eDGi85GqUzu8VwAqOjOqKwODaTX3D/2dWgj5pQVM1J3eRwb3zXalpEQDznqadyS7ostQ7Rxo2TZ4QgpDpsDlSDqHDLZaHJfCgOAudSJ2lYJ0R4DkbJhzBanSM7Y9vgp0w6pB8666TFVqIaaVD0oB+8dMjdRsgUYpNrId2Z5VxQu49AcJY+rKbDulWR1Tyk14uEgm1O5jizwSqSAEdpQv/9tr/F6plYedVeRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxB3kS0tYgml3llyvHfaqlMGeZQXYXSNQzLiP0WFRcM=;
 b=WZXWT20Pr8zg8Ws+4aIlph+zKXfXfN3fSC+XByQ3snODssRnteeqX3EkyrtWUVDQQMZf0zSF3pWQ1+PZxQ3/Q+3uhjlsj0uKoqRtf4x6yUloxND0QGKdMnp1ohc8lruLvxaWglLdiUgQJ5WVKy7UCckUoUwF6NvxaqVKitzZhIwH/uQDsB4Mx5lb0LCZWon9gj9w4ZEku5QLGZDXjNcdIYD11Lj+RlS6Tq3uCenWPHTqci7POv3lmrzG/qGa5GCgvmCFhmfLTvV9ARJJLT5ejzKKZx3YnT/sKt/cmPUZm1iBm9SdvZcWK/YdMDhkVZN2GFo0nlzF4xZnV809Mb0/vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by MW6PR12MB7071.namprd12.prod.outlook.com (2603:10b6:303:238::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sun, 8 Feb
 2026 21:07:52 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9587.017; Sun, 8 Feb 2026
 21:07:52 +0000
Date: Sun, 8 Feb 2026 16:07:51 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
Message-ID: <aYj7J0yTJtYlxLt4@yury>
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org>
 <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org>
 <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net>
 <aYgmENPRTdD4wCVF@yury>
 <CANiq72k4D0ZPDzBCHY7xq=qOmERHk3e7P8CcKtVHjjjOQhJ+2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k4D0ZPDzBCHY7xq=qOmERHk3e7P8CcKtVHjjjOQhJ+2w@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0488.namprd03.prod.outlook.com
 (2603:10b6:408:130::13) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|MW6PR12MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: d31b0904-a1df-4829-4c6c-08de67561f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2pSL3Y0SmlFMjNvUWk4bFYzOHN6ZTBMc0xtOXhJSXZXbUxRVENEdEcwcHk4?=
 =?utf-8?B?MjFDUVg1WUs5TlhtZVF3ckdhelRjVVFuK0FDU2lmTmlkQVhHZE1MU0hUam5K?=
 =?utf-8?B?dlYvY29EYkp1SjVWQ1RhcGdrNElqa294YkExWndZd1dqZEFqQm05UVpwK2pv?=
 =?utf-8?B?bHhrSkY3TklHd1ZOeWpiU2paODhyeXRlUGg3L0ZlbnY3a0ZmM01sdmUydkp1?=
 =?utf-8?B?MVJwd0dibCtWS0U3UnBRbDJ6NFlKbUZZdVpRY1Z5NEsrUU9NeWt5Sm9DY1Z4?=
 =?utf-8?B?MDBTaXFlR01RV01nYjVyNUtSSkFBalltUTQwMVdaVGFQNUF0V3dNR0pPY1ls?=
 =?utf-8?B?L0cyK0lpdFI0YmovbE1Gb0tPUHFFQ01yTTF6WlR6NWd2ZktEL2JTdTlNcThT?=
 =?utf-8?B?T0hqcy9QemdxOHpUZHAwbExJSXhFb0ozKzlkNTRUb0VzM2dBUGtUUlJycDdq?=
 =?utf-8?B?OGl0cnA0ZmVVN0VFbW12bFJsd2xtYkQvQWVKOEFkQkVzak1GMks5MWRvWVhh?=
 =?utf-8?B?QXl1UUJHRUQycEVOTkpicGJSdUVkTjBncWZ4aXJ0ckFJV256YzE3OGxCbVlk?=
 =?utf-8?B?TU1KR0NlNXcrOFhDZmRhK0liMUpTai9yMzI0d0UxRGlZZW5hR3g0RzlNY2FL?=
 =?utf-8?B?dnZiTkkyZklNTGxrRG1SYWhhU2c0QnZBT3NDYkZQYlBZUTI2Q1YyV1BndEV1?=
 =?utf-8?B?WTFUWlViYS9maSs3OUNKeFZscUxES29aTFpIeTI0Q1pLWWdhOWJwTzJkayt6?=
 =?utf-8?B?d0JjWWJBZFhRNTIyYVg0TGd2b0Q2ZmZ0YjdrdjJ4dzR5S2cxcEYxUEU3UWhp?=
 =?utf-8?B?bUFWOHBMbUE0OEVQZGVxcmxtV1pDaXk1cGVRQkxrTXR6QXRGR0x4S1hQaVdE?=
 =?utf-8?B?ejJLdUcwZXMrSEJydGJIbVBrbjBOVDUzcHNWMjVaNU5TQzFydUlMM3NTNFl3?=
 =?utf-8?B?RlJCZHVkWW85aVZpSFBKMGtJZkJybG5aL1pHbmw1MjdZK3ZmQ0x5QzJBNnF3?=
 =?utf-8?B?MTdmZ2NIUzAvZnZqcHRiOUFwZ0FESDEyVUpvdzhQU0k1MGVwdTJRdDJmbTRp?=
 =?utf-8?B?QW9UTnQxQUlPZU5QRWMwK0JsSVQzQ2xWR1VmUkl0b3pCZUF6VlIyTXl3cGZk?=
 =?utf-8?B?MllWNTNjTDNrR296RURmWFJTZFlJTS9VSm5pZUdHcnhQdmNlVTkzOGV0VzhV?=
 =?utf-8?B?cmxUYWMwNEJkN2gvak8wT2I2ZEhtSlpMLytJb3pmU0swaTczMEZGRzZFZTZY?=
 =?utf-8?B?TGRMaGhnNE5QRkYvQzR6amtDQmxBTkdWY3dVQ1FvWTVVcEJrZ2RNVXJHbkQw?=
 =?utf-8?B?Ykt2TkVVTVNaeDRQSDNWeWpjUzNKclJmbXJJeFNRTStIdlNCMk0xTTZlMnlh?=
 =?utf-8?B?TEVBQUQ0ckpiQXdDVS9nV0Q0enpsVzRSSEFMV0k3WFU0WkdjMUI1eXFzQ2lV?=
 =?utf-8?B?Sk9QZHU3QnlRd25iTVZzc1J5MFd1TFBCR2E2K2p3THh2Y0M0NTdjaTk3QnM1?=
 =?utf-8?B?OXdYejlPVHVDK3llQ0FLcERFOTJuUU9CQzVVVjlJMmVXZGVzRVJwN090Wmow?=
 =?utf-8?B?QTF2dUFpTEcyMXFaUllNbCs5OGo0S01tUXdhM1NpWElHM2hIZnlQb1JDb2ZB?=
 =?utf-8?B?ZmhqOWlUZjR5bHNtZzRJRUU3UmZEdVBZVGdDWlIxdnpockwwZzFaSHFlcVlk?=
 =?utf-8?B?R0lINHRRbWdtaG5zMHg3VFVkWGNhZjFDamhldTZUZGdwMzhXNVBMdjVZSUNV?=
 =?utf-8?B?dUo2b1FwOWpnOXFaaEJDOFQ5elBKcHgzNFpacHV5QitRTEI2T24rc1JIdzFx?=
 =?utf-8?B?WE1qdk5sY2VYdFhMV3lqUkh2M200aG5EaWcyV2RldXFCQmFJdXJtYVJFSml5?=
 =?utf-8?B?bXRpTGM0TzNrbkdrdFVtVGV5MmY4aWw2SmRuWk01VUk4RzNqUStEdkw3V2ZM?=
 =?utf-8?B?bjlvdUdkaTNyTFp3Z0kya0IyRjcxckNDY0JCWWtra2Nab201eEorV2lZNXlz?=
 =?utf-8?B?YmRxNGQvUWpMSy9PRlhyc1RLUFNkM0w2NFhZdm9QUzUvMmdoTis3RnhGRDBy?=
 =?utf-8?B?eDZrVEZWQzRiZk5xRHIxVVRZb0RkNlZqR0JFcDYybWtldzBkNWVhNFVqK0hH?=
 =?utf-8?Q?grkM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzQ4YlF0ckQwc3VHZU9xZmNtMGxMUnNaR0ZTcXBFOWRUTTdJdWNyOUIyczcv?=
 =?utf-8?B?c09GTVBHaDkrZGJmMm9hMkRxbGZPai96Sm5Ramw0ZlBWYWlUR0ltSkdHUlpD?=
 =?utf-8?B?TWVHYW1DMTExUjFxTWUrWkpseTdwalFGUWs1WVN0d3dYeGpqRHRxazh0bWJR?=
 =?utf-8?B?VXVUazU2eDVKdHNCMVJsNUxnMi8wQzR6dWtvZ2luOGJSbm1NWE5YNi8xSGNa?=
 =?utf-8?B?Y0kyM2p0d1phd2J0YUdLZVdmWm8vRTlTNlhGVXVQRDhTT3NzbldLOTI4MkZk?=
 =?utf-8?B?bnhVcWdkZFZOSXI4N1hvYzJhWHdyNlhHdG82QUF5RWZHQ21PZTZnRm5tZFps?=
 =?utf-8?B?cnM5SmhZZ0NQbWNuLy93bDZHaFhacE9LanhtYmZkZTFVRFZ1S1ZSR1lCdG56?=
 =?utf-8?B?eS9QUXF2YXVacjZsbmRFSjA0N1ppWnJicjRhOWoxeHlLNmF3cWYxdmwyckQw?=
 =?utf-8?B?aGR4NFRJczN6cnYzbDA1TTVFdmIvVlltMDl4YmJsQlBLSlBxSURlekxCeHRT?=
 =?utf-8?B?ZFA3NDVCYXNRendSVG1tRnBidm4vQkJYbGJLamRqK3lJdHA0WGVJNGttN0tK?=
 =?utf-8?B?MjlSN3BJcDZDWHFBNWQ1Z0d2cTIyaERvRVZvNHhCRDkxeTY1VzZwZFFQcDZa?=
 =?utf-8?B?ZlJuRzRFRDJjd0w2YlNrMkIvZ1BrSmNLb3o3TGdqYzNQOU1xY09YN2Vmc1Mw?=
 =?utf-8?B?ZUtnME41emwzNGhhMW5VOHlRT0J2UFNkODdXdzVLVFd0VjEyTXFtRk9FMS94?=
 =?utf-8?B?YUxiUXJsU295QUxUWWxrdld4bWlSa2FyWmJsMDFPOXkvQ1QvbnU1b0FkNjk5?=
 =?utf-8?B?eXc0ZHUvU3BjMzE1M2dicGV4SUxyK0hpbExZV0VFL211KzQwUlJlaENHb2M4?=
 =?utf-8?B?d1pDbW9OUzM0clNrSjhCcXRScXRYY21iTkFSbGFxNUdCb2k0aU5nb3hpd0Ri?=
 =?utf-8?B?M0tSQjhOU01pQVJycFpZdmZ1elQweXhmTlNoejNpU0pINnJOUlhqN3ZuVXVD?=
 =?utf-8?B?cnFDbTAxeENibVZpREFRdk9LWVZoQ0NNUWZyUk0ydjloZVR5WDU5NGJYWjZi?=
 =?utf-8?B?S09JZms3TzBYaFRGMndXNS9CQ0V5c3NrSHN2THYyL1F5cjBqUHovV29BZDl4?=
 =?utf-8?B?SWdLZjdkMVFQcHp0WFV4OVFWVUZTSDBLVkpvS21WWHBpN2psbnRCTldBa1NM?=
 =?utf-8?B?c3I2L1hrZGZvM2FqcDZyUm1NNmI5YVIwbDVRM2s0b2ovOVBzdC91aTZzcG5Z?=
 =?utf-8?B?OG0xNHdHcHUrZWVha3dJandFZWhnYThRT21GRGovaTRnN0dSQ3N3UHg3UzFO?=
 =?utf-8?B?b3FKZElzODNDcTIyZzYxRHB3Y3JoRnB1UmFTUnlxK1poYjVCbXVrTzFIR3E1?=
 =?utf-8?B?L1U3TXBIbWkzQ0gyMmN6RXZVNFhpUjc1VlFaZHhHM0M4RlBzaExhUE9mSUhV?=
 =?utf-8?B?dlRMOXduODB2TnpMaVgyVzhXL1JSZXVnbVMrcTdJN0xkckIzcVVKTU52Sjl4?=
 =?utf-8?B?VUhzb0FaUjVZcDJDNXh1cU44ZGF1S045Rm13dG81aS9Kd2x6Z0srRmhCRTlK?=
 =?utf-8?B?Z1VITjdVbGxRQnhWS0tiVDhsVkhxWVI1QkZzTEFrSGYyYVcvMFJRYlg3cGpD?=
 =?utf-8?B?RTZCNTFqUU9BMVZQa2FKY3JWOFN0SnplSGh2U0FVajdLZFczUnZGS3NRNkdp?=
 =?utf-8?B?dkphL1pxY09CbkVFc0E4aUh6UHhMeEZPODJHWXhiTit6OFBnVmZkS3g4NnRl?=
 =?utf-8?B?VmlVMjc2cDhBNXpaYnM2Wi9KMWZBTjVpVkJtOTJHOGptaGlUUEs2ZGJ5Y3Av?=
 =?utf-8?B?Ni96dXo4bkwxQzI5UVphTVg3azhWbHAxdmpTQk1yZTQ1Q1l4MHJwaEx1NkU1?=
 =?utf-8?B?MG52WktvY256WGNBU0lFTkZUS2U0Nzk1V2s1U055TkNEbzNTZU9FTnFvdFNF?=
 =?utf-8?B?Sk9NbWFRK0JJSEUrSUVaa0RaWGxsZXYwUnpIN2dHZFFwc1pYV0tVZUFHYzlI?=
 =?utf-8?B?WHdveXppWVNZaFZYRHc0VnNvaDgvcVNVZkhscTltK0I0bEtkNWZFOW1SWmg3?=
 =?utf-8?B?bVM5V1FvRXVHLzZkTW5GQU1zS3M2cVYyWW14ZVZoZktoQlFVb1grb0Z6UEx0?=
 =?utf-8?B?OFIxdmdQejJMdnM3RWw1dUU3dlhhb3R0TE5WckdJblp3UlNyK2MyNE1aTHhM?=
 =?utf-8?B?M05EVFB0TG9RYkZjL0NBWmVYQnhzb0lNZ1RhNlNtRTlxekkyb3FYQkJQbnRX?=
 =?utf-8?B?RDRqNTBzQlQ5b0U2WUJIK1BwdmtabGYvWWMrOVlUZUt0MGtodUNCSEdOY3U3?=
 =?utf-8?B?KzJERnlyZmNPK29CKzE4VkR5V3d0dmtWWDlDVEJNeUllRGRnTjRCUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d31b0904-a1df-4829-4c6c-08de67561f80
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2026 21:07:52.8095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXEiUMHlXIOpEDYomsmC/PRNrk8/3ys6N0ygEQOUQ/Yi4DKh8QnIRpJPCNrQkp6tOonlVHZMwN4pn92Gzwu5ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11080-lists,linux-kbuild=lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email]
X-Rspamd-Queue-Id: E71A310A28C
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 11:35:51AM +0100, Miguel Ojeda wrote:
> On Sun, Feb 8, 2026 at 6:58 AM Yury Norov <ynorov@nvidia.com> wrote:
> >
> > This is confusing. You begin with "const_assert!() is more powerful",
> > and finally recommend to use a less powerful option.
> 
> The goal is that users use the least powerful one that applies, not
> the other way around, because the least powerful ones fail earlier and
> are generally more robust.
> 
> I think the first example is intended to show the different ones, but
> I think the wording can be improved -- the one in the existing
> `build_assert!` docs is a bit clearer.

Can you please keep more context? It would be easier to refer to an
example if I have it on hand.
 
> Gary: perhaps we could factor out the explanation/examples to the
> module-level docs, and then link to it from all the three asserts.
> 
> > I don't think this compiler implementation details should sneak into
> > the kernel. The compiler may get changed, or whatever else, and this
> > all will become just non-relevant.
> 
> How do they sneak into the kernel? Gary is explaining why it is not
> called "link time", precisely because that would expose more details,
> not less.
> 
> Regardless, that "link-time" vs. "build-time" discussion is
> independent of this patch, because those docs already exist in the
> tree.

Again, more context would help. So this is the original comment from
Benno, and Gary's reply:

  > I think having "Build-time check" here is a bit confusing, how about we
  > change it to "Link-time check"? Since a "Compile-time check" also is
  > done at "Build-time"
  
  This is the intentional phrasing that I used for `build_assert!` when I created
  it, for the reason that `build_assert!` ensure that it will fire, at latest,
  link time. However, if you actually use such methods with CTFE, it will error
  earlier. So it is "at latest link-time check", so I decided to just use
  "build-time".

I agree with ""Build-time check" here is a bit confusing", and the
following indeed looks like a compiler implementation discussion. So
I concluded that the difference between build_assert and const_assert
is not visible from programmer's POV. Please correct me if I'm wrong.

> > On the C side we've got similar statically_true() and const_true()
> > macros, but they seemingly have a different meaning:
> 
> > Is it possible to maintain consistency with C on rust side? If not,
> > can you take those C comments as the reference for what level of
> > detalization is desired? Maybe pick different names then?
> 
> Please explain what inconsistency you are seeing here.

OK, maybe it's just me, but this is how I build a map between rust and C:

 - Plain BUG_ON() matches plain assert!();
 - BUILD_BUG_ON() is compiletime_assert() and matches build_assert!();
 - BUILD_BUG_ON_ZERO() - same as BUILD_BUG_ON(), but can be used in
   initialization constructions, like GENMASK(), i.e. rvalue. No direct
   analogue in Rust;
 - BUILD_BUG_ON(statically_true()) - allows runtime conditions, like
   "true || runtime_cond", and matches static_assert!() in rust;
 - BUILD_BUG_ON(const_true()) - doesn't allow runtime conditions.

I expected that const_assert!() would be an analogue for
BUILD_BUG_ON(const_true()), but it is seemingly a different thing. Or
am I wrong?
 
> Also, please note that two of the three names have been for years in
> the kernel tree, and that standard C also uses `static_assert` as a
> name. `const_assert` fits the pattern and it literally expands to what
> it says.
> 
> Moreover, `const` in C is not the same as `const` in Rust. `constexpr`
> in C is closer to `const` in Rust.
> 
> By the way, I am not sure why you suggested `const_true` for the name
> of that C macro -- I think it should be `constexpr_true` instead,
> which is closer to what it does, and it fits the pattern on the C side
> better, too. So that would be more consistent.

I suggested const_true() over the original underscored _statically_true(),
and this is an obvious improvement. If you think that 'constexpr_true()'
would add to explainability, please submit a patch. I have a weakly
negative opinion on that.

Thanks,
Yury

