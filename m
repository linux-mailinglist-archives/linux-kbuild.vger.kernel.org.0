Return-Path: <linux-kbuild+bounces-2125-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEADF90912C
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 19:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CD57286B42
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 17:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740A719E7CD;
	Fri, 14 Jun 2024 17:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EvO1HJEC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xKJ3ZP5Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57327383;
	Fri, 14 Jun 2024 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718385329; cv=fail; b=irITZbUi6bp8mNT7BD/o+i0XBbVOuWpqbikFgvVpsL5k9xi8ELKwTzMLh0m+JfnEm9dFuAxGQDRv3l3aM/B1Q1aBPpABkGkxcjejZSNqJlXDsrWfVoGOvz2q6mERoqT1LoCNq1w9sXZZmJz8WWVKEEQ7hIXHjrhT0UZgyqdko18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718385329; c=relaxed/simple;
	bh=LIw19/W0AsWw+2KIkmIp64YFJICr9dMEkd6nfiY3Rgc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=B+6A41kV+jpNgrMRnSaIpNk0Gro/mL6WMveixzEA0xWqs5nFk84KEkO4C03sZcsTaTtj32Og9EYnP+4NBdCfei/JpRrv3+WBS6Bt6HUmdfqvK7xvC9eJz2wD6ZXCaq3DhY+pc4JA3i0idSvAlf8BbSDPpKnc1I/adZMi5wmLDV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EvO1HJEC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xKJ3ZP5Y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EDH0P6028782;
	Fri, 14 Jun 2024 17:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=0JFNBEkLZW8r7K
	4oJpk46+a0al5+I+dbtX3rZEu/tHw=; b=EvO1HJEC6ZPgEVULxUIr5MlkX5k/WO
	KDoutnMdlbtv77/74k+8csKABHGQClYrZ3ZtKnkeHDBPZNkPlAC+yNF7PFN/441j
	cR3nHpo+R3SaPVosFcC0TVY472rYbhPEGIlQh00VAT1ohhk0mfACtugzab7Xz84c
	2Bo41FM6Des5r4H+fhgjk9CaE3/FgUDLti6VQKzkJmVJ6qOs+ySD5/OiNzIB/Xt6
	Pm5BHhI4LaiiPkkMtG7YB3auYnYCPSChnTXqFGFbox+IoiU46yUvgsKZagwE6LMv
	/ombWh3GMvqMJP97YatqbqKyqGn7aybVMJi5q0SzwsWNdywzG8jf97rg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh3pc2b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:15:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45EGjI3d012525;
	Fri, 14 Jun 2024 17:15:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ynca2srhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:15:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e21AUgsF+Hq/PN6pEh4md30s5a5yzfzKNGK1j8eG/6wraKRxWfFv7c7qofgQSRbHi+oTm5NYjlpn89XXtZWYJGKMCfExXDpTenlyIohaVN51UhJ3Hux4RC8s0KJ4IJffLbZ19Xtrqs0nVFtCIPK7gr2Ye195HXlHgDjemDDvbIwWYbGZHHfH57TeijUkKev9RhcuDiVclFOVi9xeD8ebe8+pdlJVChIICTk+8WzuQuXhnveJPgSuVblJUXP0QeegfKY6xmiFcSgMBKQB9+K+Tlwd/ttZloe2KgqTqBMrDYQtoXiwszvPQfOI7K9eIxUInjdestU3MYux4I1gX3J7SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JFNBEkLZW8r7K4oJpk46+a0al5+I+dbtX3rZEu/tHw=;
 b=USpwg+cIavWlthOMv51h74gKmnDJ8HhhikOw+isz+pLjE3rmLltuwE0Dp5HoUDoeTbnTRYqWt2BGiqgCLR7dVCmgfSfNZkMYZW/Yqtdd77reMcR89v/r68neBtvSdLzTa56zvQ20rALkGOEUY7E4lHc/oGGdQU34iW/vRajVKG5o16uRDkE6ulrTiRR42y1RMwoymRvioNbUhzsk/doIBc6WTLjuxQc7vN/mqUzKLJRZXNtwY3PPObu6lzN/GCmvonE3VLfit75eCr2yBEW1guBoxgP4UHm4pF1wFUyjmzoVtifMh+dhWoRYfxISObcVBlAmu6VKxGVphmBPscPKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JFNBEkLZW8r7K4oJpk46+a0al5+I+dbtX3rZEu/tHw=;
 b=xKJ3ZP5YCXO69tFRYFc59yZYgOz8gsloMu7ZyzSMfA0JbA2nj91L53h2pM7kwcXR7fxyUHgvZxMZdkQ4EFYQ+xyw3wjnDbOWAQ/gDUKof5ZFpTxAP2Wp/2WLcf4LxMyj7cX3U2w+wPD6p4kVY51cgvpXgC4+daRWq+CfZkjQJXo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM4PR10MB7404.namprd10.prod.outlook.com (2603:10b6:8:180::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 14 Jun
 2024 17:15:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 17:15:13 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v4 0/3] Generate address range data for built-in modules
Date: Fri, 14 Jun 2024 13:14:25 -0400
Message-ID: <20240614171428.968174-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:208:160::37) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM4PR10MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: e127c39a-849f-48f0-32c7-08dc8c958dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|7416011|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l42oqv02NeiMrqlCi9Ywf90yXWCqlkeRMlqtPbdYx9oxG76lViTnADeYYqWA?=
 =?us-ascii?Q?R8xvEL01RHANtfowBxMw5McXoMic7uRxOG1ZcyRS/gwygNzp8gUFwCUlcwb9?=
 =?us-ascii?Q?8+XhhUUNTt+tKZpy44C7BOPQ/602HnkDAs4Dri2ZAjT+3dPfoPC/xOSH33mY?=
 =?us-ascii?Q?3KsQi+aaXyv7sI/zvOHXSVMsSfQg3atzS0X4+q3AdkiYb8uWXVpcw8qyO7yD?=
 =?us-ascii?Q?r2DRZHpjsMbT7pa1kq/qQMFipcphDCqiK15EjDlBkffmWC/WrDmiviUnIqnc?=
 =?us-ascii?Q?w05GSje/K/Ct3+LFCpx2l30CdYvT/CsAH1cOOFPSGZsoL5rv17YtTdWCM7ww?=
 =?us-ascii?Q?g0JuNlDeMKBsQnQpRjdR94XZCQ0Y5HyfWc3MCww+9YwAPUpYnI2yU/ceAY2T?=
 =?us-ascii?Q?VnDL7bYM6p/9glYiNIMPBk+oHI5Ixz1sVGLe/61SPB81ANSB2H2jWkmYMom3?=
 =?us-ascii?Q?2bwPTT4pJbsyk0SDgOegoJqSbYJJiU0LyHOAa93MFycH09pEaTQ22BPWjz8h?=
 =?us-ascii?Q?hFZFYOYIwHA+Pgbsk8Jd9+s8BJRKsVtH/z9EAxnhbD7/YAT1ECXc3E4wjfPm?=
 =?us-ascii?Q?JdXX9rihkT5+5TAO8nkAeka3uJuED6cP9iwis6h1uVQpfbnyCrZuIgd0q/jN?=
 =?us-ascii?Q?GYmcnSdRGYHgfDAfQwKX7hVvYoXR097g8Nro/ZBeBFwdyP9QW9TWl1PeLTlA?=
 =?us-ascii?Q?pO63xYNKERJu6p5QrsIV6+ereApG05Hmgg4xJuAgepMWKRV95sxKGlgC1U2k?=
 =?us-ascii?Q?DHcUaUB2wdWwK8n4iwRilcGV8zACYmQU/7RRXmv6AVBal/uFq8suRMeucslS?=
 =?us-ascii?Q?zNstO2xVpWHHpiL6zOKNJSPdwSooiB9/h4Ryx5tNbXRdUlrzrU5cfxeawDtJ?=
 =?us-ascii?Q?G/GsHbNe53r4zlbtp1Z7ijdS89p7XWIvz9PAKAGMGCo/VXTRBH9JQYdNEec3?=
 =?us-ascii?Q?YEtL5YGi0hOU477TNZQaWvMX+XVgjsnIbXMG3mCPOXuAOfCQSxABKcavTZHa?=
 =?us-ascii?Q?r1ig3BevGjNI2UrwMAvGXw9RpXbFVnzy7kfGsk3gHb65DchqpIL4gSzMpZF+?=
 =?us-ascii?Q?1as+5+Z/TBJYwMCKxhHZusHoZxTZwPUZqlH6Bq43P2BR4tHztXNJq3McOfS1?=
 =?us-ascii?Q?M7c7lxVmra2kW9iROPTYciTmr1hbAmTtGbkNCD50lRPZWa1fdWL1QoO3/5C2?=
 =?us-ascii?Q?ul5MtG+Kvd1Lwfi/KL98JigxJDgKfQJY0gZkx0f7YFWnmCOHDqF+PNHs4xjR?=
 =?us-ascii?Q?J5dFCqgo+98DekzvTFftALEpoYsQvf2/VLLGOV0LLoj2X8FnqkoDCIxyeUFt?=
 =?us-ascii?Q?I3hW4NtYM5VLVcsfU/J4vDlQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(7416011)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wnSrmRKyel8lFNLvduqhIR+5Qx3HUYQQnEm3ZXkrObBRN880XxJsvpBnmbxH?=
 =?us-ascii?Q?nwf4KSm4ggWc5PoruI1s1a2f5aAVTsqATc3oeLe0Im4m6/e0p0OEQNai6Gpl?=
 =?us-ascii?Q?jblHtWpTZSFXhOtn4rlKhrkKsYzPM6pB0mTyNcMIM3k+cfaZlBs0oNFqO07k?=
 =?us-ascii?Q?FcV1HmUC8DZ6HG6t1hAioLCQahNf/4/4Kbike8QYRqJ8ZPWvikOHTFcUi001?=
 =?us-ascii?Q?ZFyZyFeXzkoFIybI/+DfI/xPedbFmsplMiVK0ru48iUg3BEGCLHIi9xg8QGy?=
 =?us-ascii?Q?ryegVQbjiT5Xq5wBimNZISCN0oo2J1wq8A/sdlmX2t6icum/tp3fR45D23j+?=
 =?us-ascii?Q?mkKvyynubIiF63/SC/jiqYfoXksqCuhdWXr7fE+RXEBGaIlmHboyOrDTn2mZ?=
 =?us-ascii?Q?VjxV5SqeQp6D1nL1F1znLRZByYLl4ZMHlKMBk7he1sN+GP/S36z9UGdncCno?=
 =?us-ascii?Q?HCwbu5y3PN+l2NbXGbEbB6IZDLBQAbXCXsE2jCy1AFynm+Bc5qTunu3j6dCs?=
 =?us-ascii?Q?URts4z8rB154Uw21G/XRCkq6Uz6NX6KeTM/c9WtvVx+sf6scGoSvY27IaI5+?=
 =?us-ascii?Q?/Vj/aixD8zQjqxiyIwe/yeolYS0jz5qSD/luu3ixrFIwTd8lvf99TV0JXR9f?=
 =?us-ascii?Q?3VMeUzA6QeAViDzd8E1WyAp7XcR4x9tDwYAuF/VKILK9EhPTUm+Abua4J/nZ?=
 =?us-ascii?Q?TkaFoBjb9iA/ZXVOMYud8lJXOWEo0MaVFsRFyh9cr9+tiq2Nutd0nBTapIRF?=
 =?us-ascii?Q?e084eepkmT2rNW4DR5D2Au0yV5mCU7QmYLQ2SANHHnJqlfAaO83q66GxGRq7?=
 =?us-ascii?Q?T06yA1jxtmMeY0w0JsUR1qTv8Kf1+JHIMRsId4S4cZOA9BY7x9bAJE5aaJIz?=
 =?us-ascii?Q?a+s2Vp0Vc0nTuEHrpPcRmQ0WptL9Yw7LXFBpRDFXqkUIxEVNJGpFOtbpXZxN?=
 =?us-ascii?Q?rRzmi4MvvFJSfXcYy/PXfXrx0IwLpoMGmlCatonrNL7OjPGnDOapT6joRjZj?=
 =?us-ascii?Q?7BtCsCQ6Zs7/ObCQx9T4UXmG3fyUWGi8V0c4sjCoAV8zim0pM9e6spM9+hPP?=
 =?us-ascii?Q?c6hY7he15sa73Z8ZCLMYQz5m4pFlWKcWlm4WEECoG1QDJmAkV9jg2cgze0uy?=
 =?us-ascii?Q?wVsGxDOjdlkYmacFHHNzKTXEyUfhx/njP/3ke2zt+CFpkxpVoT46PLLf/EuG?=
 =?us-ascii?Q?xwltRHywjQjOWXwr17/L591obHGnPE8FZmov5XVa2Hl0EkYzih//brp7PDHL?=
 =?us-ascii?Q?uJq4Dzei8QRUu4Ui+vEIBB8/dN545QkTUx72LOaP39lQwBH4epe28ushI3qc?=
 =?us-ascii?Q?AkQiX0GHzsjxjg0JUHlvvX/KXQ/zhR08Ya7pkNbSGC6aXhMW7uv4vx/3pQJy?=
 =?us-ascii?Q?/McotEGpjTWBaeprCasLQDe2Rhar4cbMXFjTT0qtdqL7IFQ9+YA5t6/VEwhg?=
 =?us-ascii?Q?Awzj+VLK1Z/xRpGrvo8THMplvgeBh3fr+1R5iQrU6bYdqZb4PJGxHq3SNcVr?=
 =?us-ascii?Q?zBV53uty0vJ3PpO7ZLiXDMapM2Hk1mj2ktdqOGuROOH1bIF47e0eOaJSoYev?=
 =?us-ascii?Q?THwq5m1R6lTCoi9j1ZQ6fL9yT9y4A5FNTtL+YQ+4oQfudkTE5V9CZMsSqEH5?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Q1dkl50D84E3sQ/pIpkQFPNJgvdxAA8hYSIbPpBtQEc44lU3FAlt1OV3Y1fZcXU1WD6ngKQybbF8yh3DQ1nUudjCv1aG5HtCPk0QOOaI+PQ+vELCUME/VtCRXwyjVD/zxGlZozsZQxOrT8xXG9UbuQOJSwv5yA/u24wpR68GzgOGRmpMg3QAArr6IPFcGmREbsuf63if1TwPHE/hrzMOKvmDg6GMxGpdAFVzKF3Z/fMpJ/CIM5VdRxLW1lYqub8OZLfWHuQjAhYqewxGLzDPLNzlr616w88o4bEPFFaM0Q+VsUz/YYvRBABj47siPFd5rp++cQMn2SDE9SgSqD0ztCBjX0flSXzeKUoZbpC2E37jFNiavOJPhS7QyHI8X+U3lL8st8JyG/RaeCvHcTJrG11T5AvLrxYJltM979L06JhMhSEaYSOLvMMb8u2up4cwtQmY2WQkm9XEeF7ncI8dWE1rhm3rjUqaKYQxxJlCvjn83Tqx4keyAEh6c5dHXyutfbzXQwKdELCSg0zUx9gIZ5cwzRLqq5yYpP8IUHhmgW1erxoSzrs8MwPFR0AtfY4vr+w3bCiPv0KilRB6PBvdJejPAyF763he3jQcqtbP0XU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e127c39a-849f-48f0-32c7-08dc8c958dd1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 17:15:13.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJav076B6SwZ70QcRfLuOKaH75qKClhPxcSFMSJz2uvGu5TflYEhdBb+aP+ljVWM8HCvRBr89WM2fbbQem9RXc+cnVtDVX20jwCtusYJJVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7404
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140118
X-Proofpoint-GUID: PeRYQPy_idNK0TnRsnZ-qCPbibuH2Izl
X-Proofpoint-ORIG-GUID: PeRYQPy_idNK0TnRsnZ-qCPbibuH2Izl

Especially for tracing applications, it is convenient to be able to
refer to a symbol using a <module name, symbol name> pair and to be able
to translate an address into a <nodule mname, symbol name> pair.  But
that does not work if the module is built into the kernel because the
object files that comprise the built-in module implementation are simply
linked into the kernel image along with all other kernel object files.

This is especially visible when providing tracing scripts for support
purposes, where the developer of the script targets a particular kernel
version, but does not have control over whether the target system has
a particular module as loadable module or built-in module.  When tracing
symbols within a module, referring them by <module name, symbol name>
pairs is both convenient and aids symbol lookup.  But that naming will
not work if the module name information is lost if the module is built
into the kernel on the target system.

Earlier work addressing this loss of information for built-in modules
involved adding module name information to the kallsyms data, but that
required more invasive code in the kernel proper.  This work never did
get merged into the kernel tree.

All that is really needed is knowing whether a given address belongs to
a particular module (or multiple modules if they share an object file).
Or in other words, whether that address falls within an address range
that is associated with one or more modules.

Objects can be identified as belonging to a particular module (or
modules) based on defines that are passed as flags to their respective
compilation commands.  The data found in modules.builtin is used to
determine what modules are built into the kernel proper.  Then,
vmlinux.o.map and vmlinux.map can be parsed in a single pass to generate
a modules.buitin.ranges file with offset range information (relative to
the base address of the associated section) for built-in modules.  This
file gets installed along with the other modules.builtin.* files.

The impact on the kernel build is minimal because everything is done
using a single-pass AWK script.  The generated data size is minimal as
well, (depending on the exact kernel configuration) usually in the range
of 500-700 lines, with a file size of 20-40KB (if all modules are built
in, the file contains about 8000 lines, with a file size of about 285KB).

Changes since v3:
 - Consolidated patches 2 through 5 into a single patch
 - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
 - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
 - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
 - Support LLVM (lld) compiles in generate_builtin_ranges.awk
 - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
 - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=y

Changes since v2:
 - Switched from using modules.builtin.objs to parsing .*.cmd files
 - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
 - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
 - Parse data from .*.cmd in generate_builtin_ranges.awk
 - Use $(real-prereqs) rather than $(filter-out ...)
 - Include modules.builtin.ranges in modules install target

Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
 - Moved the config option to the tracers section
 - 2nd arg to generate_builtin_ranges.awk should be vmlinux.map

Kris Van Hees (5):
  trace: add CONFIG_BUILTIN_MODULE_RANGES option
  kbuild: generate a linker map for vmlinux.o
  module: script to generate offset ranges for builtin modules
  kbuild: generate modules.builtin.ranges when linking the kernel
  module: add install target for modules.builtin.ranges

Luis Chamberlain (1):
  kbuild: add modules.builtin.objs

 .gitignore                          |   2 +-
 Documentation/dontdiff              |   2 +-
 Documentation/kbuild/kbuild.rst     |   5 ++
 Makefile                            |   8 +-
 include/linux/module.h              |   4 +-
 kernel/trace/Kconfig                |  17 ++++
 scripts/Makefile.lib                |   5 +-
 scripts/Makefile.modinst            |  11 ++-
 scripts/Makefile.vmlinux            |  17 ++++
 scripts/Makefile.vmlinux_o          |  18 ++++-
 scripts/generate_builtin_ranges.awk | 149 ++++++++++++++++++++++++++++++++++++
 11 files changed, 228 insertions(+), 10 deletions(-)
 create mode 100755 scripts/generate_builtin_ranges.awk


base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
-- 
2.42.0


