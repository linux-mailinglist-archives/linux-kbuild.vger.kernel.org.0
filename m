Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A73F686B52
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Feb 2023 17:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjBAQOi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Feb 2023 11:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjBAQOe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Feb 2023 11:14:34 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2138.outbound.protection.outlook.com [40.107.21.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42971AB;
        Wed,  1 Feb 2023 08:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n51ErJ9aF2GrXJ0rItZEn6AwZji/8LvHZ4RDABPrsyUt37ViS9o2Rpwi1kcmWQEFyAyU1df3983+1AIHukwfz2EyXKg3vsXFOqsNeyozmkida6+L4lJnWzgfLfuZjaAuaQ0PIEv3zN7P6QvW5onFfdtHsIEWQq2ydzkcO3nG1dyIPuJQTrxBUD1iewhV/O8ILpPBEI93cGS+pkh/07oEon1OkG2tcUgPzQG2zFBZb7LazfVygGEA6mKyF3GKSA09LT0b6vdHXyWSkK/0jwex5FWFTpw6aTCZfDL6swgW4MYa2oTGQeEsKfFModRABKT0xga5gMFVx48HbJTUa0QCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UB14WOYMkR/0Bv1hEac0H/9oNPIVGrapd913zE6mkPI=;
 b=g/aTGMp6LY64TX5PDx0kgrOZLmUDJyAmf8bSzbJ/OhStHkJ5Fv4ZIafE+qMmdzM65TBeTnILUOQZjNdSC6N8LGlyPSr3TjTo2IlvEXjPXcKIJuPchXQ1yoMdSMiIxVLlGsAg8wtz1XBYru5NgQU+WXM6gs5uSzcoXrA5KL7BXATF4pVwATfetQpbMdJ51zeMe9QvnXXJd/YbQWrvWBM71J8yxTYFF/FAn6daMmZVCFJuYTrQOJYJGMaq0DfkjwLOMLgle3MOeffk1QmyccaSp6hIe6hj4g1e1x9SshuxL8Wr3Nb+EOVxDj1Fu82RIlugClcf82os1CNkWE4J33CNFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB14WOYMkR/0Bv1hEac0H/9oNPIVGrapd913zE6mkPI=;
 b=c+lOBKx+Gfvr0VYiEoRvWVKwv9sZJwbwL5SrsrEvEHGGKCqFMGBWKXVVVxhFGoFG6TtyC3/QV5Wtve6KsaXQPBqbTPqzFDHulmf1vHm5yl/NhCK2GoKuK18YGveE6TRYI1LzpqVNKaCLu8ujpwqqhDyw/ArWX882XdCPtjgWl1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DU0PR10MB5994.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 16:14:11 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 16:14:11 +0000
Message-ID: <492323ab-93f4-26e0-c73d-bcd03f92d3dc@kontron.de>
Date:   Wed, 1 Feb 2023 17:14:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] kbuild: allow validating individual dtb files against
 schema
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Tom Rini <trini@konsulko.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220706114407.1507412-1-dmitry.baryshkov@linaro.org>
 <CAK7LNAQPS+U1qq4K+7Rao9P7p94bMU3Y6g0+ALUd3t=ioZqSnw@mail.gmail.com>
 <CAA8EJpotkSfP6xgm9s-8iS3FGsTss403RXcBuMwB_9=JFdispA@mail.gmail.com>
 <74c27e78-8fb7-9c87-57ef-babd6741b631@kontron.de>
 <CAK7LNARQHXMb5t7sxyudiueb=ToR8OVif20a0KvyZ6XB1vLJhg@mail.gmail.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAK7LNARQHXMb5t7sxyudiueb=ToR8OVif20a0KvyZ6XB1vLJhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0074.eurprd03.prod.outlook.com
 (2603:10a6:208:69::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DU0PR10MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acd6f25-200e-48ea-b8a2-08db046f5af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtX/Z7ww2HKXJMa7ngkXbCd73de0Pai4DaUOS1Rp/4HRZFrm0tFJ5HZV/9I/bMhhIMSB8UrtoaOBJu1e3EFaZmEwvvp+L4Ls/7zB8ocoK4rMwGQAHmWqfKMRsq1XNZf9LE2iPrTT8FNjhpEgcH8jtSrcesuAh+I0oUasjx9lAF+YCLf3acBwM7RNaoCu7we0uE6sI7TkDlnK6BEavvuk1R4RElzZ9hj9fNVgo2R92WCyS4ViSutUoUrzpNa8DRiWdt6bHPoJQVz1KEnIs1XvdPZ4zNlPuoJYJW1NI9bqvC9w3qjOQ7rZtkXDvr0Ea0kJCFg7JrirhNt2S1mBRTs+pa8T6EdnPods3WzdcFtFessbtwDEr0ETjOGO8Xpt+YfRY8NWzUwr7dqYNyGeLcKGHgVJpbqdu6TAK4P1kQhYGoewax08hmvDZ/OxrCDPo4Y36hNkvPAqqBlbMWb9bcsNHvhjbNZjWQmddIbEZu79eBX4LuA8b5iQGXr53n3h1j8VV/BU7o7K7c/CmNLxpH29vcy4XqvtIUmVtEDNjyvKLrGI6YSrcmI930XSi4/hI3bacGTdvInhhr/ejXFDCCyfCwiSgmpP0B5T6Ipc9W6OMMfrWQ7LIT81WIGJBLHPvhAMGWORXbvopXqQDMQIN3XvVaRZENSCRSy2p7WxHCdHvJbusas43MbBMlkF4zXa79YWXFfBAkiAAs7bcQOXG5Ic5qoM2Mv9fhPiIuZ69gApFmSFqJS3io3OmOH9tUK4M48JvM9dakNw1OlzdithqfvNgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199018)(8936002)(66476007)(66946007)(4326008)(66556008)(8676002)(6916009)(316002)(5660300002)(7416002)(54906003)(44832011)(45080400002)(2906002)(31686004)(6506007)(41300700001)(6486002)(966005)(478600001)(53546011)(186003)(2616005)(36756003)(6512007)(83380400001)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHRlTFdneFZXK3FEdjVPUFh5VGFOSEZaY2lyQlZoZnhaOC8wSGxISzdJQkh1?=
 =?utf-8?B?OXpKcGhVaUlsUTAyUmtXVzJ3SHVTSnFlRFIxQnZPY1U5TVRFd2pUTCtyakYv?=
 =?utf-8?B?enRLSEZzUUwvMVZaY1REWmZLV0N5SnhqczJJTkdCVWFTbW5FeGNvaTF2WEZ0?=
 =?utf-8?B?V0hrQ0MxQkV3azhyMEwwZE9BWlQrRU5NZUZUMzlMbmNCbjRmTkJEeFZ5QXpC?=
 =?utf-8?B?a00wZjNBQXBmN3ZsYlNtU1JjbXMxY2lXZzNiRm42QXdlZFRlSXBHM29OUWd0?=
 =?utf-8?B?RDhZbURuT3ZGdDdURGlmZC96Z2R2QkRTQ3V4enhqckRKU1RZaUErSkhSMEV2?=
 =?utf-8?B?OGZZS3Q3blR6aXVSM1NyendZdFYrS3ZsSmRhVEZJTVBXb1RMRXdISkhlMTdx?=
 =?utf-8?B?d3pSS1ZXS2g5RTRYejRsakxBeDQ0U0NGZStsUGpVQ1lUNWREVE1QK0Nhek54?=
 =?utf-8?B?N05Fa2NGaEhORUVxb1Ewa0ZITEZpbG14L1lZTDVDYjV6WHkraGF5SkxZQjdq?=
 =?utf-8?B?Y2IvS3MzNmg1SFJIazhLcExVVEt5cGpyY0tuMEVCQW5VaTlxVUhvNFpEckc1?=
 =?utf-8?B?bytZZ2JKWFd0aG5kRmhwa0lpVjE0TENjU2hEN0VqWWZOMm1MckxZNVJFV3Ra?=
 =?utf-8?B?NGN0ZUd3UGJJb1BBUmxBUkJ2TUN3QTJVTmlFZzhiWnVIcjJnamErdktmVzl0?=
 =?utf-8?B?ODU2MDVWd0FtWmFxem5iVzZ6SjFEeVhqNHFsdTVQSTZtTDRlTDZha0lVQ3Zq?=
 =?utf-8?B?djZXbngyOFFnU3hKNFc0d2xMbmZBRWRpNEFFVjg3VmF4NGNTNUNLR05aa3k2?=
 =?utf-8?B?Q2dSOVl6UVQ4V0ZUVHVONSsvVzdLSjB5VEdvMmtUbmpBMjh5K1Q2Q0lnQ2ta?=
 =?utf-8?B?dkFzYVc0SjZ3eENMckhpU2xDYmJYek4ybFhWTmREYmxxSGRSVEVpTkd0VnNv?=
 =?utf-8?B?WG8yeGxOeUZnb3ZpOTJCTHNEaE5vdFhWN3JGdlByeUs5a2dnRVEyWjViREVr?=
 =?utf-8?B?cXFCZUtTcTY4QTBVRGZVWVR4SWloMnhSc3VVUzJFQjVGeTc4QVJsWldGbDNF?=
 =?utf-8?B?RjlqVXpSK05XTzlCN3E5aGE1TnhQOTUwc2RUY05KRUZFN0drY2hrUW5pYmVr?=
 =?utf-8?B?ZWZybHdwdUdHVVBZSzU0bktQMC9pSStyOUQ4NW5uYndSblp1R05nTTE5bytj?=
 =?utf-8?B?czkxa01DMXNJQWpCb29xMmE2NnY1WjB2dGdmNGV1ZDQwZjNYZzI1SVdTYnFt?=
 =?utf-8?B?OVYyeGtFL2dxS1h3aW0xLzE1OUtESWUxNHdIajVFUHRyYnBWdEVYT0IydmpI?=
 =?utf-8?B?Y2RHU09RL2xoTEl0aWFBRjNOMXpuU0dKL3ZqajZjUyt6T0ZYMnF5Nmt2UUJF?=
 =?utf-8?B?V0ZoRXZHT3l4MDc3TVR6cE44Mnl6L244cVZCVEd2SnBoOEFKZDlmaC9zelh4?=
 =?utf-8?B?NGlzUlBNK1dzYlBVTFIyNERrTjFhdEFZNGQxTVhmYUdFTVlSYlVUTWFPMUVI?=
 =?utf-8?B?bjBPU2FuQmtvS0ZZOWl6WXkzM0MzYjcrTjIrcjZBY2g0akFlWWplQi9QamV4?=
 =?utf-8?B?U2ptM0gyVFJPaXJvNVhhT0EwNXNEVmFFbHpZWm1JT3ZxSEVnMExZU1pLaFRq?=
 =?utf-8?B?aFBMQWNNUC9VZUxETHMvZnI3Slo2dHFuRVdKcWFGUG5qVWF0U0diSzhFTXFQ?=
 =?utf-8?B?L0dCdDBaSjNaVFRlQkRaY3lKbTZUWjFWOUJHdWNTUUlMUFpMejllOGhqWkhk?=
 =?utf-8?B?bVV0SDMrOWg3eVJSREVIaWlFZDIxc1lkMytyTEdUSkRlNVZwRDdSNm05ak5G?=
 =?utf-8?B?SlpQSFNQdGJ1ek1pOWlhREVTUktHaGFwSm5DYVp4TXZDSWJDWHZaYTA3dTdI?=
 =?utf-8?B?eWpvcm1tN3lUQkxYKzRoYUhNUHdiWFRKckM0d1d6a0s3STJsZGk4Z3ZyMUdN?=
 =?utf-8?B?Vk9TcDExYmlOTFNyNzNYRmV2dXh6N3g0MDlybGVtaUc4c0srVWpaTnJIcVBu?=
 =?utf-8?B?TUpWeWpIbGNka2NEQ3I3akk2bVR5WjFSbFVnZWE4M21vbi9kRnhnVWU4b09o?=
 =?utf-8?B?N2RHZUlyRm1FQ2hsWnR1OVU0cTBMM1JjRE5keVBHcUJVdzhuZkgrN2I2N0Jw?=
 =?utf-8?B?aFFwQ09PaUpnOHNFcVduQ0tZMldCODFWeWl2dFhQWWdZQkVXSnZjQnRGYWpI?=
 =?utf-8?Q?Nfl7nQ+AP/FdMSDBgDaojlZPk4Hk2VDRa+K+sVl+l0Fl?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acd6f25-200e-48ea-b8a2-08db046f5af5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 16:14:11.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gb5S4Gw+W3RGlLTBTvFaOUQiSuT8H8EJQqD/EUvWMUoF0OC0Y3ylSuMdh/5IP0dlemYSURh2cVBoRoagk93QfPXbhVNcBwYtLfkCNLDDzgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5994
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 01.02.23 17:08, Masahiro Yamada wrote:
> On Thu, Feb 2, 2023 at 12:51 AM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> Hi Masahiro,
>>
>> On 25.10.22 21:07, Dmitry Baryshkov wrote:
>>> On Sat, 16 Jul 2022 at 12:38, Masahiro Yamada <masahiroy@kernel.org> wrote:
>>>> First, apply the following clean-up patch to reduce the code duplication.
>>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220716093122.137494-1-masahiroy%40kernel.org%2FT%2F%23u&data=05%7C01%7Cfrieder.schrempf%40kontron.de%7C95bf7b3a216841e1630408db046ea810%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C638108645530201844%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=6aAT%2Bzng%2B7CWd8wWPVzvvgJRpRcG2dAeW%2FKDUoUNKzg%3D&reserved=0
>>>>
>>>
>>> The cleanup patch has been merged into 6.0.
>>>
>>>> Then, apply the attached patch.diff
>>>
>>> But the patch you proposed didn't seem to be posted. Do you still
>>> intend to post it?
>>
>> Can you formally post the patch you proposed above?
>> It is very useful and works just fine for me.
>>
>> Thanks
>> Frieder
> 
> 
> 
> Rob applied an equivalent patch
> (with help message added).
> 
> 
> 
> commit ec201955a53be4b57a467f7160724ff06289cead
> Author: Rob Herring <robh@kernel.org>
> Date:   Mon Dec 19 19:32:33 2022 -0600
> 
>     kbuild: Optionally enable schema checks for %.dtb targets
> 

Ok, great! I forgot to check linux-next. Thanks!
