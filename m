Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63783CD05A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jul 2021 11:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhGSIfc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Jul 2021 04:35:32 -0400
Received: from mail-dm6nam12on2072.outbound.protection.outlook.com ([40.107.243.72]:34305
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234730AbhGSIfb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jul 2021 04:35:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXJ4oNW8cKk/9J7/abeD4G4DjmjDtZCnFBsQxuh4hSimR5or6j8jPUAao8iq5id51wBDgJpk6kbFpqAQN70VDsMRHcsGa3mi/m41il/JW/fE2ZxrnT/oGIL95St53i6gWsS1bDrb8bDU6n9i0pWIRAEL24DL1cA7+wf3pyAQ0Ig2UXYyjxXiqYIVehxkHvh30etaGVCMPnwobOOdi2m9YJjDcZ8PHpCbL7AG/2eu8IbfzAaOO99cmwo2V+xq4y2oEMJ7lhXd6Ntu5VucXR1TSPNtWc3TGxr2mOeY94saRnhAtzl0wWRVYBDxyCOXMnFxFXQvUbr3LabcPSqlAKXMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Px0SZ2McNIQ1jXML2/7dSUPjmKZLlQolK5rrfcg5kc=;
 b=AGyJCcQLTFIPZrPvHwo3QhLswNYkug3ki8l7l7HCV/O0xHMjyKpUZ9WS2zVQAoRBfVUAe/edCJwn235HubJE5TXKvxF9rqyFbBAkMk8F7hmlQ1H/gc9OsvSjjtg9lndsuI1rN5ufWMURtOZIlWUrMiY9IHRB97GA9g716MHZLsqeMYDo3iryRSDSiBkzeQ+U5C/O34hHubSVatt0tXooTzPyeDZCKRYBZDZ04unNBu2hdxRdn5cOfS4e1uhpc51XL5g/jxHxwTlycqQfgmOte0jrech9H30+cxPk7wXK3EsXrnPXQYSwE/MbdVBJpx1BNa0c23oW3hD/8u1X9bwejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Px0SZ2McNIQ1jXML2/7dSUPjmKZLlQolK5rrfcg5kc=;
 b=n5llucoEHY9F0T0EdFmsSB5rwlWzRWwdONhe5+YrM5dbMVto9sq3AtITX7ceSLngSyC86GdgNPy3xq0NbFj9Sb8QWvyq5wpIbT2Lf8OYChQpCoukZUE2vm/ABfpDbwQJ2pV8h7ehfbds71kepXHEnDiclIaGAEXJe80I5uQL+h0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3657.namprd12.prod.outlook.com (2603:10b6:5:149::18)
 by DM5PR1201MB2554.namprd12.prod.outlook.com (2603:10b6:3:ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Mon, 19 Jul
 2021 09:16:09 +0000
Received: from DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::9178:207b:3b1b:fdf9]) by DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::9178:207b:3b1b:fdf9%6]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 09:16:09 +0000
Date:   Mon, 19 Jul 2021 11:16:01 +0200
From:   Robert Richter <rrichter@amd.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] Documentation/kbuild: Document the kconfig choice default
 value
Message-ID: <YPVC0Xs0gRSywTO7@rric.localdomain>
References: <ad9c50c54887bde41ae5de782248231c06a527c0.1626262835.git.rrichter@amd.com>
 <49b4c2512afba7a2c2ee39e10f14188ecfcdffc0.1626262835.git.rrichter@amd.com>
 <CAK7LNAQpTBb8gyESBxzUcrz6vKw1MecnB5=xPd-CYfSFCC4hgA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQpTBb8gyESBxzUcrz6vKw1MecnB5=xPd-CYfSFCC4hgA@mail.gmail.com>
X-ClientProxiedBy: AM6PR05CA0018.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::31) To DM6PR12MB3657.namprd12.prod.outlook.com
 (2603:10b6:5:149::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (89.12.10.153) by AM6PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:20b:2e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 09:16:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 502b12f2-4a6d-4ff5-1b81-08d94a95d854
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2554:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25547B0E77AD513A0B1C01029CE19@DM5PR1201MB2554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1VmmXBK91NsR14yVg7JqNsvqhT69gombAukIwkP/ovMCSDjjZtCCQFQAYZsHAXbG9FD79h06miN/WjkxfHidtx8AAiHRpU2485Dd1myLbzv9Vrpm9/cdBkEJxtttFXFDlrRdSmcQtLGNIt1tE+gGSha6e2hbw9Fl5MLnwhE+vRYeOXbvtcE4P1H46OcUlojPJh2xxj6gUSVgDGUd7kjK6wRKCXCiaMmWnfOa2ZeBrFVcM/OtVpcT0LcvKfMV/UqYaJVF6yzIl1CvXPM1TJklZ5rptJvgIeipoT2F3BmIabGVfAMOWf+PRCThzHC6iVb1m9liq0dxY1BM8NfiwQ0/uPoN+E99ehKEZFrF5zEPWEw+KOkyIbD4xLSq5brahPd1aT2Gh85i3hA3/pMX7t4ra179SspsOTNVNeV8OOMhyuv0hHditzZloDrjR6+4cQf4g5djuNTBtrGRllMXnz8rNaOKuatN5k2GT6orCGvpg5CwDyOTuKzzyEIS/G2Q1VmjwEnaI/crHRA2TKL7TWWAXaqYZZ/QwlWpVdy+F5x4lAABLb3faDaQNt26I3PChziFJE6WvDU11yBAJitzQJAGqxsT+d0tsdTFN/GBk6pTmXkS5AfOV643fFULRUtJ5ZOkRdDrOD6BqlaIigj4xXh/xPV/56YToNo6OMirAYgUlnfD5SWaQhVmmZ2AHkXKBwnxHLvAaOaVrDf9CqG/J6+O0Jeps6DViIXsqorRpW3eN/0iRPwD4lWk1lKzbvi85D7IUOR5XpshgF2f/l/wR9EqJzdKub1VlrkpJs+pGF7aHFrAEZz/mYKAYOWw6NDPuqXf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3657.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(9686003)(26005)(83380400001)(5660300002)(66476007)(4326008)(55016002)(186003)(66556008)(6666004)(6506007)(53546011)(38350700002)(2906002)(38100700002)(8676002)(66946007)(52116002)(7696005)(8936002)(316002)(54906003)(966005)(478600001)(6916009)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5EsEHwoww1Gp8d0LT3YwZ4MKy7vywUP2sHivZC+kq1W7tNT/R/EXnbAQrBnJ?=
 =?us-ascii?Q?avpUsbTdOLIn8XCUPIubHOuY2XWI8x6hdXVbAl+Nm9DtVdf5svWKmHh8oJq1?=
 =?us-ascii?Q?MxQou88MEoykELSYZYd4j1fXwebc/Nx5SwNnUlndbc7dT+anoyE7vUD7oAKI?=
 =?us-ascii?Q?R6OykDFIDuuYbWkOngBMkijcS6buxvKwYumxQlUnMenV52HzTWQa0Devpjti?=
 =?us-ascii?Q?cmDk718vFxWvglV5myHC42x+Zk3zrxFCVIGkuBePz1/hgzyM/5ZG//CGPf7A?=
 =?us-ascii?Q?pj6tK4FsY/Nu4IRlmb5jww+vjFe9g3B+iiW65yq+pGM3dOLcl1dFOdD6MbuM?=
 =?us-ascii?Q?tyOJHILiWeI8Ly+34JNkhD+DrpfBD9hxL6R9j+CmFbsEICoci8zZcRGDQqQM?=
 =?us-ascii?Q?XEdsWJlGaKi9NE2A2q17V9pfsoWOoGmf/HJmB2LchGDXU835oCBGuay/sKFP?=
 =?us-ascii?Q?MXNzXdkwXHZwIydrF2GOp0r7r1EcFJhIldzQWWPAy08yybGdweoWChL6YTdr?=
 =?us-ascii?Q?bE8KVIEZk9s2TZUfaVK3mUaJm1KiaXuU85TbJRQTvMyuC48fFkCwGKdX30gc?=
 =?us-ascii?Q?/2tskzmLrtZgaa5uHxx1UConRhI9kpe54OszvoSRozvJDDIYUMamUbeazATd?=
 =?us-ascii?Q?LtGdTh8xxUWkm6EH47uC3CToRahmJT+91iRd3eqDxc/3uLoOzb/JGTXdnmql?=
 =?us-ascii?Q?ikekxyfrg7mEVToguE09q4XLEgLZWn/b/0WTVL8S87fBPgFQuRnBWVwUuZmg?=
 =?us-ascii?Q?eMxtG1ZPt86DTFoEun2WooTJTcdqn7CWX2zf113yAUdISCQD0dqlHM58pNJy?=
 =?us-ascii?Q?mPbQWpBtcX60lMu3H6E99ut6tSovyy6yS4zwI8lZ/mPM491yGP+jOP+RlbLO?=
 =?us-ascii?Q?iSKT6dR3puuGVNc4MRoa41Lp8t2FYL4h+MPo32M1JYJm9qssfn/sgMpuszJ6?=
 =?us-ascii?Q?O2eNnB5t8CImbnPkxsNquZGqTR2iDKTeQ9v2YTVdLls1TXANh56Wuc4UFAOp?=
 =?us-ascii?Q?YRhlGt6EMWHtD7fJ4HvzPAhzwIRWZl66HrFpW2ymErFp4eh6hyo69ZOyfed4?=
 =?us-ascii?Q?d/220PGH02zwDX/zusOSLK3RBlr8lA1WwmyXQsUqwSlOT+R72b69ns5SOp3D?=
 =?us-ascii?Q?kEgPKf0Tlweiin214bQXUBzjevgTnXSzyj9AfjzkOv7qPOthT2o3a8PO8OTa?=
 =?us-ascii?Q?OkrxCrFnzF7KBV6mu5dxWHV1/J2H1Sq3EwcseEANLoi/EoFazV6gtlLOPhWG?=
 =?us-ascii?Q?wHqd1dK7S5ZO306bjDJLvhVRjY9mxy0tvUSrIbnzXZ/GmqSjfqdoQC0gVc4w?=
 =?us-ascii?Q?1wolJkpdemT8A2G7RiKMoMfV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502b12f2-4a6d-4ff5-1b81-08d94a95d854
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3657.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 09:16:09.1607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k87Y93o8XB+XSVpvdjiy7p3yJvNmdY/3CkInTTzcvd1tFgBwo3NGsqptIOffB1RJxdw4xoo7CJytHCTmLWlcuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2554
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 18.07.21 18:36:31, Masahiro Yamada wrote:
> On Thu, Jul 15, 2021 at 6:26 PM Robert Richter <rrichter@amd.com> wrote:

> > --- a/Documentation/kbuild/kconfig-language.rst
> > +++ b/Documentation/kbuild/kconfig-language.rst
> > @@ -417,6 +417,9 @@ definitions of that choice. If a [symbol] is associated to the choice,
> >  then you may define the same choice (i.e. with the same entries) in another
> >  place.
> >
> > +The default value of a choice is set to the first visible choice element.
> 
> 
> The default value of a choice is set to the first visible choice element
> unless it is explicitly set by the 'default' property.
> 
> ... is more precise.

Ah, ok. It becomes clear now, but how a value is set then in case the
type is tristate?

> 
> 
> 
> 
> > +Choice elements do not support the default attribute like menu entries do.
> 
> I doubt this info is useful.
> Rather, is it even confusing?
> 
> 
> choices support 'default' but
> choice elements (i.e. choice values) do not.

I have added an example to the doc for clarification, v2 below.

Thanks,

-Robert


From 46ebd10dc11388ddce40aea70890000697a27165 Mon Sep 17 00:00:00 2001
From: Robert Richter <rrichter@amd.com>
Date: Wed, 14 Jul 2021 12:24:16 +0200
Subject: [PATCH v2] Documentation/kbuild: Document the kconfig choice default
 value

Document how choice defaults are determined:

Default of a choice is its first visible choice element unless it is
explicitly set by the 'default' property [1]. Choice elements do not
support default attributes. [2]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/symbol.c?h=v5.14-rc1#n245
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/menu.c?h=v5.14-rc1#n494

Signed-off-by: Robert Richter <rrichter@amd.com>
---
v2: clarification on 'default' attribute of a choice
    added example
---
 Documentation/kbuild/kconfig-language.rst | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index e4d3463594e1..d919dde0bcbf 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -417,8 +417,20 @@ definitions of that choice. If a [symbol] is associated to the choice,
 then you may define the same choice (i.e. with the same entries) in another
 place.
 
-The default value of a choice is set to the first visible choice element.
-Choice elements do not support the default attribute like menu entries do.
+The default value of a choice is set to the first visible choice
+element unless it is explicitly set by the 'default' property.
+
+Note:
+	Choice options do not support the 'default' attribute.
+
+E.g.::
+
+  choice
+	default C1
+  config C0
+  config C1
+	# no default attribute here
+  endchoice
 
 comment::
 
-- 
2.29.2

