Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F7E36C4B3
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Apr 2021 13:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbhD0LOn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Apr 2021 07:14:43 -0400
Received: from mail-db8eur05on2065.outbound.protection.outlook.com ([40.107.20.65]:42721
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235097AbhD0LOm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Apr 2021 07:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUfE4XRl/uzSj1JBNCdAg0F1thsCBNinaMRjFdNO4is=;
 b=6C0YU/NCjxE83XZxLD32eyf9u+uiILdP5prH+Yr++O6STLxRYiMrSvxsQg+r9P0tTAz1bC8Hu2j7xi8REdBKG0vKkSdyzRLMuumov2HP7aQ9wL1tLtrJ8QZ4ML7qCqyMnK7iFRkGlxw6yzZnuFDHA+aZ0LjBAr70DernTjni5Ek=
Received: from AM5PR0101CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::34) by AM4PR0802MB2370.eurprd08.prod.outlook.com
 (2603:10a6:200:63::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 11:13:55 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::3b) by AM5PR0101CA0021.outlook.office365.com
 (2603:10a6:206:16::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Tue, 27 Apr 2021 11:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Tue, 27 Apr 2021 11:13:55 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90"); Tue, 27 Apr 2021 11:13:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 468ddd22de5520e2
X-CR-MTA-TID: 64aa7808
Received: from 5a038bb2cddf.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id CE7E4507-51AA-440C-BD22-EE2A65AF51FA.1;
        Tue, 27 Apr 2021 11:13:49 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a038bb2cddf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Apr 2021 11:13:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2bthYqt0RbgjNVlc+YFJIJ3gULBm6abF+mIXDujQRkJsnBNctZhlxLXlLLFOW1XzXnrqcP1m3ocyAJcoBuUqxAu0MTmG+K265u7t0hsYxHW5ILhVZFXDMBJmxX5aVhqPP1oXNGe3O8t+FI+9feH82yUF4na7wLqU8QOaEWOyDPXyYflUYeq3ft3bhNl/XoV3EEZ301oZJ+hX1y++L4KagdLbCg1bi9lJcFZ2EEum4sDRKKu8LSwmdrf8UXt+0e5j2uYiVTq4z544dS/ndjAk2CcXgOOBz1hS4h5UDrSswLi+M4DeLvri+4g/puYgBSVYo1mJMGo88ad7I5t6WlTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUfE4XRl/uzSj1JBNCdAg0F1thsCBNinaMRjFdNO4is=;
 b=E6lqqlqeIvZLOlqR6h5e7U3D7SD1kq8opa4fYW4/gh8fzUQfDgXwQThQzWXLYgOFFclI/1+Kzxd8dnOi8kIO41HhxJjNGpsKARfGqzPETqEr2Usz9ZcvoVQJGrP1WAslftlPJ9DQi/x4kzKcIvfOOVvY6+j20FnOwSPvpEsPaI5uAi5SfosKp+hSylS5FAgu0ABvBgHnhatQvyBjGhjYRgZXNmPCZMV+EOdjuZX/nQZJHF6hTc9QZcltVEoQgojuArnG6u1+TJrdJhZ8F0KWDVR5wnb/nkvhzCnxAOFZ00zQpQThORLE/v21aoiiRLJJP4fQf1UKNDz4PVbFAQO9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUfE4XRl/uzSj1JBNCdAg0F1thsCBNinaMRjFdNO4is=;
 b=6C0YU/NCjxE83XZxLD32eyf9u+uiILdP5prH+Yr++O6STLxRYiMrSvxsQg+r9P0tTAz1bC8Hu2j7xi8REdBKG0vKkSdyzRLMuumov2HP7aQ9wL1tLtrJ8QZ4ML7qCqyMnK7iFRkGlxw6yzZnuFDHA+aZ0LjBAr70DernTjni5Ek=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6943.eurprd08.prod.outlook.com (2603:10a6:102:135::10)
 by PR3PR08MB5787.eurprd08.prod.outlook.com (2603:10a6:102:90::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 11:13:47 +0000
Received: from PAXPR08MB6943.eurprd08.prod.outlook.com
 ([fe80::ec33:bc81:5918:2d09]) by PAXPR08MB6943.eurprd08.prod.outlook.com
 ([fe80::ec33:bc81:5918:2d09%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 11:13:47 +0000
Date:   Tue, 27 Apr 2021 12:13:45 +0100
From:   Robin Randhawa <robin.randhawa@arm.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>, nd@arm.com
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210427111345.n4vey3zfpk6n7mwx@FVFF77RQQ05N>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <YIGVFCymUn+4HBIj@google.com>
 <CACRpkdat-4BbKHMBerdxXBseMb9O3PiDRZmMLP_OWFE2ctSgEg@mail.gmail.com>
 <YIbQ3dHOpyD/yymW@google.com>
 <CACRpkdYM5DFLa5=t2NRnZh_TC4KXJYOuXL0oP6xcbifuNjegUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdYM5DFLa5=t2NRnZh_TC4KXJYOuXL0oP6xcbifuNjegUg@mail.gmail.com>
X-Originating-IP: [78.105.195.18]
X-ClientProxiedBy: LNXP265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::20) To PAXPR08MB6943.eurprd08.prod.outlook.com
 (2603:10a6:102:135::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (78.105.195.18) by LNXP265CA0032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend Transport; Tue, 27 Apr 2021 11:13:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21212fb3-41fe-45b9-534f-08d9096d8c46
X-MS-TrafficTypeDiagnostic: PR3PR08MB5787:|AM4PR0802MB2370:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2370E821C52B2A645C116F139B419@AM4PR0802MB2370.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: eJaJ+8wNaaLb2PKLXfUOFGSxta0tIVKjvQjXF5PkhiFMOCjfhE1FIdI9/9TjUv+5ednRT52XeG4p2rD+UzTUzf1T6dhZeEWiVm4ZoTtBykd0RxxFRn4u01ZnWi/eSrZJ3SCFOuGGFMdQyU0i4g1Ivji1aLUKIh3RA30qqLPdHYeyxsA2cEfAtsnciVaKqD3a3PdVA9/6mGomV96pC4Xn9/sqHg0Q8u0f9iZcLGzIF+zDAUuCawNGngt/5nJhp20yFwTX5aVxY++jWsbxiXD3Wp8ObkOVqKTthCJsAh7IwS7WIWMw5enXox4Qxie6CCi9Pfp8/YjwToPe1+KoEb15Ot5Fv5icqa93Ha5w2YLs2FMcp+VU1dhEoKzVTrZBuPJjwazwHkmeaxmK3WOhJmCAE9K9T0GqbYMzQgleVtBfxztWaES8G0jabpfo3kEaisL0bBWx8s0NFBuYU1sJh/TAE0ytLgH1UurH/jtAzsgwVflkyKObawfgcbzHs5MHcBtmh0+HU6cUo7/koaBjqapQodE7RtFpM2e1qgTFqARDVVAANuoWhiOdq37CZ9OivNq9zmZpOjyNyR/OodVP2Elk3HKiL3H0SD50CHnpIB7SJ4LwvCJByDm4eXUodKeuD+2/jWDybdoxfVMouy6oFJOn9YwqXIfp+gMpaCLzysWR8iTFgVh2fKLbmyyz8MO0PuyIs5XA3Nx2wFrCwKP8GGFf11KhvXISEu4JGJt4WI09s8U=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6943.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(376002)(366004)(39850400004)(396003)(136003)(316002)(9686003)(478600001)(16526019)(186003)(8936002)(53546011)(38350700002)(8676002)(54906003)(52116002)(86362001)(6916009)(6496006)(956004)(7416002)(44832011)(966005)(5660300002)(83380400001)(1076003)(38100700002)(66476007)(66556008)(66946007)(4744005)(2906002)(33716001)(4326008)(6486002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M2NJUEEvWXd4NFI1Nm1jeHFMbWhXaEVFRmNBOElKZlE0eURGRHBVblk1QXQr?=
 =?utf-8?B?eVdQMTNTeVVrc0FaelZHdGlNUlZpMmhRcWoxc2xJcGowdHFvVC9PVCtCc1hF?=
 =?utf-8?B?OGVBTzhHYWhqRkRoT0N2T1UwVERHWmFtOVFlbHJmS1ZjTDhWU3IwTTIxZ3ZE?=
 =?utf-8?B?SFJRc2Z5enY2QVBpajlTZ3crVTJHeU12K1diaGNiMTNzUDBLTHVGS2tYcEZp?=
 =?utf-8?B?bjQycXU1QnFLOHExVzNqaDQ3cDhaZVI0cCtkVmE5ZnhMRkZFam1kT084VElm?=
 =?utf-8?B?TFBMZkNBTksyYVpOd0EySkhhRHJTZFhueGFCSGlIZlVQREd3U05CblJ0YVVq?=
 =?utf-8?B?QUxhNjhPeW1LOEpmSHEvS3FXWXVvdGhaM0Z0Y0d0SStPWThYK1M1Z0pQUmlE?=
 =?utf-8?B?NWM4azFPbC9MR1dIdWVXUCtpb0dHRW8xeXdReFVFNGlvbHQzUitucDdyME9v?=
 =?utf-8?B?VGpVVmF3TFRlUmNmUVVRQ2pHTldRZzFpY2lIa2Z5OG1Ka0wrVUdxOFMyN0Mr?=
 =?utf-8?B?WUZBcTVZOFpzNmhiN3FHVlVUaGJhank5R1Njc091YWJuaCttODFFWEorUm1I?=
 =?utf-8?B?QmxKZkpQNVZLSEI2ZlBMY0pKK0NBS01ZcGU5azBrcVhBYnQ5YnNBTDAySFdH?=
 =?utf-8?B?TmNrWVRZZGM1U211N1FiQVdCTFVITXREemtFdVk1dWRtakw1bE5DaS9wV0FY?=
 =?utf-8?B?cVNYaTRYNEZpV3RjNnpPNlI2VktlbEJTS2VwZzdlTDAzMjJKWGpMbExLQXlm?=
 =?utf-8?B?Tjc1VzJpajBUM0VwWTZxRFVHQ2ZHeUs4alZZWFZsc2xXZDZlMjJuTEUwWWNZ?=
 =?utf-8?B?Q2lhdU9uR3BsR0c0VzBaV3A2WG80MllYL1BodVp1ZVRrYnJJR1AyTVIzTzdq?=
 =?utf-8?B?UklGUUtQMG5USE5uZU95RnRIOUVTU0x1UnJRWlNQdXoyWWZPZGxJRGNpLzBm?=
 =?utf-8?B?UnpwUlVmNzIreVlIMHdxVmlYT1dLNXhDTVVWem0rdE9FTWIxclpMc2VBN0lt?=
 =?utf-8?B?Uk4zcm9IMEROSGdnd1NxNjJ5L2ZPeVYyYW95dTVPV0hha1RRR1hwWUZKVTZL?=
 =?utf-8?B?LysyL1lQc1VEaG5HNmgwY0RndGEvUGVqcFgralZnMHFCTFZ2UnRPRkpoSFZD?=
 =?utf-8?B?YTM1UEducHJ3VFRqVDZCV0toTkFwNnF0Vk5xRmVMalBXZ0ZxWTFCd0NydmEr?=
 =?utf-8?B?WFFKdEZJZTlmN3ZMeU1qanJ1WWdDU3ZxNjVtVmhxUlFhK29jdUNLWDFuMXE2?=
 =?utf-8?B?eWlScjlSM2N2bms3RVJaenpoRTg2TGR1RzRXTXhBOGgrRkpRQUpKdGdjNmgx?=
 =?utf-8?B?NDZ3NDlUK294WVhIRS9SNTBIVGRkY3R2clNkL3F2M1F6SUxJUm1TT2xOek1U?=
 =?utf-8?B?R1dvTDAzTjlqOFYrOEFnbE5WTzdYY1Z2NForSzVrWjdpYmNVN0V2SUg5UDdw?=
 =?utf-8?B?Wlp6dmkxS2JNNWlaaU1PbVdYTVpza0ZzRVc5STlWdnNJRE56YkhjNHNPcWJL?=
 =?utf-8?B?bTdPWFMwMk10VFJvWU0xQWpGUFpVSTNWdUZUQXBMNFdPa0lwSFBIcWpVWTND?=
 =?utf-8?B?c1phZDkzcW1reXBSRGE0cnlYUXpDNWU3eEsyR1YvL0ZXNi9od1NsOEFvZjJy?=
 =?utf-8?B?V3pUSENPbW5BQU41ckRjd0tiYXY0NUpGdllMZ2lTNVpRc24yZlFsZVA2UUlJ?=
 =?utf-8?B?cG1NYXVPSm9aU0htdW40MzFiNjhUc2RrdFl1Zys0ZW5zWlpoVmc4cEVodk83?=
 =?utf-8?Q?zq0Szj3bmWEfPN4UxumMcTZiP7mCwmX/KnA6b2B?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5787
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 32598269-38af-4747-2a3a-08d9096d86fe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xopbWNbabtvKB/9v4lWZ67AH+G0l2JRyMe/Xf07Ij+YW2ifVJmEfwPiezZc27wIV+7TEV95UetqIvncp+K1jg5kHRofIvo9uoaWg6o3VR/uRMMvb3QYgrAZ0fjv8e2Oe8tLyLXNGEi0IqKJWFfDMQ2dBAsHKa/oiaKgahGAGQapNTJj+599X+laoUkdxp++gEYBXrH30TdxeIe5h6/a48v43Zu4LWkq5iD/8i30gAZ3jrwOGJgUn6D0bz84YPeIaVmDD3f4qzsVv5MufA35/mtYKjs+8H11MtmUputBz4SIXv+xbmpVdpK/IuyqKPdylRqt8sZXhDuPjcXV7z2rjJ+8L/lYgfdBuhplLKynb3kp1Ne70JlX/cujNHG3LHgBaKiLBFKtI1pW9p2WUUEEXCKkhNuJ6Dt6sG0BrJWh6tBLYgOsvsvdmEVwKQChhjj06l0DxI3VYKIL8ftOMq0rqFDqvHLKohsGG9/kcTQEpqJdG0jjBA5iLW2XbZaHRiG+8TmB62yxMVsIi0hWkmpOAMwSN6xXDIgHoWNhnG7bVQOe7549yCj43Kty3yr2iAkcpXbqQE0EIRwC1FlNZx1jEArBmplmNgz0TBmvRgOecbJ0ifmqJ4xezrL0nG/oF6V3J9rMz5TkHsWDISHsG4FALu6fqml8MZ69GdqN6a9lyDTdPeQX+lGEmePMNSsBC2BANYDn5tQm6DWiK/WMSKeRSL2WkXiNUkTz4EtCpvP6TCoSay/hEausb5zjyCYtSMMh10K6jfM4JLsBydxriv3JtOA==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(7916004)(39850400004)(346002)(396003)(376002)(136003)(36840700001)(46966006)(34020700004)(53546011)(966005)(8936002)(8676002)(356005)(82310400003)(82740400003)(81166007)(16526019)(2906002)(44832011)(336012)(478600001)(6496006)(6486002)(1076003)(6862004)(956004)(36860700001)(33716001)(316002)(83380400001)(54906003)(4326008)(70586007)(86362001)(70206006)(4744005)(47076005)(450100002)(26005)(5660300002)(9686003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 11:13:55.7960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21212fb3-41fe-45b9-534f-08d9096d8c46
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2370
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus.

Thanks for your detailed inputs. I will defer to Wedson to address your
points but I had one suggestion.

On 27.04.2021 12:54, Linus Walleij wrote:

[...]

>To me, the Rust book is nowhere near "The C
>Programming Language" in quality (meaning readability
>and ability to transfer complex detailed knowledge) and
>that is a serious problem.

Compared to the Rust Book - which aims to provide a relatively gentle
and comprehensive introduction to the language, I think the Rust
reference might be more suitable in order to understand the language
support for features like Traits:

https://doc.rust-lang.org/stable/reference/introduction.html

A lot of folks, myself included, convolve the Book with the Reference to
get a stronger handle on concepts.

This is subjective of course but I felt it worth sharing.

Robin
