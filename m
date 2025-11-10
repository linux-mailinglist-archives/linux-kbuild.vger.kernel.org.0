Return-Path: <linux-kbuild+bounces-9537-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB71C49527
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 373FE3AE68E
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFBE2F549C;
	Mon, 10 Nov 2025 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D01ORr0k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83A02F60D6;
	Mon, 10 Nov 2025 20:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808121; cv=fail; b=KMZcxBnoRv+rCp4QuiGnPTlCvm5+uaEqvFRmGp/AS3REabNYAZXil7dOBE3Kzdnf7wLmLwE8nCwOMPxgWWIEeLh6iLAKJ31V4YSYlzA08gUCBGG4nEf9K+kz3Sp0EGYyMVVXT95N9sTL86EJcg/zrw104Kcx5QZtBSai8VH+gqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808121; c=relaxed/simple;
	bh=m2VndQm/j68vKlqAJJdpoZVDLpnf+mqcWUFN87+UM/o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JfFXGMRTXCZBjwe7dCb5tFIfpVCv/p1ABWXgtIxm36NCrqrnVu4TgpitSCU7D25OPJ1lfAP/g4CGSKiDSzs91eSYtZwuAL2kyOtnw4Co84LRHDizI36BoOsp2cRZi8pHGf5exNur2vucEYhVjdp43G9yNU+6gGLY1D7Pap+9IEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D01ORr0k; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvnKdpNZdvBy8keUQaBxwcoerft+Kb3vwR4ADiruI2bp5yCgrzyp0GhKyXyA+li7m0xltDf6hc+VGTL5K5E0AbgXAd9Ho0r6UYKQVeSOAGj/FTLYNRsyBaAdx3IMuG8KEgHAyhoNGRavUjKfgiQxYTy3ud69wXVGPXGPB7rgttuRotzehjf2Y6PUfrTWRKpgXFrqqb6FpjIkEB+yrxPXr4TPIbsohThSSr0zhsBpuZlMbF1EHfUY+aeGpuBJkRUtIGit2wRvX6NwueQ4epZdfnIlWmDEc3JH6wbKAE1vikmFmFL2qYPSgj/7+KUCOu8LDwFISwygTtZh9CBFftOpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBlxVKIWupPYDeJMzkGTnfb78dNQGWwfmaTTOebToOs=;
 b=YPm7dadQhGoFZfNE1IIE6yTZAKtLrTvbwqn2x8EeHwjeTIr9TWirAVI630b1Bc2olcd5qqJXij4t3rKx4hZZA0blMGGmfx60hrBbOX/O91BRzLmh1CEF/X34z2pWM78q+qLUIUIOJdEzaVe56EdbKMu4YTvOdO3HPT29HQq/+id3jr+PE99f9yNs7pqRYNW0VTNoESjKjxFSKgttgbCGFbbCuDULFA29d/j+uRjJMUnomTQzW2wK9rP0M/9CmC/YV7Fh92/91h/ri1l3hrZFSidCeKdmssqdmHV0FVbfCFqueOfELefi7yNwb/+5SZuABSxexcIkhQFH3qeAPo25lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBlxVKIWupPYDeJMzkGTnfb78dNQGWwfmaTTOebToOs=;
 b=D01ORr0kEsF6zCyZFhwrza9cZnGzJERP/Wh3ZMehXRHHzNUhGPB9bgAfASc0abrj217kLudXn741pwIr/yFKToPA/ZTelfbRNJnTHewQvs5TUrl6JKSb8UuZUVmomkMzrjQb/EgjQqeL06tC6umj4TTQ4RLLfeuZa+rMskEYdCNJTGGS5pBwctkWASiUA4oEIIC+1BLWrGKhCoaOmL7UzDeGeloQZ6h4RrIBUoBD9ukLb7qqPz3vpQkoIgiTDqOo6c3YNZsRpQi1ajHQDNtcOrB0WpTEsfY9dNmoETx2BE+pvhssTRlhCqW17ZUnZ5mHsZJLskWuBhDMC4OiM6r3ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 20:55:14 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:14 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Nov 2025 15:54:43 -0500
Subject: [PATCH 3/9] arm64: dts: imx8mm-evk: add uart1 and bluetooth node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-misc_dts-v1-3-7564b9f69a18@nxp.com>
References: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
In-Reply-To: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=1428;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=T3AjXpv98n5uIkFSP3tJMxlzWNimT+eKRxrXyYPEst8=;
 b=i5EXLlHH7s2tORsHIj82SzhsniLrcaUzyWqAeRLsLl5Bg4cHWaw3CR1NPqu1rq0/QB0/YRKT+
 e9CXedqQTCjDIoJ5Pv70rcRMT4d/ghPT2zK1gyGhh7RTK2M8wamnKOx
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: ddcb796b-d483-4f93-a73a-08de209b7202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXZLN1FvS002VHRKVkp0d2NxTEpYVmRKVy91MFhNMlkwb28ySURYZmQvTkt4?=
 =?utf-8?B?bjNzRmZ1Q0huZmlnWmFpQ01CZytFbk5DcnU4MWlvRkxITXYvVlFxMUx5RTZt?=
 =?utf-8?B?OStaS0wrUGRBODdsbXkvbmxpZDhvUElQQklUTjJkNVZrZkI4QlJOOXRtNThZ?=
 =?utf-8?B?V1lLRlppSjBmcDhaVnd4QXNXUzllc2Vta2w0d1dVaVU3VGZxK3owN0N3UjVt?=
 =?utf-8?B?aUhPTlAwL1F1dFl5NENoK1I2dk8zQTh5SkY4ZDFjZHpuUHFPWHRYUWVEdnN4?=
 =?utf-8?B?R1R6b3doWGRTaDVYclh1Rk16MVFyaEZNMTRGRDFGZHMwRjFaVlRCLzIwTGJ2?=
 =?utf-8?B?WGJYZWxUNTF3L0pETURWUGFpTW1UT1hQOTZySkVDZDRWODdqS04vSmtxcEJi?=
 =?utf-8?B?Z1RrWDFUMHllamdCSmxOaUI0eDZJdXJGUUVmWGkvVVA2Uktna3FEYkNaYTd0?=
 =?utf-8?B?VHpndUxVSkU4dDV1WjNqeEFFckV3UmRJYlN2NFBUZHU4QVBhSDNkME5ESHhV?=
 =?utf-8?B?SlU4NEJZY0ZFczA2MXAxM09DWWVGUzRoWUhqdEpqRE1nYUF1ajhOaUlYQndC?=
 =?utf-8?B?dm9JbUtRQUluY2diOWQ3amlHcGRkWjk5MTJkZWsxMjlHQzRGN3lmMWwzMVVK?=
 =?utf-8?B?RWp2ZXlhVVZyUTVOY0xxM3UxTDE3Q3ZmYVRpUUljalFtWkZRcDFJU0wyQkRG?=
 =?utf-8?B?eEJTQzdkTGpqS3R5WS9wdzNybnkrNlhKYlh0SmdodmlKMGd5R25Ja3RaKzRR?=
 =?utf-8?B?Nm1qUmhITnpZRGZjWlZWS3UwM3NsSHJPdlVsdkJQUCtsYXlteWwrT1NqbnE3?=
 =?utf-8?B?elcwYWFORjFXSjduaGdPazZHNndUS2FxN2NhNzFlaEZNOE9ESXdYdjE2M0wv?=
 =?utf-8?B?elJza2RyOEl5UEx1Y1R4Zkl3VUhvYjB3RnNxNEVYa0hLbnd0cjBFdktUZ2Jo?=
 =?utf-8?B?Tlg2TDNpNGlKaDcySnN1akpCbitOVEVSRVN3SGxpdk0zVFV4Q0NaVTcwc3JW?=
 =?utf-8?B?Y3hwNVhJWVIzWFFNR1JlMXY0bFROYUJzQmNwdFYxL0ZVMHZDcHkzWWpQdFB2?=
 =?utf-8?B?QjZQb1JVZmJrbWdkeHFVYS9OUUtURkFSV2NYTWRTUUZBK20rZWFQRkNUemVl?=
 =?utf-8?B?ZkIzK0JBcDdFSStpRUpBMFM3akZIK3RpcGRpWEt2dnlEOVd2Tmc2UXVvdUIx?=
 =?utf-8?B?VXJzVmRiR3B3ekx1N2M4bkNXRDY0em5STTdyUEd6Q0hvQVVMTnlTQmJ5YjlE?=
 =?utf-8?B?NlRQUUtUdnJScG16aktZV2wzeDlrM25xTnJzSE1UajBPbFFZQkxNU1pEYkpK?=
 =?utf-8?B?NHIxOFROTmxsSkNOMVBUSUw4NDlwV2FoVFJ0cUN4WS9CempwMzhXRUNrY3lo?=
 =?utf-8?B?Z0NSOExtR0xOTXlya0tWSUxhQUJEZFQrNzVUczlJQTBieko1LzdZOVEyUzIx?=
 =?utf-8?B?UUo1RXhNNTBUMVVRSTR6WFYrdEpkUG43emwzV3dUSDE0OXIrYVM4THdUNyto?=
 =?utf-8?B?aU43d0NwdjhSTzRtVkxGbktTbm9ML2JqVFNEb1NieTBxNDBldlMyaGlvRDhn?=
 =?utf-8?B?cEVLUlRXSkQ5VXdSemJCRVhIalNZc2pqSks5WFlGbEc1dENmSmo2cThwWUtn?=
 =?utf-8?B?OXh5cXhqR2hMODM0SjM4WWtYMy9Tb1VyTkpzLy9US3pDSGJ0RCtyMDV2Zmk5?=
 =?utf-8?B?eitWR0h1V2xyd3FLTGU2d3Z5TVZ3NVI0KzVjR2Rvd203V05hVnNqOUx1em1X?=
 =?utf-8?B?eUlPS2hnRmdMVzVBYmRxR0tqSElhUFVWR1hnaHdYU2VEd1ptK2g1cTA1K2ZT?=
 =?utf-8?B?eWVxTmg4dkhHMXE5MTJFTVMydVM1dUUxVnJia3lmbVpUbTBhVWE1d091TXN6?=
 =?utf-8?B?NEpqTGRaZjhCNU9NS2FNOXd0enEyYmxhWWpyUzBiQ2ZJUWsxTGVYOUJULzkv?=
 =?utf-8?B?d1Ria3ozTytHdmRXdEcrZTBIYXVoa25DQnhaUjZ4Zlk5VVZqdjk0UCtiVHdI?=
 =?utf-8?B?NlRzSGVrd25HZGRxM3B2Z1FXbUhta2FqelBZOFU1VDlEQi9Od2RzSm1PNGt6?=
 =?utf-8?Q?3e8gCV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDZSVHBkSlAyL0QrMnBTeDVIWGtGTGRLTWlmdVNVQUxQNmZxM0FtcGRwVG9G?=
 =?utf-8?B?T0cvb09NT0VPN3NTVlJxM0tmZS9iZUxYbkgyTDJEUWl3eTlXOUpZN2dweXZ1?=
 =?utf-8?B?UGQ5dG94dVFBRkw1QjdFNUlmV2RRTThBYWF1ZmduUzVUSFBBMWlLZGNiaFY2?=
 =?utf-8?B?WVpnY1FWL05yK0E4bTNucnEvSDQwNnlSTG5ZMXV0andQOFVCUnlZcGZSZklS?=
 =?utf-8?B?Z29KNXpaQzhtc09XMUZENjdTNXNhSzNpeXArbGNrZjRxUUx3RjBwdmozVnlF?=
 =?utf-8?B?aU16K0VtMnVBV2FyN1AvVEo1d0NPNVdoRzRQZDNIQTIvZlpBaTlEUlhFVWJ4?=
 =?utf-8?B?ZEszejNCY2M2Q0lGWU9ReWlsbGs4a1c5NEhHTHc2SHM2aDdnNUtRRHJLVXpz?=
 =?utf-8?B?eWI4ckdyNytHUno4ZXV3ZzBVZWZqSmFaelJTVmcxMnFFTTMwRWI4M2M3d1dT?=
 =?utf-8?B?U2tScVBJNm56cWRCRVd5ZzV4RkNzM2dhU3hjSk4rVzJKQUtSZU9idmZwRWZ1?=
 =?utf-8?B?QlhFcXRMTklqWXVvdnk1MDIzaHZ4eXdPNFBaZVJ2VERhcXI1TVY2azMwcUFS?=
 =?utf-8?B?OStPa0xNcEFEUk05VG5yNGQ2UmhkTC9oWDZHT3NNdWh2MUozVFlENWREQytH?=
 =?utf-8?B?M0RqNlplSWxRS1RKSER2c1FpNWNvcDFJNXBZbE9MYjJHNHpDRi9HQ2xrQ3Zi?=
 =?utf-8?B?RG5WMVpiZWFEZFJWb0E3Q2RDTkhrZmZKVnl1VVpBUmdhT2VwR2FRZUtzWmJN?=
 =?utf-8?B?UGRKMmFEaHQ3U3ozb0VUL0NjcDV3U1BnWjNJTVRhZGtBeUtBOTNWOTN2L2wy?=
 =?utf-8?B?QXZGQ1JIQUF5eUJLSnBLOVZkQWw2NWhzdDJ2MGZrQkFnWVJGMlJHdUMwaW5y?=
 =?utf-8?B?M1FpZFkrQ2tEY3ZhYlk4R05DUDZsNm1wdmhmT294UWptM25qMnJYVkYvekxO?=
 =?utf-8?B?dGxuSFc1eTZIb0VjWXFYR2tWVkdoc2taN2R2MEhMK3dlbzBodXNrVE9kYWJL?=
 =?utf-8?B?NXYyQmFITjM5WUduM29IeUdFUk4rOElDT1FVejJRRFRJbVR2WGV2aVVsRjVi?=
 =?utf-8?B?ckU1UlUycmt4MExZUkpsMzg2Tzd0YllSbWR0dmIvTVdpNnJScjAzUUsxSm1x?=
 =?utf-8?B?K0JHLzVUUnR6b1lyaWs2eXlIT053REVoOSs5MzJidjJ6ZGRjS0lGb1kzeWxU?=
 =?utf-8?B?Y1o2ajFDOG1xbmFGTzdCaEpaQVlqcjlTOUNoYXBUd3Z4V3A2UWtqVTB0SzNa?=
 =?utf-8?B?aHo1d2c2L3JBWk55bWZrVlBQdjljUWNIeHhhZjJmaDNLZ1E0ZktpV0tlK0x5?=
 =?utf-8?B?b1hhZ1EzbVcrTEttT3lqSzIxNWcyQXUwUXhnZ1J1MFdnbGlnV3QzMk92cTQ0?=
 =?utf-8?B?RzZVVFFrVVc4dExNMDJlZGcrNzBCTmc4ZFJKOGNBdjZFZUJUa2x1eUhTV3RB?=
 =?utf-8?B?YkNTRU5IMms2b1hhdVVweDlHejZHeG1rUTNCeTdFUitlNEFqMW1jT3JCNEM1?=
 =?utf-8?B?RFFhZGd4TkRYTHBSbzgzTmFpUUtPSFQ0dTRLT0hob2huV3BuWmFISXVnWjE4?=
 =?utf-8?B?OE1NQnhBSGVmRFFQcVloRzBYRnAyekRCZWlXcGlsK2p4Q3QzanhpZ0w1MFZI?=
 =?utf-8?B?akw2eEkzNXBITWN4bTlCSFUvRWcxVGUrN2ZRb0x5dkpvSjdqRzVZOE9GTVlX?=
 =?utf-8?B?aUxpaGliN0s2bU01a1VSS2FFdCszWHJPR2tjdmF5bjBiQVNTVjJpK1JoMTcv?=
 =?utf-8?B?UVZ6aG5URzFwck53WlpLNm04OE5EZk80TUM3dzNNcXY4VVFsKzJtbWwraUZp?=
 =?utf-8?B?aC9EUGd3eUdjYWRzeGVBS3FyVi84c0pQUFcrTjQvMkpZQTBub3R1cWlsekxP?=
 =?utf-8?B?aENnZW5BSTJxZ0tjRHlxZk5zT3kxTXY3UllaYUJ5Tjg3UlpDc29XeU5xbGN4?=
 =?utf-8?B?WkRYbWpld0JkMmNwUXE0VUEwbW5QVnVFclJ6eFFTZHZBNUtaZmlQN210S29q?=
 =?utf-8?B?MjF6QmRGR0xjMUpRLzN0cEY3bXhGREZrNEFRTis2NlJYZlhMeWNuMmhoNnM0?=
 =?utf-8?B?TExtRVhFME9GQXM3U3J1bEhNZ0RCNVBRa2VyM1ZoaHB1RnVReTVkYjFOcUhm?=
 =?utf-8?Q?Cq4n8UVfwK9rbhGRVYTxblkrW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddcb796b-d483-4f93-a73a-08de209b7202
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:14.1067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 394dHcEb5uAQkk9JnNgwQsUdMl6T2idhQzY2eAir0wXl8ZDQDvHM7kKGOoYA2I654krerL/aIjs864IrmraVhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

From: Sherry Sun <sherry.sun@nxp.com>

Add uart1 and bluetooth node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index ed8b38c6df3731d51bed42c8f68e7d4e0c2b1820..308e644d2af296ae88cbbe01e3bc59346b310f51 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -607,6 +607,19 @@ &spdif1 {
 	status = "okay";
 };
 
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &uart2 { /* console */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
@@ -789,6 +802,15 @@ MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x159
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140

-- 
2.34.1


