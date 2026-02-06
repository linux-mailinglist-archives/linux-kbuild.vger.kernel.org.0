Return-Path: <linux-kbuild+bounces-11044-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFjtC4xDhWmA+wMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11044-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 02:27:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97841F8F5B
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 02:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66EF930160C3
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 01:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970681D5CDE;
	Fri,  6 Feb 2026 01:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="mahTWocL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E7913DDAE;
	Fri,  6 Feb 2026 01:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770341257; cv=fail; b=LRqrt/9ngPNS+XLIhNJHjPkERLYPMOedx/DWMCjq4FYDtoBJj0WuaGYVwS1gmFsp3QUwXDd9wl5Ag7A2yU1vlL4TSaZSspfHC5PEhdljxCoXgSzVP/1w/bTggDRy2nFG0EAPReOcScsxNuBNuRmNreS3u2KV3XRyVcqddV0n+rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770341257; c=relaxed/simple;
	bh=SWJe00jiPCOT2cvEA/xpa1x65aWc2W+XJLT28gzTv0E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HEjrkuJA98O838Gx6pLXbF0jJZAOQOk2w08TRGSaPzY5LOzsJ5sXbaolx3TtN6ODzi8JUU9XGY+p07/o+Z5jothBNoE+031PhDqRb0EV0JRhNS/yiSuq+2q2xh6TgRb0XY7YDx2OvvXjOKsVRauAkr8NugrG5aXR9CEXqY90qHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=mahTWocL; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 615Lenme005302;
	Fri, 6 Feb 2026 00:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S1; bh=SWJe00jiPCOT2cvEA/xpa1x65aWc2
	W+XJLT28gzTv0E=; b=mahTWocLrjhQH1brIKPiXdGFYrSrhQpOL1VYk9M3KmC6g
	fqkuLMvb8Luyt7TqdCpg1k/l3MkA/DEKp1UbLrz6juguZQIuOEY5b8XPEn+EnL0d
	0tZlTtFuJ/Jo1O8YaehEzD6NTJALoKk+14+J8rOfJ/huxm8rEPRJ5tjDGT9Be3tb
	3ni2IxDAZLFdwrJWAxyxlROTxAUcPS7SD7NeV0oKGNlorQq+hbGEdM50BWpTSBPc
	norUcGBR9f4x6c74Fmw5uv2xnz9rWzBB/Ejk46S1XNb8cNhPy+oN9+8DMD+DUUK3
	VvalbcwLUVJpJyNSjYNASwMc6D1wO05o1zoCaC/fg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4c1awj7aug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Feb 2026 00:54:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qohFZieXbabp9OugpB4nO9xJmJBdc/vX79KXP1Kxpcy/BqsobjCCbhipAOUdgSnJDEjumnTnzfg3RtLYltgcLy5I6FhCp5b6lLYBuzaHqKD5V6u0kVBitccrvAJ55zKotE1FAy6oc/cpbpqzBzqIm2zmy6WJz6s4Qu6GUmNPhaca74FySOOcYOuArOof4iD1mVpYeYYkBDqYtNGCvEqYuFxjrnBvz9tSK1BnLHG2sGen0QUBmCdj+dbb2AiksPSSbFDSH5SzeEYnpF0H0erF96LVdrBlrP/pHSQm7IPH/LsYnLsf3wMIt42L9l2Hs0mBgPeE7HDcsEwk8rtRJ1oI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWJe00jiPCOT2cvEA/xpa1x65aWc2W+XJLT28gzTv0E=;
 b=hJaZZWkhpPoWW13JWCkE/DaG7FwQHaKyJWwCJmib5wgSGQmtoC0MTBoaj6EThcTadUJ0qqJ8is2QA45+tiNCUdFMeoJiFGVXHHZd94tq4eysuJdUV1DUFVY9UTKWXkY3kxr6FQOSB6glm7wAFXiJWfrVmfhySE1yIafzghS97ymLtfM0j3IoNvsmq/+CIX+pD7XkM66dcexpQHk52z8lcOlMaLzHYreCtwzo56TSi5mO5cYacKk/ne5vWHrlZOrwi1twcywjf2cu1I7KFnpX8UbXYAHKBnxynCB1Zyq27bGkzD5D0GCdrKAtqTsodcZJqcqVXaQT1sD+RqUn43gGiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SJ0PR13MB5983.namprd13.prod.outlook.com (2603:10b6:a03:43f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 00:54:16 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 00:54:16 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: LINUX SPDX ML <linux-spdx@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>
CC: "luis.augenstein@tngtech.com" <luis.augenstein@tngtech.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        LKML
	<linux-kernel@vger.kernel.org>,
        "Alin.Jerpelea@sony.com"
	<Alin.Jerpelea@sony.com>,
        "Takuya.Namae@sony.com" <Takuya.Namae@sony.com>
Subject: Report on source files missing SPDX license ID lines, based on kernel
 sbom work
Thread-Topic: Report on source files missing SPDX license ID lines, based on
 kernel sbom work
Thread-Index: AdyW/t1w8TxvGBI7TF+RZkYcywZ0Fg==
Date: Fri, 6 Feb 2026 00:54:16 +0000
Message-ID:
 <MW5PR13MB56326322F7DC30A5A78C3D6AFD66A@MW5PR13MB5632.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SJ0PR13MB5983:EE_
x-ms-office365-filtering-correlation-id: 338214eb-00f3-459b-dbdf-08de651a40c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWd0a29Qa2J5UUk5ZEhDcll1NDFnQnd5U1BNSGw4RmxhTFpXYlMzdituUita?=
 =?utf-8?B?YWZIME1uL2xrbzZuT2NqZ1RicGxqcUd1eS9zWCs5ZUU2RFhZc0FGWEZXRWhG?=
 =?utf-8?B?a21tckFTaXFTcWJHaGRIeVNYUUs2UXlJZWNjUGpQZHNkMTc5K0t2eTd4Y25x?=
 =?utf-8?B?c3FXSTRmbU5HelBDZ2NqalVqVEhUOEFnVjVlWlBoam5LSGtJdzBUQU9lMzMy?=
 =?utf-8?B?SmVLalFPZ3pCMGROSWo1ZjcwOXpsSkNyTC9YaFhUb2ZxWlN5Q3dkWTUvZ2ho?=
 =?utf-8?B?ODhsNWkzam5Ud2VkZDZnd3dkc1k3TVcxYTc0R0VyUWUxcm9DZVoxS1RmVTVL?=
 =?utf-8?B?d3Z3QkJpc0JNYUNSZWt1aFZhekN1NWM1VzBZejI4ZGRVaC85bTR1dFFCcHRh?=
 =?utf-8?B?RkQ1Kzd1WWdndmZwaWNUd2xxMDhhMExzbkp5UTVrZTc2MWlQRW9CdUR1UUVj?=
 =?utf-8?B?Y0lWVHFQZmlGd1lFMG5xWnVLVUtwc2NnZmJubEdLd2wzYWhrZkxQNVZqMUQy?=
 =?utf-8?B?cTdMeWp4S0U5T2RzWHRXVnhYWnBBR0V5NGlmRk5FZ2JjWk5qUlRIUlZMUVdC?=
 =?utf-8?B?d3ZYejFxbllYa0N6d3E5Y3RvSWl3YTlQbGJZd0tKVWNBL1NkVnNqQ1lrMUNt?=
 =?utf-8?B?WlNESFNmRzNtRmUwQjFOY004S3U5SGZJdGtLMldyNEMyTVNhQjcxUU9nbXM2?=
 =?utf-8?B?RTdXTkxxNlFWS2NVWGxNR2RPU0s3VERBR0l2M3Q1YWpxOUFJTzZNQms2bENX?=
 =?utf-8?B?YTZ5UmhjWHNiMHZCQ0dDcXJmSC9ESGRkcm82NlVRSkNFczJSdTNKWnVSQUNO?=
 =?utf-8?B?Z1M4NVNlNGZaRXRnTERxTVdyNGllZ0I2VmhiYlg0Z0JUcEYxZWtQTnZOREdX?=
 =?utf-8?B?NmkxN2hNK1l4cnV3eGNJbDdjUXJmU0c4VTZDQk9nUHpidnZxblNHWWhLWk5Q?=
 =?utf-8?B?TzMyZ0w5YUJVNERFeXJNcmQxN1ppWXoyOGtyK1V4SXNSc1pNdGhsUjBkWVQr?=
 =?utf-8?B?cmxDQXorMXNaanlxZlZEWW5zQXF5RWw3Y0xyQ2pGTlVHblA5N2YweUtGYzlF?=
 =?utf-8?B?UlozaEtRNys2ak1FMEhzZ2VnUlY2WS9IQ2JsMVNSRWFpWC9YRVJrTmprOGtj?=
 =?utf-8?B?bTVROHdVc1FUN3BGKzU5M3lmNjltOGlTK3FZaXJueU9CWWlpYXhBWHh4YkRO?=
 =?utf-8?B?dVVQblNmL3U0bklIOEZEKzZKVGpOdEZ1YWRNRGdETGdKblp5Wis5OVhuT1RF?=
 =?utf-8?B?ZFB2bWhidE5MY3ZjbldxOGRUY2ZSWVFNV1hmUFJCQjVuU1dOM3JPNnJ6cHVo?=
 =?utf-8?B?Y0ZUWHd2RXRvajlGMUVzSVE4Ti80Y3QvZ2hQUXlqMGd3ZldtWkx5UE1oTEhQ?=
 =?utf-8?B?S0I4b2pMdndCK090c01MTUdnamU0dHJ1Y1hKTG1oUS9qY09sbkNUYlhQSHVv?=
 =?utf-8?B?djduOWw5dEE5R0prUVRJckt1ektqWnR1bzEvL0FGanNXWDc3NDFjcG9yQitD?=
 =?utf-8?B?SU9TRVF4Y3lDTEhnM21sbStHVVF0aTg4YmZqMHZuMFhRRDQ4UG9PTTBIY1Vr?=
 =?utf-8?B?bUpoMVFOUk1neWNSY2VKY2h1dlh6YW1WZ2ZRTjFCQU9xNUpoazRWcnhVS1VC?=
 =?utf-8?B?M1VzTmtrUFZnRUpaMzRzanNnRVRaQlZpOFUyZFdjeUtleEFSWkhzNVo0N09R?=
 =?utf-8?B?ZG9CQXlNdUFoTFZvUXNOQVVyYzVZWTNSU0RnU1lHOTUyYXhUaU1DMEpVWFVp?=
 =?utf-8?B?US83WFJ2MWw0anllRHZVTW1HWkZUNHY3UFRvS2UxaUtQdjBqT0JDQXc4UU5s?=
 =?utf-8?B?ZGxxZHoxc2Y1Z21YaHNxaHNJcnJxVmxaYWZSZzlQeXZDaTZmRkl1NzZpbElQ?=
 =?utf-8?B?ejlKaTg2WUN3eDFoNGFEWEcyNlN2c28zUHlWRTNmcU1WWndrTm8xWGlYdGVP?=
 =?utf-8?B?emYxTHQyNGpyMUhqTW5WK3grckpBWEtucDl2VEpDVnVuR240Vzl6N25sK0Z0?=
 =?utf-8?B?Z1I2cDZWb3poTTQ1WGl5cW5NVlY3NWxLellMc2tLTGNRSDF5c0E2aFhnYnJN?=
 =?utf-8?B?SkgzWDNzdnc0ZjFkL1pnK1RNYnpkRkJYTUxXeXNBTG16aFJkUUdqVTdvbGMr?=
 =?utf-8?Q?oso8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEZzU2crM1NpNWliR0tPR2pwSVRyc1k2T2tuK052TjF2OUVXeGtyZ2VNV01R?=
 =?utf-8?B?S0NsQitzNGJzS3RSV0YvRnEzVG1ZT1dIN2pyOGVQNm1vMGxjUlZOcjllYzdr?=
 =?utf-8?B?VjdmQ1R0UXBwRmdVWkhRdEo0a2tJS2VRVTBSbXlPQzBFclBBRUtFYzFqYXdN?=
 =?utf-8?B?a3dlR0FNVWk4UkpoVUMyMU56bkhXZ0RUZWFpZmtLS080Rjd1VE5WRm9xSlp2?=
 =?utf-8?B?VHNPRXgvMzdnMVVpN25ZcExIbjRmL1JNa2Y0NWo4KytMdUFpbjBic2dnRE5B?=
 =?utf-8?B?V0VGQjVzL3ZnYkprZ1BwNFI3N25aOFY5bDRNaXNHYWFIU1BDR1pSL2JDcWhq?=
 =?utf-8?B?QmlqVXJjUHVYSG5vZVlxbWl4eUtHaHA3L1ZoOTYzQWlVMnVxbkJLU3JLNWM4?=
 =?utf-8?B?ZW9yenp0V0poRE1CeDAvKzRiMzFCRkVZYXVBczFNZWxoQnRKM2FaQ3NDU1Zp?=
 =?utf-8?B?M1krZ1JyenVMbUdLQUkyU0dTb2R6L1FNYnJzOU56bzhVZTgvLzR2aklZZWor?=
 =?utf-8?B?czdQdHlUR2hqR3pPT0hkMTZ0citTVlRnb09PbGFjb0w2STlmVXZJSWR1TGJr?=
 =?utf-8?B?MDc0YUl1VFhQUHNEL2FPZ05YN2NWdVhzTmd4azBjVElZVk8wUUZvQTFNMFYx?=
 =?utf-8?B?Ujh3dGdmYXl0NVJUOEhGRndZT3Awa29xdU5ZQmdnL3g3UXNsbGtrN1BSYjZU?=
 =?utf-8?B?Sm5jeWJRQnpsMzVzRGp6TG9aZmNIa05VUlQyNit0dlZqeWdneTd4RER4Vnha?=
 =?utf-8?B?bmVlaE1NMmlqdGdVYk03cWZ0Y2JiQXFXQit0UVhEMkJYTEovRHo0NmZIbmJZ?=
 =?utf-8?B?YU1Ia25kWGxEd3lhbC9vM2wyS0lUYWhpN3ZWK1FyTGtsN1JLdXJmdkQ4dWJ0?=
 =?utf-8?B?WUl3UUI3bWxuTkExd2xlT2NWQ2xwL0h3eWFWSkxScWtTMDlXTEpqblhETEFG?=
 =?utf-8?B?YkVtbkF5SFZFUnlQSGVOQXhZaGROak9vR2FTMk83blZOQjRVYXVneVNSMUlY?=
 =?utf-8?B?NnlGWmkwU0NPdXQ5OUljT1BURG82Y3NpNDk3dXExVzFRdGg4OERhU05QdEJq?=
 =?utf-8?B?ZE92ODV5S2hSdVRxNG5XNzh5dnljUEl2SXRFUWhETVh2V0lCTGxUeWZvYU9n?=
 =?utf-8?B?bGNubHprRjhQVGhXNGMxeEM2cFNPd1hVYkJub2VXNnZqdVU1MzJBY0pYSjhF?=
 =?utf-8?B?VFFXelYxdGdUaHZ3cVRrVWVTclAwa0VFak1zemtiSUhTT0E4eUpRclhkemtR?=
 =?utf-8?B?bjVEdWxEcXBGWG04eWUyZUJHSXJuWllRdmRHWVg4T3ZIOGlabTJQanRyV0hu?=
 =?utf-8?B?ajdjaXFNZkdKbjk5T3NMM24xMnVGM05pc3NLMENORDRJMGhPclZrM21YTEh5?=
 =?utf-8?B?N3NJRCtHQXBjcHJiby9oQXpqeXB1WTUvbkl6M1A2MTVYRWJMT0Q5QzUzWEI1?=
 =?utf-8?B?SHVsc1A3ZWY5MDRRWUZBVHZ4cE9LNndUbGRvNlhqMjJNaUo1c1FyQ21aZllF?=
 =?utf-8?B?WVBGZTNxTlZCbkhQOEpsOTFoaXFsa1p6UTk2eWNBTFVWRUdpZTh2cHVFbVUv?=
 =?utf-8?B?U1lCMWtqQ3plWklDcGFsMnlaYUhyWlhveUp0ZVU1NGd1L3VLVmNITFVHK21C?=
 =?utf-8?B?WXJ3YXIxWGlNaXAzMk5Wb2liUWNsWWtrMmZZck03ekc4Q2M1My95RzBXb21Y?=
 =?utf-8?B?YlpMYjNXOUdmR1ZUUS9uOFpCNDhJMUdzZ2xLL1JETVlwd09MMVk1VDN1M0Y5?=
 =?utf-8?B?REw1SjluNlc5U3VvZWJudldRV2kwamRkZkQ5aE9rY1BWMUZTNVk2bHJMdUZD?=
 =?utf-8?B?THhKN1p4RUxkL0Y1ZzMrN3ZJU1piRFd2VUhDaUoxL05BSHU0UWQ3cTE3M21k?=
 =?utf-8?B?ZnFpN0FMang0N3BxTlRqd2V0MW82SE1QdjYyWmNNeThsUkV1cWtmN0FBWDlJ?=
 =?utf-8?B?VHk4dDk2NS90SXBrSkd6NDRuMFlxdmdjUWFuMTBuYnVCcXY1WWNmc3pXcmZP?=
 =?utf-8?B?cmJMbDZTYlFoOHZCOWlzTGhXdGRBZjVrVWtEVW9lck9ONHVJcHJyZWR1M0xE?=
 =?utf-8?B?TE9jOXNBYXgyc1Q3OWUyWUExT21DR3FJbkh0ajNVS296SlF6Y1JxZDAxYTJo?=
 =?utf-8?B?blF6QnZPcERHTTgxL0J1RHlha3k0S2dFaFJjbHhmM0tmU01Lb0JCelM3dGVG?=
 =?utf-8?B?K0FLR2JIRVJUYXRxTTUwOVRqaVlaZmhXVjd2cEwrbmJQdmdsL01KMjJNOFlG?=
 =?utf-8?B?cDF0Mk8zakphaGpYU1N4TGJpYjNNNlA2WTZqWENnUXh1aU5HelhNU0ZjUGVP?=
 =?utf-8?Q?qP1HyQ9++KMHOfsHqu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aR8SeGxIhI12cgBJZbwev13saSAycWAEu9iss/B2GDw8QudMkqvcfEr0pueIv7BYrkg5NW38ZojWr1WGCsDkobtv4mhdvwKzQTG3FLOEzONgbKtxzgkwEFDZF1APQzM88UbEIb6dSZYcKQbF8U4MpHf1yZQaUP1qTb43wozlJsRLtlGD3TMOe2YNGEtX6QF3QKjNobM1dutKRP8DGOHR1P0wTERFogUTTn1eR35rzg6qEfhgVMG0uXFUp+zJRaoGbAeYdlbHbr9PFMAhkMmvq4bGNlfTxvHYzONWud9as6ku9KVd8FIjzjP/PI6PTLWi0HSIPk/cEhQagC1h9CSLBbPOuhPCVzAlbwVPAkHq8xLfRx/yuVETsBNN3kfby5zH2Lz62QCj+1bteJXWoUhJxHsTgtFPdp90aDFVE7mNgY8M1Iv8rgxy5ZT7EMg9GBY94/iFBDIbndV99djHwLfgRn0NJ31Z6o2OzUcgYAJ949Zgsau2kzPv/QSWODz4xJC9QVMnncRtTzqziUM+Xfr2ZCdlQhL55cCKfbVicG6skIv0/Gcncu/ZFdoVkcuNm8G1xgHwFVdb/dBNPLHPj5RNygVAHiYZeBEk6uECOM8cV+OntyRnVL+o4XtwwfclCp28
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338214eb-00f3-459b-dbdf-08de651a40c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 00:54:16.3489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5J/AsHcXkNvE0TVg4bgVw1HznuQXkG2LUEiOx8PzTfclErvs/lgebGJJcrAiHIzZL/dIhto/zS4fkziFU3fHQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR13MB5983
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwNiBTYWx0ZWRfX65ebiao7xVvH 8XiifF/amvosaFLEBAPwfJk15goRhFApyXb/RJZK8PsFvdKV9st3vQJKfLlfTyK+s9k4WmiR2ZO EhTcNKizQNIe19cAIuNZJifRzqyLSBURw2A8+SPK6uxT1027C+RJTY030bpOXvPqQUZ+H7bdRSm
 xyFOxLyLTeOaUNMi00tr10fzTUzOZilxcPq7s7QUCswzPm/jftVbS4TvZRO//EZHdDFiIFiAu0X 9VyYmhJ7N8LCQVIJG+b1glEE9EsvuZw9CsR6e9M5u6WdSsiKIyYJBc+uTXGyFxQ8io1EK8qvgT7 T1CZzhY+34lL6r2Y4I6QX579dXlUuRgzMcfogfPNnxPOmI2E/DXhpG7Pm8093xFqeMNixc2M9aq
 +mS9eGt8+oKOX2QXnfqBj+F/55MMT0Sy3TT0sT0C3Y+1jHdo5o0YpsJgrvOYaPiwmW4rjMsbczJ Kph4yVHZHv9ktFA+z2g==
X-Authority-Analysis: v=2.4 cv=LPBrgZW9 c=1 sm=1 tr=0 ts=69853bbd cx=c_pps a=73h/HchST80NzqUzJRdbyQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=JAcjjVAEAAAA:8 a=-kplNy9VKkxD5bU1WNoA:9 a=QEXdDO2ut3YA:10 a=Acyig5GiBk5jV-JuFR3u:22
X-Proofpoint-GUID: Mr1zVjbhHGQtEmG_uVFHymv_TjpdlpFq
X-Proofpoint-ORIG-GUID: Mr1zVjbhHGQtEmG_uVFHymv_TjpdlpFq
X-Sony-Outbound-GUID: Mr1zVjbhHGQtEmG_uVFHymv_TjpdlpFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[sony.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sony.com:s=S1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11044-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sony.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Tim.Bird@sony.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sony.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97841F8F5B
X-Rspamd-Action: no action

SGV5IGtidWlsZCBhbmQgc3BkeCBwZW9wbGUsDQoNCkkgcmVjZW50bHkgdHJpZWQgb3V0IHRoZSBT
UERYIFNCT00gZ2VuZXJhdGlvbiB0b29sIHBvc3RlZCBieSBMdWlzIEF1Z2Vuc3RlaW4NCmEgZmV3
IHdlZWtzIGFnby4gIEkgd2FzIGFibGUgdG8gc3VjY2Vzc2Z1bGx5IHByb2R1Y2Ugc29tZSBzYm9t
IG91dHB1dCBmcm9tDQphIGRlZmNvbmZpZyB4ODYga2VybmVsIGJ1aWxkLiAgSSB0aGVuIG1hZGUg
YSBsaXN0IG9mIHRoZSBmaWxlcyBpbmNsdWRlZCBpbiBzdWNoDQphIGJ1aWxkIHRoYXQgYXJlIG1p
c3NpbmcgU0RQWC1MaWNlbnNlLUlkZW50aWZpZXIgbGluZXMuICBJdCdzIG5vdCBhcyBtYW55IGFz
IHlvdSBtaWdodA0KdGhpbmsuICBPdXQgb2YgNjk2OCBzb3VyY2UgZmlsZXMgdXNlZCBmb3IgdGhl
IGJ1aWxkIChhcyByZXBvcnRlZCBpbiB0aGUgc291cmNlIHNib20gZmlsZSksDQpvbmx5IDU2NiB3
ZXJlIG1pc3NpbmcgU1BEWCBpZCBsaW5lcy4NCg0KVGhpcyBpcyBhIHRyYWN0YWJsZSBudW1iZXIg
b2YgZmlsZXMgdG8gZml4LCBhbmQgd2lsbCBiZSB0aGUgZm9jdXMgb2YgbXkgU1BEWCB3b3JrDQpp
biB0aGUgbmV4dCBmZXcgd2Vla3MuDQoNCkhlcmUgaXMgYSBicmVha2Rvd24gb2YgdGhlIHRvcC1s
ZXZlbCBkaXJlY3RvcmllcyBpbiBhIGtlcm5lbCBzb3VyY2UgdHJlZSB1bmRlciB3aGljaA0KdGhl
c2UgZmlsZXMgKG1pc3NpbmcgU1BEWCBpZCBsaW5lcykgYXJlIGZvdW5kOg0KICAgIDUxIGFyY2gN
CiAgICAgIDQgY3J5cHRvDQogICAgMTg1IGRyaXZlcnMNCiAgICAgMTggZnMNCiAgICAyMjIgaW5j
bHVkZQ0KICAgICAgOSBpb191cmluZw0KICAgICAgMSBpcGMNCiAgICAgIDIga2VybmVsDQogICAg
IDQyIGxpYg0KICAgICAgNiBtbQ0KICAgICAyNCBuZXQNCiAgICAgIDIgc291bmQNCg0KVGhlcmUg
YXJlIHNib21zLCByYXcgZGF0YSBmaWxlcywgYW5kIHNvbWUgdG9vbHMgYXQgdGhlIGZvbGxvd2lu
ZyB3aWtpIHBhZ2UsIGlmIHBlb3BsZQ0KYXJlIGludGVyZXN0ZWQgaW4gdGhpcyB3b3JrLg0KaHR0
cHM6Ly9iaXJkY2xvdWQub3JnL2JjL0xpbnV4X0tlcm5lbF9NaXNzaW5nX1NQRFhfSURfbGluZXNf
ZnJvbV9idWlsZF9TQk9Ncw0KDQpJIHBsYW4gdG8gdXBkYXRlIHRoYXQgcGFnZSB3aXRoIHNib21z
IGZyb20gYW4gQVJNNjQgYnVpbGQgaW4gdGhlIG5lYXIgZnV0dXJlLg0KDQpJbiBhbnkgZXZlbnQs
IEkgcG9zdCB0aGlzIG1lcmVseSBhcyBhIGRhdGEgcG9pbnQgZm9yIFNQRFggd29yay4gIEkndmUg
YWxyZWFkeSBkb25lIHNvbWUNCndvcmsgb24gdGhlIGlvX3VyaW5nLCBpcGMsIGtlcm5lbCBhbmQg
bW0gZGlyZWN0b3JpZXMsIHdpdGggcGF0Y2hlcyBtYWtpbmcgdGhlaXIgd2F5IHVwc3RyZWFtLg0K
TmV4dCwgSSBwbGFuIHRvIGZvY3VzIG9uIHRoZSBzb3VuZCwgc2VjdXJpdHksIG5ldCBhbmQgbGli
IGRpcmVjdG9yaWVzLiBJJ20ganVzdCBsZXR0aW5nIHlvdQ0Ka25vdyB3aGF0IEknbSB1cCB0by4N
Cg0KSWYgYW55b25lIHdhbnRzIHRvIGhlbHAgb3V0IGJ5IHdvcmtpbmcgb24gYWRkaW5nIG1pc3Np
bmcgU0RQWC1MaWNlbnNlLUlkZW50aWZpZXIgbGluZXMNCnRvIGtlcm5lbCBzb3VyY2UgZmlsZXMs
IHBsZWFzZSBsZXQgbWUga25vdy4gIEkndmUgZ290IHNvbWUgb25saW5lIHJlc291cmNlcyB0aGF0
IHNob3VsZA0KYmUgaGVscGZ1bCBmb3IgdGhpcyB3b3JrLg0KU2VlIGh0dHBzOi8vYmlyZGNsb3Vk
Lm9yZy9iYy9HdWlkZWxpbmVzX2Zvcl9maXhpbmdfTWlzc2luZ19TUERYX2xpbmVzDQoNClJlZ2Fy
ZHMsDQogLS0gVGltDQoNCg0KDQo=

