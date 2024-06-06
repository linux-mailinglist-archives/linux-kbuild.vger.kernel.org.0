Return-Path: <linux-kbuild+bounces-2021-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DAB8FF51E
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 21:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE602813D7
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 19:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB5C4AEFA;
	Thu,  6 Jun 2024 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="COuxQdfE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OIcL6Y59"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3401C13C;
	Thu,  6 Jun 2024 19:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717700603; cv=fail; b=fh4yivfp90ZtaTYAfLBtgigjKe6uZ81bRqUZ3kEaju3H1GvRdon4WZw8EhWjxTou1QsnCszBXH4LhnsSMfnkkg1UxRc9lthB/NVrtpR6DKt4VdxGGAG7zHeMQeqYoZrCU7B3g+/VOyBx3rOPbzRORn4hl2v8lD12qRr0LlPv8VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717700603; c=relaxed/simple;
	bh=O6dYsFVfTEaRDcdz9oIrT3YoWdnKddVEk/iECkLOyjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c9xq8nVkz1pvMq9OT/xxBRW37g3+pkzBh3kP3pQLlTY5r289M1HTQBFa0sEUHnZbaX9dok0s4q/+agsWnrhMW8UBxVObVHzRpgPWGZTkxCCA2qfzCDTCqJIrJ2sRXk3OZmHkiOCRHBGi/HsCs3oNKkrDTz9SWv10bhi9KPQlRf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=COuxQdfE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OIcL6Y59; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 456HxTfX032742;
	Thu, 6 Jun 2024 19:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=corp-2023-11-20;
 bh=1jvVJbhXpiFJctuJqEGztem+sQAkdStbqeLa5R1lUZ0=;
 b=COuxQdfEym06nDzDjwk6mjU+x4fZHl0hvxyERogTiQojmItWKzaa7jnxwZMX1pgGPepP
 D0qvhZsNHBlF1TGUrDSnktaUSj8QvO1j48FQGsUNTecFo6zVOaW5jUyT1YVFjA+FzEMD
 Ziua+24PX7mOqKzDpccHDYz/JekxrHF46UmEBXPJJXjYWIhXQfBHLStGwo0NRZlSwzkj
 sRchVsUwH7+y5AJDw/EJmUZk1C3V1kwhFJL2RRYbKislPkDkiIu9IH1a8PTmO0L/ic28
 AOkILU/pK/KuG13I5DtgeNg72af4XPLuZIytef8vjSAyNdReZi3140g6kgQ3hT0qh8/v hw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbqn47ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jun 2024 19:02:47 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 456IvBJR025177;
	Thu, 6 Jun 2024 19:02:45 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrtc1pnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jun 2024 19:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdIj1jt1fcb/cGcRhnBJaJnyS665DkzxpB77mz4dSrxVVnOq9BxOu6ohVGs9dhO6rv4qD+7CEWMrBq2k8zY11nQfvx52OqcDfAIaUKOUeiAIpWVUVQ3VM29a7AW1zwWl3S1ZHXrQ9Mtz8hvVPQz54PsaZ7nlwKlexwL0Yf4qls+jDMRbZuzXWYm2rSwo2cjV1638N2erecXIpMccsGrCC4nLiHVqvzi0eJF/RHRY2/in6BGosYoyhs+t9GgunXg0aLUN1Ag625WyMEsTmtVbyOEDJRV4y2WnCZMvZFp7Hhdfoa52RuQreF0rn7Nj6yQtIhjgiCFp/5gMWygR6oRIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jvVJbhXpiFJctuJqEGztem+sQAkdStbqeLa5R1lUZ0=;
 b=IGCTSCSv9zjEDzdp89brxLh6erdPQZbmD962jB6ZhTvAHp6wIjaSK8ATr5hh7X1S7CkLG9+bF2RZ+u4QK5ej1phUFaufcPrrS06TFGJFSdBOJf5I54YkvbNgPJrN2Egw8uWo9hY7D7A0AgKHtVY5G4uWrOJcrjh9ExIXyIQ9K2NJZ5xVDWCnar1igjZ8902YhwT8Y4GQKxzhNVp0OW0aRv26EYx3IUKGEVKmXwpqI1twY4kBViatDYxWQcV+hF3RcS8MdKl45/xbeTZRue/daEkvOpxfV7rUkvo1Pk9pWzbOQXydJn/LeoIZ2+TQdeVN24mZzV6moVW5LL07qfibSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jvVJbhXpiFJctuJqEGztem+sQAkdStbqeLa5R1lUZ0=;
 b=OIcL6Y59BdsPVT2i8IHKAYSYnWYqlvy2lrtmwHFPRvkk52A4laGI/GBhbQdBc0WGme5E1KhK6T3YKPEeN/AS3yax+wcNXqbM3FxhAt1NP+VcsJs4/RoWeIqqNJiEguSwW5zTLNPenbKLc9c10XXfUTga1mHI0ymleVuWiVFSILA=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4768.namprd10.prod.outlook.com (2603:10b6:a03:2d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 19:02:40 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 19:02:40 +0000
Date: Thu, 6 Jun 2024 15:02:37 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v3 4/6] module: script to generate offset ranges for
 builtin modules
Message-ID: <ZmIHzXZTjetNhmd5@oracle.com>
References: <20240517042839.544650-1-kris.van.hees@oracle.com>
 <20240517042839.544650-5-kris.van.hees@oracle.com>
 <CAK7LNARymQg37LYbxoNB_nm+uPPN1thKC7PqAORh-5=fXpsv6A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARymQg37LYbxoNB_nm+uPPN1thKC7PqAORh-5=fXpsv6A@mail.gmail.com>
X-ClientProxiedBy: MN2PR12CA0030.namprd12.prod.outlook.com
 (2603:10b6:208:a8::43) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5c86b4-2ca9-42be-d19e-08dc865b3d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|7416005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qJNOAlKIqcw0taViBq4a9WHB+ol8iYXHsOpSK47Bjwg6GsOYM+T+CUgVNGuW?=
 =?us-ascii?Q?eB60xJbx41C8vIZBWDyZ+2F8gVw0YsOeBd+0uuDYc9zofG9gn0EA3zuwtLCe?=
 =?us-ascii?Q?tZGBb7paB2KaW4byGgelg6YvDz/21+MmC4VS2sWgAURhqg+Nq8SKfXsi/6Jj?=
 =?us-ascii?Q?24Vyt8UbnCVknYsojI8L1gWFVjVVlCHG2KjIU9kC6gJ6x7i3XH0bZfy3bsUI?=
 =?us-ascii?Q?Gu01D1bEXeg5hg/woJ8tV5U5DbDXEj5WXz3VQ6N9/o/YGOIi+TAqJq6Xg7Jr?=
 =?us-ascii?Q?Y0zr0e0I18WZaHgbzOunE/r9uIZi++Ipw1hpkwT1zkT2MEOHxCDbgmGXlemZ?=
 =?us-ascii?Q?9rDFDgQE5NUspyBoACE4e1zYvyiK/a2UvPNnFm3CKzpvOWXEmXfSB3QyBOqI?=
 =?us-ascii?Q?Umsc4WP/uzjbyLt0tOsqWLVlfXtHFnnZ/ZI7YGlwDRKQ+yeWJ+wxy/kFelso?=
 =?us-ascii?Q?E2HCxDwitABZnMEFbUMV8zPgzJHaY4y/wqJz6uhjEUxqA58Q+I0sl3pcxi2H?=
 =?us-ascii?Q?Xn8KO3zOE3DVT0/nZ7cvOHwt44o07aZ519mTZqy1J2H4WzwfXTDp4uqM+DED?=
 =?us-ascii?Q?7ekcJVAtmL54ZoTQpLdCCzkCSYQNqA3Am21p02++W4c6Mxv4ljFi70BUH1Yg?=
 =?us-ascii?Q?VEsHDmIVMrtOIwwDOWQh1Ak+4MxTrKkG+v30mCC+5lm4/2SajNxc3Np/zYA3?=
 =?us-ascii?Q?6d2PHwp0ucH3xP7dg7hzQTt3ZaNo1ozxKEEAtWfJiARR+wEfvn5pHG7U9pIE?=
 =?us-ascii?Q?+ATenq7d89C5MKJscWOHlazb1rMwN9Ih83d4auCgMwumtg8wg6dWJSuKFVRf?=
 =?us-ascii?Q?qOW1wFzF8VGG7RSYR6JCvAJfWG0kayHY9QQhREtRONpMWh/oArzfsooWST2j?=
 =?us-ascii?Q?8jek0nI2q4TdqnpXyHkuXzCnetnLpS9YVpw+idMCGj5NYDMRF64WSM154h6v?=
 =?us-ascii?Q?U3sgAnoFP+8vyk6X1UGI+zOUGTOvvjEfTzUDyLcEE5L/3pHnZQW/Y/p0CQiS?=
 =?us-ascii?Q?qg8XJrvmI1QjUu5i8REYeG5Bmf/4LfwZr7kcuId7YiB7UsXf8x8m+gskM4Xa?=
 =?us-ascii?Q?Yb6nHCLbz4J6Qjkycm55DKTeNHqJJ3cmX0rwwyLGBeigIIUxjXB03m0w7N8O?=
 =?us-ascii?Q?cjcr45IieUtKsmlx7rVIylK0rE5YuJ7MHMDzY1y3iKQ/RQWX2aHRDHFmo1Pq?=
 =?us-ascii?Q?Ug/i7Gd/swQFmbU9OjFljAe2f+ZPuU/TkquVg77sYl795bYkezWK2czWDv5y?=
 =?us-ascii?Q?JePIzWUfBkkwCScXVQLizDQt9UAcP146Dpfr+sGcF3xv+7mZ41GIBYVxoWSy?=
 =?us-ascii?Q?Uci33ptZyHovmleZKtZr5xGx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UkvbJ3AmcAZr1o/iPI6NLK7nEleWvJIHHtJL6a0KPcIYmAHCNL1YciX0YsOy?=
 =?us-ascii?Q?+2UGIa1WAVFZpLxHFeH00ZLrsZjkUFse9tBFG4rbcOqEo+QnB9nqCukmGNUx?=
 =?us-ascii?Q?7k/lgpG2IxjlGWMm9Ul4VIUMuDh55Is804J8LYEpbNRfWO5w2G1EIrSn+Hb/?=
 =?us-ascii?Q?qSuyVsp7M1FEgrAQiAsREMp6Mal2CxQ4yZbF27TnPic/fki+zDu6vM7wZehr?=
 =?us-ascii?Q?l4k42WBbb93Le2UWAjdoKHh+uEWWKCO11NOG0IYQuczfDcWffLAypigE7Q2r?=
 =?us-ascii?Q?iDZIJvSjhb0O6eYhx+pOKgp8Z2lRjIAL5EPf12elcxucsbAbjolgTdy/zMQ0?=
 =?us-ascii?Q?Dvm8wfb73qSUmxIV0bZK47/lrfUF9BxkMP6VQBjClGaB2V6ymJXpdLQovs04?=
 =?us-ascii?Q?vG2e87dHSKTCemCeh6Afuh8RZmFh4SQe5tXQZerCTEBeH/AVf0DXPpBGj8lc?=
 =?us-ascii?Q?Dneoo5OimxbS7KbTVx0+LlVdxjsXzlOtoL6KrnbTyoo7akTYPGaQbi+I1wUM?=
 =?us-ascii?Q?2vLYA2LjaELBuVWqgNaxb1LnP1RRVwNl8oFz60V7UcKa1H8oIdaBgAiRJL0B?=
 =?us-ascii?Q?FtZUHuksbceIe/VdH9060XECtn6bhlPcbhZdrZ+agSlNNZE9r6aIEqhCdmp1?=
 =?us-ascii?Q?t30hsVuH/tY5Ftj7Gwc1i6ZZJ/p/RsV5uaeZn1KHKTeiRp+T8GFUHX2cnHFd?=
 =?us-ascii?Q?DZccUaN+oXFjfFZgzRf1p/op0LXy7ECjHymQC34YobVao2viWByZTeuR2zu+?=
 =?us-ascii?Q?txF//85REWTwWi58bQrlwRu1bQGdNu63r002NJLos+5NFuX4mwSGvF+yYlub?=
 =?us-ascii?Q?Jp8oQujYOtW0AgXJ0QjM34i2xjnG3Tjq8zDW8rdtGtbERnB0OGj81SwI3ACq?=
 =?us-ascii?Q?Yga85exa373rjq6kMkVm8ASreX6BdOq3gBmaT1jxPCwkZ/PQ/Tlm7oEDGe4N?=
 =?us-ascii?Q?qFzCrBkSPlTPJEcpKoXXrowe/KxNJId6YE6zDX2erkswiqXDSYWi+Xdc5cWW?=
 =?us-ascii?Q?aGhbmWcqhGuRSUmalGPgpZh263Zz3Jv3Kp54kLL5jgtJoWk2EaFfLPRx5OQ7?=
 =?us-ascii?Q?T/undttCUd5HKCDJu/kXojW+onVknz/GGdm8NDX+jy+bdVjrbRIV3FuVrqoq?=
 =?us-ascii?Q?/fu49BPwaek7z7/7dDBN++cCOUhTn9zKl2kyuP2GEv07qgIwfvqxpzVpJUpy?=
 =?us-ascii?Q?q0aEYc8rmc6W5dndAHpBn2vJjosUMWkXS+9Dw63Wj+AF/Ss6Dc41y7QC8FUb?=
 =?us-ascii?Q?VxeFZXYpSPXdKAhdW0dO4C7gC1IlR6DK4XFxel0fly/+yX4W3XpovmxcOcZD?=
 =?us-ascii?Q?i9+LcajLuxH3v7vz7RmgkFOynBLqeVEen2LF3ID6uuWiQK7iTc+t0MdbInFN?=
 =?us-ascii?Q?eUtfyxXvqbNddvyH+Ad4ulFYY6ygvoSL9rXdAlsFWLubwT8Gk+hHkDixhXkT?=
 =?us-ascii?Q?vLEqKkKV8nLWnrwYcGIbY9tBHOnjDQ5mP7SWEw37bGNFcvbMoKpwo5k7TSj1?=
 =?us-ascii?Q?f2vzzaWlXMUhtdug4h4lMfNBOwrZve9khgX1uthx2AJulj72Vtc+7FR5ff/W?=
 =?us-ascii?Q?DJRqCjassHWu1s2k6Graj5w9qgm3lJJFaAGTLB3LUTtW7CJ3H+pS6Z4vQKNu?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	MRY8YkNcTfbg7EMFKEhfZPlFs1XNweyhUn3TSpgGN8JMVU9gM0UyrW9pNdYH1l3AdWAV6maRZKAk4Gc/ZC9nHBOv67DfAg70DZsb30vAnrNsvV3Q74O68dVncwXdMaSqYRv0ChJqW6MtTaUSkmzwITSyk0yYf7Ucqit9TpwExsVGLsJreNwoQ32Uu/paYyeYLfB9lFUMxjzQSAD8EZM6a0+TPw6DYJGZe/FLovqwLEyrylclKTFuRD/QE6byFgRf7JZ4GKjWmBVmxeS/2nZyW35HH2RYZLZyK3FBve/U/ZQ1q52P3yS2ThZKiGRNDRmp/ReH3oEx+CAvfND/XC2j4RCma/7AfJynQ2SSG080Z+ISLMQM/Zhk/NRSelAT7smvo582olSuVma9XHw7yrV1hJEdulqZv5SJR/4YB5djr/Z3DMgtNzAzQ1gNTXU74qqIAbLiIVyKTLHFOT5QaZYSru0j1uj9Fh1ssEachci88679G5bEG5Ii8yrKAOucKJ7U5i4GsjOdxtajKRuDsU9+p16Ju+SCR/iMVgRDD0t3T9sPYT1+VBYu8u02EBvnQpzFAbLMsioldLOnDMCYUdV9p4zU8eMTxjoqv6J2S/pnH+U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5c86b4-2ca9-42be-d19e-08dc865b3d3a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 19:02:40.8517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSQ9vL3LpuyX+5IpWSkrYc6gbR2bx3q3RPLCID2PhoYhqlRhhfJlath2CuKhimlabMqkNjwKqyoncA0EK+MePYCEyqXF0jybcvDhf7ibMeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4768
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_15,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406060130
X-Proofpoint-ORIG-GUID: GydOpMDXCwBpoEr2FbufXeF-BioXf8qx
X-Proofpoint-GUID: GydOpMDXCwBpoEr2FbufXeF-BioXf8qx

On Tue, May 21, 2024 at 01:53:27AM +0900, Masahiro Yamada wrote:
> On Fri, May 17, 2024 at 1:31???PM Kris Van Hees <kris.van.hees@oracle.com> wrote:
> >
> > The offset range data for builtin modules is generated using:
> >  - modules.builtin.modinfo: associates object files with module names
> >  - vmlinux.map: provides load order of sections and offset of first member
> >     per section
> >  - vmlinux.o.map: provides offset of object file content per section
> >  - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME
> >
> > The generated data will look like:
> >
> > .text 00000000-00000000 = _text
> > .text 0000baf0-0000cb10 amd_uncore
> > .text 0009bd10-0009c8e0 iosf_mbi
> > ...
> > .text 008e6660-008e9630 snd_soc_wcd_mbhc
> > .text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
> > .text 008ea610-008ea780 snd_soc_wcd9335
> > ...
> > .data 00000000-00000000 = _sdata
> > .data 0000f020-0000f680 amd_uncore
> >
> > For each ELF section, it lists the offset of the first symbol.  This can
> > be used to determine the base address of the section at runtime.
> >
> > Next, it lists (in strict ascending order) offset ranges in that section
> > that cover the symbols of one or more builtin modules.  Multiple ranges
> > can apply to a single module, and ranges can be shared between modules.
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > ---
> > Changes since v2:
> >  - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
> >  - Switched from using modules.builtin.objs to parsing .*.cmd files
> >  - Parse data from .*.cmd in generate_builtin_ranges.awk
> > ---
> >  scripts/generate_builtin_ranges.awk | 232 ++++++++++++++++++++++++++++
> >  1 file changed, 232 insertions(+)
> >  create mode 100755 scripts/generate_builtin_ranges.awk
> >
> > diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> > new file mode 100755
> > index 0000000000000..6975a9c7266d9
> > --- /dev/null
> > +++ b/scripts/generate_builtin_ranges.awk
> > @@ -0,0 +1,232 @@
> > +#!/usr/bin/gawk -f
> > +# SPDX-License-Identifier: GPL-2.0
> > +# generate_builtin_ranges.awk: Generate address range data for builtin modules
> > +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> > +#
> > +# Usage: generate_builtin_ranges.awk modules.builtin.modinfo vmlinux.map \
> > +#              vmlinux.o.map > modules.builtin.ranges
> > +#
> > +
> > +BEGIN {
> > +       # modules.builtin.modinfo uses \0 as record separator
> > +       # All other files use \n.
> > +       RS = "[\n\0]";
> > +}
> 
> 
> Why do you want to parse modules.builtin.modinfo
> instead of modules.builtin?
> 
> modules.builtin uses \n separator.

Oh my, I completely overlooked modules.builtin.  Thank you!  That is indeed
much easier.

> > +
> > +# Return the module name(s) (if any) associated with the given object.
> > +#
> > +# If we have seen this object before, return information from the cache.
> > +# Otherwise, retrieve it from the corresponding .cmd file.
> > +#
> > +function get_module_info(fn, mod, obj, mfn, s) {
> 
> 
> There are 5 arguments, while the caller passes only 1 argument
> ( get_module_info($4) )

That is the way to be able to have local variables in an AWK function - every
variable mentioned in the function declaration is local to the function.  It
is an oddity in AWK.

> > +       if (fn in omod)
> > +               return omod[fn];
> > +
> > +       if (match(fn, /\/[^/]+$/) == 0)
> > +               return "";
> > +
> > +       obj = fn;
> > +       mod = "";
> > +       mfn = "";
> > +       fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> > +       if (getline s <fn == 1) {
> > +               if (match(s, /DKBUILD_MODNAME=[^ ]+/) > 0) {
> > +                       mod = substr(s, RSTART + 17, RLENGTH - 17);
> > +                       gsub(/['"]/, "", mod);
> > +                       gsub(/:/, " ", mod);
> > +               }
> > +
> > +               if (match(s, /DKBUILD_MODFILE=[^ ]+/) > 0) {
> > +                       mfn = substr(s, RSTART + 17, RLENGTH - 17);
> > +                       gsub(/['"]/, "", mfn);
> > +                       gsub(/:/, " ", mfn);
> > +               }
> > +       }
> > +       close(fn);
> > +
> > +# tmp = $0;
> > +# $0 = s;
> > +# print mod " " mfn " " obj " " $NF;
> > +# $0 = tmp;
> > +
> > +       # A single module (common case) also reflects objects that are not part
> > +       # of a module.  Some of those objects have names that are also a module
> > +       # name (e.g. core).  We check the associated module file name, and if
> > +       # they do not match, the object is not part of a module.
> 
> 
> You do not need to use KBUILD_MODNAME.
> 
> Just use KBUILD_MODFILE only.
> If the same path is found in modules.builtin,
> it is a built-in module.
> 
> Its basename is modname.

Yes, that is true.  I can do all this based on KBUILD_MODFILE.  Thank you.
Adjusting the patch that way.

> One more question in a corner case.
> 
> How does your code work when an object is shared
> by multiple modules?
> 
> 
> For example, set
>   CONFIG_EDAC_SKX=y
>   CONFIG_EDAC_I10NM=y
> 
> How is the address range of drivers/edac/skx_common.o handled?
> 
> There are 4 possibilities.
> 
>  - included in skx_edac
>  - included in i10nm_edac
>  - included in both of them
>  - not included in any of them
> 
> The correct behavior should be "included in both of them".
> 
> How does your code work?

In this case, you will find that KBUILD_MODFILE for drivers/edac/skx_common.o
is:

KBUILD_MODFILE='"drivers/edac/i10nm_edac drivers/edac/skx_edac"'

So, we can see that this object is present in more than one module.  The code
(modified to just use KBUILD_MODFILE) sets mod to be "i10nm_edac skx_edac".
That means that the object will not be consider part of the i10nm_edac range
and also not part of the skx_edac range.  Instead, a range entry will be
generated for "i10nm_edac skx_edac", like this:

.text 01eb2070-01eb71b0 edac_core
.text 01eb87d0-01eb98f0 i10nm_edac skx_edac
.text 01eb98f0-01eba710 skx_edac

(As an aside, there is commented out AWK code in this patch that I clearly have
to remove in the next version.)

> > +       if (mod !~ / /) {
> > +               if (!(mod in mods))
> > +                       return "";
> > +               if (mods[mod] != mfn)
> > +                       return "";
> > +       }
> > +
> > +       # At this point, mod is a single (valid) module name, or a list of
> > +       # module names (that do not need validation).
> > +       omod[obj] = mod;
> > +       close(fn);
> > +
> > +       return mod;
> > +}
> > +
> > +FNR == 1 {
> > +       FC++;
> > +}
> > +
> > +# (1-old) Build a mapping to associate object files with built-in module names.
> > +#
> > +# The first file argument is used as input (modules.builtin.objs).
> > +#
> > +FC == 1 && old_behaviour {
> > +       sub(/:/, "");
> > +       mod = $1;
> > +       sub(/([^/]*\/)+/, "", mod);
> > +       sub(/\.o$/, "", mod);
> > +       gsub(/-/, "_", mod);
> > +
> > +       if (NF > 1) {
> > +               for (i = 2; i <= NF; i++) {
> > +                       if ($i in mods)
> > +                               mods[$i] = mods[$i] " " mod;
> > +                       else
> > +                               mods[$i] = mod;
> > +               }
> > +       } else
> > +               mods[$1] = mod;
> > +
> > +       next;
> > +}
> 
> 
> Please remove the old code.

Yes, thank you for mentioning that.

> > +# (1) Build a lookup map of built-in module names.
> > +#
> > +# The first file argument is used as input (modules.builtin.modinfo).
> > +#
> > +# We are interested in lines that follow the format
> > +#     <modname>.file=<path>
> > +# and use them to record <modname>
> > +#
> > +FC == 1 && /^[^\.]+.file=/ {
> > +       gsub(/[\.=]/, " ");
> > +# print $1 " -> " $3;
> > +       mods[$1] = $3;
> > +       next;
> > +}
> 
> 
> I guess parsing module.builtin will be simpler.

It is probably comparable, but I like the notion of being able to just parse
regular textfiles.  I will do that.

> > +
> > +# (2) Determine the load address for each section.
> > +#
> > +# The second file argument is used as input (vmlinux.map).
> > +#
> > +# Since some AWK implementations cannot handle large integers, we strip of the
> > +# first 4 hex digits from the address.  This is safe because the kernel space
> > +# is not large enough for addresses to extend into those digits.
> > +#
> > +FC == 2 && /^\./ && NF > 2 {
> > +       if (type)
> > +               delete sect_addend[type];
> > +
> > +       if ($1 ~ /percpu/)
> > +               next;
> > +
> > +       raw_addr = $2;
> > +       addr_prefix = "^" substr($2, 1, 6);
> > +       sub(addr_prefix, "0x", $2);
> > +       base = strtonum($2);
> > +       type = $1;
> > +       anchor = 0;
> > +       sect_base[type] = base;
> > +
> > +       next;
> > +}
> > +
> > +!type {
> > +       next;
> > +}
> > +
> > +# (3) We need to determine the base address of the section so that ranges can
> > +# be expressed based on offsets from the base address.  This accommodates the
> > +# kernel sections getting loaded at different addresses than what is recorded
> > +# in vmlinux.map.
> > +#
> > +# At runtime, we will need to determine the base address of each section we are
> > +# interested in.  We do that by recording the offset of the first symbol in the
> > +# section.  Once we know the address of this symbol in the running kernel, we
> > +# can calculate the base address of the section.
> > +#
> > +# If possible, we use an explicit anchor symbol (sym = .) listed at the base
> > +# address (offset 0).
> > +#
> > +# If there is no such symbol, we record the first symbol in the section along
> > +# with its offset.
> > +#
> > +# We also determine the offset of the first member in the section in case the
> > +# final linking inserts some content between the start of the section and the
> > +# first member.  I.e. in that case, vmlinux.map will list the first member at
> > +# a non-zero offset whereas vmlinux.o.map will list it at offset 0.  We record
> > +# the addend so we can apply it when processing vmlinux.o.map (next).
> > +#
> > +FC == 2 && !anchor && raw_addr == $1 && $3 == "=" && $4 == "." {
> > +       anchor = sprintf("%s %08x-%08x = %s", type, 0, 0, $2);
> > +       sect_anchor[type] = anchor;
> > +
> > +       next;
> > +}
> > +
> > +FC == 2 && !anchor && $1 ~ /^0x/ && $2 !~ /^0x/ && NF <= 4 {
> > +       sub(addr_prefix, "0x", $1);
> > +       addr = strtonum($1) - base;
> > +       anchor = sprintf("%s %08x-%08x = %s", type, addr, addr, $2);
> > +       sect_anchor[type] = anchor;
> > +
> > +       next;
> > +}
> > +
> > +FC == 2 && base && /^ \./ && $1 == type && NF == 4 {
> > +       sub(addr_prefix, "0x", $2);
> > +       addr = strtonum($2);
> > +       sect_addend[type] = addr - base;
> > +
> > +       if (anchor) {
> > +               base = 0;
> > +               type = 0;
> > +       }
> > +
> > +       next;
> > +}
> > +
> > +# (4) Collect offset ranges (relative to the section base address) for built-in
> > +# modules.
> > +#
> > +FC == 3 && /^ \./ && NF == 4 && $3 != "0x0" {
> > +       type = $1;
> > +       if (!(type in sect_addend))
> > +               next;
> 
> 
> This assumes sections are 1:1 mapping
> between vmlinux.o and vmlinux.
>
>
> How far does this assumption work?

The assumption has shown to be accurate, but I did find a discrepancy when
building without LTO or IBT, where vmlinux.a is used to link vmlinux.  There
are a few occurences where fillers change in size and that causes some entries
to be incorrect.  Dealing with that is fortunately quite easy - the next patch
version will have that resolved.

LLVM-based builds (with and without LTO) are not currently supported in this
version, but I found a fairly easy way to support the non-LTO case.  The next
revision will have that added.

I will have to make the BUILTIN_MODULE_RANGES option conflict with LTO because
there is no way that i can see to make that work.  With LTO compiles, we do not
retain any information about compilation units (objects) so tehre is no way to
relate addresses with the objects that provided the content.

I will also document that in the option help text.

> 
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION will not work
> at least.

Hm, that is one I have not encountered before.  I'll look into whether that
can be made to worki, or whether that may need to be a case for now to also
not support.

> As I said in the previous review,
> gawk is not documented in Documentation/process/changes.rst
> 
> Please add it if you go with gawk.

Thank you for the reminder.  I overlooked that.  I will do so.

> > +
> > +       sub(addr_prefix, "0x", $2);
> > +       addr = strtonum($2) + sect_addend[type];
> > +
> > +       mod = get_module_info($4);
> > +# printf "[%s, %08x] %s [%s] %08x\n", mod_name, mod_start, $4, mod, addr;
> > +       if (mod == mod_name)
> > +               next;
> > +
> > +       if (mod_name) {
> > +               idx = mod_start + sect_base[type] + sect_addend[type];
> > +               entries[idx] = sprintf("%s %08x-%08x %s", type, mod_start, addr, mod_name);
> > +               count[type]++;
> > +       }
> > +# if (mod == "")
> > +# printf "ENTRY WITHOUT MOD - MODULE MAY END AT %08x\n", addr
> > +
> > +       mod_name = mod;
> > +       mod_start = addr;
> > +}
> > +
> > +END {
> > +       for (type in count) {
> > +               if (type in sect_anchor)
> > +                       entries[sect_base[type]] = sect_anchor[type];
> > +       }
> > +
> > +       n = asorti(entries, indices);
> > +       for (i = 1; i <= n; i++)
> > +               print entries[indices[i]];
> > +}
> > --
> > 2.43.0
> >
> 
> 
> --
> Best Regards
> 
> Masahiro Yamada

