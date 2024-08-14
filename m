Return-Path: <linux-kbuild+bounces-2988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835495230C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 22:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C8B31C21F9C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 20:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84F91BD51C;
	Wed, 14 Aug 2024 20:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hxyy0YoH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gqSZrD2B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C222920B0F;
	Wed, 14 Aug 2024 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723665616; cv=fail; b=qg8wUBf7tslcXSmE/zzQaof2fclRVdirKDg1Q0Mapi4qbsdM0vfnyp5QEH+siobob/jacB/kOxbiBNTboSPyCx5aKFxUwX9mIgzHNaXDoBKL8ptsVCJURdkzVsoT1rVhBRgUGUkbBKfjaAyi6LF9ZdUfWGFEpHPgyooR1/rPVOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723665616; c=relaxed/simple;
	bh=lFGRIjtCabAn141Ctz48ZPny1wzQoiruYn8/F9hp9HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MKQiBPC93jEIH8ezNjZDf2/8KlPy0KWP7N5Hx067c4UC3im6jkKk8S3WgY/Z3EZWoVYA7GAWpstAcb13MFJ2NT6jSwSHlCdwZOWZuqY7FyD4mGTWRn7kCcUHKLSPZRN79ujny4o5BnjOFmcWRyPE4/U+Vd4YLZa/nA6/g41pqtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hxyy0YoH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gqSZrD2B; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EIMTfX015137;
	Wed, 14 Aug 2024 20:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=SvG06ATnhU24nT+
	VAYelMhW1vIq7kED13aYVbuot0kQ=; b=Hxyy0YoHEgIjpZfxmmzg4NCnV+WGb3O
	eDPCsjjDAVBesCPVNTwLslHXMPkGGUt728catqZF7KBS/YrQYT4OvE1X8nKblv8o
	RyFx2m1gfQRbGK7bTp20eAR1EqCZs4VQp5LANpcJwfWzVBRoEJP8u+fjhW6vCUtN
	XVzy8GT7qZkPgDBcADTz+oH7f6ZqRRQHm7uO8uQW9J7gNEB1RyLQ/NG/2O9v5C2h
	H190pTJXzZm4a2//LnWe1go7SsPLkclvAgC8ChHme5wtFac/8PnX4sCYN0V4z8El
	i8cJ9HM8HStIPo6rcG9ymgj4YY+XddOW0Ylm885OmC25zQqY/6wpfHw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wy031c03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 20:00:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47EINhf1020991;
	Wed, 14 Aug 2024 20:00:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxngvxuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 20:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5wCo05/xW5ygppBOUr35fdHKubGeo/mDa3B6cDZTNyDUwZGkNRY7xuDMJV9Oy8uKdHSsONT0limQ+yEbqjLnh9/gq4apMWsUt8CcA8EBCVu5Xm4XsskTsD0wTNX/PswJ18xezjpNfhzjGxtQN63fyzRNaUa57nAzJLMpnuZTi1yUN0MuwlgLqvrJMfQnJxwfEhZe4cVnN05+W4Fe4U/ZNKWJoD1/cfJ2VOogeRUFjYFwkUChqktZAnBxt6A4bMv8JxXnXxjkTgSslkzq795C1x7drDChkfRfBuuVFvfQv0toKEN7NyZZu+PBPz8uwazXLqN93QV45ulHYp2TgaJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvG06ATnhU24nT+VAYelMhW1vIq7kED13aYVbuot0kQ=;
 b=b3hihZfEosWNiOPpuvNOko9NM8PfQ9VCU80/pDJjqVNV0JcBkTdN7sdVzjlUL4xSGwdxxLbCUzOVnVgkK7g8T6iEFv3JoKwdWvbSI+i5cUoCbZlAHEDsbHgrn8/D2a0IBJXSuqO8Uee9NdFN+zPS8KylbDxpg4tFC3uFflyoE35xXRkzygqZCi2cy/7hmt0YwN6iJgaqmMctePgydG10+04mWMIFX6TxbHSlGWVlcnKdhugp7ZAEnbKNyMJXx7KsRIqqYowDqrv/aNULKLpJhRifKtx6kgwvoNrDQKWFY3EGlZlRogulB9tiDGIq3kgO5cxMRP3CIDB6BgkQrpZuXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvG06ATnhU24nT+VAYelMhW1vIq7kED13aYVbuot0kQ=;
 b=gqSZrD2B91zh+WL3lXvx1h83sOmmZneLFKWTWg5uD+WwE2pfl9/1PqYEHVywRK1LHInDALdElZzRhsyudP7x7rStWWAyROGYD2+CuDVXrw5oFxzLaAZPEH6Ba7OWL5dvVpILemUYev6jiHnJWzQHD4KlARFyjRZGOZsNjmc4bL0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB7127.namprd10.prod.outlook.com (2603:10b6:8:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Wed, 14 Aug
 2024 20:00:03 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7875.008; Wed, 14 Aug 2024
 20:00:03 +0000
Date: Wed, 14 Aug 2024 15:59:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v5 3/4] scripts: add verifier script for builtin module
 range data
Message-ID: <Zr0MvswCE3VJBKhp@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
 <20240716031045.1781332-4-kris.van.hees@oracle.com>
 <20240814151945.122da7b6@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814151945.122da7b6@gandalf.local.home>
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d46acd1-27ab-40bc-b5ff-08dcbc9baf5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V/vHTlYORZUtw8H07ZDgwtimYNOng+RlrimYAS9PZRP2vbAH6kr+v89o1Tlh?=
 =?us-ascii?Q?f/DJ9/M5zT0MqLoAhCJGGxsniqmQ7MQ9gZDi6M7cakA3ulZTABpRvMR9wJGO?=
 =?us-ascii?Q?Sq/cyIkHpggpFqjr1nc2NlYkhQUVjsMxxO9jZWHnCXsoZF5n5ReIt++/iPOW?=
 =?us-ascii?Q?WnwNL0sOlrteVh/+z/7/Ed6NBGbNEVEhiESM4NE1hwzIv/rjwb5bo8XQ+Ogl?=
 =?us-ascii?Q?fbNfWoT+R556UXbq6MNn6JmX4jE+GpqBzHuX/8lgQN9aYEsvPraB1OQPJZd9?=
 =?us-ascii?Q?IwrIktn4k1kKNYnbg5K7uG4AJL0H6b3IqQFf0TgA1bpcRn+CCyygXeWGmzaK?=
 =?us-ascii?Q?jkCbYutDzo2riDrtllIMyFISHCZvXKTk54fzodiNw7z48rEUDfvBUc/RGPwa?=
 =?us-ascii?Q?tO5XKsDR7E+8/ZYm88q9X+G1rVi02kRW+H/9P7ZZ50Q0CnKc+UUPbOh56qod?=
 =?us-ascii?Q?n4JVNm4Bhy7kvDSNj59aOXjKkSgQ1JOw3ur8R4Mv5WIyPUYISvMk1CMCwhmh?=
 =?us-ascii?Q?WkFEN8pISCGzOGP/ivUjcAKzji6fXH2mkO6WvbRg0WzWP5RNwVDC178lAIMQ?=
 =?us-ascii?Q?0K8hAyBsjvljGvUTVLZBlpZjsk7pmIZ6LktdfKhDAZubZA8KvBhFG9cQDCLp?=
 =?us-ascii?Q?EfZJGDReY5Ki7Am5w8TF2vKcZX1dUoEhstK7mu2Vir7H9//kMmEgcxSptPon?=
 =?us-ascii?Q?16ROlg98k4H5ewf+PK+NJxtJpDq0d08QMibAq1R90l4P6jbklCIEq4y8mbXG?=
 =?us-ascii?Q?VgBs7rtPYNykWB7upzmFUovyenpKEm4zoF6jbcIwcqlhquE/R7f2V1Tynq7W?=
 =?us-ascii?Q?LezacehmrA+/ipMUEA4I/Po/7cNYiMiL5TtFmvvU7lmcqkeYs01a/A2UrUvz?=
 =?us-ascii?Q?Ex47TxDE+6QrMsdH4zpH7GTBtN+9rp2cuWlv9+un+cYNpcSdh+p2xRA1yKk1?=
 =?us-ascii?Q?blu9fd2y9NCUzh3383WyEAgKzsdVU8b7r3Ur71qHyKDXv98Z2y5zfwOvcUqN?=
 =?us-ascii?Q?aps1cYHz4Cm4NfG53XgReqzJbgGqi8MyVBy1dLGNsTC1otxwx1/topxV9FGq?=
 =?us-ascii?Q?LDGOaexU/3InjrSh+lAzVF6u1S+iBH50VeGShzlDPAypv2gP+SQ0ExFRnqUn?=
 =?us-ascii?Q?dOlJZuaxqb9aXUiT4M5GT/LbmyCXi6JXFCf3rU57HXrtuPaNPSqtAf8K5SS/?=
 =?us-ascii?Q?yk2azWwheNZMfwCIfts53fdyVez0uxVBD5W0ozVlUHX3c/JGo15eiW1Woe1w?=
 =?us-ascii?Q?sk0OpVuFlIBrNUF+tyC6ZkGYRCfzmk06nq0WiiZTATWUz5B2TQUQ4B45Ef8M?=
 =?us-ascii?Q?vOxarpEoWBVpTv7uNsRbp4XLmDte5Z5WkBcShY3o4SspWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ooHxv3reTxb+uciHxEwlIr2qNXqnanFK5t4TsiwgWgMsaVpz/Zddl1enSjer?=
 =?us-ascii?Q?kQjO3lXu3BjKRnK7/bOLdbc+lZtrkZ7sTnPBgPqi3XDpv/hP/xplULLHThy2?=
 =?us-ascii?Q?z50wPs0CS6BiE6O/d15hl+N8X5Q6g1oskanRJPHKCSxeE8BMmqdFrsuBiHLy?=
 =?us-ascii?Q?o0Wg1OcRfuaepzsh7kQHNkWOfnHSDPVH2ax2Epzz4zUgUDBKKsBnNNFq9yLV?=
 =?us-ascii?Q?eTcrjA6WcHTtJ3JvUPUlM0YnGFaLyZFy0JH5tH1np9Ut7foxYWBfKZ9SALIn?=
 =?us-ascii?Q?obrBVJzdW+ukbNNBU7PQLvUmxGW2uO40on2OwmbCiXmVIA7Iij6zyV9NRqN2?=
 =?us-ascii?Q?iqXbS+OiNwj002ftOtS10h/ah8uLWuTdPnAnNLmgQtXHfM1tLczx7W0UyWhK?=
 =?us-ascii?Q?gtrCieugLbwH2p+pUtY8WCGpAYR9+CzNCfc2piKookQYmD0/q04KWav/JF8N?=
 =?us-ascii?Q?+OmWM98nlN8F4lCD8RScJxS3zv+pGsWwNtv0ofnBM8vUwD+wOSl0geyTnObi?=
 =?us-ascii?Q?SqAjgmq9pzc5YOd6nGUBt6KnpisX2OZGpRsH+nIcFFDaJaX7Wa2RW3Qeauud?=
 =?us-ascii?Q?p2NthjR1u54EsA2SUf6/ZEuyxQKCKt4Ems7g4Oz9wMBVF/sJl+kbDWkgyca/?=
 =?us-ascii?Q?nLhZ2xEpNZGOpRhJCTwcPG+SjSb8F0sKH53HZHyZYTMnNmBsCzm9nR6YPYWC?=
 =?us-ascii?Q?woSU3smVHZ+fGx5qXMKpa7cSN/mI5NVJbDUHMtjGF97OIaMcwjAbJ2A4rIoq?=
 =?us-ascii?Q?iI9uGBAMjcTs553ph0As7JWay+tUMTKoqIiIspDlkDw7MUbLjXDuk+AqzhIJ?=
 =?us-ascii?Q?xtVgAg4HQy9nzeSAQjLaWu8BzFYPwaESYwtD6EqzEyQyU+vJRj9Nn1IVBpv3?=
 =?us-ascii?Q?wRViATXPkcncke1ylVmFpl7lwypfv39ukGwMe5iPdrgnku51UES3/F18IRPl?=
 =?us-ascii?Q?rDWPTdr3fYJVCyRIor4zqjBtvMnIOIFt3/Pp8UllWkPilDbFoim6ye6iPryi?=
 =?us-ascii?Q?g2xaZhZnwqt7IVOOcuw/jQMJQ/HQmYIrXWWhMbQYBTR0nvOa6bqTm9ufmdXY?=
 =?us-ascii?Q?YJdiDuUNU9HbET7JqPngUR6zfZ+6zAWeYtnDBJ/FYGUa7RMOPK5J++H9zFda?=
 =?us-ascii?Q?tbPD3Ta1iG/2IlFtSYyRTV7TRYJVbasJPszxxhnO7Bompily+dwiPL9lEKC1?=
 =?us-ascii?Q?/ZyU8UYFjKfot1h6D2wnLC/6Bb4XlF55dzPEiwU5UUfoMOHuzcygSXfDY1Wi?=
 =?us-ascii?Q?gqVhLJaIz878ClhB2GdoxRE/MHw97Xvmx441IN3/DjeGt17Bth1ro3OIBMmt?=
 =?us-ascii?Q?9SlXo+VcVeO/HDMOg0TiF6XnE70CO4+hwN3xYtbi0GXDqZObekxvJn7ZYRbd?=
 =?us-ascii?Q?BgFZEIFNbrCnAksT0qfVLpGXsbCEXGbBGHxcClel0KdB2AR2hiIIOl/hzzKO?=
 =?us-ascii?Q?hTKz5tt0k5YAyaBLVFp8BELi8K/vkyhXrlc93A8IfkHY1yqE7E5x2r2xOOEo?=
 =?us-ascii?Q?j+axzPjL3vZE0ynwkbxxKPyfIadjh/1JOv9YikaPg841oyY7ueJnix1ug82W?=
 =?us-ascii?Q?K4ROilB/UieWab5qSqgFYrgx5SyZRoG98StEQjUYYvqIY5Rw8QT4ObmrRPY9?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WjGH6sjSlNtWDVo5OqPAjfDLjXfFcI6R0gglVAckweeOSylLlY77cH+eWCkslVRBj4ILPv3UIFWzZATq+YQV7dGYT2gOIr+V1/aunwtMdUJ9Q6PAIiE6omRjQjTk65zNt2EMcjA4j/lwxCz3cN20l3FS/qsl6v7OvBzSvL5YIFa3QPeXx5viCbr86BNmt4NSMuUzD6DOMYv2mhjDAQ8cuN9j1FgIsoNyEt3nHY845gDth5phMi3ERUWzberpVUWSyg6wepLhyHD0B23ktXoz2lPwtyBzixRFFy56ZqZx+jtjIKCw9z5nL24xpHkmp+Eko/yigMKVbfTE9Ye1XZtbS9HrfBhSQOHSi1ZUeP40mDru0gclHhjRC/U7WVk3+YqFCOwNiWz6/AttzHBYmwEKs59Qfb9K3SKdk2AW2tWXfW1BD5rkMt0SQpgpe/vDW1Hpd3bV9h/y+89pw9ee+11HIFzNUQIC4Zltd6qs+nFU02AO04pAWjTHy/xMBXLfMNHf/rYj+p9yFDtq09LS1Y0n7wZYYB4fl7gj81rU1+KVIjFKU0xNwr/Ntx9kavCsDqIG0frI4KbTkZOhG4fw37/MlxxAct0dv3jtH2VnBpiDsN8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d46acd1-27ab-40bc-b5ff-08dcbc9baf5b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 20:00:03.0156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEcNAu/sElF1yqdRsD11fVZysjcfQDPqeE1wLbxOwKYYwASFYFbHkOKsHmt0XvMSlk3aWlBa1H3dPPyXMnFmyQ0x7eW85mwgvgmKrAD2+80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7127
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_16,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408140137
X-Proofpoint-GUID: MH8uL0VeXO6NsbkrxtMiKm6h8ZTyf1e9
X-Proofpoint-ORIG-GUID: MH8uL0VeXO6NsbkrxtMiKm6h8ZTyf1e9

On Wed, Aug 14, 2024 at 03:19:45PM -0400, Steven Rostedt wrote:
> 
> Hmm, does this handle my concern from the last patch. That is, if the
> previous script is broken by some change, this will catch it?
> If so, should there be a way to run this always? As it looks to be only
> used for manual tests.

It is meant to address detecting things going wrong, yes.  I hesitate to make
this validation be something that is always executed because I wouldn't want
to disrupt people's kernel builds with failure that are not critical to the
operation of the kernel itself.  I could make it a config option so it can
nbe enabled for those who might want to, e.g. for release building?

Does that make sense?

> On Mon, 15 Jul 2024 23:10:44 -0400
> Kris Van Hees <kris.van.hees@oracle.com> wrote:
> 
> > The modules.builtin.ranges offset range data for builtin modules is
> > generated at compile time based on the list of built-in modules and
> > the vmlinux.map and vmlinux.o.map linker maps.  This data can be used
> 						^^
> As my daughter keeps reminding me, nobody uses double spaces after a period
> anymore ;-)

I am old-fashion :)

> > to determine whether a symbol at a particular address belongs to
> > module code that was configured to be compiled into the kernel proper
> > as a built-in module (rather than as a standalone module).
> > 
> > This patch adds a script that uses the generated modules.builtin.ranges
> > data to annotate the symbols in the System.map with module names if
> > their address falls within a range that belongs to one or mre built-in
> 							   "more" ?

Oops, yes, thanks.

> > modules.
> > 
> > It then processes the vmlinux.map (and if needed, vmlinux.o.map) to
> > verify the annotation:
> > 
> >   - For each top-level section:
> >      - For each object in the section:
> >         - Determine whether the object is part of a built-in module
> >           (using modules.builtin and the .*.cmd file used to compile
> >            the object as suggested in [0])
> >         - For each symbol in that object, verify that the built-in
> >           module association (or lack thereof) matches the annotation
> >           given to the symbol.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> 
> After running this, I do get a lot of messages:
> 
> uncore_pmu_event_start in intel_uncore (should NOT be)
> uncore_pcibus_to_dieid in intel_uncore (should NOT be)
> uncore_die_to_segment in intel_uncore (should NOT be)
> uncore_device_to_die in intel_uncore (should NOT be)
> __find_pci2phy_map in intel_uncore (should NOT be)
> uncore_event_show in intel_uncore (should NOT be)
> uncore_pmu_to_box in intel_uncore (should NOT be)
> uncore_msr_read_counter in intel_uncore (should NOT be)
> uncore_mmio_exit_box in intel_uncore (should NOT be)
> uncore_mmio_read_counter in intel_uncore (should NOT be)
> uncore_get_constraint in intel_uncore (should NOT be)
> uncore_put_constraint in intel_uncore (should NOT be)
> uncore_shared_reg_config in intel_uncore (should NOT be)
> uncore_perf_event_update in intel_uncore (should NOT be)
> uncore_pmu_event_read in intel_uncore (should NOT be)
> uncore_pmu_event_stop in intel_uncore (should NOT be)
> uncore_pmu_event_add in intel_uncore (should NOT be)
> [..]
> usb_debug_root in usb_common (should NOT be)
> usb_hcds_loaded in usbcore (should NOT be)
> iTCO_vendorsupport in iTCO_vendor_support (should NOT be)
> snd_ecards_limit in snd (should NOT be)
> snd_major in snd (should NOT be)
> snd_oss_root in snd (should NOT be)
> snd_seq_root in snd (should NOT be)
> ip6_min_hopcount in ipv6 (should NOT be)
> ip6_ra_chain in ipv6 (should NOT be)
> raw_v6_hashinfo in ipv6 (should NOT be)
> Verification of /work/build/nobackup/debiantesting-x86-64/modules.builtin.ranges:
>   Correct matches:   24962 (75% of total)
>     Module matches:      0 (0% of matches)
>   Mismatches:         8262 (24% of total)
>   Missing:               0 (0% of total)
> 
> 
> What does this mean?

Hm, this is certainly why the validation script exists.  I am surprised, though
not entirely because kernel changes toward the 6.10 branching and such came
after I create this version.  Would you be willing to send me a copy of your
.config for this kernel build so I can investigate?  This output is typical
of a case where the script was not able to determine offse ranges correctly.

	Kris

> > ---
> > 
> > Notes:
> >     Changes since v4:
> >      - New patch in the series
> > 
> >  scripts/verify_builtin_ranges.awk | 348 ++++++++++++++++++++++++++++++
> >  1 file changed, 348 insertions(+)
> >  create mode 100755 scripts/verify_builtin_ranges.awk
> > 
> > diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_ranges.awk
> > new file mode 100755
> > index 000000000000..a2475a38ba50
> > --- /dev/null
> > +++ b/scripts/verify_builtin_ranges.awk
> > @@ -0,0 +1,348 @@
> > +#!/usr/bin/gawk -f
> > +# SPDX-License-Identifier: GPL-2.0
> > +# verify_builtin_ranges.awk: Verify address range data for builtin modules
> > +# Written by Kris Van Hees <kris.van.hees@oracle.com>
> > +#
> > +# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
> > +#				   modules.builtin vmlinux.map vmlinux.o.map
> > +#
> > +
> > +# Return the module name(s) (if any) associated with the given object.
> > +#
> > +# If we have seen this object before, return information from the cache.
> > +# Otherwise, retrieve it from the corresponding .cmd file.
> > +#

