Return-Path: <linux-kbuild+bounces-10640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D53D397EF
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 012A73036ADE
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 16:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8123B2206A7;
	Sun, 18 Jan 2026 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K3r/ckDO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF662264D9;
	Sun, 18 Jan 2026 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768753737; cv=fail; b=Uug0PaK/Hk99m4X19FEM8V+pjRQlF2AeYyLSDbpd67NUtTz/8lv5DtQUouRCkgZhBVIFKJ15c+hx1th38Q6mAMsW9v/EK5YsuDKLNKkD8oJ5UjyucelZZPXBQowQtEkyB5S+9I2gM3UMgE/jmVB7u3aVK/XOIdQcZaMCc/BVsNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768753737; c=relaxed/simple;
	bh=nx3v9efAsL8FWGLXOsUr9yBPhLN2JBBbLBiObSOJJSA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BGPqdR3UBBPRPzXk+NOMsazPlhD5jYjcHvngNt6f0kf/+3T2uPv26SlOW14dtt2Ujn67VA9hnVKqIp2ZjpKXgrUu6r4JJwdeMLHWYP+CsbzEtOednmyozkAVLPFX4KdFb8VLQAj1yAbemLxIt92sVZN7uJBWWvqn4Kmh/B/o1pU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K3r/ckDO; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E03gSOYd63IKiL8SWSqSB9dwceQqoMzsv9oVMFC3cVNPdXgXCxiWvujLdz2ql5OcVztsVukF5l777qOipZt/fwMIew5BIFQ0Dth4zOir+8Qy/wPU5/EOqd/ITQaLQXf+i1KbANzx5YSSgVnQOsI0Jyb8KqC4q8q03Lzkxyr+LvzsNG3CThWcYeA8+uBzyLZKt01OVSZJql/giaed1xVorwo+v/CBTBbykB38XUZDqSk92Bqx3FZ/9h+hLgV3MLXogsgMwku8J3sslIc4HfqzO9I/EFmcvdPt9t6hhBKcn0VuWmkpKD3jAHNYYG2v/bcIoxkg3aCHl1s2kSegkCY7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh0P+XeP7sPpWrJgQzRdesH39GWv92Rw73fip9DF8gU=;
 b=Ja756bPdX2nUtGQDkFF8LhD77dOFBROdasfkxGQBk0/6mjHA8f8ZXMnshIrREIGejE1B1hUJCFFf/YhCCW38kjTSIRQhiaeOjQi5UYoFBcofk1Tf8y04oG10ODF8pQFvmxVTd1ojpvJLoQH/k+4TjSKUg59JzcpBjruiZe7g2LTQ4Mgm71HAxGeHeZImKm0Bb12l0eQrtZgluUhIti1byIoH26wNaryFn/TovCJPZryI4pQB5FhWaM4HPX2u1NTbhcwUtPeb3z2rjHnykV8dUE8c8/GzqAFmZhwDrXCplmTp7X0pXBvGN71gC6lBBq9h3EYVUOwQXiRJPaUZZPWyeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh0P+XeP7sPpWrJgQzRdesH39GWv92Rw73fip9DF8gU=;
 b=K3r/ckDOD6XidWjoBSy/5UeisodDY3/II7BA9chfIwpouWAudxQUFkri3OPM0/cGWAimknepRblzWBReqEIWQhiWrxJt60H2c3S4IaKo7Uv9cPYicwN4L2NY5YiQE5wcoYngnVT0i8CN7Oy7b8bIu2nVIS8bqjOChj9/BesichLbuegiIleAh7AdjNOAoswfi5XNoHKWmIvPRWnkTb5NZ7XfsA1QAJ7Jk2zs+7Ms4jb1yNRtVQvSch7VsY3id/9uwuZw1Q1bbLBMD+jU4+1HZ5mijU2Cb3DDQ/Afj0faoHFzhcY28PI8kCUzA94rOFTzaCHwZ00vRVw9jY45hSLMeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:52 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sun, 18 Jan 2026 11:28:02 -0500
Subject: [PATCH v3 5/9] arm64: dts: imx8mm-evk: add uart3 port
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-misc_dts-v3-5-d3564716cbf6@nxp.com>
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
 Fugang Duan <fugang.duan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=1341;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YB4Z00MqTDcHFOKihjZ3rrQf5j451VEbsBX4upacPVA=;
 b=e/Jy7a/a8dxT9SnW1huamSqkdWZT31UbO1Phnvp+J8NGVBjh13HSnntDaN9vGrh/7vbV2sjXb
 /jooTMGufvhC6/X0Db6n8qIWXUwj5GeYXk/h2T/LW+orAQu1OyQkpGv
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
X-MS-Office365-Filtering-Correlation-Id: 4167abfe-85e6-4ce4-ca05-08de56aea45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkdZWkE4U3hSV3VrQS9CUHFhZ1o3R2dPMVNuc1I3V0lGWWlTdGRjMk5iQTlp?=
 =?utf-8?B?TUlCL2FYby95c1pSVTdIY2htYTFTL3l4OWt1M2ZNeDUwQXBuRzdDSnNXcGh1?=
 =?utf-8?B?bWdrcGJBRlZZejBoSG1hSXNvSnEyMnBWTFhjamF1c2dqM3JJc0ZsOXNMVDkx?=
 =?utf-8?B?RkY5WGlPby83WUsvRjIrUzc0OU5zeHljT0REMXBUaVRxemtDZXIxS2NGTlMy?=
 =?utf-8?B?emhZSXJRUS9zQWNrNFhab1hQbEhuUjl6bkJFemFGZW16RGtKQnN2b0tHMVZO?=
 =?utf-8?B?cGVveDArWUUvN2VML2c2cStQUUhQWEVCS1dsMytCdVJvMjFDTnVieGk3ejJl?=
 =?utf-8?B?NDE0dmtVeGR6TjhoZHExRzRyNDhVQ3JwaVdMWkVCeFBKSGhLMXlBUzgrT3h6?=
 =?utf-8?B?bFc5MlJTb0tNMFhYQit0cnE3cVNYZUx3T1JRd2N3WjlOb1N3Ym1IQ2p2dk1P?=
 =?utf-8?B?MHZiamdaMGljcmFLWVpUNFYxZEs2NzNtd3JBTzN6K0ZLRW5GRnUrSzJOOGhs?=
 =?utf-8?B?aTd5UXUwYS9qUHB0YW9rR2U5T2d4Qlc4MTZ2aWk0dTEyQVZHekdnL1VIbnNI?=
 =?utf-8?B?aG0ySm85ZnBkRXFLNjkxS2RTRHZJa1VtSUdGNGJXMTExZWZaeFhqOUJwOHlN?=
 =?utf-8?B?Nmg3cXU3alBUc3ozU2w2OE9OcDh4RE9qb2NsL1VNc25WVjZyTGRLeUFMaTBa?=
 =?utf-8?B?Rk1ja1lQS1hNMUMvck5YNXRiNFJkQ0pBWG80MDE1SnYwN01IL0dOQlJhbFo2?=
 =?utf-8?B?Uit0RlAybVpyYVBSbW9vc2Z5YWNLaVh1ckV2K0lPOGlTK0ZZRnlDLzhTaUNp?=
 =?utf-8?B?ZzVGTG05bWJXRkprZi9ENjBtSDc1WVhiTTd0cFdnUWJ0UmZJaTBCeXBwMWt0?=
 =?utf-8?B?czJPamd5eVJhY2E3Z3ovSy9WQ1JDTFJuQy90VGJyY2VGa3gwNjQwZ0ZhelJC?=
 =?utf-8?B?OXhzY1U5MlZpaG1HTjNMTjJPVGdab0syaXVpK1JSRVZhZkJZakNmVTB1M2Vy?=
 =?utf-8?B?cnUxRm9RaWhHbUpRNjZKR1FjRHM0anl6WmpYRUFGdjlzRG9GN24wK280N3Fp?=
 =?utf-8?B?SnVNT0FYTHR2MHAxM3Mva2FxZXZtUm5jaVdCcElteSswbjdZelhDeGpvMTRz?=
 =?utf-8?B?L3V0L1czWFJPK2FRK0xsMmZ0MkloK1FpZkFMRGVqRDQyRXFqNUs3ZjhsL3M1?=
 =?utf-8?B?blZ1V3pBRlI2NUtwbnFFS3c4MFc4Z1pHaHZoQjBvNG5tWTdLY0QvejRoTzNv?=
 =?utf-8?B?M2tVVEtlb0I3clU4QVRWVEpnLzJrY29oQ0xDRmQ3YmV3dFpzUmh6a2FXOGlW?=
 =?utf-8?B?ekl5VnVUMUJBeWdwREI1YnErKzcvVGkyY1NKOWh4TlRBdmEzK0NwVm9IVnZs?=
 =?utf-8?B?NjRxYnN3QUltR3RSbHNnUHZXMDk3bDQzVzFWQVo2anl0ZzA5b044b0Qrc0NU?=
 =?utf-8?B?aUMzVW9MM0ErNzZzOW1YN1UyRnJiazRoRjlZcGhheTRTUUxkb3dBaHg3R3FN?=
 =?utf-8?B?YzJBeCtTWkkwL2JCa2hNL29jYngyMGhvMXA0eWRaZ0g2L2xma1hZcDJnWWJm?=
 =?utf-8?B?VllXZWk2MmtBM2VVZjNta2h2VUE4dGVZbVJIRTlYc1lBb2Vrb3o3VnQyQ2Rx?=
 =?utf-8?B?ZEdLaXJ0UzVSbXVjRGVnUGR1UGJXVGtPSDgyRzVicjZWOERqcEcrVFlXK0s3?=
 =?utf-8?B?SFhrVWl2Q1ZPTEViNnR4WVh4cWs4dFVZVElYOXN1QXQ0ZThEZEx6ZEh1a0Js?=
 =?utf-8?B?eTJxUnZhOTFERDg0cXB4RnkvQnRsV25vM096dXhpRUtIL2pYTUZzbCtobHhV?=
 =?utf-8?B?eEhjT094WGZabnVpd2x1bFZHcGVSSndiWSt6blhPWjRqVmJDL3Z1VXVJNStJ?=
 =?utf-8?B?UE1XNSt1RmNsWGtGKzJNSmpLeWkzVUYwOFd1eUpNQlVuL2Fwb3c3Zzc3UXlS?=
 =?utf-8?B?K2dMdGN3VnF5NXJ4OEhYcnJqQlF5U3JxN3YyRTM1N0ZCc2ZHWXp5RzRaTkkz?=
 =?utf-8?B?TnFzOFNoQjQ3eW5mTHA4VVBEZkhiVkhIZ0J1MlNiVER1TlVqT09EM25aU0kr?=
 =?utf-8?B?YkRqQ0FmNVhkaWNHN0FremtDNlhuclRKanZyTjVoYWt5Wkd5TGhQcHBERVdj?=
 =?utf-8?B?bG1qRHZzWXdITkxJNGZzU2tLbGRsUStGandoeWxpd3IyNDNZcWJzT2NVaFUw?=
 =?utf-8?Q?JkHgzXHNm6RpYSq4JOS4cSc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkhLUG5FU1J3Y1EzRDdOQVZNNFZ0b0JXeXBDZGdyK1VWaE9haHBvTkxBOUdM?=
 =?utf-8?B?ZU5IMHJibUdmWlJWTElZdHRIcWlWcGJROHAxTFZiWmI2YmRSR01FdW9HOXMw?=
 =?utf-8?B?TFBjSmV6cFNmQm5UVGhrWkRreGRodjI2alA3Zkx3QkFoVTREaVFKSk9SeSsw?=
 =?utf-8?B?MWZRVUoyVkxRclk4VHVDMjRVMkZtUlFLWlJBUHNWSWJLYlNYYXh3Uk9OcThq?=
 =?utf-8?B?VjhNRWUwbW1ybGpKdE0wWmIxODdIU2Q5N0svTU1pa2p5ZDNPMHVyL2xUVTZM?=
 =?utf-8?B?NmlQVkhiQ0pTOFFGeWpXbk5kYkNtVkx5L21ENWY5c1lZZkZKbzJtZ0JxYmxQ?=
 =?utf-8?B?SlZkWENSVFhHdWlQN1luQnlFM0dMNEZvZ0lwL3dqU3hES2tXNk9UYTl2K2Vo?=
 =?utf-8?B?VHg3SExIVkdlRjcwcU5UQTBTa2lyalpjL3BSQ2FLU2dycEpNdWVoNGp3U3FL?=
 =?utf-8?B?V3pNTndQRVZScFpEKzIvVTlhbzF0M2E0Q2puNWxOS25wcTh5blZMSStjSC9R?=
 =?utf-8?B?V1dXVTFEY2dnN3k5KzdESXZDUkdZQTNKWHpFWUtpYWw3QUJQUVlnNVg0cG9j?=
 =?utf-8?B?ZGt2dmQ1Q3VvYWE2KytkcHFBWVdETjgxdTh0SmtTQWRWT0RGSUV5M1k2R2xL?=
 =?utf-8?B?VUlIeU5GRVZxS3VHVlBYb3ljeFllbnhaZTcyM1p5SlZ4dDFHMUhTQjRGOG9W?=
 =?utf-8?B?cXJkdnFmemFrK3R6TTRJVWNlNmxybjltQnQvb0tMZjBxNHc1UUhZTGw4UE1w?=
 =?utf-8?B?bWhEOXVocEtuKzc5QjN2WkRvb2U4VzdWSVJMbFJBSzdjRzhaVERKWWIzalFm?=
 =?utf-8?B?MTdWWlc2c3Fzek5XeHYrdEorY2dZbmFrSGdLNlMzK0xQaUVLY3pMZzRiQVJa?=
 =?utf-8?B?R2lvSzhJZElNRXVWYzIrcGdTb2g4VTQ1YjVFZ2o0YUdhNGY3dWxzOHFIRWNN?=
 =?utf-8?B?UmV0WUVZMkF3QjIzVkJUSXQvRXJTbzhTVFRkOVd2V0xzMXQ5cGgxR1NjcFpm?=
 =?utf-8?B?VGhQUUhDWGxTMEtONCtLT0pmVElCRmtDUEZxM3d6Um1VTS9TRjNDMVpsRTl1?=
 =?utf-8?B?bEo0UXR5aVR2SGlnbEZBWEhob1QzcVJzVWhGM3ErR3ZUYkRoMzZaSVJKUWlJ?=
 =?utf-8?B?MDlTSHdLQnZ5NFJIU3B6QmdsMElsZE1EcDZnU3FsTFVTT2dpMjlkdnMwcXd3?=
 =?utf-8?B?eWR4cVZmaFdBMzIyRGhyQm9TTHh0dzJLVTNoMDhkdGtTZHNiNG9LbjYwYlVZ?=
 =?utf-8?B?cUtyZC8wckYrMDlJN21jZE5qMzl6ZXM2SkMxVUxQTkNmSHVNaXdDeXZTK2hE?=
 =?utf-8?B?QlpkdmZzK2xBc1BGUldqUjR6cllMZG9wWVEySlh3V2RORlVFaVYxcEhCYUVp?=
 =?utf-8?B?dnlidEVxOTdmU0hNVWRzZzV2c3V3em4vc2NtNE5GM2FYRmY1YnhlcGg2YWtQ?=
 =?utf-8?B?L2JTYVJGQy9tdHFhOC9uS2NkaXZzSWFWalBDQ1dERENydmhwUVppaEFIV29m?=
 =?utf-8?B?WnBGZnlFZnZtTkhlcStPZWZ4aEtHUTRtS0w2Ukx2eEpmVFNCNDl3Z2ZGTUg3?=
 =?utf-8?B?enNsZkxwbHVZUThQcysyRlZEd0J2TzhlUXg5SXAyWEU5MGdaalBEMjhvS1ZV?=
 =?utf-8?B?Zkg2eFZITFhUWU5nQUtsSjMxdU50Y1kwUmZVS0RsckcrektJRkloNFRWRHJu?=
 =?utf-8?B?cHd6dWVWN2JIOVlmZFQ5TUZmanFTK0dhekExOEdrZnJ4dWR5NUpOUlBoNVho?=
 =?utf-8?B?V2tGRE85WUwwZ20zQVBTb2daelFDQUJXYVljT0FwNC9OUkFQNmgzWHFHVDFR?=
 =?utf-8?B?aXJqMjNlOTJ1TmtjVDdWejBzR3cveUJjNVd6TUQweFRHekxVRVM3ZXFFS0RD?=
 =?utf-8?B?RGx3STFqMU02ZXJsaFplZ0tLRUExM1BHelVHZ2owZVNsd3FhNnJqaWgzTjVx?=
 =?utf-8?B?WEFNTkV3QW1mUTV1VVozWTZiWUpFd05YUEVqUTVCRXBVR21qdGR4alMvY1d6?=
 =?utf-8?B?S3NpcWkySGJsVnNUeHQrdnhodE9DOFM3UjVuaWxHNGhDb3dFaVdSZGdQTzBM?=
 =?utf-8?B?T1JOM3VtT1VxUENWVEpQUlZxRUVEUk9BL0MyS0NyY2VxNTVFWTZkelhYZEYw?=
 =?utf-8?B?NS8rdVIrRnBldkJKMGp4K1pFRlVwNGpsQ01FOGozYTBGYStudlB4U1FMbVBN?=
 =?utf-8?B?aUFEajNKN2d2MGtyY2k0bjNlZC9BMm1SWWxHWmM5RnRKSS85czVsSnJzTmVo?=
 =?utf-8?B?UUhzejF0aUo3enVNUDdtVlNIcEJad0h6YmRyUXJGMWc5Y2xmYkgxZGtwV0VG?=
 =?utf-8?Q?zDKVcA4CDmiLc73fPl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4167abfe-85e6-4ce4-ca05-08de56aea45a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:41.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6251GXXatCrnbnOzFtfxptoGSt8n97xtiRZ+hOJgMRulKopvylrlNj5CSsf4/NsPwp7lPsVjCP8vxoyqZKlvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348

From: Fugang Duan <fugang.duan@nxp.com>

Add uart3 port.

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 30b13b4d630f8b8b0531fad531081d4ee32849f9..8be44eaf4e1e0adc2921db8cc5f2dc69586b68cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -627,6 +627,15 @@ &uart2 { /* console */
 	status = "okay";
 };
 
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	assigned-clocks = <&clk IMX8MM_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
 &usbphynop1 {
 	wakeup-source;
 };
@@ -819,6 +828,15 @@ MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
 		>;
 	};
 
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ECSPI1_SCLK_UART3_DCE_RX		0x140
+			MX8MM_IOMUXC_ECSPI1_MOSI_UART3_DCE_TX		0x140
+			MX8MM_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B		0x140
+			MX8MM_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B	0x140
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2grpgpiogrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x1c4

-- 
2.34.1


