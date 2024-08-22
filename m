Return-Path: <linux-kbuild+bounces-3161-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2531D95BE1E
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 20:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A17221F25CD5
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 18:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937A91D048D;
	Thu, 22 Aug 2024 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b+dEat+y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BFJBMyoe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D181D04A5;
	Thu, 22 Aug 2024 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724350837; cv=fail; b=dx/lgMjwunfqNOGf04TyTGt/1Cy5V49IvbfcYBVrfNQvAKhe9ZhEHMyRyswSW+MnOyh9a2l8ugGCZpA1S/H9Fa6o1v3BarmRAjFh2BgyMZGVFxDDjbpzK+QBI4qlMU1RkWQOVvJyfigidCmY3nDgeHxjskkJ0VLpuHbJxI/SUuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724350837; c=relaxed/simple;
	bh=h5mF20ACqptj34Qr8bwLtsYxU159KJhwDZP0Vincmmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aN7PTPgWFbEhNfY3XwfEAPD1OzrKL/lNT2ktGzlbOEckDfwFYMPE2SUYsnmeKwW2fP0jWyvVETTTpmlcZ1KWaIYhohZulg45lr4sUZrBMvw8ppHbxw3qqE2lFYgpND2R0bETQivy1h/nWAzJW2iXhABYmeYbK+3bL5aB8NrHuuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b+dEat+y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BFJBMyoe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MEQVnP013872;
	Thu, 22 Aug 2024 18:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=ciwn49YsPsMBN7wKW8hbq2JMdqQgIdGqrakZQHG+pWI=; b=
	b+dEat+yiB9+gPOu8QnaOnI4iJMl1ZpcbJOHUSHhYBtUoh44c/hTHL+POgjxonSc
	8+zJnvkIKsKktciVDEmmMsOVfuNWAjubD95kO9SvvMI+eSIFXpecIWT6nlmyG4xd
	SiWLbLz3Q2ppaV8u8nCEd2HtGuiO2v+CIEjkxHGN93DqwLvER67pSBt8c+zYg1A/
	JGs6JIQpoGo8wYnH0cHcgFYbUtMYKe54cXoOxuxxdhAb2xkDdeBuDLFtIj829uIl
	VMuOyuYre0dH0w3MWmQjRthW6ejgMGRoPtHVD5HnJhFg4hGoGG6FqlezYs2QSIwf
	Pxv83h+U3Xvv4wdQgYegVA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m67jmgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 18:20:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47MIDfRH027865;
	Thu, 22 Aug 2024 18:20:27 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 416947mahm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 18:20:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJx/PxlZwii5nday0WA77cQH55jkW4y6+NF/WMwjOd8ET9zaDvVh8X4opZMJgT9gCVsTFCkZEzTuEIG8IRFbyGcOItQ3TpxhLaKa3EvT+U9r/U1HPf8BU5WGN36PE0YUxfn2qHME2y8SUYYhHZQKb+6U4AUUgp6AHjs761PM7uxxjcOQqjFCxGrcLXSMWdTpjI1wu0e/+O8H2FT9z1UNRtZ/n7lyWKG8u/8IzJemmSp4udbLRbONo1IVqtcZhZqiBA/Qfqb6lqp3g6N3O7azsFQUohCB5HwynYuxBIwjjc6NAjD4UR7GbE3idHxuZSZUTHcu3PaHhOE2xOTDoxRd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciwn49YsPsMBN7wKW8hbq2JMdqQgIdGqrakZQHG+pWI=;
 b=JKZB7ptYcl254oKxlQg0K+aCxNIPiTxlzT4EBMYHq6tn//v/hHRxWpltqG0486B1gaxu2eAKhlgeaxzgLUxtlUHR6wgrwB9n1hO39cMQmtoqyTaoQ/6MhBUzbXdJGuuGwr/vdJyBgZ5x4J7giUd2f8WFo8LM49Ix808vPSzsjhDrGnuWJWm1+qwudzmT0/eosbDKVj6ghCwvuB5kmZzqk+jH1LDf7dihx4DXW3xhe1oadGML3qKQI1ZcN4Tdyr4mMHVDDnEj0L/KyILgTHVlfwNQ47CIeu1nFjVx8i+H3Ta5Y89GY/QVNovL2RTD/9Zcn0n4A4uZqej5orpsSzpBfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciwn49YsPsMBN7wKW8hbq2JMdqQgIdGqrakZQHG+pWI=;
 b=BFJBMyoeHQth0l/AURNQ/KFCS7XNgaEt7NbHPnANayjG3EPRQYkP8qvZ2WyrjXZ53CjCwHG3QQivhVH7YI6dQp0uQ16Aw6CV+xEU0dOYHoZb58H5C/+GMIIHQi8nOBpEQDt26uOLgN5tS743BIZt6umuc6eVzr1dc1YQ8ghxZ6g=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB5004.namprd10.prod.outlook.com (2603:10b6:610:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 18:19:51 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 22 Aug 2024
 18:19:51 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v8 3/4] scripts: add verifier script for builtin module range data
Date: Thu, 22 Aug 2024 14:19:40 -0400
Message-ID: <20240822181942.2626536-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822181942.2626536-1-kris.van.hees@oracle.com>
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0116.namprd05.prod.outlook.com
 (2603:10b6:a03:334::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 4714f9e6-4517-4152-5919-08dcc2d7033e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YbjmoEbbVoXv//fugM8WGaQ3pqa5j+cS7MuxbttUfdsw9suGt1TkOLRxZDYu?=
 =?us-ascii?Q?E71z/+JjuFzHVZeKl7r28SWH0t1xYuOEVvm4Ehxl9EMA5A8ZDyNRS/UruQjt?=
 =?us-ascii?Q?2cmj6WOOZEbYsChDefGJVvvq7TGvlCDdERpVe+INih3pLi95IR11yP/wE0av?=
 =?us-ascii?Q?9SX7fuFJcSDTOlIILCH7IHvfnrBHTO//CY24oG6gJbHIlrdKyVrgiaKv8dwG?=
 =?us-ascii?Q?A+kETI7RvXvSQjmd8W5mEb0GsZ530aIeviC4ow6tRFgmzqkadLbmRCTMuqwh?=
 =?us-ascii?Q?5jAnziZ/7nhIlWrK1BFRyzmZztMp0N2eOJpR4UpF/arK3ksbrpfryI6vYuQg?=
 =?us-ascii?Q?8ibg9xlJoL5YKSjX+XadWyXCEupfk2k/raK7IfsCWFyHl7RonLh1oiHzP0T8?=
 =?us-ascii?Q?Gh+QvWo5WCAqTAfTAGODjOJmg2GAW/hRucouCjpLosg5Yu1xi2Q2+MixkW7P?=
 =?us-ascii?Q?tIB7WDVFzPr7wPjpzLglnglTtx8X4vGjfx8g5CTPnpjmiYninGVtqicEcdJX?=
 =?us-ascii?Q?uHunxONvou/bv8h3rZ55Hy9YpXIGm5OZHO4tYJc949fJW7UFDqkT7RqZj2xr?=
 =?us-ascii?Q?E10IZ/NoyGLFLsWgei4gneA8+JxxRHPuM0LjpE49L5WK3EaVCYWiu/GpepfU?=
 =?us-ascii?Q?gnoWsy4eOOajxaP9qDlLi3Vuvl8DmKHf4JpfYd5zulKOm5gJOU+1IZzVAlmn?=
 =?us-ascii?Q?lZLLVxsuKyNLubvKzYuM4vmexHEnStbYOtDXH5ewrMEHTUK+B0nZJnmZjMuU?=
 =?us-ascii?Q?irPrXdj9hBg64XlAKBkVgW3fAsqWtXfvM4M2kPmmS9/L/XhRsvXaG9yelavk?=
 =?us-ascii?Q?bxNJKr01L36tBydKP47lRe4xcZi0Q7LNPzpJLX7vUVN0yt9MqvjhhrDlokxZ?=
 =?us-ascii?Q?nE/b1CsfzriJKpEf/hLJexdc2QoMpp5zV+wy7XInU8ztw/tg+YwxZNvc5yyo?=
 =?us-ascii?Q?VwiS1hpO8B70+/qU9kMa6+LTcBr+kcDq0wb/hqOGd48Br1titUmh0jJWWy15?=
 =?us-ascii?Q?+e7ZfsjmSbztwK9VIvlIvHuuVslTJP8rLj3ADDygF+o459vdMB6/LQBGN8Un?=
 =?us-ascii?Q?NLicDK2fgfV6ajy7v8YE5GiZCZtFy90vapmog2uZhsj5LC70NG2QHlXsQn1q?=
 =?us-ascii?Q?s0THC68BEFFO1urczbT+VJIjFweTMMV+5148S3iwr8TogYTnzE65cIiBjq0u?=
 =?us-ascii?Q?goxjCIW2CibSmU96rmMKQ36QGURNDhkME9ltgLLI2AJNdH2uZe7gZQ3gUxcA?=
 =?us-ascii?Q?ovK6ThWuZyXvn3i8Pok0EUnzjJ/lGvX6K33F733s2GacDIUoza4o1esIO37k?=
 =?us-ascii?Q?O0X7HzmNeG8+tW3o8cSVMeaGD3RRfr9syizUFgu6QyteKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CUxopK0x1uR7unnNQ8RPn+JE2BNzb1mqLF92UJTJWAaC2UFFGgnY2SPQdeax?=
 =?us-ascii?Q?IcEEMugn9fUGwUO+KknwalKPxcCFKgS7Ufzah07Xuxtihj8w9wfdYp+XM9iZ?=
 =?us-ascii?Q?gW4D69jeAMuABazg2nGTOQ4BpOEC28qW1yvmMpSI8QfoWjs1XrE154ynzJuT?=
 =?us-ascii?Q?8Bzr/eLQGNDZLUgcSpNOn9vDcKA5IGeALgDo571FTb8VrtR8QIp0+JgEMjLm?=
 =?us-ascii?Q?2vs+70ki9iKpG4pwIjONrcddqjVof8cRRaLqrKypc9RCOt+8DrMK/bMmHvOo?=
 =?us-ascii?Q?OmNGjDoqoKy4CcsDbQt9NWcf/grNlVzS4w8SW9FQwzdgZFGxTTrMOU45A56P?=
 =?us-ascii?Q?OzaLx56VrHyf+K3Evb6bQp2Oc0LcQTMbctrBi4BnidaW7Cv9bGxb9nv46qcI?=
 =?us-ascii?Q?YXQyUfYciwgkU5T3Unfpe5/uR0WIw6wBsr9yJoHBY71OMcTTu6jw0cnKVEpe?=
 =?us-ascii?Q?50hX5YH/L6cryh53Xtw4wk3J9BEZYBGN4gjHW03Wjqxw5ZaMrV+17BAcj9BO?=
 =?us-ascii?Q?Qv22C0maoympESTfYbNiHrgUYvqrs3UJZsSlYajWgqN+Y4KOqdhZZn3/+RgQ?=
 =?us-ascii?Q?REJlTMQGcPoGZ4K5WOx4E7O7YnwjCHJI7vU8pqRxid8eP1q1QkNQm6YuuqdS?=
 =?us-ascii?Q?/GaRQUqNAbSn3UTCRJXYJtvW2o1gjq75grWU405TYMMoPtylXBtg+iPzxxpv?=
 =?us-ascii?Q?qgOuS7piI8jWi7xroDSld1up84002HfGYwzx90dIqS9OCFQNnF63abnpO7nj?=
 =?us-ascii?Q?MTPS6UVyszIfydqbIkPSGVgGeR0Oj6S1sX85YEInPZ9QQEyDVF8pAUzfyvwj?=
 =?us-ascii?Q?Xyk1zp2E2Q3R2InAnO43c2ohzd6jqtTrnas3As8/bhqZuSprIx6LQzh6aBS7?=
 =?us-ascii?Q?u2pKGihP8gglyC2sDt9+dwp8vGNTPQe1CP8Vl7yzmwCbgI0Zky3vAd82zQXz?=
 =?us-ascii?Q?7LerH+o3+DAfcSbfu5TzQ8pKbBuxDp5ZrBxTri+KBwYzJDlO9gk0GPfulmdJ?=
 =?us-ascii?Q?P7MFif6dJMRon/sYnGxO50JAVYmqyD2/NO6QfLEntOpexdPRIDQfuWjViCeb?=
 =?us-ascii?Q?E8tF3M0JsWfH6oV7fKGeyg3Wek22GN+t70VoxLSuqlvC+cdi0L0tUD9Z34Kg?=
 =?us-ascii?Q?QNrSO0Q/r0NYfZovruNA/OXLQBGwC+eS4QDhOCcnBJKqjnZK5UUMUgsWqiEH?=
 =?us-ascii?Q?j6juoXkoPGqiBSKz9m4oVMz7HjDO7JclaxwJ0KzMcevvYIHGEWZo0MaJbVxy?=
 =?us-ascii?Q?XFOCvLJBxyi4qUG4RVn1R+/VkxoPeUDSkpOs9GVbk0DIXeeuYaBIJVjiKBhV?=
 =?us-ascii?Q?JOkTsi4oxTKlFQgCT+mvcs7CrjCs+r0ITYw25k5voJkiBxsuCtJdek9KtDkI?=
 =?us-ascii?Q?HpoSHWgkipdXvSXMnKk7kQcfsPbPKtnjSadRdeJ4quC0qh02a59rR6nZkdWY?=
 =?us-ascii?Q?BsmXAky9fJTubhY5ESioQHVnZE1NgRqTRZmX4l5P5Gfogq8KxFnmSyvAVNgG?=
 =?us-ascii?Q?C8jSdhyD0xC9f6JOyOLazqaF5chWFQGV3WqzALyenKJhHQSEI0tSODy1fk0E?=
 =?us-ascii?Q?lGWmbQ6lA1UiFYW+l+g0P2WYW/dyMpCeVR7KGDrCdOE9SxZ5BFkJF4mjToBW?=
 =?us-ascii?Q?Bnp+DhtEWj6uiJsrOAqV7jU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	74FvpTM0cMafLMPKqPyYmmyUAFYTeq7scM+4uFfy8L903CkUsVVdgwYXrfk/MRJXKY8JPfcnsEuj3gc8OhEpL6+9vxVvkpIBs8e3sPoU6QyP/+nPHwcxP22yN+eRVKf2XZRQrzb5hV0gXcDfrRevDAjSZd4i1gL0B1a0zxhEgBfEon4REMhl+V+20vcHAFfmPL4lhkxkh58303MaUdmFMHbOAqCk/2oa6m7J/zhZe5OcxKZygqdwLsmaZB1yQ1UfSjhBhhYAFSIaq6mV/LBaTN1N286SIpui5szYn9a31O1dJORspv6B/T1b0z9+5hWsWwUXHcijeX/43sqW+G4g+g++hRAIrC5P9Gnmvz+t80HAqGbNHg6BKmcFBikRUeVSM98DUQblwv9WyA3SDqslekXQS7rsleZsCaVD5Zzrb7R0lH7mQe18y6XIQ47rCdVp0NUAp4LR9HV2oixEYgxKFajcjrkluulwJr3sukkiBoBHWpzVzXt7TIFKY7Sp/Amy3DRFHO2dOpGeVu0vG58o2niRrUTWddLkJlVScaAqxq9AH+GYdT5ioxU0nvTynwSMcA72ndPKZuwRmnCOwryhfbBcMDe+SNC1WgAnEybZYiM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4714f9e6-4517-4152-5919-08dcc2d7033e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 18:19:50.9148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTR1Jq6EbpzcMD8c0Bb9wCds2965Z5Ss1E0i4K/mdkF+WeGx6j4OWmH9J1dA05MWMyCU961ypu7n/QSAHCIp+UUMPBSMyRvGnwID7SRRjIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_12,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408220137
X-Proofpoint-ORIG-GUID: StMtz5OXgdZkR57g6-EfIWB4dtos3bsU
X-Proofpoint-GUID: StMtz5OXgdZkR57g6-EfIWB4dtos3bsU

The modules.builtin.ranges offset range data for builtin modules is
generated at compile time based on the list of built-in modules and
the vmlinux.map and vmlinux.o.map linker maps.  This data can be used
to determine whether a symbol at a particular address belongs to
module code that was configured to be compiled into the kernel proper
as a built-in module (rather than as a standalone module).

This patch adds a script that uses the generated modules.builtin.ranges
data to annotate the symbols in the System.map with module names if
their address falls within a range that belongs to one or more built-in
modules.

It then processes the vmlinux.map (and if needed, vmlinux.o.map) to
verify the annotation:

  - For each top-level section:
     - For each object in the section:
        - Determine whether the object is part of a built-in module
          (using modules.builtin and the .*.cmd file used to compile
           the object as suggested in [0])
        - For each symbol in that object, verify that the built-in
          module association (or lack thereof) matches the annotation
          given to the symbol.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
    Changes since v7:
     - Removed extra close(fn)
    
    Changes since v6:
     - Applied Masahiro Yamada's suggestions to the AWK script.
    
    Changes since v5:
     - Added optional 6th argument to specify kernel build directory.
     - Report error and exit if .*.o.cmd files cannot be read.
    
    Changes since v4:
     - New patch in the series
---
 scripts/verify_builtin_ranges.awk | 355 ++++++++++++++++++++++++++++++
 1 file changed, 355 insertions(+)
 create mode 100755 scripts/verify_builtin_ranges.awk

diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_ranges.awk
new file mode 100755
index 000000000000..22717a4ab6c8
--- /dev/null
+++ b/scripts/verify_builtin_ranges.awk
@@ -0,0 +1,355 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+# verify_builtin_ranges.awk: Verify address range data for builtin modules
+# Written by Kris Van Hees <kris.van.hees@oracle.com>
+#
+# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
+#				   modules.builtin vmlinux.map vmlinux.o.map \
+#				   [ <build-dir> ]
+#
+
+# Return the module name(s) (if any) associated with the given object.
+#
+# If we have seen this object before, return information from the cache.
+# Otherwise, retrieve it from the corresponding .cmd file.
+#
+function get_module_info(fn, mod, obj, s) {
+	if (fn in omod)
+		return omod[fn];
+
+	if (match(fn, /\/[^/]+$/) == 0)
+		return "";
+
+	obj = fn;
+	mod = "";
+	fn = kdir "/" substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
+	if (getline s <fn == 1) {
+		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
+			mod = substr(s, RSTART + 16, RLENGTH - 16);
+			gsub(/['"]/, "", mod);
+		}
+	} else {
+		print "ERROR: Failed to read: " fn "\n\n" \
+		      "  Invalid kernel build directory (" kdir ")\n" \
+		      "  or its content does not match " ARGV[1] >"/dev/stderr";
+		close(fn);
+		total = 0;
+		exit(1);
+	}
+	close(fn);
+
+	# A single module (common case) also reflects objects that are not part
+	# of a module.  Some of those objects have names that are also a module
+	# name (e.g. core).  We check the associated module file name, and if
+	# they do not match, the object is not part of a module.
+	if (mod !~ / /) {
+		if (!(mod in mods))
+			mod = "";
+	}
+
+	gsub(/([^/ ]*\/)+/, "", mod);
+	gsub(/-/, "_", mod);
+
+	# At this point, mod is a single (valid) module name, or a list of
+	# module names (that do not need validation).
+	omod[obj] = mod;
+
+	return mod;
+}
+
+# Return a representative integer value for a given hexadecimal address.
+#
+# Since all kernel addresses fall within the same memory region, we can safely
+# strip off the first 6 hex digits before performing the hex-to-dec conversion,
+# thereby avoiding integer overflows.
+#
+function addr2val(val) {
+	sub(/^0x/, "", val);
+	if (length(val) == 16)
+		val = substr(val, 5);
+	return strtonum("0x" val);
+}
+
+# Determine the kernel build directory to use (default is .).
+#
+BEGIN {
+	if (ARGC > 6) {
+		kdir = ARGV[ARGC - 1];
+		ARGV[ARGC - 1] = "";
+	} else
+		kdir = ".";
+}
+
+# (1) Load the built-in module address range data.
+#
+ARGIND == 1 {
+	ranges[FNR] = $0;
+	rcnt++;
+	next;
+}
+
+# (2) Annotate System.map symbols with module names.
+#
+ARGIND == 2 {
+	addr = addr2val($1);
+	name = $3;
+
+	while (addr >= mod_eaddr) {
+		if (sect_symb) {
+			if (sect_symb != name)
+				next;
+
+			sect_base = addr - sect_off;
+			if (dbg)
+				printf "[%s] BASE (%s) %016x - %016x = %016x\n", sect_name, sect_symb, addr, sect_off, sect_base >"/dev/stderr";
+			sect_symb = 0;
+		}
+
+		if (++ridx > rcnt)
+			break;
+
+		$0 = ranges[ridx];
+		sub(/-/, " ");
+		if ($4 != "=") {
+			sub(/-/, " ");
+			mod_saddr = strtonum("0x" $2) + sect_base;
+			mod_eaddr = strtonum("0x" $3) + sect_base;
+			$1 = $2 = $3 = "";
+			sub(/^ +/, "");
+			mod_name = $0;
+
+			if (dbg)
+				printf "[%s] %s from %016x to %016x\n", sect_name, mod_name, mod_saddr, mod_eaddr >"/dev/stderr";
+		} else {
+			sect_name = $1;
+			sect_off = strtonum("0x" $2);
+			sect_symb = $5;
+		}
+	}
+
+	idx = addr"-"name;
+	if (addr >= mod_saddr && addr < mod_eaddr)
+		sym2mod[idx] = mod_name;
+
+	next;
+}
+
+# Once we are done annotating the System.map, we no longer need the ranges data.
+#
+FNR == 1 && ARGIND == 3 {
+	delete ranges;
+}
+
+# (3) Build a lookup map of built-in module names.
+#
+# Lines from modules.builtin will be like:
+#	kernel/crypto/lzo-rle.ko
+# and we record the object name "crypto/lzo-rle".
+#
+ARGIND == 3 {
+	sub(/kernel\//, "");			# strip off "kernel/" prefix
+	sub(/\.ko$/, "");			# strip off .ko suffix
+
+	mods[$1] = 1;
+	next;
+}
+
+# (4) Get a list of symbols (per object).
+#
+# Symbols by object are read from vmlinux.map, with fallback to vmlinux.o.map
+# if vmlinux is found to have inked in vmlinux.o.
+#
+
+# If we were able to get the data we need from vmlinux.map, there is no need to
+# process vmlinux.o.map.
+#
+FNR == 1 && ARGIND == 5 && total > 0 {
+	if (dbg)
+		printf "Note: %s is not needed.\n", FILENAME >"/dev/stderr";
+	exit;
+}
+
+# First determine whether we are dealing with a GNU ld or LLVM lld linker map.
+#
+ARGIND >= 4 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
+	map_is_lld = 1;
+	next;
+}
+
+# (LLD) Convert a section record fronm lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && /[0-9] [^ ]/ {
+	$0 = $5 " 0x"$1 " 0x"$3 " load address 0x"$2;
+}
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && $5 ~ /:\(\./ {
+	gsub(/\)/, "");
+	sub(/:\(/, " ");
+	sub(/ vmlinux\.a\(/, " ");
+	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (LLD) Convert a symbol record from lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && $5 ~ /^[A-Za-z_][A-Za-z0-9_]*$/ {
+	$0 = "  0x" $1 " " $5;
+}
+
+# (LLD) We do not need any other ldd linker map records.
+#
+ARGIND >= 4 && map_is_lld && /^[0-9a-f]{16} / {
+	next;
+}
+
+# Handle section records with long section names (spilling onto a 2nd line).
+#
+ARGIND >= 4 && !map_is_lld && NF == 1 && /^[^ ]/ {
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# Next section - previous one is done.
+#
+ARGIND >= 4 && /^[^ ]/ {
+	sect = 0;
+}
+
+# Get the (top level) section name.
+#
+ARGIND >= 4 && /^[^ ]/ && $2 ~ /^0x/ && $3 ~ /^0x/ {
+	# Empty section or per-CPU section - ignore.
+	if (NF < 3 || $1 ~ /\.percpu/) {
+		sect = 0;
+		next;
+	}
+
+	sect = $1;
+
+	next;
+}
+
+# If we are not currently in a section we care about, ignore records.
+#
+!sect {
+	next;
+}
+
+# Handle object records with long section names (spilling onto a 2nd line).
+#
+ARGIND >= 4 && /^ [^ \*]/ && NF == 1 {
+	# If the section name is long, the remainder of the entry is found on
+	# the next line.
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# If the object is vmlinux.o, we need to consult vmlinux.o.map for per-object
+# symbol information
+#
+ARGIND == 4 && /^ [^ ]/ && NF == 4 {
+	idx = sect":"$1;
+	if (!(idx in sect_addend)) {
+		sect_addend[idx] = addr2val($2);
+		if (dbg)
+			printf "ADDEND %s = %016x\n", idx, sect_addend[idx] >"/dev/stderr";
+	}
+	if ($4 == "vmlinux.o") {
+		need_o_map = 1;
+		next;
+	}
+}
+
+# If data from vmlinux.o.map is needed, we only process section and object
+# records from vmlinux.map to determine which section we need to pay attention
+# to in vmlinux.o.map.  So skip everything else from vmlinux.map.
+#
+ARGIND == 4 && need_o_map {
+	next;
+}
+
+# Get module information for the current object.
+#
+ARGIND >= 4 && /^ [^ ]/ && NF == 4 {
+	msect = $1;
+	mod_name = get_module_info($4);
+	mod_eaddr = addr2val($2) + addr2val($3);
+
+	next;
+}
+
+# Process a symbol record.
+#
+# Evaluate the module information obtained from vmlinux.map (or vmlinux.o.map)
+# as follows:
+#  - For all symbols in a given object:
+#     - If the symbol is annotated with the same module name(s) that the object
+#       belongs to, count it as a match.
+#     - Otherwise:
+#        - If the symbol is known to have duplicates of which at least one is
+#          in a built-in module, disregard it.
+#        - If the symbol us not annotated with any module name(s) AND the
+#          object belongs to built-in modules, count it as missing.
+#        - Otherwise, count it as a mismatch.
+#
+ARGIND >= 4 && /^ / && NF == 2 && $1 ~ /^0x/ {
+	idx = sect":"msect;
+	if (!(idx in sect_addend))
+		next;
+
+	addr = addr2val($1);
+
+	# Handle the rare but annoying case where a 0-size symbol is placed at
+	# the byte *after* the module range.  Based on vmlinux.map it will be
+	# considered part of the current object, but it falls just beyond the
+	# module address range.  Unfortunately, its address could be at the
+	# start of another built-in module, so the only safe thing to do is to
+	# ignore it.
+	if (mod_name && addr == mod_eaddr)
+		next;
+
+	# If we are processing vmlinux.o.map, we need to apply the base address
+	# of the section to the relative address on the record.
+	#
+	if (ARGIND == 5)
+		addr += sect_addend[idx];
+
+	idx = addr"-"$2;
+	mod = "";
+	if (idx in sym2mod) {
+		mod = sym2mod[idx];
+		if (sym2mod[idx] == mod_name) {
+			mod_matches++;
+			matches++;
+		} else if (mod_name == "") {
+			print $2 " in " sym2mod[idx] " (should NOT be)";
+			mismatches++;
+		} else {
+			print $2 " in " sym2mod[idx] " (should be " mod_name ")";
+			mismatches++;
+		}
+	} else if (mod_name != "") {
+		print $2 " should be in " mod_name;
+		missing++;
+	} else
+		matches++;
+
+	total++;
+
+	next;
+}
+
+# Issue the comparison report.
+#
+END {
+	if (total) {
+		printf "Verification of %s:\n", ARGV[1];
+		printf "  Correct matches:  %6d (%d%% of total)\n", matches, 100 * matches / total;
+		printf "    Module matches: %6d (%d%% of matches)\n", mod_matches, 100 * mod_matches / matches;
+		printf "  Mismatches:       %6d (%d%% of total)\n", mismatches, 100 * mismatches / total;
+		printf "  Missing:          %6d (%d%% of total)\n", missing, 100 * missing / total;
+	}
+}
-- 
2.45.2


