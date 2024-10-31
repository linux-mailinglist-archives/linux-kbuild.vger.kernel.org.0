Return-Path: <linux-kbuild+bounces-4451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5A9B7BA4
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 14:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5545FB20FFF
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 13:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6091A00D6;
	Thu, 31 Oct 2024 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="QUv6df5t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2101.outbound.protection.outlook.com [40.107.20.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C2219F41C;
	Thu, 31 Oct 2024 13:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730381210; cv=fail; b=HUKCKHdErEQM3NF6EbQMncs7lfJx6pFIcPlUelU+U7W6/AHAnTnhf51BSxlgoZuldFwOX60OIZv1IdJR22bO/4kP0o7mol+yaDYJNxGcQCBvp173moSBIsu8hxPuFdloKit8tLuDdZXX78YMb1ADexajxLii8g/sChzcJ8YYSHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730381210; c=relaxed/simple;
	bh=Q7XVAV+MtEk3oqoB07bx4Atz1eAS4g4rqJTkq0j9GLU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QJb0aod7cFhAilJuUqpRIAb3JaP/ItWsqaGHZMWFDvEsnmEyvLGiWGMWx4pQN3fohOKqSgPFyYL95XrYFJXco4ahBX3vbV6dvpOqsr0PKryQ7xp1ejfAdsNhAVkrAXpRj5DLVcXLYR4q2CdyxZxEFVI0rfD1F/CfLrZZbZSQRig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=QUv6df5t; arc=fail smtp.client-ip=40.107.20.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7969WWiVN3SAME23qNUuxERt5x1Kt3rR4gpc3AfLbAQjxNuWmXVvLptMJBbjeCj4yBqZWtJq+/O5nEVaLp7p1cty00kpXi/JjwkKX3J+E9QGolJN7AUacX8UOS8FJYpvZF2GoO3brablCgNx864ZHlvOHVWqFcL6/hbf36+fB4TDF8bCM94lI2w0mZ8+AN/FI84DJJakx0ZrRn1SK3tnVCS8FRRH5Q4fa8cTK+p/C6weTgxip/qiGJtFqQU0TTOywq5JaBe3gpahyb1Fy7tN9Ms3n1QPRqnvBHnZd0WHIvEc9N45/MboKFfg1ouNiLDWsykIO4FJo8CfGtOYyyfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoY3rNemiz+0/8PpQ0QLnrk3Jk8aUTDr59ZSX2o6KGY=;
 b=aKSWrr4GsJu/NZeNznbzt9SH8tMS3rAJ+vklxZ8T3WebVRbPwmmigFOFscxc8zGSGPtfXpR3vnU6jfVTz+EjMEfjvxnqwkFLSngD63QdDyAmBqX7y6sUqn4TdakmtSf38dZzYg3o1qfVYomo79/FRlpgxIiolkGUwaRxtQbtZXDZ481ggEr95XoiQcptNEkofJiL6PJmo5DjBaEkvmptHnNuntqQ4DXkjY3jNwLtfUJP4PwWqguhj2h9vlanLmVvaJv7+E2OoWavqzos7mOLAeg0L7PEQM2ilEvKRjzJhdN+/s2qk3c1BGXofF2G2DEXpzk6/9LkP04rfchxeuvHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoY3rNemiz+0/8PpQ0QLnrk3Jk8aUTDr59ZSX2o6KGY=;
 b=QUv6df5twHURCZYlkhRRGGJ68scNLRfZv/mJ19GyrAzvHOTtcIL2D0YZ3Fu65SyjjigYXOXryRvpC+TdLNE4cluC0v1hoBBeJsXDxoEdnOsIPqJ1AICIGyDbbwgxxJQIW0Y40igZmkR0qAuMNbY7B0yEzz7NVuH5K408YlAiQX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from DBAP193MB0954.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1cc::9) by
 GVXP193MB2488.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:1db::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.32; Thu, 31 Oct 2024 13:26:38 +0000
Received: from DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 ([fe80::ff97:4bb0:9245:6d0a]) by DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 ([fe80::ff97:4bb0:9245:6d0a%7]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 13:26:38 +0000
From: =?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Rosenberger <p.rosenberger@kunbus.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>
Subject: [PATCH 3/3] package: debian: don't include .gitignore under scripts/
Date: Thu, 31 Oct 2024 14:26:30 +0100
Message-Id: <20241031132630.24667-4-t.boehler@kunbus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241031132630.24667-1-t.boehler@kunbus.com>
References: <20241031132630.24667-1-t.boehler@kunbus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::17) To DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:1cc::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBAP193MB0954:EE_|GVXP193MB2488:EE_
X-MS-Office365-Filtering-Correlation-Id: 9244f0cc-8b12-471d-c93c-08dcf9afa665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|52116014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0l2U0s2SWRJK3BwYmRPWDlFQUVMSDJQYzk3cGE0SVRneko5YkxPNHZyRWRL?=
 =?utf-8?B?SnZ4OFZUL2lwOXFvdG93Z3EzejUveHFPZHArZlpNa3NxWjdFVXZKQW55ajFD?=
 =?utf-8?B?M3ZPVkl3REtjck9kSWloczFRNmZUbDR2cDdlT1BPSWUyQkNGMzN1MFNlU1Bk?=
 =?utf-8?B?SXRsbkNtdGQ3dzYwZWlCSUxtclh2d0lGOCtvaDhXSEJrOCtaQWxLcVJ2YjAv?=
 =?utf-8?B?alQwOVZSaXAvYm1CNDY4UWxwaTN4OHh3WGtKQVdTV3dqNExkYUVDY01IZVdX?=
 =?utf-8?B?SlFTUHllQ04zWEtoa3hVWGNCeEpsWWFkbUd1V090bC9zUEVWZW9KdUV3RFJD?=
 =?utf-8?B?SDBYMXFxZUNHcDNFZ3A3Yzl4dmJTei84ak5VVGZjckIrSzVjeW0wUzJIUFdV?=
 =?utf-8?B?NUJKWjUxVDRsS0x5Zm0wR1lJS3ZPME9ZblZvMzc4R3pNWGRWU25tVkNPVXlq?=
 =?utf-8?B?MTRQbCt4TFQvYzc5dCtUTkpVdUNYeVdoTW5SRk5tV0VSZncvbWtwTVFOODRz?=
 =?utf-8?B?Sk9yL0V6aW1FakxlSlNiZXNRUUROdUlobldkMStCUFRJcXpzcFpTS0d4QnhN?=
 =?utf-8?B?dHRZUHF0ajBvYnJpNUtkeFhYSmRrZzFFWVVoNWtvLzNqSHF1YzJycXhsb1V5?=
 =?utf-8?B?TU9pVDZFNXE5cTF6THVITG5PbEpPWFVKazZpRnQ1enIzQUVNbzNjaTh3N0Jk?=
 =?utf-8?B?NXZzNHhHRmtnSlRPWU83R29HLzFLa0M4WWh5d2IvZ1ZmRm16RVFIcm9qRWJO?=
 =?utf-8?B?UVZRZGZTZ3Bmb1VTeHpEZEwrZXJ2RW5jVlM5ajh1ODBSUGZ0dWc3dW5hbjVF?=
 =?utf-8?B?MTNJZmNmeXd0WCtkZWs2SUFWWjUzRGFnaFpIT1R1OEFqZk5pZU9Dd0t2eXlq?=
 =?utf-8?B?OEdwWUJ0cHAwUHpRZ1psRFdQS1FJQ3RONUw1UjhhWHFBcENTWkdUUjlwSUdw?=
 =?utf-8?B?UTlzTUZuZnhiRXdnSWRDTHdxRmdUOXNDUWFoekRzRjhwWFFvdXp5cHFQdk9U?=
 =?utf-8?B?MFNhcS8rUDYvYXhzT3NqZGcwRGtsdGhKVjhpM1VBY1NtMWFRUDcxOG9ubVVG?=
 =?utf-8?B?NFpGTDIxTnBNNGNyYWVFcHY5SEZBOW5FRXRVY0cra1lWTmcwNTM3MENNWUgz?=
 =?utf-8?B?NStaQXMyN2l6R25yWWdxOGtMMjdJT1RYTk9wS1VuWVB3NllOTGdOTjNYY1J5?=
 =?utf-8?B?YUdsMUYxS0xmWHNwbEQ3VS9OZDA4RTc5QnF1eHR4aVFiZXhVaEJlRUpvNE5j?=
 =?utf-8?B?NmtyOGxRRkZ2Yk9EaC91ZzR3RGczMXhSTytXK3BVT2xpb05wWTBEakh2QWx4?=
 =?utf-8?B?NVB2dnBPVGpWSUJBZzB3Yi80RXFwSVlGNlEyK1NSUXUrTzJRYU1kWVVnQTht?=
 =?utf-8?B?YkVjSG9KVWpZc1ozbnN0eDVhOC9RUUpqZXZ5dElnQ09ySkpRb292Zmc3SG5z?=
 =?utf-8?B?amFKNzVtMU1HL01SVCtWbVNiVnZhc3hKdHc2UFJaOE9hcGUxMm5ZYTBtVjN3?=
 =?utf-8?B?V2RlQldUK2ppUWxpa3dsTWZMMG9oT0g0U2xPanlZVEZ3WGU0UVRWUzhjYUdE?=
 =?utf-8?B?bDQ5ZEViYUIwWkxGaWwvdUxpRXh1R1paMXgzUFRWQXBjelNsRWtNMWJNQVp4?=
 =?utf-8?B?T0pyenhBdjF3Wkc1T2lwaXR2VnI2M211Ung0Nm9FTlZxTmEzZzF4aFAvbHgw?=
 =?utf-8?B?K3JrREF6OHMzcUd3dmVKS3RPYUFBNjM4SDFsZWZ5NTVLZHJ5MUx6aUgwNk1x?=
 =?utf-8?Q?RB+JTr5ghVxaRQOeJJtoWWYnkcbbelqWHvDaHUM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAP193MB0954.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(52116014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU5YSVRaa0F1L0xtZ0U2aE1DcjcvNWFxU1NvR1gvYTlUejZoeWRLU0FlVGlu?=
 =?utf-8?B?eTFYRFlpV2tCUTFsK2FOekpneGN2MG54djZIYUZicUszcWUraHI5T094RlJo?=
 =?utf-8?B?dzlURk1JTG5RZTNVRERid0xOOGlCWkpBbU5GbW1SeVp6ckpVd1EyMDdwTm8w?=
 =?utf-8?B?ZGJyQVRVV2lQQjVXTHlWWG5MMjNqYitlYWI5T0Q0R0RmRE1hejMwMkd6YkMz?=
 =?utf-8?B?dC9JbmJlcGJuTldIVW1IdWF3NkQxdVpnM0ZkaURaYlE5RDk5OVdsbkZZVlpL?=
 =?utf-8?B?MzNVaVFtaHJ4SzVqaWExY21veVYybmhBNEFVNE9IaVM3MlhMbGVzUGFCcVhT?=
 =?utf-8?B?Y3VGcVdGdnZMM3pVbXg1UkhXU1V2Z1B5OUV0eE82OGhkalY2cmJ1dEdqUGkv?=
 =?utf-8?B?azNhZ0E0NlBqNEpBZnBhUHBRZ29zZXVjdHFUNVcxSW53QS9UdHppNEFhMnpY?=
 =?utf-8?B?cjdESmxhRWpWMlo3N2VCbWJjL3AzTitZdHV6R1ZlZ0cxRExhOVNBMmdQVzhD?=
 =?utf-8?B?VUN6R3ByTXpNa2ZUWHNEaERTOWJ2UVV0NTdLVVFlR0UrTmpENkxYcXdzcUpH?=
 =?utf-8?B?U1FWWkVZUnE3Sk1wOTA5Z25lNmZ5ZTNSRHpkUnMzdXBlVFdwbHVxTFlwSWFC?=
 =?utf-8?B?TFI1LzBoZVoxNW1LRVpOM2ZqS0xwandBVjRyRXdDSm9oVGxTNGhOUU5aREdr?=
 =?utf-8?B?VXhjL21DWmN4VGlVVGJIcUpJdndrZ3Z1TTMxNS9LRU5ZWjFFMUsyTjZjQXNt?=
 =?utf-8?B?YTJQT083clNwRjNXQjZKa0xUaXBNNGtYaG5Eb1BIU2owZkhSeTBIQ1NiWWtG?=
 =?utf-8?B?QWZLdVpoL01WZUtKaUxZQ2grRE8veklIK3FBK1VkRDRrYzlRYk9GZEtlNFBN?=
 =?utf-8?B?cDJYOERhd2VTY2k5cEVtRmhPbGtUWWRsaER6Ni8wMm1xQnVYRnEyMWM1WlBW?=
 =?utf-8?B?ZHBiZ1pZWnIveWtxcjEvRnkranowdHl5cWI1RC9TeGN2elBMK29Sd2RaT1Qr?=
 =?utf-8?B?M1Yxd0c3NnYwb1AvN0lMMGlvMEFKbXNucGR2TVJHTHYwL3ArYmY1cFp0Tkdi?=
 =?utf-8?B?cStyRlRVam1jSWY4YUFRczhjbTY4RXR4ZFNPL3VnNHArYWtCTFNVeDdPR1F5?=
 =?utf-8?B?M0FobXVXbWpYOFpER21mN1U3N255Rmk4Z25Ic09FLzRzd1lUMmJlZ3F2V3BQ?=
 =?utf-8?B?bktqSy8yNHBrSUF0a0JTVE50ajV1MHNFOFc4QWJENlJRdXFyUEJnenFFellM?=
 =?utf-8?B?VitvSDhoenpvdXg4ZVk4OFVLb2lUQWR5YmN3MDhYN0xiUFNGbGlIV2VtWjlp?=
 =?utf-8?B?RmFVVmc3N1BDc2hOOHhQT0NpUFNFQzJlMkZFajZMR252ZTlidGViTVBIUy9J?=
 =?utf-8?B?NnV2R2wyclpyYWNvU0dRMG9JMUhVa0hXMlUwKzJPTzVrR0Zna2ZjVGhlcG1I?=
 =?utf-8?B?NXhBdFVpZm8rQnNVYnV6Zi9EczcrWldOUjkzZlVzanhLS1BRUDd1aGFJV0VT?=
 =?utf-8?B?NlF6bUZiR1FDcm9hQXgrakVEdkVLTmh3cGo4RmZMT1FscHdPOUp5eUNndlBu?=
 =?utf-8?B?TkhxZGE4Ym5aeUgwVnRpZEFOdU9uR2hsZDFuSFlha1IvdmZLTHIvMmU4Smkr?=
 =?utf-8?B?R3oySnIvY0M3V3VCOCtJd0tObUExZkYwSmNyY1lqRUpobzNoeUZGa0ZZSkJl?=
 =?utf-8?B?Z2orQ2dQTXd5NExmMC95Ry9hVEk5RmRWMkFUdEtIOUQ3a2xDNm9VYU1Mamps?=
 =?utf-8?B?a3RrT0JHM3JRdURvYTRtQVhkbzNPQnU5WGJMcGxRMG82bHFNVkFHQkh2L0NV?=
 =?utf-8?B?MHBUenBaODM0c3RTUnV6bUJpRVZXcDZQandzOWd5REpXU2c5ZE1nK2V4N2lz?=
 =?utf-8?B?S0pkVkVGTWovNnZ0MW9NRDY4RllKd1VSMGJHbS9veURDb2JhWUgrR0xQUXY0?=
 =?utf-8?B?OEhWaFlaTmZMbDZmdTdlNnRKeVZyZ25ZcE5XMDNiUGlCK1J3Tnl4RllITHdV?=
 =?utf-8?B?eVJqRjlwd04rY0xyL1E0NURNZC95R013WnVXTzFQSkZvTmg2alYvTWpTSzlw?=
 =?utf-8?B?bWNJbUYvNWxldVVHQ1V3ZkMzOVdCcDRDOXdERWI3TmFlVUJGVnh2em05ZGV2?=
 =?utf-8?B?NTh0dmhDTDk5VjRaeFdEUDcwQzQxRDRzR25FSHJNYXNoT3c2TjJWUWZGY21O?=
 =?utf-8?Q?c+ffHx5iEATJpis4TwqgGNTlU4pgc7yUVTCFGcP5bqBy?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9244f0cc-8b12-471d-c93c-08dcf9afa665
X-MS-Exchange-CrossTenant-AuthSource: DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 13:26:38.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUHmY/RoAVlPksd7537SuBHzaAEwOtL/9zV17m9lGC9JvdulI4xWUv83dkW9L86JefCR0rnunAEzfuvjdNiqUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP193MB2488

Files to copy into the header package from the scripts/ directory are
listed by a call to find which also includes .gitignore files. These
don't belong in the package, and lintian also complains with a
"package-contains-vcs-control-file":

    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-control-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/.gitignore]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-control-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/basic/.gitignore]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-control-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/gcc-plugins/.gitignore]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-control-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/gdb/linux/.gitignore]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-control-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/genksyms/.gitignore]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-control-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/ipe/polgen/.gitignore]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-control-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/mod/.gitignore]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-control-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/selinux/genheaders/.gitignore]
    W: linux-headers-6.12.0-rc4-g7e04fcfc6195: package-contains-vcs-control-file [usr/src/linux-headers-6.12.0-rc4-g7e04fcfc6195/scripts/selinux/mdp/.gitignore]

Filter the .gitignore files so they're not copied into the resulting
package.

Signed-off-by: Thomas Böhler <t.boehler@kunbus.com>
---
 scripts/package/install-extmod-build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index d2c9cacecc0c..5c735e176b53 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -12,7 +12,8 @@ is_enabled() {
 find_in_scripts() {
 	find scripts \
 		\( -name atomic -o -name dtc -o -name kconfig -o -name package \) -prune -o \
-		! -name unifdef -a ! -name mk_elfconfig -a \( -type f -o -type l \) -print
+		! -name unifdef -a ! -name mk_elfconfig -a \( -type f -o -type l \) \
+		! -name .gitignore -print
 }
 
 mkdir -p "${destdir}"
@@ -23,7 +24,8 @@ mkdir -p "${destdir}"
 	find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
 	find "arch/${SRCARCH}" -name generated -prune -o -name include -type d -print
 	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
-	find include \( -name config -o -name generated \) -prune -o \( -type f -o -type l \) -print
+	find include \( -name config -o -name generated \) -prune -o \( -type f -o -type l \) \
+		! -name .gitignore -print
 	find_in_scripts
 ) | tar -c -f - -C "${srctree}" -T - | tar -xf - -C "${destdir}"
 
-- 
2.39.2


