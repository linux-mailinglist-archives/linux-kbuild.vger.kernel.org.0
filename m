Return-Path: <linux-kbuild+bounces-10626-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F1D3927A
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 04:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 957EC3008CBD
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 03:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8E530C62D;
	Sun, 18 Jan 2026 03:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ahjCg9ue"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75730BF6D;
	Sun, 18 Jan 2026 03:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707502; cv=fail; b=n+bPiuKNPKKjH6Sl4VxcPmGf2W6LSvmk5QI4zLaDIitbjy/xOpcFbeAsR6jSOKTXguRmVuivZYY/D1nr3BdsbVeYiY98ukJwenO5q7IAXP8YVA5EAOKaY9ln1WqPtjEnnK94bwSHVYTSNbAKeHSn4lBqefsQB3SGkzC1QwwnS6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707502; c=relaxed/simple;
	bh=whWvHm1V/iRIdLNmY3SCSv5dbJPodvAq7RdBjR4cIp0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tpo38u7uMjoESeeskY8o1APq4NRgeWDgBtJ645MuljVA1i63iNbznCazeVvzKTrBg3G6npqsEg7j7yG7T2XgtnmLqjXq3gMt8JPL6910RDPm+UHGWneQm0RC2kvNuvMjThm4uo3+ULmTnLPB1XTGUBEM8KWWZCRm3tUpUHdARDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ahjCg9ue; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVHr/A0W/cwQ66EB8PEAH6BHUif7RPA8WMIuwhVh02yV0KRIungDtCz0t6uDgTZ+AZ5zYrKiDlxmVRJ30K4NeJo6zsAxKpWKg8nh4FZrxAvyZiLTtTJXl5wDckTaZBcI+fQVaps05j8lXasRd/VenK555GSqGi54J2vRj3TikRjvsZK/mrmVkzShpnV4H7E60RpNCcfRnzXEFuwAnItomMiNg7AMvmxpFVcnO7+OEAl/ckzsw8o6K6xHg1q9Yjf5Kkbh2ovLFXkaFgMBFOFYVal/3NVRpp3zdxPSb9SFy+fgeAM31Nk6FFLE26cvDUpV5BdCywkwK4XSL0NC8n8nSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Yd66ditOmBOE2WJF8PGHRZZx89y9LuDz43IuymR49M=;
 b=pPedZXE9QrnrGXD/5Lk2iYdMCkbL6nRUsA4nifhrX0VQRMq+9gD8jDbX/ohHNZSxH6I9y0x3WjXIb5rN3Xck/or8eXqnFUMUJ5nG1FIKCpsZvzVi9wgeDQQu+DICEL9Rj9Pp1qyam0GRFZnkcph+zfaLXCd0KKic+9wzzt8UIfx3DtexQWRVjtrHfWbQZzaP1lUmUTbqEyrrxpQlLTWBZojSlDd8rziBCA2c7QEuQnshdTTB1jFaPJ6bHzirx9E3zzzzG+X6xGfO9pYk3R0lSBbDyGLM11QaaETJg976p6Q/jHVnSxjxEBKQzr2Rz9jk3lXmvxl5vzzb4oweMHL7Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Yd66ditOmBOE2WJF8PGHRZZx89y9LuDz43IuymR49M=;
 b=ahjCg9ueokK3JwW+t86xUEv3JLTpxNKJ2L3nzQyNoTTrIYqQsBqDe9+WxRqkM4o+ZgEt/SH0YX4vJUN9wz5Bnu0jF6xau6ruRsTqAAEKwdoMePbq+HGet5ey8I1orJazXStknPl7q3IT9R8Fa2o12YEOtc//ilGU9gvJRfKAmu6ZHiW/wBKKKhnHl7BpyxwLfbzQT/Udga7rB1h04wjco18JbAOAAmRoDcYt5qR3x/eNA6Va4lHh4N2RVU01AYkNUd1sjNVExhB1k7ZFxAcepkfYdXgEB81WTXWQxrAL8541/X/7slqOoO+H0iDykXR9OdrA/oB3Z90MJhRAOWz3Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:18 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:18 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sat, 17 Jan 2026 22:37:36 -0500
Subject: [PATCH v2 2/9] arm64: dts: imx8mm-evk: correct the spdif
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-misc_dts-v2-2-0f319c7e9b55@nxp.com>
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
 Shengjiu Wang <shengjiu.wang@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=899;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=WQDC6knS7zi7MJr28peib3m35iupbLD37LjnhPpN2fk=;
 b=3cu8bLun8YjfARfuvIS1t1oeAVYDn023y7qj4FEQJcdKcXrw52FHtzbiulg15Nt9qYcUqAw5v
 MhnkJixf+2+D9USyoIpHXWFtIydMj3xhHcoyGD8t8jE1lSByZBmeRZI
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
X-MS-Office365-Filtering-Correlation-Id: c7b1dff7-53b6-4bee-e109-08de56430570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzF4Q2R3NTNCUklNYkl6RjBTUnNra25LWDdJVFZpb1Fub0owZjNMaERvOU1u?=
 =?utf-8?B?V29UR1MzWUEveUUrNmZvN3REWGhNbFpkMWM1aC9sb0ZIbEhPL1BsL1R6dDFq?=
 =?utf-8?B?TWNBdXRXSElKU2lQTnBSdkdrMEtSYytSSXBlc2VzbGlhK1VtVktwV014V3FS?=
 =?utf-8?B?cWVmaFlnRUNKVG9MTzB4cTdQUnQyeXRBZFQvT05saFN6NGdRcEFVdytXMHY3?=
 =?utf-8?B?YVhSYjBxaWJoaDZxUWtpcTh0aTF4M2I0Nm5DUUV1aUJjTURxK0xmNHJWb1Fz?=
 =?utf-8?B?WVZqRmx0OUtEcWZCVlBEcUJuN3E0c2pEdDNPZWROejQyTTlmWDRWd3RsaG54?=
 =?utf-8?B?dThtNGlCK1NGR3IwU3Yxdkg5U2hoQWMwakpJY1JrYjg4WmIyem5RQzh5d1kv?=
 =?utf-8?B?MFJzVlVjN01OclB6NklIWGlkT3JuSVpIblJRSDFLWS85SS9WTzN5L0Z4KzJ0?=
 =?utf-8?B?QjJ3VlpITTBDNWtVaU1XMDVoNkNjSFkrRVZQaTVMZmJpM3p2b0dvRXFhaXNW?=
 =?utf-8?B?ZkFPdm9ycmFGR2RUakNGZGhZY3RjUXFDdVNYc2lLd0h1b3hDNk1rdjhLWVFx?=
 =?utf-8?B?eDZHNExYNjg3ZlRPamQvaXRuTkkrOU5ZNXJEeWFsWERGNlErdjlVVm9ENzFG?=
 =?utf-8?B?eVp0dUgyUmFSaXpuekdJRmVWeDJBaCt6V0V1M01PKzRVbjV6MmVUN2hRRVZq?=
 =?utf-8?B?bkVjakRNaHhDa2lZWGJvMk5ka1k4RUtoT0Y5a21mSGlZdEF5bTRmNlZ0aE5t?=
 =?utf-8?B?SXorZkFYcHVuWmtSTHhabnFsd2NJTFlrWld3Z1pkZWlSbU9sNmtrUWVGc2VY?=
 =?utf-8?B?Z3c1UUFCT1FwbTJCY2xYUndjMG9Ea2xTSDFUQWcyaWNCZENBN1VRSHN0bE1V?=
 =?utf-8?B?VGwwOFJNUzlzRXBTL0sxZXZHRUxONktxR1BQMnVsb01QSitiQmFwUnh2RDNu?=
 =?utf-8?B?MldrK0lHN3AydmRxUXFnREpHM1llUzlWOC9TakNvMmJhL01lUEU5R2VjcElL?=
 =?utf-8?B?c3ZhdkRYNVgxc3JvOEwyeU9iUE5WYkxVbzlNZlE0VjVKS1FUSXlEK3JEd29T?=
 =?utf-8?B?aW13YkdZYXM4TzZZOC8yUnhEUWh0RUV0Y0pwVEZuUUJNb3pFYWNESHpHZWFH?=
 =?utf-8?B?Z0czVE9KdTMzb0xEL09PK3JlcDhSWE9EQWIrWW5wTzVScUxJbktGanFqa2hT?=
 =?utf-8?B?bEFNT1VTcDR4Yk9JbU9BWVI3MTAyZ0dCa2JuUTFiSkpJcWVrMFdOTEJYMHRP?=
 =?utf-8?B?UThnbGR3QmhteGl1Tnp3VCtlWDZVL3RHRDNVdURGczBtZmRaelNoaDhraXdh?=
 =?utf-8?B?amNHWkhiUGJzOGYwZHROSjdudm9wdzJsbTBxTW9SNXhQWnRnTEdsaG8xZkk5?=
 =?utf-8?B?UUp3MllGcjc1cWpuMDlmNE1VOFRWOVpGaUgrdmV5a00wZ2lIZzYyTGhXVTkr?=
 =?utf-8?B?eHFlVDZnb3dJckliaTA1c1VyZGh5ZWpnaUovVkFMQ09HdVVYeE5kTkRtdFEx?=
 =?utf-8?B?SU5qRmgwWGFWeTNac3NlT0JJdis5SFZJekVzS0J4NzQ5Z2lXOHdiaTlsWkdN?=
 =?utf-8?B?dWxFL1FKNXZMVjNyeVhXMTlqK2owb0tIL3c5YVJGY292eUk2TWswbS9YU0hs?=
 =?utf-8?B?ZDJyd1Q0cFp1SFhYRnF5WlJvTVFTNzRpU0FJOExoclFnSVA0bDNKNFd0YVh5?=
 =?utf-8?B?QXhTQXVLYTFJWVRrTzVRTTR6RGs1TSt4SjBwNk1vTHlzT1hvTVozMkxYNzFt?=
 =?utf-8?B?ZVNjcFdOWU1NbytVaURyaXRkQndleFJ4STNrN2NGSnQwNnhiSEhhaklwckpK?=
 =?utf-8?B?WjdGWklWd0RZNzBtcE9IM3ZvdnhXcDFrd2h5SmxNZjN2Vm1FYVFUWjFMclhn?=
 =?utf-8?B?c014TlF0QU5EK2k2NUhwSmo0MTladXhMblFOdXNseHh1Z2tlcnpjWlBQcjIw?=
 =?utf-8?B?eDRBN1BDZXlIY3haYnl0Y2dCem1XaXh6Tmc3YUtZUXBvMG9kcWFHd3NjdS9L?=
 =?utf-8?B?d1gyK3UvZnB1NzBMazB4Q0RxeGRVeURiaGl6NFQrMGM2eUhVUWxuZmY5Nmpu?=
 =?utf-8?B?L0I5aW9XMG1UUlZOSXNNZys5OWVxSFZNaUxpc2NWR042ZjdFT3dxdkxZZ2Z2?=
 =?utf-8?B?Q1RVdUppOFpvUHUrcjBDSDBxVytPbXdNSk82Rmc4VFdIdUZtNGk5Zkl2Rm14?=
 =?utf-8?Q?bin3jMULA710BwnaGnW0ZhE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODVOWWVGTHlWRGFBRFhTeXV5cHNOU2V3ZzRkQlVtTDR2UVJWcjVwTDA3eG91?=
 =?utf-8?B?em05QmVmRVZ5VUxiQVljYVlBOFF4VEM5dEJRYzhycHhyWElCSlZCVWdvZjF0?=
 =?utf-8?B?TWdkZUFYRUkyOE1WdXhZUnJ4eXR0V0xrOFo1UUhkZWlBbzFYQ3pxVDBPZlJa?=
 =?utf-8?B?MjF6ekhHcWNRdXZ4MWxKOU55aVBpb2ZFK0FLUlNreUtBUTQrTTZ6bEVOSVRp?=
 =?utf-8?B?YjZkUklqWkRsdlJWbFd4TWxrNG4ydDhOalZmeEhFRTBrOVErb1F6ZTc0ZVYy?=
 =?utf-8?B?dHl0Sk8rTWNuNWM2M1J2Y0lCQVBJK0djeEpoZkx5c1Jibk14SENYSVZybTFz?=
 =?utf-8?B?MmJENm03V1Uyc2hJL3JRbGZZZUx3TEU5Mi9kL2ZkeVRYc0p3djJYV2lMdzNP?=
 =?utf-8?B?N0s3aE9HRVZQSG42b09rM09udzlKUkNIMWExREdGOWFKRFJFVWh2MmNSUHJS?=
 =?utf-8?B?NHFFWlo0aEVyUU9PdTBsL0MyWXVNbyt1djR0TlpnYkJ1Q2srNVpJdFd4TFdE?=
 =?utf-8?B?b1FnMmhwTDFRcXBnV0UvUlgrWG1YcGdmVkRBaFk3bHptZlNiMFc5eUxxeThr?=
 =?utf-8?B?cmRob0FYRkFNYnlCbGJWRjZzK1h5d2VlTnR5ZTczNExKRDR3akFqLzBRS3Yz?=
 =?utf-8?B?dWlsQk9FQVp4ZG9nZ1lCeU93bzJ2enJ4a0pJcmdjRFlWYy9GaEg4NUp2ZkJD?=
 =?utf-8?B?YW1FNURmY1dEdmUrRythWlF4bU1MMjNxN2tHNk4xSFBrQkMzZW5MZ0w3SG5V?=
 =?utf-8?B?cWl4ZGJpN0tPcUFlTGpQL2EzbStBWkREWUM3Q2NIaEtJWFNIVi9DOThVU09j?=
 =?utf-8?B?NFRLRmhNL1JuWTZNU1pubHMyL2luKzlLaUZMWTJrcUNzcDBrTmNtdHhxa2pL?=
 =?utf-8?B?dHlPN05OTFhuRXo1L2ZIOTd1T1ZxdkZiQk5laU5lREc3NFVYK1NsTHFGZk5Q?=
 =?utf-8?B?emNpRnlIY3FnTmw2L05aN2lNVDViMUVZM0xjdW9tNnFDOSt1Ym05bXJwZnBF?=
 =?utf-8?B?T2RubVF0Yi9vRWhwZU1nS3EyRm9VU1czK1ZuU1JOQkk1NDM3SVlwcGtqclhj?=
 =?utf-8?B?djNYU25nNGk3dHRxbFlIR3NNMlJuaCt2UFp3OFRoQy9XMkhaVnpYZy9xNWNv?=
 =?utf-8?B?REJISVJFWGJXK3pOdmZJcHdrS0lCT01sbHFRUTBzTU9hYVVkaXhkWmFrRWNQ?=
 =?utf-8?B?cVR4bXFwZHYyMzUxQUEvUWwyVitCMEdPTHowdmlYc216M3Y4dmxROWNsOHZo?=
 =?utf-8?B?clFMUG9OOFVrSVlPWEhiaXl2cDlwaWxieG1BNG93SWpHMjNSYmpDSFZ1Y3dz?=
 =?utf-8?B?SjFhTHlVYWFqbjhGcmkwbGFwVEtIeFhFWDJNVFgyeE00Y0hBZFd3STlMNGx4?=
 =?utf-8?B?Z05oM0ViVWtJZmFraGM5bENVTDFCT2JrcGxWUGN4ekFiM3NWM1FwQnl0bmVh?=
 =?utf-8?B?SnIwVWx1S04rUXVQdUZiMER4bktKbXh2aDQ5SUFhaGplalFXWWM5alQwL0VC?=
 =?utf-8?B?QnpaOEY3aDFxdGRyNlV0SExjL2pvVVBVWkx6VGZCOHNON1lTZ09lRTNCZ0M4?=
 =?utf-8?B?N1p3N3ZXbmlGWFJoeHdGUU5sYnRqMWw1YXFRYUhnbUJjeERscDlQZlNmTDgx?=
 =?utf-8?B?UTZtNkM0NnpoSHplSjZ6cXpubmdSSExna040V2JvbXdBZ1FMbzFiUWluQWFk?=
 =?utf-8?B?Ukh2ZGlNbVRTeHppQWswYS9Ja1krZmczLzV2TDZwMzB2VVRpYUJZaHNqRFY0?=
 =?utf-8?B?TUh0Q2dNRjJiQm5KRlI4SVVnMWJ2dVhVdUoxa2tMTTVlNU8rZDJGeGVRN3Fh?=
 =?utf-8?B?SXlTTUFWRnNZMStDRkluZFlWZW1Mc2JFRFNSOEJmRjYwNklZWFR4TkUwR0Zv?=
 =?utf-8?B?TU5kRFZBZ1p1am85Vzdudk1UN0VGU1NWakNQK0VUTkxiQ0NGVEdsOHo5WXlN?=
 =?utf-8?B?U05mMUNjRmtETmZ0c2dkMUMwTDRhYmVOZzc3OGZ5eHFQUHpvRHVXS3RVU1Vv?=
 =?utf-8?B?a3hqZXVNSmtSaGo3aDU1NGFScU1VaTU4KzFaK1lOQnNpNERNeDV3RzBYMDNF?=
 =?utf-8?B?cFNUWGd5MDlaaGFxSVpWRHFsRzBIOG0wWmFsUi94WmRNYmZSKzg5dnNhYXV4?=
 =?utf-8?B?dHhVRmdPNDZGb2V2QUtCaFRZNWZROEl6K2drSGRudW4xOVAyL3VsaFNWQnAw?=
 =?utf-8?B?R0Yvb1MxSGRIQTlGNmUyc1ROMy8yVjdzNzlxdElKTS8xbUkyaDNoUWNVVEgx?=
 =?utf-8?B?OEhhVlVjUEo4SExYeDZkTzNYTkwzcnBSYUxWSDlRRlkrbytsU04yejFrQWha?=
 =?utf-8?Q?eNr6yjTNDN71PtGahm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b1dff7-53b6-4bee-e109-08de56430570
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:18.8187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LC/LyTHfe7lkCY944A1RXMLCJ2F5/YyZ3aHBUZlrwDRWG3i0T1CAgzQh0ilnNvtrWjQ5yVruM9KXYZNWoN65w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

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


