Return-Path: <linux-kbuild+bounces-4448-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C60039B7B9D
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 14:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F0771F213B5
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 13:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86C519CC0B;
	Thu, 31 Oct 2024 13:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b="UoFElqoU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2101.outbound.protection.outlook.com [40.107.20.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412801BD9FC;
	Thu, 31 Oct 2024 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730381202; cv=fail; b=sHSPqrlQIpBua2ApAlq6nsisQCKwvKsbsWzbCv5oQIHsiHT4PVM+BVNzcXRXywZP+Wzs0RlQDMPPVa7Vr7ekY0CNj+fBxtQCFxGJEQvwzZ6QGzQDrMsCbyc44f/3YLKccZgi1Jg+2mX59X41f/FQnILgllOC1TOLvP30I1/CKck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730381202; c=relaxed/simple;
	bh=Abw22ZZ1Uzeqm1zMDCn7yXEvRNw1QlBHqfHaMHbFelk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SenuBvQ/9D/2DkqPumNNfJkGDzR7jURGXyb/Q0qBVMQZWiF1peJtoaSapmcqOrTEoGjtkMENSKns3gGce14sADXmI1cbCkwwsZ76nMh3ZYJiumsKK9UIxAt+szZi6n6SgvMpJdCBB8Lkn6nbd5J4TqHMPrFT6TbecjE7SNnV/xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com; spf=pass smtp.mailfrom=kunbus.com; dkim=pass (1024-bit key) header.d=kunbus.com header.i=@kunbus.com header.b=UoFElqoU; arc=fail smtp.client-ip=40.107.20.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kunbus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kunbus.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHAO04xyYkbaL6ZZubHRzbxwewX3gV+hWG+jrQ1AzBp9gTmI1V2MsfWMKsJMQZZBJ0Rrq9DUa6Me4HdndUDos/+pg56wmIUdMiGLtn4UfFg32DfDxrly7/o7fpeaEsLrJmHqJRaqzPAoysVl0S6vdJT9EsG+UJbCUzq6g8VPM6CZdZP0SWlFLTsHqB25TUmtQ/In8sJP1pByu/1dvxDjbQrvMlNkbWVviNGaSTn14YvOC3T+M3TW3/jKU+M4z6SOB+oEIrw6Q7f7sgnLb579gUs4RYBxAQxiOLLqQb7OvpwIhiN+XT9dXlEFUSTrtfkgcYj6YXlDWXSzJ6tAToJihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iZE6aNJbavtw0mdVr1fzm94ERIWCYCbygJ/HeXIDXw=;
 b=V9g56WdjkKkgOzUrvx6l3lZiNpov5SxU6CfxNs88p1rp/U9cSP69ZMTNzIqvpgy5Bc6HidqOflD6dAw3wmBbbn9pp4HK6imUzX/9ygzrbsiAjMnWapXofc46+Z2qt9NUv0yRRziL3l7uh6rlqaJmYKTdkR1pf30iRLkhmkDc6y5dsaugv+GtJO0yu1qrakfGCCfv40vDsaZpiaN9f7u314G1q5qSNSW2W49We0c4lsB7yxjo209hOWrSuTQxfm3bur98XMUX0+5ie1oL4C3DJWBGXxHliGd5tPf4gipw+kKk4xyhA18Lp3pWfRqFhn3usO7bacH6AblxXthaI9Smog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kunbus.com; dmarc=pass action=none header.from=kunbus.com;
 dkim=pass header.d=kunbus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kunbus.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iZE6aNJbavtw0mdVr1fzm94ERIWCYCbygJ/HeXIDXw=;
 b=UoFElqoUg9kulQzmZsn5FknnD1p0cnrXmO3FkvZX2yg32+5Uq2wzKeHeJezPxPRuRn/vQITUduJCP6BMadEFD69uq2WmhbVbTGrzwZQaMPdmZhDhHhAqIUe3wYrjdy+g+1dW4Le7IUpLY/lLH02rv2CyvVMSduPKy4a2tsy0iyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kunbus.com;
Received: from DBAP193MB0954.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:1cc::9) by
 GVXP193MB2488.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:1db::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.32; Thu, 31 Oct 2024 13:26:35 +0000
Received: from DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 ([fe80::ff97:4bb0:9245:6d0a]) by DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 ([fe80::ff97:4bb0:9245:6d0a%7]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 13:26:35 +0000
From: =?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Rosenberger <p.rosenberger@kunbus.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	=?UTF-8?q?Thomas=20B=C3=B6hler?= <t.boehler@kunbus.com>
Subject: [PATCH 0/3] Resolve some lintian errors/warnings
Date: Thu, 31 Oct 2024 14:26:27 +0100
Message-Id: <20241031132630.24667-1-t.boehler@kunbus.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:1cc::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBAP193MB0954:EE_|GVXP193MB2488:EE_
X-MS-Office365-Filtering-Correlation-Id: 54df2dab-bf70-4134-0647-08dcf9afa430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|52116014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SSt1aEhTR1FnRWZEN1dERFpYbFBubUZpN282aTJoUlpMT0RUZkRPV2k3YVoy?=
 =?utf-8?B?M2c0ZThDb2JQVHhyOC80OFdUR3UraDZhemNqZlBPSGs4ZEwrZnNHY3ZRbkpU?=
 =?utf-8?B?SUdCY1U5U2JNdmlYTW9vbVJidFZyZFY3eVNPMHdJQWNZU2R5MXRvb09mVURu?=
 =?utf-8?B?azhiZE8rdjQ2aitRVDk3MC9aK3NFSG16WStpUjdXdjZXOTV5MjUySDRzWXZ2?=
 =?utf-8?B?enluWnBtcHB3dDNWUVk3ZkVwMlM1SEZScmNpSVRGLythMlhuR3NBY2NyRXZo?=
 =?utf-8?B?cWd5VGpKcWJHdDIrZkl2WjhxdWtmcmh5WDNkUWdkZWZXK2ZoaFdqckRwOFN0?=
 =?utf-8?B?TzZnVDBqanFMRnFBTmlmK1FlS0NJeE51dlhhYVorQ0NHZUd1bE96NE9iU1ha?=
 =?utf-8?B?VmMvaUNLTGp6OXA2UFRESlVJVXJHRy95QnhhMmoxRDRnT0EzMHRCbXpDTXJy?=
 =?utf-8?B?M3JxT0FXTW42d0oraEtrclArVkdoRXRNZkdtdGx2ek5qR3lDSnZqbi9LSlc1?=
 =?utf-8?B?OFJDTWtTVFVRMFRqdlpyU1oySnhXWjlHajAxRVZ1YTV1bGFndTRSRXovSkht?=
 =?utf-8?B?eWtLSzRDUnNaaHpZYmdDWVBZa0dmWGFYSUQyTUxqNytRYVMwNWNsUU92bzFB?=
 =?utf-8?B?V1VBV3RLMFNQM3ZDZHhOOUU1TUZ1QitiS2NnbDc5WVV5S3FTbHV5RG1MU2Q1?=
 =?utf-8?B?M0NVY0hjQWNpcmhpcGdFTlBFWXo2YU4rbm1uMW9vZjRoZ09GWmZWdUhYaWx5?=
 =?utf-8?B?ZTkzYnEvMFQ1Q2VJY0RFLy9SSlp0aWxodU56YmxMSGxNc01PWWxXNk80YUly?=
 =?utf-8?B?Z1Y0Vm9SaVlOWVlxWkQ4ZDVqaHpiRDlqcUxyb0J2d1VXWkUwdHF2bzNoOEFw?=
 =?utf-8?B?VWwvdkcyNjl6cXh6cUNXdlRLc0pyTGllS2FJV1R3WGJGMDJsK3FMSnFOaU12?=
 =?utf-8?B?bVZ3bTNZcFJtVVlGNHZ6NjI2NW5XblNGVHNRWmxlZFZqWnZjS1Z2VGp1OXpR?=
 =?utf-8?B?R0szRVdNMGNuNStOaEN1SzRYZzdybEVGbzNlVW9TMmt4SjVjNEhGMGQrRUxD?=
 =?utf-8?B?RlFTWEtNendITm43Ykxpelgya2VWZ3RzQjZZb05pWTIxVUFRc0pZYVYzMGtv?=
 =?utf-8?B?YXBIOEFJWjJwOE1aeWU4WExHaEJvV0l0T1RFcFVOUlZCYVpJcFZBMWhSZC9E?=
 =?utf-8?B?YVJ1SVVVRlpDNm5XVUhNWU5rb3h5VVNiZkdFWURCZnRDN0s3bW5rby94L1Uz?=
 =?utf-8?B?aFBUVVErOXdkNUJTK3FqVGd1MEI5T0Q2bXNyWC9rS1dveGN2VUhiTjJNT0Q3?=
 =?utf-8?B?VVdPVkM3UjNHekpKbVJ3NlJJbU56YmFWWUcwbjh1SFcyeGZyQXhEY1pxaDNE?=
 =?utf-8?B?aStzUVhRNWc0enNVMmthYWtiWlJibVR0ZERzdlloL2lsU2JkNzVDL3BRb1RT?=
 =?utf-8?B?RWJuNTFiY21hdWRIOEpLZExLNjVaZVZlVFNXck1wdHAzeEk1WE1Yczdsd3hC?=
 =?utf-8?B?cjFxQ1duUVVDZTZhaExjTWtLRFhMbUpTcEFLaVd6SnhMUFB6bFJraE0yOEZa?=
 =?utf-8?B?OXg3Nmx2TnlzQm1Jd1E2djAveDlMbzVMUkFRUjZDNk9aL1ZaNzVaU1ozVDVS?=
 =?utf-8?B?bE9XOFcyVm5FSkx5dTh4dGVpS25uUkZtVXIvemVkdUxySnhYU1ZpdkxZRzdL?=
 =?utf-8?B?b2ltT0VQQ0h0aGlibm1ET0FpcENaL2V0MWM0NEFDaDBmZWNYK1ZrcDg5R2Yr?=
 =?utf-8?Q?vLS+3dxcrfbrgtsw3JnrvMfJHBge80IZ0bh6ciY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAP193MB0954.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(52116014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXgrSFVEaStWcWo4RWo1UUVvQitvTE0wUWVRb24yaWNQRzBwRWhYY0tlOHJa?=
 =?utf-8?B?dUtjSTUraEg2amxPVGljTi8rdnBQRTM3UlZLU3p0UEUwcmtZNllZNGhvWWVY?=
 =?utf-8?B?RTJyTGhuK1BRSVVpNmMwRXJ1MVZKQVdLRXd5SG1IQWVqNDkzbkc3SStYWHBI?=
 =?utf-8?B?ak9sSDhNN0VyTVpyUDVDWFpNbm9oRFppaEFhelhWeUt1MXBGUFRzQlJUaGlV?=
 =?utf-8?B?bnZLL3RRcWw0UjBvbVNIVWwvWE9Cd3Y1U2d0b0FUS09PRlFjcmtadDNKZFFO?=
 =?utf-8?B?TDJMb2RyVzRaZWFJSkMvUGZweWt6cCtMeWJaeXNwSUgwcjdnRGIrNHFVOXU3?=
 =?utf-8?B?WUZKUFhkRFlIZDd1TFRPNmZTSEJ4NlZ0VzcwRDN4MDY5cHZhNCtkWHdCSVcv?=
 =?utf-8?B?Q0RDRTBmNkhDeThPR3lLNjFXblFienlNY0ZKSWRRUWZNV3BKTlVkeFp0NUlu?=
 =?utf-8?B?OFpwYlV1aEFzdUVhVXNSeENJZkVHb01aNU9ZYWlVWnFnK2hDeWs1cmV6V2dP?=
 =?utf-8?B?bmt5OXgydjE5ZlQ2RG1YdUVNYWs4ekJuc1VjdWtqZCtManFucjlmWlloU2Ix?=
 =?utf-8?B?dHlwZzQrWnBhbzZqbXAxS3VCWXllWDdyNWJwNkNWVHc1ZVV6OVQxaDEwVVVx?=
 =?utf-8?B?bFhUa3JLellwRzRHM1NUWXpiZmRLTVNuTktzQmRuRVprVmNMc0VvZTNheXhT?=
 =?utf-8?B?YXNGNDlFdXpnOWR2TW01YVo2Vmo5OWRoNDhqdWM3bUFjcjYwU2dmNHk1ckIy?=
 =?utf-8?B?d0pNazVyMVdIRytSMzRxdFZVVVp1Sk51MXlKdm5HUEg2SC95NEg3QmtldnBD?=
 =?utf-8?B?cnFPazBYQkFaL3FId25NSTFUTHkvZm9RYUhPUERLVEh5cjF1VE9wZEgvbHZm?=
 =?utf-8?B?MEJGTXpaUDlRSWtmTVBWeUw5TStwRG14MVlMM3ltbE1HNHpzWlNTUGN1R21t?=
 =?utf-8?B?MGlBbDJqV2lWS015U2l6UzVpSWYxQklHNWxhZ3NUb2tELzhjZHdKcGxuVWFR?=
 =?utf-8?B?SVRMTjRUNjBHSWhUSlh4Mkdld3A3VEVjNG1OMXZQMVZuYXhWVXZVOUtQOEh5?=
 =?utf-8?B?Nm1MQU1PODlpWVZhSzlmaWduSHpRam1FUkN3VmdrTi9NRTZySmFaVDlVaVJI?=
 =?utf-8?B?UmZpZ0tLbmtkZFd0VFNIN0QzT3djalFsUVRsUituMVFSNTk1MnI2TnAvclAr?=
 =?utf-8?B?OTVPZEZGOEs5a2NHWU1XQkNIRlBzak9HbWQ4RVdsei91dFdsalJRSmc4bkJ3?=
 =?utf-8?B?NGJwd1NrYktmbDJvem5hQVJnekNlbHNncGVhampVeUVKUVZ4cGVFeG55SHdO?=
 =?utf-8?B?NndJV1BwM2JNS0E2ZUxvWFlUWlZpeTdaYUVydk5EdnlESmZnU29UcUxuTU5m?=
 =?utf-8?B?Zjh2TVhiRVhCR213NHZHaUxiYVBkTlA3bmRMTEtDRytUWEFMRHJFcVBveG54?=
 =?utf-8?B?VzVzMkpnY04xNzF6dDhoR1pKY3FHa3cxUDIwNkxIcWR4anVTMjJuQ1VOK0Zw?=
 =?utf-8?B?Zm9UWmpvU0ZFZlJ4aEI1V3V1ME5FWDAwMXBzV3lsRkdOUkE4N3lsN3NsekhM?=
 =?utf-8?B?M09qdlhpTkMyT1ZyLyswOUNmQzVQT21nc2d4SU5GZWoxTU4xSE44d3lWZTM2?=
 =?utf-8?B?cDlmTUZVdm5JVlR3b3EvMG13aGZQc1N1SVhlUkdiZE1vUTZyVXQ2OG45ajlI?=
 =?utf-8?B?bkxwOURLbm8yRjZCWjZ1Z3JBYXMvVXZpay8xdGV3QlBpSmF1KzFJcUxreFFL?=
 =?utf-8?B?QXNBYUtrTS9DMzFBWFFyYlo3eW85YnVHV05xZ3V1U1JlK0htYlNJcXJETVY3?=
 =?utf-8?B?YlpVL0tWNDIvQWpCUjVSQlpEVmtZaVRqN25OMWYzQ2d1c25hc29KQ2Vjek9J?=
 =?utf-8?B?WGVVeFJCSC9OcE56N09BTm5mSWVWejR5ODdQa0V4OEFwU0hodE90bFpuTFBV?=
 =?utf-8?B?MnJSSDc0eHc0Mk9Pckc5dUJjL2thODBtUGxveUZCTzdqWXdURmsxRHcwbis5?=
 =?utf-8?B?YTVzYUtKRHFxQUFWQTJBVUltQ0QxSDQ0QUtOWlhLMXcwT1l6cjNiM2JiZnY2?=
 =?utf-8?B?bEhQaTF4UkluTTJJVWpsdkErdG5EQjdyMjRoYlFDN3JJdU5zbHF3aCtYT3Zx?=
 =?utf-8?B?K0g2R0wxdFNSMzVvamxFcnhCN05iclBmeTRON2JTV3JEZXZsNERjQWFlblNB?=
 =?utf-8?Q?tXD7ji76Hf50zB/67mmeY4f3uV+Lxe4u4cmGJoAUzLk6?=
X-OriginatorOrg: kunbus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54df2dab-bf70-4134-0647-08dcf9afa430
X-MS-Exchange-CrossTenant-AuthSource: DBAP193MB0954.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 13:26:35.0331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: aaa4d814-e659-4b0a-9698-1c671f11520b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZ+Ovu8/sByi3eFpSPDLsZ5FKC0xf3Q1yLcwacgnFNariXWbTThl0Tn4mkK1qUC540oLJBzigJTXRYa8DmPL6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP193MB2488

When building debian packages of the kernel with "make deb-pkg" and
running "lintian" on the resulting package, lintian produces some
warnings and errors. While most of these can be ignored, some are
helpful to address.

In this series the lintian error "unstripped-binary-or-object" as well
as the warnings "undeclared-elf-prerequisites" and
"packages-contains-vcs-control-file" are addressed. All of them concern
the linux-headers package.

Thomas Böhler (3):
  package: debian: strip headers package
  package: debian: add missing Depends to linux-headers
  package: debian: don't include .gitignore under scripts/

 scripts/package/debian/rules         | 3 +++
 scripts/package/install-extmod-build | 6 ++++--
 scripts/package/mkdebian             | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.39.2


