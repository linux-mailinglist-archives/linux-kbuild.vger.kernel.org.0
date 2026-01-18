Return-Path: <linux-kbuild+bounces-10633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A448DD39290
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 04:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D35243014D6F
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 03:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE65E30EF8C;
	Sun, 18 Jan 2026 03:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GQ0WUePh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5485030C639;
	Sun, 18 Jan 2026 03:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707594; cv=fail; b=E8TyH/QR/rj5ByqLIZZ8SjBBO0Kpb7MPbLKwx+m3HccClC6CkuoVCsWz26RdG3V/8GRMt9+qC3stam/TzRamIQasL2p0GtHjJjhoPofRnepPoV4EYWxrTm8vohd5lL/XYmTK+jKQv9xF2o11NAWzjAEeoyv/NqMelc1jluYf8w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707594; c=relaxed/simple;
	bh=kxL3S/O76bEm4TX7xMB8eRhNT1NJmpPdO0bgrNlBrD0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fWpDNLSf7N02c3tXCEFhp9sUd5VHvLhjr+zk9G8A2fzMu78xgTwBh1xbzyZSaBOkRoPzRCSXoULvkjjpJ5Al1W9o6Eh+ByhxOLMCq69WjCjTJCK+3jde7Ub1VGOTdP5o5oIqXwKAnmws0VUKe6hoQgCAbsm4rVNuN0Ppoek5tUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GQ0WUePh; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLEHUTYiSufvm4gEpL+fRgYrvDFBEWl767ZuzCo3qJyZAGQwR9IKrwenoL2ewre8wqXxQLLocqTOs2IQcgy3Q7GR+8W+gaUDvwq7e8lh1Kz+h+BazlwQmUnNmFZwtDmUFibbowIxd1R21KfviXDcPpyyPqVkBo92XhoJqUxXXOAOFP1OWIGpdV1vsHrPGkluwqfXMhr9CS+LamTeZxvsxDEUZ7ALKTv+eR4zAjwUL18F+DweVck5bxXhPUsa+Nu30aYsxgQbRPCsbiuoDjUuj2G1xbw6Za+c7dJY80pHpqTPnGQ23lzzzz/GUdNcveKspnUE6+NtvoWz1+0KioGc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp54Zl5LNhg0hQJBr6mWDtbysiLPFrlmhmkRb8jWO3w=;
 b=N1VhDaydDAMeHJJt6Y4OJ4u115rg4pTWjU1wOqUXD7jyPybfXjLNn9KInd1e6w+MyUcAxcnI2cblgqtJayJdp3yE8YpW5uywuXCB5QCrZYhqdP+b8kwrArTK5xh3z2brktlp63LxYdjok5/NsbRR3ksWvTz6tlr6Zi4l3BrEQGG4fkiKgjfJD17HazQXosFRpBorJNxHGXYQfSKCTzlU0Yx+IVvlcZL7SF9UxS55FXQu2W0v8eIaJc0n5YCzN3mDTL32H6GYTJPMYnv5EGh1/72F4zEGzcK5StTgIaB6YEF1pASA8lv74kiQq1Bu123pXrPKNqMpcSGQHx/G3UWN2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp54Zl5LNhg0hQJBr6mWDtbysiLPFrlmhmkRb8jWO3w=;
 b=GQ0WUePhO2dIh7p40cj/2JAPjzmLi+Qkqc9Rn+J4bGUFUta+bCAOwxbc8sfSn+AI4U873aoeqCv5QWo2KdnRslcr2CHQ+trGmMc1TdUHsaHEHLq3PFZkDFQvYYB4BlDz9QiQcIQ7vKypJH9VqP4CEVSuL9HTKj7qSjCSJqMzQNVGfAqrN9MXgNAwaJhUHE3vfIdBdmTEFgv7d1Ut0Q/llBurCug9/AHYATb4iYlvxa3/EyCmOq6r6DNWej1VyR3WrBYjDNcepY9xVcpeHw17AMOLTcwzLJm4Xq0Gxu2EvrbA1H8iqmmAA8X2KBj2cHJbbP9LLQCZP3rJMt5Hx3yjRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:42 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:42 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sat, 17 Jan 2026 22:37:43 -0500
Subject: [PATCH v2 9/9] arm64: dts: imx8mp-evk: add bluetooth dts node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-misc_dts-v2-9-0f319c7e9b55@nxp.com>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
In-Reply-To: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=752;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JaGv8yKRuLdNOGe9Xk9dUzrkjWlKe4F+s2761DB/WaI=;
 b=16iaCI3ZPzRIQL0aAA5Dv0EZzvgbl8xxGNYbVc604PrxUXUSYvZgIs8n5tYsosolxfZVQGDsY
 fdBz6uzvEQ5BdTIVI6KOwFrRo4nd89p1vGqyzZup/BBEQ+gm6kdTwCy
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:510:2da::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10021:EE_
X-MS-Office365-Filtering-Correlation-Id: 43118a00-eaf2-43b8-41cd-08de56431363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkFZa0xxMG8rZ2o1SXhRZ2toT1cvSDVsd2x3YXI0bG8rZ0tFcVZQQTNWcEhX?=
 =?utf-8?B?b2loaFoyenBETnJvM2RvQzJ2bWJzWTZoVEtNbWdZOHExMm5rVTJYR2VOK3Iz?=
 =?utf-8?B?K1V5eVYxcUgzSlVoL0JOZWFIRndtcGRHVSt5Tm1Idk9zRzBJNEdxVU80ZEU2?=
 =?utf-8?B?TGFlN0UzTmVxdUsrbVhWRENRYWFPOG9vT1VBT28wTHQzWCtucUtPdzV6YUh1?=
 =?utf-8?B?OC8wUEVBWHAzMFEwd3U2aWY5cjE3MnBiZUdyZDhsUllsZ0tGTzRXRFE5TkNE?=
 =?utf-8?B?QmQwNEZRbWhEcTBwYkx3bXIzRkRYYmlrbTl1SmYweDRQdi9YaUhSY1dYeDZJ?=
 =?utf-8?B?TUM2ZFUvQkNDenRyL3lOdlA3OVlKM1FiK2F1QnB0OFQ2N3l3ZVQwaEdQTWlU?=
 =?utf-8?B?RDRmdUd0N0U2c0RBdnVQbEF0QzJUMlgvazdxTTRDV2wvQzFJc1VqNmNnWkd6?=
 =?utf-8?B?OUtLNExybmV2UmdvL3NwRFJmY2RBSWIwZkY2eGMvUlFBR1NyMXIxSlZTcTcz?=
 =?utf-8?B?YmhqWklwWmRTR1d2djR2RDFyckI2YWRoWHJDSDN6QU43SSsxNXpkYlM2Z05K?=
 =?utf-8?B?d0RpelpWN0pReHpsZytzUDhnRFpVMDZ6YmkrOEhFQjJIKzgzeERwcFdWY1Fr?=
 =?utf-8?B?c1NMdm5zcjFxNXZNZExRT08xM25nMmZiTmdQclNvck5tTVJuaHNvVVV1Umho?=
 =?utf-8?B?cnFhdVJjVytZWFNrZ3dKVjhoYU1WZTR4VFllMVJ1bE9zVjhCcVVpWnhyMm1o?=
 =?utf-8?B?K0JqRkpUTnpPQjlVODgrSGl0UzRMRTJFR3JlME52OTNjMm9nclBxNDRudXZr?=
 =?utf-8?B?NXRUQU1LWEU3OTBlQTJuZmw0RWpKSjc4eHEyaVIycUZ2ZkdBdENTcVZXNmlt?=
 =?utf-8?B?NHd3SXhkYVdsU1NlVGJya2FQOC9SSDFjY093OFJ0Tk14UVpadExhVlY0bXAw?=
 =?utf-8?B?VnlRUktPZHc5Z3F3VlljdEJZMVJUNnB6OHFPMVBEWHg2ZzQxa1JleHkvNTNH?=
 =?utf-8?B?dVdKUHVVU01sT0IzK29hdjVna2tSajhncEdySk9STWFodDlHc1VhS0ZYUk1X?=
 =?utf-8?B?Nm1pU0NSNHVqOFBwbGZVallCR3JFakdFOTlDdGp1NFpkVjZXZXp6VlpURG03?=
 =?utf-8?B?cFdqTXhSUWxFNGovbHhxcVFoQWgxSFVPY1cyMVhvamh4b2p2K29CdWxmTFNk?=
 =?utf-8?B?U1VGMTBvRlRSeUF4MW1xZjlFVzBubllaTlp3YkRuTmFrVXRVcmtrOXpRTHJQ?=
 =?utf-8?B?QjJkcmNrTjNnZEk5aVBEd1dpL3R2OGxjcnVqZnVxajFTK0hnK1RyY0pRTDZF?=
 =?utf-8?B?Q2RIMTM5UjNZK0w0NEZMWVI0OEFWWktMQVdXck8zMi9NdWJjd3BGNUJ4bmti?=
 =?utf-8?B?QXIrN1pRZlZiWnQ4R0Zxd2VSUVdHeXUwcDNTbzdhMExadzZFREc2TFhpaXFm?=
 =?utf-8?B?RVJZY2Y1WnpTQTRCR0lkV3FkbCtDSzk5aHU0cytjTlZqK3NCTU1iMmYveTJS?=
 =?utf-8?B?S3RZRkE1bTdhTGFqdzk4L1ZIQnA4Mjk3NGpMVTlUVkZ2WlJaaTlLS2N3OVgx?=
 =?utf-8?B?Rm04NWZOZjhtRm1ocDdhSmU0cGRIRWRGSlZwVFRzVkUxbE5WeGVyZWt0VHB2?=
 =?utf-8?B?ck4wVjRHS2tXTjdxM0tIZHdlakRiWDVRMFRHbWJMZytuYTU1S2RXWHB0Ym9V?=
 =?utf-8?B?cGd6eGNjTEIvdUU2ODlZblhQd1gwUUFvWTNPSENpbEJEWFVscE8rZitGMmxu?=
 =?utf-8?B?SlZWNExFcXd5WVNtMmozQ1Vja3MxQk8rTkhWQ1E3cGNXTnloYnZJNHhnWVpV?=
 =?utf-8?B?OVRYaldVVElZYnFpK3hsc0d2OURsVDRlQUdyalNoNHBQdmdvdEgzRGFEeERF?=
 =?utf-8?B?ZE1yZjVJcU5Sb0drUUQ2MTJ5bUdhMG9YdnU3dS9Tc0pVNlRVSlc5YWY5QUhM?=
 =?utf-8?B?YTdldGJGeVJaTCt1UzU3WWhGa2ZEd095SU1WVnE2L3dqbVpEL1ZjcXpockpa?=
 =?utf-8?B?NmFVU2JqRDZ5a045aHJjUHRNZ3I2cjVrbjFaOUNpdHQ4Z0g5VEt1b3ZRZ2Zx?=
 =?utf-8?B?Y0hPazg3WVVvOURldm5mQXpjTlM5bWhBMVp4bUlXS1pXejc3REZNeEZEeExJ?=
 =?utf-8?B?aFVLVExNRU9xN2d5TmpRNXBsTXBhbmgvMmx5MzBrL2U1cmZHS1pUMjQ0VGFM?=
 =?utf-8?Q?wHT3MRGP9n7z5YFpJ6s/NsY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RCtQUnRaOG9aQnpReXc5N2VGOEpCazJGOGdpRUtsVzFCU1ZQSWtmTFZ6ZUxN?=
 =?utf-8?B?dGEwMHNLUW5lU0krNXMvazFKSURRMENYQVFQVTFGV21EdUcwbVFHYVcvUjFT?=
 =?utf-8?B?TUZKTU12aDdMM3VGYUwwL3haQzlhazdnVkdOOFNUZGVLZzZ3VW9EUU5SRy9n?=
 =?utf-8?B?dHlJTUdRL1Z5RUszaUNzUHNzbVc1Y2xlSGN0MVZBdXJDL3kwVSszdmk3Ni9z?=
 =?utf-8?B?RkZOS0x6ODRVSXB0cXI5MGplNGVmZTVDdExQejcvNmkzaDQ3cnFCelpFTHBD?=
 =?utf-8?B?ZFlTa1B2bzV3ZkpmdEROL29UZk45enMwVGFhTVhVUkVzNlY4WllBWUlMSkN4?=
 =?utf-8?B?dW5oV3JwYUdiaXpiUTRCTE9kaFVOTkhwWGlNMWF5SlBXRFNrZnY5K0Q4UXZ4?=
 =?utf-8?B?TkVjUUVpMFNCVDhmeTZXcy9EamZUUWphUE5qSEZNNGcwamU3NENzT3o5ZUJh?=
 =?utf-8?B?SlhTTzd1YlF2a0N6ZzI2L3RqNVpIU1RrL1I4dmJpVm1RTUk1SUttQTMzcTY3?=
 =?utf-8?B?MER4eno0K0NyWnJtK2hpRTZrL25GTGtTRmVCWWlXTEZsRnRlSE9LQmUza0RJ?=
 =?utf-8?B?UEgrY3FRU2p5WmhpbnZDa1lvZ0UvMll4M1RVMk1BaGxzNUd1NXRYN2xJRE5x?=
 =?utf-8?B?Z25LMzliUnFwcC9ZZHBGRFF4V25DQy9uaUVCVVJjSnFqUjV3bUhTRXEvTml1?=
 =?utf-8?B?K21sbXJzRjNDSkZENzI2d21xZEhrZllpc25BcjNzSmUxb0lOcmFrTzFuQW1i?=
 =?utf-8?B?dHFpT3pPcG92QTJxSDRsbU51MlBMZEgrVzQ2Z1ZxZTM5NDRUcmtYRGJxdCsx?=
 =?utf-8?B?cUV1cVkxeEZHalliUjRaL1hLN1JxUFdGMVYyTTRsN1lCeXdxZDBZK2JBSUFk?=
 =?utf-8?B?MVh4RlE1dEpKaDlyRVZBcVM3Nkl1azVsZ1A1SDdnVy9sWmNLOGU3K1NBQnNW?=
 =?utf-8?B?MHp6V29PaXNWL2ZobW96b1FHRGZCSlpzbWFrOTVSUEhwdWZUNTM5aUtURjQw?=
 =?utf-8?B?ZHdId1QzYTlJTDNoVVEwVWczYUFjYmVVTlVmTGlKMUF0YmhFNFlQbmZXYkVJ?=
 =?utf-8?B?M2EzOXhOUWw1eERRSExNSjl0b1hnd01tWllNQnFkZm9sTURHV0ZhdmZWdloy?=
 =?utf-8?B?a1lRYUpCcnFnWG03WWVwY3d5NTZCV29hUTlNeFhXL3RwaDM2Vjl6cEhkejlL?=
 =?utf-8?B?cjd6L0dUWUdpYjhqTFhNbW45dUFoSFZ4ZWc2YWVybno0aXlKVnVYQmtIUzJB?=
 =?utf-8?B?YmVxNmZranAyUlhuQmY0amdEaXhVT3c3cGE4YmdzcVNjaU1FU3RLNUdqc0JS?=
 =?utf-8?B?WHJrdmNiSWduVDFEb05wNTcxU2RQQk93ZXBQZmtVc240RWp1dFVEd2o4bFdR?=
 =?utf-8?B?MUorai9pMWxSVHN6Z3RKYmI1VE9rNTZYUUVVWHkyQXUxZFo3NTZKU3FJMG43?=
 =?utf-8?B?OXVhM2RpaFlsTTJDeGdPNXVLU21pK214TkFHMUM0V2I1MnpyY3o1dlRKN1pY?=
 =?utf-8?B?dU5JSkQ3OEUzSDdNZTFOVzhLZDBTd0V5YkNMeEVaZER4eGVMRlJHSkcrTUNN?=
 =?utf-8?B?RGRSTkdyUk1kWHc2TGpPWVlOckdwOUVkK0JteU11ZURabzRTTTJpTm03OTQ4?=
 =?utf-8?B?S0ZwZmgxQzQ1RFdvbTFOS3V5dVJnK2ZEUTFWZDRGOFZTZWRjNWt6Tk5GTW1K?=
 =?utf-8?B?bTQ4SXJSVU9uUXlsZmxyMSt2WU1hL1VzRmIyUGU0endQV0VRQS83czdSUU9w?=
 =?utf-8?B?ZUxVN3Vuem9mbENLRWtNUUhvVG1aMVFQbkowMFFqSlNDNk11aUpIbVg5M0Z2?=
 =?utf-8?B?b2NVS05yb2RnaUVWVWNSMnQyZEZvbEFoTUNLdDdvdzQrbFptNHdLTU1LemNN?=
 =?utf-8?B?V0U2eXNRQzBNSEZmdVZRdEZsOGRSazUzeTJPV3h5L3IwZjY2VFdGaTI0bEtI?=
 =?utf-8?B?ai8rTW12WFBBOHZsSFR1NEFmODBhNkhlbEVyS255SmlEc1Iybk44NmxmVGZR?=
 =?utf-8?B?bldudU1oMGxxaXpreXA0c3M0Z2M1SkNUMHUycDdaNFZPYnNONmJUQ3czMFVr?=
 =?utf-8?B?SU5FMVJiTjdZSGwzcU1YV3QzUFFqRmpOaWN5YUdMV25qSEovSnlZQWtkMjFY?=
 =?utf-8?B?ZFBjb1h6Q09LZ0lLTWVRd3owYzFsSWtsMlYxOTlEV0pBNkdFcUVLeitXYWR1?=
 =?utf-8?B?Sm1PY1N2aXlmaERnRzY3TDYxTXIzM0VPY0ZUSVkyeS9SVkEySUtKb0U4bWVW?=
 =?utf-8?B?N1Q2eENic1duZHM5Nm5tYUlsb1BTNWp5Vm9pSWhYKzY1U0tYUEFqVWlXSW5s?=
 =?utf-8?Q?nJy5HoYZvHRbC3N11q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43118a00-eaf2-43b8-41cd-08de56431363
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:42.2288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6n8dr5oIgCzfo8fD74rcUf6IeDhd1PI69HWxGjsO8rGdRCfBXX2bSTI7uNehvhvjESK1sD3fkVe0WAf9YIOs1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

From: Sherry Sun <sherry.sun@nxp.com>

Add bluetooth dts node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 053c5e91f5aa3aad941820071fe7083e5c18447e..ea8a3050fccbbf8fdfa9bd7b130361462e9de008 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -825,6 +825,10 @@ &uart1 { /* BT */
 	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8997-bt";
+	};
 };
 
 &uart2 {

-- 
2.34.1


