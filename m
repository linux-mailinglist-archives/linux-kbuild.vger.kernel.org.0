Return-Path: <linux-kbuild+bounces-10421-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 597EFCF56EB
	for <lists+linux-kbuild@lfdr.de>; Mon, 05 Jan 2026 20:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81AE93085592
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jan 2026 19:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE539299A8A;
	Mon,  5 Jan 2026 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="faqnr8QG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F11632C8;
	Mon,  5 Jan 2026 19:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767642794; cv=fail; b=WV3NbdQT7rPg/rOcU0DFwiFkLaCg6Ao5zqtJ+KCV3k/huNTF1D74JRsNqUL6mOdQUuVrDwuNC785XR6C6kEinWsY0wLpdWFvWuwIdHXk7o4sbphTSDpr+05qQJACumTyMZZkb85QjZAczolu+9/A7UDv73qNnDgwcRQyN+/FQPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767642794; c=relaxed/simple;
	bh=A8JOiklOCI4ENOpgSbeu5cZx5j89cGqdrrzsPjjc+Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NQZ3Ia1NF/Ctbn9sW1tQ7+qUkO02Z0o7YK6cIFM3SVG0s2VtD9P5gnoOL1AF+M8HwyrEUQskbqi+VI+k8+1coRIjSO+sS7XEkPDK13W/EerYi22zKnCPngbJVMyncnX8Smdaxc+2Ba0zbnpjtm4GpmwuX+NDNcyi97ENnaQDR8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=faqnr8QG; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5NmgpOoNkZseGwtKUBvb0A5+3JE0r0mlX/AIObAaCO83ldsh4TLzJAlS94t6QBAkQa+podj8FpMhO68ojot62Oua3EoSDIEUfr3AAy2UiIbyUdgOQh3OpywNYTPalSljAfCFtqis5QnoHJhLVnjAFpXJsO987/lvLf+KYof4DKgqFoASPJmxHryBG4SmZEYQkOMNix/QfOm03gCYd+b6Xqposq42CqI5JrHGGkmsNEyPOY18a+1WKqx0a9GN1R1CkyFaIB7kGuk98eRB4cb6ot8Ew9/gBxdh4MT8HLKqvfqEQm7xJwDyZwcIshJr9m9/rBM2Qxa0/CHzZ8kpDeVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zr4t/8QyQlnqFGVcCYJYhwCSuhwNHbjkktaJ4Q38Rxg=;
 b=vtYE9yRH10PmIblkYL0UKX/qWCTeJ7J9+nTqR2SgRr5K0yZHbbpVJQa0KxCNZcj78AJhHOf12VuzLyuTkLYA7E60JLkoj8ikdhTa5GVkSNOKHmYayZj5KrXeyqLcR8bqhAaHSFNCMCqFth5MDSPx1xVui0TXAGIvIGuK6n2buLd7JUhmpf/HLdw60V8JTLRjYLOyk+DqalEbFoAe0ciXn/UvCjie/0gE2gAirQLi0rBabLkLCt6vtT3t8wpUC8etlhk+n16mQKhVF3mvaiOGl5+zkmyplti+K7/Tb32nk2aHFcLsAjnczRv5w+IPdfmhV1gNe4k+JeCD9P5/GILPFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr4t/8QyQlnqFGVcCYJYhwCSuhwNHbjkktaJ4Q38Rxg=;
 b=faqnr8QGa8GewZXadx7CFCnoHZok+h5iAx5xScKMm59Y9K+PkvB6jmBzf1H/qpabc3brvPiohk229jyCpSN5i8H3DM+5rmSvkVNuGHfrbRK8UDhhLieMnEDvwuttng97Si90+Q91m+gU5gCMBVtXv6CUepDFCCzBubsnmAQnZ2AZqQcAomJxJLFDezjKOvQWbhr58bZC10retCBhoIIcF0XuhvP/MhbPXIFeYKPpeIIUPBIKx+4QRUSnNhSqVUQxCIrXBlF1eG5tIyUK66XOSUBF6KXN6vK5si6m9iiwc3u+QO2c66HIlnQEE96tob0Pbok1k3z4ltaWiFjTuFzrIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 19:53:10 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 19:53:10 +0000
Date: Mon, 5 Jan 2026 14:53:00 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>, Li Jun <jun.li@nxp.com>,
	Fugang Duan <fugang.duan@nxp.com>
Subject: Re: [PATCH 0/9] arm64: dts: imx8m*: misc update
Message-ID: <aVwWnAMqVqE7jtCy@lizhi-Precision-Tower-5810>
References: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 686c4858-1c45-4897-93dc-08de4c940d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|19092799006|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AGk+A9TnvtyQYKs08Y/X42W9nuQKG9CYAsvhwWKc7dBQjPEfc5yA5GVNtaoh?=
 =?us-ascii?Q?kKDWJQDOVV3R0Ncr6vW32NMWQuxgRsMyIM2rM6k6yln+qaINdOLa9WmZXHMJ?=
 =?us-ascii?Q?WURnMHbQXeX0f/fgZhlURqEYB7EbJOCccG1q1SnS3Gu7oi8FroQpxCKr8hEm?=
 =?us-ascii?Q?fiqgnfb14LkM5+G0+fQsiPjLzxEqrrgECoD8cKEJBqz2RvbecdCAs+V1HecB?=
 =?us-ascii?Q?+LusGIsxoQ9+dMHyRrc7UJNL3cBwrXf3+kf1eI1qilg0EZGWAt4HMnhuCIDb?=
 =?us-ascii?Q?2f6ke7j2pEQwHJIFnUgJgd1yOaVGIhhNXtEYNkaLlIFSHiIAypM4fhJ404yc?=
 =?us-ascii?Q?YnXMSnRWaII0NSZ0xTvwwQENzj2JEM3P9EUCgk2WoNi1zCArRSLmHwIZvzre?=
 =?us-ascii?Q?RF660Wk41r3QFvLexSuHldbj1wb1ltIvqYEakmew/EqakcmY9KxDCZWAEJKO?=
 =?us-ascii?Q?AzuHJTTFuQD/pdgYVI9dCQAiTHmlbBRrvtzB1r6bqKZy05/18dRVkyy08jah?=
 =?us-ascii?Q?chsHwEmpzGm2aU9X0o3Mby2bt2SfwTy+zNgFXcwy5meMjyN4pP4RdCXjIKQB?=
 =?us-ascii?Q?s/iqwPrE4qEqT3p/ViUFoy9cJj362SPkkQsLoDL/M42dvmMXGuvSjsKgtN/H?=
 =?us-ascii?Q?AvKCdrECWO6MYfVrgsOlf1wLODIhwpFfLUNpcP1xSMJYZMOBUxSaCn6YTg6Y?=
 =?us-ascii?Q?WwiTFBQtWfgYH/99gwrsPAToriFs/BbjLnBtY0RgQOlCAzpZ0YQqp6KOyI8U?=
 =?us-ascii?Q?xXzy1XYuBWgpbudK4nifFjyhPn5nPAyK9TJ2pqI+og0maZ5t973danbLsFAr?=
 =?us-ascii?Q?Gly3j2iwK1tgbQvbmcI7BjVcNHRe/od2ghHYXARBA4ELa8FLneeg+eDGqvwV?=
 =?us-ascii?Q?eQAgWaWobzeHNMMAC3NsBgr5gwtVpe4rXmTSJpcyOD/b8ZAw+FBYicnc34Xk?=
 =?us-ascii?Q?66fzYDagK8oKE+/hh5qJpT0JaCfNIX6cUdPWsGOB8v6ORAUaMvA/4Yg+axyE?=
 =?us-ascii?Q?3lIqwJEn8kzfuubeX8oHg7PlkcorjfXQiBHk4fqu5odL9EC8ZUXh1+aFGE+F?=
 =?us-ascii?Q?qv7STb3O0RXcB45xtiztnx+s4SPCr850Hz438MxcSWa4eVMh8fslQg7sgN3t?=
 =?us-ascii?Q?VFUqHVeW2F0lKTT7ZYroN2jSC3ig8aVVLJLMkhgD2rOXQgRPV0E+71M0GVgU?=
 =?us-ascii?Q?IRtJG9PApFhrtxyfDWbpbURjoF9gE1cfWMYKTy1nw9fATh3viHQ6Qa162o3R?=
 =?us-ascii?Q?ddKs+TpMeX/X/Gs2I+8u7/KjJ1u88OV4n6m76XMmO7tJrHmlrf3ej8WU7eYX?=
 =?us-ascii?Q?cl+RhBM832Pn70tLqux+YmAqn/VPLnuiBZja/48n0U6PxynUzgyk4ovEftMf?=
 =?us-ascii?Q?IEV6uBbnEeLGgNB5nbbMRmiaXq7Bk6zfsF/hzg25EGEzNopVujto4gUFIV2I?=
 =?us-ascii?Q?KSWhTk6lSY768nklqg4s3fN8w2lVVn6VdEiRMiTS94nWL6Waazi5FZ9WisM9?=
 =?us-ascii?Q?IKMqupWSQ1QYjQchqrPbqnOaLYnqBdYTooGi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(19092799006)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ALyJipQVSWXH0kMiS7gEeVSdYWz5pJqdTXczoQ2TDFv6kXYyUb1xev9YayHH?=
 =?us-ascii?Q?OiteRAf9swYNGkTX2P3u9qtkClfm4sB5njuqUZvcMMHhnNCvpwePhMv3YBjr?=
 =?us-ascii?Q?e9alp2iFV34le4WH36hP1ajhzIfPPEBDWNFo7Yre8TsVtOU0t2BEImnctm5o?=
 =?us-ascii?Q?5l2FngxipaDzszQDCUcGXimKwE5w2QdRTVzvShoF/yiDePgpFH7XIDKlYInE?=
 =?us-ascii?Q?xrhoUnTZYKiyg0oOyP07kX0KptifbGqubW+jfec1R5g189KZ3GvAVcbq4POI?=
 =?us-ascii?Q?/Z3t5WpTRY0IoNAqAisXKBaeFARGiaxUF+ypzE2LduVJRXnOunuZXC1FupG9?=
 =?us-ascii?Q?6+QpBLD1JfVgWaJGUsmZ/Fz3pqEkqFHciXdKm/98uKyJyWNPGTJy1QK1sB1T?=
 =?us-ascii?Q?8DiLnQ+txX8Et2y1ktaqIZGKxVetZcRD4odEmuQ3ypv1ekTs0zTmGezelk1I?=
 =?us-ascii?Q?uS9gSZnpH0mfgqzVZcdIRM0J7fWe3bHGzjbKR/KqXchrOJ0X5xTmnFWh5Sv4?=
 =?us-ascii?Q?rDvKFuLtWZ/NZa2x4sCLqv3hidf7t4WWy3NPO9rkPzmFsjDY2OcZtGLQYY7O?=
 =?us-ascii?Q?QFnJTjUpQUOSpbK5Nz9SOcVQ4jnFHG/MECUWQwniMiuRacET0x/o6Q8T8+El?=
 =?us-ascii?Q?iH58RAGdip0t42+shJWhJvh0wRdoPAba5SqLg1BOcnTbewUqC55CZ0d9gBLQ?=
 =?us-ascii?Q?cdAiqKvm3fzzDi/bd6Ks1VKcn+UfTzqJwy+qDB7kfRxmZQnL26bIhgIRTXjE?=
 =?us-ascii?Q?WGuJlNYTTZ30PKEP6QjrVsBqhXEjwOuZSz1981WNToLlpjn4rMFj3+FQETBX?=
 =?us-ascii?Q?w1ZUQ+Y1wLqHGa3HGH5yq4zod1JtAghPN9GY6uI8iJq0AWHOPZF3s7AYqUbA?=
 =?us-ascii?Q?eWDIHylPI1iBBoJeIqTIxh2X/l6VMokfiX/SMwm0enTjarXMDzXDDPqBSLZ6?=
 =?us-ascii?Q?aP4/u8C275Z2eepTHvLtsL3s+w0wU5MPBY+lzi+Zp7aVb8rd8sx7mMpUrRvK?=
 =?us-ascii?Q?8XDX6jAMNXYzHQDL8K8ifO2zKblHXB0Mge/RxBdwYmOb2CsyBv21COjsD2la?=
 =?us-ascii?Q?J+57UaEe1XquZ1+dKXtXQtrLGNyzdRM9PWyQiNocylgJlRcM8PBBV/PUs9bN?=
 =?us-ascii?Q?I1YJ5jdSUINyykv1ksNkAgQEt4G8iw/qjiWxm4WWOo4zHTMrkRJyIk/QT6Kh?=
 =?us-ascii?Q?MPVGwPv4J/FvmwxryOEndvbZBD4c0aBbgGURz2lFUowZX4wbp9Y5tMQ1qdvc?=
 =?us-ascii?Q?DA5uTERNE6xtx7J+zVYJIyk5bO97fFnPMNB+n/uoGyVTutdXP87fB2/f+bT2?=
 =?us-ascii?Q?lGBjNuj2RKpZ+OVbwDakR0+bZSydqXZbh+BRLoZooCQXk0spX9bQagVeZL/G?=
 =?us-ascii?Q?PrB031BgIJ6WMza6hp+HswV5W/kFmcx+pxN9vy6z10u2JigDj8yly2zzhW3l?=
 =?us-ascii?Q?x6w7eKeTWYjMo1q/W6fCqKcBbPj/SvRlj2p0dvQH3CGLgxO6GnJhAjy0aAeT?=
 =?us-ascii?Q?Zsf3c0n3gjy0sb1VTtBYnIpdGtzJq/IS7FCCQ/H3IX+LK+T9Rb+dq1Co/dhs?=
 =?us-ascii?Q?07BlnZ0PnHwvDoZnzNzL1g93yseCeAY3pSI8RZ6Z8XwwLr/hV50Ri0GIe5Uj?=
 =?us-ascii?Q?Tj9kHAZhtb4Dr3j4G3YbM0N7RrrJ8CW2AYIXd4VhT2tWg1EZwsFVZxJXNEk9?=
 =?us-ascii?Q?PIHOqQ6orF1TNVRu5DGKYDJkFVksflppT5ER84fvsHRWkn6y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686c4858-1c45-4897-93dc-08de4c940d87
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 19:53:10.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMFkgsii9ZwERZUTLque7au5S2UxBKJUwLwKxesrtOZb84HVoZgPGJBr+JXOnUkGtFFMr0nA1Xf7qjjk8LdKeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

On Mon, Nov 10, 2025 at 03:54:40PM -0500, Frank Li wrote:
> Some misc update for imx8m* dts
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (2):
>       arm64: dts: imx8mm-evk: replace space with tab
>       arm64: dts: imx8mp-evk: replace space with tab
>
> Fugang Duan (1):
>       arm64: dts: imx8mm-evk: add uart3 port
>
> Li Jun (2):
>       arm64: dts: imx8mm-evk: add wakeup-source for usb phy
>       arm64: dts: imx8mn: add wakeup-source for usb phy
>
> Shengjiu Wang (1):
>       arm64: dts: imx8mm-evk: correct the spdif compatible string
>
> Sherry Sun (3):
>       arm64: dts: imx8mm-evk: add uart1 and bluetooth node
>       arm64: dts: imx8mn-evk: add bluetooth dts node
>       arm64: dts: imx8mp-evk: add bluetooth dts node
>
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 78 ++++++++++++++++++++-------
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  4 +-
>  arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi |  4 ++
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  1 +
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 32 ++++++-----
>  5 files changed, 85 insertions(+), 34 deletions(-)
> ---

Shawn:

	Can you help check these patches?  only patch 4 need remove "evk"
at subject, do you need me respin it?

Frank

> base-commit: b9e97ce705fb1873265ba0004041b55258d26dad
> change-id: 20251107-misc_dts-c4cc84f1ae5f
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

