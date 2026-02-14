Return-Path: <linux-kbuild+bounces-11310-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ed/hLm4JkGkFVgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11310-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 06:34:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9413B225
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 06:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 814F5302A6C8
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 05:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A42256C9E;
	Sat, 14 Feb 2026 05:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eq2wTDBR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020137.outbound.protection.outlook.com [52.101.196.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F931E86E;
	Sat, 14 Feb 2026 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771047276; cv=fail; b=GjPy9TjfNUTjNT0X6O2fGBH8deZZCnGMDAYfccRj595ANCi1sOwgIYODtPSktP6X8nyURxheiknA0LrgNhftSn4Oi9VyfMNPxPEV+ACfxfCrZsprqZ9aBe1OVR3o79m0MwZZioYLZ5nS265cOcbjdDL47q3PgMp6kIqf8OZNwUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771047276; c=relaxed/simple;
	bh=qsUxxfbPZPrthu8Hni6d7SVvumo7S1uYNbZCt3nm8Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l6KfLhdtVoeNwX2ePcpWGA5xK1OhVFpzPMIuB1dXnRJ2RShp3eaHPPczUxWOZB28AxbxCrEKu3NvK1pU9+xuqZydCyCCEhjmRKVAZueeelZuIqQPnxf8Ta0PIYyLzwydcM6uURq/QxHjXhKuSwDLRClkYvSfCct95+KPGZfr3JM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eq2wTDBR; arc=fail smtp.client-ip=52.101.196.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hexMENE011Zng0U7HB7kjLykCEZNVpBdCwe/bh2L9u2SsPdDSKlwaz+N9tnL4pt3H5cSOXDx/8Iqoy6hhO7LkPpoZ8qj3faNjGw0JJia5WW04HlN6Ufy6qHaFFuslQqlf0NFX2ujFbB+G3pGos+LO3gZ4D4Ef2nIILlzDylVSxD/foDBny0ofyCBju0JNtsHBHHDWaEbvnD/OiUn7zkaXy3YHW5Drm5Cize6KFXTrrhIDU7eruANrrfkHExuZoinGmMvQl55hQoahDT/TGqG2VxqeiToK01tb6c8RpI9Zd1iqNrBCLxvpb3pLXzLABq4jxxdNWGtHHkOofVy5esZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ozLXm58wmg8LZokSvMcRTCiaZ0h+PdSqkN6X2ONwag=;
 b=VTSXjkqbh/2KsGmMcsrFyVqXJMzq7yBHd13tnu7BFntS1dvrd/plTGS54JSZKHdSphNMFylC4YMBnSdiIecoEVUvXLDIx6sCMTEARTCH+v/l7hVRcfH52U7uYhB8DoOYCrxAZMtOpUUE0tG4RB3647Y2+FhNsTUr6mWnMH8pDuqVcI/+gBrcGuvl3HrkKRnF5ApP0MakNHxjqCWmmi01G7QpRWRti/lNNG0am8GBa38gZ0EA9O05Lb8kDVIYiYlQttEa2pYqzCZLZ9t0whQkGIoKSmW1ivrOfJhGOf2bzIMrm95hYek9a/s4fqcusNEA9SgC0f+dAV7YcHzsZXGDoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ozLXm58wmg8LZokSvMcRTCiaZ0h+PdSqkN6X2ONwag=;
 b=eq2wTDBRGzScXq9taoTh8xivf3eaquSrEg4zZddRmPSEwK7hnbBxft0rxjlQa40o5v1jWFb45lrFg0pgDGh9aX/Z9rv0+fZYh57J51O1Eew5A6VjEmetQ02FueAaeSfklxXyW80zZk8UAm+Q1Nu3CJUajC0u8M8Yn4dBZnHW/zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2405.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:84::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 05:34:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 05:34:32 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 1/4] rust: add projection infrastructure
Date: Sat, 14 Feb 2026 13:33:38 +0800
Message-ID: <20260214053344.1994776-2-gary@garyguo.net>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260214053344.1994776-1-gary@garyguo.net>
References: <20260214053344.1994776-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2405:EE_
X-MS-Office365-Filtering-Correlation-Id: 917d1b89-d2dd-45a5-5623-08de6b8aba9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|7142099003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KQ9YGtalF2cKSz2affJJ2cc6G2aeXaTu7DYlJa5y2jcy4tffZVs2nXgZsaQr?=
 =?us-ascii?Q?yGC4W6vy/iaTxTXa+CHt6nde5MjSWaFO64XTe/tKol3FY184kF6iR9wwRwlw?=
 =?us-ascii?Q?C1HZmQJJTrv7zI6CSwCETs/EppfHRQlZd7RScayWDXUMTM0+0KXZhtOpXWcU?=
 =?us-ascii?Q?zS7C7Z2QVapCN73tlivgrE8eZPofbit6mMt2QZxWI3eDzJlmDUhvXUf+CZdW?=
 =?us-ascii?Q?gW6fnbQE0Q2sQWDvQl2DyBN3vyGyiWASWnQu67XwMBKkTT0Jp0ffC3X7RFy0?=
 =?us-ascii?Q?WJIb/DbrSry79r8dc/5tqRQ6UMxsa9FNi6MGwp1hhvn6Wk/TTGql84/+TR23?=
 =?us-ascii?Q?2e3Az6Hckyd1OGvPpJXSnb5BQ2mhvZt+LpcCJ6kcfO9mbyqrz2XNFeDXd3fV?=
 =?us-ascii?Q?rJxtlFmjy8EJbFNoZdOTi18SJ0xznkdc/yJK4uwtSOWhNxVr6PiQZXHorFHj?=
 =?us-ascii?Q?kA8SnpB0AkxJHGXgm1fWttUsNL/okFNFo4wr87irmQuVxbp1eIACr/pKwiig?=
 =?us-ascii?Q?/0IG3MUI3ltteQNvviLtTWycQ0o3mFetqfg3dCGQtvYNmCITvf8FKe3UZF2r?=
 =?us-ascii?Q?+BYnBzkSp0UinW3YE1tjxfbh2Pq5FzJi7TmXmhrf0fpBzfwgvsGXMcOinmea?=
 =?us-ascii?Q?GKfMWbBfrUEfTdxaWG3ZjzxCiwWq64S1kG/WB+NuvuLd6D/SYLQjn3nxUxT0?=
 =?us-ascii?Q?SGdCuR4oVlBo2Cc+TMgLliHTtRYog8Aou5f5j1L79GA4x6WXD80sm9nis/CD?=
 =?us-ascii?Q?Bzj6AJ8NnJXQU1gVDM0fSiaFXdlfIikD0eYX8Z5rRvo3n5QMSwImyN6GCLLy?=
 =?us-ascii?Q?3zDSwco4xK2T5ql9X948VbYiZikRvVGktYIQTtsYXITMxmzJpUFyjN5+rzHw?=
 =?us-ascii?Q?a7NgnOYStDMMzFSHhBehLho5QH5RqVz3VHElY0odC0QV8TVsGJs3EEwoVqe4?=
 =?us-ascii?Q?jEJiBCFJoZCJV5LwhgefOPSx+rCHMwDmN9N87Rf2cUszXwkCNghL4JLQ0n1w?=
 =?us-ascii?Q?el/BqeUdh1n2ywFpDV4+xI+D3rosvsducp4+9SZC2TeS6OAFAha2gfzq1uf1?=
 =?us-ascii?Q?kbSh58w0fosNOKUpcpfCo00BDQOc+jDvM6mhmbGHjeGGRfteAePDEbrSVkIE?=
 =?us-ascii?Q?UWP6wP/BsfoElTD0IlGshvgDDlT+CyKaTOGFSP5HOmMkIBkrsI4UzyOYOKJk?=
 =?us-ascii?Q?ZPOQyeZffWLy8F01Si29NPfMiOGZnpwkb4Wpek8TiU4jKLR1fKVfzyTHn/Fj?=
 =?us-ascii?Q?Xtl/kluGxNIElvUKrGO0lR7bvHWJ+C3FRH/QOx/XLEYvgn5rfqZiex3rXvIG?=
 =?us-ascii?Q?EgnH3wJUEBCD6MMXKkShyYclRn2Mz8GqIsCDW6Zio5FeKcQwMXwHwzYMeez0?=
 =?us-ascii?Q?M+dbTEML8XT03RZLcpEeEpJMadzAGLC/4WtmkWVVw+U1GTNaJj3l/mqkdi6h?=
 =?us-ascii?Q?vGIUbqBg17u6l0bQZVCtz3UZaE4h1z2ANnn7ijAhEphpCzTSiBrPaxzArnf+?=
 =?us-ascii?Q?sS3xQXHSvSsvGYKwNk5xuRMA0yqitf0/eFCdhakWxnml0AP6e0ZEPOu9wRmL?=
 =?us-ascii?Q?19Wcfe0c1ikHXy2piQqmmRZCN1PCboaaDb9N2BCW8HPiNYJZCfz82jTH/Ykx?=
 =?us-ascii?Q?bQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(7142099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M5nFccd0v/4WLbe3yu8NUyDYM1cG0y9CNzeu1DzFcvN+gFCNtgdSTPB5zZPT?=
 =?us-ascii?Q?rGoKklw7l6iGbs24IlfZvsanzxq5mmeccp9H1RLJcQDQEJ9Tz5JX56g41ADB?=
 =?us-ascii?Q?LGV0qUub+dwHE/QoFwFGCR4zLr9TuEviwKZonQ/TAUlHw4XYsoKciA6ab9Dx?=
 =?us-ascii?Q?vC2fA74XOP09PTuepQM6TuLkg3WEEEko9N471gVNZo+NAA5Kvfgg3ZjdqxKs?=
 =?us-ascii?Q?eZLcYNbtOVs9nP4pVKX+teI28QppZZiL8L5v0MjgXG5SSDAh0Q5L2qbj5qwO?=
 =?us-ascii?Q?QJ81GGCpjwYnKVu8Cx8cjn/Blf0AGXhAuD8M2cv5EWPWibx7omjkuacmy4YA?=
 =?us-ascii?Q?GGeND96aucz45Sp22MQ/fhSoU6VtSamJkW95A0F41vNiogTLhvL89buAhcQV?=
 =?us-ascii?Q?8NzHhVxsAXJSOYbOrTqkA1iUY6eN2YrqIjxtzm503zdrGitL/553wayiL8B0?=
 =?us-ascii?Q?yyfgec3W3vHfv4JPbDItKOw392y3tVvnSCsY7sZOd2X3bMVM+M3PuDY171bd?=
 =?us-ascii?Q?kFSWhIHB57A7quwe0nwvv2HicCoh7mhy3b3e4B8gxJBcyOFPtVhW5qM4vknd?=
 =?us-ascii?Q?EkRtPoj1XSm0nsl54JHp2AVNuYEABZUjgtPK5Z9KbDhghTI+bbcUjmWt/xPl?=
 =?us-ascii?Q?j+uL4EWQ4XGdDLCu93rhJ/JwlKWrfHFmwXNlK2KVNtG1SG0vbiDooDJ65xla?=
 =?us-ascii?Q?b9PILGymsZgi1irAxBJJ+ceqvYUywCW/DjmsRI1oS8X4CAlC6mEs/5AqrhpK?=
 =?us-ascii?Q?SfJxZV7miYKCqXiBxhvO/ZaRlIWHcjm14gny0s4OhWIXIRgbn+IbNAzwG3lQ?=
 =?us-ascii?Q?NhXJ1L6i5HGxX8/xcmtIy9iYi6CmHXcz/aBFRr3P+lpcRWdyz3+vPUkwPXbh?=
 =?us-ascii?Q?bNKE6+4Kwkzso0IDMfFjUlv3ytT1GTMTGJbOSXvcgGMaa8jrtLxICLcNMb3S?=
 =?us-ascii?Q?IBvZfATGXDdakj9Dc87GapxAr/+QaIlkmpRqf4kF8mG4OO1Mj6Pu+kj/Nbm6?=
 =?us-ascii?Q?ygOUD11dicfMCe3ts3WTfrT8fdAnUG7eoOd3zVz6mE4hoJI2scphnFDxTHYW?=
 =?us-ascii?Q?nj+Yvt+tesTuKF0pk5fKt5ujVNNUVoDno/3KNU4K6uvPoHDcT2SrEbLSAYPX?=
 =?us-ascii?Q?MywAdAWje8AY9nuwwVUcRc+O5ZfWJPgXBYwp3f1Z6BDPEAyJcv7Dk+I9VAyc?=
 =?us-ascii?Q?/urVHE7q0ITZYjsg02lntnRmCxRuYYWdOzFvVY78xf0+MV5XgS2snO2KuMLs?=
 =?us-ascii?Q?LywkZ5oyMAcuoJq2RnOgOfPkmfmvgeJEcDxARgnHD/33rpjwb944Bvv8U78l?=
 =?us-ascii?Q?5v0M/vfFxToDeUw5bvy5HViSLTw4OPn706OIw1wSny+w9WZEZqECKSKpOy7n?=
 =?us-ascii?Q?WeAu/9Pa7mW++Pm9FsSk8NC/WHzaQxqGcEhlYeSTg1g6difMMZ6SsAK6MQ69?=
 =?us-ascii?Q?fvQqkmnisQyK48wMwUhnH4kzmg6jMBXo+1rNt7M4kPhwcG/QKEarIExIqJan?=
 =?us-ascii?Q?SYjyakKO6/ZubzObDhNdsd46a0NvTMtXkfsGGQ4szuJDPOFxGe+amF/KV2nr?=
 =?us-ascii?Q?HMY6yZ5tMEXTvbxSg1+ayPQcUqcLsTg27P3JGp9JZdnSjMDrOhJ55TyJCYo3?=
 =?us-ascii?Q?tTcFba4PnrLxWOc8olU2oD1EBg/I0O96v8WWcG3Y8X8XHofAe3FuzbpKqDTJ?=
 =?us-ascii?Q?uNzriacTdzuxuyslVmZYrhlhMltE0jXwlgxZGWw4jM3XxbVrnpuJxgXqkWwr?=
 =?us-ascii?Q?BM+rzLdOuM+BimPVsDMwM9gemPQB59+kV6ieQEFQLFb6DguPR41kikLQInVM?=
X-MS-Exchange-AntiSpam-MessageData-1: DPUWZxTBcVnFbA==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 917d1b89-d2dd-45a5-5623-08de6b8aba9b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 05:34:31.9494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSt28Sa1rITuH+oa2g3LFqLRATGkMfUbGQ/+wRd85cAhyVl3n87Su6qFcFCF3GWxrsgw978HDQPcFa7HRYkTxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2405
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-11310-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 09B9413B225
X-Rspamd-Action: no action

Add a generic infrastructure for performing field and index projections on
raw pointers. This will form the basis of performing I/O projections.

Pointers manipulations are intentionally using the safe wrapping variants
instead of the unsafe variants, as the latter requires pointers to be
inside an allocation which is not necessarily true for I/O pointers.

This projection macro protects against rogue `Deref` implementation, which
can causes the projected pointer to be outside the bounds of starting
pointer. This is extremely unlikely and Rust has a lint to catch this, but
is unsoundness regardless. The protection works by inducing type inference
ambiguity when `Deref` is implemented.

The projection macro supports both fallible and infallible index
projections. These are described in detail inside the documentation.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/lib.rs        |   5 +
 rust/kernel/projection.rs | 269 ++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.build    |   4 +-
 3 files changed, 277 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/projection.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..50866b481bdb 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -20,6 +20,7 @@
 #![feature(generic_nonzero)]
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
+#![feature(slice_ptr_len)]
 //
 // Stable since Rust 1.80.0.
 #![feature(slice_flatten)]
@@ -37,6 +38,9 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// Stable since Rust 1.84.0.
+#![feature(strict_provenance)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
@@ -130,6 +134,7 @@
 pub mod prelude;
 pub mod print;
 pub mod processor;
+pub mod projection;
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
diff --git a/rust/kernel/projection.rs b/rust/kernel/projection.rs
new file mode 100644
index 000000000000..200d116c39e2
--- /dev/null
+++ b/rust/kernel/projection.rs
@@ -0,0 +1,269 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Infrastructure for handling projections.
+
+use core::{
+    mem::MaybeUninit,
+    ops::Deref, //
+};
+
+use crate::{
+    build_error,
+    error::{
+        code::ERANGE,
+        Error, //
+    }, //
+};
+
+/// Error raised when a projection is attempted on array or slices out of bounds.
+pub struct OutOfBound;
+
+impl From<OutOfBound> for Error {
+    #[inline(always)]
+    fn from(_: OutOfBound) -> Self {
+        ERANGE
+    }
+}
+
+/// A helper trait to perform index projection.
+///
+/// This is similar to `core::slice::SliceIndex`, but operate on raw pointers safely and fallibly.
+///
+/// # Safety
+///
+/// `get` must return a pointer in bounds of the provided pointer.
+#[doc(hidden)]
+pub unsafe trait ProjectIndex<T: ?Sized>: Sized {
+    type Output: ?Sized;
+
+    /// Returns an index-projected pointer, if in bounds.
+    fn get(self, slice: *mut T) -> Option<*mut Self::Output>;
+
+    /// Returns an index-projected pointer; fail the build if it cannot be proved to be in bounds.
+    #[inline(always)]
+    fn index(self, slice: *mut T) -> *mut Self::Output {
+        Self::get(self, slice).unwrap_or_else(|| build_error!())
+    }
+}
+
+// Forward array impl to slice impl.
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T, I, const N: usize> ProjectIndex<[T; N]> for I
+where
+    I: ProjectIndex<[T]>,
+{
+    type Output = <I as ProjectIndex<[T]>>::Output;
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T; N]) -> Option<*mut Self::Output> {
+        <I as ProjectIndex<[T]>>::get(self, slice)
+    }
+
+    #[inline(always)]
+    fn index(self, slice: *mut [T; N]) -> *mut Self::Output {
+        <I as ProjectIndex<[T]>>::index(self, slice)
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for usize {
+    type Output = T;
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut T> {
+        if self > slice.len() {
+            None
+        } else {
+            Some(slice.cast::<T>().wrapping_add(self))
+        }
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::Range<usize> {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        let new_len = self.end.checked_sub(self.start)?;
+        if self.end > slice.len() {
+            return None;
+        }
+        Some(core::ptr::slice_from_raw_parts_mut(
+            slice.cast::<T>().wrapping_add(self.start),
+            new_len,
+        ))
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeTo<usize> {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        (0..self.end).get(slice)
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeFrom<usize> {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        (self.start..slice.len()).get(slice)
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeFull {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        Some(slice)
+    }
+}
+
+/// A helper trait to perform field projection.
+///
+/// This trait has a `DEREF` generic parameter so it can be implemented twice for types that
+/// implement `Deref`. This will cause an ambiguity error and thus block `Deref` types being used
+/// as base of projection, as they can inject unsoundness.
+///
+/// # Safety
+///
+/// `proj` should invoke `f` with valid allocation, as documentation described.
+#[doc(hidden)]
+pub unsafe trait ProjectField<const DEREF: bool> {
+    /// Project a pointer to a type to a pointer of a field.
+    ///
+    /// `f` is always invoked with valid allocation so it can safely obtain raw pointers to fields
+    /// using `&raw mut`.
+    ///
+    /// This is needed because `base` might not point to a valid allocation, while `&raw mut`
+    /// requires pointers to be in bounds of a valid allocation.
+    ///
+    /// # Safety
+    ///
+    /// `f` must returns a pointer in bounds of the provided pointer.
+    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut F) -> *mut F;
+}
+
+// SAFETY: `proj` invokes `f` with valid allocation.
+unsafe impl<T> ProjectField<false> for T {
+    #[inline(always)]
+    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
+        // Create a valid allocation to start projection, as `base` is not necessarily so.
+        let mut place = MaybeUninit::uninit();
+        let place_base = place.as_mut_ptr();
+        let field = f(place_base);
+        // SAFETY: `field` is in bounds from `base` per safety requirement.
+        let offset = unsafe { field.byte_offset_from(place_base) };
+        base.wrapping_byte_offset(offset).cast()
+    }
+}
+
+// SAFETY: vacuously satisfied.
+unsafe impl<T: Deref> ProjectField<true> for T {
+    #[inline(always)]
+    unsafe fn proj<F>(_: *mut Self, _: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
+        build_error!("this function is a guard against `Deref` impl and is never invoked");
+    }
+}
+
+/// Create a projection from a raw pointer.
+///
+/// Supported projections include field projections and index projections.
+/// It is not allowed to project into types that implement custom `Deref` or `Index`.
+///
+/// The macro has basic syntax of `kernel::project_pointer!(ptr, projection)`, where `ptr` is an
+/// expression that evaluates to a raw pointer which serves as the base of projection. `projection`
+/// can be a projection expression of form `.field` (normally identifer, or numeral in case of
+/// tuple structs) or of form `[index]`.
+///
+/// If mutable pointer is needed, the macro input can be prefixed with `mut` keyword, i.e.
+/// `kernel::project_pointer!(mut ptr, projection)`. By default, a const pointer is created.
+///
+/// `project_pointer!` macro can perform both fallible indexing and build-time checked indexing.
+/// `[index]` form performs build-time bounds checking; if compiler fails to prove `[index]` is in
+/// bounds, compilation will fail. `[index]?` can be used to perform runtime bounds checking;
+/// `OutOfBound` error is raised via `?` if the index is out of bounds.
+///
+/// # Examples
+///
+/// Field projections are performed with `.field_name`:
+/// ```
+/// struct MyStruct { field: u32, }
+/// let ptr: *const MyStruct = core::ptr::dangling();
+/// let field_ptr: *const u32 = kernel::project_pointer!(ptr, .field);
+///
+/// struct MyTupleStruct(u32, u32);
+/// let ptr: *const MyTupleStruct = core::ptr::dangling();
+/// let field_ptr: *const u32 = kernel::project_pointer!(ptr, .1);
+/// ```
+///
+/// Index projections are performed with `[index]`:
+/// ```
+/// let ptr: *const [u8; 32] = core::ptr::dangling();
+/// let field_ptr: *const u8 = kernel::project_pointer!(ptr, [1]);
+/// // This will fail the build.
+/// // kernel::project_pointer!(ptr, [128]);
+/// // This will raise an `OutOfBound` error (which is convertable to `ERANGE`).
+/// // kernel::project_pointer!(ptr, [128]?);
+/// ```
+///
+/// If you need to match on the error instead of propagate, put the invocation inside a closure:
+/// ```
+/// let ptr: *const [u8; 32] = core::ptr::dangling();
+/// let field_ptr: Result<*const u8> = (|| -> Result<_> {
+///     Ok(kernel::project_pointer!(ptr, [128]?))
+/// })();
+/// assert!(field_ptr.is_err());
+/// ```
+///
+/// For mutable pointers, put `mut` as the first token in macro invocation.
+/// ```
+/// let ptr: *mut [(u8, u16); 32] = core::ptr::dangling_mut();
+/// let field_ptr: *mut u16 = kernel::project_pointer!(mut ptr, [1].1);
+/// ```
+#[macro_export]
+macro_rules! project_pointer {
+    (@gen $ptr:ident, ) => {};
+    // Field projection. `$field` needs to be `tt` to support tuple index like `.0`.
+    (@gen $ptr:ident, .$field:tt $($rest:tt)*) => {
+        // SAFETY: the provided closure always return in bounds pointer.
+        let $ptr = unsafe {
+            $crate::projection::ProjectField::proj($ptr, #[inline(always)] |ptr| {
+                // SAFETY: `$field` is in bounds, and no implicit `Deref` is possible (if the
+                // type implements `Deref`, Rust cannot infer the generic parameter `DEREF`).
+                &raw mut (*ptr).$field
+            })
+        };
+        $crate::project_pointer!(@gen $ptr, $($rest)*)
+    };
+    // Fallible index projection.
+    (@gen $ptr:ident, [$index:expr]? $($rest:tt)*) => {
+        let $ptr = $crate::projection::ProjectIndex::get($index, $ptr)
+            .ok_or($crate::projection::OutOfBound)?;
+        $crate::project_pointer!(@gen $ptr, $($rest)*)
+    };
+    // Build-time checked index projection.
+    (@gen $ptr:ident, [$index:expr] $($rest:tt)*) => {
+        let $ptr = $crate::projection::ProjectIndex::index($index, $ptr);
+        $crate::project_pointer!(@gen $ptr, $($rest)*)
+    };
+    (mut $ptr:expr, $($proj:tt)*) => {{
+        let ptr = $ptr;
+        $crate::project_pointer!(@gen ptr, $($proj)*);
+        ptr
+    }};
+    ($ptr:expr, $($proj:tt)*) => {{
+        let ptr = $ptr.cast_mut();
+        // We currently always project using mutable pointer, as it is not decided whether `&raw
+        // const` allows the resulting pointer to be mutated (see documentation of `addr_of!`).
+        $crate::project_pointer!(@gen ptr, $($proj)*);
+        ptr.cast_const()
+    }};
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985..3652b85be545 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -310,16 +310,18 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
+#   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
 #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
+#   - Stable since Rust 1.84.0: `feature(strict_provenance)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
-- 
2.51.2


