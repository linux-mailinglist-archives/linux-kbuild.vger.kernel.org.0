Return-Path: <linux-kbuild+bounces-10632-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D0D3928D
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 04:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77C1A3033BB9
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 03:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316DC30BB89;
	Sun, 18 Jan 2026 03:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ffdHx5Bv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8786621ABAA;
	Sun, 18 Jan 2026 03:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707591; cv=fail; b=M0ym2YA4rgSldrznh6KFxj5U3Lj9nQALEjFZZ6jgzqNUrvbmnNy1jkZa6PF/xahPzFB1EJCFZwm3CNaF9ix4UUH3xPDaT+oYl2kLRDT38Ma1o3TeP9H193EZ0FWTbBXQ/AXca2W372pxOr2gDVGMi3qixel8ueQXMCJSXy5aUP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707591; c=relaxed/simple;
	bh=bSWNP2BbwNfZCO69628ASv7rmwa409pab4HdsublQ9o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E0r+OgZYfSgmO4fVVF+GpWjWfNv6tXQ6qnPfkNOpEENlkmS2QLNsilh8O7vsTi9nQ1U+uIwxS8wmw9hJfQyP5+L6PO4KnXPcCvUQ8VyLy7KeEp1AOVJ2ZeXO9+dbIHFld5kh7HgnDaSQWmKyEfH5YmpslqPV68oUZu8D6OWA13I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ffdHx5Bv; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGHLJPFaZeBAwHyazwFSkOx94sQLrmh0ojD8luQqvIWMYBm3HWLKpsm0gElnXbSt8tT8Epe6ZlBg1NGH0JNFIw7TE0MbIoDYubvBcgMGEUbgZK4A3X/+NAttepcnhG8edKd+wpeYpFS4fq1zGk9/9WgRpgQGduodF9r850YKeRu22nrkdWNhlWn8IOcpZ0EqPVYyfoz8ORB4GGXkdMhCVZXov1xRcYcW/JnhQL6dGsUZP54vM0WNa27yqABnv4TqUzDqCAwsiVg8KjoL7OcVZV4LuqfXVIju3nkRHqC9G7zpOj1n4tkMInigV/OKeLRkjkJFdu5BXIGNrW06JINeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBwyrfwOUZptlvoARDhZz8gBzuvdYTzP+s5Y2p0EJWg=;
 b=TkIkva5+UQd1eHvzDKOKMwODw+fJJP76E7AcivhbhHUAQgSWyB/X7oD6VSicDkKjhbAXR5QQMyoT8SvMgOg/v+RWnhWZKODVmsRbOtXzTzNQbvKYVTBkKznAoI1dXlqL8DQrPJakpe+vZ4b/qCbVAByhq6jeEAx7AVlFDg79v06ek49VaC55Hj0/YdhUjYFUTRq0PLNgo4tqs4oWkodS8kWi7bXa8EV5OEuz1q8XG6sA4+fkF82lwdWexb/MKYm7YfyLtM+C7K+jjElP2nK3v9YpqAK1uIsJgeuI25oUtjcRpaCuNqv/icNJ1NzrpNVPjn/Bv+46w4OrmS5Kt3B8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBwyrfwOUZptlvoARDhZz8gBzuvdYTzP+s5Y2p0EJWg=;
 b=ffdHx5Bv9AjKZmpEXbF3Js2om0bmR/YhmQMGdzPb7jqT3nkFRHFl1MU55ymCs4EjZPSm4Dwsoub7OieJpVjIyBcmPnk7LpxsvHXuUy7MVL23V7orWi+VXdpgRZZSm7OFlgAfnD8bbOSJNDNZTUPDcU4KE6MgU3GRvgwBn+z0eLWLOJlgS0vaO+ELk3DafoGEDufAq/zb1W+0QdMUj1RbOnMLMNyyv4XLZDohusGnUd4qJuWj4oOnskTLLRcW8f76tAjRkd0PQOtG+8kpP9VTa6gnhfHFntUy64rqiEtMa6kdRXd4tybYQAoQGx9clAcsfgczuwgmDpoikQmjB/Lolw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:39 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sat, 17 Jan 2026 22:37:42 -0500
Subject: [PATCH v2 8/9] arm64: dts: imx8mp-evk: replace space with tab
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-misc_dts-v2-8-0f319c7e9b55@nxp.com>
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
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=2556;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bSWNP2BbwNfZCO69628ASv7rmwa409pab4HdsublQ9o=;
 b=V8sOFpfD/mZBr6QjdEt1WiFZMLgFGvX9RyFwM6Lc6bcAxtTLBChRATTHyxbnES4x9Y+hfaK6f
 91tKuE9zBe8BPD8Iut4DMN33vRzN9QqYAbdprr2XLysQD+4g8D991KK
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
X-MS-Office365-Filtering-Correlation-Id: 8f7dcb16-881c-4b53-e631-08de56431142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1M1ZzdJM0d2TDhGZi9SZmJrSzBTSmk2U1l6YTJ3UlZncWo5bVBOZzdPZ1R5?=
 =?utf-8?B?NG82aTZlSUpIcjlsUHV5Z1h1UzhFc1k0cUR0OHhKRFBhZS9id3hUaGJKdnJS?=
 =?utf-8?B?dENqa0JtaTdOYTBhNWlkeDBLNWxqTFhyOTNuWDQvNFBSSEFqZVVGcjdhY3Ry?=
 =?utf-8?B?VHpOdk9lRVo5alpMWXRMdEp0c05jTWlqNjJ0MkZaZUwyUzRuMjhkcCtCcEw2?=
 =?utf-8?B?eHdEdVBPUWo4dW9UMlVra0FQL0RRQ0l1R3NxKzlmaVNHNGROZ3BUMG9IcGwr?=
 =?utf-8?B?N1BMM1B6UlE3WHA5Z2RRYkRBcXV4YW4vcDRiWXNIa0l5bTMzYUwrL2poSzlJ?=
 =?utf-8?B?eFJYUzVqODZjSmJXY1FLZnhXQUxuYUVWbGJ6Z1ZqTFRScjVJS01ocFdNTC9Y?=
 =?utf-8?B?ellFN0hDUDQvK21iajVyVWN6dFZvMDVJa0FBeTVwWjRmczYzMDlRWnNLSlJn?=
 =?utf-8?B?Mlo1WXR2N2dwaEp3ZkYvRU1NUjZZN3FrOUhuaUNWWVo0dVIvYmpRNE0vUWpl?=
 =?utf-8?B?S0k2Y2tnazVlS2U0dGtackVhUTRFSTQyMWpQOWluMGJPRXBIY1k1ZFpMMVd4?=
 =?utf-8?B?c0h6c2pmdzFyR0MvUHZpdUxSNXBwV1JVQ1RxYzEvN1ZZcUttK0dtekcxSkt3?=
 =?utf-8?B?THR1QkdZVVp1V2kxM3NVN1A5bkk4OUJqUk4zQUV6dkM2anpKaFZrZkFoN24v?=
 =?utf-8?B?NTM2QkZBSmJrdjJDTHlwK2hrVjRhNG9PVTc2SEdIRDUvaXhQUE44SFBUVnFn?=
 =?utf-8?B?TEl6ek9OYmtxVDl3V0pWY2ZOOWhOTGMzQWd2NmFwZkVqMC94R0RGaGcwVUFv?=
 =?utf-8?B?aE1iOHhhRDJ0cFY4d2FkcmtIOGJXZmF6U0gxdHgrS0ZMZ2lmM3Zmc1UvM3ZP?=
 =?utf-8?B?UFRXN1g5ZFErUmFXc2Nia1lrUUZ1NkpkWXRzRGdwMzRhaElNb2NXd2p3aVZv?=
 =?utf-8?B?N2ZreGFUK1JvN3ZZaEowejJRWnIzWmYxazRyazFuajE0SjZJOGRXSHdOZWE5?=
 =?utf-8?B?OExKS0I5Y2VZMnZJOW9vczBCTFZNMnAzNTRyUGwxZ3ZnTUJPQUFJYmV0cGFj?=
 =?utf-8?B?cjA0TDRDRnUwV2Fnd2lWbTRpRFRrWjB1VEpFcmRMbmNjZ29PY20rQU1lTHpR?=
 =?utf-8?B?VzhkbGZnWjk3UittUTVQRmYxYzJoT1NOTEw1K290bnp6VW10ak5CeUxrSEZG?=
 =?utf-8?B?eENmU210MjY5V00xbG5sY1Nxb2V3bi93UVhuNTUva3lEMXJLOGhVcXRHd2xZ?=
 =?utf-8?B?N2tVK1B1czU1dnM3QjZwK0kvRTBKZWQ3ZjhOejNYYi9VZlAzMlVTY3F4SWlm?=
 =?utf-8?B?bGJSZFEvMjU2QWR3a1lPMml0bUlHMWFSZlFkNUtERW9BR0FBdzF1MkFUcTl6?=
 =?utf-8?B?bm1EYzZtMkIwQTZic0RYcDE2VHN2a24xaUFma0d2RHZVaXVoZ2dVYXEybUxJ?=
 =?utf-8?B?eVJDYjFiam5FT1hDcncxemluMDdKcnM4R29KaVNIczZEcGJlOVJzaEwzYkZw?=
 =?utf-8?B?Q3JhdXM0OFJPcGxQK3dGTlJhWjF0OGxwNEtRM2dmWGtXRHRBMmpiZkZSWFNh?=
 =?utf-8?B?M1M5cG1SaVJQbHpPMThIajBCRHBvTzdoNHFnRGd2cmFIb3JXRGh6b0M2ZC9V?=
 =?utf-8?B?ZUdGeEYwQ3V6cS9QMTlMbU5ia2NwNkdFYlVLdXpqQk9sSHE4R2ZIUTlYM2dT?=
 =?utf-8?B?RGl4bjMyM2JzZXllRE45VjMxblQ4NHFBeDBEc1Z4UlZPUFl1NWRSTktmd0RP?=
 =?utf-8?B?ZE5EY0lXQ2JlNGZwZ2ZjTkVNSzcwNHhuUnpMc2tXVDlKWkltWnpyQWgzd3Na?=
 =?utf-8?B?NlNyRlJ6Q1NNeXZ0ZmlMMGNzR0ViK2UwL3crWStuU2hma1FjclVSZ2pMS2pG?=
 =?utf-8?B?OWhaSnVRUXJaQjRlQmFSVzFsK0FzL1ErWFUxTXpyQVBCbXVyOWVxRUN6Y0tj?=
 =?utf-8?B?ZTJYcFBtYWdtNWhTQkY1WWlWRG81c0VidEFOVGtZSTFKWlJ4RW45QWRJTlJo?=
 =?utf-8?B?cDZMMk5CS2t6VFRLanhQV3E1dVRRNDAyVUkvRlVlT1VBNUl0Q1hZQmdEQ0x2?=
 =?utf-8?B?NU9NTWF4eFMwRzdYRkVLUTl0ZTFzc05MY2Z1MXBMN3BMRzRuL1Z3TmlnQ1FS?=
 =?utf-8?B?cFkyN2t1ejc5Wk92TGVDOGFteWpON29VdWg4TGs4SnhrTWVISW5SVmZCdEFD?=
 =?utf-8?Q?GQmvpZh0bEEF0U+BG+XeDPI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHNZWG5jZkRPbmRxZ01RTDFhZEZTMjlvUnJTQlU0VE9HclJQeEtOTmM0eHAr?=
 =?utf-8?B?WXF2cVBJc2ZJQmt4RkVzN05PRUd1bEZKcldwWVFRcjg0bGVWZXc3ZzdVN1Nt?=
 =?utf-8?B?S3ZEZFV1bUwyeW1sUXRuMzNEWWdRYXdXWmc1RDU4aHhQS0pSMzBlZTR4QWh4?=
 =?utf-8?B?TXhZUHc0Rk5DV2RHUEpEdTdvc0wyb25UdDJDS1BLM0NualJUc1pXenNXQXc4?=
 =?utf-8?B?dHArWnV2bkNOTkJNVmpXSkk2ZlB0R2Q4UnNkMEM4TU1UUzBmcHNudU10VGNF?=
 =?utf-8?B?UUxDR05VdXpiZHRsQkdjWCt1UEZqK0ZrUUZ4Rk5nb28zdmpZUDh3R092dFhN?=
 =?utf-8?B?Z2VuYVIzOE03Z1NtNTFYbHNqd3l6Q1IwaVJZMFRJVHNzMW5KMXVrWWV6eDg0?=
 =?utf-8?B?b1BKaEVuRG5xUGFvb3h4WjJ5QWYvengvY21TVHJBSUNCWVhWd0ZhNzZ6dW4r?=
 =?utf-8?B?MFpEcWFZSlRWWFA1KzdFZW03WEFhTFF6SjFYdkNyR0RieFkxc1ZEaHRJUmFB?=
 =?utf-8?B?MW1acDVYQTVGTTJVMWV5U1JBYzlXaXlvZEFCYzJXaXVmT1E2bXpwSGZwTUtl?=
 =?utf-8?B?S3h0WXNxS2Zrd3lQMCtRM2RJVnYwWkZvd05MdlZQTUVzdGNmcXFUaGs4ckQ3?=
 =?utf-8?B?ekdOY1FRejJzWjU3elFZS1NCZkpNQmhDV0JWZUIxemU1eEFOS3VscitSUVlF?=
 =?utf-8?B?MVdpalIyQUZ6TjZWeVMvbXVtOW1jSGwwT1pGSllRdGdQVjhoR25oKzVYYy9u?=
 =?utf-8?B?L3hncDJPN3RUaTRuWnBuUFJHcllreHlXWmI1bzFnNFk0ZVdCUnMvNUgyYStr?=
 =?utf-8?B?YU9hbkVDK3NRdjhRbllyYXVuUGYwNnFGcUt4Z3MyNHRmOFFLcUNOYWI2L2JQ?=
 =?utf-8?B?V01hMHlQeDI5ZGpjMVpPL2VRV1pOWmRrbzcxWDVnYjFoTFUvdkhxelB5S0wz?=
 =?utf-8?B?TmFBS3g0empRU3hicjVTWFJGd0Zqa0NXVkFPcFNmcXZNcDVkZFZUWGZVbkc1?=
 =?utf-8?B?aVVwdTRLSm1kL1pIOXIyYlphUjhGM3FXK09lRG1pWnpHMkJvZ0VXdExydXo2?=
 =?utf-8?B?c2x4eG9Ld3ZLYmg2MkZwclNoUmJzTkdMUnR6QVRkSkZzcEVidFhtRnZBOCsx?=
 =?utf-8?B?L0JUNkduMGl3QjN3S2szWDJYYzVmMEtGdlZGc3ZFcWJONVM4NWVFMG9CMVlx?=
 =?utf-8?B?TUdFeW5UT3YvUG04T202ZXkvcW9XMjYxN2VVSXhRcjI0Y2l5SDY3akJWRGRL?=
 =?utf-8?B?enpHYUlJMTE4K2p4a0c0T2FLalk1dTBIdUJJb0poVHliZGRkNUU1aFpCQW9l?=
 =?utf-8?B?bHhLVWIybEJxd3llMWVQWEJBNXlBVHB1U0RENGI0SDJLNlNZYkYyREcwSmht?=
 =?utf-8?B?dncwd1BrWithQ1dWdkhOZGEzUHo2ekJKT3h4b3dTb05kcU0rV1pNSVJTNER4?=
 =?utf-8?B?UlRRMWZwZU03NUZnODFOWFBBMkw0bFpOUzdxOC9yeHNxMVlRb1FpcStBcG0y?=
 =?utf-8?B?aGYxb1lZS25ocHFOSkpaZ0g5bW5SVnpGYllvclZINGNqL2tLbUx3MktUM0Rl?=
 =?utf-8?B?NjhGb29CMHgzSnlZOEpFZ1UyT3ltenpaQzF4TU5qdU9XUGltWEwvMCtBRi82?=
 =?utf-8?B?Q09yNlNPV1NqU1lsNlZ3VFJNTHhuUERqc0g0WDBpSjd4dlBSRXBOV0dhVDgy?=
 =?utf-8?B?RGRGc010MFFGNEtjMDd1Tjc2ZlpaWlZ0bGsvTXpQRTNodEhuU050d0RkTXVD?=
 =?utf-8?B?M1A2dmxHc3JMbzkzSUtvNHdjOVpyNkVLY3lBWXQ0RjJNK0xNTEtRcG4zb2FB?=
 =?utf-8?B?S3d6VmovYnFPZHlua3lZYWF0bnNaVVM4YW5DMTRqQk1XNGFCQUtoMzFEeVBC?=
 =?utf-8?B?Nzgwai9KVjgycTNIeTBpVkViZ1JvK0FaQWZiK1dWTTYyMTdhNW1lbHBML2Iy?=
 =?utf-8?B?eHNFaG5qdVNYTUFSdXhubDlsTHZrM0UzelE1UkZ6MmZnMHkvclFkb01pWXJl?=
 =?utf-8?B?aDVuVk5aaHlmeVFXN2JJVXNyQWNqRFdtS2tFUHRwWmNNMllJV0VNOHF3Nnps?=
 =?utf-8?B?aGg2bkRpdDV1RllWZTBKdlgyQ3AycFc4N05xdlNUUDltWGhrT1BEUlVWSHd1?=
 =?utf-8?B?SFRybzdod1JMNnZTcUM5SFRKdlk4clFQUGh3OGRKeExaUEZFaUhsVUhNN2M3?=
 =?utf-8?B?bk1VbnhMRm9KMmdqaXFkdDJvNTlqOFEvcFZNWkJ4LzJWN1NoVXJPMG1TUFVI?=
 =?utf-8?B?SldESU1RSjRZNHRrSGs3TURhZEVNUVBKMXBXdmdRVHN4K1BIVnhubFYvNUxT?=
 =?utf-8?Q?BDXphyH8FVWSVA4BYQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7dcb16-881c-4b53-e631-08de56431142
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:38.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fz8ecBKYs7wELwvD2KBRWh/RXSQC9B/+DZ8JQEsrdrO2nNzPoZkw9f4ECLODYWSfOkmuxbDvBbbk0x9NTLOEOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

Replace spaces with tabs to follow the coding style.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index b256be710ea1281465f5cecc7a3b979f2c068e43..053c5e91f5aa3aad941820071fe7083e5c18447e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -965,33 +965,33 @@ MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x10
 
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX          0x154
-			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX          0x154
+			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX		0x154
+			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX		0x154
 		>;
 	};
 
 	pinctrl_flexcan2: flexcan2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX         0x154
-			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX         0x154
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX		0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX		0x154
 		>;
 	};
 
 	pinctrl_flexcan_phy: flexcanphygrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05  0x154   /* CAN1_STBY */
-			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27      0x154   /* CAN2_STBY */
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x154   /* CAN1_STBY */
+			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27	0x154   /* CAN2_STBY */
 		>;
 	};
 
 	pinctrl_flexspi0: flexspi0grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK           0x1c2
-			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B        0x82
-			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00      0x82
-			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01      0x82
-			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02      0x82
-			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03      0x82
+			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK		0x1c2
+			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B	0x82
+			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00	0x82
+			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01	0x82
+			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02	0x82
+			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03	0x82
 		>;
 	};
 
@@ -1044,8 +1044,8 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c2
 
 	pinctrl_i2c5: i2c5grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA         0x400001c2
-			MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL         0x400001c2
+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001c2
+			MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL		0x400001c2
 		>;
 	};
 

-- 
2.34.1


