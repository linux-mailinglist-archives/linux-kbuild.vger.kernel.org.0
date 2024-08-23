Return-Path: <linux-kbuild+bounces-3180-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B395D405
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 19:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF39B1C2122A
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 17:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9A818CC0B;
	Fri, 23 Aug 2024 17:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LzY+VtRT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jA00nuRn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5813E1885B9;
	Fri, 23 Aug 2024 17:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724432824; cv=fail; b=KJs9gyacaCsUIYIFFH6nQ/lDwusAQe8rc5dNEOho8s6Xu3lNqjnN9FjNLXyfG1ixPf/Q7nwXi6kyMoXzhBX/7emfdShPqMrjWkmW1oA6+fFuzxsH2WQWz10mVsP6r5Xk7S4cYjfc7XTQ16xu7TknzMvgJw6ww/hVeqMzgN6wYo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724432824; c=relaxed/simple;
	bh=B6woM97rIoW3XoEQxtcokZVzbfunAM0OEVNIu8rYlRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=my95bJ2Y3qY5u53kIzy7ggsl9pv+wRaKzOTqXGWpkEqpnW/0ifs/OtsaQfk1BOc/xtM3Fy8CMNJM8LuXZT9NAYYv+7y/4NwoGkCnbU9myDsvthLXSBUHEEPEhVVZ5rcv/9/XacVHNtSzixsNym+nqHcXd7JhqRaZRT19f7QD5xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LzY+VtRT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jA00nuRn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NH0VVO023847;
	Fri, 23 Aug 2024 17:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=9SizvxWCaZzFQMN
	YdxNbYvkPMXkwmAGoVJGTxBW45as=; b=LzY+VtRTm0rEwNMQaJEHssLbADRjqUR
	dAB4q/ynbnDeVLM2Hnl6VFH0a6VR4utSN6bJ2XOlxAzTEMpOtnhpfE3TSEYnUSbd
	wWP8kcnAGkZfnMKiPn+zBqwf8SHYgUZhzRaDHuIIA4AtflfX/wbP1OBgSEZ6Mmur
	IATPlwjWi0C3ZwnOC3FRUw5w8kRGaWowKZXORZ0P+r/SbiE6WJXAfdgelFbQJGya
	iOU0kgLmatrIjREkgUwmxLsFLObFhnNjP28FaBK/s3Sx5gZLVL2f/u3U3vSx07g5
	o5OQ3vYS0QeKz4Q5LhPFiiXqUZVs+XkaIIL3lXNTgxxu4xoKd642Wtw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m6gmv17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Aug 2024 17:06:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47NGTM7F029600;
	Fri, 23 Aug 2024 17:06:16 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 416x06sebc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Aug 2024 17:06:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PS4ztxoRTejpxv+IItKlRMqVZYVRDFXAqhEbzNRPwme3OmdTqwkE5AN2Nn0YRt+Au3VrUIzH1qySPo2TyVG+BnRflqxUtdPaczBv6Aue7b95YKHEwNHCkTalEeQjRjhDfBbZF7NFmhc+IYAuum1T/bvaTFeq0ptMPk1xJ2bTReVB1CS8qCsm3x+8qQ5lupSeATtwZDQGF09rNGa3lkXNq4cDxQDJfPRwbCLRl+oovCsUT4Nj9YYRmdv4rYPUwqcZyqDKo8Bq4ZlctU5+Ql3IE2DcsPEwGosY+UfGUrZ7B490XNyHMdmuq93DUuwSQJgGaM0N2NtLBqYLH+yk8LQ6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SizvxWCaZzFQMNYdxNbYvkPMXkwmAGoVJGTxBW45as=;
 b=YbY/X58IwJTwvFjgo++oXcoJy4I1WeqfPJV4spTpkn89NDk4JUXSftK5VmBmCHGYJNdah3YkmtlDnfdv4rZYosQnf271EnNtcUH5slp481/+wit2Bds0yCIgc9hegtfCmMCFBx5Qc8i5m1GwRtqhGD5WWwfMP+6z4TYIAdUwyNycFq90yQl30ff7HZLgS6Srg5ceHNv5HmI8EGXWb9hF4ifpGJ5tqk1NAekGgaelTG8KXwa9qXcSKsaaRtwk+hU3kyPAQnmp987fxID2qD848pdE9GGPtnjmvDHC/wZMG9OgpeOvdK1vc9+7jc9raGTQNO7uqAnC90mlHG1qbKI8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SizvxWCaZzFQMNYdxNbYvkPMXkwmAGoVJGTxBW45as=;
 b=jA00nuRnm2Tpn4xQx0Q8QJwB4ZuVTQU1Qzy0tLf1cSeszLIRxJKH8N7rKYvk6L3T4ucMxR0S2VeG5z8vUXvM0+UE44Fg4uNI3CWDDpIHO/FLuw3Q1Akhe36Gy0hY2RzuPEWM+9Tk9SHlmCBy1W1Q/QpWARCamAaEdo+Z85ed3jo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB6223.namprd10.prod.outlook.com (2603:10b6:8:d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.12; Fri, 23 Aug
 2024 17:06:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Fri, 23 Aug 2024
 17:06:13 +0000
Date: Fri, 23 Aug 2024 13:06:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v8 2/4] kbuild: generate offset range data for builtin
 modules
Message-ID: <ZsjBfjAuC5t/2Cex@oracle.com>
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-3-kris.van.hees@oracle.com>
 <20240823165329.GA3911831@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823165329.GA3911831@google.com>
X-ClientProxiedBy: LO2P265CA0491.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::16) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 103a38cb-ac67-4c0a-ee45-08dcc395e47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2B52NQ4HcogFXOhp3zW5AuMrQXbq/usNavb/a5FdhbQbhmkby+kNq125zp6E?=
 =?us-ascii?Q?XehTE1JIEEqCeClgx4piurxzTQ1Snh2LFOfHBTXhJG1BIw+fmHBmYS2qVBbU?=
 =?us-ascii?Q?ivVj52DsIrX6avSEblLKFk7cRzyicLA8/EykI06dd3PoQ36nwE684o/HTHY9?=
 =?us-ascii?Q?4+BJQb3iUSxl7iyYmKvOs4ZJUnE2JUdangdfKAnzaH+xVU69dPOOiBxa/kUF?=
 =?us-ascii?Q?ZtGqfTGur3wu1ON5KaXnpeSQwp4LfwQ47llF/KPwcyeYzEK26Cn+HgSCWT9G?=
 =?us-ascii?Q?maqPQBgKkeJvoTYJQrj4ghEKvsDM8p/wpjT89ngIk4cqRXqSMrnUPyhHSVJM?=
 =?us-ascii?Q?dcqKWCTO+Qag2kw8Y9nEWIKqzdguRKLZucUqPM7H5Ryg4kJ8IsfprjMODLBv?=
 =?us-ascii?Q?D16AzLoyDID239tUfhleiPMKxoK5nopaLxs8zk+uHTX8nf45bl1Sc39w+IJE?=
 =?us-ascii?Q?CQ8vdZHfkGLGucwLeftKF/n9SRvTlHv/iaWG+bSxIYwGI9BEbzYY8kAhQ9E1?=
 =?us-ascii?Q?DEugfwjhbkS5q08J1NzFePkElJrszk5bHR+MQyOWJkNlGqty10VR3nFkGl8a?=
 =?us-ascii?Q?wLIj0/Ogz3gueJ9TEbrd6v+Ak8RpKXpMvP8zi+Pq0gb/KFIcdnf7V1vVQhK3?=
 =?us-ascii?Q?kxxF9LgmhU144OMIg7MId/7pLPMnnjydWZ/aqRYEHdTUxz2msUn2ITZOjN7c?=
 =?us-ascii?Q?mr/0L+DCg+EFfTyXG5P1w6hNwFQLH5CTyIF3ItqbxUKY+MAxBg017jjTtnVa?=
 =?us-ascii?Q?Sx5qvn8wmMI0aYvj5+/4E5k+xpDEHs4OwKAyOOtAgsCrx356ojRNoSu8Hgtl?=
 =?us-ascii?Q?kzU+0CxIWHuZIvAgfZdjZ0V1Y5bfcjU1B/VaTfGPmTucgsKyKaUf2FlPn3P1?=
 =?us-ascii?Q?Irx+aW5/cIh6ZStIi3ePIHXNG+xc9KbQbX1iB3Bbgb9LQgeIhU5Kky59yFbU?=
 =?us-ascii?Q?KcXRYI/s9KH5yDNHV3G0mHEQQ2JaHmEvTfC5FT3taDIIUKFoUjgqSl9MUSO8?=
 =?us-ascii?Q?Rgr8Mql/zON++P7Kw2z6XDRAuJVaUnXAvkdf7S7V+wM6RuCC+iakhVpxqHzP?=
 =?us-ascii?Q?YUaLYs6R9u2f8I1AXyw6cjwi5ss979ufrewSYHI2ubZtxAHaBEJVhJapbtiU?=
 =?us-ascii?Q?I/pxd7rWGQgP0PgYDlaeNT/9TZuRn40T5PskKqQL+B/T76rNjevnZmC/pR+O?=
 =?us-ascii?Q?up42C1yC358K2PSBcg2RhSAHYmswnX2RsRpN0djraUYLjIq5LcmJ2QJtmZ+D?=
 =?us-ascii?Q?XS3LS6kear/8ygSX0d3gRitWcZhh0E1TGiZq1lDW+z+bD0b7ijmscYGYvlII?=
 =?us-ascii?Q?lfYO7XHMDgnuLUZuzRc+T0XyhAVs4ERehtBytOdcvT/9xg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/yUBKy1orRvYdsgWBGDVUQCKAsVlnDGjtkWsHqJOADJfOPdAcw9yxrD4CNKc?=
 =?us-ascii?Q?jHtqElTuhSIpsX5EQr+QgaWYbZCy39Qc08RZpQpgszB1RSt5CMRBbfPTePlp?=
 =?us-ascii?Q?AqcuL3m+Pt6X88v2g3tTUM8Kls/FAsOjzRPcFUw3dJu8JbitPMZzBMMYRoqF?=
 =?us-ascii?Q?csoddR9/BrbLhTWikHDEOm4L0vMUs7tLDL3JwAC36Dam0kcu3gKblXv5ylut?=
 =?us-ascii?Q?1fSH9iBzNeYIzLSoeDS7S8SaS5YELzgIA/TbAFSNmEu1zs/3Nc47rfbmJRCR?=
 =?us-ascii?Q?YfPFJqazkJjoMuc4D6jLA2TK6rhpTWUDE0tCkPTV4Siv0zQjkeNUN+PcNvCr?=
 =?us-ascii?Q?fdlAd9Gbqq+M22KPDXNAXzbIX3aRSp2TlEzxovuwQH/7/bmBhK6FWha5j5bX?=
 =?us-ascii?Q?QQcO7A9uS1q4qtaN0Nbs0t56FnxqiOXSBSClnW4advR4UJcI/rVo+dQFcyck?=
 =?us-ascii?Q?Az7rusCorBU8f+LHLrljmT1ebDL+vx9wUV2aOSBKLjUEoeurLOCJSuryxm7A?=
 =?us-ascii?Q?tyv0pmcg7+ThIRzeDke6a7D+AZ3rOCmUxJOIXkonzAdlBngrQghBB7wPKq7L?=
 =?us-ascii?Q?tUgB0lVDWxccgTvgViIj3KEAi815gjOCTI+NHCy8QDbXuPeizhBsUhZ5ioSA?=
 =?us-ascii?Q?+H7ukQ61esOiu378eKr7QPATNS4fVN1POriTnZwOqhW6qbD2sNAQaWx+gw20?=
 =?us-ascii?Q?RdstFPjxWf2slHQeAacGf6uwjzYPJfZi9paEQkTCQ3BTtEPRh7ftkIIWQ3iz?=
 =?us-ascii?Q?Ezp/n94l12M/hkLIMjkAfQeqTUofIG4v9NM8o+SmiNOhkKzJt0MNauOFw2Tg?=
 =?us-ascii?Q?57nYh1FT457SAEFc/guwwdmzakXPbwAhD2tdZ3oAlYIWvBK3qQvP2KYs9/sj?=
 =?us-ascii?Q?LY9Jxcsueg40KlaFd70edkKna9VQdHgaS2pA8dEDK9w/WskPkQJ5xoXwsNst?=
 =?us-ascii?Q?lYH88j2+QrWpdvRtrxTBD4lHbTREC7XgAvkkAlCV5abcJkrsKM85rtvDI6h1?=
 =?us-ascii?Q?RDPqfkyryIZPRB0X+I8XA1Z/eoUQckLNRaOzUi9v7kCiswizN/XNcyqX8yxh?=
 =?us-ascii?Q?6fs2FRX9oJPyj6cmOxHwlsSalbjvlT+Q6Y6K4hQBPo2MFttHxCydL8FsgJSH?=
 =?us-ascii?Q?/uyNwQi54zJOVd4pi3LCkwAcoHiatBbNlNBKMoUgr2V9/o20YW+31bvAjGw/?=
 =?us-ascii?Q?zEf/7Db/VSLIpnofjBgtHgfu5IQS9jbmFnv28GgVA8ONSJQAvY+mHho75Nu9?=
 =?us-ascii?Q?WxTXgHiSVg2IoITqu42X7wuoMw5VHDZtZG7ERs5m12HrXTvnm5smS5MXOFJ7?=
 =?us-ascii?Q?Tz6EEBgRNBMxcOt0sLwQ3d+7agw5ic4yjergU4GQL53S4RHcgs66PWy992Ft?=
 =?us-ascii?Q?ciSpWM9cEoXK6WG8dK67mkbwIC3xaOf7/OPZJmz8HD0uJsCdpzMFJN7nKoD7?=
 =?us-ascii?Q?XChGV7mTSTzqiyaccGfHZfvtRDqlC8xpxkFvM9s4fbojyA6WUGGZr9AJ9EEb?=
 =?us-ascii?Q?yN6k1Z7j4m0lcuRml1QdosmgZIGLYd0PlB0Elwba7tb1NbUdIcogfmx1+8pB?=
 =?us-ascii?Q?8VYXBOPpdFW+xrhy/tDE4hUn3x34ZII//YZV5EqQ6gJCCu5yApAii1ZgRDRi?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OXetMcBRk+lJFgM9O54i68Tuycruv48dP7aMDi+GRMcoPtcPw659wtHryxeLlUsIwoCL0Z93kmeqYj6+TxtZMEN7Bw8xAZfVPx1Y0WNEklT/UZnZEnL0z9hTEQQQVJ8cPgrraE4Z3TZcsN2F/3BDwdv++L3mLfCFpBK5Yd8tdsHG3/JyOFpoVZFyTHOpliUkscnFYUS7oWH3oBARfMCQuxUjntFqhz34d0qyfb7r0XGOtFynop2gujdUYNPvmnsCMBdwcUyIr/32oR8a1F0qEVAK1I+sv5PjdGogQHhmgbts6lTtjDhM1UsbDAlRvH0i/qzJ4gC3v66Dbf7k8tW2D9YM255Fo3UJYX3xM5F81aOXnM3NeYVw+/7up/0Jn4iR1v1zr1zE3pFu3Kioy2AmZbpnAMOtZRxYWOnIdizfr9ru6SpJK68QKYGiQKCVuN4WQ1Tg2eb6BdCyKB6/jC6UHD6DwZyndevAQyL8oQM8EhIpCY0h8N7mYJSuXWazK63dXzNgrk642L48oF6s7uPka9TRHxOQPeZP5sGLcMAP4a9mnCt5dqLekbzsMxpCh/WMO0qtgSHcvnJvwUyOwA038oWa6v8He0agQTAgjzcpQ/A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103a38cb-ac67-4c0a-ee45-08dcc395e47a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 17:06:13.2744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7TXoS9wIZuoPwicLR+sCndt4sDBT6p5qQ7GZi8aRAbrP+AV+H2v9sDOVolTtCaWyhWGfuIX9Je2rNhdlC9CTrHSfcSq9yMgxQZzrIo02UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6223
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_13,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408230127
X-Proofpoint-ORIG-GUID: Twv_Ns7ZDtXWyHCduCRfxRfEGVg7TlB_
X-Proofpoint-GUID: Twv_Ns7ZDtXWyHCduCRfxRfEGVg7TlB_

On Fri, Aug 23, 2024 at 04:53:29PM +0000, Sami Tolvanen wrote:
> Hi Kris,
> 
> On Thu, Aug 22, 2024 at 02:19:39PM -0400, Kris Van Hees wrote:
> > diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> > new file mode 100755
> > index 000000000000..68df05fd3036
> > --- /dev/null
> > +++ b/scripts/generate_builtin_ranges.awk
> > @@ -0,0 +1,505 @@
> > +#!/usr/bin/gawk -f
> > +# SPDX-License-Identifier: GPL-2.0
> > +# generate_builtin_ranges.awk: Generate address range data for builtin modules
> > +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> > +#
> > +# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
> > +#		vmlinux.o.map > modules.builtin.ranges
> > +#
> > +
> > +# Return the module name(s) (if any) associated with the given object.
> > +#
> > +# If we have seen this object before, return information from the cache.
> > +# Otherwise, retrieve it from the corresponding .cmd file.
> > +#
> > +function get_module_info(fn, mod, obj, s) {
> > +	if (fn in omod)
> > +		return omod[fn];
> > +
> > +	if (match(fn, /\/[^/]+$/) == 0)
> > +		return "";
> > +
> > +	obj = fn;
> > +	mod = "";
> > +	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> > +	if (getline s <fn == 1) {
> > +		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
> > +			mod = substr(s, RSTART + 16, RLENGTH - 16);
> > +			gsub(/['"]/, "", mod);
> > +		}
> > +	}
> 
> This doesn't work with built-in Rust modules because there's no
> -DKBUILD_MODFILE flag passed to the compiler. The .cmd files do have
> RUST_MODFILE set though, so presumably you could match that too?

Thanks for looking at the patch series.  I'll look into this.

Is there a reason why Rust modules are using RUST_MODFILE rather than also
using KBUILD_MODFILE as the macro to pass information about what module(s)
the object belongs to?

Thanksm,
Kris

