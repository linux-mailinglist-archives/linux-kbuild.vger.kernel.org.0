Return-Path: <linux-kbuild+bounces-2978-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC41951D0C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 16:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39F851F2244C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 14:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA971581E5;
	Wed, 14 Aug 2024 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DT2VPbJp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aDNrg0BU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F671B32A9;
	Wed, 14 Aug 2024 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723645634; cv=fail; b=iWE9cr2Zda5+o2e2UuGHd5sbCvVWqUr/fFqsUWjHY6tW+Od6uVU5ApoD+UE9tNNHX5oBfrH0isjdCNyhcDJjkJBMIfYWuw5mZHH5D1Rg4yTWOJ6WtRK1qC32TA1SBUN0zROflBDYRtS62qGhaBYW37r6mx+w7YL0apHKUUBlCC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723645634; c=relaxed/simple;
	bh=48bpWpOS5XGr2XN1ElfeARnkB2G5kGdm0WOYJcIEj/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fSKYlCqRD/xy6uT0aiou2NowBgIPuuv5lT3cVtUS/4JPX+82fsWFEb5lSO/67ExOD1SJW6S94+fq6k5oBs9/PH95GiCvgQXwaGs67mhXY9pvp8mLstokrKPNDU9IU/L7UPrq7Q9lHO1VRocs1TptZZIHZP8ri3cqBJNfINHpxv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DT2VPbJp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aDNrg0BU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EBtbfh003723;
	Wed, 14 Aug 2024 14:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=oFXFXLiJqnhRP8m
	2inEO1iWnyuFKp3ocjXzti8wmdP4=; b=DT2VPbJpxhYjYH4qureMyhE0J8LdXZh
	bb8RBBH+rnRH2veHdfqA6pZzgu4A9g8rswnvLaXPVjaEPyW2suW+JQcGCz9CiGlP
	XhROiAZDIvb+upA73dRUN5UOz9pt++dpNCONPoFguX61LSHkuBBqnlBpeL7iADPj
	TlRVB7pc70BzWSHlLj1txrhhqpJZ699zOmnrMOmhbcPnm5UwlXCRqauBKD7oA+vM
	/bYTRbtcgVul9KZPJpV0ezl2kB5bx/LaWaLevgl/9DwwXSSjzrRT/CEGo6b/3hv2
	4W86Qyfe7UfTBwD9ZNQkMHcHfce63ZUZgQFTqFYMxGzedsWZ2dQohHA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wxmd0bev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 14:27:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47ED8eIA010707;
	Wed, 14 Aug 2024 14:27:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxna09aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 14:27:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/S4oLQGigN7bFMNDzAIymMZk2h0bsyfQpNNZNGcQqF5Twx80qVaOVLcFghfhRzQfQu7HjgARGYiL+U6MxhxV1/1jx5depwEyN20z8Sz7HO8HPVRGiVxPoAnPbOu3R2lU3toEB1FmfjSxRqEyi9wIaV3hFJu3u5cUjHJoh3D9YUjixjMEL0xhyTMQEhJHyHxSaZwKpwI0wZjEaUQs1IcuIqe7ZZUgE7zN9NXwqESYazoFZGKLlispTsulVDz+soW6DbqldlhWJCh5TDg2wX/3n4ZikLWaV2Jg9NN23BNWnQrKipFtwfNvFBmTbon/AJoPoT0M4XPLgPcIBONMIgKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFXFXLiJqnhRP8m2inEO1iWnyuFKp3ocjXzti8wmdP4=;
 b=eFoF0OPHVZyqylZ/e50aoiKSjrk5WGriMFhr9+hWP34ja0P1m9PmL78y2DkpOJ6WQ0d+RoYcUQ4SpsmaT2MtCVZDfzJDubmk9CXpUHavl4Gv9x5GU5rwtrKI/IlLb3ZAWjSy9PYR5djvrhuaO6tjM777MEbBU8or94Mj/zap8DubfvLKxlgPfb+S85N0EaWXQxZx5Ezmv98+BHwNHX/n258EMMCShrEhGCiGC5Lp7yAdEOPw9MfSQDs0xWrxYtgfrOVcFE1xlGu602TpN4qBZm2Xe482hft00E/W4jAzHFnHEcXIvlaA2jBqMwjv0hlP0y0OlRzYGFX4jl9yw8NL1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFXFXLiJqnhRP8m2inEO1iWnyuFKp3ocjXzti8wmdP4=;
 b=aDNrg0BU8jbeIgetAKacDlceNax9aqwjvNbcFaurMwTzDX8Pmh4+PjjsNPMRYAnDhkYH1CigEwcMEvqVTeLB5Fm5ggMFWgFNEz/Y6Bk+UKkVHl5KvXP7o5qLY/3OpKHueA2KWqYfnweYPufSIzyLQkkIcMg6Fd+mQPSgmV7Kb0U=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4717.namprd10.prod.outlook.com (2603:10b6:a03:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Wed, 14 Aug
 2024 14:27:00 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7875.008; Wed, 14 Aug 2024
 14:27:00 +0000
Date: Wed, 14 Aug 2024 10:26:57 -0400
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
Message-ID: <Zry+sYwzCnZ94IwR@oracle.com>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
 <20240614171428.968174-2-kris.van.hees@oracle.com>
 <20240614134651.4ed2091d@rorschach.local.home>
 <ZmyHsnXQoWgp7F2X@oracle.com>
 <20240614142621.5ac455c8@rorschach.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614142621.5ac455c8@rorschach.local.home>
X-ClientProxiedBy: MN2PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:208:120::40) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 2432f4aa-b2d2-4889-91de-08dcbc6d2900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HCgQfenlFmIrOVQ7PVGnFV9H33ppAIKgXfWAEIdoLVu40vrDxe89y3OdCHI9?=
 =?us-ascii?Q?ArhzLikyD/YpJa3Dobf+AXglpO1gZQNj02USl5H/ljNCnUg286c5gvvacgnm?=
 =?us-ascii?Q?doJ1RiLo1QEmt0U6dodqM11ZlGOjkPCTMy7XDQiuiWRpO7ZC8Chubu4wV3GX?=
 =?us-ascii?Q?VDcQK64SIdNzF77OwSTkCZX/q+LAV0Gd+u7LZohZy2kg09apQkwcRCm+HtlE?=
 =?us-ascii?Q?wr+KQiHNfqPyLp2EqCHalj4XGaMpsMFU4uKhEK5LXEGi8nVY9SN43jfhLqU3?=
 =?us-ascii?Q?OZ3sNHrn1ftHGWq+P3qQsTt9rpn8lcJiWQl1x0QhaodvyJKjq2INfG9+VUh5?=
 =?us-ascii?Q?yoQbTKBXQvpB5/3w1RnawJKrQjxJp98FYtAO2D84RgpzuU0mVL8I5N6sBid6?=
 =?us-ascii?Q?xl5UPZ6dxijExUnBCLmxU1WG5Da4UKt7Yo3UKpI5qkF7uPVqWH3GTdJIcbiy?=
 =?us-ascii?Q?tx7pQWgFlPzeAqkbrzkimzfbHw+T58rs04BviSG6Bwtm8oQUp/EKim0AIORN?=
 =?us-ascii?Q?SeoTAhJgZx2w0ofO5n69gM9XgObFpID9l80REBSPqBNYo/r+SwQ9KbZJH7cs?=
 =?us-ascii?Q?7myVOifo6PMy2KEP5PaUCoIWX1Ytla3SY/GfSF37SbXl2iQ/2VHovEXs0u7K?=
 =?us-ascii?Q?EJpENnTK3Q+HhemN8m1q57DHZ1Qb9o/ux/Zx/fbazvzbf15KGfDy9g7kVQQj?=
 =?us-ascii?Q?BCcEP7L84eHVUT1iADITDrW/LYfuxXBh4RVEtGFIpK006nvpKsgf6sM5x21r?=
 =?us-ascii?Q?Q8HtiahysXnkl7wCs0hroWMXM6YFAoRa6+dEyFg3RjTyfSqLRaDpO7i30QT5?=
 =?us-ascii?Q?/BpSF0mjR9C/td7OhTa/OaIeOsd8SqZqBbjWOdo+BaQ4k8xwHkge62XJJXLh?=
 =?us-ascii?Q?R/r5Kq34XfUSdR3obIMPoK2xgUClEeVnjjNWvaggqxKc9rPk9BDKvPW2l3y0?=
 =?us-ascii?Q?ues6hVegs/H5UkfPiz+A3z+3WijXIB97Ssy2ypejovUiAJGMEdCOXHoBuVAX?=
 =?us-ascii?Q?e++tz2HLZ5sjsmCah7M4Q8mVsRxU4shwHOF7aQBAMfxP7DY21YBwI+xptz42?=
 =?us-ascii?Q?aM/GXUluRm6kC+KXL25e5zSCb98cIP3iviETDzuddxlDaZbRqtqx/d5lzkXv?=
 =?us-ascii?Q?KH42j/JCr8oKidj4g8hka7P+Hhesh8LSgOLFcTIkPd+dr5iO22OE7rnP9QIL?=
 =?us-ascii?Q?ig60qmlvtyBceDNxQZUNe6O1fEmXfweFywBZCAIXFJj6pD2gIKIMfx/F8sjd?=
 =?us-ascii?Q?yHjTmitJPO/mTnn778DY9le/VB1wfD+ajEykBeRdUlwBBYnVB3q+Ou6ep+hc?=
 =?us-ascii?Q?7aPrkEGAk0hmSCx4BuWyHExeT/2854FWNuq8zP9U/+BVPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bNh/WidEzATrkqlFB0wTK5h5UGh87FBjbKZHzb99CaqSzlzZJZefB9KVMx0N?=
 =?us-ascii?Q?Kpx2jhKFNMA6OTIjFKDU7egqn+LlW0rX7G7xL5EVRzI9eqvuU0FqglkAYQ2N?=
 =?us-ascii?Q?/qWV8VrFStbEsUETAjf3b8Wu+DSJ7b2qnRgkg7ZFmUVSilhw2TBUt9z53xj3?=
 =?us-ascii?Q?ocVp4v0CEvGc89TWy/Pnb9hVSP1ogwmgsqVgeexz31PCTDRnK9bJhxPZcuI1?=
 =?us-ascii?Q?ReH46B51xFDTU1GxudPAEP4vziaj8zi0p8mHnT5+Xl3V/nQS9oE+szfgxCaR?=
 =?us-ascii?Q?UdPAT5BKhpJutQajpo69mc1aiBLwBmUI/NPyz17JkmABZanDEDWUTXeOC3lS?=
 =?us-ascii?Q?XvmtOnaS1YIuQr2lFqx0CKv1e2/9IcNZm5rIzfFpQUj18wresr3g64tlB+xe?=
 =?us-ascii?Q?zcYfW2XtJAMPXUkUxlbFKVCI01u50mhLE6msRzH8py9JkQA92M6dbgbV3zMc?=
 =?us-ascii?Q?JZQey7LCp14feA6RGZbPStwjw0qlHOZHVqX2Nc5b6TsBIh9p3zpxayPVRVZv?=
 =?us-ascii?Q?2JEZrbKHDuoSQqE4oCltxnYzpOU1gG+Pc+xu2rYPYYxaPbaB0VISSTCLRJcb?=
 =?us-ascii?Q?GprJNK3+SI/1CNZNIhqRjyncYnAEosaN2BhOqxv9Ckt2ROb0eviq5s5urUsy?=
 =?us-ascii?Q?+SAU8NUeVn0hMD9ltDdr0S2YJgH9vOZ+kQOhiMnWvb33oFQhR6HAu4nEnB7W?=
 =?us-ascii?Q?McHzvsTw0RzBKCCyqAQ6Cph90x4/bL5CqGaEpR2UGEEdSfltE58o6P3S2zdU?=
 =?us-ascii?Q?5poGr3eI3nZcKTrp/vWW5QKA9xaoGQ0SySWG8k08qtsG3QFzCInQ8Nxb2aiQ?=
 =?us-ascii?Q?HJZTyNVAf3lQxT+1I1fMTAazrXAjAjYE9V7L6Za6hv+19fb8YujNC3HELRa6?=
 =?us-ascii?Q?Cmm7d7z96jCM3Ltrfdd5HmVazGcO1frgda81bCzjMILRIyi/aJCODdLkngyW?=
 =?us-ascii?Q?DQ02UE2u/kenlmOrB9x44Aoiy0bKiidDBg6BJSzotnUUbcXunxQku5gGNF0+?=
 =?us-ascii?Q?kLMGk2bKB/WIA5ygGyu+g/9RQEVln/Hjict5KvlLzmL5m/mlluke/RQmyU5t?=
 =?us-ascii?Q?Ry19TuSeY32c+oRf0/6ZtxwWRTZPcqmakiIPmnySmJVM3ykDAYtNhFCoaYl+?=
 =?us-ascii?Q?ZmVdfkH+zzeKn0M9QTjq6tFfTKm7o53s77/ESEhlL/QcLno77ZSHBPMdtX/g?=
 =?us-ascii?Q?Wh6VYeFcKy8nS3ji4xdoxb3hw+gl/kGESFQTuBofXzSAwogANaWctEkDqkkq?=
 =?us-ascii?Q?3eugzHU620osAd+wtbgAPqsNsBf+1qNGf21+1NkhNO4Se+69IweM9I7ZuWwO?=
 =?us-ascii?Q?4wlKG0iz7EfeMJ8iF0djFa9p5/kfGtNpf69sgPQOWp1sC7i+9+gqoVHNYmvz?=
 =?us-ascii?Q?rY/6Yc27WAbixhW2gDWOCWC+hkZVK9C3b9y6SalORrqZFAFPWz/zqCGdt4yf?=
 =?us-ascii?Q?YynbegEnft5927Y5hVv96rw60H6DZI3QNbwgIKt+K10xg9kLeoy6oAFhbx5r?=
 =?us-ascii?Q?3zVyddSkZGJ1GsdaPRWSCYaxALSuWkFOm7fCzycOcTOSAD6uh3tK9trOk05u?=
 =?us-ascii?Q?fJdofh1CqY8TyY3UyCFn94jlGMfXKywYcCvZLEANjgeUEammHVL5DDvAlaip?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4wLwRo/G7llDvlLO3hiw1NfWvHLkU0zGrNP4X038CCNS/51FnxB6yCckRfIbDpZPbZBAh2YqB8550JEFUKNseLmUibh4mwH+4TB6eJK3xJbFt31g0f7HXsJm7ckOq6i/Qhxm0R5x45k5gJGbImClEnYv4WPaR9XpqjH3Ip/LCi/H1bOYagepPYs6/OA/So1011UUr/TTDea7D7DGVEOYpME2COE88LACj4yyuer4jOfAEfjca2j5o3I22mOHn28cdBtEGimJmpjdSGZ1A57ITQEbyUpMDb7XPe5CflHmUhW7tUARYj5Zozip9WcsVeu0u2uM6vkumZPva7bjnQ4CrworZAKQDTG2m9U2e/ADGCOd2zB9ODFdNVW9MWyEXPEXKRWwfrIix7Bi3/L5dZy3z6hzFHuDbDTyHSk5IfbkuJLlUaFmn/o4sasxt6VrBSNwYZPLnsxfaWLbxFur3pWDAGGANHsWQ4edR7ExCRa6tczT3QgdEVf95tdMkSg7aiTx5QuToj5hleKEJkQtYvy+yzTqlUL1smT+0z7t+T99JIVqGiewAlxOsYX4d4olqtResz7Y1kp8gkosGH9S1oJvilRKFD8xPSnOp3Jg4oMtePo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2432f4aa-b2d2-4889-91de-08dcbc6d2900
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 14:27:00.6488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6I7UEx+TTnt76bdPYwFn9FHKPtkXc4v0uWKHepkh5mgvx9fAAObeND2oT5LX3hofmcUt1FnxmZsMyf+L0xzGEphXpSD3b9NXKhwE7e2mc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4717
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_10,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408140101
X-Proofpoint-ORIG-GUID: j8VM2j783eVnnUAEXI_xgn3RX64UTNTJ
X-Proofpoint-GUID: j8VM2j783eVnnUAEXI_xgn3RX64UTNTJ

On Fri, Jun 14, 2024 at 02:26:21PM -0400, Steven Rostedt wrote:
> On Fri, 14 Jun 2024 14:10:58 -0400
> Kris Van Hees <kris.van.hees@oracle.com> wrote:
> 
> > On Fri, Jun 14, 2024 at 01:46:51PM -0400, Steven Rostedt wrote:
> > > On Fri, 14 Jun 2024 13:14:26 -0400
> > > Kris Van Hees <kris.van.hees@oracle.com> wrote:
> > >   
> > > > Module objects compiled from C source can be identified by the presence
> > > > of -DKBUILD_MODFILE and -DKBUILD_MODNAME on their compile command lines.
> > > > However, module objects from assembler source do not have this defines.
> > > > 
> > > > Add $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
> > > > add $(modname_flags) to a_flags (similar to c_flags).  
> > > 
> > > You explain what this does but not why it does it.  
> > 
> > The first paragraph is meant to estabish the "why" (being able to identify
> > what objects are module objects, even if they are compiled from assembler
> > source).
> 
> Perhaps there's a lack of context. Sure, the cover letter can help in
> this regard, but I always look at each commit as a stand alone.
> 
> > 
> > As I mention, for objects compiled from C source code, those defines being
> > present identifies those objects as belonging to a module.  For objects
> > compiled from assembler source code, those defines are not present.  Passing
> > them on the compile command line for assembler source code files for objects
> > that are part of one or more modules allows us to identify all objects that
> > are part of modules with a single consistent mechanism.
> 
> Sure, but why do we care? Again, if this was the only patch you sent,
> it should explain why it is being done.
> 
> Perhaps something like: "In order to be able to identify what code is
> from a module, even if it is built in, ..."
> 
> But what you are saying is just "C code has these flags, make
> assembly have them too". Which is meaningless.
> 
> The other patches could use some more explanation too.

Hi Steve,

Thank you for your feedback.  I hope that my new patch series [0] addresses
your questions.

Kris

