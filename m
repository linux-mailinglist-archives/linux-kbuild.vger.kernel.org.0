Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D933CEFD5
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 01:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348100AbhGSWq4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Jul 2021 18:46:56 -0400
Received: from mail-co1nam11on2058.outbound.protection.outlook.com ([40.107.220.58]:22113
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1386838AbhGSTke (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jul 2021 15:40:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LF/iMNc6E5xxFcAueJZraUN5ZT0egCaAESf9FrN8KdqyIQtVnoXdIsoqB9O2uNLpqAuJ6zqrp5PAEgXD3nmVtJuLqTssSsuJrih1L8IfFaa9rIExX7Xb482yfNW0wZ5mNQbbE71fS4jio+1T1ZPEveBuux3zT8m2FvMD/LlvJB/B5ry3Slhn6Sa68MzIJ4cE2EqChwPHIcgq/8xZZCMotlZK+DLksMR10XJ6orgI2AOFwfQLTgCx+onPdAsl5dZ2ALCEobPU8pp0w7u6BEFqnYViBs8BBXnNGz7A80i06xau0ffJxlckCxA9PAoDItSiPG/BN1Ea+YzpfdybEPuV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs+dSleNApoLP5xpq8oXyiwX35OLxGP23mJ5gd0uqec=;
 b=eS3VgB8pgCVDuC5zGe+dysN6uIpvishH+FI0LpU39WIPvMbWOk2Ez88resDymiMADFKcqkmkwYkLvFpLGrwWbJvf4OHEf7dZ0zZaIjPfTWZXQdkI7tBVB2Vp8NbsTKxjYbtz4twhekU6oSCPNlNtd7aVdH4kd/NVGm953kPFJGGWjy/ZjsEzA3EpDY2ATomiXji4jy13XluoAcz+/khXqVfLINeVgrwJMyJ+yCfaSH9ckCOu5GEuZDmGGkxCFXnxCpOUxeRaSMniRINkvMo5vWhcettlRy1r9eQqsJuOKx3X3KDbeRs0nV2YCSesLPTQDdiY7R3dIL/rd0jf6N2Euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs+dSleNApoLP5xpq8oXyiwX35OLxGP23mJ5gd0uqec=;
 b=a+jgKvJxXaqJKxJYjSfRJXB7gvWIRz4KYcgkEOvnRCi7wXsidcxc9lbS7aYoAyQJ/c5ykymrf25siNqtTtJtPQanO2JUhdk0kF/BbRsh3iLagW+v9b8rKoY9MOVBomcyiMSLaUHOVBNrJlC9V0P+qdLOAx177JaQHWK3mQPb5U0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3657.namprd12.prod.outlook.com (2603:10b6:5:149::18)
 by DM5PR1201MB2553.namprd12.prod.outlook.com (2603:10b6:3:eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 20:21:11 +0000
Received: from DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::9178:207b:3b1b:fdf9]) by DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::9178:207b:3b1b:fdf9%6]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 20:21:11 +0000
Date:   Mon, 19 Jul 2021 22:20:57 +0200
From:   Robert Richter <rrichter@amd.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Documentation/kbuild: Document the kconfig choice
 default value
Message-ID: <YPXeqUV+22sxXS9y@rric.localdomain>
References: <ad9c50c54887bde41ae5de782248231c06a527c0.1626262835.git.rrichter@amd.com>
 <49b4c2512afba7a2c2ee39e10f14188ecfcdffc0.1626262835.git.rrichter@amd.com>
 <CAK7LNAQpTBb8gyESBxzUcrz6vKw1MecnB5=xPd-CYfSFCC4hgA@mail.gmail.com>
 <YPVC0Xs0gRSywTO7@rric.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPVC0Xs0gRSywTO7@rric.localdomain>
X-ClientProxiedBy: AM6PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::15) To DM6PR12MB3657.namprd12.prod.outlook.com
 (2603:10b6:5:149::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (89.12.10.153) by AM6PR10CA0002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:21:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8dd1e65-f35c-42f5-1c93-08d94af2bfcc
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2553:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25537B7177B7DF0F8F4124D29CE19@DM5PR1201MB2553.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fz1BF0uZaK9aPeJb6Anr/nE4QkHlcxnOYT4maKblPmF35kpjkGgUs+O7bLN9jjvu096XHRR85HKsioeosPJ9Y4fhI8dMgEvfrP3yZ5Ox657GeP3PR25xu6EiJVgM/pxY21x3Yb4rP3/uIKRAZ1OuWIc+5ga+BTAemsfE38t6+7i4b5kT1t80r6Kvs6Bz/ACQxwdR0/Yi0SPWYEBwTduxhBeVFrpplIK00IZFQr5ZSPgRPHcDpLuLJ4UluTOOGHY44NTENcPk/si7i9MWQY2QcpvWME5eFaG3rXk8fQ60yDDLUfVJvyL3eA/OoMRsYG0+dzJ720lWM64yLW3iXpyhKp2OEPJ5y7htiKGTglhzo/ttc69piirUFZKIGPWePMfsDYQDb74zwrNZ9n5ZppamoC4ea3Rv0EzpnQIJGGY3Ow7Q8wEoiDHy8ThLSqjBhbZYFBVjzt+BNVaDw++PTe80GUOYHW3noIPonnj7CGezHK8ygS3Hc6gtGR9nDjXMVvLBOhjHruqyaYJ7uhMd10mt9GRSOFmrGYypbhj2XnqjNdN+Xpy+ceMcRcfhYtDieYSPR9zUM1WQZ7mBuJIoy0QIkNjFup8QAa5geNQfoBmX3/U0bJPGfXJaQZ6a2+WNGU8MJHfXRdBg/mg0QEQbvI0wArHmf3dSf+pOX1DDTIWLjsqMPc284mpFXlA2oxNhJTdWNTFWAhObOfoATccbb+la61twz+FrMK2WsRwfVFTIbOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3657.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(6916009)(4326008)(38100700002)(316002)(38350700002)(186003)(54906003)(5660300002)(2906002)(26005)(6666004)(8676002)(7696005)(8936002)(66946007)(66556008)(9686003)(66476007)(956004)(53546011)(4744005)(478600001)(55016002)(52116002)(6506007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19f1KexfTWvw3Yct2/Gup4dvSKk5kFtkO/EkVcDTe/ghfOA6oQWPwQF3jvu2?=
 =?us-ascii?Q?LjSlvkgCgpksww5hoM1v1vfTtUn1DjSb7OjjUvj6UlW+mNHZTjjyS8mXfBx4?=
 =?us-ascii?Q?Duppm27Qb8KqhNVnVVUvgKc+0nAYh1STjwvSkEs/ozVi/XA+f7FanzN2/L5X?=
 =?us-ascii?Q?7StYhln4zJuRgGrJX0m2jWd1i+PmBFI6sF2lwv7WqJFIn41U26/PJbEi13IP?=
 =?us-ascii?Q?8oDPZnW8odfXu/udKSnivBxGnf0kPF1xtRpWrHppo66KWHMgfaZ3Oh35UAlU?=
 =?us-ascii?Q?mLBrnG0O0/sjcCfmgwwsK/YH6XDThxY0BKeBFqQlMEqAbzuVHro+vVms3UK0?=
 =?us-ascii?Q?gUJPW8SHZufwOqRe7SEx7jFPese8PmICaYDXLUN0z/79yNpP2oAJwwlsj7ol?=
 =?us-ascii?Q?Qn22a1qVpkEN/X9J5FpREKJ7cBkorJznGKqZ1lLfTnSG6BAUBzYn7M9NwEeE?=
 =?us-ascii?Q?Vynm3CofAFrWNrOdrhGbGj9n94g4lhzb5BDpp2u7n30wOQJZa/uF0Ke7fYXr?=
 =?us-ascii?Q?AL6HxS3VxbfrKiaeESpl1zNvD6M5fMGoD53/maofzd9sIMUI45BKc7FfPrJT?=
 =?us-ascii?Q?hfyOm5Ot/97d/U6pfI9Roh1pLWluZgku7cyejkdj3K3DIzKFovxojlvh9EhM?=
 =?us-ascii?Q?xHjLybDZj98s3a6hegoj6dzcehA+wPzh2tHdhQCv8E7sIsfks5j9N5wFrjAK?=
 =?us-ascii?Q?qlNJ5T6dkkmnAlzEm6dzrshyEAnAyKjSFWg4wNnUfjYfjfE+jng4a6luxz4n?=
 =?us-ascii?Q?XZReS9mOXzCgv0eL6Kzg7Wp0zjWFVja9I9pZt6Am0t2A7Mcw3GPrsRVsxN19?=
 =?us-ascii?Q?46mlYwDjAVsstNiqGezbuKCfeoVFQ4kit9Wg6ySs8JBZ9xtXIQHVoP96pS1k?=
 =?us-ascii?Q?Aj3+ws25YfT/II1knniZPqnQpXI++h5tzeCezMIkf9acIY+Gmq031kRDgNvM?=
 =?us-ascii?Q?5rSFIkwyhDHIki+4KffWlvO+PNubgwO9zXVVFfIkvIJ7744VbBsN9UVYMDCn?=
 =?us-ascii?Q?vAMao92VaHisJg5h8tdL4VYJloJwXw6agslmopfo+diN5gwcB3f29DHiz2z+?=
 =?us-ascii?Q?2vpitQuag+3voJpBPlRgFc26Dx2ak7NwgGmsVjsjT76WU/rF1ELPmFoZVC14?=
 =?us-ascii?Q?QnZpSljVJhmnJ0/1OK83v4UFuHVD7P4bjR5X1H6R7JPoYi9L7zYbx4esNyAS?=
 =?us-ascii?Q?l4Xj9uOWjk9EucxxmCMdN6eh2uk2ro6bQUK6LxZiHD1ASnoE8EBxn7Ca3v0R?=
 =?us-ascii?Q?YYG/TIjgEn8Myk/HR1B87rOZl0bFk+4uEUTXfIFhE+BdO0/B6j2vrUkXsJSr?=
 =?us-ascii?Q?XgCmvZBDyzn7AIQgUUoFXf/o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8dd1e65-f35c-42f5-1c93-08d94af2bfcc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3657.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:21:11.2580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uXBbQoO2UNi5c48B7q6AEMPawOuTjDif/r0FcXrQQfX2jMKYZld+gahFw+g013fY4e+cUmsSaxMl6ipy0Sfig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2553
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 19.07.21 11:16:09, Robert Richter wrote:
> @@ -417,8 +417,20 @@ definitions of that choice. If a [symbol] is associated to the choice,
>  then you may define the same choice (i.e. with the same entries) in another
>  place.
>  
> -The default value of a choice is set to the first visible choice element.
> -Choice elements do not support the default attribute like menu entries do.

This patch was not properly rebased and does not apply. Will resend a v3.

Sorry for that.

-Robert

> +The default value of a choice is set to the first visible choice
> +element unless it is explicitly set by the 'default' property.
> +
> +Note:
> +	Choice options do not support the 'default' attribute.
> +
> +E.g.::
> +
> +  choice
> +	default C1
> +  config C0
> +  config C1
> +	# no default attribute here
> +  endchoice
>  
>  comment::
>  
> -- 
> 2.29.2
> 
