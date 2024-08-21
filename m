Return-Path: <linux-kbuild+bounces-3141-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F9295A02B
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 16:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF550281499
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 14:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83B57D3E2;
	Wed, 21 Aug 2024 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E9TqRJjA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B6g3GmqS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6776188A3A;
	Wed, 21 Aug 2024 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251236; cv=fail; b=QRzn+dUb0ElKD7dpgKj6pVEjIlB+e85hMzV/iPXdeNwYVRRCzxK6rzpEw0sWq0KqePXfGrreadgH4M0MK2XaswpHSntQiWoQqBkNURL3EUPIbTFGLXFw8Itvw5m8usBaU4Rx4RjWntOGGNP0pTUUgKdEnI0rB2ghnt1G/YIO+dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251236; c=relaxed/simple;
	bh=4oRjlqQSvLvdkgwK69DPrTTf8Jc+VPAv3mxb1rRvCyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V2rWb2Zem5ojNrtIqfmUDtd5RF197lQmjmVBxOgV8rpA3dobpV8zAbwfv0poZsm/rxZc27FEhoQ7R5J05hObHtF1/dyXp4HFDAIBjX5xfh34Q7gbDvHZBGhDPxe/FPsXkahhkOoGIkQzh6815fvQJCEe67O/5hi2RgXBLLpieWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E9TqRJjA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B6g3GmqS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LDIVom031442;
	Wed, 21 Aug 2024 14:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=KeEpA0NAluAWv+ENbS6G5LNoJCuM3VsTKyLzts3liwE=; b=
	E9TqRJjAEiegrBC/uVXKEmeAolBBfJyWSV1Kno/8eN5/7AIJadZPC9rsUT2ievC7
	tJRb28du8FAOxrnLZKuOSXOon08gt4lwQGI/2nyUoUykEXyL1a47nQ6kW8R2iXaD
	SYrkoT0Bej87rOJMokSrjoMwe0tnHwXBEcs7cXe2qe90eLFROeUnACyLCkd9Xp2Z
	NF1xyVq3PjmIvw/GRKfV3w56eM0WT/9VkGRzeg0v69wVd9kUHMLGaEdZg9QwY5TV
	RMR75Edsujgo07lqixUu1mwK4K6RIqbbJ/52lROqJzdMlDx8y90K7mnqdH2HGrMV
	9qYVg3gboDpaQBM2X4LY7g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m2dfsf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Aug 2024 14:40:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47LE71pT012812;
	Wed, 21 Aug 2024 14:40:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 415hqfhj01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Aug 2024 14:40:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTpFq+194wAXraW7H9cFgkktxyy+Jhq7mUjtiviOUK+vl04tghBifX5za1gu50dKdVDSiRFDd4kh0XbWagxwGP+8J8Fc0nhVuvPyVVlC/+kFnrcTTWiWlusBtmg4FVP/AiGyEbsJ+rzJJOhIlMSJ7Vppukz/kvB4epVPFU/CyDg3tWYZ2V7MTGz4G2ql5jUiSSvD5oz66SONdlBRVTlhZU7oigaIp07eVv9PBH6P8z9Gkz2Mvwrt6zHoOZftBKXEBCXBIRVINFaBVSM5V1n92P11V2hqYO/6XVif7VCwWMX/tQiaeQenZ16BTvltCUy0hpcIGeF+HqNPAi7G6dnBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeEpA0NAluAWv+ENbS6G5LNoJCuM3VsTKyLzts3liwE=;
 b=bEN+oOzX2sYwJVkxFyp1wWEVkAPZw9uzC28cHsvP4CenqE+l2aKRLWjIu/LiUhpRLk9c3GBspwSWTJ9Yix/lZvQHUdTH5B1tanCxN2kwD4eB3LqMt9T8BAJbwi39EyR5/AxVqaWLue2mpi45R4kQSW2hSpHmCezZcMszpd32qxz3D89zrG2dJ4OrAMTtAUvgnU71Jk1hJVzMDnH+YLvV+lRzbR6cugUK9nTfY4sDG1mPIeTTsIt7QYReZCtuq+LMoBmFxf2wYeIlwSX1IvgcG0dqQLGxjSsKgIb/Vhavb6xHG5IpBX3vvCPTOL1tQIqc3hzPLD08jVb2EbVpzbahzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeEpA0NAluAWv+ENbS6G5LNoJCuM3VsTKyLzts3liwE=;
 b=B6g3GmqSCyUBDVnGmi/W1Ww26wG42dzCBX0jQiY88AmIgPClfmiU4X0IXuIhVJ1uX2UYQH/jAHTCY7K6xHWnEXQL3qlcrbyLBng2SIvvZslRZf0FmAgihYik7NaueNZ+heYbsMtCjCPNoMRyhKhnkejH4oljnldkDUtVpc/zpak=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB7315.namprd10.prod.outlook.com (2603:10b6:930:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 14:40:18 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Wed, 21 Aug 2024
 14:40:18 +0000
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
Subject: [PATCH v7 0/4] Generate address range data for built-in modules
Date: Wed, 21 Aug 2024 10:40:09 -0400
Message-ID: <20240821144010.1950249-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821040700.1919317-1-kris.van.hees@oracle.com>
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:23a::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: a0070daf-3b08-4e9d-99a9-08dcc1ef2d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4dtt5PWiZ4y9HWcP+L1skSJeyBY/ziZlu3cIckUxjTqwPagVYN4CEEoczB86?=
 =?us-ascii?Q?w+2vrW9rkva6ThiVZD+ZMdRcoUwv5ZarTtjkybFml5aKCn+PKk7S3pfaqQmn?=
 =?us-ascii?Q?AuRVMzA6jzdT+ZGXwenc2JwT9YMd1/YkYVKQw+b4bDUuFN3PLhG8lEu60tfQ?=
 =?us-ascii?Q?9rxPMY7dzcgJqGQ6Pak6NNGTFJ1zosZ+HL3vcWBf8KA76CzMFaBtUL1Lx5iq?=
 =?us-ascii?Q?gIKPzQa+3gdjXJfoXi0EzjdFrU4eTTIbgghwoKhHoLU3v7Rw9zjoHhPmhNUN?=
 =?us-ascii?Q?4kbtqBmkP9/jfq7xLCIzOBxbP9yDDhNO8Y4GwW2QDKXjR1B1L18K/G3xKvfk?=
 =?us-ascii?Q?G55sT64CDL431w0My7zIXERXcQvZl4ANKnM/hzvvV00JqxYPOb2fG0GH6UjS?=
 =?us-ascii?Q?vCQHuyLr7S8J3B/PZArN17cT6UfvIU/KtKizJZ8uh+/Yx93ZpYDd2pWYLmMC?=
 =?us-ascii?Q?ZDSJeMw3t7j9TVHbiY/c6pcxuggd8q/3+tPjguj71z4DBtrliAoq1r2MQLK7?=
 =?us-ascii?Q?5HJGzCmYIcP02S60jzUc1bip594cYKMhAwrdAAE3VwDXjiyPFieBDJILVB/P?=
 =?us-ascii?Q?RJ44PIxNyM5bYhpuykQDOsehR8IJynDy8HJGWo6ShXg7hlcLAWoXvj9Xnl9t?=
 =?us-ascii?Q?IbgZ1P7zP0MdZ2QgwvXxQLWbrbcMH1vPfJAy8qF+pn2Y3D2QlzeF3QP8qve0?=
 =?us-ascii?Q?sUiyzVYpcT9vwdtYaLBOlfmByOhTKgDn1jlh6pfiyMz4i9/k+8G4UIQB7qJl?=
 =?us-ascii?Q?nuR20+1DUtBcRlk3sZFAM29hVUmls8bvXufW+Hn/tEW051rFjwnxfg35+9Hc?=
 =?us-ascii?Q?y4JS59ImfiZyTr++gSAW+dsSBfvUN5YPG1z/+2pYeQWChpjNyR/i3qdkDWyr?=
 =?us-ascii?Q?bSZfezfeTUtw25RXDcZZzEo9vZdZdnByTuRv+Pi46PZYCyFjS0L3+ogTlVXV?=
 =?us-ascii?Q?yumN8qM4YlzemkElw68WeC1PAyXxu1i1KwkQXebCkfZK+n15pycTQXhJwdLu?=
 =?us-ascii?Q?0sMJbFjcnULCnFbCYzDA6GFTAxrrJv7d/2PdI6r9HCKwwzcq3wWHMuY0RUet?=
 =?us-ascii?Q?/l/9ZHqN0y2S9OntDpMK5pXZ84+/q7lTRR3ly4mmu6VOKzb6ED2vF9SaR1yx?=
 =?us-ascii?Q?ZzXbuYI3yf1ooRUIj9BMLIQPtZqhcdaEoCRuk8QjYz66hgxGLLPQpNfoqQrB?=
 =?us-ascii?Q?AD58WkxUp86JcP4JlsflgL8r8xI7QJjxcsi46yFEk3PUMHEuGbZ9Wd4sQpEN?=
 =?us-ascii?Q?+qqGJSWAQ6FLyDf+QRnlvdHfupDi+jWf8l4X4KR5/KlYO2VF6FnGTwQn5203?=
 =?us-ascii?Q?wWKvTB5/Yheteoceo/fGuhOZe7yPOQtQJy8HrR1QP7I1uA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+pzwJXQviKTa9NAP2ezqDy3G259+yaWDzNHSLPB/YhDesPxeXBC5wrTkLgkR?=
 =?us-ascii?Q?8vscIUySPIVCJo4/ROiGAkaj/gyTldSY0YuqPgE34PYByTKwr9ttmxCR7Rqp?=
 =?us-ascii?Q?/6Uwy/TuRDqBfDacHuiDFug/oZMNlN6poqA1aht+EnIqYpsEqAqymqR7ucLe?=
 =?us-ascii?Q?lzOc8biD6PsbdjryykHVwFNaz00y0mg6gck0S/evq7hP/nhxgeKlZepXAD0j?=
 =?us-ascii?Q?C1S5H9EqS+Y5VQIlOD54cuESsu3GLCbeOvC8wvVi7SI/TcF+M5/TeQyEAdmz?=
 =?us-ascii?Q?YAb3jI8svhb53hBp08u2CISgswkIgM8f/v60g/v80ikkAewfDXH1racd2h9n?=
 =?us-ascii?Q?xT7pNet7WIKsl7vnX/08PATFym6QDxr2zIIEdagbrd1L7xFT2ec5mvS0Ab7/?=
 =?us-ascii?Q?YFpgryDejS30lXhWDsoHI3Qy4Ll3oPE+IPiyQUhkVxh4hHT418LNhD7mjAIa?=
 =?us-ascii?Q?409yHrtL23hDteZWFrintkElfmEC+SkCz+qSkFLs5SYYj0sp7+vKye1Ng/Jz?=
 =?us-ascii?Q?EDk1zprRTZnYdbT7jKVuDZ9udwZKo6M2IgvQFYxO4MsxGGmYsRJXJTc7Ij2V?=
 =?us-ascii?Q?kimr2++JavogMJJJpoZxrKmPJbORox1IkeJ+7C44j6N+uQRshdAehMLNAAQJ?=
 =?us-ascii?Q?lEA+YBZjvLpKc6hheGwyeMx+PcQ3tAxDWz+MeQdb/urGkBodCJ1PkrNLzfPZ?=
 =?us-ascii?Q?/pvTqYWtl+Z+JuDMJS9gresj2//Drcrw7B2vdgxOYODdgaYsJql2/v3/CGLD?=
 =?us-ascii?Q?uAThbS3QOmWsTxr9lxQiSHDCVaBXgjBgbnm7pMk+lQ4Ev4S0MingukF12ep4?=
 =?us-ascii?Q?uyjJOdFedCP3kiHHt90g8XFkiqoyZkoA4pxZz9X0Vzp/j75Otf9WBw49Rxdn?=
 =?us-ascii?Q?NR/b4PfU/O9kygB5SscjB7d+i5uSnr98ZpjfyXi3z+3DS5wjE3qvE+emr1Du?=
 =?us-ascii?Q?HFkuOrZT61egevKb5M24PYSOW3L5E5jUxrC06adDOKtF+x4WU6d+rhl1dZUF?=
 =?us-ascii?Q?OQ+zrxsSTPxfg0NJXAINX5JeMsQQ/sDpDEgTo9c7aM6wnqf/wd34V33rx6Ag?=
 =?us-ascii?Q?aDejUJxuGsiE0DDsxwJwfqylfopNJ0JmnliPBOPG43xAA/O/z/Fu1IakQVIn?=
 =?us-ascii?Q?soU5y6nlMmevcmYG5zTAVn/rg6Kak4lj7wo56Qk28ud7NYJrNgk8mc12OFY3?=
 =?us-ascii?Q?xMJfJ708tJK4w0l8ZK1ffyftN3jS3vy51ok2wmeQgRw1eVClO2TYsT3gTEql?=
 =?us-ascii?Q?a9ou3+7UjSyY5fgPjapxQEgoYlf1LJMyi4HbMBW2XXlmWzP5fddFl3kucCLB?=
 =?us-ascii?Q?ESlskQuquBVLI57ySxJoC9Si7sX0tEz5T06X8dZyK7lVoz/4gbPTLihvWb6o?=
 =?us-ascii?Q?fVJ6DR6AczLYj8knEUjYwSO37Lz/UUnsVzrNthM5ut1W9qIYvy1NNHRlxUiG?=
 =?us-ascii?Q?wJ6uqD1s9TUBBTDRA8N3Oa4yuSWRIpjqZjYdsatxX6CgZm6Ak6iempm3ihN7?=
 =?us-ascii?Q?7Ae2JgsRzEbkS/2PDNKRwXVqjB5pbvUF4fKflQU7JcNuxmR2Fq22cx4on/FC?=
 =?us-ascii?Q?K04GWQwoM1EJCBJBYbw82Cx/MUXtxAoha8cx9hyrWwgE7kuXGmIJH7VLyKhw?=
 =?us-ascii?Q?TuTRPW5RXl6Ro8au6jjYlYU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OAZpsosqNYrM2ybzo9fLgMraxgCsIf9I2Jae7LZIo+cZ438lq4PJ/uGSU6IdyEOtjnlWSBHhJF5qknUn35V3rSNEL0Xj5BeS29YWW25f63xK+anAa2ZUZE/hV63cXYzs29b4hHP6zIoncsqN/jqZVwb2IpTz4IwmJzRJUiCZydsp6YrWKYs5ggMPl3rAdiN+bsTEC+TDkV6B+jbdLmKEydnRoR0ImoEDKsi/pT/r3ivse0/cAsWrU1eGMW/43DEfezFYE2KNTZNCA64Ysh20oSHy4keMqUsIMkfsPz0LMm/D85wY9PS9fHiYomKlAcAh3q30IYO9/szHdzYnlzMcgPOhxdX7qHg2sSOwOI2f9WPrv8cWv4iD3G+Z2Q/FLpUc/hsCbevKReOxHym/zNPhGLRaSUyKBv459Zxn+YAuaSZAMw1pNlnQ+ZKXomuaGmP9TC/KU0ex/0xkIDUJA8uzfAl7Y4XNdL3Y4XDOH7eDuxweNWofeUFF4OeXMwhHKQV58mcWbLH+BdmvN6F6v1TePJmu/q6rceXk8e2+kcuYTA2vGPWupxRG2efRQkYFtyP0rekx9obrTUHYQ0z79bF92wavXzvHMsNiLokljhBb7vE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0070daf-3b08-4e9d-99a9-08dcc1ef2d5d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 14:40:18.3114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQaq9SHAML8CBojUraPDRM4Q1luqnCew++HbzQY67Nm7utrONM2hKOXbgoxBSOHaZ5yL+H0V8nbvx+d/pYH2NsxdgiqclJwSK2R4uHg58oU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7315
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_11,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408210106
X-Proofpoint-GUID: 819WR_BPNEPp2S4RZVndFGxuqvGsS3Gr
X-Proofpoint-ORIG-GUID: 819WR_BPNEPp2S4RZVndFGxuqvGsS3Gr

At build time, create the file modules.builtin.ranges that will hold
address range data of the built-in modules that can be used by tracers.

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

Changes since v6:
 - Applied Masahiro Yamada's patches for kconfig, makefile, and scripts.

Changes since v5:
 - More improved commit descriptions to explain the why and how.
 - Removed unnecessary compatibility info from option description.
 - Added optional 6th arg to verifier to specify kernel build directory.
 - Report error and exit from verifier if .*.o.cmd files cannot be read.

Changes since v4:
 - Improved commit descriptions to explain the why and how.
 - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
 - Improved comments in generate_builtin_ranges.awk
 - Improved logic in generate_builtin_ranges.awk to handle incorrect
   object size information in linker maps
 - Added verify_builtin_ranges.awk

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


