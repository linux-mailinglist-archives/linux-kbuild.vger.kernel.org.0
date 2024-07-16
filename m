Return-Path: <linux-kbuild+bounces-2546-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF1931F1E
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 05:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87E261F21FF2
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 03:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB5B101EC;
	Tue, 16 Jul 2024 03:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lQ6hhKdd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gKWT/Aky"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF24411C92;
	Tue, 16 Jul 2024 03:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721099468; cv=fail; b=rUwDwXENJaN7Do/9Zz0eMphu3V04yjQ0V5D6PaUaw9VX2I1fTTK7K+1HGqs8Lgyx6A1mUNL4o3jRhLCQSz7FO1sveJejgkNozh033QApQs+v9F1V1Hdfefwm/kB0KPUKn1FECw0rmR8XRPIDOfy9R+DiuDH8Y6FFXO2a8x+FjyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721099468; c=relaxed/simple;
	bh=5cR6Ar6juXLyD6tD9cLnA8ueoJ3qKIxyct3iSe7tTEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/RKHJZFHkruvGSaxqe49VmHDDzZFIMgQKoPYEUC3fm5WlbTReySiLjWKZ4nyJyTTKPnpRhJm4DAiUqkQHDfxOT4v+fRpM+3prG2diwo4k/6HU8WmFtrwxSat8ETiztmBTnEKh94/ezRFcfWfNEPHNvQoLwV911ZC2YWrbCFaWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lQ6hhKdd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gKWT/Aky; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G2tpHD000305;
	Tue, 16 Jul 2024 03:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=YoS1jykx0C2gL5ttwkvX5v1sKfKV5YCz5856KioB+Ns=; b=
	lQ6hhKddJGnZcuA0kKSOtHEAjm5Xyjfr4EN5a7wI7YftjC8swVoFDNH+v9Q5NoM8
	F53cKgPTXvvSuloo4m73MjBWVnojwb4xzIUh61F+m+K7AX9QhtOzMH9tYJCtmNVc
	HPjXKncJu91QaHybQkYIX5TbL1fxd0abZDL1QbJtPj9IjlVtLolTY0Ib37hMMpwV
	nIfMIKCxsbhVPA6o/sKHclARw6DUeO320ls4EmJasfsogMAhq0BBUZteG7+jLGOZ
	DTkdAg1B9dZTlsR0uR/P6um09ZXpII/yAI3ZKi8R2JcZQmu3Y1IoepmRFn7Uyq8Y
	3+0B9iZGuNgKlzJAlwap5Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40bh6svppx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:10:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46G0c1t2010556;
	Tue, 16 Jul 2024 03:10:57 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40bg18y3ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jul 2024 03:10:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YevPq4hWBv+EgyS1uEtbUQBDKacitB83yH0OlpauNfQ5Luc7Z+9KhZ0LeRfwMzwUXDyxOk8JrgzYAJ5enjX5EIaslNLyPmpMkse3Dh1/lJU0pZuMdcXM0KF2Elg7DjLT65JOctEU27ZE7rkQImpmu73qxbeZGfLi2Xpp1htrVaau11kJ9xgx4j4HVVFp4tJV5qYOJPAckgng47pV54tFVpEKm1Xpo7VndvMOlTirpDdklGfKK7OadzFZfLwRNCqpYULmE5VfwggPGdQedAXbuDufHLIDWX0epQUrcM6AIBYpWCywLKKY/VY9HaSwgv7JQSf3XI1JbRILgKESu+3N1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoS1jykx0C2gL5ttwkvX5v1sKfKV5YCz5856KioB+Ns=;
 b=iuG1BSywhqCFfJlGMhSxVLzT5BxPckh7NCzskWUkHPYK8OOQsyxXIbvjggPn8ZM8TtxgBDcZsbW3DkWPLnKgpfMn2XJvQCtaX8YqrQHLddTOuMNC5SmNu1Bm6doimn6SU74aNLa2LnpSaJ77FoXig7sN7i41lU9f5XqPqPmN299fy6CLMbvg3CrEPq/7tQD+5Me2HyWRPIE8OIsr9t/LU02LVyd0GLz+cMky34yJCuVrG3OcmYXi6GD0fiRNumqecNAWD+TEc8RlB3jJBLnoKG5H+PLcLI+qLtmOHkIEc575funnb33vxTKN7xcStm35ec/1H86DMbQcu2IL2/S4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoS1jykx0C2gL5ttwkvX5v1sKfKV5YCz5856KioB+Ns=;
 b=gKWT/AkyFiIxnfep5iM3sSiw+ROP6GCaKEFNj7vLiKWx5mZBbgKQmc5o51q/XcIaMv2eXB4wLsUA5i6ZWXIrGM3M/Dgpqwze3uBc7lLxnCP5VTEI6KuIhbIHo3sozIuOHn+foiUZBeRkYhZzDEG8BT+28b2V1QYXchn/523OGSc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB6380.namprd10.prod.outlook.com (2603:10b6:510:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 03:10:55 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 03:10:55 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v5 1/4] kbuild: add mod(name,file)_flags to assembler flags for module objects
Date: Mon, 15 Jul 2024 23:10:42 -0400
Message-ID: <20240716031045.1781332-2-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240716031045.1781332-1-kris.van.hees@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:208:15e::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: cf543b48-1a96-4002-621b-08dca544e823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/JZoVclC3bQ8+BEX0UQpgmvVkTmQ1tXy/a4VSkupJjSEH7VW+wUNzESRmO6d?=
 =?us-ascii?Q?q5ziDKja6SDw2ksbHR7eE9ywuuqcPCvBt3fbACGNHc6E9mQLtPeNxiJ3DK4x?=
 =?us-ascii?Q?UwJaV7NeHzKXl8uNlxTNfuKYiVNtCBSm2g83+jcrzaiiIE9JVJ5Y6gnZuX11?=
 =?us-ascii?Q?tPpapyk6fPMJZZ71qT/xfXTM/W7lZW8Ep/+Kx4dqTWbQb6sP/Sek1wCRYAB2?=
 =?us-ascii?Q?4qUK1zlDGAwhCroFC7Jo2FEOHrvSQrr0/CrG7fXA09ApKnjRZLCnPqcVZc1E?=
 =?us-ascii?Q?jSO+BKFHMtKYfZnK9b5iNwFRIiWypC11n8IQpHb6JMUn8bf92CJ55v64bctB?=
 =?us-ascii?Q?rNJB74sGUW7PFX9VL6+TmIiFzPyjmZX83G6NMBQNJCWCWGva00jVwCTIQoo9?=
 =?us-ascii?Q?s83Q+wXRVrfBVFKi52ynFqOuFsNughNMPn9So8T363ppsh2ul2jAYQrUwsyR?=
 =?us-ascii?Q?6UTIp6Kv9Xpr6GVY5WKQ65eXSbLAcNhlj9cyaSAKuDYrxUr9KmDBIL0EiJeR?=
 =?us-ascii?Q?wyYy2pPdn1Q64sJVhisMfMRL32aMnpB/WyM5WKZe92gSUMx/17yr1smazCVZ?=
 =?us-ascii?Q?Jjfpl68o1yFEmT6Xxhs/O+s7npskEFAjSDTN8LBYds6J/DI9WkZ2W3or3DSU?=
 =?us-ascii?Q?6CeTWJBDQp4VusKHFIDKW4OtFxBNoTkGKnCTbVffXxf8AAKe010I/xD6+pAP?=
 =?us-ascii?Q?P0H9VaW/dWS37/yac+UdfQh29BWfoI9U8FjrrFeKFI3nCVZsK/1WsXGmVcSu?=
 =?us-ascii?Q?AbSlokgettJi9Uc0hrEmoCRoJPGm/wqk7j5pLkv2mNsrwgBQEeMZ8Bh+kMcv?=
 =?us-ascii?Q?KBWVx8H9AVp68s0pYQOz31cf0L5fB0lzhBCtDIbt9kpJKJpuYNkcLtOLb8I3?=
 =?us-ascii?Q?4lreeGEcNa+ja7YSkYOSvYl2nkktttJGq0ov6ZyqD2MA1pHdaLaCo/8Fdnvk?=
 =?us-ascii?Q?sB2nxuCf23y4EPyUdgqo8wlVaf/PmqUyuANbGffN+D1RoBM8/zLH5EE6xFSu?=
 =?us-ascii?Q?C6oPqllryQncVA451mccuOlcGbmugb3MswcBAx7VnHCRqqoi7p76Am8Orr2P?=
 =?us-ascii?Q?I7KECkWa6yx5QopxedIptOrPPlDUl21V5Hziw9S7b883aVJEHSEEczVb0MjA?=
 =?us-ascii?Q?Je9DutoWcNcnrzy91DdaLzm6HAX/rBMbdxKcJhQ2S6mzndW9LaVMXHE0b5Tj?=
 =?us-ascii?Q?ML1bSRln0Ysk9LI9tGkoXIoOC9mTJB7HAUEG1XTR/5D+8ODVDXuRksEimxyZ?=
 =?us-ascii?Q?GeDQwwB7xm2zh6LHCoUKi1o9QWihJ6ezc0fiCdn487bpJHMT+eUV6sXOtXXX?=
 =?us-ascii?Q?C40OAqUMc7znmj/6XAN3y/WXLkKTF+JclLZInulpkTQ72w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gqiVXcFNRF3WWon3HTTImpk0X/2Z2kv8rBMdZGHaxMOcFgTQqcP5Za+TJI3z?=
 =?us-ascii?Q?B6sI02cMkxaONb/hrznVeBPheBEsUeEvU0axaNE5SZHuKYK5WD3Vd/T/qpbf?=
 =?us-ascii?Q?388nf8ks9AbwJj/CimdzMNxXFkV/eRQQ/PLexV1QeSQbfG/WVY16dA6A0Jvi?=
 =?us-ascii?Q?w0eAEGSEhPD/T+mf0xpmDA1o/RFXm/022UVyJfXJzsUbeMozQyH16s9N7P6r?=
 =?us-ascii?Q?QDMSavra01goGLZxRU9hZfDtYXZ3QksxPy5jQyY+cbujFE/g7tri6GYUojwi?=
 =?us-ascii?Q?+McAetgAhDN5KFt10fu/hYBVOOKzmgQyn6jxyRLMTJThs2P3ZtR+JNTKYwf1?=
 =?us-ascii?Q?Gk5/ZeUIc7JSUh/JFjnA9Q8coQI4adcLXSo4hPyV1sGBHMrSju7NHUvhdUi4?=
 =?us-ascii?Q?OBWTS5UFG+hIuf+Vvpd0LLSgFAoYNiTaqrbS7UGUT+Ql7SjSzmcd6vCAFAeC?=
 =?us-ascii?Q?x7Q2sUSyLIEghswpnOG7xp2IaqtR4PspYtMFAUOYGA5h0roIM1GvnpS7bRIs?=
 =?us-ascii?Q?jo2wjGSHTAv81HefWwbHiemS9PVQc+k9R7a2GW0CElwlXe/gT/4V7nYjwjOK?=
 =?us-ascii?Q?lDeCwO197WNzUajikM2ncscYQCE6HigTRHp4cFwzhJ4agjXfJMws4SwUjUHP?=
 =?us-ascii?Q?jQQditi34sd9kDUvZNUsqiUfC7tthSOFjkpWjHPBma0gP3vHkhxRBZ75rVIZ?=
 =?us-ascii?Q?HCbmHrUH+hJ21gVBZaxhBP2FNLyA2+84GPhxHm9n1MY6mPTYl14ui8nLb/Pb?=
 =?us-ascii?Q?GH68ZmqyZ+X9md4IXviLTgHc6x7kEBIArXfGQXS0GmSjnYaF2zwRsn/jYfmf?=
 =?us-ascii?Q?c/Nw71pBkyFyLmC4bLmoKrJI3mbbE9NW4xO2Th4DXb/sHmQoLwlG8rd0QnCi?=
 =?us-ascii?Q?lvuV78cdE9IJgK3egr3E5Rl/jiROxwQHJ6cKxfIRX+Crk0R9n3XWGVFgO+YZ?=
 =?us-ascii?Q?n4ZXkJd5s3K94Mz8+PVk/L7vSRvSTM30eBTlbZUGKPI3rkRmFfYuil258eA4?=
 =?us-ascii?Q?QMicw3AX4HZt2y1MIk6hEMFn/SFDjXe7ZT6kabC3hppmEMskKs2tM4wt2q9F?=
 =?us-ascii?Q?rkvIuUcgkWutQGF184BlQwKTrK8xVxRrWxgqpDKPW4i7I7kFFX2knO75AElq?=
 =?us-ascii?Q?hErEk3GpA0TzQyGm7zx193jM5Ke2cO9bB220tKA9w9yc9eFuBvaPhzdMNggo?=
 =?us-ascii?Q?0W4sCt+D8LDaYb1NJgCarcUwR1PloRYWgGV7bX36C4BZwG0WvdE2V704qHBi?=
 =?us-ascii?Q?UeCclVElL0F9vlpT8NCmyisY+kBIVGxPXmUdWdWellm2id8Hzo0rhNZIIbxP?=
 =?us-ascii?Q?zKtb4/b210VdIR+vNcXZ34z63El167cON6jXLViD7KiFphg83/F3qZgWeWYy?=
 =?us-ascii?Q?Rxb0XTW/YxtTFDMuBtWh5h9P4GtNkT6ULD3jbgISCPZ+lwMRvQGOzw00Zcqj?=
 =?us-ascii?Q?7x8Wxyc71kfsxH/xXyBra21slNs42LEQlBtf3G716GEEkvZ8PX5N9A6/FjfX?=
 =?us-ascii?Q?/rsbmmxcoSZAxJUfCvr/ViFCB9ej0AjTpAD//LZXFRFM7yZP5DDiRY6pJxQg?=
 =?us-ascii?Q?ldaVKPFeelkvFVFYbSHGK64hOBen5EBNeqgXLovZPs58AOy7tT5gtN3e0ZNb?=
 =?us-ascii?Q?QatfpQTYEH9AuPs7ZtK4odU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/DjYj+Qybs1t+whu8677xPazQ6I23fMKi+F0I+UW+kvpHgtQWQ7bVMeZVQuYwyUJ/sz2e6tsq3LU/v7iZWFE5ZQd6m3gCgNdJzi1vbcVcp5rpFccLHsUfQGRdmlwpsCvkXifnY6/6Gh/xsV0TDR7GguCRfS3c+5Xn1kZnNa1rcXiiR8mVpXaJT8A8WJpS54aBbdIrsDfVeXkX9e3rYWcsGZlSvKToFZ4o/V09oYsDadeL6K2jXF5DNP8HSFiXo9uQ7U18bV/vEpbSp5PiO32p+/UsN5Q14r97V0azZKCpvYhJ5H+jzhKWSQGSPHpbnS+2tbvD51Y2Y6nDQoaWP7LIfSku6o05A1qjm2algmKMLeUtkDf63GH31lJewwARzu7ZFkUA71OsSv9Hg2UQ7g+hBj95dKtH7rht56ob5IGa4kIiPBUziz/G80JP6nKk5D9PqLtY5s1cy1wNBQFfteH/BVan3CXHoidnNrV5WcZNeCVM6QaKy/18hyxMegmm2Qp8eIMbCu120wXOgn37MAs0BsMG2cDv+TkD+GMa+Jea4VbBwW/KGiJe7rcWU8thXDNXsQbTCcvPg7usiq8D3i8xRfGXqIYB3eT6T84H93HExw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf543b48-1a96-4002-621b-08dca544e823
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 03:10:55.1441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3UPlERlQlBwYWc7za+dhwTxjOIasVHFFznJ6Aj/u/QLiL4ysK0eLpMKIh7s5yVnUkHHYRQgtX2zxvXXHV/8SE5hjejPGcBwJpkiCCGMSoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6380
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=838 adultscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407160023
X-Proofpoint-GUID: Z3S_5OLcWPVse6fjq0DEgrx5g30sq7Gk
X-Proofpoint-ORIG-GUID: Z3S_5OLcWPVse6fjq0DEgrx5g30sq7Gk

In order to be able to identify what code is compiled into modules (even
built-in modules) during a kernel build, one can look for the presence
of the -DKBUILD_MODFILE and -DKBUILD_MODNAME options in the compile
command lines.  A simple grep in .*.cmd files for those options is
sufficient for this.

Unfortunately, these options are only passed when compiling C source files.
Various modules also include objects built from assembler source, and these
options are not passed in that case.

Adding $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
adding $(modname_flags) to a_flags (similar to c_flags) makes it possible
to identify which objects are compiled into modules for both C and
assembler soure files.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 9f06f6aaf7fc..f4aec3553ff2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -238,7 +238,7 @@ modkern_rustflags =                                              \
 
 modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
-			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
+			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL) $(modfile_flags))
 
 c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 -include $(srctree)/include/linux/compiler_types.h       \
@@ -248,7 +248,7 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
 
 a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
-		 $(_a_flags) $(modkern_aflags)
+		 $(_a_flags) $(modkern_aflags) $(modname_flags)
 
 cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_cpp_flags)
-- 
2.45.1


