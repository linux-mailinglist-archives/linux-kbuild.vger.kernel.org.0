Return-Path: <linux-kbuild+bounces-10630-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C15D39284
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 04:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C9B13002B8D
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 03:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8875930BB8E;
	Sun, 18 Jan 2026 03:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AZH5+kWs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865E530AD1C;
	Sun, 18 Jan 2026 03:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707589; cv=fail; b=HlJ7X1c9rcMzgd52ujV9qjxvZnE6Z9zGC/Ab9Hnwk32dimNHwaRcAU8Y6Y+81WoIoRGlJ5Oi5IIEkuzqcXbXmUU+OTm3quyLz2vuPbeaC9wa5lUcJ0hQ8s7ACMdlwrRqIV5JMeCyQ90F8dnRxre3WmxuRpmlREBjOz9P+26Vw0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707589; c=relaxed/simple;
	bh=shHvsKTvadnpY7/Pkcz9CKkYunXVj8swpkQHVkMce+U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TNcQGgLd8C6XjpEGIa9OP4D4yMcy6gAdyy4ByxGtcsE3a+8lonDV/ryfyqavpgRAK3RfaWDjEzddiF9H4bL2OvwDGyZRcwRMNS3TizTwXXV7NutM+LcxlP2/nZ0iyn5bWcILmf5dcqNaf70iw9Ao6owLGEcyYT5NT/XX5K3uLWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AZH5+kWs; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQxtHQmv6UtUj6Ts618GAZu7nCct4N/TKmww4/mvInNdnJo0anfaJwsEeee00IRf5COX5Dw59lhJRgkN2cUvQ9E0i8KC44ob+BgIsg24N/w0rj3aLzKaVWIX+AZ7J7pJerin1iZnk8Z0GsG/v89/xFsMexhmB9EAaLe/5+jizhcNLZaxGbvD1qknNHK8siNiKY7gfsThw8weN4o/fjHkQOsBFHs66a9bP8AbwjRyVv0aoZqDANyOBfUzKJYNUV/jcOXnYVZJH95MFIvJ+XLWtPsMvuMYS+IBFV/v8IBlVYctIOppjaeCiAzStd4VUWHtuWmHhlVPxL4t/aU2ownlIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFOXcMgkwJIYv59vNCsUfi5OgsT+art8IW/UrAv6U/M=;
 b=B3LUuKGLmCo88vfGDfhpMSSKlPvqGrkqlq9z++Ck28mERvbA2EY+SpmwPCApNS7jR2FoxePwpbKzc68zKCXEWR1Bsvr2oqtkTo1FrihZu9TAdGh+VvDL9k9cADpJO/F5i+SyHXZjyDaY33/G81UmbiHhCFQRYN8dtoAuORHdV0qvrphd1qWLhTylTRaiDpkeJXHTH1pFrQ9K4mM0r3oixtNSX4gpJqkt+sUV4uwMcm7mtFpKNwqzQR4eN9THN9li6L7HUSia9lC/PYxvp9Fe/PXRxX5zaob5iDYmgeToVegGIdXwQP/RVUrHgXH3cpvk46s5afcpT7JDcnkybyim6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFOXcMgkwJIYv59vNCsUfi5OgsT+art8IW/UrAv6U/M=;
 b=AZH5+kWsGP+X+EaoJe6kFlxAlhxmlJl586TRTR0ukfpyQYlP30VP7FiSUTx+Nt4H5vX9OhAU8Xyb+7Ou2Q+4F870sqs2O/7P5y/Lh+x250sWBYXSCJMcdKIBmzWYk2eylbQ6CHSrz9iS/l4Ze4U10G266hOWmK/UuUG/2rWjB2vSGGTdpi5LsBzA3JnSX7fkWgYh2SYzErlJAV5sKz3Sg4pkj4vvhLPEQZCI19klRhimGcGdy4/Tikm5hyrJHDTkxzWfXrw8J1Eu1HvF95O0OlnSmdGYPXT5PiJX8TPygG7fMi5m4ibBKoXOxmdH8fvU733QeMyYWJwUMcgS3UAyMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:32 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:32 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sat, 17 Jan 2026 22:37:40 -0500
Subject: [PATCH v2 6/9] arm64: dts: imx8mn-evk: add bluetooth dts node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-misc_dts-v2-6-0f319c7e9b55@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=771;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=uG04miELlkG9b3Dtx/9qcoI9g6Fip2oH2LQaCWN7op0=;
 b=DdUKxPB8KoYapk06e1zy6GGZB4Bv0pS4RC3QLjizJS1D6/9EV+ygVaK8MckflYRiqWlN+IV2k
 ZyRfq3SiPexCGeP73Pr4aKQAjPYawKgv1i6hPcuopCDENONJHc302+y
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
X-MS-Office365-Filtering-Correlation-Id: e8e32f67-01fb-42af-20ec-08de56430d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emxSUEo0STRVcE9PM1dHWVNmcFF5b1podnV3K0REVG54RHZkV3V4RmhidXBx?=
 =?utf-8?B?NDQ3d0xDZzFZTHJYclZyelB6T091VCttSzlSMm1lcmI2N0xvdnlPY0ZzVUFq?=
 =?utf-8?B?OHMybkpHRHBwTENXTlYxcjYvU0dQUlNJd0kvU3MwdklsQkRpb25McytLRFlQ?=
 =?utf-8?B?bTgvRkNuRlp0YXYySE80V2xsY3VEWk8vbEpqQXVrbzhXTTFSeCtyd29RR2Ri?=
 =?utf-8?B?RVQ2WXpXNnIrbUVGWGtyOXVjZmVYNThqV0RUaHU5QlZrengrQ2ZtejZ6SERm?=
 =?utf-8?B?d1FFSDd1dllMa0s2VDJzZGRlcFAreWduQ0FvMUlCRjNVNk5VUGVmNFNGamtZ?=
 =?utf-8?B?b2JBNGQ5TkhFV3lPNW5lT3d3QWh5L0t5eXE4VkhqTCtaRS9BRkRMUE1qK1Qv?=
 =?utf-8?B?a2EvOWJmajZ4SDd6b1d0VEZ2eFJnMThRdlBFTTNhN0ZQc2RvSUN2QzAva00x?=
 =?utf-8?B?bDN0QS8rTWkrc1BLT1dzaUR3dUpNTmhrU0dkdnhwVnF6TU9MbGc0ZU0zTjB1?=
 =?utf-8?B?WmdsV3hzTENGaFUrRVZKWUQvdTZkTWlmTVhxOUxPaHcvaTF2WENOMGNjbjNu?=
 =?utf-8?B?QjBPeFNWcU9pMTQ4Wm04Q3Q5cVB4UHF0ZUZGWGJNMjc3Q1FNbFlRMFlseWlD?=
 =?utf-8?B?dEZrcmx3eXZLMzBJbG1XMjlWVCtLWllqVEUxWUdidlhQNlFGTUpvTCt5ZGw3?=
 =?utf-8?B?Q1BzM1dvMFRva05sVXU2UnpIcmlQT3lWT3VESWtYTWFsdldPeUNsM1ltV0Iy?=
 =?utf-8?B?VnV6eG82NmExYkNMeUs1MjgrUWsxRVJQdFdhU2JHbVBwSXIxZ3gzRVNaYXoy?=
 =?utf-8?B?RDVJckRtSUVVSGtlRzhkdWd3QkFtY013ZmJIWTVsc2hCNnBPdlI5WGVTQlh1?=
 =?utf-8?B?MTM3WldTREVENmlLNU9WUnhUWUJ3Rzk4UGEwdEdQZlJsbktaeXk0N2VNcVNa?=
 =?utf-8?B?MFRkTWhuTEQ0T2FyZzdabUdxbXRhSjdaVkszV0tadWZpOXl6ZmZZa045WHF0?=
 =?utf-8?B?UWJmanBQdjltZU12Mm1iNkZxWWx0QjhVbGxOcWVWdjl3SFZnUUhTeGtlVlFW?=
 =?utf-8?B?WmZzSVhCT0c5Skw3WHVoVGV4NXFpKy93UVBSK0FoeHpMRGMrYlNZNkJuVnJ2?=
 =?utf-8?B?ZVN2ekwvaDFLOTJZQU1jRFNBU2xxV3oyaHB3NjltRFVYZDVtbUdjL2lNQ1Ey?=
 =?utf-8?B?NE1mSGRTUk5IZzBadTF0YzdFUlowc00yNElLdGYzQ21lTEo5S1lRY0twcEd1?=
 =?utf-8?B?TmxkOHlOR2dhbWNyOEswY28wUE1WRnFSRXNGRnBGVWdiMkhVNitmZTByWVZ6?=
 =?utf-8?B?TmhxQlFGWEtBUjczSzFTdUU5S2RBczEveWFOTHFQclNEdm45RVhLMm9KU3Qz?=
 =?utf-8?B?ODlDUTJBSEt4SXV1TGc2NGFta1IrVEhNUUFJb01OVVd4dUpPRjFkNkF5RlZk?=
 =?utf-8?B?UThXWGx0djFxcmFZQk9pd1VHb1BQeVlheGJxK2tkNTdTdXRtcUNmMmljOUhr?=
 =?utf-8?B?YmJRVUVUbHpKT0JXRXFubWZvUUtmd05VaHQyZU8vMDhBQkZRSmwwcVJRaU1o?=
 =?utf-8?B?Mjl2MUpEMzlkbGtVYVVVS0JYUHY5QXdjbGo3bWhXaXJ4aTdvek9oM1VqYjkx?=
 =?utf-8?B?UWdQZXNGZkw4ckpOR2p3MmJWTzVmMnVPYmphSzErVGlTS3loL0NHTGtBd0JG?=
 =?utf-8?B?cmNCaEttOHNpb2VHVGJlMkM0a1l0NVQzS0dzRk1ibk42OWJkT2h0UXFHSUFV?=
 =?utf-8?B?NjJxYlppUE1WdGhwTkNsT2M1NnZPTEdUUk14b0NSVlVLRGtRTG5SOFBvU2tV?=
 =?utf-8?B?MDFmV2dOU0I5ZjBodGM3Nm5ESWFZdEpxZEdvTFJoUE1uY0k5N29SbTdlQmR4?=
 =?utf-8?B?MmhuRnNNNVZsNWxZMi93ZzFXQ2tGeE11N0RJQzJuWjdWUjVWMFo4NU9PQ1Vi?=
 =?utf-8?B?N0plMzd6Yy9FTnk4cTBBYksxU0xCeUZwUkJBcDRMU2hWczR0V1RuaGxHc0Iv?=
 =?utf-8?B?TURqZ2R4Q0tKaGNxOWFPOG55MUZIV2RIOFE3TmJuRlFzYlVXQVRVWHdKMi9U?=
 =?utf-8?B?cWdOQ2wxOUN5UGVqL1ZrU2hLNXdQeG1kU21qRk9hbTloYTlRWit4UWRsdHZO?=
 =?utf-8?B?M251SnhKWlBjVnNtcUZ4R1ZvYUlQK1JyZTVwMVh1Z3Q1enpwS3BaR213OE8w?=
 =?utf-8?Q?3WtgcMq+itm7JfSoLhAjOy8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnRCaGFKY0ZjN2hwWHMvMXc4dFBnc0lhNmNaalhBTGk0UjE5WTdIVDh5WWJY?=
 =?utf-8?B?TTNBdkJLWDIyYXR3ZWIydGFJaXN6QkxlMUFsTHNLMmxwN3NIR2Y3MWN6S0FT?=
 =?utf-8?B?SEhxYnROTWgxQmNiQjlDbmdpYVMxeTNqdFUrUUFVVHErTWtmMUR4U3VmZm9a?=
 =?utf-8?B?OGFqSVFObktkTU94L1krMjVYQjBFTmxmaHAzV2FjcStqZWwxUTJKdGJlc3Nm?=
 =?utf-8?B?cW45VTFBM2twZFpEMTdBOE1ZdU40R2lrd0dlcDFQdmllWnNuUVlQUmhEY1Ux?=
 =?utf-8?B?ZE5kMDJQNk84SFIrVHc2cVk4MHVCaVhBalhGZUF2SWhLR1NaTU1FbTBwNTdq?=
 =?utf-8?B?aE9ZdzBvajhrN0R4MWFjbjBpbFB3VVlFMTk2VWNpSFRUSXBOMXJmVnVadDR3?=
 =?utf-8?B?OGFxdmF1aFV3N21jL0IzQkNPcmJhS0xrZnN4bDFwajBCL2hYMzJUcUNrd2JH?=
 =?utf-8?B?WGpESmNWUlUza2ExRWdwcFF3Wm1QOHpmUUt2bDRPL3o0V2lCRU5ONHJUOTlL?=
 =?utf-8?B?c3F2cmNpLzQ4b2VVSTM2b1hmaTRYWnZUQXRpTEFqMGhOMlZ1S3UwQUUxOHZ0?=
 =?utf-8?B?eHZROWRWcURXbDhJSkE3d08xNFY1aFE4aUNYbFFFNThaekZUR3czSmJhZXdh?=
 =?utf-8?B?cFB2ZndLRGFCUmFjNWdyR1pvOENhbEovMStWNnFpWklKNHVkMU40bWx6eU13?=
 =?utf-8?B?SjlTUS9rVVo0WDFvK05CVHNXUXl5QXhmUkpXd3VpY1kwb1RxTCs5cHdPZlpt?=
 =?utf-8?B?L283cktrRC90SDlEdytuRkNkWDhyVlJidmdTRXczVWNRemFUR1FvL213emVX?=
 =?utf-8?B?bUFKUHVNSkJOSzByNmliTkcvRVZqRHNWbnRJTVJMbjVlQWs2SWYvMTZUalVX?=
 =?utf-8?B?bysxZElxekduOWpWcTNRWlZmQnlDcENFMkF2cmVWZGpvWEhhMHhWTk9IZlZm?=
 =?utf-8?B?Q2RxejdCZHBxc2l3WmFHMjV3bUl1R0FiZzg2RkhSUno0azYyN3RtQzFoNWJP?=
 =?utf-8?B?cUtYTWtKMlBpblhQREtrSVRxOE95ZjIrYUVLemVGSEp4NCtIVjZoeWxOa2Ex?=
 =?utf-8?B?emFtdG5FZzBud3pNK3lHemNDTHJYc1NxTGtvVWJoclUxNzNIVW5mc3Q2ZFhk?=
 =?utf-8?B?NWhnMDNUTFVzRTIxY1lRNGQ3bnpha1VKOGU4YnFIZjFDRjJsWDdHNGFnVG5F?=
 =?utf-8?B?S1ZnbmZiUk0zaGxhY0V2dlRDSjRud0xrb08vSEQ1RE1SaElPQ0oxdGJ2ckxv?=
 =?utf-8?B?c3ZDaDF4WXZtc29ZWkhoMHhwZDNWVEh3UXdHZDBmOXIzWkcwODBkT3VCbnhl?=
 =?utf-8?B?aFc2K0RkVmNCYndRL21Nd2xCZGJVU2JBdXB2UDZjZTlWc2N3SUZiNWVRSFBF?=
 =?utf-8?B?U28vdE40YUo4NlVFcTl2S2hYWGJVMEg0bmVreVhzbkNsSWJEVFVVdDNaZ0Nv?=
 =?utf-8?B?Y3NuMml6K0RTTmxNZ0RNeWc5cjRBL3BpQ2ZQbEwyNTAxTkwxa0lKVzRWUEtN?=
 =?utf-8?B?eUUyb3IxWllTWHlhbFZ1SjNEVnh4ZnY4OWp6VStFMkR0UzBYbWJ4WEFPTHNp?=
 =?utf-8?B?V0hVbEdHNEFQRS92eWR0T3lUdG00WEk5RmJFVWZGZms5QTRvaDY3VFB0NGVv?=
 =?utf-8?B?N2Q0VWROSVlhQk5LWXQyUyt3YVR1QWFGTWd4c01jQkE4Vi9RbzBJeUtLdnJZ?=
 =?utf-8?B?K0kwb0hhVlBtOU5ZTUFhQWxkcTB2dlJ2TkgvVlVnVXY1aUt5RDFJSG5ZQkxP?=
 =?utf-8?B?YUxtOVE4V0hGSTd1eVBlaTZGTVZsdjhUSEFqNEd6WHpSSHpuMEtRcWdad1FO?=
 =?utf-8?B?OTUwSWdMV0hINU5Xd1AyT21YRXJDWEp4c3FYOWxXbnVsN0hOWTE4Y3IyQVNP?=
 =?utf-8?B?THhCTGxPNFNGd09rQjVtWHZ6RUVhSE45ZDZ3TFdXWnJHQk9FSDJvV2RQVFVu?=
 =?utf-8?B?dEEzQjlUWFF1Y2NHcjBtSWF0WUhTNzIvUkVDT2ZKK3hsZWsycHhMMzVHbUJ0?=
 =?utf-8?B?UU9KdG9jd3FkQm5yTWl3cDA2eGloN0UrcHhTcG4xZzlIV0w1b1V0YVI1ck9P?=
 =?utf-8?B?VHhjQjlaSkZ4NXIyR01ha3pUYmV2NnFHM0x6NUZmRklUa2VRaDBZSWlPYUdW?=
 =?utf-8?B?YVRGSmtsclBsaHFlL3E1VGh4VWM1UTRwM3M0U2pqYXF3QmdScExXVktYa2kw?=
 =?utf-8?B?MGowdmhuV1lneDlrSkhZUXppSG1wUDBUb0M4c25UbTlTSmNVaEZORS9FcGlP?=
 =?utf-8?B?dDFlTDNIYVZJbExtWm9OWnROdGVvU0tESVpybzFWKzRZWllIdkdIRzZqeDNl?=
 =?utf-8?Q?R2sicPpo+c3mPYl4yp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e32f67-01fb-42af-20ec-08de56430d4f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:32.0507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bGS+ObPWWodLqC/1q4HxQeCdWfkvrMJrNJA7YBCqKG6Z4XM3JL//fRtw383WGz7mGzvQCZFAFGMrRv+GbKb5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

From: Sherry Sun <sherry.sun@nxp.com>

Add bluetooth dts node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 145355ff91b454795478b504eb403b0590848d46..3e590afa4fabb0cd881d87c953459f9cf2b3bf65 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -415,6 +415,10 @@ &uart1 { /* BT */
 	assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_80M>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
 };
 
 &uart2 { /* console */

-- 
2.34.1


