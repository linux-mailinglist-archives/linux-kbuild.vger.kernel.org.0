Return-Path: <linux-kbuild+bounces-10638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22951D397E8
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A39E33021FB9
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 16:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A6E228CB0;
	Sun, 18 Jan 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cAQTceNv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E421D5AF;
	Sun, 18 Jan 2026 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768753721; cv=fail; b=Wsi5+ZAO6FlFlEAo2bxQ8RtdjspzkEKw3gW3kan3AF+cFJKtEpgY+2PHRVCzc6IZgRcxw5Cltrnm6703Vv4dumRAscADUZZAUKUCB9vM4R//L4eeTAF7y+7ATLfHVeSTRNebY8yPGhx31Yp59tw/BpcJ9UD9uo4K01m19VkvyBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768753721; c=relaxed/simple;
	bh=FuvXm18QEpP8eUO5qN8OMCzfyDpZaXBvkKmUHashOfU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=n4WEnvho/sXOoQ6ruiBGxBVQMevKiCCmMifsYSBBDNhiT1WMREE8VTgodYd7Q6tY+NtNZqxKSoH3RSVlez9eWaPZPsemvzN/ITMo9FOs+AAcqt7PhYCmjVEXhjffwwZ4nOmEjvdp4gYCMkz4h0mQVwNs74gjLE+xborq4Ge3DZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cAQTceNv; arc=fail smtp.client-ip=52.101.72.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1xjjFk9nUgM7pnxmddnO5wtLs5rPX+1R12AIpz62snLCim38Bt+C1UHxyipTw9SFpnKKONcUHI8zj2owpzKvOzJ8OCsUSWc2q6yZrH9QD5afymIIt9eTi6FHGw5v2XX5dzHN3XOVxH11PfWwzHq5t+jSi2AdfexWcAcQln2XemxxeOUAJ+cQyCecel7LTzB6+DLBrD4NFdtw4oCRSfUj1WMh/M/EcIpsuTikirv0t+dr567xbgMXbO6DXtOpJJi/Cs6VrFTrW+O1VrWdT+6MA+mMCTbpqsveU1N87lgxI3yx8n86gC1SrwrsT4VBkvQcgQGoi5ZzTyksuwT9nSv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPDF9W/lTkAoSDPj/8A7uCwJhkanwZjOFxX8Hju6zjA=;
 b=XetNepc9PfVbedvV/iDwNQzYg8BjkKcndVK2jA8Ijd+5+8qrbB9i2VYVQXsGnO/iQsLwXJzW9zTwe7BlgilMV9zNGf6nVUojJsn/ER6zS0V1d/jqCMujtBoWvNMuNCi4GcjojeOlH1/fRUa30K21zhTcGYosUrfnbY6gWX9nol42tC3OSTAvyEqm6qU2uZ4b6xxbkTXHOTWJoyfkU139aHl8I1W3+VrRVkSmlePTfX4ieZ12cTU/jQwbVghzE8jXdRswJwhzPiYqunLAeqXEA14NzunYGVL0YwszuVVKc9CpwBLbe7zzgKNhkAX+Ab8ashYz2SIowiFn38ijJkGPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPDF9W/lTkAoSDPj/8A7uCwJhkanwZjOFxX8Hju6zjA=;
 b=cAQTceNvIPh36AHD0cawirF/RmdjOrKvF4tTcFeNurryEgzveiGW++6P76xDenRiVwxx7NQrbGZD6guQHHnGJP2r2WlRa9P/QVEwYfxmw0jZnh7Bto9RPmEmHoA5GTPF4TIIS3n5XcHcNcZzXJOuX0wjab35LvB7qNz3aFJ7YCAcy98RDQ9agm6Q/FYh6nTYljl5VDpjlGch/rZWmmlQt0Bxad/ibQ+H6+FQjv6E+bqtoYxAGXAfWnnwJZyBsEKmecVFvKb8xAo6oShOVM1UgrtBBuIs4FIPEHrLNAfVlQLYcn7OQfKksUofCtbnRx5rI7U4bgts9I7vZuRNGMmh/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:35 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:35 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sun, 18 Jan 2026 11:28:00 -0500
Subject: [PATCH v3 3/9] arm64: dts: imx8mm-evk: add uart1 and bluetooth
 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-misc_dts-v3-3-d3564716cbf6@nxp.com>
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
 Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=1428;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Aakr2MDTWYDz4wEhoRuZyZDiRkC1stP/8vm1jDQCzjE=;
 b=AIhLwKXz2bbmyMuDk7H0pfoK/bgf59RLbmaDy5r03hALqk5qQRdgND+8Wwibyez5Hm84Eg8To
 fROs5ewH+cqCa4sT56HzP4GD41jPMIwdZsrFAA6OUqbd3Wgsh/IWidE
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
X-MS-Office365-Filtering-Correlation-Id: 26b34c25-fba9-4346-5137-08de56aea08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWpWY1NGNGhQK05oRk9MVUpUL2VCVk5mUzBMTzlZUTN4QWYrcXdCc216STNR?=
 =?utf-8?B?Q1V0bThhSGU3cWU0MEtNZmR1MUg1OWN5aHBKK1ZORHl4VHZWbjYweHJKUGxr?=
 =?utf-8?B?ZDlhOG0rSWRkZSsxbVR6ZTNWQ2VVWjlLeXpIdERwbTdFdlBnS3pWQ1kvbEJx?=
 =?utf-8?B?cWxIWXFGVEZReW5KOE5SaksrOXFtUVU5Z1dwYWVUQ0E5WUo0OVY3WjlsTk5k?=
 =?utf-8?B?TTJMeWFiNUFNMzZ3ZnhqOXZ0SVEycU81YnBoR1VLWkxKN2ZwVm1vRGZBYjdX?=
 =?utf-8?B?QVpyaytPV3loK01qTnJMZ0YrNUttV0V1UEFJck0yNmQ0d3JPZEhKNjB4OHo2?=
 =?utf-8?B?KzU0QVJMaUJkMXFWaXdORkpjNU5RU1NrSkdtTmJVd2ZxMWg2QjI1dDhkbEVR?=
 =?utf-8?B?MFBaNDN0emhNSnNaQzVwOUhiZFFESDkyWTFQbmpuU0VmdTltZWNhWDZkMXJK?=
 =?utf-8?B?MWdKSml2RVFieVJydWZESzNVcG90QUVBc3l3dS9UbHdZTUtXWDFBV1ZhaEhH?=
 =?utf-8?B?d3VMRmhiVjVRcW56ZEJ2RnlDSDFib2RLcU0yVXdvRm5DVG1jQlRnT09tbUcy?=
 =?utf-8?B?QkxzMnFyUmRHMCtVb3hCMVVXazdIdHQzdjlaN2d6OU12RmZzYklPdDBudGVE?=
 =?utf-8?B?RGhnODZ1QUQ0UFZZRmxyR0lFYjFPeWYySnliODR4c0FORWFSWCtGcE9sYjBD?=
 =?utf-8?B?am5KdDZyNXY4WGJKam1qVHV1MjhiNlFUY2xURWpVK0VHTzk4M25wQlFjMTBW?=
 =?utf-8?B?SE5VZFUzUWR3YktrME5LekdGY3Y4d0ZvdjVYMGR4SDN1MFRndFRCL0xvR0sx?=
 =?utf-8?B?bm5RZTBOS1ZqNERqOWhqYkJsSHRZd1Fib3VTaTlNZkdIU2NJOVRNS2dMVjJa?=
 =?utf-8?B?QkU2WnkweVZVRXV2SzRod0FzYTRIUU4xSjdXa2JiNCthTkZpRE9icVY2Z3k3?=
 =?utf-8?B?YnY0VE8xQmNITnllZXduWFhLZlNtR2ppL0Q5MEhxbEsySkFHcGh2MHJHekNp?=
 =?utf-8?B?YndUNkxMbWpzQ0RLWVNJNndSK1dRdzR2NW44WU1obTJwdFBrb2Q3VjJGS0Y2?=
 =?utf-8?B?SElTbVFicmh3QVNoL2VLYVZYT1Zib0lpUEhqOFNPQmptdmVoSjc3WDVOZnZ2?=
 =?utf-8?B?bTFxRE03ZXR3ZjVOc1BseEVLbm9VY0VGbHBaWFFvU0hTcGRUWFUrdXlhN2lT?=
 =?utf-8?B?dU5lQ080Yk5McW1wZXZ5SHhHaDRUY0hJNzk1bUZNV21VanJsZkZaR2NUS21K?=
 =?utf-8?B?elVNL25EekN0cjBrcklISTNLN0R3UzBHTUpRbjUwME1QSUdBellZWWhCZStD?=
 =?utf-8?B?dmJvUWQvVVZPT21mZloxTlQ5cktWYVlabzBKTkorRGlLTm03cW1oeWViWTcr?=
 =?utf-8?B?dWlrYXVuTUUxZGVZbi91cXRDNUtldnJOS2UvYlNwVHNKSngvdVR4dGtjN2NG?=
 =?utf-8?B?SEN3WXdZNWdJdFFhb3Q2L2FUS3ZsSENXRGNWZk0xdVV4N2NVbjVtNXdBb1cr?=
 =?utf-8?B?eThCVEUwU0FkQmY4MmFwSHArS0VuQS91Um1IVy9FN1FkNzNzMzBBaEhJMkhR?=
 =?utf-8?B?WmZ1M1l3dzg1dmxOSVNVYmphSHRnbjdGZzBWcnVML295MWd4THZoYVMxcUM3?=
 =?utf-8?B?aDZ5dDVmMFdXU1JGWS9TeXRhYzJPdVJCYldEdzQ4ZkdGZk9JZWVYNTIwejZI?=
 =?utf-8?B?bVcvenhsblFWNzRJUjZhMVR5OXI2K2hDVkZZajlyUDJTbDdMUHBkUElBVXJu?=
 =?utf-8?B?ZlcvNGlzQWdOUk8vV3JYOHJoOWNlVm40VGZJdEs3VG9FQnZvUTR1THFOMmpr?=
 =?utf-8?B?dlJPcVdlQzlJRnlIL3RHVFYvdFQ1SHNReHdrRFhPci9ySFBUUFFrOHZxalph?=
 =?utf-8?B?RTczSEliVzBiUFVTdlRnTFhxYjdOeWl2OGVrNHN4S0d3cTI4KzdzbEdXRHVO?=
 =?utf-8?B?akFiekdkSElSazVzRmpXU3RKRjJrZzBaQ1NISXc4YzdibCtOaC9XR3ZkV3J3?=
 =?utf-8?B?eUZOaDlYQ2Vlcmw5Vzh6aS81eW9pMVVCSExGNUMvSG5EeHBFZktiTk1rUmJM?=
 =?utf-8?B?bm1EWkI0WmhRZk5ZUDBMMWFsTWVhWkN1eml3UzZXMFViVDJzaGUza29yV2JT?=
 =?utf-8?B?elRLaWFveno2ZzZjRDZNRllvYjlqc2JnQ0NYckMvNENYZlBUdmpqM055bzhS?=
 =?utf-8?Q?8Kcu1Ab3G+/V8RJRw1MRQjo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UW5ubnBXei9wUys2VG1ldXExL0s4dFR6WkNJY1pIb1hnR1AybmJ4cS9RckNB?=
 =?utf-8?B?REx1Y3ovaHRuWGl1T3pRVUJ6eWJMRlVSbXd2SlJScThHYVl1allMUFkxS1Bv?=
 =?utf-8?B?bFB6RWVTZVVMc1NLdm1pTW55Q01pZEE3UzFnSkhBUnNCdnV6dTE5V3RnS2Ju?=
 =?utf-8?B?d1RLWUJnUWttSVRNc0lEVWlSYUIvdWNVOHFLQ3U2ZWhvQVpreEdqeDVBWncy?=
 =?utf-8?B?MUsxTjh0TXgrSnFvMWllNUluM0tjYmp1bGhOR1BJSEpFYzVwT1hWS3VKV1lp?=
 =?utf-8?B?Q3dMZXZXVTFUSjdqRFgzUmp0NXFaN2NpaE5ia2x6QjRDcFF5Zm1HOVl6eURF?=
 =?utf-8?B?THBsMEdjRFBPWGZoVEQvbzBaSm8rTy85WGpyVEd5Q3BUbTE1blEzWkF2T05n?=
 =?utf-8?B?cWdrT3V0ZCtkai9wc1hyR2w2SmRYcjZVSnRDdWpOTHk4aUNaY1ZzK0ZHeVlO?=
 =?utf-8?B?Mmlyd0tjUUxuRXQyclBobXBtakpnZ2daS1ZYVzVyK2d4WG9hY1o3ZVdsY0tG?=
 =?utf-8?B?WmhNNTZtblpyTlhmUG1nMDFPMnhZZVVURDhzMzdES3Z3RVNyNlVQUlRDRkt5?=
 =?utf-8?B?SDQ5RzFqVWdYaEZMV1hqWno5c3NsMUZJVWZuRGFTQzBBZVQvMFF6WVNBcDVD?=
 =?utf-8?B?alJvQXFySk1OMCt4K2l5d1N6ZkpxM3MzNUthU0NCWU1QVUxLdVNKdlIzNlMr?=
 =?utf-8?B?TnFwSkZ1dmlST0pkZ2ZPcFRteTNhTVMvY1RHVkIzWmNSdzhsUit5Sll0bkFt?=
 =?utf-8?B?VG1VYUJUWkluK2duZmhxT01rM1lMcVFTWWwyRVpjdXpUcXB0NDVDSVY1Y3Vy?=
 =?utf-8?B?WGlZUmhwU1c3Y3JhVVJ1dXFIdTBERzB5MHJ0QUV1UDZlY2dlVUlhSU5zZ1Jx?=
 =?utf-8?B?UEo0OTlKMHFkakJSdkk5dGcrQXdmMWQzb25mejNsYXBZS3k4RUhsdWxLWXkx?=
 =?utf-8?B?V0wydnVwdTA2cWE3OHh2Q1ErT2tUbjJBdXNrcXNZa0VWTzdKTTlnQnd5M1Zi?=
 =?utf-8?B?RnRTV3o2dEV3dGgzZW1KQ081UXp6OEhaSGw2YVZHR24zc3V3OWh2QXVsUnNh?=
 =?utf-8?B?dkZmamNqNmNTSFpZT25vM1NRTTJsSWNjTE02bXRTMUtyNGlXcll1dDMzKzlN?=
 =?utf-8?B?MU9CNEl1VVRQRHNRUFk0ZDVsUlZIVGV3UlNmOUxEMllvUUphb0JDK3V5NmJK?=
 =?utf-8?B?Y3MzY0ZqdmJNcFZ2UEZhWUZzR2xkMmFlSU5YUVVOZHlQSGY1M05FaDRaVE0w?=
 =?utf-8?B?VzJ0S2t6Z2VudGVVSmcyK1ZGL2JjbzdwM3JGaThSQU1hUW1JWkl6bGFsYWhW?=
 =?utf-8?B?Rk01NGE1eFRxa0JYK1NpajlQTmcxWldYV25RZmh5MWsweWg2aHhGa0d1SzVn?=
 =?utf-8?B?dXlsei9jNlBIVU5KMVBMZUx6YTFXS0x1WlE3SVFPeVhDVWpGN0VrcXVQaS9F?=
 =?utf-8?B?SE1lOFdoSnVlMzdiV0Q0N2FSSitDVlBMSXRhenhtMThVSlVvV0VUTDNhNWQy?=
 =?utf-8?B?NjFQcVJBY1BLQzI2dUdMK1BicmJzMk1KWURLeUtNZmZKdm94eVlnTzVpWEZI?=
 =?utf-8?B?QW1zdGZmZDNzYm1YWTIrZGpRaHJWV0gvWFFJZUZTQ3oxTVVmMWhMV2k0MTh5?=
 =?utf-8?B?aEEwTGZzVjlnTDRUcW5HMkFabTdOd2EvVXlmdmNHYXpPMDF5VEg3QzZPV1Bn?=
 =?utf-8?B?OGc5N0ZkNnhWM2FrVXgzb1VMNkFsUkFWaHd0cnRiOXIzbktoeDdoNHdSR0V0?=
 =?utf-8?B?M3lpVEk5NEEvd0hCZUNIZ3ZkeEtWcGpjU1NNTWFwS3hlUVY1ZmRKc1BvOHpj?=
 =?utf-8?B?NVcrQXRoU093VFlWQW5qZERRR25EQ3N3c1E1a3VDSk8zcWhoMUNpM1RDRVpt?=
 =?utf-8?B?cjkvZ2t1UnpOTlVrdW5lK0x6NnF0RGNFR2R4ZXBoSGZpYUs5RE1BelhtRGVs?=
 =?utf-8?B?bXRCSjJGSE1wRFBaMmsvbVNscTg4TnROTmphZ0NwNkljT1h2OENuR2svbTE4?=
 =?utf-8?B?aUkyQ0hjOVBBM2hSdlpUWEZIZ0FseVdTUHJZZUQwNkxkNitGazVVWUVEaVpH?=
 =?utf-8?B?TlA5NTBHdjlBd0dJMFZzc3laUXJGL0FxdzdLTERjOUNTK1I3THZONWFBQTIz?=
 =?utf-8?B?emxXRXN1YkkxUkpRc2ZPVGNGVENXaVZrMnBaVm1WZFhkb3JJOCtGeVpqTzlO?=
 =?utf-8?B?RXZDazVWVWNSbTQzeExNSjRka1E1SHAvVjlKQjUrMmpDM0FpbVg3MUdoQkdp?=
 =?utf-8?B?MEs3RlFwSk1helNRd3JKbFdmc3dYN0NjN0E2bXpNUWZpb2NDV1NkbDIvVHNN?=
 =?utf-8?Q?SJBuR2t78gAa4f5rqj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b34c25-fba9-4346-5137-08de56aea08d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:35.2125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXjWIFo6CMzayxqUXNy3IGC9IqXFZVmopDsHUFjjGx0mXpTuDYAyIeCAkHvZnkSe4jKlz6zvwJHmW1+vpvI4Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348

From: Sherry Sun <sherry.sun@nxp.com>

Add uart1 and bluetooth node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index f58d849a8709485424d811f32f565590f2eb3f52..30b13b4d630f8b8b0531fad531081d4ee32849f9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -608,6 +608,19 @@ &spdif1 {
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
@@ -790,6 +803,15 @@ MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x159
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


