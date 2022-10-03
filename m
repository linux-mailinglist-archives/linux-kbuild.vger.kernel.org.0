Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B6D5F3815
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Oct 2022 23:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbiJCVtB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Oct 2022 17:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiJCVs0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Oct 2022 17:48:26 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2068.outbound.protection.outlook.com [40.107.105.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68DB528E23
        for <linux-kbuild@vger.kernel.org>; Mon,  3 Oct 2022 14:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAkKvQIujW6pl24PN2zkkWRsW4w3ZWFuDdBRi8u2Aoi2wEDAhGucXzt8miPalgo7FIdOaiQR8qa+x9YcEr/QDwm8R6fsGHVHQBFO+cC44d7Gr5rZyH2kGtoMHHlxcL9el0pt58tr5UJp0jaYgpvfn7qz20krnI0Id0O1Cs0POBD4rdSWy5uGKdPE2IWUA64FdT3HnaDlAcg1xu1M9N0dH+wMuA3g3nZcQZJscw4SeJe7EQiACVOm4aNnXWUCYpZBpB9UicpsZ/YYaz7NJX0FIacJ1zzF94rqZ2CH4JkUAefR5Sq31QYhvYrvkCVbBMJXCsjcUcBcSSYwCsSU0iUsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFzPhHg6JjkPqokw1243IuIXVXmSIVJI56FQQ6VARZk=;
 b=c1b+0pirKp4e2tQ+pzOlVLLmC2+B4fmGf+cVJHw7kvi8YZTmHW0LTFYu/awwBdlBzzEEhdG11tHLqPTf91mNCo2j6nSslyrjAFZX5R2vErGA6wCDEPqk3f0ZTWZzCPcxjhSgSttitgZkqYKoegOIjpYUA3CiD2K5mzx/in/0tpQ2xCEXdlC612fOYkzeDl1mLtpntZQyNAbJ1Xw4heFtwHHRbvrkS9icI1X6UP2fjNSlAT9eVAX1wQs/4UGhcSCIyEWUJf2L6jbDX3UehHt9OUqXRZe9d/4PNRqJAMB6NBDVC8gyFHTYWoxpjqQLjzMDVeIh5jv4+3klPWxBolxZow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unex.es; dmarc=pass action=none header.from=unex.es; dkim=pass
 header.d=unex.es; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unexes.onmicrosoft.com; s=selector2-unexes-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFzPhHg6JjkPqokw1243IuIXVXmSIVJI56FQQ6VARZk=;
 b=Ftp8fq5cjRC6BAWrVr64N56VZ2o52VVN7eRAUQ0s7qjliL+DEgqjqPrWFgtSHEfZ0q2ZWeQp1jpJYDGgXaQ/ByGK4hEXQhEUoLu5DTvrD6/5NbKoz+D7+ZF5W133njMcXDlc3giQSe3vYrJF2pDeflKuu7schd+qmE0aFscL/CU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=unex.es;
Received: from PA4PR05MB7886.eurprd05.prod.outlook.com (2603:10a6:102:fe::24)
 by PR3PR05MB7130.eurprd05.prod.outlook.com (2603:10a6:102:6e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.29; Mon, 3 Oct
 2022 21:47:04 +0000
Received: from PA4PR05MB7886.eurprd05.prod.outlook.com
 ([fe80::46d8:3410:3ab8:5157]) by PA4PR05MB7886.eurprd05.prod.outlook.com
 ([fe80::46d8:3410:3ab8:5157%3]) with mapi id 15.20.5676.031; Mon, 3 Oct 2022
 21:47:04 +0000
Message-ID: <c5bf25ac-ff9c-bd7c-e998-c2fe8af3770e@unex.es>
Date:   Mon, 3 Oct 2022 23:47:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Bug#1008735: base-files: /etc/os-release should contain VERSION
 variables for testing and unstable
To:     sedat.dilek@gmail.com, 1008735@bugs.debian.org,
        Gioele Barabucci <gioele@svario.it>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
References: <164872694772.208797.12124885046362540124.reportbug@drop.zugschlus.de>
 <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
Content-Language: en-US
From:   Santiago Vila <sanvila@unex.es>
In-Reply-To: <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::30) To PA4PR05MB7886.eurprd05.prod.outlook.com
 (2603:10a6:102:fe::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR05MB7886:EE_|PR3PR05MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: bf50a3e8-2926-465d-faef-08daa588cf83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7UbHjfGjUVgfUSlCa4lUGQMgB21GdR5BpXkuAHvPiCZyoHAwmZogXe/ccFO5jaUmcvEU7jRTJC4KU0xJ6wD3reyR42OuuLUkBZP3xcKEUqspmv0HwAyXmGKD9qYxGQXafNepZQayBOOZkqKwk0v+Q7gw1Q6N8tN7WcfLbnvYCY211ZD7VMijvJAhw7darMRAUyoXTLJVElarQ9P3vVh04lOtxDlhTEYKyD48gGTIk/gF5PjdWr4BQ74Kvs7Vg1KydPyK43P1YrPI/bZlMM6PH4Yoj7YFJ/fjgXSjB3FCD3phebvEevRcCI+0ncYWKSylsgXRBe9fbWT22v6GujSjyE4HL3KnlayZb5kCRvRYsDoZW1G5w+/o39dCmS458kxHpRjqLQhq7KDfzB9bn4WkMBUxdYTAgAkZ+lyXFsX2uLpAq+HjGa4C3ve6vOSbkdjD6smDUKsUHWB4kPnUlPE/Az3Q4oYYDq86Qot/AE8S2qgKD7lZ+xV4XfQX7ASVFMsQ4uzSHNJyQYNdeUL9e2vKDR/MY+NhzQxwFKp45CFj3W+pcwpKB7GpxG9A7mcnEdNEaNJ5jPgPk3PWl8dnENqMySpXI5FGQjXWvt8A5yG0g1Jsln70gf/7vQQOdlp46tS1TQztMJiSn/fcA3APRnwdLZdl8+Wfmz2CUrNNFq4KiqhOfe9xnpZqTUDlumzS9ICwkQVC+sTXyqVC35RDCCxwsQcy0LbgYkUB1AG9R3apZnrST5mV/AGLYJ+cEmB3q2qHBjyp27aqKDdAalfqB8x5jpoXSvqAaYea2A/z+84GSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR05MB7886.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199015)(36756003)(316002)(54906003)(26005)(6916009)(6512007)(786003)(2616005)(41320700001)(4326008)(66946007)(66556008)(6506007)(66476007)(8676002)(186003)(2906002)(5660300002)(8936002)(4744005)(38100700002)(41300700001)(31696002)(86362001)(6486002)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmpuUStMbkFYRmU3QkRHOFMzdDlFaTBkSlBEMS9KTkg5UjI3WFBGRnRQY3V4?=
 =?utf-8?B?RCtLaVdNZm5Wdmx5MHdTN3RyTklUZWxDYmU1KzZQdU5rdW1GbE51TFlNeXpV?=
 =?utf-8?B?R0hsVzdsMmk4bnhSNW1xcTR5dHJLcy9nbDViYmlKTTJseTlDR0hBRVVHY0pF?=
 =?utf-8?B?c0t3Lzh3djQ0dU41V0hMeGJkTUFtOXJGc1F4SWxzYzhMbjRoR0dFcG9LN3dj?=
 =?utf-8?B?L3hrMkxXMWNoUGZPVE1tejJnN1lPMEpMT3BGaHFSY0EyRFMvbmZhcnRYT1ZZ?=
 =?utf-8?B?OHUwK0x0NmtnQkVaNjBVNjBzRndTbk5tcVBodW53N1VJeGt2aGFHYjFjZFM5?=
 =?utf-8?B?RG5GZEVlU0VKdjNEZXRsMDd0bEFIaXorM1ZHaVVUKzVWb3YxWmVRbWNjM1RD?=
 =?utf-8?B?VDY1NHRGR0ZZRFlzOTFzTm5valdkUzZsM2Q3akVsMEptc1lGUjVGR01xYll3?=
 =?utf-8?B?aE9lQXB0bVg0ZW9nRXJwMWd6a2MyT1ZvdGFsUWp2V0E5SEt5WUZscDZQWXNj?=
 =?utf-8?B?aW5WemRSdDBDQjJNUkh4VUYxMGY4VTBST2hCdUZjT1ZJenREUkJQWmxPcm11?=
 =?utf-8?B?WUpNZ1V4Q0NpZWl3MHNyei93SW5yNXM5Z0VmRGVwd3U5ckg3NFJ4T3lQTENK?=
 =?utf-8?B?TmptQW8xcFhFREpXaDdLdmg2WjREQmdBODQwRlVPNmoxMUJ0WjZvekVkdFE1?=
 =?utf-8?B?b1lyZVNaRm94aGFUOEZpZE9EYW80ZUtsU1F6ZVUwaHNmSVN6YUk4TkltbWlU?=
 =?utf-8?B?aHc5eDMySkdPNXFuTGlneXVzdS94Nlp5UUY0TTFPYVc1R1VMSlV6bUkzcDFB?=
 =?utf-8?B?WG5PcjFieExNcHlza01lQjI4SlNDZlNxWDJSZ3oyR1B6QzZJcDlOc2l6UTJi?=
 =?utf-8?B?SnR5YXpTWHZOV3pMNnVCWmlxbGh0YStCVjJmUXBSbGs2czlrWFFjWlordlN2?=
 =?utf-8?B?RCtPMWtsQnlTNERWVVlGYVFRSWZrSmUvbG55VjlHdzdtMm91RWlCV1Zma0E2?=
 =?utf-8?B?WDRBUFJOSk5JeFNSVnBWdWZXZUExaThmYUR4elpHVlAxbTNtL2ROMDJqdWhR?=
 =?utf-8?B?cHlLMnFNU1I0UUx1WUNkN0ppcWtOYkxEM1JoSlRtTWtqVXFEN1VGbXJ5OVov?=
 =?utf-8?B?d1kzUE1qdkVLNkJ4ajNDNlEvZEdrWU1wbUtweDNZNXI0UWp4Q1grTVJQcnRY?=
 =?utf-8?B?Yy9Uc0ZaekZUK0JhcmtneDBZNWh6dzluZ3M3RGJNZ01pMTdPSTVLQVdZZ3FF?=
 =?utf-8?B?UzNIc1J3YXRZcnkwWTBJRjBjYTZmS3pSZHAvajh5bStkVy9MQi80YjIyT3Rz?=
 =?utf-8?B?TnVvbDhRZUtvWjh4QjhJTlBRZlZ6QjNzMnFCcjduY3FqZmZwTXdIOTFNSEVE?=
 =?utf-8?B?MGpVM3AzaWFPQWJOb2YvMTJRKzY1YUNzKzlqT2x0eGp0RlJ6clBFYnRSUFk1?=
 =?utf-8?B?NXQzMndtc05weXZ3Y2d4bTJ3RTBYVjBNdDJoeWlNR2VjTmlZSzFVUjlsRDhT?=
 =?utf-8?B?T2pLZkpXNlpGYUU3SmY3LzRGdG5URTZnZm44RDdHeTFyQkZxNzZndE1vNzBu?=
 =?utf-8?B?T0JxNFFMMWpRdmRZUWZoWXBVUTEzOEVTV3pZNEZFT1hEMVZ5aFU2ZE9mRzZs?=
 =?utf-8?B?WmdxOE1VUjJsWGVNZlVNeXR0QytXb09NVXFqREt3bjBkNE5EbGFDK0NZWEdR?=
 =?utf-8?B?NmhjVk1CYzN6RnJpak9IYlZqVEFsdWpWTFVrV2pCMVF6dTI1aTBFSEdzcktS?=
 =?utf-8?B?SFJQb0FVUFBmV25kSjhRUjdTenhBVnJMOWVWWGUrYlBJcmdPYnVyWDJvOFZH?=
 =?utf-8?B?M2Z2U1Nubi9OVExGY0ZOQ01tTnZEQVRBR2szQnBiNUFibnFhOW9INFE5cjZk?=
 =?utf-8?B?THVSK21hUzRzN3N0QkNNODg1cVIrS0ZLUXFkVmlSNE9VLzc0bTc4SXcxTFdo?=
 =?utf-8?B?Vm8wR2pYN1M2eTNQeElQeVo5UHNkb01xQWoxcFlVWG9lUHQ2YkcyYktWMzUz?=
 =?utf-8?B?S0x0ZUtHMUdEaXdGS3M3MWhTTUFEVk5HbC9OaDVNTG1VZW5VbWZYRTRYN3la?=
 =?utf-8?B?WFFkUWptWWFFQzhvbXFSZHErTFczM2xjb3I2RTN3Q3BnVTNHQVErekdOS25D?=
 =?utf-8?Q?fkSUWfxlWEvDnU7JmczWoYY67?=
X-OriginatorOrg: unex.es
X-MS-Exchange-CrossTenant-Network-Message-Id: bf50a3e8-2926-465d-faef-08daa588cf83
X-MS-Exchange-CrossTenant-AuthSource: PA4PR05MB7886.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 21:47:04.5764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0b39c48b-9232-48a8-abc4-d19872a9c77b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXhhbiwLtprbW+sHy725+/OAGADaze6NqvcDjME+INwI0uKxD8p5ovSrNBrNqg1X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR05MB7130
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

El 3/10/22 a las 11:55, Sedat Dilek escribió:
> VERSION_ID=sid
> VERSION_CODENAME=bookworm

This is "schizophrenic", so to speak, and I don't think it is a good idea.

I've simply added VERSION_CODENAME=bookworm.

The only caveat is that testing and unstable are sides of the same coin,
but this is already explained in /usr/share/doc/base-files/FAQ.

As a result, if you take the VERSION_CODENAME string and include it in a 
kernel version string somewhere, the meaning of such string is that the 
kernel image was created in either a bookworm or a sid distribution.

I think this is good enough for most purposes. If you need more 
fine-tuning, somebody should investigate what kind of magic lsb_release 
did in the past and reenable part of it.

Thanks.
