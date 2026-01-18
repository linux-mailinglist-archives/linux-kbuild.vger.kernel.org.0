Return-Path: <linux-kbuild+bounces-10637-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EFFD397E3
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C0E5301BE81
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 16:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A467221D3CA;
	Sun, 18 Jan 2026 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XC3ra3Qj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3627F219E8D;
	Sun, 18 Jan 2026 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768753719; cv=fail; b=lfoE5So2DSVG824B6U6uLMoalPb+8UyidoNUAoAZ4WfCwORnCmLmYaxVe0z+V05y7ZHZOf8/nIUOMyx1W2sgnHCiFSQA+W4Iv4i12P+7XHXmNsi98etIRZCLR7aw2U1dXrtudB+0ywW+IdcQpxJXoH7wLWDk+N8I0nnmk2/MD4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768753719; c=relaxed/simple;
	bh=whWvHm1V/iRIdLNmY3SCSv5dbJPodvAq7RdBjR4cIp0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bRypdgGwRWzfF37Hn18MdBcXLnLCbg6PFcIO9SZiYabTE5pPwFnUxOFIcCJwf+hfxx/QZ6/n3tYpq/m+V5cyU/viyvUaMgXb5MpE/ROpxU7zcqI+fB9/WLKdJN54xyO4opYJ8SVxVIWMIuxoS9zhf8JI5UrGMS+ayCpfMPPiEgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XC3ra3Qj; arc=fail smtp.client-ip=52.101.72.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+gmoLdsbkJ9OhPFuPPDhb3wPFNJ8/GjBgKBLsa+yeT2Xajaa51BjBsTo6Hh6/1hlmWDHX0GOfZ6S+fz3i90d881jgo4yoI/kKm6nc52B3wKPgjrUaC9y299mM0ao1beCKc03YOplZPRU5y4cWXw+5XFZINTMIs440QL9wnO0tLxx4BEf7FSs02wo6zoMKF31Qd93nYPvPvVrzyz4KWU4DqVGGKTd6Ps0orRLec2Sf+iQXw+JkNl7qAiAZZvIqLcg7XWt0iafcZLTwt0IqvnyNNldKzMLPJYzb787wm1dFyUpOcItYZowv47yWeIWywMfk6gL4hR8R3S5HVPDoXYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Yd66ditOmBOE2WJF8PGHRZZx89y9LuDz43IuymR49M=;
 b=h0nYnMef+NrkPSRHKvvWh8kpRuFcKsBtYmDBSG2jr+w5+PWBqygNbxRlapfYwyztNs+JuUP3cyTK9gvU/Ppsg1x7Lb/bOqpMMCsHMpyZ7xlPrOqkOXy4ratvxOV0jSdB9nYaWV61vBMOzyHhUphr7mlVsoLcORSad1nbPiNSsGvLyRxOmQxgv7QyguEftAZ7clCAWMVvzCKGsHhh9ico2RVTrG8+zJOqEcJ5I0/IGTSumnj187btvFmuZ3ljZ659nyEfx7qDOefQJDkOMXoWE7vqmTVqlmzWbkX/01qXShrU+rf9/HtdhEs8p91iq2zhWiF8CKsRS98hSbpQa451DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Yd66ditOmBOE2WJF8PGHRZZx89y9LuDz43IuymR49M=;
 b=XC3ra3QjQggufl58gCgqfFNjcV0jzWonhi/rFnOC9EmexyljPHCFEhwTxfH5r4LZB/iS4Ozlq3L+YDOV8aHOGvGbrvDYuejWCVWX3UGIzEFShGTQG9YGa+DkSHDTCEYV5kPVawNL2b+kz69xwoVs9OuvnGY5lMfYsUEHTitqcl0mwdQt9qfeN+M91SbyKMhix+2mJVu0nV2Pko+T7Rw4VKxfTf+M4LbdtMNX0q7i2GAf/cDyWcr5ltEtdO5UyPLMheET2Fgfu1yFNL4Wr+hvBhmqDQzs+kYJ9IRNY81ezAZZZz48b4nUadADHI1OT/UXTXUDX7x5J/yxPeWZfLQpzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:32 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:32 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sun, 18 Jan 2026 11:27:59 -0500
Subject: [PATCH v3 2/9] arm64: dts: imx8mm-evk: correct the spdif
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-misc_dts-v3-2-d3564716cbf6@nxp.com>
References: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
In-Reply-To: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=899;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=WQDC6knS7zi7MJr28peib3m35iupbLD37LjnhPpN2fk=;
 b=LAk1pO/MoD+tyTh8bHlEV3RD9YqPd8QOp1NAl4Mit9K9HfP+qPVouX3PsI1j5lBI63dXqlMeL
 kkJSDZfnCMmA1XZegsHDg/Br1+tFiJ4zYyhhBrk7MH3IlLPnRLsXerM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0158.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::34) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS5PR04MB11348:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a6a71a-10cd-4369-117f-08de56ae9ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S05FdUt0Z21rcC9FeThldUlBdXdLR3kvZkV2SXNGTHAyMTJQVloxVWprNGxI?=
 =?utf-8?B?U0Q4RU1XRzJ3Zmx6LzI0QlR4ZktEbFBqTlpjQWo1UnpZVWVzTnNud0ZqcEFj?=
 =?utf-8?B?aHVVZ0V3SGlEamY1YTJGSVBGKysrcDE3ZmtxT00vU2xGVjBMM2tmYk9KdXlR?=
 =?utf-8?B?dkkrNlo2aDMrWXVtTWFJZnBGcWhLVjJ5T0x1NzdLKytFZUlQbjc0Y2N0SUxD?=
 =?utf-8?B?Yk40S2ExaW5YZm9tVnF3akNvclBxT2lnSk1XWm9idDA0R1NwT1RmU2pWdHlt?=
 =?utf-8?B?ZGwwdDdzMWhJWGpDTlRZNFNMOURkTFNIYXFsejRFQmd5dDNIYjFKM3AzZkw2?=
 =?utf-8?B?dkhKbzFrdEgwRUIxZUhycVRKaXlwdXJxOWxZdWJmeDRzMlNFazhaWmVyb0k2?=
 =?utf-8?B?RkI3UTJvUjA0ZDdrZUlDQjFjeU1SM0d5NytXaC9weUNZNVU0VVNuS1YwNExt?=
 =?utf-8?B?NVR1dEFUTUVxN3h2R1hCYW9ldjJ0MlJ5dldrNW1XN3NLTTJhZUdjaFNnSE5I?=
 =?utf-8?B?UGtNNWZkOFVVZ3JQMVRleDdweW1XeW9yMGJFanJEbjhUaFZTZjg0ejk3VUpW?=
 =?utf-8?B?MDlaKzM3L1hqYmtJUHRxaTI0Rmphdkp6R2x4b2l0WS9XbFhZT1RYbEJuY2d0?=
 =?utf-8?B?ZGFjREE0ZXRTbHJBazhHdHd1dmRTNEJicG10NGdVMjMyMHZrbjB0T25WSGx1?=
 =?utf-8?B?NmZHR2o1bVdBdUtLcWYzVXNkbTNVblpYekhlZlZBV3E3bTB4QWdyM0l6VmJQ?=
 =?utf-8?B?bzhWZ1IwSUJhN3h2R1NhOEFjV1JVVGhQT291TWpVSk9xdFc2VW9CREhEUjJl?=
 =?utf-8?B?bjIzRUtYanBlRnIrekFMckJPNjFYMmluQmo0YkRhSS9rbnNlUWhDUG1ERmRI?=
 =?utf-8?B?OWZiMkNwZ2Q1QVNOWUE4MXBvV0lkaThXVExUWnpSdXpvQ1lBcm5rWTBWMG1C?=
 =?utf-8?B?K2ViME55SklIakVna0dONjBuUkFDU2w3cE9rakFlYUdicmd4VEc3bURCNVdK?=
 =?utf-8?B?U0puV1B0N1RDQWlCdmFlZmxBTjhqN2ZsT2tqMnliMEpQSVVHMjJCbEhqNEpi?=
 =?utf-8?B?Z1hkU1NUTXNYNnNqS3R3YXdUbTFRYUlqMldVN1lVWlphTjd0M2xhQTV0S3VU?=
 =?utf-8?B?dUhZVjJOcDBYSjNPZVlmWStXQk80SUVhVWZiUEk2L05FNVppUm1hMGVDdjla?=
 =?utf-8?B?b2NzUEdiemNMNS9LcHZDcWlULy8vdDR1MmJiUlk3RTBWekd6c2wvZlprbVNi?=
 =?utf-8?B?ZnB1UWZQdWk3ODFtS0lhWndGWjdtbHJ3b3lBNHhPZzY0bnRGTUd3ZjFibHo2?=
 =?utf-8?B?NWpGNWVFWDRTTUs5M1NBRERZY0c1TDZXdklMT0VpbHNsdkFVcExCRzc2ZDky?=
 =?utf-8?B?cU9CRW1pWGFKSFVrYTB2MEZoVzJoL1EwNWZVNGVRa2U5YWQ1NE5rWmg3K243?=
 =?utf-8?B?czU0Mmw5czBBMmRjNnFPeEh3QnJ0WG5zMWNPaU1TWVIwU2FOMTVrM0Q5YkVk?=
 =?utf-8?B?UEljKzd6c1dkTHpCenpLQm4rWlI1d1ZTcUVDSUlWcU9OdFFRUENsSC8yZC9T?=
 =?utf-8?B?anZYSW9FWjMvbEdrelBuT1VCSk1ZckVyTU5wT0M5dmdibUQrMk9Ka0gweHor?=
 =?utf-8?B?Tnl6dHg0dWM3V0p4Z2NRd3BoSGhpbWRPN0JHVC9jS1NJVTMrekx5ZDl5SjRk?=
 =?utf-8?B?S0xwZURpSzJQRTZSOGpnLy9aQ3l3SjFTSFIzOVZxZFNhbjJRclYyT09paDcv?=
 =?utf-8?B?VFVuaVFGb2NXQ2xGN0RtSkR1eS9wQjYzanI0WFUvM2dFTElBTHk1OVZISHZk?=
 =?utf-8?B?WHZKQndJYmg4c2w0ZVZ0cG5PQnh0RjE5UkllbmYvZy9GR0pYMjdYWkgrcEh6?=
 =?utf-8?B?S1ZhTllIajBrYVVBN2Z3NGd1QzR5Sk53UTUvdFVZakFXeFI3Z3kwK1gwMll5?=
 =?utf-8?B?OVRpakkvRnFOa0dPbk1RaUwzck5LWW1qTHFzbTA4aXVjdnZSQ1VCcFlFeWdG?=
 =?utf-8?B?VTh1ZXBUM1NGQkpvMjhpcDBxTFpCVW9KWTUzWmVsWTd5UDhPWGFOZGtvRVNG?=
 =?utf-8?B?N0NwcmRMOWdWWlhQanlwSE1hWXVuUkJJcGVzL0tDaHZReHV6a1BvVXcxYlZE?=
 =?utf-8?B?V0pseXdpai9tdEJCOTBLS0M1bEMxQnZ0NnV1UndOQmxUSFFhZHNVYy9vOUxi?=
 =?utf-8?Q?6e8wA7/E7DNMvNFTrpYEVqI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFJqbnJRWjlaVE9qOVVrSkVNcExLcFAwY1pJc1ZmRDdBNmowM28ra3B4LzFl?=
 =?utf-8?B?U1B0VnE3K1VQNFNrODB1NzVSMTZZT3dtdFJKTkM5SStTbWFpdUFXZ3RvU2w5?=
 =?utf-8?B?K01obGJNakN1QlZtdXNQMVdzYWtQaG8wSk5HRjBjVjNVTGg3cGhxMkphNEhj?=
 =?utf-8?B?U2NtQW5kSHFYUUIxSlpVVVh3WlYyNTBNUTU0TjZpUk1DOUZLVG1YUkMwQjdN?=
 =?utf-8?B?OWpNS3M5VFVjY2MrM3VUL3lId0dFRTQrN2ZKQTFKUjdsbFM3QlFVbTEwUnNB?=
 =?utf-8?B?YkJ4ZGdTOE1UblF5MnljVitrMFNRTzQ2YzFENUVCNFFQdkQxWi9OYjFQZWF1?=
 =?utf-8?B?dUJiWWhaOUNXSzBObjM3VGkvMHNtcDZHZDRWSERvZDM1NkNJVjBQREFGQ1lS?=
 =?utf-8?B?U0R4aW5jUXlEeDc0TFRBdk1lQUMycktrOUhCaUx1djBJRXhrUkI2bVorUUpN?=
 =?utf-8?B?TERudFc5TE92cGNNcEZ5WXNmV0hnYmRieFR2NjZYSGVWdTVGSGEyZFRtQTBr?=
 =?utf-8?B?MlRHZ3h0WkFWTW15RjVRUWIrbkhwblhZdVpRdkI2NUMyZy95cVBISXJiRk1j?=
 =?utf-8?B?dFhpRzdpL2ZNRXRTYXRRKzJSa1VZK3owak84RjJXMU81RlFkaDdDZkdZYTlH?=
 =?utf-8?B?UHFCcUt3S0dmVk1CbjZLNFp4SWF1U2xVWUxEeWZtaEgyeVMyV2tTd2YrMmhD?=
 =?utf-8?B?aFdsZnJkK2VXSENaQUM3TlNWUkdkdVRyMldGcG4wMVJMS0RkZkZ2b3V1NmQ5?=
 =?utf-8?B?cERNQS9uVTRmbE41N1BZcFhRYU5lbHRSTGxmMXphREZkeUJXaDVsVVRNcGFw?=
 =?utf-8?B?b2dXcnV5aVBIenJ4QnJsY1lPZEppTzA0QTZNdjY5K1BuS3dEaU43djJMUXV0?=
 =?utf-8?B?MkdWMWFTaEtOa3RLNUVnNC9yL2VTUFhhdmpoSEJWK3dKQ2MvY0M3Yk9nVlIw?=
 =?utf-8?B?aVpPYlRUb0pkZmFhZitDNkQ1M092Z1VHQjJEbnZvamhxdVFlTjBzL0N3dnJC?=
 =?utf-8?B?Vi9OZ0I2ZEZyakpGc0wwL1BkQjV3bUVoNWJXT1MvZWVISlZRaTZjWlNUS3lF?=
 =?utf-8?B?OUtNcHc4d3lHaGp1RnYxeW8vRTQ5TTZLc2tGWThYYmlPZDZlWlcwTnRmcUND?=
 =?utf-8?B?clM1OWFxMDlSZDdOT1RsWExUZFdnSjlnMklFYXQ0YUt0UlR3cEF0eFdGdzlH?=
 =?utf-8?B?RXJpZCs3dFQ3YkJWV1dnWVM3WFpNaWNDRFRwQ2lPbTRaRUJtUU1US0t0dTEy?=
 =?utf-8?B?cm5sU2IwRkNyaGpWMUxUb3ZxdlhVK3FrWkJuQmNyNmM0anZDRC9SY1ZDSUMz?=
 =?utf-8?B?cHBjWHA3SkRWRGc2WnRFcWpVakNEbGF5a2RRWlhqQnB4dGJFM1hDaEdaNWR4?=
 =?utf-8?B?NU02aUdTbjFRbG5XSzliaUdQNGNraWJNdGd5NnpYaGtDTGZtcXpWTXR1Z0sz?=
 =?utf-8?B?eGRYbEo0aUVKbVZISjdQWm5Gc1BHN1I5aXNpVUdXZmRnb3E2d2NCZ01xMzZz?=
 =?utf-8?B?S0djV1gxN1FoUWJqMGgxQkUycW5zOWwycUVqVVZrRkVMemNNd0pHY1ZXMGJ6?=
 =?utf-8?B?MGt1ZlM1WkV3R2laK05tdE5tK3ArRm9ld1crSG84MkRXSTFCc2JYK2ZMR0o5?=
 =?utf-8?B?YVltWm1jeURLbHRQc1pUaTVDL2s4dENTaXVxUTVKRmJVUmMrRlc1ZDJNbTFy?=
 =?utf-8?B?UFpFbXZONVlLQ2dPcXNUSEdhZ3FjNGNJZGFsUGpkakt6QkJSZ3d6ZHFlZWZo?=
 =?utf-8?B?TUdRSUV2V0tEWm9aTHhVN0xvenZVdDJLTUFUYnhxdkRmWXJCRmgxbjFkcng2?=
 =?utf-8?B?M2lMSjhBaGJyTzE2NWs5TGRmTW1Nd2drWkNnR3NaTkRUeVNGaXp4cnVndFRI?=
 =?utf-8?B?YzN0RW0xZFNPUkErTkc1U3h0SzlJS29RNVduTkUxRGNjSzBBTVMvMXZ5SUtu?=
 =?utf-8?B?YXNPN2VDMThGaUR2VVR1MmRKR0FyK0xoMTNxdWZueGJnYkRBSVBtQ3pONG1C?=
 =?utf-8?B?L21ZMTNkNERXM3ZUMGV1WnR6OGlqMzFFWVBLYTlBZXQySDVRUnFQMFBjWjF2?=
 =?utf-8?B?VExrYXpWRloxbDFXOTVGc21rdDh0ZjV1MUVSTHdOYk0rRmxpT1pXNE5NN3hq?=
 =?utf-8?B?MWZrdVJnUHJOUFI2eTk1TVI1VWhrbiswWnk1ZDhqbkFnaUlCS0V6VnZDUE93?=
 =?utf-8?B?RDFYTlg5SU5JdDJlMkZnelhEdDNTSEJhNHJhcEtBdjhHbVFUamRheit5OGNT?=
 =?utf-8?B?SEd1aDRxMEhucERzNnIvRHNFLzlUWEdoK21SZkdtYkJWVmlUdFptQm5iY1dE?=
 =?utf-8?Q?iY26rF508DUo+qYwE5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a6a71a-10cd-4369-117f-08de56ae9ea5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:32.0094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgPyiAPe4dBPfkK4OPzZPY2SXeB2dXiZEod4Jk3Rf6LwFqAbAx8BaxY/nipI8gLfm9zTRLPPsjrK9tSSCLdw1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Correct the spdif compatible string to "fsl,imx8mm-spdif".

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 9f49c0b386d31051da9638b566c5e5ee5d2c54b2..f2e1854f38a0a83927f19d0f8630a9d0e5f81aa1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -400,7 +400,7 @@ micfil: audio-controller@30080000 {
 				};
 
 				spdif1: spdif@30090000 {
-					compatible = "fsl,imx35-spdif";
+					compatible = "fsl,imx8mm-spdif";
 					reg = <0x30090000 0x10000>;
 					interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clk IMX8MM_CLK_AUDIO_AHB>, /* core */

-- 
2.34.1


