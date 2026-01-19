Return-Path: <linux-kbuild+bounces-10689-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52186D3AFEC
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 17:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C18943002B88
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 16:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5DD28466D;
	Mon, 19 Jan 2026 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E/gDWaFf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F192741C0;
	Mon, 19 Jan 2026 16:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838619; cv=fail; b=kjr8h07UM2mMz/6NAwMUp/LGytmrqBp21Ro9fb5BdO7d486tjotuY26o8mUV/nFimKKGltQiO6tZJyv6PypXUu8DEa2lHaArSc1PU98RHoOyCfjqdBSw/iOx4t1O1QN7KYNN5NZQn/Y4JcioryPHUBDBPkQuoufx2uYFzsTx6Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838619; c=relaxed/simple;
	bh=GZXyx0kUDa3uJ6xkgslB6L1j4oFUDHGC3nhlAljmxP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CJlLpJgBv5KLXi/FvUMn3P/Mw44HU0Ns88f4jXz5C1iuHHZh1dRHUhmeA2ZERAXGXj/H4+1LhuMwBRF+cT09yVUjt8CerRJ5756SSk8sOt0sdR1zBK7bLAnsf4/FEEmwG8AcyWAYfEz3tNxTVirna2ItglTcsA3/8vw2fMz0xRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E/gDWaFf; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYCrDIjwrHHBY8Xugu8afdrCN5UMj0uk2TKF2U+sGXDLr1MxTfRzC6lrvQ54kiYJw1Hbau+LKRt1YAuFhE3ugPPn0OhYe/BttJhw1T+e8L+zdjpeMI24lSOe4DZv4vwhRsGo4w+PwhVc3WdjkX2ceqZL7IuzS35fRyxYGTwL2tAwXGRJwDz3srymnlqEHXOax+93g1/9PX0R5sA4+J/B9TNavhI9jUB6lNME5HVIvVgDsB+ax74pMaf98ra5ndODjGssXyiCMWoAvMj+xHqQdD844P9SClnUf/kc/odzTmMLdjyaGDKwxQ5sCP/j9RmlIoA2iMP+gQTGiKQUMpgrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEqY0N6WYPJMl9nuxkhujX3NSG6fZCAWI9goIVkrWCg=;
 b=b2eE24eJ2YS4xuGPJ+G8+SSuuzbABwjp5pnqPTKiTTcNwHPXr1YH1E1W63iRXiaUIig5sagqLmZAx6iHQOg25dgHFrqcAkuya9qe6bmL7jKU6FclmtmUGKoavKM+e1fGhGRo4YSMdQPpHoO6eM4ff5dcWa4PWMz0sVYwUeR+kncEFlb2BzJDFwpSFGjx++GMICKERihzqZu4xJ7OAYvKBRJ9dxowdhfyWwrgAtXG5SJscfHG9ni26fmqRBkaGteOqfQEh5j7YeZaXSYzZ66FJpyYY3o34vfmuPbSa5RCAZazYgK05MyidwAobs+nxZv/UGQ6E+dByGwfUrpETfTZ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEqY0N6WYPJMl9nuxkhujX3NSG6fZCAWI9goIVkrWCg=;
 b=E/gDWaFfppVIflbqMfBKlOQQMDZkiFa49Q9G9Q8zdo9mPU1bZEq4R6crGbPDIye8DtSNpaMBhnp3vpt4Y4xtymJbu8GEG/g7vwCexlXlBsa+xAdXGznhCY4odN0C4X7KhxllIlnFKZLfDgICjA9Gtvwbn5eO5MRN6z1YgSVgAz1J8mqq3ULFK59C3GYGf8fSdIRczkHH3GvFRSlLD/3N54Ibnth8173D3b8NECmOcdGpnGyKdYg5FMJRs5Gc6krFw9ayySdFjB8SzZ2phT+qrken1W5M3wV9VhF5/P0OKMfCkKhU5KGVKk4u22FB4D5CrtGBrcwxecvTj+fDgQoZuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by AS5PR04MB9826.eurprd04.prod.outlook.com (2603:10a6:20b:673::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 16:03:34 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 16:03:34 +0000
Date: Mon, 19 Jan 2026 11:03:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Schier <nsc@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH v2 4/9] arm64: dts: imx8mm: add wakeup-source for usb phy
Message-ID: <aW5VzffP2UNAvy51@lizhi-Precision-Tower-5810>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-4-0f319c7e9b55@nxp.com>
 <20260118172208.h7yts2yuf2lkhd4n@pengutronix.de>
 <20260118172946.zsqokjhp76trijq3@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118172946.zsqokjhp76trijq3@pengutronix.de>
X-ClientProxiedBy: SJ0PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::30) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|AS5PR04MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: ec321b45-f4d4-4243-2ba2-08de57744c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J/VSE5KiKOtD226qRZiNy+wy3qOKQZHPXO+95Cb1uv8igxN/oByEJ6mhhkpL?=
 =?us-ascii?Q?J1JJVoYPNz6jKLyig+qY0ueMafanxUVbfsqWArT/cj76ET0eyHjW8S32IhB3?=
 =?us-ascii?Q?zAtzy9xT04ZL/rcF8g/LtJrx5gHAPTd3ryMy7BrwqZHwJ5/TvjGG+bhJOdoR?=
 =?us-ascii?Q?2Y4AsCwISo1DCyl/5lIK4CwWwPcLiaxmCud+p2OGW6Q4sh/RxqrV15tJg4zo?=
 =?us-ascii?Q?ajffcoH2MPJrfkA5HoW5hORMTyx3T3LM2RPXXSAE0JH92nMzEZoX0Jp8ztmQ?=
 =?us-ascii?Q?eWWRYPHBAj1Z9lpt5OJ6Y2Rz/0y+NW6y3CTWEgnvFtMkeIMYTaCHzLGZz9AI?=
 =?us-ascii?Q?U2eL9I6e7LdUjxxbqOPhownjXRC0NuZXHarGpGkzwNuMCqCS347u2R9nCugj?=
 =?us-ascii?Q?x/CPmm/JcaZRMPiZ2YEn6OrDp8YdcZkHTyEYqJyf0I0wNB6D1pRwq+MmR4vk?=
 =?us-ascii?Q?YRYJ1SvKdE28f13pycK+EYckBC8L67n+uiXkvMS3/MsLMNolIbH1YimMyd6u?=
 =?us-ascii?Q?fQZqrAYQClIzx8vkY4CbT7j7VIdIpW1MwJRqH/shUKLqVluOLGm8vLY7dc28?=
 =?us-ascii?Q?oXvUao9RxFLakWyLcrCTw/VtdpyZkzPzSuoksLafZZEge1fcC+u3VYALkxIX?=
 =?us-ascii?Q?Y3mfm+iZwQYVcmwXET34y9n9IVaX4hg9ISaAiPl2FV3pBamfS1XqP4ztIwNb?=
 =?us-ascii?Q?V6W8/vWjVa23WUGWgGZB7oMvlqj4Uj8gOU4CfYCOWKpANU+GSHTK+a62wwX1?=
 =?us-ascii?Q?egqIX7E5QY1ShllDVDRxaZN735B/1DnClkAJJYmTi8RyMRM0OSzbbLnqnXRv?=
 =?us-ascii?Q?w95YTlz+ONKajkgrgG6u4FPIfkf3W1fx+2ROpgttsmAR5QSKZp9ZliOa2XPX?=
 =?us-ascii?Q?V2c4M9B1EWI1H6yU7/Q4GYeZzQfr79wPdapFsyQfpGETvh5lcxWzVl1uj/2q?=
 =?us-ascii?Q?FEEIhbNLFDPylpDKldOgeNnlQZH2qi6YXpByYMhEuMV6A1EUJNRZTrZJYpuQ?=
 =?us-ascii?Q?jDX2dKOSS8zQ+kkpKoBqxgDsCykXydh03jELlqt+uuzFCUOBjvKuVEz4ewF6?=
 =?us-ascii?Q?zoMFcvsjWeccJmuB42sRpJEeYUUi+N5y80CxUnpCSEV/CkV5LXcDixcGIwvn?=
 =?us-ascii?Q?Kqi2OQKV5RKTeUJlBZNaVGQm/C/eF/GCiE8nWYkyMDkUOAOjKR8QHgq4O6Z2?=
 =?us-ascii?Q?CraEIFmamrprVXiUpJshUkM2FnUEr7bpM81UN1cx/H/X3+F6n1T01tWSZd/J?=
 =?us-ascii?Q?rIz1AfI8hI0WHTTX5XMfBrIBxUYEDdS6jK/c06lpTqiuG0XhTLEpGjPdGHlc?=
 =?us-ascii?Q?ayXt0ouH16DSUqPGSwQU791QoRGPBiqTSWnfunb4U3YdMO93ac6wF35LWXN9?=
 =?us-ascii?Q?DZybLFmQStNz5Lfn3k7QNzwSkOers4weKqiBL4+wSCr3C7o7xu2AbTbiQHTi?=
 =?us-ascii?Q?sAGJVwfOGqztXLe5P4UiLIIIh/GLuS3qVIr1ARHDsLh4UqUXU4XQr0H2nVgm?=
 =?us-ascii?Q?nGdSbgcjbwmZTskH2IxE6vL66oSxx5tGzmK7iKdGI/tr6yR2RGbk7JDZsegJ?=
 =?us-ascii?Q?YGCGWMxwrhRkQJgQjZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wKPEnWt5fVl26ooJ+4Y4AmYMiYx4bIl2kwI6fTKYBDgFWhoNYri8omr5TWEl?=
 =?us-ascii?Q?xKtXVXBF6VEBx7gLjAL1p6Varr1kwvYfuWvJorssF0+yurkDHI5F3f3C8rs3?=
 =?us-ascii?Q?5U7/RKr2fWqpghitwJ3omco36ZknaZz5Dxtyj9ddhwsjB5fdJcDPJb4NVduN?=
 =?us-ascii?Q?QXGtCSZaPj0SX/hhyY1V4yvuqlPtScYDDsGnVLwb3i8BUsiBTcuWfthaya3+?=
 =?us-ascii?Q?g7/HHiuk0e4yGrW4se60aenWWRc7fPPV9VAK53TWoO2dy+8HidvdX9GriiNv?=
 =?us-ascii?Q?MtglVcdEZKe92ZSzYcQd9YwO/VCCax0vaQUySEQFI0bba0Fpz39WI5vcUtgE?=
 =?us-ascii?Q?dT0ATMSj43laCawKSE6Mz5JhS05jbibSuAAe7LE2ueQ3mynGT5CCTz90PYRh?=
 =?us-ascii?Q?JT/hMxhj2vUoTMHIfpuEx20DJmfWH7uc2GlfTvb/UXvrCWt36mjbG4lWCzY7?=
 =?us-ascii?Q?PnAYHuJwLhOe3scCNmwxslG8kXysU/jFFB4GPbWS8aqTcOwUsZ6j2dH6bhxb?=
 =?us-ascii?Q?K06TZGLB1FmkJ5sf4Ivp9BriWq4d1fQ4T4MCZ2LoDxxwpZlljTfXajgHUWgw?=
 =?us-ascii?Q?pw/wRrrePAmP1A/Am/JRGE8oan9yLqe4bUesBX/uAPg7m3Hg6+zhE/gVQPjh?=
 =?us-ascii?Q?ZVuLlTUqE77iVWkByxldpYdHVxEorKP/5N+SVolnlOV73Ci/+m3UA7Ic9AMs?=
 =?us-ascii?Q?Np0Ux8hmx4ak27CmOCM0JrvDAK0B6EyQVDDcSP8waP9Lf9PdPiCbhn6VhFSM?=
 =?us-ascii?Q?OEorGzQbgO7aQ45Xp05TmK42/mTxM4QyyngLG7+TZcN+5FlqEhn3VcJtO4xa?=
 =?us-ascii?Q?FjTWvIS8R9m7zc7NLyVgnhCODVVcvMaKfbUbQx2wpCb/s1bdUPTJ4ajfoCrQ?=
 =?us-ascii?Q?HjwQicwl4nUDrY8Mqe2UDbE6OjteymtceSmqc+03NIKQk0UZ+iyWp7vWe+SY?=
 =?us-ascii?Q?TVk5MymcLleEslCYBots6aCCLcLKN6xHtCgFxBvTb9QOcTDp7IO3hExd4Uju?=
 =?us-ascii?Q?VxR0BazFGa/lIiA+YV7vUJME0mxy/GLak+lAXA56cPgOwY1OKTDdfnJVDZNp?=
 =?us-ascii?Q?P0FnIXNToqX5Bmd6XMOhLJf1poOeZZd2K7qSj592Jv8Oj0ihInRHe7OkVJr/?=
 =?us-ascii?Q?KNKtjhWSDkgU/K7XF/kK7e7OgTfza7nxUouMd+f7VpFeBn2zf4eVYA/oAgeH?=
 =?us-ascii?Q?gTQuPRi7wjNOUD1L2w14j7Va4/q0z26aFzBcZFeBWob8hvy0rJXQqu0JgLGe?=
 =?us-ascii?Q?HJSGxODcp3ScuWihEti8JnDxu0OjJh7gkuQm8+qBfy7cn9jq0NiB9HGRaxqX?=
 =?us-ascii?Q?u5m2sgFjbFJ2m0yLiiyy/uBEhvFMFbecVE7MWUiVa+eCDQBvubRKIxaaiUnO?=
 =?us-ascii?Q?g3e2NHVqrsOuOW6kMml71tapeW7ih18FnsA7Oehg1vUxgZdeyPuNZWPvsm1o?=
 =?us-ascii?Q?0cbmt5Wku+woRxM0GVmp8Yczicjys14J7VQHjGUaYmYu/aaCFHccN5PQuTZ6?=
 =?us-ascii?Q?TK4cF3NBbgGgsPkUP/ZeIuNV/y7jU0p2iFm8VGhiuyEIzTO+YuisqLlY/Z6W?=
 =?us-ascii?Q?a/cKJ3YhvPwR4biSq491tMQtD0qO5AZLWjVnutWHIwD3J+3h6RYbEj8rGcVJ?=
 =?us-ascii?Q?HSnsZqmIiFC6MNKKdbp1w3PiNilnxC/VG1hnyTYFI0fsd9Sv8GYRZlUDssEU?=
 =?us-ascii?Q?r9ue2Eli3wniOtIqI8lebvLoUKNnlJhNRWpF1YhrzhBez7h+Y1+jbmLX3VCc?=
 =?us-ascii?Q?oTJ+RLxgeQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec321b45-f4d4-4243-2ba2-08de57744c48
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:03:34.3296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKEaFcbQenvmH6+v/nAqLw3X8LYAh6MrOgJ3LPKTpoF8/3DulsFjMEuwL6LC8lmzYfR/AgWtDIOucUvQbsDbUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9826

On Sun, Jan 18, 2026 at 06:29:46PM +0100, Marco Felsch wrote:
> On 26-01-18, Marco Felsch wrote:
> > On 26-01-17, Frank Li wrote:
> > > From: Li Jun <jun.li@nxp.com>
> > >
> > > USB phy can be wakeup source to support wakeup system from USB.
> >
> > Was USB wakeup tested? That beeing said, marking the device as
> > wakeup-src is fine.
> >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>
> Just noticed that this targets the base soc.dtsi. IMHO this is board
> desicion to make and therefore belongs to the real board.dts(i) or dtso.
>
> Therefore please drop my r-b.

wakeup-source is captiblity of hardware. The user need use echo 1 > wakeup
to enable it. it is SOC's feature.

Frank

>
> Regards,
>   Marco
>
>
> --
> #gernperDu
> #CallMeByMyFirstName
>
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

