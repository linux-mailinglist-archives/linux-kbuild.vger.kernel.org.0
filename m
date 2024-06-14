Return-Path: <linux-kbuild+bounces-2130-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA624909220
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 20:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75E501C221B4
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 18:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3418617FAAE;
	Fri, 14 Jun 2024 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lhg3oBCo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RtK2nGxx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F10A146A8E;
	Fri, 14 Jun 2024 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718388675; cv=fail; b=rmKE+cjscuUsyxUKDUnCp9Bq6TyrPsiwFzXAbv/jYfiQdwsw+vuQ83PSpzbUxJ1fbFZkpRbTabw7Gun38qRRrfYZC45x9daygYTzGYlGkzSHqo84MbLBHv0mDEBYM7/LzZ35VDY9MDcGGeUwbS2pPd8T8sq1Rax1gubWYxmQh6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718388675; c=relaxed/simple;
	bh=G97W7fqpTySho9Ot3GDRUdDQxdYST/wAMurEDeyyAuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uiCQl5+astocHrxxzaZUvAkkE1u/tVobfajkT4dZx1a9O+CpmNR+HJRZkzHD7Lweg2ugDHWnsK7cWihfrmjNFBCrC0QAbZAp3N8OKs1h9CHsBVDQrN+8u1dxBYIiTTA2D0uCydNSj2unEIdEMW+4viX6GQejwuRutNKZuS829o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lhg3oBCo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RtK2nGxx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EDH1tI021848;
	Fri, 14 Jun 2024 18:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=ardUvGUGjN14U4D
	GglVLGOjOOyi8fBt1mEuyKPtOdJ4=; b=Lhg3oBCoZqvfYQ8eC4o089FbTMV/clH
	BGp9XK2WpASLNpB5QlAb3ycTAMPrvrQsm9/aC2+cqpgwYuLw7NlvTFvBo9gVnugd
	uere0OQJmNu3R1H3ONz86M4VuCa5v5JB8kW6wE/Hb59fRWjPe7EHXmuUX19vhWMo
	/d0iXJFEv1JQk4g/zG1OsH/9hkL4Qvsknkqwo8Md0MXCbYbhf0wkYG49FXQ+F0GD
	KMoKpQTKWkUFSLIgxOsHO4M7zm4Lm5rv9/fZ2jfwklg8w7y2wa+MTcFrpREyYwXB
	Kp1csVLXFzyzRWYTwxE6SsWzYpzZ7qfQ+OM3jtqinfYaIeZaRHmb8RQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh7fv3v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 18:11:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45EHk2l5020035;
	Fri, 14 Jun 2024 18:11:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ync92wf79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 18:11:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4LU0oMn7iIaU1DTGP3jCFhpVHQfHmYg0QzRC/T+9YLnnAMRp9L49nLyn2sG5iXVrIpcyt4ZDWuk0SCOHDfJe/AwGE2Az/B1gnIZpxWpJSn1II1fqvCgQ0q2NtYzNDEQZj84lW29+7dPIBzVcLji8redIPmXM3HafTzu1mgSWKBPBnrThdKgsDs7N+pGy/me5ZfUWQnSqYK5BWLAdqv0rxu4/twIh6C5B72+JA8BQ9VCWoLfCRfvYg24bUK5BTD87WN0YPSSnNORYAbpkz4iNT6Ea7G1GXWwdMTUdLb2o7rJAhBsKhhWq3pozjOZ5N6nGesN9BA4kfnpDSq7ZgbzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ardUvGUGjN14U4DGglVLGOjOOyi8fBt1mEuyKPtOdJ4=;
 b=gG5kE1YJDFPmzACLOu4qHK6w0TV9w+Bi544JiIGHgMNk+DStLMFKTb4To/YeckOq+mi9Tn9nDlUktYzRLjqlje9nuSyGrXkkQYQ9XJlSPu0Mrvna2sNBr8/Vsr3KhpiOdNycjqHE8GR0rPmMcb30uEvFvnU2Nhx4yJy2iPU0T4N0e407wFc0vejTK6QrIyXGwKIOevwjkyM6z1/D8XwfmJ7zoJDVVx/VEou6iPDJjewiNl4WiOS4qgADYBk2F+cUDz1ZGTGpSJ0CuDy8SJadus30WTJ6IWSif34bkN7dsdZwfXJZvHLICbUYvUna0OcuW0j4lkcCcVYfzZ71QMfgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ardUvGUGjN14U4DGglVLGOjOOyi8fBt1mEuyKPtOdJ4=;
 b=RtK2nGxxmwqDwF6As8GSvyGXUPMFnTZSlW/9G+aVfl0WrPYCQJThtddu0B5dSIzKsaVYzKdSbxrXsINa+C7ZbZvMscqrja6kOWv9NH5NUcQyOHNfDayO3d75xMDsX0rChiOCUz67mZq129DFdhqr/Vfizbz89ZrsrcR7yUo8rvo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW4PR10MB5881.namprd10.prod.outlook.com (2603:10b6:303:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 18:11:00 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 18:11:00 +0000
Date: Fri, 14 Jun 2024 14:10:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v4 1/3] kbuild: add mod(name,file)_flags to assembler
 flags for module objects
Message-ID: <ZmyHsnXQoWgp7F2X@oracle.com>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
 <20240614171428.968174-2-kris.van.hees@oracle.com>
 <20240614134651.4ed2091d@rorschach.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614134651.4ed2091d@rorschach.local.home>
X-ClientProxiedBy: BL1PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:208:256::10) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW4PR10MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b53a7c8-2643-4b4e-f926-08dc8c9d58bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|7416011|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nQHnTOxLXEaDmfpkXFm4jVrdWEGb+bpoel3U0Ty4iJo2RbBGrAgHx7hKg6l2?=
 =?us-ascii?Q?CP4Cnaj1mKKbBOylUg9pcXkAoANW1t3sFP6OlRixZuIJ7vJuMXpHUwCO19Ev?=
 =?us-ascii?Q?WvVCxen4rSfMOU8nc8wzJnrcmrxHDvKL6oCkB/UEBbTWtQfhZ33F3na+/yGs?=
 =?us-ascii?Q?QdaRXMl1s325EIT99Pq9LeELXvZHMqfdAmWwNPfQnwjvxjI1BNtPs+S1Afk5?=
 =?us-ascii?Q?uuKP2+In7gv75EU6hk7tQchu8m5fzqwcxxfLTPz8E6dqhmnNLhphPxopW+Lz?=
 =?us-ascii?Q?mHSw1ySaqgZWHlc4NWHJ6CkVBcF5PsRi408Ey+IQVuCjQBFMJhmBGxXos2ma?=
 =?us-ascii?Q?diygA//CGNo3tFZt+s1GvpdFzA+YDNWA71/Sc9fXjh7ySbZWfbDiaVZd+c63?=
 =?us-ascii?Q?SGLepSH/GJcSl1rpJq6vqkItN0n9RA63UPn1LkA03RMgnTMGLPX2UF7952dZ?=
 =?us-ascii?Q?X5Fk2NUsHSC3W1z7WQgi+J77+N9rezKvT+EjDMMfPxsFmlr2CR8IWbqtSPzs?=
 =?us-ascii?Q?tQyfgydZuNf2cgwRm9jNGdRrB0I2p7yKxuzr+fB4Qeuk9dyjjDD0xpTKbdl4?=
 =?us-ascii?Q?1qUFEBbDLnbeSsLgHqsRJjS0Sqw+WDepJg5cKA9H0l9oxCb4tnOBeidddKL/?=
 =?us-ascii?Q?icbPbmKP8YMzm/1nDEhX3U56bs7M3yfUWxtR/xkLx34jLduTW8PABlv7ILxh?=
 =?us-ascii?Q?waEPz+jTeKqSYh6jihJuy+c7uO9rwDqL38pDQcxg8nY6vMFqZMmY6u/MHlW8?=
 =?us-ascii?Q?L3wGQIwWFVR3bkI9q7IMvk7Tu/2kFiwnFWH/Ojy28etCQWaA3MHhk4n14Cnc?=
 =?us-ascii?Q?bj3TCYfY/nu2w+hdCvJebGmtMZVsGwLT7x9Z0ey8YVrCao507Bss2LEW9r+q?=
 =?us-ascii?Q?IDgLRkwvApzU9vlFABJqV13IrL5q5pdW17iA7DcVchz/4JPFWEfVqTaqODzi?=
 =?us-ascii?Q?Y77OUKPiLfFLePmVacT+fFXuQM7UaVw++oUEkztTuplk8raK22ybhCcB0myQ?=
 =?us-ascii?Q?Thd4HOiRbv5gP380aK23PxkhSQKVY3wHM1vYpFAXxvMDxJpJ6X2B7VfkcbDv?=
 =?us-ascii?Q?Cmm11zYp73Ii6GmbHevGVZVO5CBoOrnlV9MtY1qT1eQSd4kOZdXu4memF0kE?=
 =?us-ascii?Q?c9o01xn0ynSNdHSbpIgpCfYNfWPII82+uo1/jANJ556YMe7Jid2meoXyqIVv?=
 =?us-ascii?Q?ILtWBkOhOxbr/6+EKq5Qe7pl1usH1NAQB+EOD6OvBRWGeGT26NPCLRmj2fAd?=
 =?us-ascii?Q?NRPjT3JY+nCCxp4KG53v5YFBNUiHvFN02TdAgzEMaL8GDmliK8ZdtXQx/8+o?=
 =?us-ascii?Q?eKn8tPLpTW3zNcA7ofns6Bfb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(7416011)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ChT3cPdSHNhXRqSzwtxs6kYlSfSfV7zwZmOXmgMKsRnerrdpfYQzKHMOhlQq?=
 =?us-ascii?Q?zZJRHOqf0YuWkapZFT6ndZwPHVQCgFfgid3B57HE4prae11EVcgNhCrUxmpj?=
 =?us-ascii?Q?hDLvH0lq90MoXjDqGvnSns232b0jv1eVgxggkoyRtfaEGQu5Am5uZ9KlbGQj?=
 =?us-ascii?Q?oSXluoB76qXfeukF4UI8F9hUwNdkswe7D6GCskVtQyW/r6/H+jkDKFpza8yp?=
 =?us-ascii?Q?9ezpYnpdauAcK4OKus+hduPAX1DB/fLQZHT9aVPkjom6U3k/Pr2nPMYSrAAB?=
 =?us-ascii?Q?9jQ7LIQIKvmbHwDyqesu63kUrH3xVJeYHuUXufdASSecnCFVG3y1PBGmVgZS?=
 =?us-ascii?Q?XFcsmnkHaxo+oPmDDVpfwfRp7vwpfPVD7fljSg1bKpCSOTseAUvl4RK5vXFa?=
 =?us-ascii?Q?O/lDLJWbTAxLbJSCpFPTgz822ph2zniUJ8VLO2LxvJ4MaWdPkaR+aZc7x/ym?=
 =?us-ascii?Q?w32z1luM5Grr4qhF34X0uXJ2NxxAgWH+E2rP8YxoVAzlY1z6+/tztIhIa1vP?=
 =?us-ascii?Q?pugbQ3krvq3GsRI60BiZXAtVYbDBI+izVANQ5DS3SZtXgi6EhuPg0HgmxyY7?=
 =?us-ascii?Q?zga3SPRAv1X757bOtN2dUMQzySMRrryIcV5TaU/2L9kW7mpYJ1orB/FdODrq?=
 =?us-ascii?Q?qOj5SG/qnNx92oM46IXzgz7crNUoQ0SuVylR9jmGIPc7OCB/58Tox2d4SIYq?=
 =?us-ascii?Q?6N3+16/FWTJtbXlY2rohFY34ljRct+klEHElIeXMJH7kE0OW26dAD5sGb+1M?=
 =?us-ascii?Q?2JVc39Ma11Asb3VudzvtZ3CbbDh/6+bx75YwysQpW6dkqpx6ttm/cYbPWKoe?=
 =?us-ascii?Q?LzWqLa1qbVmpof2n1s1mXjk+ZNpU+LpLx2Gqzg9QCRX3N5dWpWsHoBcIdhJj?=
 =?us-ascii?Q?4W8j0Yfrc2XO5UCS9YxZ/630h4JSOLABjPhxpkDoo9GVbTerCVI89snIT60T?=
 =?us-ascii?Q?m/+4jCXZ/wRo4X3L3gtwmdKJA4Z5C74OgfvfPEVe0NCNevuaEtttK/WMO0DH?=
 =?us-ascii?Q?uYbJkNnMqIck3AOCmrxrWljc9U+NJppcXwme5dJISsVTgv/MDjp06jcnfGKO?=
 =?us-ascii?Q?91ZgQVNGVRjP5+W9WBiyV4LuFGUVvcenmvjcaXLqEN+YOowa841w08k74tcw?=
 =?us-ascii?Q?uVFoo8DH2KLxbC0Lqcdmd/FdLX5/StmSLNqitAY4DeN+kWMqbeeBR0M21oS2?=
 =?us-ascii?Q?G0Nud7WxmerAJcDZz0qCM6Fk9KQI9AuHVAMFQOOAbaTYAuOtFBJ+Zok2cIWi?=
 =?us-ascii?Q?jxRkRm5yqzkaMSUYbMvaO2VR+ID2M3sOXIRjvrrEx1S9rkOawRjSaycEF1yX?=
 =?us-ascii?Q?ExiH5m9R9apuTIUd+u2B6t+lT0SDismh36eXdMT7Cm/xKEEA/kov6KICIr4H?=
 =?us-ascii?Q?6ffKK2RoY7Qd0viDsYxTH8+DS12MG3ip53taX/8ORNwU3wZCRsG/LAlfF63y?=
 =?us-ascii?Q?VNdT0nRv6WyKsMzSfyGpjKhFwKMSGn9Wd4hAxOGp4htOqoMmJNfuIC6sJrLw?=
 =?us-ascii?Q?DK7Wdda95ylnsTgKk5J6TSAK5mW5v9U/cCMiHSaMg243tYX+7v7GZ3qLouZo?=
 =?us-ascii?Q?SeJ73+Ea2q3I1x8fDSLYXupvtAQPZWn/kOhFTxZ/gIv+I5qZ5VbQXMtvEGae?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	3kkkD9X7ARIswbYh/Dv+FTG5TnoZ5DA8od/SZevltnKkU5rnnCVDjT8F8vHj6bkD37yHfXywS1xQe7JV+H0/QltvXOhiUxzxqU1yW6GJBSe6ojR6FD7ryHnCujOUjlWskvsifH3TtikeF3xQH3vNxxuDRiFxKUDYn1HNIKc1sV82zwUHJx7EsQ78/fR+w3HyeGM4n4SQDoyZrtzRpX0yetPTrcPmmJhzfZ50nP/fWpmEXjDtU2lfwAFcgBueeCDPWOsUf1ik4oxltRQEG+B1UrEUFE21n/WKpL+7MXlZ4ks0RTAa0DExmit7NimUHl0L9wKSXjKAw/Eql5ViT8hm0PeGiYD/K2jcvJbG1kU7m5inBtSJHx48IxnMs8VW/CsccqmYc1MG+Mkwx0O2AeB+cv5TX5WK0KXfA7BWBIzMMedXVnQEkJrtCkHLMDB5y7dQgnp8UVVQAH1nSPUeYQnz3fblDocvuEKrIx/q21ygrjbyExQ9EW1AdkebTxxxy1b1Rx1DrU52ueBpVRA4c8Ua7uWGZvlqlL3BZQ2DyI9dEZ9gadunJzK8Jqm08mm+VgJXKzRhzvSVTaslnljkx7J0LCh+zh8Xoq26Ko7tylMJB50=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b53a7c8-2643-4b4e-f926-08dc8c9d58bd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 18:11:00.7637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2+AZjfaYDXH8hk+YzKWN1Ln2rbmm7y1LExMoNzG0gNFE4DmmABMiCLqXa2z78Z7c4GVmvlA5OxV7sRGUgkVjDnN9p7jTxaQrNL7zmfR7Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=733
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140125
X-Proofpoint-GUID: 48CZjxQmVoXwKRvn58j2TvOn9Arskzin
X-Proofpoint-ORIG-GUID: 48CZjxQmVoXwKRvn58j2TvOn9Arskzin

On Fri, Jun 14, 2024 at 01:46:51PM -0400, Steven Rostedt wrote:
> On Fri, 14 Jun 2024 13:14:26 -0400
> Kris Van Hees <kris.van.hees@oracle.com> wrote:
> 
> > Module objects compiled from C source can be identified by the presence
> > of -DKBUILD_MODFILE and -DKBUILD_MODNAME on their compile command lines.
> > However, module objects from assembler source do not have this defines.
> > 
> > Add $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
> > add $(modname_flags) to a_flags (similar to c_flags).
> 
> You explain what this does but not why it does it.

The first paragraph is meant to estabish the "why" (being able to identify
what objects are module objects, even if they are compiled from assembler
source).

As I mention, for objects compiled from C source code, those defines being
present identifies those objects as belonging to a module.  For objects
compiled from assembler source code, those defines are not present.  Passing
them on the compile command line for assembler source code files for objects
that are part of one or more modules allows us to identify all objects that
are part of modules with a single consistent mechanism.

	Kris

