Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A5042B5B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Oct 2021 07:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbhJMFli (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Oct 2021 01:41:38 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56382 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237705AbhJMFlf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Oct 2021 01:41:35 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D59vu1023311;
        Wed, 13 Oct 2021 05:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=IK9sBlANBEnCIg8539gbmzf+A4wpveieHgPl6Q0Ozxo=;
 b=B2Fy03IVDDPg+GUT+bA3p8Vyh8QKVBqqnzJzTBWs+rQd11yuhhEhKukbJmGoV6SMpwNe
 HOjQKuJRse1h93teBAsBPb9OK6fyvpl3FWZHzoUDogU17R6fnUXC0/Mv9h0ngjoAe8zj
 BJCv/vdlDXfHfIpf+6aT3dhWujT+aNFTWfSQffvoh/GCRp1H3x0B/TSx2RVNb5ZuLXOt
 M5sBAxEHNOyriz+XPm+FG3Mb8wBouSK0Pj9ZCO/tLwjrZSEsh3SO8iM5lkxr3YAFF1nO
 Gt+cOKcArXHdXGHrqTxyYb79MxzrfM8p0vqRwlkkCtQWIm4DTjWqulvhLwJaGx4goQnJ pQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bnkbj1fxj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Oct 2021 05:39:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19D5aR5N064270;
        Wed, 13 Oct 2021 05:39:25 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by aserp3030.oracle.com with ESMTP id 3bkyxsvx8a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Oct 2021 05:39:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME++GLuhv9HD42xcM0HP7WH02I5VsmAj0Z7IXPFkUm9ZhUuJjm21iGTUm/aJ5SX1eQ8Ox7fXNb6xE6UKlcpVuw5r3j3GUS0Lbc4xK4Q2Fs2IUKaxWok62/Y83hmlnbIYv5m5iy03Y0l6wK2VLfvCbR7QBgRyPWuDB6nJrKMsctuetairgmUcg/8v1TiW0JCXBUyBeceDy70Gp5Y5zss43RMeiToJNvhmpXxUgs79mgKb2aQi07ozyqw/LVmDwOtl7HFChYAuHyRhcFVv9xMcOwYcV9VK0V/MpQOKLjxV6a4roackoZv/Ir72gzcYn6tBSN9FmAHqXxYu8c8/WFdCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK9sBlANBEnCIg8539gbmzf+A4wpveieHgPl6Q0Ozxo=;
 b=frcqHsbpSfVRJADvuyhvUQ3wpKCOX4jH9ZqSLFyvKwT/15ZLujG9gknOOZAmtDC9zADCZMSGAb3J0NAHkjT5wta8Y3LrpTOKCiJ1fHF0eYO0sfZ18ZzRuacUjlrx/w9eRwkWTZyOn3kw25UoPDuoQV/Lwg5dTX5AcbsYgiJ0k6CpAajdlti/jL+YH28IVfX/u9bcXVX/CRKz3HkHyJiIATpiGArdS6f0JESxEp9X7j0TU5Isanw7C/yiJX1ylN46eRZJe8LR0sohmx6pu8HVSr2M3+SpXD34gsF3vVVEiVZkHmnE85hHabVHJa+ocFJIyB/zegwEO+bfZba9YEJ/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IK9sBlANBEnCIg8539gbmzf+A4wpveieHgPl6Q0Ozxo=;
 b=i7U9h2IGPz+QgLuQKUDViwG0Wd0kycx/h4DeDAuj34Ky6gKwJkfAOcn8WpnQ/163m9LeVuZshSMrq177vgor3SkYKj6w31V8E+AK03Hh/jFC4lLytnhex5cN2TPxktM0FxFT9ZAi+scSWghofy7cTdTffIPhl0o8y7aPiQ5ZD0U=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (13.101.54.137) by
 PH0PR10MB4422.namprd10.prod.outlook.com (20.182.126.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20; Wed, 13 Oct 2021 05:39:23 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::958c:1aaa:ad5:40c6]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::958c:1aaa:ad5:40c6%8]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 05:39:23 +0000
Subject: Re: [RFC PATCH] kbuild: only prompt for compressors that are actually
 usable
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
References: <20211012170121.31549-1-vegard.nossum@oracle.com>
 <CAK7LNAT_0PnW0opWQoCiF5mWH4YEKxXHbdiTrSGqGFRv5nhY=w@mail.gmail.com>
From:   Vegard Nossum <vegard.nossum@oracle.com>
Message-ID: <68df3063-1dda-4736-27b4-8716321620c7@oracle.com>
Date:   Wed, 13 Oct 2021 07:39:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAK7LNAT_0PnW0opWQoCiF5mWH4YEKxXHbdiTrSGqGFRv5nhY=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1PR01CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::45) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
MIME-Version: 1.0
Received: from [192.168.1.13] (86.217.161.200) by PR1PR01CA0032.eurprd01.prod.exchangelabs.com (2603:10a6:102::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend Transport; Wed, 13 Oct 2021 05:39:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9f9d46d-1b22-4c1c-8076-08d98e0bcfdc
X-MS-TrafficTypeDiagnostic: PH0PR10MB4422:
X-Microsoft-Antispam-PRVS: <PH0PR10MB442240B866B858478FB5DA0E97B79@PH0PR10MB4422.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5BBzKxsPqrWvLp4wxUGfNllL+FL3RK68zGuYMw9UkKHX0bxU4esmzoSXUZS4vZFSIBeiRriNwsvE7tlXs+kEdFV9mIjOdLe5coBi7XxPrq3avjAoB1WURk9tMkl5HYsbsyRb8Qmk7yC+NtzbEeE8nPQznj4hSxaXMxVdlg1k/LxlEe+TJa21FRqV2KX9dZMh2j64mKzKUesghqX65iEuKvoXpRIy/wkbXbphDCUveugcdZx04gd5MG12Iuw8nY6XnRV669ZELwphuMhfUx8K3NT6FvTgTrP3r4fvzyeHYS6E1mrfZMu1PoAk5V/LC7qktfaOxBwwW840BzGArfhC2WgfP0xGH28909nc18qZC9iJQgGjrSjDjP/8NsVIn2c8lraJ/J3xd099Z/HYo10ww8tiJzZuQU3kcpWZoTwk45b0VO8OCRDqcvfeFfPcYNY670sRJ0mVHNSLJxsviVcJuwxuYG50WOiHkM/FiogwSlH+y5Pq31RDkL6TxkIObP9Xs3axHvOoGgR+lyE9cs1S6Ij7EPMhnwgA0S4dE5vfG+u6uSwgYmGhmSUmWQKyMyJR4Z8YpV39HpJLEfBd2IskdxKHT3+YBCwIJ8FfuG/AcAbyp4+xnG0c4idXCYACOvxRYhDe+devJ01jM0aGTZ3Odh93i0nxzX/eV38W8a7o7epzFRtZ5zUu6nl54WHOKblbJ9/6GATUj/JEY4utefQF90i7s5Gge9UPCTgvJtnGHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(66476007)(66946007)(4326008)(186003)(66556008)(83380400001)(38350700002)(6916009)(44832011)(31696002)(2906002)(8676002)(52116002)(8936002)(6486002)(956004)(26005)(16576012)(5660300002)(6666004)(31686004)(54906003)(53546011)(316002)(38100700002)(36756003)(2616005)(508600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0hrU2pQWUdxT0RJZWJxSDBVUVhNK1JrM1lIWjlzdjZSQVB5d3BUUkZVUy9D?=
 =?utf-8?B?R3RpUEVxb0ZwbGlRbXpGcUwxMnUwSm9WaTNBbVNtZDRhOWU4a0gzcUw2Njl3?=
 =?utf-8?B?V3EyWmRVMWxncnZrT3lubHZMWUFxanhoMjdaMUN5N1lXcXN0bzdNN0RpNW9W?=
 =?utf-8?B?VFowNEdiMGhwbjJYNFBYMjlYamE0QmRrcWQyS3dwVkpRMEEyV1hNUEtGWVZt?=
 =?utf-8?B?NHlJdWhFSkdoQWpTMllSWFdlM3ZWRGxVN2lrNGJvTDkwMCtobFRYcTMyMlI2?=
 =?utf-8?B?YStscUdYRmRUNDQwclJ5SXJRZXFta1pUb1EyYTBzNVpLQXdPNzA1REQxZEZE?=
 =?utf-8?B?cjJWL0F4RlVwd3VnTG1XaytuRXNBeU82bUZCNWkrbExvN1JUcDJZYzlWNU95?=
 =?utf-8?B?SWdXS2VRMHZlWVBpclIvMXc3L3A4QjdDbmd4T0s2eGRtRzZRNUJWenhNaFl0?=
 =?utf-8?B?OTJ4VkJLT3hxSGZ0TFJjY2pLZ3QxN1lHaFd3MzJsc1pydWxqcGFUODVIUUdp?=
 =?utf-8?B?TkdsUzhWWHdCZldpdTJ3ZU95eWxpM2ZKd3NwRkxtckZpZWx3cG1IenUvamI0?=
 =?utf-8?B?WVVzTjdYUFQ5YlN0azVRTldQbDlxM0U2aldicmV1V3QxcGMyMy83NStwTGdt?=
 =?utf-8?B?WmpxbCtIK2E1OUlrZzZmTm4rZHViSUpJVFp3a0p1OVFWUGc3K0pzVUNPU0pH?=
 =?utf-8?B?Y1lNQVpxMGVNSTFadHdmM21MSHhmUjEwUzE2NjNBdDk0OTdySm1zb2xNaVJp?=
 =?utf-8?B?b3FnT1hoejZ6bDlMV2dZZ0M2OHAzSmd1eGF0UFJHaWh5M2hhdWRrZmR1MDc2?=
 =?utf-8?B?RTdXZzc2ZFlKQ0ZKb2lxOCswZ3BYQjBjR0UzZzBMdVRCUkZUL3VaWTVrcndm?=
 =?utf-8?B?dm04NnFNWTJNWm5WbUdHS2dYVi8ybEcwZU1rTU5ZaXpGajUrRTQ5dnZyTStN?=
 =?utf-8?B?M2dxNU5JVWUrdVEzczd0Uk0vTkpZZzN0SDdiVjdjYlVmbG5LZkJMQ3JrZkJz?=
 =?utf-8?B?U0dQRTh1WEliWHhsc0xIeUpHQlBSQ0ZuZzRwS2hWQ3c1RXpBemZUTWtkSUh4?=
 =?utf-8?B?L3NTc2J5d3ZnQzhWT0I3SU5UL0hnK3lPZUZTZi9ESXVMa0Z1M2FPVi9OWmNo?=
 =?utf-8?B?bTRhSHJvTFJTUVAzOUNoVm5BMmlMcVBUblV5dUlFREZVRm5tdDRXdW4rL1Bh?=
 =?utf-8?B?ZUd0ODVoYUUrZU9rNHI5WW0waVRGY3Q0NEtxZ2JUK1g0ajJKQklRYWIwTEtE?=
 =?utf-8?B?QnRhUXZCYUMvalNlaHJmKy9maHJSRHo4cU1oMUVRUWYvVlZzUG45WlU3aE9O?=
 =?utf-8?B?WDYzRzVkV01Dak9EelZkWXloYTNIekVqdm9iYXpLdVFHZkdWRzZUcThzTVAw?=
 =?utf-8?B?UXJoMm1nZk1YeUU4THJNL1RlRnNuRFFpR3p2S0NIS1lmSzRVTnBEUy9MSFR3?=
 =?utf-8?B?Q0JNd3dObWJRZTEvYlBVOWd1SGFsZ0NueDY3UGtvYTN2UGFxajVqT2xDT1ho?=
 =?utf-8?B?V1NudmdJU3BzQTVuYkZpc2s5dldlZ3dXSmJUOVk4dDRVOHlaRXJBa1ozekpu?=
 =?utf-8?B?WFhzQ2JNc1FobUtMYzY5a2xJZUdVTkRhVWRJYW5BMHY5dGxxWXRSVm43Njd2?=
 =?utf-8?B?dTVRZzFpWU9zTit4VTlMeGVmQnVHT3hZaXdJa1R3Y1lIKzEvbkVJeGtDeDJn?=
 =?utf-8?B?dVoyb1VEL0NQMGwzNy9Od1ErV25FN3ZuR3cwWFNZRlJJQVBWV2p1c0p6SnVM?=
 =?utf-8?Q?ATzmAYnZPZCp6aV2wRowIKFSBtAAUIvWsnCTDZY?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f9d46d-1b22-4c1c-8076-08d98e0bcfdc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 05:39:23.4765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AldmVimDhJstAWFTE7n3imqqwZPrKTD8V7gaS1qlk7p2gX8CtfhUEdc4QAD+8Rm8F9P4ViLHh9IU+6zIr72yZzIAi+rL7WnadZloXMQJZCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4422
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110130038
X-Proofpoint-ORIG-GUID: ypcmhK-rzmmgYwiSHQPRHVHb2PHsVLsc
X-Proofpoint-GUID: ypcmhK-rzmmgYwiSHQPRHVHb2PHsVLsc
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 10/13/21 3:34 AM, Masahiro Yamada wrote:
> On Wed, Oct 13, 2021 at 2:01 AM Vegard Nossum <vegard.nossum@oracle.com> wrote:
>>
>> If a given compression algorithm for the kernel image is not usable on
>> the host system, there is no point prompting for it.
>>
>> We can use the kconfig preprocessing feature to check if the command is
>> available or not. I've chosen to test this using "which", which exits
>> with success if the given command exists in PATH (or it is an absolute
>> path), which mimics exactly how it would be found in the kernel's
>> Makefiles.
>>
>> This uses the make variables that are set in Makefile and/or the
>> command line, so you can do e.g.
>>
>>   make KGZIP=pigz menuconfig
>>
>> and it will test for the correct program.
>>
>> I am intentionally adding these dependencies to e.g. KERNEL_LZ4, as
>> opposed to HAVE_KERNEL_LZ4, since the latter are "select"-ed
>> unconditionally by the architectures that use them, so they are not
>> suitable for depending on anything else.
>>
>> I've put RFC in the subject as maybe there are downsides to this that
>> I'm not aware of.
>>
>> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
>> ---
> 
> 
> I think we should keep the host-tools dependency open in general.
> You can easily install necessary packages.

So just to be clear, you object to the patch because it hides the
possibility of using a different compression algorithm from the user and
doesn't give them a chance to know that it exists when it's not already
installed?

I don't really think this is much different from any other choice block
in the config where the visibility of the choices have dependencies on
other config options.

In my case, the reason for doing this patch was that I was seeing build
failures during randomized testing (satrandconfig) due to missing
programs, and these build failures appear only at the end of potentially
very time-consuming builds.

Maybe we can introduce a new option similar to COMPILE_TEST (or
ADVANCED_OPTIONS) so that the options are showed by default, even when
the host program is not available?

+config UNAVAILABLE_COMPRESSORS
+       bool "Prompt for compressors that are not available"
+       help
+         Note: Enabling this option can lead to build failures if
+         the chosen compressor is not available on the host machine.

 config KERNEL_GZIP
        bool "Gzip"
        depends on HAVE_KERNEL_GZIP
+       depends on UNAVAILABLE_COMPRESSORS || $(success,which $(KGZIP))
        help
          The old and tried gzip compression. It provides a good balance
          between compression ratio and decompression speed.


Vegard
