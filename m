Return-Path: <linux-kbuild+bounces-2132-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B38E9092A0
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 20:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6125289663
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 18:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B4D1474A5;
	Fri, 14 Jun 2024 18:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GHVmdX5I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wf8W/FkS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EAA1474B1;
	Fri, 14 Jun 2024 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718391449; cv=fail; b=WILDRAw6PhFYLxBghL2ZYJ44JlTEdJbdDdFW9YBnCSTVdnAsq4jfCw7LrjHrZ6f6/yEUfunhX9SgYLhZjRbQTAPk2wOnH6YbfkkxQvbXoloX/C/1eKqeyP/t3ykc5UHeBllNzeqWN1hlmMEU+VX3qpP2Uk7k/WKkUskJTAijBMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718391449; c=relaxed/simple;
	bh=uX4QnTcvkyjawnEHCpWdoOC8TvQg/PriNGRpCbvWHis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iHAqddRU8QNWfurpHIGVGOzb7thjReJrtxTDMph1MfeirTfXkiZVNa9bfHu2dVw0AAGZCLi+6uSDzdhpTX4dd5wAH/YBZuT9xghdFyL/jpbgvXygwHmPtyIYTglPWB5dDkuS43gJnqr1DEiSPmRMlJWm/cw+uGuie7ezrrv86/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GHVmdX5I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wf8W/FkS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EDH0bX013760;
	Fri, 14 Jun 2024 18:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=+eXtqS17pLANrZ5
	ngd8odSmtaMgmigBf7iJD/NDHA2Y=; b=GHVmdX5IIP2ZW4yuwrAbfed7t3Rwr39
	1GJ9g/DOZeQwO0I1yycEGPc0BKEzedMLaZNXTdH0vM711fSm5hBCnigvWSDFP7A/
	Vv9lqGGWyFoLOqPmzDYyltBZVp4fY4cWVeZg8ZI7NqrPFZcaVVI2ZEuOkqD/DsrL
	OtborNkXsMAPRCzATOSG5uPrFwTVMBDWbfdcDiQ7iDKRuiCWSCVr18DjXyUnJVt9
	jq9/lq8PRGV/3E7C36nLvxnrTTH/6iCy7GjC4yin5b8lTbninLXEXseoRyvsIL4G
	u2+pSIDwEanVlQvXCaBy56D2tC6Rx46D7qWu84XcpNN9DZXJebhpH+w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh7dvauw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 18:57:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45EIDnqm027086;
	Fri, 14 Jun 2024 18:57:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yncdy2hkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 18:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kqk0HTsrXKQ0QfPa6gWpG+/dR1LnzH+VfBK3cM4XgsKoep+shIbsl4h9z2FHUlUZxYYVfJ55wTNoajtAA4vdnIlGpTSkumDgZYtaIlGInVBslHqWgcZnT3/xmnO44QflgLekb/YASfG6YXrcaWsPtSICr0aMDhsipjnL30dxsRbrEhophLYicUmhuWJjigWmXdmbO593QfNy4tSKSwmsfPXCVxuecH3ytuhdUHjZ0Z70uIUhDllNGbbUufVlzZQI5eIDu1xA8aSviWsUFBQ/hHZSrdR61XAQAnDFfhERVB+2JLOVMG9uURXGZwyPsC2RgxOnkGzKiqX1epoTOQldNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eXtqS17pLANrZ5ngd8odSmtaMgmigBf7iJD/NDHA2Y=;
 b=HAgFc1FPXl/22sYCNgrCI7ft8D57puoRX+hMjzKI4PEdqPI+fukH6dd/uqShN19OZvOyadljFTOLw2MCVXSQVTNfCv1dPS5xA+ey5v0SLGmiG2TMVeSxAwXdqYn7uTBS8uWGQi1WF4bFCBAQHAtmBmHtMobLF4LY83UjcNS6X+N1+EDV77JuUadE+KGQQT+K0t0hX6VEveHgSfSOik+KMOqrNKBZ4heGxgjLcCOqFE5zIgsSbECxVY80xFbBs8Ve42i53Na0Wy6rBXnBYaEIxXD9Kx6K39frGW8QErItbXPf5sTEEAmxG6B1Rt7OD5SlJKw23/rNUTbP+3mOKV6ewg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eXtqS17pLANrZ5ngd8odSmtaMgmigBf7iJD/NDHA2Y=;
 b=Wf8W/FkSnEE8O56pxg1Nzn/iRdeKpu8TvDk/IQ4xi82w1C5sNW7y/jrMHptk72xBLSUz17hLrqK/XDjPhov2IWwd8vE7scwIww87ct1F8ONF0/0H5+LfSZyoWkA0Zhucnk1On5KEUC+t1Adz5S2jp9h3214bSeeTgWDtdhGmzF0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB6514.namprd10.prod.outlook.com (2603:10b6:930:5e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 18:57:08 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 18:57:08 +0000
Date: Fri, 14 Jun 2024 14:57:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v4 2/3] kbuild, kconfig: generate offset range data for
 builtin modules
Message-ID: <ZmySgR4N/3qxk3uJ@oracle.com>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
 <20240614171428.968174-3-kris.van.hees@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614171428.968174-3-kris.van.hees@oracle.com>
X-ClientProxiedBy: BL1PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:208:2be::30) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 4780c489-c822-4962-0129-08dc8ca3ca76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|7416011|376011|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jc6jzxhU2t2+1ypObzbdJ+PvY4LGfkRxuHrOvlzju/Xx6T1yjDVwYGMpDAi/?=
 =?us-ascii?Q?6eM66s32TAyCbQrFXojtCWO8RVeAiTix1x3BM+XAFsHi17UsGz+f1F8IGhvt?=
 =?us-ascii?Q?KHHkjmiu1FYwM//Vp4vjsRSbmDXy54TiAR6tFfl5eKpDpKTBIO+fsKIMnZMW?=
 =?us-ascii?Q?1+uTHW6Y0OVlrLq2OEmHsTTg4XvhcIx9mLREWETI/+82XTkyotpPM1DMPDT7?=
 =?us-ascii?Q?mCQ/i1FAv4otlQsVlOiuewEhW6TTOEj/CxNTQxyHHgx5DLb8Rq91lqso+k5e?=
 =?us-ascii?Q?y/u6WHCmqZ/ooBVDsKmX4wLlQAf/ecze9SIIleReN3X+n9VUzdkHqMHTIjhb?=
 =?us-ascii?Q?d+ocU/4gmPB/MxiOGhPnWvkd/ii61+0N+BWrFMHDgUG3unrGnaIWAfQuZTez?=
 =?us-ascii?Q?AwJLJtERBqeE4b4pQpiDh+9idISBhkrWn+oOrp2L7CiOo0FYI8SgK+5/ZNVJ?=
 =?us-ascii?Q?i5CVJf1mqHCysA8BKpyPcdfoDJXJAlX+xjgFETyMZ9yHtVD9N/IiJDqyqsgK?=
 =?us-ascii?Q?WEXnXpKD0skZAFcLjmZ4KPmr0SI6J/YtnA7rnrvviY6Ec3orWKduQb/MagJF?=
 =?us-ascii?Q?oVWgxIiPrJUPCP0k5V21nECulFHMpr/S9lWBBPkppNXjmYvQXX0o4PmTB8nk?=
 =?us-ascii?Q?jXj5uPWhMPAB8cxGn+/MatEBEKhCFh+r2/jb+9uTOMYtMwgJte76tRfQFd34?=
 =?us-ascii?Q?stAzKwSVyTk1gMd+7wgVlhv9Awz3cSHp5Ne7NrxGXdDpR89+4CONIKuSbEnQ?=
 =?us-ascii?Q?LQ7fg/h6rn1CIR+r7BzQoUZrfK/lKXMC03PyrgEjBvzDOzI5QA45/GVIaJNB?=
 =?us-ascii?Q?aE14mxLE5OYS5d7/zWRP0/7mqGv70ImzCg2bTsmMpuICG8RwVbPzTq85iKyr?=
 =?us-ascii?Q?5NejZXHHFqW3tnqfJVCVQhDPycYdLhyp/1ML7Ey/1Smihe3ZiskSTfANpyb+?=
 =?us-ascii?Q?qguzSKIdkpzP7oH4PgV7fdYXtqc4Mkw69GuGmYKektA6F6MnHPM+CBU3ZIfd?=
 =?us-ascii?Q?VU3jDJqN87AfwrhHRcVdfz5NgdVrDOkVVoPbI+hd7TKapCqy6HzvBrz44B2N?=
 =?us-ascii?Q?auP0KIOjtUQ3eJKq/fbzDECOBnCiDzxsOnOR5sXZQNDcfAA+rEjGkGnJObX8?=
 =?us-ascii?Q?Iro2jLnCZfROCoKazVCfRTT8Y0dnODLIQkpafjlU2L5bMbMpvyvskN0UWO6Q?=
 =?us-ascii?Q?mf3usPOW6AtcE7WiQRdhZO4uSk7ANxYWSY0MTKc1gpg7tOL3HNCOXoRWvDET?=
 =?us-ascii?Q?bHKIBZPDD8qevJVvuf1eNdsbJkFhbXmG1Ei5Zs9AYd0+JEOdJaxrWEu4Fap9?=
 =?us-ascii?Q?bcBJoGeWmhz+KCRxoyl1X7YH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yZtQu/SWH8617L35OSSYI9M1fiQkUrVUwcX6ffS3y1dpRoj2peYNQxBfJMld?=
 =?us-ascii?Q?DPDuG4yCJ593smO0Vj9qzXietkcpkvfV85NUtow73Pb+AICDeFZJ4EPH/zHC?=
 =?us-ascii?Q?TADEW2GmymrpPdCPaaqSHlbjTvlbY61WGJquAdZc2ClOS07U6wHHOsQAeVzI?=
 =?us-ascii?Q?l2NR1Ij43MT1MRuw31pYlwa3XAxxG2BSSyDM7NgWj5ywG4rSV8WkGcrkQLOU?=
 =?us-ascii?Q?NXM5V/8Kvir2ETMNoCxzWRp4KAczfcZsgHGhekqXor+5o5YZD+Rihtupm9J1?=
 =?us-ascii?Q?NnclnhZs2Zc40sgX90OpOEhu8EWlrFAW9RQZRX7BtdpeXyqaQSBxMlAjoVu7?=
 =?us-ascii?Q?+GfjOl7DHaJ7Lwsnn+UaVqSJGtTC+wC3ClLoD4USWtMDEGr/xIo9GPCEfnwO?=
 =?us-ascii?Q?0A2A1nBUGlc4ISnHMssF9ZUWfURaCiE1QcOS/g1yxTTBfg600xaw+ZgU1a8v?=
 =?us-ascii?Q?LGjvt2Ksbh5utgpKeGWIzThPCyCKKaVJzQHTmzl0XO/s+zgBtNbHEkR1O6Ly?=
 =?us-ascii?Q?5EJ2wYJSwi3LCeO42/YYCRkBvHZL0fJCeyR2tyez9y0JalBQPm5P8Qa/6MSB?=
 =?us-ascii?Q?nSZeesDopS+Oi7j49Y8zz3jlyM7zXKWeTlBkgzRqiho85vwmeLyMei+NbQM7?=
 =?us-ascii?Q?8Vxfdugh/LRVUI1no2OmVsyPtOpd27VvNMnhS0a+Xad84KSF9P/ws747AhnC?=
 =?us-ascii?Q?QoHJ/ApOUTR+P069NgMxTieiuPseol0tTHts5rjgF+NpQZ2BSxv0kLjqKtjY?=
 =?us-ascii?Q?tfCI2+UwJoLsQ2ic7o7lOqMb7i5WfEdkW21R3k0rnV4Z3AYkRusqmU5/heiq?=
 =?us-ascii?Q?/QNkJCqpdjdy+6FBxTxyI+uq6CvYzmx6/UGWeK8JgbPY0Dgfl0Dz00CqiO/4?=
 =?us-ascii?Q?W2ahkCP4ItfYg043QC7ibovU4uaPefsZxnzbaWq8KSn2T1WkMRhhjCzvcVaU?=
 =?us-ascii?Q?yxkrmEiWq3lmk4aJRiXiiFdwLIJspX8+Uro4RhudDAOAzCf54oOrWFfyqewP?=
 =?us-ascii?Q?zd2F3/pulo47sN79ScWvAjNVWAUyiDLQOj5gq4LSDSR9bs/1QpZV2Am7T4u1?=
 =?us-ascii?Q?rjTK3dhNlJ0PKRYcQ5RgZUzff6Bs8HYaK4FR0esdNb9iqEYJbnRtNfaj4APr?=
 =?us-ascii?Q?5LxKWuT5P+hTPw6Bz5lh48ReywMIdLu8HymuFG9GUQWs7PlLMNQo5Si3vgVy?=
 =?us-ascii?Q?qhr3mDDvTY2n/LaoLuPp0Hq/mIqideKEljzsx4drGFW9Fd2m6SZGJX8jIRRL?=
 =?us-ascii?Q?RBK7K8/qcfsH8QK6J/5FnoD32V+mLOy/Hbhd/hPzrnbPVQDuNU0B+cL4ll8J?=
 =?us-ascii?Q?fd1pzFQ4at+wtJAbdOYaE9pJuMAvVaOPyYcSmOVGyV3LQojG0w25EoQ6pAtP?=
 =?us-ascii?Q?RnGEsGeur4AW68vSnoEWwvVzSPczowzwBqa7ybe9p0FUJT8fgWVwO2R/MLJo?=
 =?us-ascii?Q?5AiwykroKyIhtJcFa2W70Owj8e2D2H5idXSBVTOOxa8ePMeS1oMIpeYDMT7s?=
 =?us-ascii?Q?9DZ/x8ok7iC/FnIWNDJiZcnyPAnUUSLxczDH7Fbg5Jk3EnvjqSIbnnes3kT+?=
 =?us-ascii?Q?a/GiyOZgrkXM5oOBEkp7TvqEYBm6dNH172UeLNQJ1RtkkSH8AYTNMedVwITW?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iaHNGKZOvONAvVKL7zqPckOyoY/Cw9AY0QOHC7bql33jZfqMtGb5MUL8WVWNOC2DlbIZEXLnz1uXl28RfiLAzre021q4TzO0fIG1TQo+dOD8vfGEx+T8WlK3qRfeyLtOejBwGrvOyYWHENU7u5hU0ZtFYTyFGqZ3L6BZsMMns1KCYx0UcqJihzJZDyTlix/uT1Mv4jlJ0nju6CuD4HVHiMd6ChnkS5VHB3CmeiheB0Jn50FCVo8K+oKAGhgVR0ShevCHiosUsmAizQwI3O6bJb36naNCQLgIKE+sCiwJ2NtlRnkD3FK4gi3rxUS83bCF8S0x/NOXp7jiYGl6jZUdThzYYyIePimFB4tc8ydRe/zBmWInW2kFqLEkBrLqTTzBL/lzooqlr7xPtXYfjgZgNWGljGszRhaELnq3FTsFXbfsl+aKAunGJBLj0/3Tj4gqeXNffQhTg5+RSQBc8lTTHHcXDtKUeQYgDAWZQeWfrtvEIrlDn0Z948jGLL47X0GpVgysVRqSZhQK6kypz4vHD6A+SkScYZ1E0uQI+IWTh0ZVo3XE93k7Yi80nesypI/BqPaxwR0DZ6SJ8qWlehejN/MzivK66hA08P9ET1NTFpk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4780c489-c822-4962-0129-08dc8ca3ca76
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 18:57:08.5541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRJUe+KqDjy3tlRBbmngeAMdBB++K8LHDslmusWa9g5zwyvR5XZNNoeoDgBWDdtPbkdJMoni0NkAoQZ7Xd4wLwXVi0Y89IKiJynsGENvHk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6514
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140130
X-Proofpoint-GUID: GN9MO9ieicu5N9y6OjVk9_EPh0X1f9s_
X-Proofpoint-ORIG-GUID: GN9MO9ieicu5N9y6OjVk9_EPh0X1f9s_

My apologies (esp. to Masahiro Yamada)...  this patch was supposed to resolve
the outstanding issue of needing to add gawk to the dependencies in the
documentation and that part of the patch still didn't make it in.  I've added
it on my end for v5, and will absolutely ensure that it will be in the posted
version.

Again, sorry for have yet again overlooked that.

	Kris

On Fri, Jun 14, 2024 at 01:14:27PM -0400, Kris Van Hees wrote:
> The offset range data for builtin modules is generated using:
>  - modules.builtin: associates object files with module names
>  - vmlinux.map: provides load order of sections and offset of first member
>     per section
>  - vmlinux.o.map: provides offset of object file content per section
>  - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME
> 
> The generated data will look like:
> 
> .text 00000000-00000000 = _text
> .text 0000baf0-0000cb10 amd_uncore
> .text 0009bd10-0009c8e0 iosf_mbi
> ...
> .text 008e6660-008e9630 snd_soc_wcd_mbhc
> .text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
> .text 008ea610-008ea780 snd_soc_wcd9335
> ...
> .data 00000000-00000000 = _sdata
> .data 0000f020-0000f680 amd_uncore
> 
> For each ELF section, it lists the offset of the first symbol.  This can
> be used to determine the base address of the section at runtime.
> 
> Next, it lists (in strict ascending order) offset ranges in that section
> that cover the symbols of one or more builtin modules.  Multiple ranges
> can apply to a single module, and ranges can be shared between modules.
> 
> The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
> is generated for kernel modules that are built into the kernel image.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> ---
> Changes since v3:
>  - Consolidated patches 2 through 5 into a single patch
>  - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
>  - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
>  - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
>  - Support LLVM (lld) compiles in generate_builtin_ranges.awk
>  - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
> 
> Changes since v2:
>  - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
>  - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
>  - Switched from using modules.builtin.objs to parsing .*.cmd files
>  - Parse data from .*.cmd in generate_builtin_ranges.awk
>  - Use $(real-prereqs) rather than $(filter-out ...)
> ---
>  lib/Kconfig.debug                   |  19 ++
>  scripts/Makefile.vmlinux            |  16 ++
>  scripts/Makefile.vmlinux_o          |   3 +
>  scripts/generate_builtin_ranges.awk | 284 ++++++++++++++++++++++++++++
>  4 files changed, 322 insertions(+)
>  create mode 100755 scripts/generate_builtin_ranges.awk
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 291185f54ee4..03fddad67d59 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -571,6 +571,25 @@ config VMLINUX_MAP
>  	  pieces of code get eliminated with
>  	  CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
>  
> +config BUILTIN_MODULE_RANGES
> +	bool "Generate address range information for builtin modules"
> +	depends on !LTO_CLANG_FULL
> +	depends on !LTO_CLANG_THIN
> +	select VMLINUX_MAP
> +	help
> +	 When modules are built into the kernel, there will be no module name
> +	 associated with its symbols in /proc/kallsyms.  Tracers may want to
> +	 identify symbols by module name and symbol name regardless of whether
> +	 the module is configured as loadable or not.
> +
> +	 This option generates modules.builtin.ranges in the build tree with
> +	 offset ranges (per ELF section) for the module(s) they belong to.
> +	 It also records an anchor symbol to determine the load address of the
> +	 section.
> +
> +	 It is fully compatible with CONFIG_RANDOMIZE_BASE and similar late-
> +	 address-modification options.
> +
>  config DEBUG_FORCE_WEAK_PER_CPU
>  	bool "Force weak per-cpu definitions"
>  	depends on DEBUG_KERNEL
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index c9f3e03124d7..5fd1f272ccde 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -36,6 +36,22 @@ targets += vmlinux
>  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
>  	+$(call if_changed_dep,link_vmlinux)
>  
> +# module.builtin.ranges
> +# ---------------------------------------------------------------------------
> +ifdef CONFIG_BUILTIN_MODULE_RANGES
> +__default: modules.builtin.ranges
> +
> +quiet_cmd_modules_builtin_ranges = GEN     $@
> +      cmd_modules_builtin_ranges = \
> +	$(srctree)/scripts/generate_builtin_ranges.awk $(real-prereqs) > $@
> +
> +vmlinux.map: vmlinux
> +
> +targets += modules.builtin.ranges
> +modules.builtin.ranges: modules.builtin vmlinux.map vmlinux.o.map FORCE
> +	$(call if_changed,modules_builtin_ranges)
> +endif
> +
>  # Add FORCE to the prequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
>  
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 6de297916ce6..252505505e0e 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -45,9 +45,12 @@ objtool-args = $(vmlinux-objtool-args-y) --link
>  # Link of vmlinux.o used for section mismatch analysis
>  # ---------------------------------------------------------------------------
>  
> +vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
> +
>  quiet_cmd_ld_vmlinux.o = LD      $@
>        cmd_ld_vmlinux.o = \
>  	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
> +	$(vmlinux-o-ld-args-y) \
>  	$(addprefix -T , $(initcalls-lds)) \
>  	--whole-archive vmlinux.a --no-whole-archive \
>  	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
> diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
> new file mode 100755
> index 000000000000..ba7a5dcef284
> --- /dev/null
> +++ b/scripts/generate_builtin_ranges.awk
> @@ -0,0 +1,284 @@
> +#!/usr/bin/gawk -f
> +# SPDX-License-Identifier: GPL-2.0
> +# generate_builtin_ranges.awk: Generate address range data for builtin modules
> +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> +#
> +# Usage: generate_builtin_ranges.awk modules.builtin vmlinux.map \
> +#		vmlinux.o.map > modules.builtin.ranges
> +#
> +
> +# Return the module name(s) (if any) associated with the given object.
> +#
> +# If we have seen this object before, return information from the cache.
> +# Otherwise, retrieve it from the corresponding .cmd file.
> +#
> +function get_module_info(fn, mod, obj, mfn, s) {
> +	if (fn in omod)
> +		return omod[fn];
> +
> +	if (match(fn, /\/[^/]+$/) == 0)
> +		return "";
> +
> +	obj = fn;
> +	mod = "";
> +	mfn = "";
> +	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
> +	if (getline s <fn == 1) {
> +		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
> +			mfn = substr(s, RSTART + 16, RLENGTH - 16);
> +			gsub(/['"]/, "", mfn);
> +
> +			mod = mfn;
> +			gsub(/([^/ ]*\/)+/, "", mod);
> +			gsub(/-/, "_", mod);
> +		}
> +	}
> +	close(fn);
> +
> +	# A single module (common case) also reflects objects that are not part
> +	# of a module.  Some of those objects have names that are also a module
> +	# name (e.g. core).  We check the associated module file name, and if
> +	# they do not match, the object is not part of a module.
> +	if (mod !~ / /) {
> +		if (!(mod in mods))
> +			return "";
> +		if (mods[mod] != mfn)
> +			return "";
> +	}
> +
> +	# At this point, mod is a single (valid) module name, or a list of
> +	# module names (that do not need validation).
> +	omod[obj] = mod;
> +	close(fn);
> +
> +	return mod;
> +}
> +
> +FNR == 1 {
> +	FC++;
> +}
> +
> +# (1) Build a lookup map of built-in module names.
> +#
> +# The first file argument is used as input (modules.builtin).
> +#
> +# Lines will be like:
> +#	kernel/crypto/lzo-rle.ko
> +# and we derive the built-in module name from this as "lzo_rle" and associate
> +# it with object name "crypto/lzo-rle".
> +#
> +FC == 1 {
> +	sub(/kernel\//, "");			# strip off "kernel/" prefix
> +	sub(/\.ko$/, "");			# strip off .ko suffix
> +
> +	mod = $1;
> +	sub(/([^/]*\/)+/, "", mod);		# mod = basename($1)
> +	gsub(/-/, "_", mod);			# Convert - to _
> +
> +	mods[mod] = $1;
> +	next;
> +}
> +
> +# (2) Determine the load address for each section.
> +#
> +# The second file argument is used as input (vmlinux.map).
> +#
> +# Since some AWK implementations cannot handle large integers, we strip of the
> +# first 4 hex digits from the address.  This is safe because the kernel space
> +# is not large enough for addresses to extend into those digits.
> +#
> +
> +# First determine whether we are dealing with a GNU ld or LLVM lld linker map.
> +#
> +FC == 2 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
> +	map_is_lld = 1;
> +	next;
> +}
> +
> +# (LLD) Convert a section record fronm lld format to ld format.
> +#
> +FC == 2 && map_is_lld && NF == 5 && /[0-9] \./ {
> +	$0 = $5 " 0x"$1 " dummy";
> +}
> +
> +# (LLD) Convert an anchor record from lld format to ld format.
> +#
> +FC == 2 && map_is_lld && !anchor && NF == 7 && raw_addr == "0x"$1 && $6 == "=" && $7 == "." {
> +	$0 = "0x"$1 " " $5 " = " $7;
> +}
> +
> +# (LLD) Convert an object record from lld format to ld format.
> +#
> +FC == 2 && map_is_lld && NF == 5 && $5 ~ /:\(\./ {
> +	gsub(/\)/, "");
> +	sub(/:\(/, " ");
> +	sub(/ vmlinux\.a\(/, " ");
> +	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
> +}
> +
> +FC == 2 && /^\./ && NF > 2 {
> +	if (type)
> +		delete sect_addend[type];
> +
> +	if ($1 ~ /\.percpu/)
> +		next;
> +
> +	raw_addr = $2;
> +	addr_prefix = "^" substr($2, 1, 6);
> +	sub(addr_prefix, "0x", $2);
> +	base = strtonum($2);
> +	type = $1;
> +	tpat = "^ \\"type"[\\. ]";
> +	anchor = 0;
> +	sect_base[type] = base;
> +
> +	next;
> +}
> +
> +!type {
> +	next;
> +}
> +
> +# (3) We need to determine the base address of the section so that ranges can
> +# be expressed based on offsets from the base address.  This accommodates the
> +# kernel sections getting loaded at different addresses than what is recorded
> +# in vmlinux.map.
> +#
> +# At runtime, we will need to determine the base address of each section we are
> +# interested in.  We do that by recording the offset of the first symbol in the
> +# section.  Once we know the address of this symbol in the running kernel, we
> +# can calculate the base address of the section.
> +#
> +# If possible, we use an explicit anchor symbol (sym = .) listed at the base
> +# address (offset 0).
> +#
> +# If there is no such symbol, we record the first symbol in the section along
> +# with its offset.
> +#
> +# We also determine the offset of the first member in the section in case the
> +# final linking inserts some content between the start of the section and the
> +# first member.  I.e. in that case, vmlinux.map will list the first member at
> +# a non-zero offset whereas vmlinux.o.map will list it at offset 0.  We record
> +# the addend so we can apply it when processing vmlinux.o.map (next).
> +#
> +FC == 2 && !anchor && raw_addr == $1 && $3 == "=" && $4 == "." {
> +	anchor = sprintf("%s %08x-%08x = %s", type, 0, 0, $2);
> +	sect_anchor[type] = anchor;
> +
> +	next;
> +}
> +
> +FC == 2 && !anchor && $1 ~ /^0x/ && $2 !~ /^0x/ && NF <= 4 {
> +	sub(addr_prefix, "0x", $1);
> +	addr = strtonum($1) - base;
> +	anchor = sprintf("%s %08x-%08x = %s", type, addr, addr, $2);
> +	sect_anchor[type] = anchor;
> +
> +	next;
> +}
> +
> +FC == 2 && /^ \./ && NF == 1 {
> +	# If the section name is long, the remainder of the entry is found on
> +	# the next line.
> +	s = $0;
> +	getline;
> +	$0 = s " " $0;
> +}
> +
> +FC == 2 && base && $0 ~ tpat && NF == 4 {
> +	# If the first object is vmlinux.o then we need vmlinux.o.map to get
> +	# the offsets of the actual objects.  That is valid because in this
> +	# case the vmlinux.o is linked into vmlinux verbatim (per section).
> +	if ($4 == "vmlinux.o")
> +		need_o_map = 1;
> +
> +	sub(addr_prefix, "0x", $2);
> +	addr = strtonum($2);
> +	sect_addend[type] = addr - base;
> +
> +	if (anchor)
> +		base = 0;
> +	if (need_o_map)
> +		type = 0;
> +
> +	next;
> +}
> +
> +FC == 2 && !need_o_map && $0 ~ tpat && NF == 4 {
> +	if ($1 ~ /\.percpu/ || !(type in sect_addend))
> +		next;
> +
> +	sub(addr_prefix, "0x", $2);
> +	addr = strtonum($2) - sect_base[type];
> +
> +	mod = get_module_info($4);
> +	if (mod == mod_name)
> +		next;
> +
> +	if (mod_name) {
> +		idx = mod_start + sect_base[type];
> +		entries[idx] = sprintf("%s %08x-%08x %s", type, mod_start, addr, mod_name);
> +		count[type]++;
> +	}
> +
> +	mod_name = mod;
> +	mod_start = addr;
> +
> +	next;
> +}
> +
> +# If we do not need to parse the vmlinux.o.map file, we are done.
> +FC == 3 && !need_o_map {
> +	exit;
> +}
> +
> +# (4) Collect offset ranges (relative to the section base address) for built-in
> +# modules.
> +#
> +
> +# (LLD) Convert an object record from lld format to ld format.
> +#
> +FC == 3 && map_is_lld && NF == 5 && $5 ~ /:\(\./ {
> +	gsub(/\)/, "");
> +	sub(/:\(/, " ");
> +
> +	type = $6;
> +	if (!(type in sect_addend))
> +		next;
> +
> +	sub(/ vmlinux\.a\(/, " ");
> +	$0 = " "type " 0x"$1 " 0x"$3 " " $5;
> +}
> +
> +FC == 3 && /^ \./ && NF == 4 && $3 != "0x0" {
> +	type = $1;
> +	if (!(type in sect_addend))
> +		next;
> +
> +	sub(addr_prefix, "0x", $2);
> +	addr = strtonum($2) + sect_addend[type];
> +
> +	mod = get_module_info($4);
> +	if (mod == mod_name)
> +		next;
> +
> +	if (mod_name) {
> +		idx = mod_start + sect_base[type] + sect_addend[type];
> +		entries[idx] = sprintf("%s %08x-%08x %s", type, mod_start, addr, mod_name);
> +		count[type]++;
> +	}
> +
> +	mod_name = mod;
> +	mod_start = addr;
> +}
> +
> +END {
> +	for (type in count) {
> +		if (type in sect_anchor)
> +			entries[sect_base[type]] = sect_anchor[type];
> +	}
> +
> +	n = asorti(entries, indices);
> +	for (i = 1; i <= n; i++)
> +		print entries[indices[i]];
> +}
> -- 
> 2.45.1

