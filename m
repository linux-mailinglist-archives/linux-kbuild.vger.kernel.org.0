Return-Path: <linux-kbuild+bounces-10914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNe2K6OpeWl/yQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10914-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 07:16:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F609D61A
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 07:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA1C3009FA5
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 06:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF76025771;
	Wed, 28 Jan 2026 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="cIdFOUuK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazolkn19010001.outbound.protection.outlook.com [52.103.73.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8011723A984;
	Wed, 28 Jan 2026 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.73.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580950; cv=fail; b=dN/2vSIXeFMfeIT10RldcGiS170Bf0Z61LZiH6I38EigES5Evq2pGalxCaUYlLjILpjX4HajwHSl4JOL0W8pWA4XsZIfXCL/Z+YzFnJilkFAAeM322AKzXipRfbDSLBtkMZn6N6Iga2LnN0qIHmWvzx+wOYV2Jif60jvP4s+ASk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580950; c=relaxed/simple;
	bh=WBZk9DkxJCqAANb6EU5t8N42vs3d15l53cDIvTKvwJE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CckhJVM4kqZkX4X/SEVqiTTKKR7DYH3x6sojMbQ/O/5Nao7qfESk3m76klP4SuqRODr+vVljjnFKKYGdSxuVOU5km1gP/dNhVfFFdl9OlfutJeZa5QE91+hI1B3dloYEGQHPciLaAlI17hQpWeBVk4r3FGOCfBU5OyXH0iBOFW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cIdFOUuK; arc=fail smtp.client-ip=52.103.73.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xl6E4zYAIrFDLIRYut9SkBGxhqguNTI2lfDVusWa5GbljQP7MiWJRcjzu17yj7CsxOzC0sH/b2klYstot9M7YXUBD8IJhjcPu70hKT/RT4AZyNTr1o34tiJRddwKqTy58iPZqRH0xoaXgN4L2OPWi3DAB7BJiZVJRm1Kxz8BC1ZLVivrYWVoUNKHjvMykBqRwoMFOMtxiq3R7zqzTce1sLIJAU3iKJIkzwWx7hiY8GBDUYeG5FSZhEWynDuPXgszM3reL7Fatc6LxuPpfsBEmoKF9K3GbBr+1JkuVmVwt5rsl/kTapmnxIbNbxM1LFR6UVzk/IOr0q4HQQrKmKAEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBZk9DkxJCqAANb6EU5t8N42vs3d15l53cDIvTKvwJE=;
 b=GgeWDWKEYZfkGrdCYNGysbKp2BAKWXpJbE9YMdbjfl+uj0PapT133Y1wulSaJLwkSl1KJ0NgCorea6EIjdcCswRzqTwS0Y5H0bBlIlBpDtYDjNBSIiy646p1/YkEtfgQ/bHFzh3DhqyhW6uwaUIZe5xTA6f1NofJqL0AdmoNRKgguxqrjWENIdFQd2/wBJUHdy6ZBl7NCD+jrF/u9UhoWT44l2pvayLQT1RmHpKxlZ00lRBN8SLgwFB0nQXECPogYucP8UdMfKNNmceqBUsYJXgKi1T0YhXPt5LzOvnaKks5fMFNhPyXvKGv72mZhEpvKxD3MremFZqbcwP5IRXt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBZk9DkxJCqAANb6EU5t8N42vs3d15l53cDIvTKvwJE=;
 b=cIdFOUuKGWC/xncO84fzCvDPLS7C7sOX8CtndZNIzhEPvieIVUs66dB1btwKSa6yCQI5+90qt48BgLHA+AwhCWb4Q10xIwndrOmxn+6rlA2T+TScjIzzhhlY4j+dPIQKwEc1rYr5+ZJpbI34mMerhXxy6YXvQNQVA7PlpTiVzYBdo/lXLz/tDbBPGCLo/Hyaww6BD/FwuOjBBkkTTKfgTz1V+PuPcH7QOm0HDrJrKRiH3pJwPZcJzbqdJ/kFT2JwThlDl32fDFuhTM+45k8vUlFnjQs5qkToW+D2597jDoCobMp4xtnNWyav756nOZrNEQl66lYXJqDbY1by8KYHFg==
Received: from SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:285::21)
 by SY0P300MB0038.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 06:15:45 +0000
Received: from SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 ([fe80::3f5d:60bb:b39f:f618]) by SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 ([fe80::3f5d:60bb:b39f:f618%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 06:15:45 +0000
Message-ID:
 <SY0P300MB060938844032404EC9C1F0739C91A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
Date: Wed, 28 Jan 2026 14:15:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Fix permissions of modules.builtin.modinfo
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, masahiroy@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <SY0P300MB0609BE844D61B504AB2013C99C90A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
 <20260127205915.GA3856796@ax162>
Content-Language: en-US
From: Ethan Zuo <yuxuan.zuo@outlook.com>
In-Reply-To: <20260127205915.GA3856796@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0154.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::18) To SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:285::21)
X-Microsoft-Original-Message-ID:
 <b93d628d-4a9f-446e-ac42-47e3e18f8f6c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY0P300MB0609:EE_|SY0P300MB0038:EE_
X-MS-Office365-Filtering-Correlation-Id: c0af3481-9120-4069-51bc-08de5e34ac54
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|6090799003|23021999003|461199028|5072599009|51005399006|8060799015|19110799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUZTakFrSE5JTDBrdFhZYXZva3FKMWxXdTZ5QzNGYTFnVmUvTWJxRk1QVUZy?=
 =?utf-8?B?Y1Y4V0lQdmNORkpaeUszYmlLOUh4UGd6MU9xV0RKKzkxODlna0hJaUwvcXpK?=
 =?utf-8?B?a05yK2l4UjFrb2ZRSTZ2V0dobnRpaWFhSTV0eDFMT0Y5SmVsaERBMHNlNVFy?=
 =?utf-8?B?Um1VRkdueU1PZkh2Tkphdm5qWDlqZVlpRFNKL2Y1R1RGNHdyL1IzTFZSNG5J?=
 =?utf-8?B?SjZkVVZQMHVRM0hlUzlOQXRPRXAxaTFHOFY5Vlo0Z2txbTF1Zno4NTJaL2p4?=
 =?utf-8?B?MnpVUEY0ekdoOC9sUGc1VjVya0xoTWpuTkFFY3VhZk5BWUZXdld1bFc3QWlI?=
 =?utf-8?B?b1RDNTZrUVFoSzZiL1ZVWDMxZTRTVEZjSDhra1h2bTlic1lvV25sZ1NRMDZo?=
 =?utf-8?B?bTR0bHZZMGpjc0tXK0tpY1dlZFNRWXZOM3RROWxmUWRyL2RSK0JtRytwZ2pq?=
 =?utf-8?B?VkkzenovempKank2cDFGamlhSjZ6Y3UvY0c1NEFSZFVqQlh5YzJETXVxamJU?=
 =?utf-8?B?aFZNZHpzUnZqSDFoNFlOamJ5dWxKYzNkQm1XaGtuRk1lS2d5cmo5SExkTkgz?=
 =?utf-8?B?bEZSZkhhUWxvNnVUSHRYZXpHaHR5QWxTWHRWTEpERC9UZHFpY0VBRzFOUnNh?=
 =?utf-8?B?ZDZualJMT0R3VjFxZ09iTzhtdFNpQW5Qa0dHUWtXbUUxTDRheFQ2bUtleC9p?=
 =?utf-8?B?NGI5VnhHdkpBNXpBOUtma0E4WVp5cXlIRFpvZXREbGMrODVpbU9OMytXb0Zv?=
 =?utf-8?B?QUYrdUxtVWFQNjhveko3cjk3TUIrT3MxUm5Ca0xkL3hDQzRFNTR2WVVBQmtW?=
 =?utf-8?B?bnpXd2ZIVkt2Tlp0c09wdTJxZTZhdEE1M2NaQ01ZUDhEenc2aTgwZnpCdjZ3?=
 =?utf-8?B?SFZ2cHZOZUIzZ0xpS2R0b0doSjVWblRBQ044NDhremdoaENMdW9hY2ZtUjM5?=
 =?utf-8?B?OUpPQlkwZWtUWVRoSVdpbU1Jb2VLSXBhaEpXK0FSUlVaS1NpVWZmL1F4YW9o?=
 =?utf-8?B?K3NtQlE4WHhKSFRVQ1IrU29ORzdIZEJzeEpYeTMwWmFLazNkMHJVWGZUUUYz?=
 =?utf-8?B?RkV6Sm1URGIrdUlYaEsrV09tSVo4U1MySyt5TDY0YllwUTluTnlWak13c0xY?=
 =?utf-8?B?ek5WVFVXS3FFOWhYZnc2bGhIc3A4TVIvK09LZkhyc251S3Y2Zm1YbTZ0WWZu?=
 =?utf-8?B?a3d2KzNrd1VNTDl6aFUxaEROYnI0ckRMVG9PNWN4cUdBcUszVEw0U1lLV1Z5?=
 =?utf-8?B?VXNCQnV2M1BpM2VPbkhvT09wNCtDcDZ6OHdZZXp4Y2pzbFJCVmlGTW1UbnFh?=
 =?utf-8?B?cnVUREJMWitTbzBPeVJQUThTNVpjUm1EMnRZOXY2dXNxMTl3Umx2MEhnZHE3?=
 =?utf-8?B?RU0vS2wwcDNIa0JGVjk3WHpkdzkzYVorcDRyeml4NnB2Tyt3UHpYMnZsamZn?=
 =?utf-8?B?UithdE13TkRGZlZMTkZ0VDBtcUlRdzNKN1dPTnBYOHB4WFhiQXdBY0JuM0lm?=
 =?utf-8?B?VU1PRHd5VXpFTXhpTUVnazJ5MUxlL3J4MTUzdFNiZjRHTEtXdHlQZ3kyalky?=
 =?utf-8?B?OTFZcUd4cHN1Q0xYSzlabk5Wc2gzWm5NZm5VMy9XRGFTa1hiQTI5WURoQ1o5?=
 =?utf-8?B?azBNY3dzNGxOM1RnN2xGMWJEMEhVQnc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1p6T25yaHMwY1MxQ1BtaGt1Y2p3RXc5QW1CeFhQMGQwN2I4cGlsYlV4UTM4?=
 =?utf-8?B?ZDRNVFdTTDB3VlpaWHB1ZlR1OWIycVMxS3FFVWk4WVhqcWUvZXVJTitYZE83?=
 =?utf-8?B?OTZxaUFOeWVMTG5zOWZ4cUU2dzFucm5BRm81bGNSNmFIUTNRNUJlNjRuaG0y?=
 =?utf-8?B?cytId25yNEozeTNrbjlqSlZiWWJCUTd2dVFRVHU1Y0M2N0ttdXhuMGZ1VkZl?=
 =?utf-8?B?YWdhZFRVSm5wc0lHYUVFTDhnVWV5QnQvNHFJMFc4UW9BRnI0NEhFRVBzVUw4?=
 =?utf-8?B?ZGFOMjV5TnhaOUJTNUNLZEJndFNsSUVYZGdHZTh0TkdVMkdZT3ZaWjRpSlcz?=
 =?utf-8?B?Z3NKZ3VJNC9Gbk1IamkyazlhZlJGTWJ3VlBsWFhoMzhlZjFkUkhvVDdGOVZi?=
 =?utf-8?B?cUIyV0trWVM2L2QvMWpBQVRJTnhabTFhMnB4enVCTUErUGVDYjEzNkNHQnJh?=
 =?utf-8?B?V0FHVDRsSGE2b0Rza1lkckl2aFlMelo0R2RDQllYNysxRm1MVU9QOEVWZzhK?=
 =?utf-8?B?Q2x5VHRQWHFxY1IvNGdwOUVLdFg1YnFGcVY0OHd5U2E3SzB6OU1QdXFiblJu?=
 =?utf-8?B?NnB4QWVlcmZRdFhOMUNSUC9QdjRNZjBvQ2pMWEFqcVJHZUdDM3ErelJVaXk1?=
 =?utf-8?B?RXZyZmNEUEdLc0hMSVNOVnZ6UGtmMFg2bFM4NWlwMzNGSjJBK3pQcmZpTDhJ?=
 =?utf-8?B?VlNkU1c4clIwd2dNejRqTDFWUW1kd0o3S2taS2haZCtXZjNRRjhMSnBjMkJE?=
 =?utf-8?B?SWtWQlZENmI2NVAwQlF1RHdUOFk0UzFFdDJlSFhaZWRHNVNIUmdpaktzakx5?=
 =?utf-8?B?NG1JZ0g5b2F6QnVMQTViWmp4K2NlQ0dBM0dHQkdrYXlHTFJ5dWhFemgwWFJE?=
 =?utf-8?B?dHFjQjk4eXg2RzNMVEF5YkVneFlUYkF4V2N3c2lPTzFqYy8xczNsVncxc3pV?=
 =?utf-8?B?M1RUdk03RDZzMlp0aFExL0plaWoweTlDSEgvWm5pMWxuSG1kVURiMUZiT1Z5?=
 =?utf-8?B?L2FaOVZsdHR4OG15RTREU1hKdU1SQ0wxL2dhd09xVzhWNnhXQjN0cnVaMTlI?=
 =?utf-8?B?cmhHamtnd3l1YmdjYTZtYmRhdGdnbXl0bjZEYys5cG9RRS9KQTU3cnQybDhM?=
 =?utf-8?B?bHhWbWM3emY1ZEt0ZEVJVjFidFZFQkRKcWhMZzcwT2tFbjRBa2kyWEpjdFRj?=
 =?utf-8?B?MUtlcFVtR0hTdm51R2F1YXVCK1N4cHZGRE9PRkdwSVE4SFVkdThSWFZyU0dO?=
 =?utf-8?B?VnY5RWJyRG4rUGtLdE1rMHhGOFN4NFdvUmJMY0lLRU04Tmk3bCtHRDFUMGxC?=
 =?utf-8?B?bEZ0ZlY2eFY1NjFIOUhwcmxuRWo4L1owZG9SbjYweEtJZU9QdGU3RFphb0Zu?=
 =?utf-8?B?YlVOR3UzamVpRXJ5ZDcwZWRRZnpCOHZFaFU4a1ZYb1IxUlJ6eGV5Uys4bm5H?=
 =?utf-8?B?aG5QWU9oV2hWQTBHeWFOVkNiUjJodjBKVDlscjBNZFVPY0l6clhaWFRDVWpn?=
 =?utf-8?B?M0VVZ0RyTzI4eWM1dmdwc2dha0ZEamx0SXc5OW9oZ0NtTEdFZ0VpdzBuZnlL?=
 =?utf-8?B?aEhPSUtFSUo4RGVHNTcwcHRzWFdPWUNSSCtpZ2RmY2V3OEJldGlhZkhaOUht?=
 =?utf-8?B?c25pa1V3OXN0eTNHeU5BOXphV1lYMTVkaTE4L1p2ajE3WVp2SFV4K0NoczBQ?=
 =?utf-8?B?dndQS0xIRk9xUy93cnZsUFpEQXVya2x1RFRybTMxdDFhbjA3MEdaVmN5YUcy?=
 =?utf-8?B?dmo1a0lmQnBMaXBsMjFaTHJkU01JZlB3Y0dzOVJuRDVvK2dYbE5WWmRDYms4?=
 =?utf-8?B?MzJuWG1WTDZReGhicnJhTjlXNlVJa0ZKMDB0UGJPRVdwTm9mamxGM2p4cVhs?=
 =?utf-8?Q?2t/mMSe3q6IU1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0af3481-9120-4069-51bc-08de5e34ac54
X-MS-Exchange-CrossTenant-AuthSource: SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 06:15:45.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0038
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10914-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuxuan.zuo@outlook.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15F609D61A
X-Rspamd-Action: no action

Thank you for your reply, sir.

My apologies for the double mail; I realized I missed the CC list.

On 1/28/26 4:59 AM, Nathan Chancellor wrote:
> Would it be better to do what the previous submission did and just
> remove the execute bit via 'chmod -x'? That seems to be slightly more
> common in the kernel (even though there are very few uses of 'chmod'
> throughout Makefile instances) and seems to get at the issue a little
> bit more. Not sure if the creation of these files respects umask, in
> case someone had a more restrictive one, but that might be contrived.
That looks more reasonable. I'll send out the v2 patch shortly.

