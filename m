Return-Path: <linux-kbuild+bounces-8524-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE63B2B6AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Aug 2025 04:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CEF13AFF02
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Aug 2025 02:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B7E189F20;
	Tue, 19 Aug 2025 02:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JSCWvJqB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yoMQxz37"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE9235947;
	Tue, 19 Aug 2025 02:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755569063; cv=fail; b=DMcW634XG/VQBvJ1gQ3osUa7AElil0L2YQPpuaD+QfwUAV1Oaf9HE9xvz7ToiEC0TeCoYsSL7TGXCtUIDFzKZoDo/Gys82dn7D1BgcTrAaNeekZuADgO3IPH7h57sCCCEShML0k7JLOfmMTmJs+YD3yW89DOyb62hiesCiY2P9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755569063; c=relaxed/simple;
	bh=TCJ5pfLQiu+F/ERUKHs8yUrzSH7PQWMfosc1uDSarY4=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=sTwIlRAQOK46Kr8zZ/YG6PmQ1X/X9ylEcWVUOtxJ13nkxghq8sTbZh0LnQybF9BtoGjH3ES706rYPjtfXmH+WeD+0txLVDtXaavi3aVU1vM+ODoqSI1dJADubvKPgwOvsMLbHwcKB+mf7OSWyOlaFRb+YcXhqACzhcL63kxI39Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JSCWvJqB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yoMQxz37; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IJgNsh024853;
	Tue, 19 Aug 2025 02:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=293pOBBf8qQtsL/FiG
	S6v497tzNxEQNuIEfot+zdCtc=; b=JSCWvJqB0/H8wRL4finwIUQSeN8qF4k13I
	8B7LETIdvWh6HxpSCju3PYQmy2QPYv8TqLUiF6HxdphyvUii651iHhoPPzcHajig
	EjIRnf6/NS+6Kgah35R5Fc2XcnhODaWv+dixqyGB2xcCv6lzUY0aFPEMSTyQ8RkA
	5zxoWpUTi8u1MO8ioFgyTRAmUxYPRbAgmAUmUnTG4+2jxt4wVrHob5yzjtzE4oA6
	SapFV602O26oHdjvWoft9kdJXLvBMHClDg4WhyoihlCX+dF1+UEK1K66U1Wg+h6+
	opKAfgRc3pdTFkKNUyKQ9NjroytmZfI6CA1aRwQF2SJfQPxYrgOA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jj1e4a8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Aug 2025 02:04:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57J0bPDS037155;
	Tue, 19 Aug 2025 02:04:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48jgea90rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Aug 2025 02:04:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqC7QAWvssW6jO/WRFYQblrXm60y3A+SjBkwFgnSe7T3qBNB6uEAvYC14JNlaAwKPvUrpSV3/tXMiifD0J/Lf5o+qh0e/hnMS+0rydAdVlu5uyProQpIcC046jM04XSA/ATS8w6i/OdR9uhMOSlbEN9YjgSjqkdInfgq3UQ84RHu+8Ygke1yq/GZMhVt540eAyQMmHawuOLilEfTk+MzqopIhp0KLFLP+nAHsELIp8hy7e/bEUYR5FH+U7lIcHRamo4x7Q3LEkwxfd+bC0wiRfSwruaIcJoCdcS63doRInggOFmzlGmBv9yQWCK+3enIT3zekp3SmmS0FVjCH43cHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=293pOBBf8qQtsL/FiGS6v497tzNxEQNuIEfot+zdCtc=;
 b=VdYddYbYmgMi9TzzQ2YTthenpl7PL/IeRVZg/J0IvqNvgtorKrXtr1tMhSoTK8Os1y1YHH7I+HTuWg6uuG/kAlP4ZU+gOJy5TIA5DqdPh5+Ohjj2cE8WcqGWd5Vy5GyTaSo22H+RYlzimKsEvlHrChQ6jXddpAuUmSX6B/O8qBrlKUwgJEIRLK0V+WkwEkAzcIIRSuhGTnoWAtOyPy7/Dy8uQnuTmjMBy1ZHAoisxMBSSr8xEqwhsayn2S9rcN+COCMVaNthibb17IAEZRpk3qzR5X19AmUPkS2HOEi+GMi2xt6rFWB2Xfo85OCOQ3EyO+y9fC/X+W5RlyeCcN1UNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=293pOBBf8qQtsL/FiGS6v497tzNxEQNuIEfot+zdCtc=;
 b=yoMQxz37rDJiAA05ix4JOSGT+QpIplJK8y8qWUHB+aJwBSiIVTmIw4/DU0U96LuyQWwIUT4pL3xF1e0Z72b0+pDJ47tOVMJvUlNTjqdIBxN8amHWUSRbBxj2sIyicb+tgBy8ZkhmAvewst1FAf8u7DHLajFzyS7/BwIBinLGd2M=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by LV3PR10MB7962.namprd10.prod.outlook.com (2603:10b6:408:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 02:04:05 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 02:04:05 +0000
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier
 <nicolas.schier@linux.dev>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Petr
 Pavlu <petr.pavlu@suse.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Sami
 Tolvanen <samitolvanen@google.com>,
        Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Khalid Aziz <khalid@gonehiking.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org,
        James Bottomley
 <James.Bottomley@HansenPartnership.com>,
        Arnd Bergmann <arnd@arndb.de>, Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v6 4/9] scsi: Always define blogic_pci_tbl structure
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <93ca6c988e2d8a294ae0941747a6e654e6e8e8b8.1755170493.git.legion@kernel.org>
	(Alexey Gladkov's message of "Thu, 14 Aug 2025 15:07:12 +0200")
Organization: Oracle Corporation
Message-ID: <yq1v7mkxe2h.fsf@ca-mkp.ca.oracle.com>
References: <cover.1755170493.git.legion@kernel.org>
	<93ca6c988e2d8a294ae0941747a6e654e6e8e8b8.1755170493.git.legion@kernel.org>
Date: Mon, 18 Aug 2025 22:04:02 -0400
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::6) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|LV3PR10MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3db216-63d3-4807-8031-08dddec4ac9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2xHWkLKwZJfa9iMpIVfG5lNGVlrc+4qq4O97BzEDEqQwDW5uFy8tNTT6Wnh1?=
 =?us-ascii?Q?24BscUqOJYj3e90QbCeKePkIXVXVuAZtIGnnQTIeGbDkVNOz7ksKPBx4dfHK?=
 =?us-ascii?Q?sOgBo5NYjfJZrygn/FIBh+Gl/mtsqhyXun7K5ekEP2hLo9cjZVJ82vnfgbbk?=
 =?us-ascii?Q?CNCorx8p/yVctsO6XPK9aqvzTERE7gVp6ZGEsMNvbAwdBFC5pgdmewqjwqtN?=
 =?us-ascii?Q?ZK1nYL3sg3YU/8wsZHc22VCNLxzG0Kh4wJsqeI58VNCfWxy5QTVRbKWBYfKH?=
 =?us-ascii?Q?MHFRHtJeuZoa6la5PE7eTXCTguw6AkQcbUpCPNn3jNtvjj7b+3dz3wxOBovY?=
 =?us-ascii?Q?JKeT4PLUtm0SpaRQVnbufO+OgpltLj6u3NKX1QS9KVkkf4Ow7oG76J20KCgf?=
 =?us-ascii?Q?0ldZeI6Zusw6ZKmSwNiHf7YxpSqrVBUFYA9ngmrVA67oahpp52jmye8COzlU?=
 =?us-ascii?Q?Lk7lOU+NXcOw3dqDWJ5OQe1u32WTVynxEovMg/xmSZP9zf58y5W+4ZOpPqkm?=
 =?us-ascii?Q?YHe8mzvNuKEX0EmV/zKm3Bus2POCe2W+JebIg87Oz1LFoRV3ro+G72uQxrko?=
 =?us-ascii?Q?2/cAGcRlPZbdHhFLZQQ64LX9kdE2Q6Ro91QokVynHm+raAt661o2Ypu+Zu7j?=
 =?us-ascii?Q?AoMMTG+I9dTfRrZwwHbz75TT2LSVXHgV5mUAU5FbWnj3f3+sum6Mp2m3l5TG?=
 =?us-ascii?Q?hA6xncfnaJLXezEL9mgohDiPW0CC8ETzppXHpBzmhFGKlaWO9MiYCRKpolkF?=
 =?us-ascii?Q?ZmSOPd1cM1PwCKY9xqZ3HgcfqRLE0oqzzGNzBy+aEMDyqvlFWxeN3TICedQ9?=
 =?us-ascii?Q?xQM/Nh6mDaAg3RSZCpjngnuJWHbhrkKCNjrOyPebhaiBLwstfkWvQkUUwyvz?=
 =?us-ascii?Q?AGt2JmXy/ChiLI2qx+SrNpng978t3tWkAZc4AHpMtQdNWI4t63BX/tH0WlGM?=
 =?us-ascii?Q?9lHXo2uB0z8iCNcaToXfBG7faDh7IHlwzNf9sZA0YS0YG7meFnngic7GaKV0?=
 =?us-ascii?Q?fvrnalk/a7+TobsOwxp4MKGTif7rMkY4VThZBXvX6dtRo77R2cOeMvhli/r9?=
 =?us-ascii?Q?b2z4jwRWxpznZwo638ZngsGhX+1ucSU+7LsuLd9P8WIwlIEw5U3cSnaYXQZ/?=
 =?us-ascii?Q?HtN+Dy53f+t3Oc5gBdPojc7Oy5UpRr7QsnwCe47PundhJLP9CbIYX5d8DzRK?=
 =?us-ascii?Q?Efhx9YWkH0aRPWlCbcy+Xub8zdqKTYCToTXw4ximIvSZHjewiJ8vAZrCGPqr?=
 =?us-ascii?Q?fAeuK2+bYeoJFcERUFIooFPA2R6OqH64ykFIl+pARwspCQ408Eph2GGJdKbO?=
 =?us-ascii?Q?L9KDsBxE2EdIyNY/hn7lu1kdNk5SNjZSuqB0k4YciFAtmVBeaXdNh5wKEKRK?=
 =?us-ascii?Q?XIQ8ibfMkmH8ldjE2NPDGfmaXNn6sxH4HeAVX22/l+cpZoqmUV4JXhnGUPhQ?=
 =?us-ascii?Q?45Gkn4hjtIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CHb33CcCqiWrA9NbvUoUsI8KghEHZyo8FZY9zsWhSSZHFuwAXwUCS3yYy4qd?=
 =?us-ascii?Q?l/2nzDsw3phg6pYNqMAis1M39ieLY35D41MPyEAEDX2nAyfOIn/9E/HPnjYS?=
 =?us-ascii?Q?l1gZQTEPq8fV4oHa+BrAos7uj7CbBnKnutEmAsnQxgTjYKfOG7GblxG/NDZ+?=
 =?us-ascii?Q?5X5bx4clWOeakn9Yt0wNaYHE6gHrv/j4GP+yyWKZcBAr8yLucqv03r8lM/1x?=
 =?us-ascii?Q?0lBnxcHujsUMqpP06szqjQydfY6AhY031V2UrUJ9HN5WyN3FO8fr0SezuEg2?=
 =?us-ascii?Q?F9qiYNEAAfHbJtiwqdmM5hVLGwC+Q0pgXCaTNfIHqgqkhG+vOcL5ez0ZFng7?=
 =?us-ascii?Q?OXIqrPNq6Y32g3t0chuKtCV9lZ11ms8YHn2osMSZzSHPnB4sd0Pz7hOQFGx1?=
 =?us-ascii?Q?wdK4O5SEinO1K9z+1UkIg/cKP58jxx6eJI/7T5tyIRr3HSAKABtrcE3GEXvH?=
 =?us-ascii?Q?o8Po877ew+cwtPvEpkwuLdVtSQTBRuhmY7NtQu2AxcX5Rdukeqr6+407JWYC?=
 =?us-ascii?Q?kJhD4waejYtd6CjUYIt/lMQGqKRUNWMGz5JrVa53dydKmM2wKfVpGzvdwpYb?=
 =?us-ascii?Q?R2oIKsUyKJ2GbaQ3ugT9aPlxja0nNlI0JNwecLQlLfpHIMlBDHIKIG4M46wu?=
 =?us-ascii?Q?cib2cVSIJgsahFfQzRboUzxNE1F5P5HtGqFv8++uXBAOU5DQJ/OHMWIyRL/G?=
 =?us-ascii?Q?2Nj/1/LkMRLt7HlL956C2cCVygBuba9ucUl04qo7xgg8KDDelOiAWePa7XSa?=
 =?us-ascii?Q?g/x8AVXD9x/jPIOkeU8MT4z3DaMypVe9RNKEd9fnpws9GQiRDZ+ZK/4Aa+0Y?=
 =?us-ascii?Q?mlFEg3yKLqYnNQBlgDufORiHHjRq3MTSWjpicA3x17dOvEDulzxOD38VfiYn?=
 =?us-ascii?Q?Y7ZFYPH+ThRRenAGVV0Yq+IoAZl2PA+XMIKhJwL3BHRb/jIppkrnb0gynZbh?=
 =?us-ascii?Q?rqSrYng+svZDzIzk7pL2UqO9Eon1WmQMBeIB8+ybHrwSYwFY3OI374eB4KnL?=
 =?us-ascii?Q?iwWohQlIP+pSrk8dom1+WYcxBxQQggiMMCK6LeDi5zh9ek8THBsnN5cEw53Y?=
 =?us-ascii?Q?sMQsatIkmqV0xbPh0BXRFs+RY9DiXvrXrMJiQLwn6RfuV9sfHPJFt6J+wC32?=
 =?us-ascii?Q?ajOL0zgWnkRTGrs21PcYGcT50ulXJ27l3cY99G0WCXiZoOVRhY9to0x7kXzE?=
 =?us-ascii?Q?uWacduZ3/ZCf3/GeSC7YFj7JoLTJrDIGWmBH2/WCrEa9vNwgouuIwRxOOqpO?=
 =?us-ascii?Q?qQoeV8eleH+2QGebbx2zwktF6o5WjT/hEbCt4jx/ws4yB+F57M+60uDJDb6z?=
 =?us-ascii?Q?gkZjUBNCwHXkkl4kcXLzciPKjQnRSWVHKo5tRZ25fMgBra3nZY7Oib+eVFp0?=
 =?us-ascii?Q?xb2kgkoSV7kj3weEXzSyFRHxtT/zDmnya5rOO1rin4R+RWulMJHx0+zQ5LGP?=
 =?us-ascii?Q?hvfRH/JzTkzNxdP7JDelg6jxXhnyjuLjKI327uK2qDDLtrLA3phdGoEUmCnR?=
 =?us-ascii?Q?15Uwhdm9AnEzR9PV//3VO4DsCFSQfeEXhiMtISpUnmwPHpmzTWN+j2j0//g4?=
 =?us-ascii?Q?MdYnc9xauWjpCZFQABVMfGF5hea390PUZIwjejFdDggpXeaI/YTG9VECKqPY?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kZGG7oUr87aoVGNx/DD58bze04JeO0aVisdgIW33IpxuNoq/7QJaQBJALtsfrMaW4U+uXmvnULqiZQXm2wcvpwjtfNppP5gim6UiEbksgqYSLctrGqlU9nE1fb2voY4ZjXPZEPxf8jjR8kJe4HL/qBBj2TetvfUlLRmu1JH7qYHV8iXVoxXQC8gRS1VIRf052tCUUtyiBMkRLXbJvctweMSSVfad2nn3VHFlQNAK4+R7fbJroO5Qa+D67xMTwU7TZB7nPZ/nbYyR3sXq9dQeecJ/8Xql5Ef+Uj7uK58Hxp9hkj8g/V5oBMmuTtWTHI2tpwQPugD6uwV0TZCOTnqCirPAweGzJsH4k4J7ot0CnIvGqd9wQy/nqKVX9w05bQ3twU0zZXRBI+GBWeBQvgp7UjPI7UNFRsA3E88AJy11kW9fLoR50jSfAr1auVq8dLzSW6kf6HqYhQesA5wLpnipxgbqaUlCY6aAeUyNWJ2Fx66lI/2+SedUG+eRCiG2D1X6UQ+N4VW+nn3b0YriG5Cr9T+R8+a4as1Pg2QSmQscus1bmqouhAEyKC+5DlOXi2hXbMT44OHcvq9qwJmVK0It8ON2qH3jeb6b5yNdRqnEuEY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3db216-63d3-4807-8031-08dddec4ac9f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 02:04:04.9825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMVJUE7CH/u0jSUisRvvjFNssQ2uEWLw6STB8uL714vXeBmPkSr2sg0bX3RZwjd3tlAuy6+D+RyLt4wrzsB3ygLst2++DY2V56gZPfGpmmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7962
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=938 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508190018
X-Proofpoint-GUID: 4-TxZnwVfmRPNFMo2L8iLMRriFlPKWJs
X-Authority-Analysis: v=2.4 cv=dN2mmPZb c=1 sm=1 tr=0 ts=68a3db99 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=CEIZDvEd9kZ5D99qYfAA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDAxOCBTYWx0ZWRfX8P1pdaz5H0DS
 BWCEryfrlPHC/y0fkZYTbKKioblEcweDkDcPKz3bAu+HLNXs/Itd+WlsO0GNrvwG3a4oLugrN8U
 fFJpc6ci0THZF2XbcqCO30E5cN+lPA9EWcOIoaxd2H6l1NmfI20vth6iwLRCbiT+lwwXr9fLQ0E
 HUfd9pv6QEVZIuAPCEk99NBInCzm968g6rEus8JOypsznlZOQSMxFLlNHz8RKef5jYvQZtHp9lh
 0OkErKiHlGKn7V1310c2xOXOWmAzz1D01/2sMjeQ8NrYCVT7bovindQPbJXWCEIT+YgvmKm6WhW
 iF/pQ0dx2i91AXA1QnssiGIePjXBPEgq+YwNRDOB558mmrRq3+ywGW/UeZ6EvWzJQmQSxXbhPAJ
 S28GDk7+5+B6w6OOaM1HKT6ANmo59z5pmOo8Phky6Yeco18DWLDhAw00cNYGhZJxTYkeoJOP
X-Proofpoint-ORIG-GUID: 4-TxZnwVfmRPNFMo2L8iLMRriFlPKWJs


Alexey,

> The blogic_pci_tbl structure is used by the MODULE_DEVICE_TABLE macro.
> There is no longer a need to protect it with the MODULE condition,
> since this no longer causes the compiler to warn about an unused
> variable.
>
> To avoid warnings when -Wunused-const-variable option is used, mark it
> as __maybe_unused for such configuration.

Applied to 6.18/scsi-staging, thanks!

-- 
Martin K. Petersen

