Return-Path: <linux-kbuild+bounces-10635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F1AD397D9
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 089B530011B3
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 16:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E2C21A453;
	Sun, 18 Jan 2026 16:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mhemEvsy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0271B212F98;
	Sun, 18 Jan 2026 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768753710; cv=fail; b=RgxohGN6fpWpMXiqGsOHgWZpbmiVgjd7FpL4xHWR/5+sx2e2psDiw1ScfMCTWYxuxiNyf7bNEwCLzWI6lVqPjWxboPT0FZbwr2nBGoys3WF3BBGeh13CvrfHAT7R6Lf9bRcifGlF7ILhIElYnxfUP4KkV4k2a0CIbCt92WTwMws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768753710; c=relaxed/simple;
	bh=VRNTmLmlDH0+BY2FccVI7c6bdZnuONPexTAhn2WNxBQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=OcSJby2wT5VNAIJ8ez7dQOhqxPfDv2DOdIzjKgtc8F6h1RFpt4fcK3wCb5+mqlhU9ZZlmMzHW50QAa79WmWBq0OmPnrH5iBIb5OHlLqFW4XmYIekVhRkFobRNdTefd7fIDnjGwBm/axsEmQBy054QNf5iuHX9D1PjJZl1udbrBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mhemEvsy; arc=fail smtp.client-ip=52.101.72.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNFl9gEIQ66BYhr6Prl4rgvbH/VtTCXbl0JcYOawKZN7FP74qHCw/oeXsV78dpqobopmrp8PZDCRsjMan6ysmpMeFvOx/w4vxA1r2/QLmW+M4gxcLxBL5qIU3SsiXlNYWsSTyOslVJhdYbOmUQogWTqqgKSd8sdJC8Gh0BfzUrrZSxuCC9JzEmVgjSSirzFU3IINTJYBMFJzPWk8cM5iB6AKMr7DJ9L0Fnk9gENBryt7gCgzAHqjIzvTlxlGk2WZJ6JlJJjohIRYEJ4pge+yh5ln4W9N9SLx9HOX1oi45yRBhiC7Zml5956Zrm1CZvG79lwHS8Aj+RPAAcf1t3hDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ff4rCTjnl4oJ9IWB894Cu3+MQXIEJIQiPwuH4sTZ008=;
 b=O0KXAsCiYIlbJL7bGdT9Orl3Ie2BxRxy4xI3gpK28DH2obItEAKA7D0+ED7nrNyewXwfZeLuz8mkQFsDuPmI3pnAsKiMDSGFolkeb6z3bkofibIvzpL1sYGcolh2dzrK9lp5B2OGQ1QW2vUMo8X7vUBsvQpjE/GCNErhQChgLr3xhcmViTZKr+1Y7o/U9IP47Wh8cyaivMZg4PnL0QHLxKmvUMsPOCeAW8LkEs3+g3NlHHNVjFAw5gg8hazCv+JAcLsphT8O4nsMdfsxIjxiSHvaM5MVCme0HxkExJaIEMKMLPGM/3aaEx6pfcbLZdNXbGNLef1sxPDq7fe0NjN9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ff4rCTjnl4oJ9IWB894Cu3+MQXIEJIQiPwuH4sTZ008=;
 b=mhemEvsyW1RwRI1v5a+NlsF+KyjHx+nxUDKjAxplhAhY7IsLIR+ZlOxIITPKCN7zO3JqIRYZkN3C0G1i1z/BKikQZwym9zP7ZMQv7p7xsVF0bHG3jrxhyPjF0MF6XLPruEdlD6+UVZ+UMkrlv84eEb6ebKwkhhUBVpaW6YAsWPZKYn6+TCuMkiQ8skYhDz2C9/J3hmdsQwQliQxEmCr/gl0O2UmmxL4ixMxSriV23iQDAPj7zwUlQl7MPVxVMG47Q0khC5qEbFJ4lCsrGkxGLLARVzrQklEUiccHGEygXOOxZgIxCuhqo7BzqrKF+9FqaqPURyTQG5ygPjLSql24cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:25 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:25 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 0/9] arm64: dts: imx8m*: misc update
Date: Sun, 18 Jan 2026 11:27:57 -0500
Message-Id: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA0KbWkC/02NzQqDMBAGX0Vybko2GjWe+h6lFF2Tugd/SCRYx
 HdvlBZ7nI+d2ZV548h4ViUrcyaQp3GIkF4Shl09vAynNjKTQioAUfCePD7b2XPMEMvMQm2UZfF
 8csbScqTuj8gd+Xl076McYF+/ERBnJAAXvFB51mib6xrK27BMVxx7tieC/Gm5APj7HWTUhE1BY
 2F0o9Spbdv2AW+UQifVAAAA
X-Change-ID: 20251107-misc_dts-c4cc84f1ae5f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Sherry Sun <sherry.sun@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Fugang Duan <fugang.duan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=1586;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=VRNTmLmlDH0+BY2FccVI7c6bdZnuONPexTAhn2WNxBQ=;
 b=OHVhdldC05ETsoeAeqt+FUqx6hIeK17pWGRR9QejMXTY4qbbAtRLdWL1em88+iVh2v5URx613
 5NgAfx+kpnBAaXw6KFZGLYuZN4KubzaIBKrHxYSeAIg6yLS0/Gkigk3
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
X-MS-Office365-Filtering-Correlation-Id: 096a0c88-c8de-4e47-28df-08de56ae9adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUkyZENPeXFFYVVqZWZVY1ZXcHFwTGxWeW9YazVwc2wxSllaNWl3Skk0Nlo4?=
 =?utf-8?B?S0NndGNJeDVLRWRSSlhVTlprZ1VvckpSRVFDUEh6dEFpQXA3UDgzdHYxNlkr?=
 =?utf-8?B?WDJhNnVlMTZ2QkkrNmV1MklsQkNnbUxzU2p0Q3lFN1krZnRJbi9ld0tWNXdu?=
 =?utf-8?B?WWUzMTVjVUd4YkZWTk5mcDNDcERsS0dQZXdKT214UUtHcTJXTnlDVzloK20z?=
 =?utf-8?B?cDNPczNlckt3RVlkV2RYZzVrdDZEUGFpTTJEYldqdHR0VUswc2g5aGtjQU9V?=
 =?utf-8?B?MXMvaFJFRUtVSEJEZXdJQ0JmV3NyQmJTWklweEszdDdMQThkSFhNMHlMWE52?=
 =?utf-8?B?aTZyQ01Yenc1ak1JWW15NlZxK0phRHpTT2tqWlhibGZsbzNIUzVCdHl3bWlt?=
 =?utf-8?B?ZTFqN01FeEdSS2s2elBVTGpMWjRvamM2d1dselRMOElrVU5XSWpTTWF3YUdE?=
 =?utf-8?B?amtpK2ZnQjg1aEsrTFRLeUpKdWxrMzJDYUEybVc1MjFIcVFjdElpNDRaSHpv?=
 =?utf-8?B?YXZiZ0J0dno2UUJiQjJiQ0s2VjAzVFRqWTJjSEpLN2JsSWgwYk8xdDdEdEFL?=
 =?utf-8?B?TittTzdEZkpZWjduU2NPeE00NXJmZUxvQkNyMytKL0xBaU4reHBwcU96SjJZ?=
 =?utf-8?B?T3BLcVZWZXhGWVVjT2JoSVVEZkh3eHRDVzNmUmFFb0lGRkFLM3hBc25hQ2xm?=
 =?utf-8?B?Unl3NEVacWFEcUZ5VWFXTWZrQ3ZBMExHRjQ1d2lURmNaNmx5OW1TV1JvNkIz?=
 =?utf-8?B?bTlyWU9LaTZualNCZkpZM01qTkE3QkU2Nk81dmR4NkhwbFJoMitudVd6aHda?=
 =?utf-8?B?aTdkODR1QnVvdjNLUUdFQ25Ub1Fac3N2Z3hRWklSS0hkNnVyQU14Q3NGd1lD?=
 =?utf-8?B?M05RQ2NUa3pxaE51NEo4OGFZSnI4Yi9SejBIWGdvZDB0ZTd5R0llRHErell3?=
 =?utf-8?B?Y3lvbGJGUDRNWE1nUklOVlF5V0pwUFljL0hFTm03ZjJRcDF1U0FoRUtlVVhP?=
 =?utf-8?B?TExiOGJQZEo5U2tHeEJIaEVOcDJCbFZ3dmMrNG1VemdnQTVVb1hkeExkcXpS?=
 =?utf-8?B?OVRxUmlqcDRIR1RjL3NXcHBGM0lnbWExMW1ycGxtaTczRXJGVlJIdEVDWVRT?=
 =?utf-8?B?UExSc1pnTjg5a2toTnNGMWRHaC90dG9QZnR6Yk43UFBrQzBWYjZqY3l3SU9x?=
 =?utf-8?B?OUg0dVJzd0pkUXRtZWlybWZYbGRGRFhPOTVZNkRRMHk3dXB5Uks0bC81YWN1?=
 =?utf-8?B?QW1EQUUwUStVRWxndTMvbDVUWGtQYmJFZlV1OUk5YXBkZUI1ZnVUam82TitZ?=
 =?utf-8?B?ckt3UE5UYmJOZTQ0aWp0NFc4QUlvRndXWGw1TExRS2h2TlJHOFdvMmx1U1VQ?=
 =?utf-8?B?Z0huSDRYQWtwRmh6Vzg4eUFRY2gwUCtxdGpwUnRNaDh3UG9OZGgxYUYzVHZC?=
 =?utf-8?B?TVdFNk9jbnNULzFacmhRWTNaSWYxWFBMeTZnb1ozcGRDN0NTRU1iWWlMV1Yw?=
 =?utf-8?B?czhFY2NVTWhZZndHODVRS29udjJpQ0V2Y1J0aE5yZ2ErTDV6bTVJeWxMa2p4?=
 =?utf-8?B?UXdsaHF0MG94bTdZR2x3bUxyYkxRUjZkMVdqUHcwbWkzQkdFNU9XZVFYa1Q5?=
 =?utf-8?B?K0NUU3dKQnFrdkQyaHBlSmVzaVJpZm1JcjZXYk9GSmxZYjZYRjdUcUdBdzVJ?=
 =?utf-8?B?cGlxd084WDg2YWE3Wmg0VFovbUxESy9KQUFidG51UTZLRjVMWHJOUnVId054?=
 =?utf-8?B?YWl6aENHYUx6cDFjTGtSNitYd0pVSVhqR3NKajU1Z2t3a1EvZ0xURENvdkRG?=
 =?utf-8?B?K0ZNMDViQnB1bmhUVjRoZkV3QzUvUGNwZGpBVUkvN0xFK2JGK3hndzZ2SVdS?=
 =?utf-8?B?YmhMK1BvVi90YWRFUmM0VUFiZDIvM3NaWlVSY0ZpSUcrY3B1OGZWL1krN0dj?=
 =?utf-8?B?SmVrMXlrMzhEeDdsbWNobUFOVlAvOVREV2xNaC9xVGFqczBiMGtMWGRZSXhU?=
 =?utf-8?B?cU1oQTR5cUdRbjVnY1FtRDgyeXNPcDB2OG0xMTBZOW54UTR1KzJ3eU9HMExa?=
 =?utf-8?B?MCtMdFE2cUMvcFI2dkZwellydWh5NTF6QzdlYWtWSEY5Znc5MlhOMFVlK01l?=
 =?utf-8?B?S1l4NnI2aHQ0Mm1kSnVZSDlZdmw0bkdPaVBhTjFaSzAwZEMzUXJXRXhrT0xE?=
 =?utf-8?Q?ULIBOKDBBA4q0btNbtIknq0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnY3RkMwSTZyTzFVeDNlYk05QXVxRmh4KzRjQUh0akNMWjNEL1k1eE5TV25P?=
 =?utf-8?B?bmZhUmcyTHo2NW1VMW1zK1FZNVhrQW12bVdXWHllUVp0VVh6YXpHenEza0FC?=
 =?utf-8?B?cldTNHc1NVlSRjJjRzBXdmR6Q09EZlZ2MkVMSDZXQStKdUs4Y3VmZlJLYndQ?=
 =?utf-8?B?RnUzK09FOFZobkZBcDlvdWFRcGxSazdMbDhRS3hXZUw0K0tRUi9zaURKemNm?=
 =?utf-8?B?MjNuMFVsTU5EcTBMVmpLNjBEdFNWZ2NWMDE3cGtHclMvVUlHd3I1VmtESCtj?=
 =?utf-8?B?WFB4Q1lRdmNaRjV3Yi9uQ3VQcU01Zy9lTHBic3dLTm15VW9hZzdxaDQxTi9P?=
 =?utf-8?B?b3ZEK0pnWTJ2cnJnanJHQzRsRDlFNEdmSEY1Wnlzd0NDLzdhMm1KVlZpWDJE?=
 =?utf-8?B?UklHVkFJYzFrL3FsaUpZWmJaRXBZZTR1THI2YTBORENEOFd2bjNKUHRZY2NM?=
 =?utf-8?B?VXhJSU0vaVlvM2gwMlE1VnAvVjdJL3pTcDRwUTY4RWMwdU55WnNSTTVha1Jt?=
 =?utf-8?B?dEpBNFBOcGlWNEJNNmo3S2NEMnpPVzgxSDRrdWtNTGRpMHdDcmd6TEd4MzVY?=
 =?utf-8?B?TTRkWFFzTmhQVk5teHJ1SGh3Z1A4NkxFMFVoRTNHOEoxNWg4SU9Ob3dlMmV5?=
 =?utf-8?B?Y3RqeGc0TW5teG5zVFlkZ1k4MENsYytGVUszSUtoSEF3a3hNVDFNSkhMdkND?=
 =?utf-8?B?ejhzcUVKaHUwaXVCNTVVaThCKzJGV2tWRm1QaU1jb0dCeUY0Z3BMemZtODFp?=
 =?utf-8?B?bENqSzYxckJYN29BbStoYlpPWVNLTVlvWmdWdUppcnVMeWQwREpabTZRdmUw?=
 =?utf-8?B?RWI0SW1YMG1CbGdiSDRRL2k2QlFKK05CS2tkZFFpSXBRWXFFRURwa3Rsa0Zs?=
 =?utf-8?B?MjQyWkd3ellHZklmZERCRk01QlBWZ0dlRnNUVjBsR2hRa3JyVjJPcUVVV0o1?=
 =?utf-8?B?Tjhpa1NXN0NJeE1EYmpneklMeEhHenZtMW9OOFdUZUszWEVlVnVIdTY2VXRG?=
 =?utf-8?B?RWdzb0ZJelhZRjZzZStVV0U2N2JVdzIybDdCeGhvTGJkOURKT3BNeWRmOEY0?=
 =?utf-8?B?eExIa0ZTUmlVUVFhSE1xbmxOVFJ6aExmM3psUUdoWDVKSllyUmpBUVRwYy9S?=
 =?utf-8?B?SHZvZlFWazJ6b0dSWFU4bFlFRFBrTHNiRk00c0NJY1hWVkEzSU1COVB2WEdK?=
 =?utf-8?B?SS83bnB4ZnlWVnpPQ09uWUFlTURIUUFVU0p6UnNFbkxTcW1XUHJNMGNJanVS?=
 =?utf-8?B?QzZiYldZY3pBWFF0NmQzYzZncldyZ1EyMHdaVUVjeTdUbFgvL0tGdG9MTjg0?=
 =?utf-8?B?RXArQTFGcW5WUzZEWHRZb3NJVkdLd3pvY2oxS3V2cXEzNEhBR1hQRVI1MlVY?=
 =?utf-8?B?M3AxZWxwVFZVaU0yeGdYekNnWGtnZ1FvOWlGSHl0cjNRbzI3U2o2dWlWVEQv?=
 =?utf-8?B?bXRSZTlZWUZ1UzR2U0g3dkU5clllSS9QcnV4SnFESzBwMVRpYi9WbzBLakI4?=
 =?utf-8?B?S3craUxYUVlHdHpSYWhmUWNXYXBVSVBLM0E4Wm80c3F3VjY1ejFNOFYzWG5i?=
 =?utf-8?B?K1Z6VVVlTXc2MS9VZ0lrT1pNT09KK01JNkViQ0VnTlpic0diRnJtdmJzVkQv?=
 =?utf-8?B?WlRXME1PSUhHZWpVZUZrclVGMU9LVk11NHFUdDdBQk9kbFNCWTNoZEpOVFhW?=
 =?utf-8?B?UElnUCtYanpXbHUwYldzYWRpOTJjL3BlOEZyUkhwblJSUWl1eVNoWm1lSmVQ?=
 =?utf-8?B?NXVveUtoa1lRTWJlQzlNWDU5a2Q2aXlwUG5wL01zczNsd2RnS0hnT2lhUDlK?=
 =?utf-8?B?ckxlRkFkVk9yclJDdDBnMXNEZDlKOEx5UTM0RE5walJqemFoYVhnaTZLZmQ3?=
 =?utf-8?B?bWlSdFFrZVRmNkd5d0JWRkVLRnNGekVJUVJLVHJIUHpEd1g3RDVVWUV3b01T?=
 =?utf-8?B?UTlFaTFXVnBpcjhpZGtma3kyV0IrNVVSM3k3d0htSkV5VDJBTU8raFRVcTRX?=
 =?utf-8?B?aUVxVTlsNW0yc3UycEloaXZYV0tZak9oMkFsNStrN3NsaVJJbFM2RUpNYlNB?=
 =?utf-8?B?Rk1QYzBYNUZ6VDlhVjk2RXJBM0RzWmJTR0JOMVY3OFg3YUhXSXFjdTAxd21n?=
 =?utf-8?B?RlQ3by9QNXVHVHk2cjFNYjlvMVJtZXoxQTBTVnhML0xudVQ3TTdyOTFweHMv?=
 =?utf-8?B?TVNMR0xoanNnY0prRS9vTzdvVmVPbzZHeDNJdm1Tdlh5N01UeGF3TVFKQTlR?=
 =?utf-8?B?NmVyQkpiUEtpQk1QaVFrSlZjbU5HS0E2ZWtBSHREbXJOY2Ira1p6ZU1ucDBT?=
 =?utf-8?Q?KR+MBf3ASvYGeoqOaV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096a0c88-c8de-4e47-28df-08de56ae9adb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:25.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ic8r5VIMa9dyM04tUekLVK1/p/J8xXXDMt5txFDpuJtMg6yyQkefgOxg3wr7J1IFbH4V+LiyL2wDyB2BkkQPng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348

Some misc update for imx8m* dts

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- 8mp-evk bluetooth change to nxp,88w8987-bt
- Link to v2: https://lore.kernel.org/r/20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com

Changes in v2:
- rebase to guoshawn/dt/dt64
- fix typo, should be imx8mm in patch
      arm64: dts: imx8mm-evk: add wakeup-source for usb phy
- Link to v1: https://lore.kernel.org/r/20251110-misc_dts-v1-0-7564b9f69a18@nxp.com

---
Frank Li (2):
      arm64: dts: imx8mm-evk: replace space with tab
      arm64: dts: imx8mp-evk: replace space with tab

Fugang Duan (1):
      arm64: dts: imx8mm-evk: add uart3 port

Li Jun (2):
      arm64: dts: imx8mm: add wakeup-source for usb phy
      arm64: dts: imx8mn: add wakeup-source for usb phy

Shengjiu Wang (1):
      arm64: dts: imx8mm-evk: correct the spdif compatible string

Sherry Sun (3):
      arm64: dts: imx8mm-evk: add uart1 and bluetooth node
      arm64: dts: imx8mn-evk: add bluetooth dts node
      arm64: dts: imx8mp-evk: add bluetooth dts node

 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 78 ++++++++++++++++++++-------
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  4 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi |  4 ++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 32 ++++++-----
 5 files changed, 85 insertions(+), 34 deletions(-)
---
base-commit: 3e315c88a3362a1fc92302710eca20b865d28226
change-id: 20251107-misc_dts-c4cc84f1ae5f

Best regards,
--
Frank Li <Frank.Li@nxp.com>


