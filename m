Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBCE750A81
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jul 2023 16:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjGLOMy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Jul 2023 10:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjGLOMx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Jul 2023 10:12:53 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB701987
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jul 2023 07:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689171172; x=1720707172;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pU9w6ayaxUz2FaDHK5qpJj0KnrmP7Nkg9DTvHF4/Fz4=;
  b=mLBxk7kqYKP5lX7kSUzOsBfHmbxaUATrKT7o7x/NDmWyq18PywoskmdZ
   zETD8aDWkjJCpkyiwmODU0yaoUDOdbPdXLCPtD2DG1281XZxSU1vmkLEg
   VaYihsObdRRxgplGNpmgK5Ft8ifd7Zm9zS2A0r4epGQVPoTmWXOtK+bem
   PmfpdhytZOGgbq01WVABxQMOje9c4axr1S52SYEiauC0fMD36LmuP9ecT
   1Do/ynpy6AUq7aQDWx+3yEdyqWWVluLALzQ9j8pmHBoX6IPCFDq+TN001
   LNeTUK3ggARnCp9gz2aX/H7iVnHy/ibyzWdwwPAp96U/tJTL2L5y4botK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="345211273"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="345211273"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 07:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="671878792"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="671878792"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 12 Jul 2023 07:12:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 07:12:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 07:12:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 12 Jul 2023 07:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6wS7IO5bOXZbN5AwXNelONHudUuoL30xhIC/dgZ75yOr1jCNZU+rROz7BdAMNyq/JONr5weV/aPWTpYvG3w6NpUBxuWMhnWSXfL5fTVsonCaLvRFqBdgeGegGRAT2FgOa201OrGLQbbOouTSo7blO1unNQAN6e79TsfQGHt5O39su18sOADMVgLeKgQ4AWtVhFP0HDgwDLaWiS36pvnmRFAXlGpuownW3m0Sx2I4+0lBXVf+znGd6KzJd8HJGg/UncNFcoxvuDXrkqQ+b+8Syo1krA87N31WzmZweaRdhpajZCMKBOPP1mP7RpvENdFcRq/VutOTqC9Mq0ZwXj3hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxVyEGh+EEgXky8h0/Z7nkUeJ662bBu5hOEuuD67CX4=;
 b=bjr35Ar4khTSi58NblaeL5XxZExA19BbexS3i/j2OoSIkpsEU1/VPKWcTQlw3Qa7j+2MPrPdoLAnFdXtejASb8i92U8jqQa0GJqGKDoa7v9SSMro1eMm1wM3VN+mMTycoZEVlQw9DibIYW2rRDL4TQjb4mXiAehgWpsbzkxmZjDHIzwI51d/ARumwuFrwhjMDVJQA0uv814f+sjQKPTGXNToa6y8vezurBZoyipJn2Lnhv5aeAxVax7sx+Ah/S7sMRR2+TxBK5CH5Tynf5edZLm2pn9hsrwSzApOncnVWuRDin4WEyElPXc/1yv8B42jeW1bxmCg5wVShCrXZucbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3625.namprd11.prod.outlook.com (2603:10b6:5:13a::21)
 by BN9PR11MB5339.namprd11.prod.outlook.com (2603:10b6:408:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 14:12:48 +0000
Received: from DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::1ecd:561c:902a:7130]) by DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::1ecd:561c:902a:7130%5]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 14:12:48 +0000
Message-ID: <52f2cfab-4a5e-3331-424e-181860e4df66@intel.com>
Date:   Wed, 12 Jul 2023 16:11:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND] Looking for a hack to remove auto-selected items from
 .config output
To:     Donald Zickus <dzickus@redhat.com>
CC:     <masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
References: <CAK18DXagdLgwFG-ed97vVzMXC1BTCVbQrNQKXPwyH9HYy4TeJw@mail.gmail.com>
 <CAK18DXZHn28mZ-Sr5x_Lwn0SSisgcGqcBdt5MQNRXuNVYbnKZw@mail.gmail.com>
Content-Language: en-US
From:   Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <CAK18DXZHn28mZ-Sr5x_Lwn0SSisgcGqcBdt5MQNRXuNVYbnKZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0263.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::12) To DM6PR11MB3625.namprd11.prod.outlook.com
 (2603:10b6:5:13a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3625:EE_|BN9PR11MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: 03315e00-b3ca-42e2-7181-08db82e21249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPy1/3MlSJVvKSwBWnt7uasulcp4SjOlSw4fSVSx4DwzH2lo7JF8sir7ZJVzFDFS8+YQ5oDD2Grj0RHcisai8O/3M8EEQvlCSRFndo751Lc0xn53XJXx64FbmHUr441j6mQIFlZlzxuTU2pk82+nrGl2A+9goEmjbo2vMV/JNWDVVcnHgcbPOdUfx1f1HgiUhlmcIYoe034/1hNt0kL8QpPSHtxSkosG+AtoefFJQFOS9bR6v2fgCs/+FRnIMLVwrgX8Dk4ICafztB1rk+sVYp/rz6xl8hldmrRbfP+DhAe6OLA0Www6uv3KFxLZwaE1QAcTKrl4XOJiKBknJN/sYvRe8Rq5R6o8X9mdjJtbnyIN5GaVUG0JL8Ee3H/vR9qCejObII3utC3+Bp8vHGFY6HEaYTPAc0aNfNa3s9SQ3KKHr3lijEi2jtjRAX/TooTpyBxkUohYpmbP6bPShhUmFBgZHj5fz6PFf+BF5YP0+8FplJ7tKuP518VeNCJpnUEX8y1UzsuTIk//nrtNX4tJUyLp9v5b5gf3lUv6n0Lnqv8vDszv+kAhUYoY6jqmt1qcESM4D23UYzfKkqg5BXgWS2RRoub7y6f62Ly/F25zjkPRQKF5ES17wZxLcHjKeKOPMblPK42ZSy5f/XbZ63q08ON3Ihl8GDtmpQjnsWmg0RM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(6666004)(6486002)(478600001)(186003)(26005)(53546011)(6506007)(6512007)(2906002)(41300700001)(316002)(4326008)(66476007)(66556008)(6916009)(5660300002)(8936002)(8676002)(66946007)(38100700002)(82960400001)(31696002)(86362001)(36756003)(2616005)(83380400001)(31686004)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEttN2xaM3lLaE5kS2RzTGQxYmxod1k1eHlQMjdIS0xWRC9CRzFjcjl0b1k5?=
 =?utf-8?B?TDRGT1daRlZOYnBSVjFlWVFRVlVvVnhlY2ZLTnlrdFBpQklPVUw4NXh4cmNl?=
 =?utf-8?B?VmJ6ekNZUDBNck9nc095Uk94dC9QV3ovSE1Dcm50bkV1bWtuNmFiYkpUS3Ry?=
 =?utf-8?B?SzJrY1BLTHUyMW04REF5cWtZNG54RDFtbDdMTDRtdVhsVy9hSHdZV2wrZzRD?=
 =?utf-8?B?QWd1MllaVTJocGxEUTg0NDRrUzdWZVB3Z29xYlV3K2JoQ2tVWUhsaG0wNUZm?=
 =?utf-8?B?MmxWdkR1NE8yUjRxL1UrMVd2VThHUFlBVkFjZWNyQUg4RnlJSWt5TnYxOVR1?=
 =?utf-8?B?OGlCNnpnQzZaampJRzA2Q0ltNE9HcG5ZYkFodFVzRHFHMXRpc0JBNFBxd280?=
 =?utf-8?B?Q1UrSGx5TVI0OHpZMkgzcjRUVWVuWWppVG1rVTg1NFhrWW1WTWNrRnQ1ZGha?=
 =?utf-8?B?RUNpMkFnMktZSXNDczh0QTVMSW9CWUhnWENlVFNwTHNkWjZzcWJWbzJ3RjQ4?=
 =?utf-8?B?VDdEcXZRT01GdG5qMWM3a0dmQloySEhiN0p3cFViaEw2UytiVEdmU1g0UDBo?=
 =?utf-8?B?c2lRWVZaUGlQYm11Y3BZT2IvaWNPeFd3SVErSEpBNGJmeXg5d2FKdDU2WmRG?=
 =?utf-8?B?STNxQzFxZFl3ODI3bVdwamIwaXF5K2lLUng2R25ibzFqVFBrcGMrajhWTEVJ?=
 =?utf-8?B?SkRPZDBoR2NsMHJ4UCt3MGI0RVpsL3lncDNYcVFFL1o2LzZzUlpOZDlJODha?=
 =?utf-8?B?TmFBVGtkWmxYbEllanlOR0t1allqSGJMSm9mMEVYNE9FcTBMbVRoYWh1TGFB?=
 =?utf-8?B?WklPYVVGeHRMSVVjaEdzendKVng0aUo5NnN2L1EyUnFMMHgzRlVrYzNaTysw?=
 =?utf-8?B?NkZnbjFwSWlYUms3UzNWUXhBR09PRlQ2MTRRNVJmZ1pUbjY2bXFycTZtb3Ri?=
 =?utf-8?B?dEdOSTVnbjZUV21UM2NPMWVmc0lnSm45N0J6bE4rUHVFRDRhQXkyUndRbmFz?=
 =?utf-8?B?QmhpMnNKb0hncmV3UWdsQkRRT28zRXFUalNHdklSOXhEUWt0dFdkZUR1dTZ0?=
 =?utf-8?B?c1FwNlNHQkJ6NG4vejBZWDdUTUw4SVNJUmRCWWtTVm5NZ0tOOUlMK2w1NTVr?=
 =?utf-8?B?dFJTSDZGbGdObCtzWFk3dFVFN2ZKQTcwM3FxTFIrSlZNOE5yNTBiZTZ0N0Iz?=
 =?utf-8?B?WWZQbHFyaFFVNlBXamMvc0wzbDF3QWdMOVVVQzFpckQ4NUxIZGE4cTdVZ1FQ?=
 =?utf-8?B?aXBNajJLSVRnNUs5YlhLZjNtSXhVTkNiclczYWd4b3lRcjhnTFloR3RYc1Fp?=
 =?utf-8?B?WVFHL2VZaFZTMFJ0QmVhOVJzNVBZNlZ3N2dwY3AwZHFWUHhaek54TnNadWw2?=
 =?utf-8?B?VCtaWStYYTRtb1ZSYXV0TUc3aVdtR3hhalg3Nk5XWFdnVVlYRFN4ZXlvT0lL?=
 =?utf-8?B?Ukd2QXdJVm10SmJ0MVI2UkJEdzJWdkVzbk5kaWl1ZE95TzU4TW5BY1V5K3ln?=
 =?utf-8?B?MnlJK3JyVE82aCtmYUFYaHVpZmI4b3RIOTNSeVNvTW9xbG05OGcwUFF2UVVM?=
 =?utf-8?B?WjMrVEh6RmRYcnFaWmMrQ3N6UkkxNzFWKzFJbVN2clg0K1pYaDRrbU1xWXlm?=
 =?utf-8?B?M0NoTndVOGlZTVZ1UnJkMmRLYjMxempkTURyNGEyczdqcitkTVhLMnVwWElm?=
 =?utf-8?B?UWdCTHV5ZENSRXU2RGtEU0k3SVlDWXdRbk83bUlOV2U1NmM4UDZNSS9tbVRX?=
 =?utf-8?B?WG1ybzEyWUNwU1RTRndYWHRBNHJxbmszQUFobUlhQ3gvMmsxejJ6bjZoTHZo?=
 =?utf-8?B?THZGN3dhVm9jdU5KQTFBQmxiMzdzY3NHSFNLcnovNWYwc3hEUW5Bb0VkbVZB?=
 =?utf-8?B?b1FVdGl2dkdIYzJsK0V0YVZ1YzFsZW51R2x1dlN5R29xQUZUWVh4WGpSMjA1?=
 =?utf-8?B?Nk1aU1pIbTJxK1NzSVNqTzNNNW5jaExrV09xalpDeTNnK0F3d2ZtT1NUUmNI?=
 =?utf-8?B?aFNxV0lQUU82bjQ5d2lZQ3NPN2t5QnZLSHZqZW5FUjNsWlB1eWlaVE1jNm5o?=
 =?utf-8?B?eXNjbmZteGJTOUIxRG1hNDVpZGpISDk1VzdDazZhTXdkS3lUNHkxUzArQVBa?=
 =?utf-8?B?a01MTmN3VDNlbHhOVmhpRXVodk5RZVUvNllscE53c29zVUlGYnJ5U2x6TFVp?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03315e00-b3ca-42e2-7181-08db82e21249
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 14:12:48.6622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJR8dentiVuM2Gx33TVcvhDheUxKzD5vbfqHDwNKJRGqul0KSRHtJBi4jVlN6SsEkRmfZ7AB+hGnZDN4rWj+po8Pi5c/F5eSCkT48NgD4x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5339
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Donald Zickus <dzickus@redhat.com>
Date: Wed, 12 Jul 2023 09:58:35 -0400

> Resending without the html cruft to pass through the linux-kbuild mail daemon
> 
> ---------- Forwarded message ---------
> From: Donald Zickus <dzickus@redhat.com>
> Date: Tue, Jul 11, 2023 at 6:27 PM
> Subject: Looking for a hack to remove auto-selected items from .config output
> To: <masahiroy@kernel.org>
> Cc: <linux-kbuild@vger.kernel.org>
> 
> 
> Hi Masahiro,
> 
> I am trying to cleanup some stale config data with some of the Red Hat
> configs.  Like most distros, Red Hat sets a bunch of 'menu choice'
> configs and then merges them together then runs something like 'make
> olddefconfig' to autoselect the rest of the configs.  Been working
> great for many years.
> 
> Lately, we are trying to audit the configs and ran into many stale Red
> Hat set configs that no longer exist upstream (removed, renamed,
> whatever).  Ok, running a script detects these and we can remove them
> by hand.
> 
> One corner case we ran into is dropping configs.  Like upstream we try
> and match the merged configs with the final setting from 'make
> olddefconfig' and fail if there is a mismatch.  However, not every
> config is applicable to every arch, so those configs are dropped and
> we were always ok with it.  But now those dropped configs are
> confusing folks who think configs are set but they are really dropped.
> Yes, a Red Hat problem.
> 
> I am trying to untangle this.  Is there a hack I can use that takes a
> generated .config file and removes all the 'selected' and 'implied'
> options out?  Leaving me with just the minimum configs that need to be
> set?  Then I can de-merge it and re-create our original set config

`make savedefconfig`? It saves a very minimal config with only manually
selectable entries, which differ from the default config. IOW, if you
take the default config and then change only CONFIG_FOO, your config
saved via this command will contain 1 entry, even if _FOO also
automatically selects _BAR.

> options.  Basically reversing the normal config generating process, I
> think.
> 
> Not looking for anything complicated, just something simple I can quickly apply.
> 
> Thoughts?
> 
> Cheers,
> Don
> 
> 

Thanks,
Olek
