Return-Path: <linux-kbuild+bounces-4450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809C9B7BA2
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 14:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85CDC1C20D56
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 13:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942AF19F406;
	Thu, 31 Oct 2024 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="vOAjpTZd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2101.outbound.protection.outlook.com [40.107.20.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31C19E999;
	Thu, 31 Oct 2024 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730381207; cv=fail; b=du9kNBiu0hN359ZODUBJLSSQOLc6b1RFaASB50AY6hKgKsagZ4gh5f3ot54s5vE2SYrjnnNbfGiRM2XdztMvISjE41fgcCT7qwk9mNGD2kJ2wnWoyPAWZFo6HGkY8h4/fXndF97t2jg7+iHMmuUUAlcTJprjDZTz8Zo/Bvilm8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730381207; c=relaxed/simple;
	bh=Jz32348WOXCpo55Lgwyh6GJWnQjpGU3LU4ZTn3Mlgko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PQ3I2EVv0jUxqN7tdFB9tng6dYDnKqGLV4nYnpb/mA9szuUUREXDQQDd4eAUiwd/TLapV3DLWrl8BCANTQ29Wuz2z1uUkfp6KuRinoqtnAQzXZFNbZS4OcFM9b8Cv//N19BeaX0vRPBtyPb1csLMZ10LnnbLBxpFPcEv89ds/Zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=vOAjpTZd; arc=fail smtp.client-ip=40.107.20.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IK4javAiq+ivmy29k+kuN6CMisdY+PaoaqOwSaAB0B83FhvkulsKR5W5zlm6u8Hu8mUS3m9lcXTttfzyix2B5a2l3heSTdwYVFhywwKq9qWThtqvHWNhCX7hTm46K70LYmb8cn5O2EhW47pU375xmxCpzxeIHxJ0ka/vS3jrrFSdUwdxxcPd8LNiNQBt5Anvs3D5LPx3vRm6LPm2GUHmxjiWvJffv0LUU0ZXzX41vJkJdapWgW/cb4EtZpeNuX8LUGrxs0R73eMbHbuWg2UO6ObojlOV/MVzKLJHYyi+2F1jG2t2dQ+YVvMt9RuV4PapwB7Fmc5WlzAbwajjpmcwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gd2P2QyM6Btg7lkv0NpaudbosZkZpzI/p6utSSs/aI=;
 b=ixjoNQLy6SSyBDYr1PR/dg9onDD812pyStDLQ7WgwEjPecc57ap75vgJRROdHG6WbgdNv8ClqzjCkgypMs3NO6x1JZxCMF/Ls8R+tSqAea/xyOGi92fHmXIIQHsCr7cw4SkhPNUXySrf4b6NhT5J9HzsYOkuPXqrf/pAeeo7wSijmWMVqgjuslGGVSaCS2lSa8NbqwgHzXAAPPCa+Mxuk8Cpo8pk5otpRBnMWJIqpoRF3qe7k00Cm4CG6yomI0BNDpaxjzUtOsU3ALzCyceNfqt2GDMcw6XJdRZA/q5Y/V6e4jV0dPYI4kBa7MR1qCoyLg1WtGN3tkg2QfUgmAAwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gd2P2QyM6Btg7lkv0NpaudbosZkZpzI/p6utSSs/aI=;
 b=vOAjpTZde0gLHostENbbg+66exBB2NzOeVFqrIIPGmXWYVmABiFqpZcOpxCjgozUF7P4bf/9fZrdZfABo3GyAVazIEQ7g2yAkMMlRLjfe/iDPuRG2V+BjpLoA4domeusjyoWL6OBb4qXGe7IEBkppIiigPfRCl6C8agcvWPy4jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from DBAP193MB0954.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1cc::9) by
 GVXP193MB2488.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:1db::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.32; Thu, 31 Oct 2024 13:26:36 +0000
Received: from DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 ([fe80::ff97:4bb0:9245:6d0a]) by DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 ([fe80::ff97:4bb0:9245:6d0a%7]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 13:26:36 +0000
From: =?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Rosenberger <p.rosenberger@kunbus.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>
Subject: [PATCH 1/3] package: debian: strip headers package
Date: Thu, 31 Oct 2024 14:26:28 +0100
Message-Id: <20241031132630.24667-2-t.boehler@kunbus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241031132630.24667-1-t.boehler@kunbus.com>
References: <20241031132630.24667-1-t.boehler@kunbus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::23) To DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:1cc::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBAP193MB0954:EE_|GVXP193MB2488:EE_
X-MS-Office365-Filtering-Correlation-Id: 165593c3-d4ab-4213-2260-08dcf9afa4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|52116014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0RJQ2dXazcxSXppd3N1V0w2WU5KNmNndzB1MUFlaURCUzFCSmtPUlExM3NE?=
 =?utf-8?B?LzNqdTlPaXRBN1BUMklET1hxUkNRbFBSSFNiVkdOSVRYcHN2TDJyalQ2dWxs?=
 =?utf-8?B?dUdxYnFiY2MyOHpXRlJTbXNpbWhLVkd2RjRqNTkwbmxNNzlnV2VOMmJ6eG5F?=
 =?utf-8?B?TjJzNlhjSmtRU1l1c0NMS0ZacXVsY254Y0xiYzdNWFByZlNuSUZlQ09NZEdw?=
 =?utf-8?B?QzNidnZmTlRXZUdYeTgzanNsM2JDalpJbFR5WFJibFI3QVZnbnJodERPM1h4?=
 =?utf-8?B?WkRQVEg3UzN0aFVkQUxFeWhMU3lHSG96R2JDMkVPc3BubVFvMkxHWWJJemU0?=
 =?utf-8?B?b3U5TU9TQzN2UjgwTFY2THMzL1gvckt0b0VxTVJDYlg2dnZpNDJXVlljUXhu?=
 =?utf-8?B?WnBwcUJZVldpbzR0R2ZHR1lkVnpBZVptTGcvcUkzVXAreGZ1WEZRS25CUDBa?=
 =?utf-8?B?RjAyWEVjWGtFME1DNGFEQis2L2pvb08xWG8rVjhPNEk3M0lZUWlFNUNOdVdx?=
 =?utf-8?B?YmZoSlFrR1pJQTdPOWhwcC9wRlNPd2MwOFpVcGZ2Q0hYN0VrMWJSVFVHYlY4?=
 =?utf-8?B?dHBlU0NYa1E4VDZEaksvS2cxVjZTTlNzNjdlRTVNUUhFMjQ4SlZqWm8vVERn?=
 =?utf-8?B?a1g0Qm9BZW5YTDQxTlp3VGRXZERYM2ZOaHBNTk04djdqVDVYN01rTVp5Q0pl?=
 =?utf-8?B?dVpCMVpuYS95UGY0bGI5UnhHem9NMUxzdlhlOUxFYUo5WFcrNUhNREhGT0Uv?=
 =?utf-8?B?ajcvZzlEZzJhZFZwNFFhalhlWUxOaEZtRkdLdDdURjRVWlloQmlSbWhBc1ZF?=
 =?utf-8?B?OFQzM0xVbXZ2cU5LL1k5RTdSVzh6Q201aUdwRDNkMmsvaG1CdUlndktwYkFQ?=
 =?utf-8?B?ZUlrNDRYdFdYWmxMK05WbDZMalluTjBrckpQSFI2Z3U2RHp5dk1CTmdYSXZD?=
 =?utf-8?B?OE5PaDRDZFNNbDBha1F2bGhmdGxTLzF4ZER6bnFNMy9OR1F4QkFwc0lkN0Za?=
 =?utf-8?B?eTNaSmFnVkxFVFhFL1YrWDJRNUpZbVJsQjhPR3VkNUQyNDRuS0xOUlVHRW5C?=
 =?utf-8?B?QjZFVkhJTDdteG1OckhBdGE4YUJoWjllTDhFQUtscDF3ZXVDRXM5alVoaVR1?=
 =?utf-8?B?WjNoMzk5am5FbmRZbmUzbUxaL1c4R1krL3lTUC9tQ1ZiakFObzMzNzQ3Nndn?=
 =?utf-8?B?T3dOdXI3dTJWS051N0l1WmJGZEQ3bUVIY2o5eDBiQjBpanRQWnpjL0NoODdB?=
 =?utf-8?B?SjhBWk5sVS93bzdJeHVJY0dSQVdYQVZ0YzZWa1dYQ2hQQXdBQVhabDQ4aGZR?=
 =?utf-8?B?SnNVL3BsUTBQc2JJQ3BQajdTdUZENkZTN2JULzJUcXZ1eisyeWx6WEE5c0pW?=
 =?utf-8?B?Z0Q4ZjFuN2ZmZy9kVTRmaEpFeHVna29FSTFmYUJxSTJPaCt3d085WmM5c0Nl?=
 =?utf-8?B?eXRNOC9DQ3hlTUdYaEpSSTNuRFM2NnRVbnRBRU9PYnRtanNIcGtBWmJPenNi?=
 =?utf-8?B?Vi9CaTErb3JLdGR3ZFo5cUlRTzBhRzlueDE4aWY3UVJ5aHBMOGIyejl4UTZH?=
 =?utf-8?B?dGxGMEZPQ3cvSTdjSmdkTE03N2NlVFk5UGN5dDd5ZUg2YkYxQXZXK2szK095?=
 =?utf-8?B?L1RwSlp0VTRsay9TaWNYY2hkS3hwa1E1bC9KZ3BEOUU1NWNTMTAvWmVSTDdp?=
 =?utf-8?B?eXhpTk1QUXo4TytpZW93anVUN1JMdkI3VDhLcFp6Zlg0cGJ3VDhyNnJJMVov?=
 =?utf-8?Q?wHeZFuC167IZQ/wbPRlKpYzkhbbmMtKNF1qbUph?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAP193MB0954.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(52116014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3AwNFNhcjFQSS9vY2o2QythYnJUSmpMWE9CSzNBWlFnMDVxWTBoaHlpYkk0?=
 =?utf-8?B?TnV1K21JeFF5L2ZVS3lCb1pNYXovbDVhdEhQcWx6UVp0Smg5Y1FGcmp1bEp2?=
 =?utf-8?B?Z0tSeUREc2IrWXlqTGpHaytSNCtKdkdnWnZ0WU15QVYvMERyM0p1VlRLRGRF?=
 =?utf-8?B?eHkreTJ5UmJ0MkpOeDhuUjdqM2c2OFpSZUVjbzEyUlFqbHgwZzR0UlJQRldQ?=
 =?utf-8?B?TW1IYmtwOVhIUG5NcVkxbTVKOEZhZ3lwSTZrRGxkZkp4K0RuZjBFb3Z4aUdN?=
 =?utf-8?B?eEJERzc3N3grY1VwZmJRQUFCb3VUdThkNjdnVWowNkY5VlBTL1R3Q1R6Q1RP?=
 =?utf-8?B?THoyR0ZlRkdFY3FaWW03WjhsTm15SnBvUEpxaU8wdm4vdURWSkYxcldUVFBE?=
 =?utf-8?B?N2F4RGo4NjU0aStwb0tMYXhGcUtkdEJabWEvUDFKUDdpTGR3ejJLRGJ6cEZZ?=
 =?utf-8?B?UEhydGI4TWMxbzlKV0crVm9uT0cvTWQvMHVOTTQ1S0o5UjZaeDVqbzVMQW9m?=
 =?utf-8?B?c3hweHRrVWROLzNyd0hlMWprSm9HdjFSVlA3SlFoRnIxYU9JZEhrTWxDcVNr?=
 =?utf-8?B?YmQvNjVHZGVZdTFJWUdkWVZtYUtDWWlEWjE3c2d2TkJMamlnOUJIMjdORzBX?=
 =?utf-8?B?dU1WYXM1WVluY2VuM1VGTm5vcHkvNkxzMjVNQ3JJa1M5bG5jM3hib0hnb2hJ?=
 =?utf-8?B?MU9BQy9VNmhEdWtCbllOd0JJSlZFVzdiL1lGR2JBL0tTN01KVjVxZWZqdVVx?=
 =?utf-8?B?QnNoWDNmN0pqQUUzMWtScjFEckZ2aWVGcHI2WnNhZGFSOE5mZ2hkSERqdVVG?=
 =?utf-8?B?T0NUQ1dSTUNSU3c2UTRVWUJPRTAxWWVDSVpsOTR6WlJ0eGxSdkRFTXU4K2dt?=
 =?utf-8?B?MktZSG4vK25UZUo2RlZiS0daWDRWbU1Pcy9BVzFZYzRUcnIxRU5paVJtdURh?=
 =?utf-8?B?cGZMVy9QTzE4WXBUejZDR3hzdCtYSGx6NUxKQlo5U3ZGRDBRa09pcXUzL1BB?=
 =?utf-8?B?Wk5ndWtSQ1BJTHNRQWpYVlRiTlpieUlCRWx2cXh5Q1dSbzBDM3NXN1ltQUlw?=
 =?utf-8?B?amJ3bTlaVGpuUC9aK0dJWG93dm5mOEg4T1hTN3BkMVk0ZDlmenFEV1dteGRQ?=
 =?utf-8?B?cnJPR0d3b2poT3VONDJocUcxeWhqV3pGUU5xaTU0Z3ErK29NbHZwcGlQdzZ3?=
 =?utf-8?B?dTJiaHZ4azYrcFQxK3hwN1JPV0tncWlOYkZsQ3hybzA2Y0Z5SStxMHhxM3NT?=
 =?utf-8?B?SnBnajZzei9MRWdacFpWZndPeDRCZnliRE1aeTg1cmNYWW1NUDJXOXRLY1dO?=
 =?utf-8?B?WFJBenBPQ2JuMWQvZ0dsQVJLY1ZMWlhObjFPaTZPcnVuT241UkFRQkk0ZG9B?=
 =?utf-8?B?YVpvSzNyWXRCSlhhaEZIZEtySXg3ajU4SWZvQzNoVjh0WVN6YmMzT1V4VEth?=
 =?utf-8?B?aDJkendlNkVYTXV4R2Q1QW1Wa3pDQWw4UXRvekUwOUhSWE8xQ0NaclRncDk2?=
 =?utf-8?B?a3hQOGQvaGVPUGFyaWI1NkN0c0VBOVNEM2FudGhJMnR6ZFdaMlFFanQxMlNK?=
 =?utf-8?B?T1ZXNWlRaUpxQ0xVdktJMjM4d0h1N2pqenhZRitUSzh3NFZtZ3ZzL3JvbDNC?=
 =?utf-8?B?djF5VEdGMTZtN05KclVnYnViZDhxakcvL2N5aTNRRjBhRDA0WGIyODNhN2ZD?=
 =?utf-8?B?QVpRMkdYaUhsSXdRd3AyTGxqcXdOd0R3aXgzUFF1RUEwWm9nejd1OTN0WHFH?=
 =?utf-8?B?VTRyU1k1T0dzRzhqaGRyYThwVlFUdWRQeldISGtDdWpPT3hneXJTZ0l1bU9F?=
 =?utf-8?B?UHlLbHNNNGhyTnpnMUNXVThVWVBTOTlaektFRllld0ZSQUpIRDFFN1BKT3lF?=
 =?utf-8?B?bjVvTm56QitQSkhxMHl0cHVqNGdCY3NKWTQzOFZkQW12UVUwREhGSC9rMy9p?=
 =?utf-8?B?YVZvbzZmTnlqNjdYR0s4QmJxRFl3cEpSTGlqTExTaEo2RkE3SUJCSWJGcUhB?=
 =?utf-8?B?KzdsSGlmR3JBdzM0L0FuR1NTcUNqa0NBR1dVZThNZld0a1Yyek1vcmZVQWZy?=
 =?utf-8?B?clJXb0V1cGZGdFc4SE56cVpROWNPM2RwVmR2czNCVzl4RDBZSm5UWU5VS1hI?=
 =?utf-8?B?OWFZVncybTZaMUJkcTlMWDJtdkFwME9SdytHcGhCaFQ4UjNUeUJhSXhSNzRl?=
 =?utf-8?Q?liaLf11nZ+KHsRViI8EUOyxlVOQFvG5cP6wSKLQq1AY4?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 165593c3-d4ab-4213-2260-08dcf9afa4ec
X-MS-Exchange-CrossTenant-AuthSource: DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 13:26:36.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ydq/1R856sLF+PqxXTp7jMUtX8uszeNbvAv1o/bgfcMfNuoGrKsxMIefYiO4paTdvnCSo2Fgoi0swWXaXJPLSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP193MB2488

The linux-headers package contains unstripped binaries. Lintian
complains about this:

    E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-object [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/asn1_compiler]
    E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-object [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/basic/fixdep]
    E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-object [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/kallsyms]
    E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-object [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/mod/modpost]
    E: linux-headers-6.12.0-rc4-g7e04fcfc6195: unstripped-binary-or-object [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/sorttable]

It's not possible to outright strip every package built with
"debian/rules" as, for instance, the "binary-image" target shouldn't be
stripped because it contains debug information that the
"binary-image-dbg" target will make use of.

Thus conditionally use "dh_strip" on the "binary-headers" target after
using "dh_builddeb" to strip only the contents of the package lintian
complains about. Also pass the "--no-automatic-dbgsym" option to make
sure no headers-dbgsym package is created.

Signed-off-by: Thomas Böhler <t.boehler@kunbus.com>
---
 scripts/package/debian/rules | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
index ca07243bd5cd..0c75319acae1 100755
--- a/scripts/package/debian/rules
+++ b/scripts/package/debian/rules
@@ -46,6 +46,8 @@ define binary
 	$(Q)dh_testroot $(DH_OPTIONS)
 	$(Q)dh_prep $(DH_OPTIONS)
 	$(Q)+$(MAKE) $(make-opts) run-command KBUILD_RUN_COMMAND='+$$(srctree)/scripts/package/builddeb $(package)'
+	$(if $(filter $(headers-package),$(package)),\
+		$(Q)dh_strip $(DH_OPTIONS) --no-automatic-dbgsym)
 	$(Q)dh_installdocs $(DH_OPTIONS)
 	$(Q)dh_installchangelogs $(DH_OPTIONS)
 	$(Q)dh_compress $(DH_OPTIONS)
-- 
2.39.2


