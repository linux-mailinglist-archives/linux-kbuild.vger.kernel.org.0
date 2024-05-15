Return-Path: <linux-kbuild+bounces-1861-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8C8C6AF1
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2024 18:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0895C1F21A2E
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2024 16:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F512574F;
	Wed, 15 May 2024 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K6HTAu+E";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iMROvKei"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBE8C8FB;
	Wed, 15 May 2024 16:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715791839; cv=fail; b=cJF1ZVWZJ4mqkMFhgSmdGXDFp45sgwvAruiF6scVOlnnrIjMql+qkm8ND12MyeK4eMxiiLSkrSKB5VXnO5u2JHzaKKajSlIaRCQn3Hd35qhtkhvwFR3puF9RpwzADaFSEr+jRxnOji8lhtrdE3wAbVFF0xggyZyx7Q83MOue9Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715791839; c=relaxed/simple;
	bh=VCiE4ORiSWJA2MYIlcjuu6xXwygKsYXyt2vDdEkIQn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YSVYPuhoLjDv1M/DqbbKEiGTKG23j+1ThsHsvMrOExZhD1kcJuJV91qafFlchFQxYHKwE8CVAVlDBCGVyktWHF7IqK7IBH/RB2YHaDLmiHGTI/A2ooYpG/T40/O91srmHFCJws0VhVQkpM4Sa7fHoZrIk7N6uWr5pukUwKeSRmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K6HTAu+E; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iMROvKei; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44FGT3gn015164;
	Wed, 15 May 2024 16:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-11-20;
 bh=KwTsbmsgVUJG/TeRoaPr56E5PNz7IM8XNz+MZI1XEOA=;
 b=K6HTAu+Ef8/Go0aw7MgW0FIJco1IM0sYtMjKLOCAb1IUpVDEoDkK+eSaO4miR5BHkpLC
 hokFpJEBX3jbuZWSBb0LwclhqrcmYorp/LO3VN0zUqdTWE2c9HG+GRkm7cTP4YPdbZRX
 6XAzzd9F2dPI5qAE0rJjdZCY86bKHuBcCelzx99yI8j8MndfeFybzfU77Wmjwa5Quge6
 ayRDxKenCM+Vh3eRYOHOsTF919MRklhqIvtCkI/KlAAQ6z4X8Y351E4+Gk6x3TyImnuR
 Gw31CjuZuV/Q3Xjg3YDo5zJugWToNwJ3F5cSYAzuf7Jgdvb3vHO11P7ms2yl77Pvv8vn EA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3t4fdj6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 16:50:17 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44FFXWIp019386;
	Wed, 15 May 2024 16:50:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y3r86ks4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 16:50:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ztm2b1a+bjSROtbhDuc/p/sCgSxVl2pLACo95WR5SHEqh6qyIa3+ABBF5/i+X9r+WE2eDBIRYez9SgCa0d+Vu/Yd1anBb3jGk48YG1FzTqOZGQQHUX1htx58ZZcxV49oohyML0gFXtJHGZyt39HfAmZ6W9UJKw44obQtBWA3MrDWNQvfR6RFBcPz/wLjF+zRxmt+d05ARe6LV/8Xk+SQKSWTO8tBij1kS6baywsL/NXfTBFSxo9rfpimTW0oUHSB24+zj8SaaeCCap2cB2QbtRNJKVRMshNIeSeSC80gJWENWCTd2qShsV5+LXYQUylrlvh/7E+V3tqXUaoGpgFQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwTsbmsgVUJG/TeRoaPr56E5PNz7IM8XNz+MZI1XEOA=;
 b=BL4QevnMfGke2eSbcXZHfMMDAY/RXqFFWgDCvgHOQu54xfszDi8zg9XHbn4IxdQGYjGd4/b1fLX/Tjdiij1yeSlJ2BcUtosRBVmeBr5J2mn5XRwoFiTVGvwQx72NPjFGo0pXe5/1Uq8gMO9E7/H/CuScE61g/irlLuB0rKsK6k/E89cdGK/oXHwwLjQ6PnmIj5rk+j8xEIV13NcbM2Be+5BNds82efk+brwB0RUhBDrbOBDZrJ+HQdAGdZn8hoqDMRdIF09pXzQxbKVIZDYKUbaHPyxb1uCuL45ClQE28H8YKHsj+oASqbSyNKGp7QkzEd+LJsmZLu5gJEq+T8wkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwTsbmsgVUJG/TeRoaPr56E5PNz7IM8XNz+MZI1XEOA=;
 b=iMROvKeixNpJ6h7jfOV95ZwbMeXe9JEJaUMdUh4iUx78gPORhGfzKjm5O7j9AiGST0RXAmA8NT0xeFG/tNvU1ZI2zUY7NCEB7gLURh5S4Oc1tcwPkJlXzqAY2pkixRXTDW62jIVj4dLK1omOqtDw4B3SQ25xQsaM+inGtLRnWm8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5198.namprd10.prod.outlook.com (2603:10b6:5:3a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 16:50:14 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 16:50:14 +0000
Date: Wed, 15 May 2024 12:50:11 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v2 0/6] Generate address range data for built-in modules
Message-ID: <ZkTnwwyTF0WSMmqI@oracle.com>
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
 <CAK7LNATwSDyAWR2FqccF5RFLpw5CYFyndR0N814nC7G7EaL2Tw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATwSDyAWR2FqccF5RFLpw5CYFyndR0N814nC7G7EaL2Tw@mail.gmail.com>
X-ClientProxiedBy: MN2PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:208:120::36) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: c7771cd4-329f-43b9-44c5-08dc74ff17b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5JW+ycprlHwMMVJY/UNwrWZq6zFaKJKsFDh0w7ST5UbiNfrJD2vaEtgt7BY5?=
 =?us-ascii?Q?MxygFlhixklUnVkeqcv3WaJcVDxwer3Gmpq+aVeOV6mwN8b/o+6xHPZHULW8?=
 =?us-ascii?Q?rOE/kZ8gqCJ7Sd3pa6E3zuiU3ECaijonK9TfnfISqQ2KPqtKjm0Gid+6pZmY?=
 =?us-ascii?Q?pVt2qEGFHK3NvWQy+hKSI/EFXUIAcYhRocmqhTM8OwR4IxO/iTY31Ch4KTl8?=
 =?us-ascii?Q?mOakdMVyxNOuskcIdzLQcIZEhWgNmY0C/17UC87j3y4YjIzUZHOeSLnN+XXk?=
 =?us-ascii?Q?SAShhAEGOojx4/ZiIneEzglUMjIgi7BsrqLYO+k/tr6Ywtk8Hptzqv8/Klp4?=
 =?us-ascii?Q?9UbRHxWaMto5l9BvaYfTRxNbIPEiv7PMY/RILJU0gXN3Il5F9CN5bUuxALmz?=
 =?us-ascii?Q?oqaRDnLk95iY+gzwauOQO/aGm915WkAuXOeKE6l/uN2ActagKIk6MF+I3j6s?=
 =?us-ascii?Q?diMrTNMbauwGeriGZcxYjeAL0n00rUTETbhYyjDw/umEWA6+hKszgGVVfo8k?=
 =?us-ascii?Q?hE7/4b35UihRAL+f39w6zuQYiP8XD7uhl09aOO6Q7wz1jD3HQHB6dj90ndTr?=
 =?us-ascii?Q?Qb6pG9ZooXOEGT3PjAiyL60ta2lEs140PRsJrEtBVb1fjcFMVOHOe/ZuNHp0?=
 =?us-ascii?Q?Wtdau3WHejeHJ13H4PtSh8bP/TQLkIFNerYwM9JlMIFFZYHZFSqVK+Dm0fJv?=
 =?us-ascii?Q?XGt6CPAof3ZmWMmbzQ+yjdzGvWKIXLxLd7oJDTEUGY6m/8RvAk3lRmtBV++L?=
 =?us-ascii?Q?rZgAtkEQLvhKlnG1hMdU5ZUj3utfYJ51vFRcdgW4Q+2wtbkb9mG71ebNAkd+?=
 =?us-ascii?Q?Q5cneJm0NCQ5uDhiqIs//QJBRGDdsjFnDHKFTeqcxkSfuqGuU2O4RLlwpOfO?=
 =?us-ascii?Q?yrJwyHxUo4BDO4mdSV8vx8NWlfFBaoAQoIoymafl2O69OhAtj/oy53oDdCPd?=
 =?us-ascii?Q?BqrHPl/Xp9VlLECwkKx00ynjNuxZTt9ZfiIzEGAapokSLKTi5CTu3cfQjxXl?=
 =?us-ascii?Q?q/hzlDhHUreNnqFhjLfOijnXn2iD1DJAnrz/1TGQOiqa21uY7tyfmP9rOQNt?=
 =?us-ascii?Q?YXuRCbxHtuwbjohz1xe8WfHffmpN/iivxuyPlW8gV0WKjuybaRWWSnLh3j1i?=
 =?us-ascii?Q?dTW7Iyj9l4gmTLOQ1H35LKCFIz7qYdag9DXQD7ahLGwOPJ+/6f9R6LxbS6Lz?=
 =?us-ascii?Q?jZrt0AI4YREtsBB55g7ZIZBNhRcb4oxvA89QiUzZ61COGnqk4bZbDnz/Bcw?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E6YBDXRQilAMBslu7mYe+2EoHzQ/9ckrLY73EWYP9MXFuc67YXQqderLVWP8?=
 =?us-ascii?Q?O9XTUoB/qu49zBM+cVjrff5WMIqQo8LNs/OlE4y2hg8r1s/P4D3CXr0pCviP?=
 =?us-ascii?Q?lWHyquj1ErEGUXmwKM8xiLWv8DERBh7C7CT9YSya2wTybFuW/nPQWtPVZqS6?=
 =?us-ascii?Q?9g4U/2Mzll5ZOtEyUYCA3R3ReA7wujj/TPzlMUj9H9f3OSmQHk6SDHw8vzAq?=
 =?us-ascii?Q?EezqGGLGWus9Hk/EVAKzXr8SYb4bIyvXsMoIQWG69CIVmtjr9ikNygV4z59T?=
 =?us-ascii?Q?VZcqk3bM6uaUjR+Ffnq2pyEA8DMXmh1W/76ZiSVB8EDogeOmXJnIOIma8+6n?=
 =?us-ascii?Q?PDkQYkNaU0zNwu/+QvXyUNzZ4WaSmft9mTuZbnKW1fXRXIR/nOJPVcXb879S?=
 =?us-ascii?Q?NDVrKW7cE4H8hxNs25OgsRw0M4aAqULePkA83iuiVOGfOb71Dus7Y+x4vE95?=
 =?us-ascii?Q?RHcs4ET6b6y+auyzo3DlLwX7P4+j5letw0345keAMdg/3cPSwS8bWWgfjTQJ?=
 =?us-ascii?Q?Sc0D5oBgiDUZglQdSQIHmZF5nMj+to58UI6GtI1KlurV0JqbFImYzoSgtnQX?=
 =?us-ascii?Q?U5d+ETQ53qhbL6j3Rje/H8vLSUnMObnNxI/eSi0fDKuFjpeB0uvtDisgNCU4?=
 =?us-ascii?Q?ewG9jI2OWSIdb7p41lgMN8W4fLUaH3IK3kQzw0Ssy6IegsWBci0VypNnq/If?=
 =?us-ascii?Q?5oa8+9z2FXAq5g8/B2KjfSkjwd0mrV+MlTw80E9oKlIYh6UlSw2bXb74ApfT?=
 =?us-ascii?Q?L2SsxfrNIov0Vk3hyzBAZbwx5YBxsyAbFOtzWJ4oKGnExihqi6OD6sCZ2O12?=
 =?us-ascii?Q?2u5obRJgrfNGoRB/2p46YmLtvONYDYr2lYfb3ctPr4HclhCSzdALqTn8rQws?=
 =?us-ascii?Q?Lqu/GnVlfQxqMRoBr3xcVJ9seU0iCByzVFljFmMrEUlgOABpq7tOpUh6cmot?=
 =?us-ascii?Q?Q6Xs6LRZd4XtQPLgn9Q9qT5/AhOpXFSnHgq7G8W8qwv0HNi+JS9a5zxzxr8u?=
 =?us-ascii?Q?6lAsx6YeKSgpqX6bk7aFCItH3Q3t3qfUfqq26R0sixcbC9i656GsbjwoMS1/?=
 =?us-ascii?Q?hx3K18LPhqfgt+B9ENrx1gPA9qWn25luftzzB0uIoQ13xXyKqhjW+VQWZu3N?=
 =?us-ascii?Q?C4DHaYzAfko1fyUXhyq0qHPQr4OpLtUNPtAkKYumOZIMenLS/aQ4WrOIcNCl?=
 =?us-ascii?Q?vTsk+ugiqMCTr/JpwXS8XNLEh2SEpjP3p4ABzEYYiHSYGwoyo4y8LUUnSyiW?=
 =?us-ascii?Q?rz7XX0gGq2LGeTk1r3+IJSA2OEozq4ckIHVzV7wi5eQ30mQve7/Os5N0LHGW?=
 =?us-ascii?Q?peoBFt5Lok4lqmmxZUNnkgDy5pP99pb+ijlol7PikapPhQkjyPvL6/cs1e8n?=
 =?us-ascii?Q?y23245Lt0Cea0wteUaMbmTc0V0RZc+tB3x+AY2ewCEg9Er3RhGhqFfc8kdO6?=
 =?us-ascii?Q?f/XZ5TdHeBUIfiBSGUDQwYwSnB4FhRW5nt7j78cSOxEk7C/GaHFv+Sh6SiTx?=
 =?us-ascii?Q?fkq4CsmXYoThjEueI76Dhy+x+PFq8qMaQeM01rqz9QEXyUZzatxOYLiX1L0W?=
 =?us-ascii?Q?V+K3+ZEU8oc2fHM/EBx+VSlzW38INvCABH7Qg5zWPOaMRpz8D00JfomA9zWf?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QFcebcwYRl5LM9h8Bv1IlftDA2f/4Ud0yQPVSenylKeL+8NC6xgDmrdNJ7cJgOsZvzvW77Sw/EAcku9WOENCYVWPyhxfqQF5trD2a83hshImFxqdo8Q9flulrnZY5dNwLYBGJpKrw5CsDwua5QjMTFzWYdK+riivj7wIrKEo/DuenO7fOLJ5kVGYBwWun//k3zFCyts5+8IusbphX8hBB0wsqDelXDXqYmBoFQrxMumwmMDwDVMQHoQwkkaJdPYr7XyzoOAHz0nrCdCW2erfiNKN70C1Nq2mcu3k6BZI8uQdWenticEwdmjhZyHybNxPt1n4zH4+ot5mwxNsASeJbvs2fed27CQj00Qb5MiSFwhQgiAbYilmAEZg3FiZfNujx/Y+LfmGGRiMsybZMc7iJVAYAH40bqGnO0OTe4XpFmfl0ihspvfp8Nx35BDigInlES7gNyvqb45G4wsp9v8ZozdXU97d5+CwVK6Mfp/cFwSVnfJSeJ47QcLFN55BWDddjqRklGEg1yG2V695wpFMxrR2QQ3CxyNkSzpoqzt/VFkabVTZS6OCumFs05XTtY8xTQ+KCg1vnYXbSrOExuErhCPeJ6g/BwqvlNs411KUPb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7771cd4-329f-43b9-44c5-08dc74ff17b5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 16:50:14.3705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n492pvsz9DqNcdkVe8cpM2W4JY/W6nkA1ASuemS2LNgnEjVabtOPOL7D0mgqifTbMWLELbYrif3TmJETkuJ3UKEJSaUGiyiLf2pr6FkQjm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_10,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405150119
X-Proofpoint-ORIG-GUID: vzFI6vPEyGzqD8TLOaMSbDOSpSDHHoyw
X-Proofpoint-GUID: vzFI6vPEyGzqD8TLOaMSbDOSpSDHHoyw

On Mon, May 13, 2024 at 01:43:15PM +0900, Masahiro Yamada wrote:
> On Sun, May 12, 2024 at 7:42???AM Kris Van Hees <kris.van.hees@oracle.com> wrote:
> >
> > Especially for tracing applications, it is convenient to be able to
> > refer to a symbol using a <module name, symbol name> pair and to be able
> > to translate an address into a <nodule mname, symbol name> pair.  But
> > that does not work if the module is built into the kernel because the
> > object files that comprise the built-in module implementation are simply
> > linked into the kernel image along with all other kernel object files.
> >
> > This is especially visible when providing tracing scripts for support
> > purposes, where the developer of the script targets a particular kernel
> > version, but does not have control over whether the target system has
> > a particular module as loadable module or built-in module.  When tracing
> > symbols within a module, referring them by <module name, symbol name>
> > pairs is both convenient and aids symbol lookup.  But that naming will
> > not work if the module name information is lost if the module is built
> > into the kernel on the target system.
> >
> > Earlier work addressing this loss of information for built-in modules
> > involved adding module name information to the kallsyms data, but that
> > required more invasive code in the kernel proper.  This work never did
> > get merged into the kernel tree.
> >
> > All that is really needed is knowing whether a given address belongs to
> > a particular module (or multiple modules if they share an object file).
> > Or in other words, whether that address falls within an address range
> > that is associated with one or more modules.
> >
> > This patch series is baaed on Luis Chamberlain's patch to generate
> > modules.builtin.objs, associating built-in modules with their object
> > files.  Using this data, vmlinux.o.map and vmlinux.map can be parsed in
> > a single pass to generate a modules.buitin.ranges file with offset range
> > information (relative to the base address of the associated section) for
> > built-in modules.  The file gets installed along with the other
> > modules.builtin.* files.
> 
> 
> 
> I still do not want to see modules.builtin.objs.
> 
> 
> During the vmlinux.o.map parse, every time an object path
> is encountered, you can open the corresponding .cmd file.
> 
> 
> 
> Let's say, you have the following in vmlinux.o.map:
> 
> .text          0x00000000007d4fe0     0x46c8 drivers/i2c/i2c-core-base.o
> 
> 
> 
> You can check drivers/i2c/.i2c-core-base.o.cmd
> 
> 
> $ cat drivers/i2c/.i2c-core-base.o.cmd | tr ' ' '\n' | grep KBUILD_MODFILE
> -DKBUILD_MODFILE='"drivers/i2c/i2c-core"'
> 
> 
> Now you know this object is part of drivers/i2c/i2c-core
> (that is, its modname is "i2c-core")
> 
> 
> 
> 
> Next, you will get the following:
> 
>  .text          0x00000000007dc550     0x13c4 drivers/i2c/i2c-core-acpi.o
> 
> 
> $ cat drivers/i2c/.i2c-core-acpi.o.cmd | tr ' ' '\n' | grep KBUILD_MODFILE
> -DKBUILD_MODFILE='"drivers/i2c/i2c-core"'
> 
> 
> This one is also a part of drivers/i2c/i2c-core
>
> 
> You will get the address range of "i2c-core" without changing Makefiles.

Thank you for this suggestion.  I have this approach now implemented, making
use of both KBUILD_MODFILE and KBUILD_MODNAME (both are needed to conclusively
determine that an object belongs to a module).

However, this is not catching objects that are compiled from assembler source,
because modfile_flags and modname_flags are not added to the assembler flags,
and thus KBUILD_MODFILE and KBUILD_MODNAME are not present in the .cmd file
for those objects.

It would seem that it is harmless to add those flags to assembler flags, so
would that be an acceptable solution?  It definitely would provide consistency
with non-asm objects.  And we already pass modfile and modname flags to the
non-asm builds for objects that most certainly do not belong in modules amnyway,
e.g.

$ cat arch/x86/boot/.cmdline.o.cmd| tr ' ' '\n' | grep -- -DKBUILD_MOD
-DKBUILD_MODFILE='"arch/x86/boot/cmdline"'
-DKBUILD_MODNAME='"cmdline"'

> You still need to modify scripts/Makefile.vmlinux(_o)
> but you can implement everything else in your script,
> although I did not fully understand the gawk script.
> 
> 
> Now, you can use Python if you like:
> 
>   https://lore.kernel.org/lkml/20240512-python-version-v2-1-382870a1fa1d@linaro.org/
> 
> Presumably, python code will be more readable for many people.
> 
> 
> GNU awk is not documented in Documentation/process/changes.rst
> If you insist on using gawk, you need to add it to the doc.
> 
> 
> 
> 
> 
> Having said that, I often hope to filter traced functions
> by an object path instead of a modname because modname
> filtering is only useful tristate code.
> For example, filter by "path:drivers/i2c/" or "path:drivers/i2c/i2c-core*"
> rather than "mod:i2c-core"
> 
> <object path, symbol name> reference will be useful for always-builtin code.
> 
> 
> 
> 
> >
> > The impact on the kernel build is minimal because everything is done
> > using a single-pass AWK script.  The generated data size is minimal as
> > well, (depending on the exact kernel configuration) usually in the range
> > of 500-700 lines, with a file size of 20-40KB.
> >
> > Changes since v1:
> >  - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
> >  - Moved the config option to the tracers section
> >  - 2nd arg to generate_builtin_ranges.awk should be vmlinux.map
> >
> > Kris Van Hees (5):
> >   trace: add CONFIG_BUILTIN_MODULE_RANGES option
> >   kbuild: generate a linker map for vmlinux.o
> >   module: script to generate offset ranges for builtin modules
> >   kbuild: generate modules.builtin.ranges when linking the kernel
> >   module: add install target for modules.builtin.ranges
> >
> > Luis Chamberlain (1):
> >   kbuild: add modules.builtin.objs
> >
> >  .gitignore                          |   2 +-
> >  Documentation/dontdiff              |   2 +-
> >  Documentation/kbuild/kbuild.rst     |   5 ++
> >  Makefile                            |   8 +-
> >  include/linux/module.h              |   4 +-
> >  kernel/trace/Kconfig                |  17 ++++
> >  scripts/Makefile.lib                |   5 +-
> >  scripts/Makefile.modinst            |  11 ++-
> >  scripts/Makefile.vmlinux            |  17 ++++
> >  scripts/Makefile.vmlinux_o          |  18 ++++-
> >  scripts/generate_builtin_ranges.awk | 149 ++++++++++++++++++++++++++++++++++++
> >  11 files changed, 228 insertions(+), 10 deletions(-)
> >  create mode 100755 scripts/generate_builtin_ranges.awk
> >
> >
> > base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
> > --
> > 2.42.0
> >
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

