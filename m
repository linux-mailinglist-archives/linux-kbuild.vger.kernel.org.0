Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58DC4753F41
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jul 2023 17:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbjGNPr5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Jul 2023 11:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236142AbjGNPrz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Jul 2023 11:47:55 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E963595
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jul 2023 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689349672; x=1720885672;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WV3u+NAwjiUDXYF6LHzMfic8WzjsEJjyZyQJn5GFU6I=;
  b=mVl11LgBMAHQMgjBJ213q4vrNgiEYUtWdm/v4QdvyBoIxOhOnW//ydtH
   x+gd9nzWnRLQpiHXnKI0PuMY6JcjvXsvGwowmj63quM2ZHFdMC+ODLMHT
   r2rHOBKUwavhAXkdNzBYmNJj6IDxcmRs/6sWeWTIn6aeRMNZwcnlsmkNh
   OKiIWe+98Z5sk7NMXIY+YOmLjvTNRQ8DgjTA6/zE/l0jUMdcVokUusqEM
   abtdlRbVDkInEJ/AMCTYlPrkeHUZL1YtHYD2HK12TJWMFwZcNaM9WLbkQ
   9T27f74K0Eyd2DDJFeweZrMqcUUKS2vK6c6fCA5Q6tLAq5lyRLrkdHHuW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="350372688"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="350372688"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 08:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="699716119"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="699716119"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 14 Jul 2023 08:47:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 08:47:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 08:47:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 08:47:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 08:47:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lR0DbW2RkqoRO54PA63AuyO51YZJJ+M9dVXeWOa2/r7bSKXbqQKEAIwJh5WRCawxNG9N+dtfDsEpEnS4ffhohY4xKr3Wjpz+0iiARe5ttl5iwBuz9qW6tAHqV4Ju/Knc8juXRMq80ImaDO1t/VT/pKCbql1NegM8y+a4KVHKW1vS7lDRt5FjADf38Ic/eVpb8lOkJzq4eAxXtbuDXWDkejI3gWMDwJeZ73u1Nu6fV3BD/wFkl+jRbj2U9MDeCVEbdIzLKEhCv6JiZEbatYlfk3eWNihh0hPUWaOVV/5gP/c8CnwiCV3f82PAGw35s4ioxzYf1p5LJMR6kXIfoOksjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKnF4btI+45YpkEwozG7D/2ZHDFpR2hYSDIDz2f87HM=;
 b=V3UGNBP8Tvnq0I8fMx48fsiK3h15opvRJQO1BSlKop7v9K3y/GxaQORO+ow6Sq3Hk8qtMdRxlKOIBeZCYhOnkStjbgxg9Jngj+DoX6BQVOTvzN3Z83mDi2VVADKT8JkIKyXf+0X0YasuJ7f8nRXv6w3CSI7wMEOiyG92KQqWg3gmvwohwWdKFpjTmOqTb0EkfHD18GlPyrArq6j+Ulz4uXG6oIF88iKmVum5PgGgLtMzYBhTUJ/jiW0vga1Y7KRa2ZuPUu8HF5Vn6Q3/eLEtuSg+Ge5TDCmPGH72eSKyZ/F+zEyRSaGeiuRQbxbU52TNOg7e0eAsbw8+EMZAiYcgJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3625.namprd11.prod.outlook.com (2603:10b6:5:13a::21)
 by PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 15:47:29 +0000
Received: from DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::1ecd:561c:902a:7130]) by DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::1ecd:561c:902a:7130%5]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 15:47:28 +0000
Message-ID: <b67be77a-9c2e-4e61-91dc-9517d6bc41ae@intel.com>
Date:   Fri, 14 Jul 2023 17:46:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND] Looking for a hack to remove auto-selected items from
 .config output
Content-Language: en-US
To:     Donald Zickus <dzickus@redhat.com>
CC:     <masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
References: <CAK18DXagdLgwFG-ed97vVzMXC1BTCVbQrNQKXPwyH9HYy4TeJw@mail.gmail.com>
 <CAK18DXZHn28mZ-Sr5x_Lwn0SSisgcGqcBdt5MQNRXuNVYbnKZw@mail.gmail.com>
 <52f2cfab-4a5e-3331-424e-181860e4df66@intel.com>
 <CAK18DXafQ=ofjMyBxa+TCjvrxk183p79H-UwNBpo33L4yar8rw@mail.gmail.com>
 <CAK18DXZHATtbJ_zWaPpkW5OfU3XpYCs6U+Lznvi+zFkfUQYGxA@mail.gmail.com>
From:   Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <CAK18DXZHATtbJ_zWaPpkW5OfU3XpYCs6U+Lznvi+zFkfUQYGxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::20) To DM6PR11MB3625.namprd11.prod.outlook.com
 (2603:10b6:5:13a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3625:EE_|PH7PR11MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: b1df4dce-0dfc-416b-0a5b-08db8481a070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tl4isyH+ms8L2ixZbBxESpJOOYNdCkYQ1Myk8GT2WExj+j6AyHZ1G9KYXBeLFnrSJL1KSPM4y6KNV7vImHaw+u0EIUhAZfVzs4M4g2nMifpq42AdaEgvTqHpsaG0F9xDAUSouEkmxvAHub7KgS4NWHzLd1+4jjK4Mm8M5uFMjw4onau0IvUVXBMpz8YxxaVmewnskHJR1BCeOW7XV6sztDLNGxnx83+JLmpLoPxZtWnneAgWUx20PiOCK8orKnT3xXgwZ9mdu15pCDa+7Uu0zZ0pminXtLWATB45zsUjg8WOVnX1+QKV83jo4qu31sB05B4rAla6EfsftkzoxqOzgJ9Fmv+fScIVR0vKvZq5i6yOcQ8qXxUMfM7rjnCWUi+FHKFRHot8nkFdsjJxJSmTAGm9vuS/R8pl8gL1KIwEcFHJQQ8SnqNBZo7iQj6CCfAIKRKFpkr0PFM9Ow5L0b+7ybv+M6foDXA9DcTNJ3KipYYPO/VK8cg8zG7np9dBzAVzy+9WknHH8F9ZBIvXHUI3xMlQ7jLw0lIv00KBlp00av7qtDzzMbS0EN6fUoaZsZTdYMed8Fy8IU88R77lZdTC7wO4conmhQBkYhfWWjY2WfZ/pecksRThTmD2jq1ZJG1k0DrhS8DbNjCX81aLzOdQYdSHhqg0n7Fgmt4NgSg1ArA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(6486002)(6512007)(6666004)(6506007)(186003)(2616005)(53546011)(83380400001)(36756003)(31696002)(86362001)(38100700002)(82960400001)(26005)(4326008)(6916009)(66556008)(66946007)(66476007)(41300700001)(2906002)(316002)(31686004)(5660300002)(8676002)(8936002)(478600001)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1Z4RW5aYmc2MjNPdzdaUlZJdnY3bHZBay9pRFhUWnR5d2Ixd1Z4T2xXYnNB?=
 =?utf-8?B?UjVNczBQUkxlbE1MTFp0VUpNZ2FDcEx0cUxxZ2M5UDhQMGJ1Y0kvbnAzOFpE?=
 =?utf-8?B?SEJ4QXBueFp4L25IcmdRZFVjMTFNMmFGejNmMVVZVk5saFdrdSthc3ljWGQ2?=
 =?utf-8?B?RDZjZUpXZnk5eWVCdmlYdlNrU0toME1mZEpHMmtZS3JZSVNZQnFvZ1dHYzlK?=
 =?utf-8?B?TnVjbitSd0tUQ3hsanFWV1ZKNXBldVlJY3c1cVcvdWR3K0g2bjlGNU9makVL?=
 =?utf-8?B?eWFMWERkNUd3bVpvamlLc25FZ2I0UTVkeHFTNFM4UmxoTEVUakdRcVQ1c0Q3?=
 =?utf-8?B?S2hQeGFwZG1LRlRrMnpiaU9mSk9DVkJxb21ZdjRlUUpaM3B3SE9NY2xpc0Z0?=
 =?utf-8?B?d0MwRWFIc2JmWmpHN1ViK0szdWhqM2tuTVQvTzl0Q2pHMk5zVHJrbHgzTlhS?=
 =?utf-8?B?aEpwdEVEVmhpUG04TTlYRnMwOEhzYWFPT2V5VmhlQTJHbjVHM1I5ZVJOT1hm?=
 =?utf-8?B?QXVRS0Y2RTQ2dElGVTZBR09SWUhQWWxSRlZTQWVmN3RFNDJFK09CZlFSL2I5?=
 =?utf-8?B?Y2VFd0ppeHEvdjljNkFpWDlDTXFoK2h0d2hkSjhWRzNoZlExVGtNMExrVjVn?=
 =?utf-8?B?TWNjSEtlYlV6aHlra1VvY1VTV3NERXFILzhQKzhHR2lJbCs2SEJBTG5oSTZq?=
 =?utf-8?B?S1VaWU9kWElzSjlmSkFHVmtmZGhva201Q0NYUDd2dXVKckhVaWJ2OW4yOEpr?=
 =?utf-8?B?aG5WeGZDM3hjVjgwZ3dZRVhRTVRER29nM0NmS0xMemN3TXpMeGhOdTltY1B5?=
 =?utf-8?B?RmhkamYySFRrWWRSdGpsbzRJcmlkNW1SM21Ud0NVeWdrNGU1ankyMERGYVE5?=
 =?utf-8?B?OGpPYUljT1MvKzg1OGVtVHNvQVdkQjRQdUpJY3J0YnRXczRwWk5HVUpnWDN6?=
 =?utf-8?B?ZENZZjM0TGp1dHlmbDN4OG1kZmdaWG1rZTRvbnFRV3RCRGdrcDF4MTZpc1cv?=
 =?utf-8?B?QmUvMWh4QWljWjJnaTJBZXJ3dFJ6Q1gybmtuc3RpT3YzYjEyMW9IZC93WCtM?=
 =?utf-8?B?MU5SSkxwQzZzLzVtd3RIOGpDVDlUbXBHc3o4Ly9Rc2RUK2M2cXgzQnArQWEr?=
 =?utf-8?B?TkhBNWMyNms1SUs5TGZ5MnkxTlN0S2szT0V2d256K0ZxMFUyeHh0a3hpSHVQ?=
 =?utf-8?B?QXkwMTBtYzRLaS8yMGVtRUkwUGNsSUN3OHdGcmhBOHR1UFJGNmFaRERYbHZY?=
 =?utf-8?B?OGRtUXpnZ2x4SG5nWExFc2lZSW80SSt0dFI5akFHQnFXK0pvbURGdlArQWpo?=
 =?utf-8?B?VW1WNE1BZWVrdXNodDM0S3NrdjJIZHFVNjRiWGpMVkNMSWNxSFFibG1WVmtK?=
 =?utf-8?B?WjA3VEJ6VVU0MkFwb1dtZitVQmo5akRrLzdlZGV5aS8wVjcyc3d4Uy9zZS9U?=
 =?utf-8?B?WVR3OWxPd2lmWWRlUGI4c0FGT1hVSnM1TFR0RWtSNnRhZmU0RUdUa0NkYVhj?=
 =?utf-8?B?NlhEWHBKWHp4VzdTMk5lRWZlWHdLZkROMFZidnZ6TmRINlg4VGNWbDBDZmJm?=
 =?utf-8?B?azUwT25MK0EwNjQyOUE0dzJXQ3Q2dUhNTnNqZVhhQk4wTlNGL1BLRDhGZmxT?=
 =?utf-8?B?Z1pyd2hRQXVwb3M4WVhmaHRiZ0puWU4wdkZjWDhseTF2N0hsYW9kL0JiNXlp?=
 =?utf-8?B?ZWhGRVdLazduckF0VXJrQWNqcFAxRGpNQzV3RHRkS2tZZVF2aloySmRJQlFo?=
 =?utf-8?B?M011MzMwRllTbjAvTDl3aU5DNXZERmczYWtKeVd6Q1I3REFUMURPcVlkL0VL?=
 =?utf-8?B?V2FzaU9hbTMzTzVnV1ZBRmFadW9HdEJPMGs1VmZPY1hzelR5V1NIT1hMdDVz?=
 =?utf-8?B?NGNDV2ZEdFBBQTNMRFRDWllDMHVhZ2ZqQkxsRCtpUHVDU1YxRGMzMmU5anlL?=
 =?utf-8?B?dy94MUhWeFBDRWRZZnpCN2JNdkpwbnM3eGtJcVZiamRoc0svZFNHV09Dc3BK?=
 =?utf-8?B?dm5Uc29PaXl0a0VXSGRGTWo0aEV5Tlo0NkRNdCs0ZFEzK2U0R0dvaHdiNTNp?=
 =?utf-8?B?ekp5MFY5Y2Vub1JLT3NaOUJKMUJIeXhxWFZZanpJNnNWQlZqYWl4N21LNVJM?=
 =?utf-8?B?ZFhNUHlWSVV6Y1FnMFhiYk5kMmdPZHdyMkptV3JpT0lBZHVOMWpMNXoxbW1a?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1df4dce-0dfc-416b-0a5b-08db8481a070
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 15:47:28.2729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plCGiYaWwH8HdeD8P2DD87V8T8sZPh1YYfLx6UP+Eo6KcUXjxbL1O+4LemE8Itqt0G6+6h1zw6s8Gt2/F1XqWPu+vdmnUKb90OUNQLHpNVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8478
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Donald Zickus <dzickus@redhat.com>
Date: Wed, 12 Jul 2023 13:32:43 -0400

> On Wed, Jul 12, 2023 at 1:31 PM Donald Zickus <dzickus@redhat.com> wrote:
>>
>> Hi Alexander,
> 
> Oops.  Hi Olek,
> 
> (sorry about that!)

No problem, both of them work just fine :D

> 
>>
>> On Wed, Jul 12, 2023 at 10:17 AM Alexander Lobakin
>> <aleksander.lobakin@intel.com> wrote:
>>>
>>> From: Donald Zickus <dzickus@redhat.com>
>>> Date: Wed, 12 Jul 2023 09:58:35 -0400
>>>
>>>> Resending without the html cruft to pass through the linux-kbuild mail daemon
>>>>
>>>> ---------- Forwarded message ---------
>>>> From: Donald Zickus <dzickus@redhat.com>
>>>> Date: Tue, Jul 11, 2023 at 6:27 PM
>>>> Subject: Looking for a hack to remove auto-selected items from .config output
>>>> To: <masahiroy@kernel.org>
>>>> Cc: <linux-kbuild@vger.kernel.org>
>>>>
>>>>
>>>> Hi Masahiro,
>>>>
>>>> I am trying to cleanup some stale config data with some of the Red Hat
>>>> configs.  Like most distros, Red Hat sets a bunch of 'menu choice'
>>>> configs and then merges them together then runs something like 'make
>>>> olddefconfig' to autoselect the rest of the configs.  Been working
>>>> great for many years.
>>>>
>>>> Lately, we are trying to audit the configs and ran into many stale Red
>>>> Hat set configs that no longer exist upstream (removed, renamed,
>>>> whatever).  Ok, running a script detects these and we can remove them
>>>> by hand.
>>>>
>>>> One corner case we ran into is dropping configs.  Like upstream we try
>>>> and match the merged configs with the final setting from 'make
>>>> olddefconfig' and fail if there is a mismatch.  However, not every
>>>> config is applicable to every arch, so those configs are dropped and
>>>> we were always ok with it.  But now those dropped configs are
>>>> confusing folks who think configs are set but they are really dropped.
>>>> Yes, a Red Hat problem.
>>>>
>>>> I am trying to untangle this.  Is there a hack I can use that takes a
>>>> generated .config file and removes all the 'selected' and 'implied'
>>>> options out?  Leaving me with just the minimum configs that need to be
>>>> set?  Then I can de-merge it and re-create our original set config
>>>
>>> `make savedefconfig`? It saves a very minimal config with only manually
>>> selectable entries, which differ from the default config. IOW, if you
>>> take the default config and then change only CONFIG_FOO, your config
>>> saved via this command will contain 1 entry, even if _FOO also
>>> automatically selects _BAR.
>>
>> Oh neat!  Yes, when I combine the output of savedefconfig with the
>> output of listnewconfig, it appears I am able to create the minimal
>> config layout which exposes all the unnecessary cruft.

Nice!

>>
>> Thank you!!
>>
>> Cheers,
>> Don
>>
>>>
>>>> options.  Basically reversing the normal config generating process, I
>>>> think.
>>>>
>>>> Not looking for anything complicated, just something simple I can quickly apply.
>>>>
>>>> Thoughts?
>>>>
>>>> Cheers,
>>>> Don
>>>>
>>>>
>>>
>>> Thanks,
>>> Olek
>>>
> 

Thanks,
Olek
