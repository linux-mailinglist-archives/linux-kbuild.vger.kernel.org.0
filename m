Return-Path: <linux-kbuild+bounces-10636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1EBD397DE
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DF10300CBAE
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 16:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6F922B5AD;
	Sun, 18 Jan 2026 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ABasDuDq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B721D3CA;
	Sun, 18 Jan 2026 16:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768753712; cv=fail; b=Ed+MT1Oue4fAiSQ01HO2zCor0IHGu8ixbaeHbGB0yolN2uPgdZJ136bNlgAY80ucNDF/cIf4oBBqJJj6UhGueke54KhgiuNKTyipQJs6+QYa4zXQzvMEq3mRiPZzi4nxhVaZcU2tk0pAOHlaraLaUHjETv0clyUuiQOWFf+Cdmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768753712; c=relaxed/simple;
	bh=OV+HOTvw1Ajrgq+p3EzhWwbcLpmcPveMxd4Kere8yq0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SrnCitpxW8fDlZIBU3x2iNHLZvpThh/cRP9gpplZoYnEe5/K1uIMPTKw14f2ehIdFPWvF9kgmA3sMipZ6DPWZOKfV+2tgcVOSRr0FMnhf1VAsU/0SjM2noHZwGRd96RGHEAFEiJ9iY/DBvvCIPrsWZlYtK7twKPoXXbMndAOMEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ABasDuDq; arc=fail smtp.client-ip=52.101.72.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvLuWYuQQz7DEaSQA23oMTgN/jgGCbxtERuH84DV93MP3+FbeQvLcYsanxxZA6rU7SXH0GdOlweukoTjs552KsypbzVupPJCGF/bR4hxyGkDzQVQ4Xpc5N/QOSoiP0Dn7gsbfHfmniLO33R+kVBZiTsnRc9QyBMVBVOP+uMgDPtKwZGXcZDqR+SzlHu1rXlAInKbqgSdWVz24B1y0hR0970sbUs8EDajBZuQM7p3/e1pf89qgNVzwRGTbTOx0dJtgYewPfnSG7mQJCNNKE1LR8ltuN8thq3Q/WhTdDU4+33Y7mxNG3bUuGDQ6DQXb4KDxL8G5703qX52LdBrKy/jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxTbAZzPl2kyJyYM7tmn9nMCPt5ETqtocihpCCE6K0g=;
 b=GgR1MM9yZcFJCQIicKwLZcjkvSFRa+IX/vIKxdgI2PtK8xnPiwv+IccKD0GyOiqZ4yEiCvsaFiYIz7r0qWOZ37BkRMioqahqoK5beoWqbHFCl5HCzmODTRMBLOW+Hd9api0vZKrb+M0zkeNgy1frI0yRRtL0xO6If7V6DmGK8iP0ol8Y3b2oHuC4rRlCO0CuToYDfBRvf+4f4keqQepCWpuuTNeaXpQe3X9fHF/0+hNSgb9XsMPBumMPjCE41YPoh6oKrJvi59k1oXblL2aIVXqLtXtzQGrbloUPSsZ8FsDkW0PNLzOxhTeXW1IzxK1n/WcM/ijzryNH81mwKA832w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxTbAZzPl2kyJyYM7tmn9nMCPt5ETqtocihpCCE6K0g=;
 b=ABasDuDqWUSsjI60TRPoqW/M9cAEpXgt+116N/V2dfonZ3/wp+AtXnnZfEsBDv1s0dzbulvTNv5uuHOxY5/+97Ez2/aSJ9X9lxU2UVJT3Si0gnnkE04a8uEKzpVdv708sS40K5a3pnXHTVPBBgwZKgRTiQlevavhYjrXePZ4mGkFOX1iI7+4qUBjy6pOYh0Plw1c5cJeHCXYPCkn7DDwYpvpo19KqO8HrIJC8NZS7qoJJx0h1feuTgEfkkG8lY25ozbYdh//edd8YkT1i2wCFtzypyE95kWfBRk+UeLfhMj6BJtkmAuqDOMkzfN6T/Br8nt9uekGzvFt3X0hGXnmGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:28 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sun, 18 Jan 2026 11:27:58 -0500
Subject: [PATCH v3 1/9] arm64: dts: imx8mm-evk: replace space with tab
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-misc_dts-v3-1-d3564716cbf6@nxp.com>
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
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=2939;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=OV+HOTvw1Ajrgq+p3EzhWwbcLpmcPveMxd4Kere8yq0=;
 b=OaDQpH/+fYcXLeuUrL6p0wNl6/HIXdFx4LfXfCk3hh6/CzgHvUPEdN8bqSqf7vGWl23TFvJaR
 vHWaKLrgab4D730VlbLL+iAVFgqou7qxZY2Rk+JAqVJY5RczRpqLvtl
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
X-MS-Office365-Filtering-Correlation-Id: d69bb355-1f07-4f8d-6086-08de56ae9cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STNJSDFvUEdoamV6Vi9UMzIyRmxESWZEZU4vck95eGo5NkEwMVQ3djVLQmV6?=
 =?utf-8?B?cG5yRGxkYk0xWHlaUlF3RW95d0htTlBTeUZ1Wk94V3czZEIyU3dsOXk1cUhQ?=
 =?utf-8?B?K0lUWTQwUkc0R21wZGluSkVmVUpkS04rQ0hpM1VJUE9CTDZFZEUyV0pRZGtv?=
 =?utf-8?B?aFNHMDVMenNoZ2laL3JHM3ZlamZDSURxM0dJZGNrMkgvRnczWWRwL1hPL3V0?=
 =?utf-8?B?ZE53K0RNZzh6ZkNEUzRMYXAvbHhGVWRNTmg0ZE5GQXB6dWhLd1lmZUxRRURz?=
 =?utf-8?B?c1F0RFRSampZSmZYSDRNTXJEZEhPTWpCSFBpZ1Z5ZjBQM1E4ckFVTUhIcjJY?=
 =?utf-8?B?REJ4Y000MXpwY2xzc0JqMGtTaitkdmdyc20vOFJSdHE3SFBxV3JVT0FDZFNj?=
 =?utf-8?B?TmxJSldYdyttYkM0ZmNtTGd5NXdlNkJyMGZWU1ZwQ0tRWUZsY3JZTEthdTUr?=
 =?utf-8?B?WXFDL0xSVDRqZ0J1Z0FYdXNlVXBMdnRVR05Eckk3S3VVWXNrZ1k4NS9lRjky?=
 =?utf-8?B?TktIL09xMm8wOEg3MU1ncFVjbmF0OVY2Vkk4aC9YODRxOHhLalNLSG1aQmVs?=
 =?utf-8?B?S3VDUzBPdXQxZzFkU1pzRXVKU216bkRjNGJXWGs1S1pFbzdDOURiNGlBQ21M?=
 =?utf-8?B?bzBYM1BYbHd0RGwvb1JULzJjbFgrWWtnTUEwL0NmQUptZU5zdTlFOXoxQVpn?=
 =?utf-8?B?NzJvTmt0ZWd6anM1ME52ZGQ1NnNYNUVCMDd6MC90U1RzM0JQM09vZEovMDl5?=
 =?utf-8?B?bWJ5ZXFveG9leW5ZM2xRekgxbWlkb1IxUmFQUHA0ZUw3dTlHN0lyQ2dvZ2dM?=
 =?utf-8?B?NWlHS29uS1A3MHZGYSt0dnhKcjUzcGN5Y2F2ZEkxOGl0Y0FydlZJY01QWnRk?=
 =?utf-8?B?c0UweXJMR1M5YzlnSnBmem5kQVFWdjlTMXdQcnpLQ3d3ZWlDMnVWTlNTaFpt?=
 =?utf-8?B?M3BUdk9tUmx5Qm5RbVBKa1l5SUJub2grMWI1d3Vqckw3cUpJWUR5WEJXV1ly?=
 =?utf-8?B?TVFzaHJrME9paXBkOE5YSWhudElidkFybVEyQllnQUZ1bC9mNE9TWGQwNWVm?=
 =?utf-8?B?a3JHbW5vMW9NRXFkci8ycmRiQ1U2cUlDVVVERGV4b3grdzAvTmdudDY4S1JF?=
 =?utf-8?B?bzFDTWRXWmZjMk8zQ3kvbkhleGpoU0VRdyticEZUZjl2RFhzczBtN1hIVUFq?=
 =?utf-8?B?SFQ5VmxKVVRPVllpQzEyZ1lvM04xMFhGSkM3emRETlFpeGhidEdtamVzQWZz?=
 =?utf-8?B?R0hKUWdYc3c0di9yMWJmNWdOVkJzcWlVYkVEc05CSmxka2FSVjlpbVdMLzgw?=
 =?utf-8?B?ZUlaVy9xaHphTHVSaG9kOUtBMEV2ZngrU2o5U2o0WmZQK2hnNlkxSVZTbDNM?=
 =?utf-8?B?emlwRmxDZzdSNjhSREY1VUFYV1Mzb2ZWZlRSd21zVFluQU5yYlhIZGNhMHRC?=
 =?utf-8?B?cEYwMFZwVzRYSFZ4K000ZnZxUUhMSjhrQS9tZWRFUENUSlNwajh0eHFwZ0ll?=
 =?utf-8?B?Zmp5Q0VIeFp4TXIvWjRwOEt5dDZGNjBMMnFCSlIzV3JDWEpJUno1TitaSTdV?=
 =?utf-8?B?enRma2wxcWlPR3RJaEZOMXJ1MmxvV1ZLVVFpQnV4TWhxbm95N2pEVWlWY3Y4?=
 =?utf-8?B?VEFoRmRVc3U3aFlDOEptUXNiQ3lJT2tvTGFZdS9YeEY1R0pqWEhXWFhrajFr?=
 =?utf-8?B?QXJDemJqdndDNjlUcWQ2QnJjN1l6eGdsTDI3bWVjOElVVUMvV2l3MHZ2Ukpn?=
 =?utf-8?B?R1RvNkR1Q0xNaTZsL1Ixc2ZNZUN5UlVZcUxSVm9YeVhEZkt4d2NtTjhwWUQ3?=
 =?utf-8?B?QUpGOWIwRGRjQk5JaC85MHp3TjJuajVLaTlsbjEyTWE5QmhqMFFZVm5LWkZH?=
 =?utf-8?B?THZHWHgzY3o5N0lxWFFxeXJPUCszNnE3NW9RL3dmZjg4U2NNT1p5cWdleTJW?=
 =?utf-8?B?VUlzRkNFR3d0UndNT0RQMlBJU1F2RUZSOWxNaVdDbFU0V1JRVW5IWDc3MWFu?=
 =?utf-8?B?RXRrYUkxanZoeDdsNHhxLzVBcHNlZUhaTWNWdU1tYjd4SUVSQUlUQjJGK0t2?=
 =?utf-8?B?Z1hRcWpkR2VRT3RhTWJpb2ovYy9CbzZCZ05zWUlTeVNCV3VMbjBFbko1aXRV?=
 =?utf-8?B?VThrb3R4dlhqTXB1YTFwT3pvL2E3a3VuMVp1Mm9CVC9naXJnZE11K1hwRkF1?=
 =?utf-8?Q?jYNb8TiXsMkCsee8FjHuP3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDJyOWpJcWVRdnJWQzUyd3dpOEN6amgzcFZRbG54RThiYVFhVmNrUURMVEk2?=
 =?utf-8?B?ZW91TzQ2MTBnZmtjaUJ0MEU4c3dkSWVoTjdmRHVURXIyZU9VaURsdWdQQnRF?=
 =?utf-8?B?dk9oUXF2YVZhZTc2bmhSZUNNemlmNk94R052RlppdHRVVXBWck9hTHVYb2Uz?=
 =?utf-8?B?WVQzWWVLb2VxcUZpK1dHSFk5alYrVjhnQTQvU1dUT0YzYW5FTnJrVjFNeXFn?=
 =?utf-8?B?UzIzbzUvSkJhZG8rbXZRN1dhejd2MXp0VHF4T3N3Q2g0blBPblFnNVN0eHF2?=
 =?utf-8?B?cFVuVGlJckp2VHVxVW1SRkpFelZlejEzcnZSbnQ3RnN0Mm1Dckh2SmdVelU2?=
 =?utf-8?B?ZTNDOTdLWlJ5WDEwTGRkTzlHZllIRU5VWTQwNi9jNkVSK3VCbHJHZ2Fxbi9D?=
 =?utf-8?B?NzIxL3BSdVBpeS9zRm9SdWs4N3g4YVg0SVVRaHdybS9sTzd3aHY2NjBwNjU5?=
 =?utf-8?B?OHQ4K3RGNUpiZU0xYzNwR3puc2FtOEV0VVFhcFdxbzdRb1pidTJNU2dNdS9P?=
 =?utf-8?B?TGJHd093TDZjRGEyRFRZQ2VuT05ZRjdScm5XRFFSTFFyYUJFeE1yMjZKOWJZ?=
 =?utf-8?B?d0lmVzFHN1ZBSVdFK0hBWGZtS3JMT0RJcVZLRlZTbnBLTnoxdUJTTE5BODNC?=
 =?utf-8?B?eHUzMmNkYXAyODF3V2RRSEQ0YnV2YWNIU21hQkVaT3ZzeXpGM0NWa0Uvczd5?=
 =?utf-8?B?OFFqMnFQRnQ1cURhT0JnK29na0QyUi80aTQ4MGtjbjRxOU5CeHJINUFJdzY5?=
 =?utf-8?B?d3lsY05yZUw3b3dwb2hQSnFnOXVERnk0bXM4RENLcFVYSm43ZHdFWE1RZDVY?=
 =?utf-8?B?a293WVpNQm9FZ1VOaGpLZWdJc1lUUE02YzlWdUtPanViQllXYXJKV3F4Y0lk?=
 =?utf-8?B?K2N5ZDI1RDZyWTQ2cnRCaWRKR05BYkp4L3luK05JU1VRL0NVd001UjUxNDdS?=
 =?utf-8?B?dHRmaE1jNUsxUEY4cUp6NHNDVjE2SnB0dHF0RnF2MHpnMmlzMHRucms1M3Jz?=
 =?utf-8?B?VVB4OURrOW1xYkpKUEZSdGtFQ1NmYW10NjhkYXpYNmZsd3BRRTZVTE1LVnNu?=
 =?utf-8?B?azZGWkMwYmI5anVwN2tER3JFbFd2b0VHTXJIUFhidEtWMitadzFORWZrdzZN?=
 =?utf-8?B?OXdVMjZRd1BtNXBKSjFMNGVkbHprbXVZczRuZzIzVlVIL1FneEc0QkVnU00x?=
 =?utf-8?B?WmpKNGh5a3RYdnRESUdVZjRZKzNneHFJenUvd2lxNkxJWUFENXZMclZxbmlt?=
 =?utf-8?B?SFBrbUpHY01PUk9CTHVJNFA0Y09vM05RLzZFc2xLbmhLaFJUU2xzc1dHU3Jr?=
 =?utf-8?B?a3NPSlg1L2Q2Q2gxUWFWckhldDJPUGo5ZmplVGZZK2VIcXVudkQwVVdlQzZT?=
 =?utf-8?B?dFRnSHlZQ3FQVEVmOTdSRnJBWFJGR1ZkYmUrVnRUYTloUW9OdHVMS3JmcDho?=
 =?utf-8?B?M21MSyszaDBiL1FyR2xjTWpiNEovNFc4WmNoNWw4azF5a3lORHdGZXQzTHlE?=
 =?utf-8?B?d1NTZU8xK04wcEhhS1pSVUh6TjFkVG81akdKcjZWYlZoSFZKbHU2SFF0Z25H?=
 =?utf-8?B?cm1oc25QRktvdEcydFR4WnlkWjFzeVZxZXhnNjB3bVRzTVVMUGZkSjlJTDNB?=
 =?utf-8?B?UTVxZGIweWpiWUFJN2tyTzRmRTVXeDE4ZitqY3hpU01VanBVMnh0eEFxTXZK?=
 =?utf-8?B?dU9EQzMxSFpiLzNadnhlQlBOSzdrVEllaE5iblpNaDdqcFpUbkhUUkxVTVFB?=
 =?utf-8?B?dTJDUlFGUkd6WWtEVDhzQnNBQjFZZ1h1UDhtdG5IRytVdXYycUplSDhHMUxP?=
 =?utf-8?B?N2YrbVJHSXNKU1k2SkErY3BtYzRWR2hOK3BJTTlzSzlWZi9ObnVxc2FuMktm?=
 =?utf-8?B?eXFrTW50QzFKTDNYamVVRCtzdllYRTVnQ0RDb1dDajNTdkxKNFJEbTVXclpH?=
 =?utf-8?B?QTFGaFdZcGFaK3d5eTdseDgrR1FhS0lkdnA0UlBmdGtBR016aEpLa1h3bjFz?=
 =?utf-8?B?RG1EQWpkaFcvQWwxZ2xFSjRvNFdObjh5b3RlTU5ZeEJuZXVVWHA1OHNHNW44?=
 =?utf-8?B?WmVmMmpqSDF6QTB6VTRDQ3d3K3d6OUhPZXdtMXBUQUFGNEJLeWhYSGVoSDZK?=
 =?utf-8?B?Z3Z6SHZQMG9kWkt0c0lLZzZueHEwUDVPYTBNSzRBNzUrZTJ5T1JJdmtLcjBT?=
 =?utf-8?B?RVhMaFFjUUlKS3JwaVJIOWkrS2ZUL01jMjMrK0ZSZ3hiWDZWYzZWeW1YT3pU?=
 =?utf-8?B?ZVovSnN1STFHcHRjN3phTXAzaVltUE15djNlV1Y3ZXlQeFE3dFM5Tjd2K2gw?=
 =?utf-8?Q?OHVkZjl5BSMqHUeVM5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69bb355-1f07-4f8d-6086-08de56ae9cb2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:28.7660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IstJ3NIdc0AB80b6urS09YUHIJ43oIbRCyLJWuchdlQtKNn2Ag3NQu0LdrGx+AFHHsxinfhKKuVDkdsbVkPdGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348

Replace spaces with tabs to follow the coding style.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 38 +++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 6eab8a6001dbf9d88f1de93709faa3d82dc56da6..f58d849a8709485424d811f32f565590f2eb3f52 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -691,7 +691,7 @@ MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16	0x19
 
 	pinctrl_ir: irgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13              0x4f
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x4f
 		>;
 	};
 
@@ -724,26 +724,26 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_I2C4_SCL_PCIE1_CLKREQ_B    0x61
-			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21       0x41
+			MX8MM_IOMUXC_I2C4_SCL_PCIE1_CLKREQ_B	0x61
+			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x41
 		>;
 	};
 
 	pinctrl_pcie0_reg: pcie0reggrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5       0x41
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5	0x41
 		>;
 	};
 
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK        0xd6
-			MX8MM_IOMUXC_SAI5_RXC_PDM_CLK           0xd6
-			MX8MM_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC     0xd6
-			MX8MM_IOMUXC_SAI5_RXD0_PDM_DATA0        0xd6
-			MX8MM_IOMUXC_SAI5_RXD1_PDM_DATA1        0xd6
-			MX8MM_IOMUXC_SAI5_RXD2_PDM_DATA2        0xd6
-			MX8MM_IOMUXC_SAI5_RXD3_PDM_DATA3        0xd6
+			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK	0xd6
+			MX8MM_IOMUXC_SAI5_RXC_PDM_CLK		0xd6
+			MX8MM_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC	0xd6
+			MX8MM_IOMUXC_SAI5_RXD0_PDM_DATA0	0xd6
+			MX8MM_IOMUXC_SAI5_RXD1_PDM_DATA1	0xd6
+			MX8MM_IOMUXC_SAI5_RXD2_PDM_DATA2	0xd6
+			MX8MM_IOMUXC_SAI5_RXD3_PDM_DATA3	0xd6
 		>;
 	};
 
@@ -761,19 +761,19 @@ MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
 
 	pinctrl_sai2: sai2grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI2_TXC_SAI2_TX_BCLK      0xd6
-			MX8MM_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC     0xd6
-			MX8MM_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0    0xd6
-			MX8MM_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0    0xd6
+			MX8MM_IOMUXC_SAI2_TXC_SAI2_TX_BCLK	0xd6
+			MX8MM_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC	0xd6
+			MX8MM_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0	0xd6
+			MX8MM_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0	0xd6
 		>;
 	};
 
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC     0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK      0xd6
-			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK        0xd6
-			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0     0xd6
+			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC	0xd6
+			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK	0xd6
+			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK	0xd6
+			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0	0xd6
 		>;
 	};
 

-- 
2.34.1


