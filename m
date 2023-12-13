Return-Path: <linux-kbuild+bounces-347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FCE80F3D3
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 17:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BB941F21667
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 16:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C157B3B0;
	Tue, 12 Dec 2023 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EwkbD5g8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D191D0;
	Tue, 12 Dec 2023 08:58:47 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BCEqSvo009428;
	Tue, 12 Dec 2023 16:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jhBalFlX48WTtgwjKZojCIP/0MD0GEfIc7dBnLPHiHA=; b=Ew
	kbD5g83NfWt2d4l4w9Ptra9tXkGqsqAGg2EBj2DirTlYx7nxzZ2SNglEklywrPtf
	v8PAYWyJkJJ9B0w+VhGWjUwD+lerWQghj1vnk85pdnc9tFWGN1qYF11phDC0OLBM
	bA7mflr3ryEo8C1UCyRcwARREfWKDEditmL40h1BW5C+ZLvoE425Qw3QC2GmhBpQ
	91r3+8Um6qW+7jNIdr3CIdr0JM1AIqtXGZiupwL1uRkKEA5Kqx/+vBJBGVfJMjgR
	JpaTC/KWIhf84WYAcwnfipAWZqQdayNyR4pqKKBNGKfVcNV0GeScsf5BPMZAS5xE
	Kt7YH1iZgDkfmi6FnBMA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxsms0bub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:58:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCGwL9d017898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:58:21 GMT
Received: from [10.110.2.246] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 08:58:16 -0800
Message-ID: <93ee22bc-b357-4291-b3d9-07ff2cd6c87b@quicinc.com>
Date: Tue, 12 Dec 2023 08:58:16 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] check-module-params: Introduce
 check-module-params.sh
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
CC: Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor
	<nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Nicolas
 Schier" <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <kernel@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rob
 Herring" <robh@kernel.org>, Carlos O'Donell <carlos@redhat.com>,
        Randy Dunlap
	<rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson
	<andersson@kernel.org>, Todd Kjos <tkjos@google.com>,
        Matthias Maennich
	<maennich@google.com>,
        Giuliano Procida <gprocida@google.com>, <kernel-team@android.com>,
        <libabigail@sourceware.org>, Dodji Seketeli
	<dodji@redhat.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Jordan Crouse
	<jorcrous@amazon.com>
References: <20231212020259.2451253-1-quic_johmoo@quicinc.com>
 <20231212020259.2451253-4-quic_johmoo@quicinc.com>
 <ZXgOpRzNYGtiE35T@infradead.org>
From: John Moon <quic_johmoo@quicinc.com>
In-Reply-To: <ZXgOpRzNYGtiE35T@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5h373aL0YDslVqiXd_u9Y6Cj9sS6r_Pw
X-Proofpoint-GUID: 5h373aL0YDslVqiXd_u9Y6Cj9sS6r_Pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=820 mlxscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312120131

On 12/11/2023 11:41 PM, Christoph Hellwig wrote:
> On Mon, Dec 11, 2023 at 06:02:59PM -0800, John Moon wrote:
>> One part of maintaining backwards compatibility with older
>> userspace programs is avoiding changes to module parameters.
> 
> Really?  I don't think module parameters are a UAPI in the traditional
> sense.  

Agreed, they're not UAPI in the traditional sense. But, we're trying to 
establish tooling to help the community stabilize all interfaces that 
cross the kernel <-> userspace boundary and module params do fall into 
that bucket.

> Now if you break a heavily used one you got to fix it, but
> applying strict stability guarantees on module options which are not
> availble to normal users or even normal programs doesn't make a whole
> lot of sense.
> 

True, but unfortunately we don't have any heuristic to determine if a 
param is "heavily used". However, in this rev, we added the ability to 
parse the permissions of a module param, so we could add a filter which 
does not flag change/removal of params with 0{0,4,6}000 permissions.

It's also obviously fine if the community has no interest in the script. 
We just wanted to share it as we find it to be a useful supplement to 
our code reviews and thought maintainers may find it useful as well.

Cheers,
John

