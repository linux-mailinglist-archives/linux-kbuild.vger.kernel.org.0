Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7644C158FF2
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2020 14:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbgBKNbj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Feb 2020 08:31:39 -0500
Received: from mail-eopbgr30103.outbound.protection.outlook.com ([40.107.3.103]:20870
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728095AbgBKNbi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 08:31:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go8X1JY37vjB2M/NBXAM/cgV/y8IF4FX0/beqZhHYtpN7UJP+tlxt2gxyCp4Yb5adAaqh009n76zUOHMegVMO6Phv+V8M/yELz52Bh1/VVD4/pAbG3tpNsW7D3PSm9YWfbxIbADw23Sy16BQj2wc/aGCMqyPAQt8Zs1kA4FVp0zUh315AlHImTc/frLW2HikBk+cfLsghFIh443uvVkpweVBBd5Nvs3Lnk909os4a5Ctrj+67/t+XKmwaw6j3iJVYbMInaOvoRGmKRiYJzE61fm+3Qk6Qs97bs8zfAMJFye76i5UedRyFu+AXQOT6gwim4HoQhvI223pGLBz9qdeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW9b98jfzE1m1NEK+gnDwruIQVPzg8kRLhQkJLzRjyw=;
 b=AcfwC/xE8DsCVJcZ2hANbY5kXUDuiAsXOD4k6Zg9o8oHr7BruCPhPRvaO29d0udQz60rT/ZKGoq7rHaaaEHf0N0mVukysi0A1oTj+j0pM+jKOToHFEc6Sq0ZT+Fo/Z/4C/KpzyEVE+zXkSwDyQr0/yCwzAS5J4aBnV9sY8yuXM2F2RK2OXIqFJOjjuw9eONvbVAH9upnVpIYFhypZshArYUmJPxGs5Jg//1kepgzcC1uQmCi1FDEp0ui5L7EzmH54TUsw3uVqNGMqHFNESUXg/1p6VrKJE7+0VF3qwWOfpR4Lo4l7nO+xfWu9kjGoI1X+o1N9tWDJ9+wGAg56R5b/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criteo.com; dmarc=pass action=none header.from=criteo.com;
 dkim=pass header.d=criteo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criteo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW9b98jfzE1m1NEK+gnDwruIQVPzg8kRLhQkJLzRjyw=;
 b=aPD1dTipvCAJGN9PdOzY0eo1Tlu+bWzj53TSKNXkBfyCSKnhXJOvkyEKbPtzfm4kDuPqUIx/7uDIJgWxHIwvqEVdBjzHJCs3zHWpLC5I/oSDD7N1UOFYmTidc0oOlpUk8l78Boq99XbqkC6POfRfCtWtmu5OvFd9iYh7wGY0ae8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=e.velu@criteo.com; 
Received: from VI1PR04MB4926.eurprd04.prod.outlook.com (20.177.48.80) by
 VI1PR04MB3981.eurprd04.prod.outlook.com (52.134.123.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Tue, 11 Feb 2020 13:31:32 +0000
Received: from VI1PR04MB4926.eurprd04.prod.outlook.com
 ([fe80::99f4:5892:158f:5ae4]) by VI1PR04MB4926.eurprd04.prod.outlook.com
 ([fe80::99f4:5892:158f:5ae4%5]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 13:31:31 +0000
Subject: Re: [PATCH] firmware/dmi: Report DMI Bios & EC firmware release
To:     Jean Delvare <jdelvare@suse.de>,
        Erwan Velu <erwanaliasr1@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Changbin Du <changbin.du@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20200207083550.360461-1-e.velu@criteo.com>
 <20200211142112.649d7237@endymion>
From:   Erwan Velu <e.velu@criteo.com>
Message-ID: <ba5b88c9-f056-9375-d1fb-7832c76db29f@criteo.com>
Date:   Tue, 11 Feb 2020 14:31:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
In-Reply-To: <20200211142112.649d7237@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR3P193CA0060.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::35) To VI1PR04MB4926.eurprd04.prod.outlook.com
 (2603:10a6:803:51::16)
MIME-Version: 1.0
Received: from [IPv6:2a01:e34:eecb:7400:b6c8:62ed:7424:4b8e] (2a01:e34:eecb:7400:b6c8:62ed:7424:4b8e) by PR3P193CA0060.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23 via Frontend Transport; Tue, 11 Feb 2020 13:31:30 +0000
X-Originating-IP: [2a01:e34:eecb:7400:b6c8:62ed:7424:4b8e]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c6cedf8-0bea-4f72-5202-08d7aef6b4db
X-MS-TrafficTypeDiagnostic: VI1PR04MB3981:
X-Microsoft-Antispam-PRVS: <VI1PR04MB398111C466F2722032948490F2180@VI1PR04MB3981.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0310C78181
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(199004)(189003)(186003)(16526019)(31696002)(66556008)(66476007)(86362001)(66946007)(53546011)(7416002)(2616005)(31686004)(36756003)(6486002)(52116002)(2906002)(4326008)(316002)(110136005)(54906003)(8936002)(5660300002)(8676002)(81166006)(81156014)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR04MB3981;H:VI1PR04MB4926.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: criteo.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8LIDclzpyAr8+TGW/wX6VweXjfCo+4roJbJsV3XDG8SXfG2HycWcB+weV0QPu2OHUrILVSNF1juq97E83HqO3Emha7GgZ59/bT3IfBGmOJUDzBIKdv1AA5PaH/0T66Q0O8NCN5gA0a6ColnWKBybIZPQoZuPi5reAWFPvac3XwaFO37oIi5vOV3LDQWLBjctJnf+QVj7ZArsJYseLXFvxpYnsYQMV1P3vXC2CR9QVJ5f0YP5xIiPtvCqPa83Qty8Uaca9OuJW0gJR3v+N7WQzAkR3pBhInheDaiiwqbxUuAMu2HxFtPgJgYvMo9ijs1gieOKatlNvpmA2E76yJntWQ5LRzrDR5Ti8m0kQhcoi4FXR6M8Zfs7KG7t+oOZ2vnF6ZHnjnyDvOZ9xqTAk81dTGpeHFKX4u4FJ75ghfAH79Op8Iv6sW48lXKxeCGfBJnv
X-MS-Exchange-AntiSpam-MessageData: 2Ilfp3ublK2w/4iW5pXAdrKom9/uG6eYmdJJuzuOAtfozyQEiKk70ThARY42Fset+zSO4lOgTxxHgboAnV23z//9UyoChB1ZQZUEloLolAoXm+sa2mX6gJ4e0Eg9HSrw/wMhpFF+S8qstgbZuBkMChv1Mha3COna0wlqM3msNPTNvpSjtq8L3GflubvlbzfWOPcLQlrvttsWdx0Fh3Esbw==
X-OriginatorOrg: criteo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6cedf8-0bea-4f72-5202-08d7aef6b4db
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 13:31:31.7543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2a35d8fd-574d-48e3-927c-8c398e225a01
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCO4JUa/LHfvJuiBvcOo5JllSkxz8RL9qG4ZmLai8u7S/Aom0XMsjU4NdR8+tJt4ydsF2bA4HUvv8MxeiF78SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3981
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

No issue with that.

Thanks for applying.

Erwan,

On 11/02/2020 14:21, Jean Delvare wrote:
> On Fri,  7 Feb 2020 09:35:47 +0100, Erwan Velu wrote:
>> Some vendors like HPe or Dell, encode the release version of their BIOS
>> in the "System BIOS {Major|Minor} Release" fields of Type 0.
>>
>> This information is used to know which bios release actually runs.
>> It could be used for some quirks, debugging sessions or inventory tasks.
>>
>> A typical output for a Dell system running the 65.27 bios is :
>> 	[root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release
>> 	65.27
>> 	[root@t1700 ~]#
>>
>> Servers that have a BMC encode the release version of their firmware in the
>>   "Embedded Controller Firmware {Major|Minor} Release" fields of Type 0.
>>
>> This information is used to know which BMC release actually runs.
>> It could be used for some quirks, debugging sessions or inventory tasks.
>>
>> A typical output for a Dell system running the 3.75 bmc release is :
>>      [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/ec_firmware_release
>>      3.75
>>      [root@t1700 ~]#
>>
>> Signed-off-by: Erwan Velu <e.velu@criteo.com>
>> ---
>>   drivers/firmware/dmi-id.c       |  6 ++++++
>>   drivers/firmware/dmi_scan.c     | 30 ++++++++++++++++++++++++++++++
>>   include/linux/mod_devicetable.h |  2 ++
>>   scripts/mod/file2alias.c        |  2 ++
>>   4 files changed, 40 insertions(+)
>> (...)
> Applied, thanks. Note that I went for "efr" as the shortcut string for
> DMI_EC_FIRMWARE_RELEASE, which was your first choice and has my
> preference.
>
