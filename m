Return-Path: <linux-kbuild+bounces-1879-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFB88C8072
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 06:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3A7D1F21A8D
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 04:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02A1C2D6;
	Fri, 17 May 2024 04:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cvWzopBR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j1dokUhS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFD9D530;
	Fri, 17 May 2024 04:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715920304; cv=fail; b=GTOgdM6N8aVpqPkJ/I4fG/+8mSVmXwd0hO010j4ggbHdwoFHoisTM1WmLrwzJIhjEnSfYtziVkJNET4ASEIbeuCE8/aMWezcH2N5MIWC5i+0XzSmq9BNdTePelaAxYSe3IKQUnkSE9GSyHV+S+kprMd//bKz2R/u1PfU+jqQRgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715920304; c=relaxed/simple;
	bh=zd1Jj73+0L5LhyfOZ40Hm7yXxpoZnLiFDN4aZFUeHRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=clMt9oUEZ/tNW1AgcV+rzCAv1aFeQ0/rfx/7iLfKCpxXWBsk8RvKOZy3aixZjA1kfGGcHWfHOufRbQdJ8GmMqgAPsOBTKQqrSAnev+Dfc7expwpTYBUZk4usAFlDPDswLMcRVSZLXDazjAB3bKTojm+rY7IToUH9Mo3qU5mxI8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cvWzopBR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j1dokUhS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44H4TaM0014675;
	Fri, 17 May 2024 04:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=DNl1vEJx13ntuQpr8C+NTtHQZxWM96vK+iRdeSdDl00=;
 b=cvWzopBRIzOXOygZLoAUA7FFRo12Jm8YTa2rBfHhKKHbFM7z3ZDooXJuyaN/IO8dwv5h
 0qJx18TbxfS8toJ+Ek7MUhcYt92CFRG6shPb1qtYOamoZR+aRJRKjhTm1irlejgCrfK7
 KovGl1CDyolejWCAvFCa/MRTEZd14/m9A7fUTbBddEulgZLtZMCZgoBbGVtyNqQNHGr6
 +Vl8XZxKqw8pn7vRoYxcWQuyb3+KRnUwo7vggZc7BGLZQZ80uLZ685bJULqlAoRFN0yP
 rc2hpPAVcNwim3OaxXPm2JT1FgDFV02eIbODDjecf6Z8s+L4ghQ8+VI9FVWbgJxvplzu XQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3tx38qss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:31:36 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44H3mTB1038406;
	Fri, 17 May 2024 04:31:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y24q0uxrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:31:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuZDWJscbYcVjBhxiFl4P/6hHCPTg0Fpz4y7LpiEPoa8tBrGOFALq0Fx2CmKbjQ2JePr/qzrd5h5/4VKqbp/Uf7tPjT0/OkriWqxyhhdVIFc2QFLtqV3vE+2tN2pedPNRxZ+geTTb68oPs/ADfn9OgSDldB9h53G59rDEf8AILJbaI9QBciivqGS9fPjw52RVYyFbNzt2qWR4/EophEzk2km/ZFM1n7WY4nihuj8ULCcMw9F0svhPhE0q6v9qwPXwspTS2/kskoyEL4s7NHyj5dyODv8G75nvO7UgYWBdCIj4nHZaNBui/Bjaqo6f5WCdsNZ+NGMnZqSLrcXOZSDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNl1vEJx13ntuQpr8C+NTtHQZxWM96vK+iRdeSdDl00=;
 b=JjZ6KK2hagPe3rGRlDXiHfdgEgixqvgCvl2LExsvZC2s68zEkmoS7b19IUOLDFFYSbcYmvwqjpIvfv9dMNtgVbOEOfdczqXr6EHp4vNLIlefSLd1gLphzdctE+wZ1fowHYgQ9ArNr4IL0PzRPTcb5oDhrS8FitrQeYh130eeeoI5TSG3Qs1nyjP4JkpcXKDQV0s2+iwoBm3O7+0VBNkup9eIy0I7+H4mnN4MXralhxKdqadQV3ivdk3iBruu2g+DeVCBNT3MAMMIKYXK2B8KGHUkpCXbIbWSMC22M19tEvQ6f58kpHhJ4v7ZvocPszZ6YXuaWxB+RU94bz8XOCHovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNl1vEJx13ntuQpr8C+NTtHQZxWM96vK+iRdeSdDl00=;
 b=j1dokUhS835NeQNF7kAV/g3bq+pW/gFR8oJhcc4IqVl4fdV9AwNFsVA46HurgaUgwAcy5JGUyXCGMnzEgtmFPGY6rUF1NGGK/RE4Hcotaem14CWP3qtig0DmZMIfCsAaDVYSuHkkIna09hCgffnLl313C9BQ+kg6jtdeDVUIcL0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 04:31:32 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 04:31:32 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v3 4/6] module: script to generate offset ranges for builtin modules
Date: Fri, 17 May 2024 00:28:37 -0400
Message-ID: <20240517042839.544650-5-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517042839.544650-1-kris.van.hees@oracle.com>
References: <20240517042839.544650-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::23) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfb4e77-b952-423b-e7f3-08dc762a3aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aTsSyYl44rtS2rR6xpPnAf/1EyDQDQ+AUexU5G20KhN0MGCMABlDAkiH9KZy?=
 =?us-ascii?Q?eWBAPA2Vbg/86lEW5qt13anBLMoGb+ikj1QyXPvc1ZTjsveC32VKTeBEom1A?=
 =?us-ascii?Q?smwJFkzKGiec34pgA+8OmmBDLCQZDJM0LwO9APv2DRuuUJpcTJ5kqqkR6aqc?=
 =?us-ascii?Q?xEyRxTJXAUctYkMLbG1e762++RCKAIoUPvamCjVVnsgdYSmK7JYJW1n2HFAx?=
 =?us-ascii?Q?2hMUQ2srQmiax+weEtgNucRPLwrka+1Od91enX42C7wE/3mzTm+BRimaxK+2?=
 =?us-ascii?Q?QsckmKMs64F5D2gnhv5d9JQMHXsbAeD6jK/2rQk60PFRSJjZGIW9SL3GiboO?=
 =?us-ascii?Q?g8XCbzJBvN7Ib5qMenF/nXwfWck9E1OnlMmiK8FWkwjdd4alTUTJ0xjG/D8Y?=
 =?us-ascii?Q?U0ByOkUk4245xrk137hfovjrIaN+2SjUnLQ81Rc9K4mOnkEWxqyu9d0Ve0bT?=
 =?us-ascii?Q?LTdEYoQrJFuvm8ixtSLyuGfYoKxW+cCmJgie4da0TQkjzmXQPSznzNOBvQPA?=
 =?us-ascii?Q?lQU0KRuou/u0iG8fC3MXzeYqoS7LAOKsJP0v5strufrnQVnmHi/G4i2KllZC?=
 =?us-ascii?Q?aSahZICRg4QZ+LsbhYU75Hrj2oxEdgVO2q4007Uq24jH9cZTalddI9JV3lxR?=
 =?us-ascii?Q?AzHv74dDOTEmFfpipsp3Hz06lJaWKvodURf8+Iy0/31Mst1hpt3+Ez1g0LQ5?=
 =?us-ascii?Q?FfUWZshm3tWXND1bhHYnNEe5oEQJfr7ci+xQ/raOKlG0mCutv9X4itXJtbFE?=
 =?us-ascii?Q?LHZ5QgcrDSwdsh8oWtJ/iweaQ3KIUZTdefeMipAmwOMfgHYJ4IHme4vA1jml?=
 =?us-ascii?Q?yQlxW0B3K8HLWALzylPwRK3+slXChLuS+MMQt278lks2kZLHSK+8Y+hLd9kA?=
 =?us-ascii?Q?HVjdA3wP6/zhQRsY74+W20gOnJ7vcLoRXV+HsocL3bn1+6zJ39ySKyJBh/yN?=
 =?us-ascii?Q?r4O5x4eFgD72SVoBNxFvJohvUYXxvx8bgRA3rlzZx8R8I7/RjwEVBFxmV4E9?=
 =?us-ascii?Q?MDs5uO3BWb4OhduOSYU33zvYVRuaFfL8RF0MaeF/B1ViBxq2M4fyFPc8enyx?=
 =?us-ascii?Q?s81Ir9XuHE4DXWnvuuac5dTMc6TPqOon2CDbI4GDwQL2sRxfWsU75rq5T5Wf?=
 =?us-ascii?Q?0M9aavnkX/Ii3kEBGnScTihnjbnQo60LY15DC1An0+oXJes+p7m5R17XGz+X?=
 =?us-ascii?Q?cwQgLPNOQ/joZP/8cWpXOs7gdV5+h2dkhPk2zPI1C05xE/pY9e/xFNCEznjU?=
 =?us-ascii?Q?WkxMSzKrpaojArMPUmPIabuNvFNGqYsZ6NdTyf7CuQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pb7aq8qXvyi2HIpZBqIZRdi8IEt17RB7G9slyErJyGp5nZPJp0LQe3V9jfqp?=
 =?us-ascii?Q?DBP1yXQMzSnma5h0wJVmSLbP9MGZfgv2IktQOu679MHrWN0+mwh7Qn+ft+nR?=
 =?us-ascii?Q?WJyBboFmfSAbXqsw0DMLmocUNf8zSGi0BQKJ4rY+ITjJVWBlDAhVdi1kZaum?=
 =?us-ascii?Q?rqu96vZTWyPygjBmjx0Qc8somucPMUOC8csuE4i/Da5twXvM2LqyTtbjCD2f?=
 =?us-ascii?Q?LnYNU93rVf+2jcpnnpmPbbpstxXom+SqAK1VVOCZcCFEV5dkqwa2yH69Jjnm?=
 =?us-ascii?Q?i+rcJapsQOO2CJnyErcUzUwmus+PI5IEw7YDbSWQJA2ec492FemVKuoh/+DZ?=
 =?us-ascii?Q?UfMOVccsJe28IculYjWa+KlKChcmJhWLyT3k2de/1/vNwTCMuv8KfUXds2GD?=
 =?us-ascii?Q?6ALo6FDga8jDdV2+MwsbH9bI8P1nNs3rULiwioHBy4AjXWPmt9kyIEmYsTNm?=
 =?us-ascii?Q?8JGGbee+Y4SnBN0EIslFnfuWY+AMGFOnFd9s2z3o8q5aY0cgtb/lkZjtm/Zl?=
 =?us-ascii?Q?olIemcnC7QfgiaE1/579imI8bLMtDe0eJtYO6wVAQCatLsfjX4YB9rXQp7D9?=
 =?us-ascii?Q?k0TJaRN8uLz9fn2RYEKxm0m+JK9vD7nvTYCW8yPgVDSRsh4gCCFh5HS7PQKu?=
 =?us-ascii?Q?2xZYIsKUSdSyDc6ky3rqoGVrU7I7DrozRWWmBIyCjLfiQMnQbMf4Z1LqRm4d?=
 =?us-ascii?Q?Bh/xRhjUkK9vqfu3qF9ivfvR3ZF7mT47H5X/9N1OyYm/1uSPQsW6F/ka+c6z?=
 =?us-ascii?Q?9leDpfpTjMofU7t/XvxQve14STounJpMS8An5DtJurmz30t6Doac0Y4HBGsQ?=
 =?us-ascii?Q?a0uV0i9WvFm3Em78calUffdcIQJUnAGK0Un4+U9Bu2VUaoOfKfTs3BBZ8PDe?=
 =?us-ascii?Q?X09VGJuwfmekvjbL2C+W8Gub37pkvGwVTx2gS6R4PXKK5aT5pBwTCsRtJi72?=
 =?us-ascii?Q?XIvhH1VM/brrYEE/xCuRrtpdJWh8mys5iGli8Dpn2rLA82E8EFSQwAdRsOPj?=
 =?us-ascii?Q?HweH7gV7geSV8tyAZiC+z1NSQAb1Hv+92E8M3hHlHL5PteRO4s7iOP551PXL?=
 =?us-ascii?Q?ogCErLKWpd4z05qLg3uCwn+9oOW492B6D2P9jkjPjELThu9gGIc8qJL6HPXY?=
 =?us-ascii?Q?59MYQrXNscsW38Uzs2xyupXZr3p73bjHVoDXJ4q2e2VZtnnxj0cYKvvoSH64?=
 =?us-ascii?Q?9CxNZznXatG8xgKrB26EagSIyZipcE1TT/Q/U+JR0BYW5EfhgR9+ceIL4Br+?=
 =?us-ascii?Q?o5YvJ1EnWOoNyNdkzSV+5YsXii2O9/FSbqQs6nbrLFQvZiZuucq/cSNoyjer?=
 =?us-ascii?Q?QcUMnrfI/7RE/ZHQd4etv+Yio6uY56uWjWcfNtnW6RtE+/ip9e0U0Uej2K3J?=
 =?us-ascii?Q?fzIhL2bHpfGIMiYcegnUmeaSSKGNhnRSDquLeYrHMy/GfdGsJG5naUxudRbW?=
 =?us-ascii?Q?cdNbwXEnsP7OuyBrhrGywgDD8aeMsgnBhRIjYLXsu1YKrWdTUIxrUtJ/eE0I?=
 =?us-ascii?Q?pon6rLlBPOwPrXOfG1FqxE0drDHHe5z5W9fcTKCIo7oJZe0JuITCeEQ7RJ5/?=
 =?us-ascii?Q?tSILrHTPNL+q3Yuu+187dcD1LFu3PSCzvT3N6R2xaHepKkvgEZfAl3+eVBEp?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	3JGguHOvqtdtsdrZazMGPn+64y9Bbp1iMPskAzD9Poilf8dI+B454t+/89Zd9WQ5w/I3FsOWFlA/IgbjMjso4afP3xZbPST0ezAkA+uWnwM/nBf0p26LLVBle1nbe7d0XeXtcn5MzfxPKxFpCu9/FNh6QZJucxogRUWiUhlWiShtRlMq52RUxMsP0yTBgbLv/191f+fsqvEVNoIMtah9+F0/E5ztuqn0W1Z0mvA4tCiPEmzDeYGl4EEEjrAmhCtnCuBSPjKILFHYrZTJizrDPmXB6NQrjrGfhy9o2fWs4HBJSgFhAT1T8JruWytFneVs6lkLgld0e5MXyUDLv0GbvIj0ZJ96UJKsrB2BNS6aeIY7AJCeE4I/AiqeeY5ipkNuYAZ7nfaAJAAopH3jWqtD6JxHD9p9uGOugYebEBtfkfvkJHZ7H71Gbho5ZnOC3UyeLXM7K+Mr4B8UjbXjXRmQlYDZzkOVWwN29tOeahnFos3tlt1IdHjzhCGu8p5c8r1g/DjPcn3CiIP2YQor/O6ftvxBVK8yF4GwvSihQdOifKNF8Bh13+Fdtwt5Gi1/N8CU5Qo4ANeXsqabr/V8jwYOKQj5xaIcdQmVAuU9knUDNVc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfb4e77-b952-423b-e7f3-08dc762a3aa8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 04:31:32.5274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpR0V/yJ6GlbscD1K9gtXhy+JoaEuR43zkGYG3T4HDL9hkotvC2meOpTxuGoNKtwttp88NvzmhdaS72DCWN8oJhhMUr0EyemRSTqyDdivHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405170034
X-Proofpoint-GUID: r4rvrFwzsdDhByXKNDZ5IEbuXpnN3sHv
X-Proofpoint-ORIG-GUID: r4rvrFwzsdDhByXKNDZ5IEbuXpnN3sHv

The offset range data for builtin modules is generated using:
 - modules.builtin.modinfo: associates object files with module names
 - vmlinux.map: provides load order of sections and offset of first member
    per section
 - vmlinux.o.map: provides offset of object file content per section
 - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME

The generated data will look like:

.text 00000000-00000000 = _text
.text 0000baf0-0000cb10 amd_uncore
.text 0009bd10-0009c8e0 iosf_mbi
...
.text 008e6660-008e9630 snd_soc_wcd_mbhc
.text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
.text 008ea610-008ea780 snd_soc_wcd9335
...
.data 00000000-00000000 = _sdata
.data 0000f020-0000f680 amd_uncore

For each ELF section, it lists the offset of the first symbol.  This can
be used to determine the base address of the section at runtime.

Next, it lists (in strict ascending order) offset ranges in that section
that cover the symbols of one or more builtin modules.  Multiple ranges
can apply to a single module, and ranges can be shared between modules.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
Changes since v2:
 - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
 - Switched from using modules.builtin.objs to parsing .*.cmd files
 - Parse data from .*.cmd in generate_builtin_ranges.awk
---
 scripts/generate_builtin_ranges.awk | 232 ++++++++++++++++++++++++++++
 1 file changed, 232 insertions(+)
 create mode 100755 scripts/generate_builtin_ranges.awk

diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
new file mode 100755
index 0000000000000..6975a9c7266d9
--- /dev/null
+++ b/scripts/generate_builtin_ranges.awk
@@ -0,0 +1,232 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+# generate_builtin_ranges.awk: Generate address range data for builtin modules
+# Written by Kris Van Hees <kris.van.hees@oracle.com>
+#
+# Usage: generate_builtin_ranges.awk modules.builtin.modinfo vmlinux.map \
+#		vmlinux.o.map > modules.builtin.ranges
+#
+
+BEGIN {
+	# modules.builtin.modinfo uses \0 as record separator
+	# All other files use \n.
+	RS = "[\n\0]";
+}
+
+# Return the module name(s) (if any) associated with the given object.
+#
+# If we have seen this object before, return information from the cache.
+# Otherwise, retrieve it from the corresponding .cmd file.
+#
+function get_module_info(fn, mod, obj, mfn, s) {
+	if (fn in omod)
+		return omod[fn];
+
+	if (match(fn, /\/[^/]+$/) == 0)
+		return "";
+
+	obj = fn;
+	mod = "";
+	mfn = "";
+	fn = substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
+	if (getline s <fn == 1) {
+		if (match(s, /DKBUILD_MODNAME=[^ ]+/) > 0) {
+			mod = substr(s, RSTART + 17, RLENGTH - 17);
+			gsub(/['"]/, "", mod);
+			gsub(/:/, " ", mod);
+		}
+
+		if (match(s, /DKBUILD_MODFILE=[^ ]+/) > 0) {
+			mfn = substr(s, RSTART + 17, RLENGTH - 17);
+			gsub(/['"]/, "", mfn);
+			gsub(/:/, " ", mfn);
+		}
+	}
+	close(fn);
+
+# tmp = $0;
+# $0 = s;
+# print mod " " mfn " " obj " " $NF;
+# $0 = tmp;
+
+	# A single module (common case) also reflects objects that are not part
+	# of a module.  Some of those objects have names that are also a module
+	# name (e.g. core).  We check the associated module file name, and if
+	# they do not match, the object is not part of a module.
+	if (mod !~ / /) {
+		if (!(mod in mods))
+			return "";
+		if (mods[mod] != mfn)
+			return "";
+	}
+
+	# At this point, mod is a single (valid) module name, or a list of
+	# module names (that do not need validation).
+	omod[obj] = mod;
+	close(fn);
+
+	return mod;
+}
+
+FNR == 1 {
+	FC++;
+}
+
+# (1-old) Build a mapping to associate object files with built-in module names.
+#
+# The first file argument is used as input (modules.builtin.objs).
+#
+FC == 1 && old_behaviour {
+	sub(/:/, "");
+	mod = $1;
+	sub(/([^/]*\/)+/, "", mod);
+	sub(/\.o$/, "", mod);
+	gsub(/-/, "_", mod);
+
+	if (NF > 1) {
+		for (i = 2; i <= NF; i++) {
+			if ($i in mods)
+				mods[$i] = mods[$i] " " mod;
+			else
+				mods[$i] = mod;
+		}
+	} else
+		mods[$1] = mod;
+
+	next;
+}
+
+# (1) Build a lookup map of built-in module names.
+#
+# The first file argument is used as input (modules.builtin.modinfo).
+#
+# We are interested in lines that follow the format
+#     <modname>.file=<path>
+# and use them to record <modname>
+#
+FC == 1 && /^[^\.]+.file=/ {
+	gsub(/[\.=]/, " ");
+# print $1 " -> " $3;
+	mods[$1] = $3;
+	next;
+}
+
+# (2) Determine the load address for each section.
+#
+# The second file argument is used as input (vmlinux.map).
+#
+# Since some AWK implementations cannot handle large integers, we strip of the
+# first 4 hex digits from the address.  This is safe because the kernel space
+# is not large enough for addresses to extend into those digits.
+#
+FC == 2 && /^\./ && NF > 2 {
+	if (type)
+		delete sect_addend[type];
+
+	if ($1 ~ /percpu/)
+		next;
+
+	raw_addr = $2;
+	addr_prefix = "^" substr($2, 1, 6);
+	sub(addr_prefix, "0x", $2);
+	base = strtonum($2);
+	type = $1;
+	anchor = 0;
+	sect_base[type] = base;
+
+	next;
+}
+
+!type {
+	next;
+}
+
+# (3) We need to determine the base address of the section so that ranges can
+# be expressed based on offsets from the base address.  This accommodates the
+# kernel sections getting loaded at different addresses than what is recorded
+# in vmlinux.map.
+#
+# At runtime, we will need to determine the base address of each section we are
+# interested in.  We do that by recording the offset of the first symbol in the
+# section.  Once we know the address of this symbol in the running kernel, we
+# can calculate the base address of the section.
+#
+# If possible, we use an explicit anchor symbol (sym = .) listed at the base
+# address (offset 0).
+#
+# If there is no such symbol, we record the first symbol in the section along
+# with its offset.
+#
+# We also determine the offset of the first member in the section in case the
+# final linking inserts some content between the start of the section and the
+# first member.  I.e. in that case, vmlinux.map will list the first member at
+# a non-zero offset whereas vmlinux.o.map will list it at offset 0.  We record
+# the addend so we can apply it when processing vmlinux.o.map (next).
+#
+FC == 2 && !anchor && raw_addr == $1 && $3 == "=" && $4 == "." {
+	anchor = sprintf("%s %08x-%08x = %s", type, 0, 0, $2);
+	sect_anchor[type] = anchor;
+
+	next;
+}
+
+FC == 2 && !anchor && $1 ~ /^0x/ && $2 !~ /^0x/ && NF <= 4 {
+	sub(addr_prefix, "0x", $1);
+	addr = strtonum($1) - base;
+	anchor = sprintf("%s %08x-%08x = %s", type, addr, addr, $2);
+	sect_anchor[type] = anchor;
+
+	next;
+}
+
+FC == 2 && base && /^ \./ && $1 == type && NF == 4 {
+	sub(addr_prefix, "0x", $2);
+	addr = strtonum($2);
+	sect_addend[type] = addr - base;
+
+	if (anchor) {
+		base = 0;
+		type = 0;
+	}
+
+	next;
+}
+
+# (4) Collect offset ranges (relative to the section base address) for built-in
+# modules.
+#
+FC == 3 && /^ \./ && NF == 4 && $3 != "0x0" {
+	type = $1;
+	if (!(type in sect_addend))
+		next;
+
+	sub(addr_prefix, "0x", $2);
+	addr = strtonum($2) + sect_addend[type];
+
+	mod = get_module_info($4);
+# printf "[%s, %08x] %s [%s] %08x\n", mod_name, mod_start, $4, mod, addr;
+	if (mod == mod_name)
+		next;
+
+	if (mod_name) {
+		idx = mod_start + sect_base[type] + sect_addend[type];
+		entries[idx] = sprintf("%s %08x-%08x %s", type, mod_start, addr, mod_name);
+		count[type]++;
+	}
+# if (mod == "")
+# printf "ENTRY WITHOUT MOD - MODULE MAY END AT %08x\n", addr
+
+	mod_name = mod;
+	mod_start = addr;
+}
+
+END {
+	for (type in count) {
+		if (type in sect_anchor)
+			entries[sect_base[type]] = sect_anchor[type];
+	}
+
+	n = asorti(entries, indices);
+	for (i = 1; i <= n; i++)
+		print entries[indices[i]];
+}
-- 
2.43.0


