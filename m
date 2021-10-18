Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3EA1431339
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Oct 2021 11:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhJRJYk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Oct 2021 05:24:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44024 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231404AbhJRJYi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Oct 2021 05:24:38 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I8TCAv019235;
        Mon, 18 Oct 2021 09:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : from :
 subject : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=0l5MAn7tfut2V5oV0cOnUxKU/4MvB5ZOrbtAYObI4eQ=;
 b=ocp/7xwm1CelsEqzQXBoNyOxSg2nnhEI8RoUMOAtijk+c00auigBXt7dldqkOx9zzuFt
 O/mTfS7VZmDOBvBqm7wl/9gfKVXVxchjNrBfWKe8Zmo0ilY+raZPKQywSCI7F4hama/F
 xUJdEv4NibaqN3+q4jGUSsgqlK7KRM3rpfQKX/4ajsrN+vnROjpfj822op44ytow410f
 hHD2BCoc7PqM7SEEmcUbDSvyQqZ/JdfK85plcglzF4I1Za8ZfYVYVwFvPAWcQNKh5aDa
 riC2Kdnw0/Aj2ZRbqs7GLmXbHb2IFgY0lxB6y24mm4x2RtD1aELdIw3An19GhH89dHHu TA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3brmrkah70-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Oct 2021 09:22:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19I9BRCq146231;
        Mon, 18 Oct 2021 09:21:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
        by userp3030.oracle.com with ESMTP id 3bqkuv44w9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Oct 2021 09:21:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhKDQS/mss6704czQKdi3EYn85zvEep67Kel0jXI3HLri+pkumDOxfj8xS3ul8HrgwhiKPUlu6JkWMZneetWO22uZMwu94wbhaCBPcF971FPXpyKCais0LAwlwb177JcvI6zgbCSoYmM0XmkByFqdTWI5zNjQv2rXhuaAgQvUcK6/nu146uVFN4P8Y1+nJBz0ze9+aES5WQjRIY3+SQBRslMqTcJEf4Cgnm23NKQtyReNlAiThX6VtppjcpwZV8xavvU+eBlSGlUap2KReUAwZtBMhdsYwaDB0NBJG4UdjlRhXt82CDHX1fQcffFEAnc5bVoQcLriF7bCB0jpvH9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0l5MAn7tfut2V5oV0cOnUxKU/4MvB5ZOrbtAYObI4eQ=;
 b=JRkAWVuXai5ul7jjObYzPDGCbmNDIC1kngFMDYypj332VIVddLdI6zlmHlOId9/1mNxM3B9nwP9GVvK+pyijgqvJObGY0MruBR91uvBwuvKEodUKqkqfPUkgYqSEvYJfJ32hBV+o1sLasCcYPvVqaiL5+UWepks6vB9J2uQ7vIQ2xAMJ3vOsYe7nvlx19xRD32qdxfGBcJMMJ7IEOo5zPthKPqAxzHeLYXHY61t8dH1A4G75CppXn2sLA//325+6tXZZgcqKZ+kv1lf6/N59vF6nORiB4y0PporjNGV9BNtEcLq5siESga1rJ4a07BHQTi1Ccw3wdsnoGREyEzm0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0l5MAn7tfut2V5oV0cOnUxKU/4MvB5ZOrbtAYObI4eQ=;
 b=cf7qvD3npVJP/UG4tsamtnRzxFW4jT5xpXg4IW87qmza5gZXllQ0i2T57jC83+IfGkZ316meXNp/TZfoVVTZLz0IRYTtxMVAM55pKKWM695Mhpv3ahwTFZlPhGQt1D0mfiiUnUlKrUq8zmz7xKVBo6exq3cLZJ07KsiuDazmqP0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by PH0PR10MB4646.namprd10.prod.outlook.com (2603:10b6:510:38::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 09:21:31 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::958c:1aaa:ad5:40c6]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::958c:1aaa:ad5:40c6%9]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 09:21:31 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Luis R . Rodriguez" <mcgrof@kernel.org>
From:   Vegard Nossum <vegard.nossum@oracle.com>
Subject: Kconfig issue with LOG_CPU_MAX_BUF_SHIFT + BASE_SMALL
Message-ID: <f6856be8-54b7-0fa0-1d17-39632bf29ada@oracle.com>
Date:   Mon, 18 Oct 2021 11:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::20) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
MIME-Version: 1.0
Received: from [192.168.1.13] (86.217.161.200) by PR2P264CA0032.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 09:21:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec314eb1-d32d-4ef6-08f2-08d99218abd5
X-MS-TrafficTypeDiagnostic: PH0PR10MB4646:
X-Microsoft-Antispam-PRVS: <PH0PR10MB464614125729862623AA99C497BC9@PH0PR10MB4646.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Am/FFFwKBL3MCnJbXhY2t0nVDPTEFqp3lhfXjPbgK53eJuBaOUZFOsl/ErSRTnXoh5lnnFRdyCRqbjs/80eQn5uRVRvLgsdph9nKAaHrnFb/GHNn2Q7iBgERawqJ0xPIgM8ZBpHn7y9pCz90EaSdQw2MlFv/11Hs3dJzunSz2RmqFjuENtkPmG7sHc8Ha/K+fzb9qMuk+CoGp10sFTP2kiAAHYjTnf1Bh8wIh3jFGNcUwrvZIXF5ViCykZmuicGBOJZ0fVddrULoJXZ/RacQrs3q8IgGfX6jDcbqyJHEo85eSEg1UHs4pNrvvp0TsJ1vpNqBiTTz4+SWyC5oM1kr3q3MJqmZecEDq4Bs1Ak5ggebUgeJ1E7iq7XqKQ3QbB2L2BSHiTAYKmJxglG4B+X0RE4jXc6+4crT0CSsK9tOLTpEgUQwDWPNXmAKrikiuWAgEIqGgVkxs8JRSpjoaxrAy2rftIHj5ca/PFBoeHUdcDtDJw/i87eMWvQLGlC+nefOlL3MK3e0yun3eDVgwYeagAlmwSQqyLNvf5VnV161DzvNZqB3GxsRSFYy2Pxd5CY9DNB0aQO1K6H+oa6Xt/Kn25JeYU6V6m+pmdyIvpmsXB+y7n09QPr33BK0P5y61ACi/5Ucwmt6xUN92HOpmpEpE4E/siv8F6wzvXCeRpEsxDh+X6jMBrxXIT59GxHVzFwtMvQ48ndMhnQYUM4PrGyGju6BLBnZM2n3I5CXXgMSpDhd9vSOqoujNxau4vIPRSG7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(16576012)(54906003)(4326008)(186003)(31686004)(110136005)(38350700002)(8676002)(44832011)(956004)(316002)(508600001)(2616005)(36756003)(26005)(38100700002)(83380400001)(5660300002)(52116002)(31696002)(6666004)(2906002)(66946007)(86362001)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTRlcUs1ZWNCNit0NnMzSlBtdnNJS1FYTlRqbngzUnRZVFJiMlFjM2xiazFx?=
 =?utf-8?B?TzBNMFdYTFBiUC9hOHo0V1N2aWpSRjcvZCtiaTBJS1laYmdWeXpnK0dpRlhr?=
 =?utf-8?B?a0JNY3lXc2FTWDR5ZUs5Mnl6RUk3VkJFMW5SZ05EMDBHdHZkbVVJOXRJc1Bz?=
 =?utf-8?B?dTduL3BUSGlHMnVkMmJaRkp1V21wZTFMU01VNGxVRkcrS3VFck9PbmtteDFl?=
 =?utf-8?B?MnpCN0NSTkhMbFB0WW5TT1NlSTF5RXRicENIcUV0V2RBQUs3emJUc1BkUmsz?=
 =?utf-8?B?b3BJd0tvNmlMaWdyWGFvQW5SZDFxNm14Y3V3czJCeXViaFE1Skptc1hwSjBU?=
 =?utf-8?B?cWRLcXVwbWloN3owYThwZmxQaWdIb0NJMGtuazJVSEhvU0lJT2xFVU1EMWl1?=
 =?utf-8?B?cUpnRWZPUUpNTmZyUmtiUEM4WXVDZVNtb2pGc2JFaDJTR1FtQnZscUFlNlRy?=
 =?utf-8?B?UjRZZEZvM25lejc1WnJmV3ZIVVBxdS9xVUJQeXZtcW8wUWNuK3luUVNUT0Yx?=
 =?utf-8?B?STV2RGdoNTFtc3ZHbmg0QzQyVVIvejVsVWVJcHZadDdKdjlwYSswRDlJbDFN?=
 =?utf-8?B?eURiZjluQlRxMEtLd2RCN3hzK3dOaTJTQjM3N1JXMEoxSTZIRVliWmxNcnpH?=
 =?utf-8?B?ZXVDeFptWHFGcWd6ZkNQU0Q4WDBLSnlSRk1LZjZEV3V2TFFkUEhUMEgwa21j?=
 =?utf-8?B?WXE5bWNrWnRja3MwcnlteldLWVFwUHFYMGg2L0VFM25xTE80cTA3QmdlWUZt?=
 =?utf-8?B?OVBVM1ptOU9mOVJyWitlZnNPVG1udis1WmlFZjUrWm8vQTNDL2d0a2xnc2xR?=
 =?utf-8?B?TlNjQjV0bWVNSUZvZStFVkQ1cnFHdWdraW9uU0JtdWhVcVpiNkl2YkxvQVR2?=
 =?utf-8?B?YVI1K2J3NTQrRVc2STFRTTQ0MHhIU3BkUDJJbjR3cGxaV1NsenJTK3hrL2sx?=
 =?utf-8?B?eFNSMUErc3JoVDJIbHBBNVpOMnJBZURsQURzU2VnOWprNXozVldKT1VhTVRG?=
 =?utf-8?B?OGRYVU9hcHFvU0d1MkY4Ym9MSmRlNm5wWjJobzJYblVwRmRyK1BzbDRkZVk3?=
 =?utf-8?B?cWZmNTJtNHlxTU9SRExJVjRUKzNhenhIMGlFazE1a3E4b1JsVS9OSTJCS3Vy?=
 =?utf-8?B?WlA3TDhuQlRzd1NDVGs5REZlMS8zMys1T1pjS1kwK05zcTErVGVMT3RYZDBy?=
 =?utf-8?B?QXdEN05nWk9tY1VxODF3Uks0VmRhZVJZT1pwY3MzeDFCUFdsUVRISWc2elBI?=
 =?utf-8?B?ZmpRYnRGQStHOUJpWDRRMTI0L0dlS1FBdy9QYlgxTndxWVB6Q0JCWElEUnBu?=
 =?utf-8?B?NTRmZnNEcVpkS21iM21xdEJCQWptM2lTSDJ5YnBzdlpFNENzZ1ZSNVhxWHlP?=
 =?utf-8?B?Q3Q3U1NIbnJYTEdLbjdVMXdsYytabFFOMTh4SUVFd3VpOVBaa1M0YXh6eUVU?=
 =?utf-8?B?RCszaFhnVHBZaWNCL3BlSTBLZWx6UUNxRW5SZlVRcEVsUjJhY2N1Y0NXMEZY?=
 =?utf-8?B?VFdNcnRvT2ticHJWc3hNOHBIQTdmVFN4bWJ2aEVGb3Rubk5iZkNRZG4zRno3?=
 =?utf-8?B?MHpmVVROZ3VuOWppOFFJdlVYUm5OWjBsVEFPcGRRakZqYlpuVG01T0RSWkp3?=
 =?utf-8?B?VU0rYXJ6YllMcTNkc0RBZ1dsdUpuS3Jwd0Ixb0dYMXg5K2U4b2JIM3kvbHJQ?=
 =?utf-8?B?aEdTNW5Dcy9nb2VnblVyblV0cmJJQ3E5NXVHamUxejMwTjFFYkJRNTZpYlNK?=
 =?utf-8?Q?wWTUysZbnaFpyBAZbDBfhwb21X0fK87d7zbI1E2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec314eb1-d32d-4ef6-08f2-08d99218abd5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 09:21:31.0894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOEyNhpRxxc8/HAb0tdS+6ufgHD0nrgecJ+LaowONQce/f7jNkaDvOAQhFuXHKobxbO4dkbPKB6/VEoDMZrIEtp6V1UqzrdZuJmCz8do4s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4646
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10140 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180057
X-Proofpoint-ORIG-GUID: TTYEreveG0RZIvJetc3Nk9msHiANaYkG
X-Proofpoint-GUID: TTYEreveG0RZIvJetc3Nk9msHiANaYkG
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

I came across a bit of an oddity in the Kconfig files, specifically the
option for LOG_CPU_MAX_BUF_SHIFT:

    config LOG_CPU_MAX_BUF_SHIFT
            int "CPU kernel log buffer size contribution (13 => 8 KB, 17
=> 128KB)"
            depends on SMP
            range 0 21
            default 12 if !BASE_SMALL
            default 0 if BASE_SMALL
            depends on PRINTK

If you look at BASE_SMALL, this is actually an int variable:

    config BASE_SMALL
            int
            default 0 if BASE_FULL
            default 1 if !BASE_FULL

Therefore, my theory is that the "default 12 if !BASE_SMALL" is _always_
used because ! does not really work for int options.

To test my theory, I created this near-minimal Kconfig example:

    $ cat Kconfig.BASE
    config BASE_FULL
            default y
            bool "Enable full-sized data structures for core"

    config BASE_SMALL
            int
            default 0 if BASE_FULL
            default 1 if !BASE_FULL

    config LOG_CPU_MAX_BUF_SHIFT
            int "CPU kernel log buffer size contribution (13 => 8 KB, 17
=> 128KB)"
            range 0 21
            default 12 if !BASE_SMALL
            default 0 if BASE_SMALL

You will notice that the default for LOG_CPU_MAX_BUF_SHIFT is 12
regardless of whether I choose 'y' or 'n' for BASE_FULL:

    $ rm -rf .config; scripts/kconfig/conf Kconfig.BASE
    *
    * Main menu
    *
    Enable full-sized data structures for core (BASE_FULL) [Y/n/?] (NEW) y
    CPU kernel log buffer size contribution (13 => 8 KB, 17 => 128KB)
(LOG_CPU_MAX_BUF_SHIFT) [12] (NEW)

and

    $ rm -rf .config; scripts/kconfig/conf Kconfig.BASE
    *
    * Main menu
    *
    Enable full-sized data structures for core (BASE_FULL) [Y/n/?] (NEW) n
    CPU kernel log buffer size contribution (13 => 8 KB, 17 => 128KB)
(LOG_CPU_MAX_BUF_SHIFT) [12] (NEW)

In the code, I think the problem would be that sym_calc_value() on an
S_INT symbol only sets sym->curr.val and not sym->curr.tri:

    expr_calc_value(!BASE_SMALL)
     - E_NOT:
        - expr_calc_value(BASE_SMALL)
           - E_SYMBOL:
              - sym_calc_value(BASE_SMALL)
              - return BASE_SMALL->curr.tri // this is 0/n regardless of
BASE_SMALL's string value!

I could be wrong here -- but that's how it looks to me.

The most straightforward fix seems to be change init/Kconfig and
LOG_CPU_MAX_BUF_SHIFT to say:

  default 12 if BASE_SMALL=0
  default 0 if BASE_SMALL!=0

I've tested this and it works -- 'conf' chooses the right default. Or we
could use BASE_FULL directly, i.e.:

  default 12 if BASE_FULL
  default 0 if !BASE_FULL

In fact, I'm not sure what the point of BASE_SMALL is in the first
place. Should we get rid of it altogether? (git blame says it's been
there since the initial commit.)

Another option would be to change how !SYM is evaluated if SYM is a
string/hex/int, which would maybe save us from other similar mistakes
(whether now or in the future).


Vegard
