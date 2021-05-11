Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D5A37A843
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 May 2021 15:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhEKN5x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 May 2021 09:57:53 -0400
Received: from mail-eopbgr80044.outbound.protection.outlook.com ([40.107.8.44]:16809
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231527AbhEKN5w (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 May 2021 09:57:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cm9I9Yh7cMOxYfw98x6NZdW1deaBbS3GnKJu5592HDTMqh6+HrbYWsis7p/hAGly2FK/xnCTxOfZEt9LsPLyKslqt80qpD8TOzuSSwoRkwJ1oFsex0y7wk8ARgSc+x4/giAXn0ihYYb3stAulGF3srYQOKVltO4YlSz9qpO/0NrjXouYYxkZ1SOxwKDT6wjZo+iYMbg0hIJd73Aozr8Hi1JPQr5VxyER3hxi6HlUwHGqTFb5fGSjc33Z+hYDuDFeYysCtUBhp2xgEzyEJ4OUNkeABrv6kd11SyqayFVv+V4F9JLTIK71xLfqqDOFxh00viUsgfMkNSuxgIZHyQ/78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZpJsrkjF8r950jZjlUZBBFxHbWTvXp9JGzbu5+TiJk=;
 b=NnJ0DMe01pEMxv612e8XX3rqC3oDBxRSB+R6NvZkmRBQ65+f4VsIRJXhkvAdBpJNF+qCSjWbPXE1SK3+STL7Y2wxFeO6Z8bMt57MhcxswVVgO6zHulpMeedbmxMZCB1kmaOa1wcvh3kTBq3bJejVbFs1IdWehFYldfaRCqil90voazMIhbQHYH26LbpvANdg/iGCp/t53vXkY9X+rdskD1CGgoYMaR03RmYRTdZZkddIZiKo82vf4Sh2+LcRqFBOHxqXI4IHGzeaEflDHEwJXpwy2X6/WFcdj+Rq7Y3kv/EK3TD4FhkhoZwpYMWCQdDZPcwAUT8KnBRa56es9QIM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=t2data.com; dmarc=pass action=none header.from=t2data.com;
 dkim=pass header.d=t2data.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=t2datacom.onmicrosoft.com; s=selector1-t2datacom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZpJsrkjF8r950jZjlUZBBFxHbWTvXp9JGzbu5+TiJk=;
 b=Jc2P5Z4LhuqBfr+cJTeHri+CZpjoM4/0i8pv6n9HHM12Q0o8L0s3He2W4InUXJSyvxAG2zysuI6j4tBTXVt3RicZ0JFW3AnAVVGZUmjIqGaVKanKmRdnbJ412YHwDWj96ac6cqaGor5zXjGU9/jWminV38Sw+r48T8ef1+cgFZw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=t2data.com;
Received: from HE1PR0602MB2858.eurprd06.prod.outlook.com (2603:10a6:3:da::10)
 by HE1PR0602MB2858.eurprd06.prod.outlook.com (2603:10a6:3:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 11 May
 2021 13:56:42 +0000
Received: from HE1PR0602MB2858.eurprd06.prod.outlook.com
 ([fe80::409f:a235:de54:364e]) by HE1PR0602MB2858.eurprd06.prod.outlook.com
 ([fe80::409f:a235:de54:364e%8]) with mapi id 15.20.4129.025; Tue, 11 May 2021
 13:56:42 +0000
Reply-To: christian.melki@t2data.com
Subject: Re: [PATCH kconfig] Add annotation symbol to configuration handling.
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     linux-kbuild@vger.kernel.org
References: <20210509155138.24670-1-christian.melki@t2data.com>
 <boris.20210511152714@codesynthesis.com>
From:   Christian Melki <christian.melki@t2data.com>
Message-ID: <24c8de41-7955-bc30-8b3c-d1278878c534@t2data.com>
Date:   Tue, 11 May 2021 15:56:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <boris.20210511152714@codesynthesis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [81.234.39.46]
X-ClientProxiedBy: HE1PR0401CA0109.eurprd04.prod.outlook.com
 (2603:10a6:7:54::38) To HE1PR0602MB2858.eurprd06.prod.outlook.com
 (2603:10a6:3:da::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.7.217] (81.234.39.46) by HE1PR0401CA0109.eurprd04.prod.outlook.com (2603:10a6:7:54::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Tue, 11 May 2021 13:56:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4624c148-df1f-406e-1aab-08d914849b25
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2858:
X-Microsoft-Antispam-PRVS: <HE1PR0602MB28586C08E64B3934F13B03B4DA539@HE1PR0602MB2858.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W/+gVjk9XgBa8lvCmBUj0G4UHzj8Vfy6ujzrQ46gjMDMOXI+Ax5hUU2IryYXKxjzuGiizXMq9vnIvHstzVpGgy78TpIJQCJvzjUfPj1acu9/uOxXuCPPXARK43dTXzxu4TnHpJtedsbXtop2JElbZB2xqCixyK4JRCcAjMCyJ9bGUT6y54+vefpsJLC57FZ45Sh8/VQ5z0XgZn4aYAFzQMcMob4/GirZB5tfh0g6o/yQB7GImGogj1bnqG7jUzXrAjC63k+yUBmtchX93vieyRua6WHYee/0HpERJdeGcYcHq1VuranBlfKp3URjvGw1oXiWK8BAN5GaPocj4z4SgoVv4IPQOsOVEVYX9j4o/3WGrIxG6+cqzwGXc/Iim2MDcHbfD30PBNn/gRAackgMDXoPvSTx3dJu7CqjvWI7H6+xzRxhJhwhQi0QkqY1HPtSv3YVeUd1qZ0g8hsxbZrIQF6nDaTOQffX1VA72z2+gvscr6L+KEm206TYgP4yGn3V3IH1GadUQjs15pJfpQd41atST+a8egLdGG3zfOpHZD3Q2+aPKtsNlLQZIXkDfwz7KfHtXKdCvOZIxBCrktPiOfOXYB3ZpzQYEhL+WS9LEmcKrvAeX4YC18Ek9SXnKvOFuo1SaUbtQob47YMc2I/d0z2UEO0eEnsSRNbDsPk9b3rxuBNvESVXI1Odrq1EXq3zVkT7L9PkC01vs0Wid2kx6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB2858.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(42606007)(396003)(39830400003)(346002)(136003)(376002)(478600001)(53546011)(26005)(5660300002)(66946007)(6666004)(36756003)(6486002)(44832011)(66476007)(66556008)(38100700002)(38350700002)(31696002)(2616005)(31686004)(4326008)(316002)(16526019)(8676002)(16576012)(2906002)(8936002)(6916009)(186003)(83380400001)(956004)(86362001)(3450700001)(52116002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TC9KdmUxOUd5NjZDNGdBaHFoc0dNYy9STm5yTENEbzIvQmViTWI5TDJoOGx0?=
 =?utf-8?B?RHYxVG1XYjN6OUtsWEU0SXpNWHIvWnI4c0hoUU9naFRPelRvWnV5MWh6VkhC?=
 =?utf-8?B?VE1aM1J4c0RPSVNSUHF0SDBPOGdWbVpWcmlBUDdQTGRzQzZCZUZMSXE3MXJz?=
 =?utf-8?B?TkI4dTBieVF5ckY5WUVSVnJTTjByK2hNVjRrM2ZRUVV3cWpEWERhUExMS1Y5?=
 =?utf-8?B?dC9ySUlpS3U0TnJuVUh6OHhGTHVNOE54SVJsRXBJMUNJeXlHWDFDVjBIbzQ3?=
 =?utf-8?B?ZE5vMGsyVUN3NVA5d2J1cU1saEc2ZFY3NTBZV3E3OUZrNlowUVErK2IvdWFK?=
 =?utf-8?B?YURrTEdpYVE3NlZ4Tnh6Y3RuTzJ0citieEtCaXAzeG1BMjUzcEdDRHk3UzIr?=
 =?utf-8?B?RjNhRWQ5K012U1lPcDNiclp0QjhCM3pXVE5kNUJ1dklsTUVyYzQrQzVzYlpa?=
 =?utf-8?B?UmdnR3lESkdxQk9Gb1V5S2lPM2pST3BKRldhRXpNc0FOcG0xRS9adTQyU0sr?=
 =?utf-8?B?SUd2TWxtdUMwQ2p0ZG9qWi9NNEZsS2c1S0pHclRRMUtpQzNKMnpHeFdvU1k3?=
 =?utf-8?B?TStYYlozdElETzYxaENjYWNFTGllWGxqYWxxdDRDSGZuc0dKNTBuWEhBdUtU?=
 =?utf-8?B?UlJjWVZMRTlzNkxsUHRDTjBhMUZxTzl3VjBZVlI5SkoyOGVpS2s3cjlqZ0E3?=
 =?utf-8?B?MVhVaUhtbkhYMzFaTVdpV3orc1M4OUZOT2xhY1lyVnJBb212UU5yQS9wQ1VL?=
 =?utf-8?B?NU4rYU1tT21na05LaVR3aWI3c2NKUzloclRMR01xeURKMU1reGtYN3o3alQz?=
 =?utf-8?B?VzBoWDBGL2czTHEzSFN2Z3BITHNhZjRvajdmZWJUNW1BNE4zNlgvUTl2aGNE?=
 =?utf-8?B?bFZZckRtMHBDM0RCUk1uWGVuZ3hVM1Y4eU9lRXo0ckRsZDVpeHBiN3o2d3Vj?=
 =?utf-8?B?OHA4eVNZWStFS0Q3aFoybGdaMUkwK3ArTEx6UytuS3E4MWc5MU1ZOHkwZjA5?=
 =?utf-8?B?Z3lkTUVxU1ozNHI4bEk5c21RaXpjQlg4SUdPOW9iMGZ6NVpNaUZYcXBhR3ZR?=
 =?utf-8?B?bFpqVVlOYzZDQjB5M29vNlh6YWZFY2dGRjM2ZjhxKzZaVE52YlJ1KytTY2hK?=
 =?utf-8?B?OWk2RytWNGhNV08xWXRqNkgvcVI4TnNDZ2VSdUhzV1dTdE11VDgvV2FWWHJy?=
 =?utf-8?B?UktCVnRLTW1JOTNEZG56Nzh0cDRFRkJ3WmtVdXJnd3BoeUMveUlIQ0FJR3VZ?=
 =?utf-8?B?WThtcm8zVm5YOU44R1c3ZzlvK2dNaTl6eGxiNUJIa0E1V1dOZHRqaWZQWU9B?=
 =?utf-8?B?Umt1cG4zcWFNYlptaE1QUHFCUlBRQnRkTVg5eUIxbTJEV2FmWkoyY05lNEhj?=
 =?utf-8?B?WjgxSkkvZUs1RzhaanBjazhDMitqNWtzemE3SEdYQmFFeWwxajZBM21tanRi?=
 =?utf-8?B?R3FONnhwYXRteHptSXM2Z2xoSE9RRjVZQXRhNDVMRVdrNUNTN2tTZFQxbkJr?=
 =?utf-8?B?N3NDamdxMmhzR083V2xFWk9YR1ZNRUFnNFAwd2hwdTFLRzJLeE5kcGVYL0Nw?=
 =?utf-8?B?VmdrNGVqeGFxdGlpUFNEbXFISG52U0psM013WnVrLzhpM3dQMUd2dTFlNzRw?=
 =?utf-8?B?S012ckFMVVRtNithMjlEbDZlZ1BZeVpwdW1MalF6VEt3STYzOXNzMGNkaU4z?=
 =?utf-8?B?V2ZBL0dvd1pnUmhCeHVVODZrdVc2V3djTU12bW5hVllxUXdBVTAxU0hlQS9n?=
 =?utf-8?Q?pgTgOcIun/HNC9OwVE8Y1eQb2Dy1yv1pY2q9rMa?=
X-OriginatorOrg: t2data.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4624c148-df1f-406e-1aab-08d914849b25
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB2858.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 13:56:42.2523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 27928da5-aacd-4ba1-9566-c748a6863e6c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5kxGG52+xBfzX0y/OY1IdkGLkgfYj2xLod2JTqHvh2TSYrnvyGSw0qpjY/mEulB5imviwdNe8n6V6pex539BocZDENGfFShlTlktZ7Z1LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2858
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/11/21 3:31 PM, Boris Kolpackov wrote:
> Christian Melki <christian.melki@t2data.com> writes:
> 
>> While maintaining various projects and kernels, I've often found myself
>> thinking "Why is this selected / configured?".
>>
>> Sometimes I'll find information in a disjunct documentation system or in
>> the head of somebody else. But most of the time that piece of
>> information is just lost. Configurations get moved from various
>> repositories, so that type of disconnected information also gets trashed.
>>
>> It would be nice if the configuration supported some form of simple
>> annotation to variable mechanism. Ie, part of the actual config
>> (only during read / write) and not just a whashed-away comment.
>>
>> $ grep ANNOTATE_ .config
>> ANNOTATE_CONFIG_TRANSPARENT_HUGEPAGE_MADVISE="Always was causing issues."
>> ANNOTATE_CONFIG_HID_SENSOR_HUB="Plus IIO for the Realsense camera support."
>> ANNOTATE_CONFIG_HID_SENSOR_ACCEL_3D="Used by Intel Realsense camera."
>> ANNOTATE_CONFIG_HID_SENSOR_GYRO_3D="Used by Intel Realsense camera."
> 
> Just to confirm my understanding, these annotations are expected to be
> added manually, correct? The proposed patch only makes sure they are
> preserved during the configuration read-write cycle.
> 

Correct. The example does not do away with annotations if the symbol is
deselected, but that can be changed. I'd prefer if annotations could
live a life as long as the symbol exists, that way you can follow
deselected symbols (what they were used for, if one cares to add
information).
