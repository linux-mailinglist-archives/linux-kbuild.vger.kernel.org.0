Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFD4686AAD
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Feb 2023 16:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbjBAPvS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Feb 2023 10:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbjBAPvR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Feb 2023 10:51:17 -0500
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2133.outbound.protection.outlook.com [40.107.15.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2F6D2917B;
        Wed,  1 Feb 2023 07:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAwdH5W7Y0ZXU8WWV5oJP9dS9a2AkiOIoHCthyYarbNQ5MGZKptdSLO/PVwjeuBxVnavQUM5KwD5JZMczix0S4T+Zm4sQ1NOZ7jMrV8HRwI6l/2rMLADW8yQQc2aZlMhltfBSGFWmk6W0LFiuCaTGylkBz6vHZoKxaqnzE+zm8BPVb/6/jJeEjPWaOLEKZsEKEBHyV8+996fUxRU+Otce8eiGhtw6PkSD3lJbxtdJ23q88eewiOfnNzbP/MG38q0rh4emunWi1tmPBU6yGex0GWCmX/QBSv+biGYB/9kvk8gHxP7cf3wFgY7tMujIKo/3pAgGLzgBPWAC7yQVsDbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaWhd1HOpXINQq1L0RkQyZby1tDYnrN+7jZH1FsaOE8=;
 b=VAos2Uh5xx4kDYucxrqQWqSwZys02Ny80nq8zuMgQypgDzgCUPUdBOqTd79/b9CWpxTj4iwzgCsK/bRrCQN6pmO0YwtUo8xSS6Y2VPWF2VhuQE2Nl0wRaBO/FO6hDcUmTzqLuaUMNC/oH8effxeL1mULIyl6Oqrt1bBzhsuiITvnPdxg+zpVRk1ZasbyRj/vbw4F+nky8g7m5eZg4hAFNCe0sQ4wSwlfz26ztGdOGF5/C2A0B0kW5EXffZDT4XnSBbfOp4UfhCB+RpJVVvCAly4R5xcbDsrIZ/z6zcDQCnIgGPUh/M4RpNXH0RgDofbtpp8TdLPG+r8iDe/OD0Ry3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaWhd1HOpXINQq1L0RkQyZby1tDYnrN+7jZH1FsaOE8=;
 b=cQ+94LMD2K69CC/WPLttXKw3fGigjcwxjQl5qf7q1bBq/EkPAozVviroaDi/YfXd52CuH/3ZHWbju42h4mysfzIEk9n7ZXmrba4or6PlsBiJfefZUTGC8bii3MyHfZ8QazXhKW9XMdSzDMazjKkwmaYyeK8L+17B6YzJVQ3LYhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PA4PR10MB5563.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:260::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 15:51:11 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 15:51:11 +0000
Message-ID: <74c27e78-8fb7-9c87-57ef-babd6741b631@kontron.de>
Date:   Wed, 1 Feb 2023 16:51:09 +0100
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
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAA8EJpotkSfP6xgm9s-8iS3FGsTss403RXcBuMwB_9=JFdispA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PA4PR10MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: f61f8962-52ea-4997-9276-08db046c2442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NsgN/QDZxv6YPCeOIkE/qvCm60f3qtRE8nMz6Hy+qDTMhJstz5HFindCeevKKijg76owBs8mL2F7hDJJnJrxgYmRZioZ5jbAFyHkJpzYfNwXpyZa7aI4fVGUg9Acp/9Q/MDPT+TxeEJwvUETjD6n/wPzZICcnvuuio3V1IsHtCImOly09OqJWNrKT+6r9qiDarbhd5q9k6BL8+08ybeP/TWdH17M34ObEROLVy68BXF+OtiSYOvcym/ZkJrppasNiffwlwOjL06vvRFqd5zoUnEMxSfwNPyuiNf33hMpDyz4DcbYZbSVgt+2UauqhXIvMwA/sbIrIHZp2Q1ii+Zk9qhcejsBnVX6aDULsoAxBle522a9fxzdv6m7pTtZCYuIbENWplOxyo5rPoxNDvK9Jh2hlgrGbb93KmRy9ZcwdsrOjzcW39ZL7SAYbFfeazzjMQWBA5uTxuX7TXeo800G/wWCYPXmNLULdlyaxKnETXHo7xXxnbmeIBuUvnRM+gRjqxfbv99LUhb8ZAkfEqLflBwEshJWTCyVQKvtrX4E1jFKpwkkGA3rsrJWofktwblJFzxNqr90v6VxdzzsiYww0dZjbNfN71XpgT3qiRHYqVQMGZe3qMmvWDkbBiDSMbP0hcd26T397RAuU/CkmMfgqBm/y8Xama2H0sw5g+AH+5VRTWwuMOQbR0IOhAaPXIQLX6I1Zf8TGFToE/KDRH05yE7wSvxxlazAzcMeAulb1uzRTfa2x9w/mhga+g5RSGNDBgj2+w0nNNwXSURCKQwL5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199018)(6506007)(31686004)(8936002)(316002)(54906003)(41300700001)(66476007)(4326008)(8676002)(66946007)(66556008)(6916009)(31696002)(36756003)(86362001)(38100700002)(53546011)(186003)(966005)(6486002)(6512007)(5660300002)(4744005)(44832011)(7416002)(2616005)(478600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW1RNTJ3bWRkZXpRbEdQK1ZuY1phbnVNemo5V2xCTjNxK3Z2aHd3NnRzTTJR?=
 =?utf-8?B?UWxQcVQvTFU3MCtldHBMdFNVYmRhakhvT0JyWVZhNTFRbDh1TjNxUnhHR1hC?=
 =?utf-8?B?RGYzeXo1ZXZ0VEU3ZTBBZjd4ZjA3eFA5OUU1aGs0T2hLS3Z0ZlRKSkorRGxR?=
 =?utf-8?B?bnozbFd1VWd2cTdrc3dYY2RlZXhpbjkrVjR5YkV5eFl6WGI0U3JzZnJtSVli?=
 =?utf-8?B?TkpLdlV6cWgwNytNV1BGTmpYV0sra3JmdmdhSnM3YVZ5K0V4Z0ZZY0pydjV1?=
 =?utf-8?B?TVJnZTlsbTJ2eXhDVVZYQWdWRzdEaVorTEZvQXdqbTVUYlRnWTduQ1lyTU5W?=
 =?utf-8?B?YVovS2E5V0YxbkF0aEdseE85RTEyb2VqcHR4YzYxRS81R25JVTJjcDF1Q3J0?=
 =?utf-8?B?U0s0UnE2S1YvdmtJZWxmZGp6RzFuZytQOStiU0c0Nm40UmtVSk1ONjU4ZFZL?=
 =?utf-8?B?Q3pVM0Zqd1REK2lLZlF0Ump4OTRHakU1MXlsc013R09TUmNhOWY5YUxyTTIr?=
 =?utf-8?B?NTJLdWxjWi95WGNyRXpvU0VMdjJnS3p2WjJPajA4QWFpeUZHZWp4eHVOc1d2?=
 =?utf-8?B?Z0l1Z0txaWFWcU1MOE9Jb1dzSVFUbUd0dHRvUFZralJTUlRtNEx4NWhtY1lz?=
 =?utf-8?B?UWozRGpJaFJUUHhsOUtLeFNDeVJFSjlHL2QvUHNWa2JUYWI2SlFTUGVvNXBE?=
 =?utf-8?B?RnhpOElkUFJxM1ZrZE9jYVp4b0dHeVNrdzVuaWVOYW1xaVhSNnd5Q2ljOWlt?=
 =?utf-8?B?M0hRTGlzNHpJZlVheTFQZmVPZWZMa0hJT0k1TmF5Z0xBZDhkRFRnRmJSUzBG?=
 =?utf-8?B?aHlXU3hqbEloSUsvUFBCazNHUG1XbWZzYjJRZWxaeG5PUlIvc0dKdWRQMkVD?=
 =?utf-8?B?ZUV1THQwWGZhYjhVUStibzFsWmZuRytPNnR5bmxnQitGNnJXa2NGdjFCSGk0?=
 =?utf-8?B?UU9naVBwRDVoSVZOempjVkpQdllNcUpzaEh5TysxQmhiL2paQnc2aFVtNlpJ?=
 =?utf-8?B?eUJwT2RXTHhBYW5oakx0TjZ6Z2IrcjA5M0tFU1AzZFNuT2hIZEVieURWYm56?=
 =?utf-8?B?MEJBMTZMLy9lR21rMU55YnNONmVOM3BNVkFxaGFQZlhQYXJEak9FM2lqSWdZ?=
 =?utf-8?B?d0VRSFc0alRrcDZyR202aG9hOVpqWXVOVGZuZDBlaTJ4Z2paR0lWWXdabVhK?=
 =?utf-8?B?aWRpL1BPb2NQQUF5ZHh6YlVNVnNZK2I3Q1Y4bGpPa3JncEhyVFRuNjNSTE01?=
 =?utf-8?B?UDFJUHRkUnZDL3cyTmlvcU5zV1BXaDBpeVIrTGhIamI1Z0Faaml6MlJvcUIw?=
 =?utf-8?B?d1Avby9DQlRybDZ6b256a1lLZWx1dWoyQjZSOTg5cFBrUnhRb1Nzd2JDa2NZ?=
 =?utf-8?B?dGNJQ2VSM09FOFpYY25FM1Z4VjAwL3hjbXFEVi8xLzN3L21vVURhdFVzdTZX?=
 =?utf-8?B?b2ZQdG5VRjBYMUUwMG9zbUdCdUJGRGZxY2YySUxsTmlrRHd3UGg0T0tGSjVU?=
 =?utf-8?B?eXEvZ3kxaEtiNzVtVEZEV3RCV2prZDJVclh5bzhpSFhWVC9KZjRvTzBHbURE?=
 =?utf-8?B?WlM2amt6cllDUzZycVRTQnZDWnpvTGpJYUs5b0tFQVFjUEE3c2c2MFVYUUMx?=
 =?utf-8?B?anlQeDhZUkE1cVZDYTlIREExSFFFeUJrOWowZGxFSjQvbTFoYkdrNmFxeHVj?=
 =?utf-8?B?MlFRd2ltWXV5a1Q0TjF4aGZ1L21Fb3J1UzlwU0JWYUt5RXI3VkNnMVl2OTFa?=
 =?utf-8?B?T3N4VkMzMjJjWm1qdDNSVElaK0dxaXlmSUhHUjhJbVZIZEdLWEVCcWg5U0hO?=
 =?utf-8?B?Wk12R1c3cFk1VUFXdmlEc0dUejh6Z1JSSVgvRVlTTUxWUWxYaG5aT0huNGtY?=
 =?utf-8?B?VlNXMUZOKys4SWlPUnNyS0tQa1gxbVhNdWZHV08xcy9GV2syNHI1WUhtcE9k?=
 =?utf-8?B?SlNVOFFJSFFJbDh6R3BVSDFMYjJpc2lQYytWd1VsMVlVVlJ3VVdORnQ0b1Zy?=
 =?utf-8?B?QzFrZkdEQUFuMTAvSlRBeS9XUmVVb2MzWDd2NDBKbGlPcTRXeVpTYml0RE45?=
 =?utf-8?B?S2xBU2U5djVzUHdnM25QYWRNSEJHSVUrZWRaVnliNXlBK1lLWVdWZzRtcExJ?=
 =?utf-8?B?d1NmaTVNVE5XWWpweFJudnNWeUFIUFdxOUpiYzhxWEtpTlhUcnp0dnFDYXdX?=
 =?utf-8?Q?y2WmZ5ud5MzsInZaC8WmrcrrVHcouqrOk7PU2xiWWgKi?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f61f8962-52ea-4997-9276-08db046c2442
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 15:51:11.6722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0LXXpQK5bjMhoUrdpgbxopgsoEX3T14iaElVp1W0DYS2j9j/fI48HERuLZG47Gh+s1jApVVSwpmsiN4Eajk4JnxAkxeGEvoke+K49eq2iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5563
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On 25.10.22 21:07, Dmitry Baryshkov wrote:
> On Sat, 16 Jul 2022 at 12:38, Masahiro Yamada <masahiroy@kernel.org> wrote:
>> First, apply the following clean-up patch to reduce the code duplication.
>> https://lore.kernel.org/all/20220716093122.137494-1-masahiroy@kernel.org/T/#u
>>
> 
> The cleanup patch has been merged into 6.0.
> 
>> Then, apply the attached patch.diff
> 
> But the patch you proposed didn't seem to be posted. Do you still
> intend to post it?

Can you formally post the patch you proposed above?
It is very useful and works just fine for me.

Thanks
Frieder
