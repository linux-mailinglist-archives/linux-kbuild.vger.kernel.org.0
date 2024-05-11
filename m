Return-Path: <linux-kbuild+bounces-1831-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E998C3492
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 00:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 456111F21CE4
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 22:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3F31F5F6;
	Sat, 11 May 2024 22:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aIb5/gj3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PSI7Z2TG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E06A921;
	Sat, 11 May 2024 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715467463; cv=fail; b=r2BIFZaj/d8mCwl13HTula2gDCk689pEP80L+GKOoMoFM9G92xu4A0bb+J9MeckkdLr8PtbrTDZolAkfF/5vs/iF2b3PLOBjZGe5qG+jOEzbQlCrrnaW3MtZSvXqYLDnmXsUNi8Sp65U6/QKsUDxEIW0BNQ7eK2ek6BY88oCaFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715467463; c=relaxed/simple;
	bh=qQ7efqJN+WgaT9YWgUjD+BM/7P9g7yPH8hAoJp7C0wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JAmaM/fabFXC+OY5InLYvZeNKpmwkBqTJqxQNnxI7+in9XyVPVSsHK3iaddWYC/TKy8I9qzvO37q5yGo1Lzi1lb3Yh44YcO9z/XQXrziGPGqL+an4EsU/2+2pS0INF3mQK1xGCVcMFO0hTTiLw4Vzv97BLbw91tb9s1ESLSVlBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aIb5/gj3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PSI7Z2TG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44BMXpSx020928;
	Sat, 11 May 2024 22:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=soqCBnxEsRoJ3i/M+/9PD/PZDRGrse7bEFnc0Ua8+kc=;
 b=aIb5/gj3pD0xCc1jzzd1c6Fo6b0O5uqrtjcuRpcS5rrpfOwzoczxv/jXaStIF3qGkyXe
 lxebggv+MpJtY9L84yBM2cJF+7oxeQNMWewlJ/hpS6PTYTHaijPJieLGQ1voclbj16Nq
 YiOhEkpV97wxKuC7fivFXVUWvLlBmVqOgV6/PWImFPKxwvI+pA6S6F88Bgc7IL3OhXrl
 XMx8KlOPJbMMJMde23tPWOleR8i/lO0ERy1JVktN7ypOXqO+Pn6wavh7JPUR4UKE6SDG
 GWlIImXQNAI79avtwI50IR5/gYXWdzRfaLlYiRHnsKR0eL9NUiyspagOzV1g01Qs1mrg UA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y2hjeg05u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:44:17 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44BL0dMr029424;
	Sat, 11 May 2024 22:44:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y44hgkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:44:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EB9LJlNvKe7hUtrggSus55xEMIP05IqV4q2kPMRgD441gYh9+0cilB5fnBcsLwhUvvojuq1fIvRHJZnkz2e8oT1dgcX0AGAISx2vNUjL6Nf9ZIgBpHzBzalMgd/uO8imPsxEx5fL2j+P5UFuOGvRf0icx6n7JJj0OAS8fJAHnXKgldsOUBJI8yVhSoo1n6Yik7YpdPj0/ZE4JIB1/+C1WSD2IjemBP6LqAm2ZxszYzrcnVjQC14hFtst4dOFilcEsFgY1dYY7fqvJajSunGR1M69mQMRl2z5q8JbDJrFvydh3VdGNmC4dG46+hOFr0o8j3sBdRG2+FdVzq9Gpv8qlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soqCBnxEsRoJ3i/M+/9PD/PZDRGrse7bEFnc0Ua8+kc=;
 b=NktFc+z1Vxp15V9gln/Zpt7IAxwUgKQoPTYMhaFMUWUiY00C2WuYAXQWJBVZdhwEmjvcLQ9VpaRpqGlGlibe3T+Eg4ByLynqV9RQW6wgkkp8wLKdEDnUxrMH1tGjyvg+Mqqyl5qj7FqzCzngzMuj/cOcHO2eNQRSs5sXSbjxIVZhLr0yopvIlrrWIhg1Kyfk01SJU8tdobvv3YWAJ1gV253u9WHdA5eJcGDsZB2+YQMAtyh2h2493aiNvL1Io3VgluiSYC66856zH7Yr0lm34iw2VEng6RN8DM9/PT/+Y4UuxZX8H7v28Cl0eKmGvicqNn1H1dTXsPk9Ka7sN1HhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soqCBnxEsRoJ3i/M+/9PD/PZDRGrse7bEFnc0Ua8+kc=;
 b=PSI7Z2TG13GKHqH3vV1a1b51f86ulDgPTUcgJ7Il1441y9/ALsT5wS+GoelcQeoC4l79fZTmeJ5MDmRpAtiMXt5i2Q5JSNzkqhvYqvoK3b8+uR7kGPJsXpHCkEPLdf/gmrEQCcBoi/fD4+V3W8shQGY6CuBs6Lkzi0rPjqPoyss=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sat, 11 May
 2024 22:44:14 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 22:44:14 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v2 5/6] kbuild: generate modules.builtin.ranges when linking the kernel
Date: Sat, 11 May 2024 18:40:34 -0400
Message-ID: <20240511224035.27775-6-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511224035.27775-1-kris.van.hees@oracle.com>
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0017.prod.exchangelabs.com (2603:10b6:208:10c::30)
 To SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a3d38b-ca6f-4850-1439-08dc720be247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Sdk7LhsmYTTAjk6Z+dOyEmatFfcOB1tAZjKbH65Cx8RFfmUoSsoqTGUlJNT1?=
 =?us-ascii?Q?i63/T0XzEgqJZISFXXkA7OQsN9qCSFEadRz4ODveZAwcS9ug0ziExk1gmJvG?=
 =?us-ascii?Q?AXxvH26V5JsumkzMGz+T0XJMlfhoCI9dfySGU5PPITSjBPYl6GgYqpQlWF79?=
 =?us-ascii?Q?kibNc4lI0yosNFtdIvyed9xOBiaShwSVExt17l0h1CjWBtejf1gdV+6MKcX9?=
 =?us-ascii?Q?CauR6PMtEqsdKK2E++0iWiHkUgfTdJYe5x5oyX5uybVLuODf/CO+d2PpWBoX?=
 =?us-ascii?Q?uvakyuRRVbeq7C1eHE37pBLC/US9onbx4nh8DmG+s8fSHO5+L03PON88rDcu?=
 =?us-ascii?Q?YSiGFLtMvfu3HmZUO47RAedxFFlwwduMXYs5VZBVMbZz2qCG0kztE61w0iEA?=
 =?us-ascii?Q?fZp8P9z1agZ+qtceD4+/5viV54Jm/gkCIhy/+V9yUJW/F7QgXLNS+0pJGz0n?=
 =?us-ascii?Q?sbMFJBhjIwHM32HDrGgtOpy1xMiIfdnYxoAhPQ8yelKgocoMSQvOgAUjbWiU?=
 =?us-ascii?Q?BZwTMAUi/Pv5GC8ezqH7u00gnPAyhaiJ0lygk+B4f6SJAN01QEFdKWNyvYjT?=
 =?us-ascii?Q?Eij5dJB5iMBR6uqyWxvN8Wc0SlvECBZF0wKKru/jHOfZc6JRe+9aIBpa1kzK?=
 =?us-ascii?Q?9vcs2xjs9+J+lozQnVmR44mOd7UKYc4eZOmVGhhSpekmcSVOI9WB4PVNKEQz?=
 =?us-ascii?Q?AdnyDuiLptnQnR6+v0WlE7A2IiT2aP53HUKjEgKv674gx0Uarh/HottR/rUo?=
 =?us-ascii?Q?dlkaER/6OHMgFqbmq/ejwCnI6Inm3QiZL47PyGFW4hm0i9rTBXmOzjycoTtN?=
 =?us-ascii?Q?73PD7Mb3TkwlVXn87b8ZwAWGTy2ToGc9U65gME/mCzZ0It1V/VkgQdzghGfl?=
 =?us-ascii?Q?Cmhaz2+uzfUKGtYhGosSjm50GQ0HxSb76DEmPAJMLqbvENCVX54EAe2lSp0x?=
 =?us-ascii?Q?QnerRabIDCFHVRWuH6PoQZ6r7KQLe9Hm401dYIXzLGCYkXJwrfgwEFngVhj+?=
 =?us-ascii?Q?prlGsow7Zo2ifzR8WR7ssFfO2+KCfjYnX3wlyg88itjv0sbvylDc50qXeeE1?=
 =?us-ascii?Q?+aZ9b4azyUVxpUcqZ0C1nNL4T0ZIKGYg3qn8gZdSNqXJpGJKYculzpQ5GgJO?=
 =?us-ascii?Q?RUUbNnr8rmakfWql9Elb+2iEJvrQVA/x/DIvXHRlUQB9e/ztcQZAJAKrD3QZ?=
 =?us-ascii?Q?L1AC8NzXEBxEsX7CkbEIEdTEHGlUmuN6R7orUhu/adGHkxFUtyNzbUhJ0FDN?=
 =?us-ascii?Q?u2/rV/px5GJ8Gq/IRKv4McnAKzSNoyZesPJGezx72g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5F47ryrTDYw4c7Iacm5COtB9HyUjzXQ8u9zsOMF3qcTH5t8ZEwE+O0Iz2bhw?=
 =?us-ascii?Q?+MUtLkZfbc/cSkYzwmd92NQz8sKwTC/bFPs8PmYsf1wuBX2j575N7NrW0xpy?=
 =?us-ascii?Q?Qk8csKyzZ3lxwiFW04ZJr2en3KqwbwAbfY3U/Q4IEOi+s2AvlHb/WlNyKp+5?=
 =?us-ascii?Q?8D/r5jvF9l5lH17ny/dUnoDN1up/4Mrian/s2xs0UXGmESoY+C4tYtBasyFR?=
 =?us-ascii?Q?bWAGI6YSFBBff1aYbaAI6dA6xhcZIPrHTy1HRRoEB5O4/NBgpH7PZ7QHb2XI?=
 =?us-ascii?Q?grI1UYkMjwZQNf7aRrzr6O5hGhiykQkHVW8hCpZ7KnlidYJjTXhv5zevMG0v?=
 =?us-ascii?Q?IRL83fuUA9/DFr4gk7DPYbkRRYwFVSVH44zIbgnp88wJttV3fAPlshvreQCb?=
 =?us-ascii?Q?+V8j/Jwdycoa2RsxYmyn2qpX6/6cTpFr8aKoxZfLYXIOQ3ZsaD8U5XgZbcSb?=
 =?us-ascii?Q?DkLkeS8UIGugZRD8b/7cs7/zsRi0PVPbF1AxgqfIcEh6GUFHH44fUnmAslig?=
 =?us-ascii?Q?t9s0dP1OG47x8t0aJjycnKh4ZvsJtdTZBkfUgANhuh3wfTyEJP6A4HkSYZ6J?=
 =?us-ascii?Q?ZLhdpedzCkezRLbUglgM8gbV1C1HIiQT7q4bdbpOnXah7ymT+cOe3UfNVWNb?=
 =?us-ascii?Q?FxFFpeiJV8uCyDS0ZT3l+3tV5tkmHcYUo2V3Ts7ZzZfREzADImH3re7fJJD5?=
 =?us-ascii?Q?QrK4CFyaORC6Jp64RswlmMJEjog/NE9+QOE6AWkYD7zDIXyJGjShjwSloCaE?=
 =?us-ascii?Q?jSTTYNT/pKhSIAdrMct5HUPcfNBIwj3l6rrXMepbBmNz0uFzvJXIpGwaba5R?=
 =?us-ascii?Q?N3Syvqa3aUJw+M4w6O04tblp2w59u7iKsBdQmfm4n8zTkadcIGpUEhXWKwoX?=
 =?us-ascii?Q?hSWpjSx6oZkTJecJbvgsYofs7b1g/eUpPG70ZXLVr5FmVmoHUss1ed97Kskq?=
 =?us-ascii?Q?EPsvDsPt/oRVPShGVGqhXbxGtteJzcB7AEX3Cl9kgDH9Aamttw5gJrcXuUAW?=
 =?us-ascii?Q?xQhBQg+LgQkkxDbCLVdltjG5WeRKx0H1NrpJDn3eBud7YAp6i0HZ0B8NKSJx?=
 =?us-ascii?Q?wAkjcxErJRfdLdBSiJ++wWBJdWBPbZFbUG89nc3H4SCJj3mhtjQnbrOAgVvu?=
 =?us-ascii?Q?RbdfjqnRdoHdKJsY5m/LXm2BMtbSTZb6MVvavT9ruvo+FYjulQ+Ts8kT9buq?=
 =?us-ascii?Q?KRkaL8txtPrtocMtnIeDjCHZbrDymB4m+de+szNrumJ1x+FYA/KP9XYZI52Z?=
 =?us-ascii?Q?0kBf101lr9ozINutQEauIDEWmnmMKBDC01641EyXVPV7kgCJws87G5Kd1W2E?=
 =?us-ascii?Q?kpweA2TIfCPgxaETnwYa3eOlG0Pj0t/mJxLkJKhOYvLeIODR0B8Re56HuIRZ?=
 =?us-ascii?Q?hFWuUMnkW54otpJ+MTEYixq4orPjI6aI19A5cI7Cl50YlHSlxD1ZRzM01T5q?=
 =?us-ascii?Q?WNzU1GXbJ1QV4ikhTQ6Ioa5n4HHYPoSxxxZyda4O7qua7rZqmWzmZboIeQ09?=
 =?us-ascii?Q?T2oEWUacfbSbeK13rR0YtMOwhyCoRQGJ9hK5dFdBwgtz6vVJ0UMLnoOf3lH5?=
 =?us-ascii?Q?KWTyiodQPt+79XvCNbjcnd04wocIIgCKM/qLqbTHfjb/9wXo0EbC4Vjjdh+J?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2t1ZoCulJrWhk4dOoyORq+JWtyhzFq0Avxn2QSBJceDYYRGU/DBL7ukRYaSOyOJ0OL/gmXwCE5+nvS8cFba0A+kt/WDsDn9R8q2XfWurYf7mLTQG7UjX4NGF5RQIgIPGJ1V3UUDrFgMM/DKSEgZCqytHsGuj4QoqKrXfUr21pneLeEnHMStEoFa6DH+Q8hF+3z4nmaxu6f7/LZwxoZM2VTciw5B7WGgqIJbnScrPw4z2pPnMFSS0sjhrZfiYsdB/SvOr+oyRs4jTWH7vKQCICh6+d6h/G8DltIohfU7KaGlUrl4yBFS4B3Nsb8FqY64YqxqP0KoK/E4dMY7p9ohegSpSC203aOX6VvPA4denDWJGRW8aEIIwuVbjO5hi1ZKon9fFnsRIZKxQxLmqReOrfhiq0gU2W7y8MCEQ4uaN3wCCxkFnw9XwJXAlgrJY9sEV+n+yJXngTgQpoUO1e6Vr1tuG4jxKOyU7OrhsfF+7eA+PVAUDxjBR8sDG+BbqjS8YZwAYeRtGMZncMfA8vdhOXLaHDntx8SXPV8dPSXr+QfPaE92gEsbvftPWUS1+fTDut0O3HFhq4sp2NLi4eoZj2x1MDTJ14cgpwJMF8PogaGo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a3d38b-ca6f-4850-1439-08dc720be247
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 22:44:14.6920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NaweVUGNi5W5cn9x2l/5iMmjUoX8r/5pxwWb4QHLf4s5sKQfNsBIktMCcDlEj2isBFfPXlyC8+uPi51BNga75yE4VIkjvfP9mE9sqRTT7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405110171
X-Proofpoint-GUID: i1DxNEvnWucRTpApuQSIr12UcTPp2dGO
X-Proofpoint-ORIG-GUID: i1DxNEvnWucRTpApuQSIr12UcTPp2dGO

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
---
 scripts/Makefile.vmlinux | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index c9f3e03124d7f..54095d72f7fd7 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -36,6 +36,23 @@ targets += vmlinux
 vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 
+# module.builtin.ranges
+# ---------------------------------------------------------------------------
+ifdef CONFIG_BUILTIN_MODULE_RANGES
+__default: modules.builtin.ranges
+
+quiet_cmd_modules_builtin_ranges = GEN     $@
+      cmd_modules_builtin_ranges = \
+	$(srctree)/scripts/generate_builtin_ranges.awk \
+	  $(filter-out FORCE,$+) > $@
+
+vmlinux.map: vmlinux
+
+targets += modules.builtin.ranges
+modules.builtin.ranges: modules.builtin.objs vmlinux.map vmlinux.o.map FORCE
+	$(call if_changed,modules_builtin_ranges)
+endif
+
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
-- 
2.43.0


