Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3963112A4
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 21:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233036AbhBES4q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 13:56:46 -0500
Received: from mail-eopbgr150057.outbound.protection.outlook.com ([40.107.15.57]:52390
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232981AbhBEPDl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 10:03:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THEfZofNCjNG/GnOAk+wOa5xq8pSB7bNZnMqqPFXSHcmVOZRFhRu1wN6POfXxDfW4Wr4d/Vmev06oNGDh5dJm2du6E+v2ellEa2IgL1Aj/xmATDTqQO+NjzeU5zGTPZ8S25gMWBiTaMQdrJgHwzdOelObEeTbUmm1G3qeF4W+fAKxTnLs3yHZEvYMmQOdIbmlCYR2z/X5zQujCDf/Irid/kg6dqI9DrLxHbrllSKhSPkDY9muJL1vV3BidUsR7cIoqq41dwarWjwOF5VDzjnyZuaQl2EI6XLbCw2XWLcd3zC+fWZqyox2ZY2Tv/B9l533QEqb4L7xJb8X8ytzVFh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlvzeLhWH+c9HSHl9W/cKAc8U4Qvy3V9zLGyiOAqAxQ=;
 b=dWZNbZDbzs2NgQIu7J0uaWi2DknGwBh/psgHwX8dRj9PJeMaqd6fss5fy/RNG/qXmcweC75Lm4zRHRkHCyWERhFHA/j1sFcWdoevI3zSiUlmI3IMdEeO5d6lR7BPhzfU4jD1vsHEqiw87bHKCTtbhxymd19aWsUE8fc5JdLatuHGj9vcWiITJE6s3t7UJkRjECI9n0WMe18LFEvLEeyoOtd8aNWcGEDB7ZEExTyjJbe+m2cjOsZH2RyYF+D6Sk4+Zp8mEj8WGL/9Bm6C0ZYT8QdzJefX2I264dzl1buAfviwMI9wb9rWxFB/QPMtSPUlsrPuLCWbXNvFo/4WhcJzeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlvzeLhWH+c9HSHl9W/cKAc8U4Qvy3V9zLGyiOAqAxQ=;
 b=vlonDCcBjD7zFxurGcRQBas6CVGi6XqxKPCz8mvywz7rLnCS3/+jP5TGxtJZmY2CZCunt2c1tdYC08ZNRDPwxbmgErEOwHh1Td5t6U3MnzaUePB0qicR1nKDBYniYJjy7NCXecYE5esKiUrR+ddHA2Ffjn5BureQ5GSerHhOw6k=
Authentication-Results: markovi.net; dkim=none (message not signed)
 header.d=none;markovi.net; dmarc=none action=none header.from=seco.com;
Received: from AM9PR03MB7251.eurprd03.prod.outlook.com (2603:10a6:20b:26e::16)
 by AM4PR0302MB2644.eurprd03.prod.outlook.com (2603:10a6:200:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 5 Feb
 2021 15:07:39 +0000
Received: from AM9PR03MB7251.eurprd03.prod.outlook.com
 ([fe80::a8f2:7dd:46e5:8526]) by AM9PR03MB7251.eurprd03.prod.outlook.com
 ([fe80::a8f2:7dd:46e5:8526%6]) with mapi id 15.20.3825.019; Fri, 5 Feb 2021
 15:07:39 +0000
Subject: Re: [PATCH] builddeb: Don't look for a missing Module.symvers
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
References: <20210204202054.1608664-1-sean.anderson@seco.com>
 <CAK7LNATi=4_ieMdi9OKXSF1yBiBDmtddG7ioYhre=hq988UePw@mail.gmail.com>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <770adfbd-1eaf-3a65-981a-de8e6556e444@seco.com>
Date:   Fri, 5 Feb 2021 10:07:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAK7LNATi=4_ieMdi9OKXSF1yBiBDmtddG7ioYhre=hq988UePw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:208:23d::11) To AM9PR03MB7251.eurprd03.prod.outlook.com
 (2603:10a6:20b:26e::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by MN2PR06CA0006.namprd06.prod.outlook.com (2603:10b6:208:23d::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 15:07:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dbcb2d5-600b-4ee8-9cad-08d8c9e7c757
X-MS-TrafficTypeDiagnostic: AM4PR0302MB2644:
X-Microsoft-Antispam-PRVS: <AM4PR0302MB2644ABE59665F63090BE919E96B29@AM4PR0302MB2644.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RkO0Cq+rk6zspHUPoZ1t3SGHEMbQujziWoXh0NLS+3ttrWuE081TiV3S4+OlSj5GNNnQay7weeqKy/5TAkKNnEWxJtZ87UWO5ln6g9ATHnxejfySqCqLNa4U+spys4FrgwEq0udXzNqAq6Glo5xH2Uei+1H5rBaOrh3InJT/xmn1z2U7zgdDudf6Ll+pTyH5c/IeyTI/4nCFXGR2nwAaSVQiNjywJ8aTeCdiU3S2ZrRyK4XgGuT/tmz65SgXE8TrRs2vUXV8pTlRqwCwA4QdCihpc/Zh/Mldws2sicTZeTx/P0ZShtUbU7hTcvIphlzrlAhuuDh0WjTarHeGsEgzbv1T2YqqxhmhEVRydOBQNMh4Li7YWxQq24S4LlWzDLrpeei8alMHaQXd6b2BfuTuI7csxFX+7yblTULud0qkVS5My0qrkGrhr2vY4Aae2HS1y+k97UmFN11IndBPZIZYO3e3STCL174xbjhRhga8LOEZ9efHsKAvkdxoYxIyoh57trpDyxachk1n48sa4ipbcKAmBMKQDs4Ic8gPuJXTxpTCTwk2LoWBhNmVwpv160XClN72/u156dzG7MERd+nayY27IIkkRV+CyPTvlbgUPHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7251.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39840400004)(396003)(376002)(136003)(6486002)(956004)(2906002)(186003)(8676002)(6666004)(316002)(66476007)(4326008)(478600001)(36756003)(86362001)(16576012)(66556008)(31686004)(8936002)(83380400001)(6916009)(52116002)(2616005)(16526019)(31696002)(53546011)(54906003)(26005)(66946007)(5660300002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SjJucXZrQ2QxMEs5T2d2M3BlV1JwNExOSlppVGdONVc3S2tvRXIxTk9iRERQ?=
 =?utf-8?B?Tzl5V0R4bnZMTzNLeGtaKzFibGlrZmpwbjF0cWY4N0k3L0phWU5sSThacVRP?=
 =?utf-8?B?SWhXWWFKak1SSitvT3JHcFI2cVRrTEJGc0hlRlZ5TStOZWdSSGtkYk9kYUFt?=
 =?utf-8?B?QWFBdWRQUURhTjBmWDlkc25OVnpPVi9KTjEwbGMvc3hieVdUZEtmWkxjTFY1?=
 =?utf-8?B?VmtkelR5TmtvaEF3a01JTVVsdGF5bWRIakNaNWZXRjUvUWNYa1p3aXByTHdq?=
 =?utf-8?B?T0V3aHdCUENMUC9QYmxXSUVxNlZTQ0hrRDN0bHVBbUp0VWdIN2lvT013RWR2?=
 =?utf-8?B?VEo0Tnh4OGROQVpMTDRVcTZhak9IZmNIM3BjNm9SbmlmTFR4VUgwbEI5MTBR?=
 =?utf-8?B?MVZncjZQSDNLZlVrWUZaSzVidmhITUtENVpjM1BUK1hDa2RPVDBBYUxDOWkv?=
 =?utf-8?B?TXhaeHJXcnpydjZpTDVnc2Y5VnhaemNGcDBoRDFTUVdFYWRHYlZlS05INEtm?=
 =?utf-8?B?OGs5cjR5M2dpak8rdlZ4YjB2bVZnaTVOSUhIalJxNGVMb054aEZ4aUM4WDZS?=
 =?utf-8?B?K0tLYVFOL3FMVm1sMUMvM1h0QUVFWi83aUZTOUZOOXZjVFM0TG5VNHdzcnRH?=
 =?utf-8?B?NERTVmUyWXhWOUxpOTZLOGpUVkEwVXN3YzdmODFET0NNbVY3UWFuNzl6V3lF?=
 =?utf-8?B?UmxMSHpXMmtuWXVjSVNnVFBBRVBwZEhaTHlrQmpWcytFSGh1a2NDcllyWGwy?=
 =?utf-8?B?WjBkczUvaFB0ZFY2RGNjNVFORDFOekFsMCt3MTFONWVUMkNwelVzVld1R0hj?=
 =?utf-8?B?QzhuRldZZFRTNEUrS055amNnNU9nQ2tCTXlUY1U3V0gzRk0zZ0VVcW1ZV1Fi?=
 =?utf-8?B?Y2lVVmNFNWF0aERGeVpXWG9odGlFWktvQlhJaDNXMVBOY09ZNTZ6RGk0Mmhs?=
 =?utf-8?B?V3ByMm52RExTZm05WmQ2Zjg2V2ZXMzV4VDZ2UkgvU3RBeUhyNlhSRVhHYWlh?=
 =?utf-8?B?T2llREZQU0dMSlV0UlBWdnJDZjRGZkdDNFJJZFptZ2ViSWc5YjRnRFRTaXhh?=
 =?utf-8?B?UTAzMjVLeUs3SWk2a0xKZFA1cDR3d3Rna3hMMVA5RlJhZnFiR2dJZUdsSEVE?=
 =?utf-8?B?SHhEdWtIcmljUFIxb29zZ1dZTUZEOGRDYk5zUjVDMnFaN2JTREY5UHIvZ1dB?=
 =?utf-8?B?dUoxbGtkd1hjVmJxMHk3c2lsb0pvcFlMUTNxbHVVbFU2RmNCR0UxNnA5QUZv?=
 =?utf-8?B?MFR1bEZxYVlWVEJEZ0RQOTMvMjNMK3dDZkpEQi9FZnRmOFIzaFdHR3VScVNj?=
 =?utf-8?B?ejRueGRhbUw1dWFGS294NW5aRlRkdXNheXNWSUJnMGxyZ1V6eDZoa2hQamRR?=
 =?utf-8?B?SHc1YnRWOThkN1MvRC9pa1EyL3hSaERSSXZUMmpPQjVsaWpTSkZBMEVVbGVB?=
 =?utf-8?B?WVBBbUZ3UTAzQjEvTjNoQkNBYW5QaHJpNGE1a2x4OVdsM2sxL2M0eC9hME8w?=
 =?utf-8?B?NTJNNThxR2JmOUxrK01GMGlwWUxsazZiQ1lMZlh6VlFBVnNwdFRHdGUzUzl4?=
 =?utf-8?B?RW9LNDBiTjJJUjBxZlRaWE1UUWwrMEcxU0tnMm9YODhwYXZXZUJCUE5McFd0?=
 =?utf-8?B?RUl0VFlrU1d3RmRLbC9RQ3JHZ2xoK0tsdEVsdFplTDlZTVJoOWpmY0FhaFFk?=
 =?utf-8?B?NGxzVGRFN2FVRWNDY2JWMEUzOEpCTnZaS2p2SDU1bW9rN1lVVFZNSEtWUzdM?=
 =?utf-8?Q?k/CZEtfXZoMFpsQAuUzinpUcj1sMKH9/bD8ZQid?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbcb2d5-600b-4ee8-9cad-08d8c9e7c757
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7251.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 15:07:39.2678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9ksp0vdtLLwM5rKB/Tuuglo2/l3AUOZXuUO+Ws5sUPmL5dmNSsF4N+GYg80ShNvgTbKwejgSQbkcmtOAZpzIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2644
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2/5/21 3:14 AM, Masahiro Yamada wrote:
> On Fri, Feb 5, 2021 at 5:21 AM Sean Anderson <sean.anderson@seco.com> wrote:
>>
>> If deb-pkg is run with CONFIG_MODULES disabled, then make fails with
>>
>> find: ‘Module.symvers’: No such file or directory
>> make[4]: *** [scripts/Makefile.package:87: intdeb-pkg] Error 1
>> make[3]: *** [Makefile:1523: intdeb-pkg] Error 2
>> make[2]: *** [debian/rules:9: binary-arch] Error 2
>>
>> Only add it to headerobjfiles if we actually have modules.
>>
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> ---
> 
> 
> I do not see this error any more after
> the following commit was merged.

That fixes it on my end as well.

--Sean

> 
> 
> commit bac977cbc0d6731fb8e67c2be0e4acbd959e10b3
> Author: Masahiro Yamada <masahiroy@kernel.org>
> Date:   Wed Oct 14 03:38:19 2020 +0900
> 
>      kbuild: deb-pkg: do not build linux-headers package if CONFIG_MODULES=n
> 
> 
> 
> 
> 
> 
> 
>>   scripts/package/builddeb | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> index 91a502bb97e8..19d44704832b 100755
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -71,7 +71,11 @@ deploy_kernel_headers () {
>>                          echo tools/objtool/objtool
>>                  fi
>>
>> -               find arch/$SRCARCH/include Module.symvers include scripts -type f
>> +               if is_enabled CONFIG_MODULES; then
>> +                       echo Module.symvers
>> +               fi
>> +
>> +               find arch/$SRCARCH/include include scripts -type f
>>
>>                  if is_enabled CONFIG_GCC_PLUGINS; then
>>                          find scripts/gcc-plugins -name \*.so
>> --
>> 2.25.1
>>
> 
> 
