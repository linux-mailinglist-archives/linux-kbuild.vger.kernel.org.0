Return-Path: <linux-kbuild+bounces-1581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C418A5D41
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 23:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC54E1F22E98
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 21:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F284156F4B;
	Mon, 15 Apr 2024 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ci9KoO8g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839381EF1A
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Apr 2024 21:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713218006; cv=fail; b=LRAFiLIVIrXniLB87Pk2x1ARgnKEd/NCfn30+IQJHvsj/Xakf9bQ7VnemePMLMULJ00KtChLG0u1A5hz6+AM6Hr7WoGFgkrJT2GoJFapIvEGEE4AExm2o85lpM7k7WjR+kdmo9S6nsU1+/U1+9p72CaU3JlL4euK7diLWZ9u1YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713218006; c=relaxed/simple;
	bh=li5bS1rY4MpwgTGrA5widi2OdHEZlD4m2iEYzn0MJvo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lGxFBILGjAoVWIDMhSsBJgsiJmHJssMwSpDWtzEj+qS8MyGAu8Ev3cYGLMSc1+e/+1Il8fyrLFpSoYPtOqygSYpoza1soxpgP04SsQxL95UZUb2n2N/CD5A8gL2U64ePI001Tnau0z/ORflkSRS8zYW0IbDuAT2pOXoz5FX8pgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ci9KoO8g; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoXMW0+6opTeIXb67qAvUyBKwgi7iTsapNz71HHZDwuW26YtBtuilGdMSA90OIg+gSz2k7E0J+7Jlep8E5Ix2+RPRhJYUQBrwT0sS3Z3TUv1/ICt7UICvoGTWbgpvh2GNtnx+YPRjmjypIv1Eo4/tHSltnxhj7EiQePYM76eztLHw5wd8VlHSz4Ge1ACHnUbp+0MYnj4KILEcySla5Z4I1pqq+FkgOIJbqnJHhhRRy79rRNAAdqpKvg05p9vjK83irgzYlQW3+dxG/Uxaoi2hhT73nqCkhCoXJfI3iBvIBC+g/0ivsilnwGLMip81KklMyTTaXyUh6pcHylciPP2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpU8CPi7cTD7wuUzqIEP24BlurCvfXUaanFyHPQY4hE=;
 b=X4jXca7SQApZ+E8iY81Jbt2Hzl3DRrPmJ7goPyE27lYT4M73Q+486advZF9zaiIP5q4sPITPtjnKBEsp25hkDKsfrKTsHu43fShHf0b3ONH5S4vzYqRsrHpeSpYVkqhjWI3BRRv6fxECxqlkRrjTnN8Mk+rIwBcHt7R2P+rB7OHArCrcBjgaGc0gFl6IATjr1VRhBQ+sucGmZ1U7qeCDY9gy5ixSFgbHIoxQE4wd212MHclLB41baSuJ/0mn7Q7HLd5rRB9gdVqS0upnJZ2woSRcxsylZkJ3G0DLu229+udiTu9jrO5yQI1H5EqSuQxrsCMkW1/QhGaBFwW4hcUvYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpU8CPi7cTD7wuUzqIEP24BlurCvfXUaanFyHPQY4hE=;
 b=ci9KoO8g3NWT4YHtUCu5zkPFBHtoY8OGHFhlrzJ1wo2cgQNjNXDUYIzIAmX9KKllHOepJKda4m89GSQwQAc7sc5pJxZmdPpZgBz4o3J/qEr/3wP8gaOoJB+A2CmF/czXcHyL0qktNqxp+TVsHIiDvBLEmD2IjAmPGrOkLrNtQjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 by SJ2PR12MB8720.namprd12.prod.outlook.com (2603:10b6:a03:539::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 21:53:21 +0000
Received: from BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::bf0:d462:345b:dc52]) by BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::bf0:d462:345b:dc52%6]) with mapi id 15.20.7452.046; Mon, 15 Apr 2024
 21:53:21 +0000
Message-ID: <67862ae5-bdfa-2cb7-02f4-1df0ea29ae03@amd.com>
Date: Mon, 15 Apr 2024 16:53:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] virt: sev-guest: Mark driver struct with __refdata to
 prevent section mismatch
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Dan Williams <dan.j.williams@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: linux-kbuild@vger.kernel.org, kernel@pengutronix.de
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
 <4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:805:106::35) To BL1PR12MB5732.namprd12.prod.outlook.com
 (2603:10b6:208:387::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5732:EE_|SJ2PR12MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 71605c6e-e5bc-417a-e415-08dc5d967794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TSQJvKcAie9CAZms/6Vt/OiqLvjME+CS9kZ9eiLcC1qC47QgKO8lDeaWoGl8NOfgLN8Bq2w/Zace3EqIgLv9vKe7ciK2JZv1NhpUMjvpp7cTvxJdLa1gHw0BOA/wKxFKValyMaVmbHKD0uJclZ3Vb7zvEsqQPUCuEzvdjCZs0YFxGM8jS70s0L/T6V+ft70sMEl0UylocBjNo0X8Hy7Bae8gn7MC3jeryiAWHZzog3O83ZkCJ/doo2GXKjxiIwVo5ytDm2+O0qTrXd17ZTyPirbYlPYMCo2c8hIqoYjAPZcHa7BAktTzY1l+uUoZexODzUGS6ipz5/JFbrzNHLz+E2nWEyWWZy4DvDgqXuHcQsw/HSZ5O6zQ85ZZ0TgunPhHW9ljSvq8fK+Rxz0thtqCsyRvfU6RO7SuMwvit+TCcbChqqvfz3x66UgWPYBq11f1Su/N4OY6TkgxZX2RKDlseZXF1Z3yYyg4kBWH2Yfp7WtGDgx0Ey3Gf0KUFaNNpehveakHflRqeZTmiuu1eXNhQk7zMBulNRkgYxMXmkrkGvDECkpRBw5xVqyXQtO9s+Wu34WZBPxpcKiBk8pw5gIn3z08DCyd5bB3Dx/VQ30b860DjAdQ1T+Dil1/bK2Fzdprt6viI4iwOSbfLh/Uw6T5/kFzeqBJz5WzAt7XedDT0Dk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5732.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0xCa1RVUDhUekpaVENnL0NEY1JHNGFZa2tHSXVZMHBLN2lqRzFkK3NkSUxY?=
 =?utf-8?B?MzlIdTkwMmxrdUljc2d1ajZZeWR2VUF0Y2RBQkc0VDNZV0JGVWQ1Z29WNmRz?=
 =?utf-8?B?ZElpR2FPYVNJby9laVR1VU4xWVpDWGF5eDlKSzJtZHgwOG5SQ1Q2QUs3Y2hV?=
 =?utf-8?B?WndGNUFXOWw5WVlhYklESk5RYm12N3NNU2ZXWllWNk84YzliY1ovT0xDQmZL?=
 =?utf-8?B?VXFGL3BHOFVlVDE3V1RxRUFpWVVLRWVWZzFZdzNPU29xdFo0bTY5cG1OTlpk?=
 =?utf-8?B?eVdDM2hRc2RzdHRDbVdhZXVYRUJVZmlEdDEvbCszaTdLcVV0WEwyUVRidENL?=
 =?utf-8?B?czZLRThzclB6QlRwUFpKYWJZMUY0aEF1U1pGS0JnMW4zc2hldkJ0ZStQaTVG?=
 =?utf-8?B?aWtyOFNQRnJxYTRUa2hBNGNVR0I1TEJHcnU2UTZyWStaS0tsOHdmN2QrVVly?=
 =?utf-8?B?Z2dQc2lscitPNmllS1pXdC90czlpRVZxMDJ3dWlZZjJXSW8xNHI3VlprN3Vq?=
 =?utf-8?B?M3Bydlc2Q2tjM0tHV2lIS2E2ZWk1TXZSUlV0emRjeFZMbDNVK0NvTTJhTFlV?=
 =?utf-8?B?TFJZNlg1STZCUGZQVTg2Y0pXa0F1ZzcwWDFJNWxzTTMyVzB3YTd1M1lxR1Mr?=
 =?utf-8?B?cVUxSnlRYlF0aHczaE8za2lJaERkUmVNUFlsUGN5TG02Q29CdTQvYVVyckxy?=
 =?utf-8?B?cHhoUnp4QktxKy96L05hZ0J4ZGloLzNOeGFkaThrZWljSFFXQlRJcURJUi84?=
 =?utf-8?B?ZG50WGJFRWxFNWo2V213NTVDTS9nRExCbXpCck0rcm9uUEw2MW1ZL2hNcXpS?=
 =?utf-8?B?ZUNyNCtNUUQvUkpLR3FuR3Y4b3ZMYjErSzQ2WC9SUG9VQ2x2WGIxZnpIeEpy?=
 =?utf-8?B?ajJ5VnI0Z2g0TEU4L3FWNEFnRmdQYXBrbGlQem5EVUNLcmdUeDQwblJNVTFk?=
 =?utf-8?B?amNyQWRIMkdDMEdRUHRDWkdiUXoxK0tIWEhTOFF5N0hlc2hKRUVvcjhLTS9Z?=
 =?utf-8?B?cGNPQlV5OG5udjlEUitTaEVrMkZ4SWh0OGFnS3NvM2hxOVE2ZnAyRi9NSUxI?=
 =?utf-8?B?d3BUdXFqVzI0bGlDcWtwQWZ6djZlTmxpVGNMeFpudHNVbDBrWitaTHB0amtB?=
 =?utf-8?B?QktnbUNsVzQrRVRqNnNTQUsycGtDbFFqSE5uMVBML1JMZXhDN0NVSjFzLzBs?=
 =?utf-8?B?UnEwUk9PdWlLdTBHSWFTRHBmdzRGUHhDQVl4SXJWOUpCOTR6Qkk1SlplS3pQ?=
 =?utf-8?B?Y2ZldjliMHhTMGw4UEIwSEFabU45RFY0Z0w2QXc2Y2N5NmZhQTduTkZ0S3h4?=
 =?utf-8?B?K0hlODN5WlhyYllpQzNkYXRjc2FkYjZLRkM0YVBkRlpLYjhPWTFXOU5KR2RD?=
 =?utf-8?B?TXdaTUUrMUVRRnU3c1NWc0dkSGcvTDI3aHVIdTc0ejBRbzZQM0tlNzk0M3dv?=
 =?utf-8?B?NkxMeGRZeE8rWlBtYTZLS3V3RWlXS1ovRzVISVRnWVFuK280b2pqd1JaN2Fr?=
 =?utf-8?B?bWQ3UHF1ODJRMGdSeW1nNXYrZlJ6bXc2UlZQd1ZNTGM5Tm5WQ1d5Nisrckht?=
 =?utf-8?B?NmFJdmZ3U1JvOTJQbThzSUtCQXBjU0tTVzY5WWI1QkNVL1lTVlQwZWF5L2or?=
 =?utf-8?B?bEFOVXVGWmxCWkVpNExwT0MrRER2aDdtNXJSZTRjUTV1bVlDLzliU0ZLWVVW?=
 =?utf-8?B?N0FWZmtwZXkzcFFkTEpyYzI0cFRKc0xSbjQrYUdoVWtJTG5yTFZnQ0dTcnJL?=
 =?utf-8?B?RkdwUXphWXZBZEdEd0lPdk16Z1BYNUh6RFhBeTZQQVNWNUsycWhPVE80THVH?=
 =?utf-8?B?MTlIWnlOU1VFSDBYRFlmMmx5V0R2eTljc0hzdEZPVXViTFJOQjBGbyt2Nm81?=
 =?utf-8?B?MThscDh2V0xobzRCRlNkajVPSmp3TFJCSWJZT2sxNzg4Zi9KWlJRbVAzbDJx?=
 =?utf-8?B?NmJzbUwzdU1sNzdQZUQvRERSMUVtdzRFb2NVNXU0cjJGT1cwMHdGRjVXNTdX?=
 =?utf-8?B?bkJvbXlQZStMSTN2NGJFMFJQTzV2T0JvNWN2OXdtcEhNcVp0V0c5c0RUb2lG?=
 =?utf-8?B?M1VOYlpDLzd3T09oMnVOYU5pUndtUGFNOUxkQjhUMzBET2VBUWFUczRXY2h4?=
 =?utf-8?Q?cPtKtGMnJDl/O8BlV8w5SiNBh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71605c6e-e5bc-417a-e415-08dc5d967794
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 21:53:21.3904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tn8w5m1NTwzr9++nMXhFrmA23/pGDpQJSTvTIgOWyiiAS13iSDUIxBzP7SMtR9P5BXG7MmjzBc7x4y/QtAiomQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8720

On 3/29/24 16:54, Uwe Kleine-König wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via module_platform_driver_probe(). Make this
> explicit to prevent the following section mismatch warning
> 
> 	WARNING: modpost: drivers/virt/coco/sev-guest/sev-guest: section mismatch in reference: sev_guest_driver+0x10 (section: .data) -> sev_guest_remove (section: .exit.text)
> 
> that triggers on an allmodconfig W=1 build.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
>   drivers/virt/coco/sev-guest/sev-guest.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> index 87f241825bc3..1af68065b3d9 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -1009,8 +1009,13 @@ static void __exit sev_guest_remove(struct platform_device *pdev)
>    * This driver is meant to be a common SEV guest interface driver and to
>    * support any SEV guest API. As such, even though it has been introduced
>    * with the SEV-SNP support, it is named "sev-guest".
> + *
> + * sev_guest_remove() lives in .exit.text. For drivers registered via
> + * module_platform_driver_probe() this is ok because they cannot get unbound at
> + * runtime. So mark the driver struct with __refdata to prevent modpost
> + * triggering a section mismatch warning.
>    */
> -static struct platform_driver sev_guest_driver = {
> +static struct platform_driver sev_guest_driver __refdata = {
>   	.remove_new	= __exit_p(sev_guest_remove),
>   	.driver		= {
>   		.name = "sev-guest",
> base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2

