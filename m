Return-Path: <linux-kbuild+bounces-10629-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B5AD39285
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 04:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5377B3008F56
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 03:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA0E30B528;
	Sun, 18 Jan 2026 03:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T4Ruev+6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7F30C360;
	Sun, 18 Jan 2026 03:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707586; cv=fail; b=B9j99etnnU1Wf2UGf6095tHwgwCDJv1Z0CbyU7KZexZ3zmBV4+sHi9GSLp3r6N8cp/MTmy1S5p4Q6JO4RIYJeA2muAG3xlsdLp+8h3yeVyuhcgD1vJeqAy4QtEJmH8xJ/Cnq27AA/eJfOaHGwHa0laWfczsSrh4YVRfjQkL75ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707586; c=relaxed/simple;
	bh=lBoTVZUt5m3hOeWQr60WbbDwTqzEW+kLM0XPCbq9f00=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kKZoNOoBpB2Q0M3nrWfW4VIe29Kn3SlG9MXm49z6Z3Kl8QCajVmCbjiF4YsUoFt6UerrkjeTdlHjQ42Aai2qqJ8pdoW9F4vAgV+s2PtrJX805lTeHHwzd0N2pXjgJRsd+4lhUisaLUwyj/wz/gNv/USE4rH9/kY0eyF0rbWGmVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T4Ruev+6; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lO1wd4qdyV289TySVWufU4rC7yBlKSViorHD+mmtRO0Da32rk90JkrYp7+xGYQDK61u0pMBNHpXFB6B3n/pBX2z9msCQEXo/vkm+tJhlNYXLxH/uhwyb1ui48x0t4NCzheLzc+EeWM/hWMuMMAetwY6pKfND5OlQux9WEWd+ICo1M3m1EVaRYFUJo3R/kXSgHdYxHCxYg6nYEVGXHxJJLMmnOzN4lb75u+VUZodrPrMvvmIQtBn5ixBzf/SDB+CTzUgC6Y1qSrsXg96Osn78DMLYbZjGvsJzO2OwlLu0hAcQhtplyCX24YFKa91f2D0askduuQZx4nr5b1KUx3bnbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBF4k0F+B5SMUxaMnRzNewxPWXXvN3yT7disMFt4lmA=;
 b=wqD1zCo96rwm3/BQvebgDBzPhGad8IU9twENbq6PwhtH0SCGm2Q1TOoVObj+1/rKobTfhLyqsQ4CmJz3CUKGXujQYMBUYxteAHQ6JkMRZM2RHMPOkrb6GYl6iWmG14uM+aTznpggwr3ZQKoY+bSe2OH/rHiSQShUQHUSMtoB0QSymxKM+4M+scEqYLEqA/T7LNBIv8zlkye2ggtxbM6c8QCQGyXgm0h8danVqAfq+0//I6gLfmdmjFndDAMmBpUnxIV/5gmuzfyt/I7sfVY0YC7QC16pzQvq4JZU1BpOgDdKyKkCIAWRYjBK7doxYI5n2HGA7ID/Lwi1L2ObQsW3+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBF4k0F+B5SMUxaMnRzNewxPWXXvN3yT7disMFt4lmA=;
 b=T4Ruev+6PEjLX4ITUcGrDU/Ao16u8ccc5ng6kadyxiXi1h6aTzdmBXa85JG8qGRCB7B3g7m9p3+Cd6+5yWMyQkBbc0bP8OiL7sd+HJbsD3abtDFcsQubA6CgUx1Mmse3YNJwOYKGIhs8TjR+LNxhCtmWGHiwOnH4azLKa7paH8fkhEjpfZIhp+WDW7HP8NylxJmKVA6UoKLru7g3voEqBfZS7oxnajbiker1YyruYxnTSTshtZQybJ36YfBUn8LAuAi67H30JZrH0Kh3c2Mh388BvviXT1E+frtoVCXJTiVjWVtZJHVqEd7GxvhF62nCKZHuvWCxYIGnzDcNtbb1Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:35 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:35 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sat, 17 Jan 2026 22:37:41 -0500
Subject: [PATCH v2 7/9] arm64: dts: imx8mn: add wakeup-source for usb phy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-misc_dts-v2-7-0f319c7e9b55@nxp.com>
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
 Li Jun <jun.li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=750;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/VWZbS+hj41hTosxD4U940fd60kDz94wX0PuVEj/l6E=;
 b=5vOp/qtPzg5ZiMnP7Pf3tjIJmjLxsksPhq6NLYM4y7mqlBvC2EFz0yHbi2z+Oq8fhSRTg6EFI
 7jrZtWjto7OBDaByU0700+4HBkCGpfw2nZvWbz3B5VQMZBkQrEpNmJA
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
X-MS-Office365-Filtering-Correlation-Id: 740588fd-f3c9-4328-32cb-08de56430f61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU4rSGFQNVpUUGtUa0l5TGdXWEVuUnYzUmxtUUZ4aGJIaFRBMU90UnlIdUg5?=
 =?utf-8?B?NXI0Q1ozOTc4K3BtSGlFelRoM0dtSU05aVRCOFlENVo3WGFrQmRibFdsbUc1?=
 =?utf-8?B?aGRCY2NJeDhIZDAwZWdSTUl4a0RneVBoRWRTOE9MTmp6VjdDMnE2R1llOHFR?=
 =?utf-8?B?SWpHQi9UdTN4UkM5dXBPWHlkNzhEcU5haXJDQjlmL215b3RmQTFiblBueHZx?=
 =?utf-8?B?WjRTa05xOGJCV3VqKzFMR1JkT1dkblZ2YU0vSzFpYjROdnlaNTdIWEM4Qk9k?=
 =?utf-8?B?REdDd0N1Q1VTWi9lSkJ3Rk56cmJCYjJuVEtKM20yck90Y1dxQkpIV2hzRHlx?=
 =?utf-8?B?c0taQmk4Q0VTS3BhSm0xcndsZVRaMWVDcFVOSzNTZ2tBeXFLKzdLNVUwdDVE?=
 =?utf-8?B?TDFFdXRJaFR4MDFZSXYwRkl5V3F4TFRxQzVBWlZ4TUo0bTN0aHp3UVo2Ympw?=
 =?utf-8?B?UnFpTm12S2U5QncrTFlLUkdOUG5UaXhjYUtvZng1a0w0VU4vZm5Eb2R6bjdS?=
 =?utf-8?B?UndiczJXY0orS2I1TGVzd3NRUStWR2d2SGtoUXBpZUZ6QjdZRDFicE44NE5l?=
 =?utf-8?B?LzQyeVA4SGJaYjJ6K3B6VEVJYnMxSjcvQ1VHRmpJOGJieE5HcU5UYzFaNzV2?=
 =?utf-8?B?MVZoTzNCbW1HODJTa25ZbW03cWowWXhQZjJtaWo5UXg4ZW9VUHJRTmFyckw2?=
 =?utf-8?B?MDJRNjJMaEFmOU52eEpzWk5LUS8zMkhlcm5xaWxDNDR4QkdIV3pvV2M4NC9U?=
 =?utf-8?B?bHhrSmFCWDVpYXNTaVg2Y01YVGNZa1N6Z0lZVzBBTlI3c0MreGtvMGk4d1p6?=
 =?utf-8?B?c0ZuQmRlMUVQZ2xhZThlUFRGV0hxQWZtMHE5bXc1TVpUeFdQQjY1a3Rya3I5?=
 =?utf-8?B?Q0YrcWp4cUcrOGs5WVBWRjNHK2NnRUtFZk5aOGJIV0krRzVScGg5ZWt2K3hO?=
 =?utf-8?B?ZVhrclU0UWF3SXR2VUswVHNoTmFqU2xqeFhBKzRUdXJxNGVTVkNHdlpjUzND?=
 =?utf-8?B?cVVoZ2ZERXVpTkNVOGVRWGNMdTQvSEh1WFVtRDBFcUF2Y3kyd1BLeEJUYXZ0?=
 =?utf-8?B?Tk56bWdzcEFlWExlejVXNGdCaVYydTNhYkh5OFRWY01ZNkNwSWs1VkRmN05S?=
 =?utf-8?B?aCtXMXRIMWNwWURpV1ZyUDZ0UWJXSVR4amU0ZVRYaHRnR1loWDBtN0djbnlm?=
 =?utf-8?B?UHVWb1RpUGhiMUR2MWhnbnJHaWtEekdmYUpyaFllN1dCbXFmSzRTeXVmWkdk?=
 =?utf-8?B?eDNlcjl1Z1YvanNockExQ053bWdOMkhrNkJKRXBGKzZGM25BazkvZlNLa1lL?=
 =?utf-8?B?eTkyZGd5cmZOcHZEUFFYUnNSbHBvSnRKeHk3dHkwMFcwbXpyWWZSQ2FZdGNn?=
 =?utf-8?B?MlFUTTNCNjZQY2ZSaG1wa1ZEOTN1cDRicHpWRzlwUHpmbTRUblBGWkxuRDJU?=
 =?utf-8?B?d1U4VnZaMnk4RXluSi9oYUU5TEJFZHdVQUdtMit3Q0N2S0U4NGdiZEFEVUxT?=
 =?utf-8?B?a05tTkVzeUZ0bjc5ek5yQ3d0dUdnR2hwRXpwRS9zdzQ4ZFZBV2tVVVZyTmI0?=
 =?utf-8?B?VlAzYWJOQ3ZQd1lZREFtb3VIMlNsb0NUdHF6eFBwSkd5ZXpkR2JjTlZaNWZ5?=
 =?utf-8?B?WDg1VU9QcWNoK3Z5M2Zud2RpVnVXcC9NV0s0enpVSG9ub3h4SStDdU84clpN?=
 =?utf-8?B?S3pEYk9vdUpZbUtDRUMwc1NJTlVCd3NjNFQvSnRTK0ZjWEk0dEJNV3ZVRWxS?=
 =?utf-8?B?cE5YQisvRk1OZzJyRUtCQkRFUy9CWmloNXhYUHdaUTRWYzJpNXNxWU44UEhw?=
 =?utf-8?B?d1I3TjM1aU9hdnYzeXVwTktYa09pVnhXU2hHeGtZK0xOUjYySXdrb2tyRXNF?=
 =?utf-8?B?d3QzS08rWi9wUjF5WTE4THVvL0F5WUFTTkNtTjZxNE5TOWN3cDlma3dENHhF?=
 =?utf-8?B?QlNUcGxZTlVHQk5qdWpOZXRFT2ZzajBGcEkvTHdFMWRlbEsrN3JMSzIxTGdl?=
 =?utf-8?B?V3l4aTFuS0dadTdrNXpCZU1IS0hmZm5iNTNSajlXV3RqNHRwR3JCTmpEeU0y?=
 =?utf-8?B?L1kwRXFhUFY1NXBDMExqWi9mbHVyckMxMlYyNTBPRnpDQlk5WGxVd2FDZnRt?=
 =?utf-8?B?Ym5SQk0vUXhySWZVTzVyNUd6VW9BTFNDayt5aGthSlFua2thNDNQU3FxY2FK?=
 =?utf-8?Q?OURLSbxM2xQjZ4tVMzLHMwM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2Z4TUxkc0ovS0hDeUtMSC90WmJWUWwvT2doZmxpa3ErVGtJVTdudFM5aHFo?=
 =?utf-8?B?TW5CRUwzWno4dit6ZFpoWWdobW5hckY4TVI5Y3BBODFyN0k5U1lXbitHOGNU?=
 =?utf-8?B?OGtwSDhHV012SFYwc2xmY2xqU3dNV3B6SGhCRU82QUgyMFo3U0Z2bWRYY25X?=
 =?utf-8?B?cjA1ckxkZ2NVY0FJUHV6ZGw3QkxqZnc2MzRVTDJ5QnNuc3JSTGJ2bmdzZXZS?=
 =?utf-8?B?dnlsbndMZExyTlF2V2xzclFzc1ZCb2xaZHZlOGh0MjZOTThjZGVzM2RGQUha?=
 =?utf-8?B?bkV6T2JPeWQ4KzJjTGxRY2lFUkNienpHdFNvaE50b3A3a3VTTStyWDlJTFFQ?=
 =?utf-8?B?dHVRand1Y0xZeERDbVpOYzIzTzEyZTcwM3Y1N1hDN2Vab21xN29aL3NJbjJV?=
 =?utf-8?B?dC9uZEhwUWNTSllrbHFiSTVRMXAyWnE3VlJhQnBkK2hCQXYxVTBBVHRwSzZ4?=
 =?utf-8?B?NHI3T01JTkRUeWF0M1VqN0NyS1hxdW9lTGUrc3lDVzBYd29ka1dTTWNPaGZE?=
 =?utf-8?B?L1l0WlJvV29CUTkvRlE0MVlReWFUa0JBbHdmbTlKSTYwdTBzM1pTUEVNVDVH?=
 =?utf-8?B?L0FvbjFsY3p2OVJpRUVtT2tpKzhtb21kR0ppMkUzdndmcy9RNUZBSEJUVzhz?=
 =?utf-8?B?SmFXekE2K0tQeUl2N3JqMDBkVVlzQVczRDlJVnR0cWg4ZEhucEhtR1pKVTJJ?=
 =?utf-8?B?dC95NVVYeWhCbkw2SFJ6bjRyays5QUI4ZDNtT2ozTXc0cFQzOFNYY0t2alVW?=
 =?utf-8?B?NGh3TkZQOHFJVE9aYzczK1RndUsxSWlmM2xwNTNNRmVSeDMrY0k1dnZja0c0?=
 =?utf-8?B?aEhmaXNZanpLOElnSm5Mc2dSZE1nQmhzdVZ3a1R5N0RSTDFlVUhVN2JxU05B?=
 =?utf-8?B?NHJZOGFzMWlvUlNDaG5NME1aR093dUF4cFpTcTdBQjFtOE9EQnF1UDUzblFJ?=
 =?utf-8?B?M1YyOTgyYVV5MzdqbEtweEh3Q25zWE5vdUlFNE0zeGFaaUdhSGREK1JzQWx1?=
 =?utf-8?B?OE8yNDZ4RUl0aWh3QzZlejRRUlZEdVRIRkdjWjNQeVM0djA4TzRIbHYvb2tr?=
 =?utf-8?B?YTVhSjZEMWx3dXF2WnA0bFp2eGxjZVNnZkVVVS9WNFZ4OGpwNTNralNLSnZK?=
 =?utf-8?B?VFg1ekVSM2t3bVBuZXEzQjZvK3cxT0ZBWGVVOXVZSldvbmhDdjhnT2lSTmIv?=
 =?utf-8?B?V2dIZk9zREhnSGc3bm9HZnhaOUd1QUpFS1VKa0tseEFnV1lNT2R3enV3TWtr?=
 =?utf-8?B?cmNZQkgrdXJMOTBTUkdzdmk4K1MxOHJOb3BPSCtOaE5XblhoSzNEanhiTHRv?=
 =?utf-8?B?N09qMWY4aWdrOHNCZmR1SkxCcjhWd2F3eGZvMzB3ellEaGlyUVVlMHNHYW5E?=
 =?utf-8?B?QkVSYkxhVWxFdHNzUjh5SUZYUjh3THUzbGJZK1FIMDJYU01KM0VwTkxYbGhK?=
 =?utf-8?B?RFBBd1BPOUFkQzZaWWMzNDVHTnZLZWxpeG5sYXZVd2xMbnFCNkNhVmpJQ21O?=
 =?utf-8?B?cWdZeEx1S2hMRXBlS2dCNjlmVmVTaUQwM0dSdkEyWmdjWGdVRVBKZC9PK1RT?=
 =?utf-8?B?R1ZkeG1RQW0rajJ2cDZOM1Y1Y3F4NUlqcitQM3dXbjNXUHVNOExpa3l3cTJl?=
 =?utf-8?B?MHRzVGl4L3YrakQyNFV3UHl0cXkxakFjWGZDUEhpODlYQ3U0NnV1MXc3YmtJ?=
 =?utf-8?B?TFJMR3ZMcUx1cEdCTXNvSldMSHBMTWN0VXpQWnEyb0VOeFRxTXVZaXk0NkM2?=
 =?utf-8?B?RnRlTCtkUWJYbmorL3dsaXJCNnBLdXd5d1lFcTJLSTRBakUwbExWWVlyUDhm?=
 =?utf-8?B?TTU0Mmk4blk4NFZTTGJaUVh1Rmx6MEpIMG5ZRkdNdXB3b2VSdFlBZ3REdXlw?=
 =?utf-8?B?a3ZDTTZOeVlnYUZsTW1JNFBYWUxXeDFPb0xqa2N3NVM1WlVDNldjUXdnMGJ1?=
 =?utf-8?B?a2RreWZzUHJ4d1NnWkt6SHV1U0IxenZIMytKY0lpQ2Nkb21iWWhmdWMwUDdU?=
 =?utf-8?B?SENzSWl6c09RYkN5NURmejNVVjFqbHZ4RU9QUWFNMWRFeERPVWFwRHNTaDQ2?=
 =?utf-8?B?M1l2c1hXUXNEeWVXd3U0RTUwWEJrR0pUTzhjNkphT1FWS3NPMlVodzF3b1A2?=
 =?utf-8?B?bi9xc2x1bXcycXY2LzlzYmF3bUlnK1U5T3l5SmZ6YnlIUkVGQzFCY1F3ekhY?=
 =?utf-8?B?VlBUV0owRFBidkZwdms1T3poWUUrcjdrNS9RV1B5QStwdzV6SzN4M2RUaUR5?=
 =?utf-8?B?cUJHanZNd285TFVYbWFRRE5MR3Nway9hWTJwcjNzS2pBWkswWnFxMlFOR0NG?=
 =?utf-8?Q?88fIquvuretdJ636Mq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740588fd-f3c9-4328-32cb-08de56430f61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:35.5296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXjA9QlBGZQ5+g018h9ywVb4nEhR6hwrGNaxys7R6Ko6Ec+p1tTvgAmpWII1LfApGdNK3mL5ucvcAxhG3Ujtlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

From: Li Jun <jun.li@nxp.com>

USB phy can be wakeup source to support wakeup system from USB.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index b98b3d0ddf25aa4b98f8320ecc7f44e22271178e..f65258aed3b72cf98e82432a59dce2acb001ad95 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -1322,5 +1322,6 @@ usbphynop1: usbphynop1 {
 		assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_100M>;
 		clock-names = "main_clk";
 		power-domains = <&pgc_otg1>;
+		wakeup-source;
 	};
 };

-- 
2.34.1


