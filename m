Return-Path: <linux-kbuild+bounces-5498-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A740A1538E
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2025 17:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCEF7188BC6A
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2025 16:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732CB1A08A6;
	Fri, 17 Jan 2025 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lSMHjBY3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46C19AD8C;
	Fri, 17 Jan 2025 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129706; cv=none; b=KaxJD2jNfMiOPRDpvhZ2RpTDikn4g7QUikrFpgJfbaCQqEGgwHa/M6533jveYJvA0GM4HC1Y/I8mVB/XD+sPatKh/D8mk1YE8PNFti7BZDTS/cJd2OKBtgGkCV4SBZsn18PpokFMOyq+GEwhoiXo92PUtnDkCRQVDzNKglpubos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129706; c=relaxed/simple;
	bh=s979JhbIX/irgqOlZL6T+T/4O9+NcJ5UNqWwVMy1ypI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nzWiLgJmanuBZdab0VL1/JEEmJIeU5qYcDHspBkkZviMorY06xna4M9l2j7mI+HzPGC2BUvS0XjN7mZ7dN1Airz2rLwKUmkYUt6mFdhxjH5CYtycmVc7CMojktOaghfrN3GK0f+e5G0sB/n8FzvXWAkQFaNWEYY7YcJoxJNIwYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lSMHjBY3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HFLC21001421;
	Fri, 17 Jan 2025 16:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FdET8nQmBxVGrxpK3oHaFVqJnWkEfrQO9HjuF/kFizs=; b=lSMHjBY350D7ieZD
	ia9B2eRQ3dp2Rru9XZ6oUlk+vlqasKCpDMxcDbslu87LpdtdlBrDSHzHJpH5iTyb
	eOQZp9OK2iidq+Y0tF+yyiuK+W6RGURNaBK7GoM/K79NCDQnxy303xfOKmnYobgK
	h4R//loU/+cmYPFjEKiG6Glein/4+inRdgqyq5EAVIjAqqR6iyDegqH2tSxvY7tf
	Gt1mgDl5cD5SI3dnMgxUmS78unfNBpP7oNU7C54AtfuDK5bQGKKwIorSTTZXYEax
	UzdiET9TbO6eQXs4dm4C32Wl2npWuUtUFWAAtwo8UwiZx+IwGa5WmvVIacY+iDA+
	BQ1Rxw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447ss1032k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 16:01:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HG1PF9004265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 16:01:25 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 08:01:25 -0800
Message-ID: <d218ca3e-20af-47f5-b3b3-3a372c15a1aa@quicinc.com>
Date: Fri, 17 Jan 2025 08:01:25 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IHNlbGludXg6IGVycm9yOiDigJhORVRMSU5LX1JPVVRFX1NPQ0tF?=
 =?UTF-8?Q?T=5F=5FNLMSG=E2=80=99_undeclared?=
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
CC: <selinux@vger.kernel.org>,
        =?UTF-8?Q?Bram_Bonn=C3=A9?=
	<brambonne@google.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Paul Moore
	<paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>, <linux-kbuild@vger.kernel.org>
References: <20250108082855.PkG-_BaT@linutronix.de>
 <CA+zpnLc1PhF7zfWVCj3qezfvYYHbaOc-FyscWS9y74bXZw3rxQ@mail.gmail.com>
 <20250108104525.PJL0eRAG@linutronix.de>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250108104525.PJL0eRAG@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: edxVEE8OVZ_VDtw2PPGpQ_m3OpyVBPf4
X-Proofpoint-GUID: edxVEE8OVZ_VDtw2PPGpQ_m3OpyVBPf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=778
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170126

On 1/8/25 02:45, Sebastian Andrzej Siewior wrote:
> On 2025-01-08 21:31:15 [+1100], Thiébaud Weksteen wrote:
>> Thanks for the report. This is a known issue where the generated
>> header is not cleaned properly:
>> https://lore.kernel.org/selinux/20241127-selinux-clean-v2-1-a6e528c1ff93@linutronix.de/
>>
>> Could you try to remove security/selinux/av_permissions.h manually
>> from your build directory and build again?
> 
> I used a "clean" build directory for this: as in
> 
> | make O=/dev/shm/build defconfig
> | make O=/dev/shm/build security/selinux/nlmsgtab.o
> 
> and it occurred. But since you gave me the pointer, I had
> av_permissions.h in my source directory which did not pop in "git
> status" as it was ignored. Now that this is gone, it builds again.
> I have no idea who this ended up in my source tree since I build out of
> tree.
> 
> Anyway, thank you!
> 
> Sebastian

+linux-kbuild@vger.kernel.org

I was seeing a similar issue. I was trying builds against
multiple ARCH settings. Based upon the prior comments I first
removed the instances of av_permissions.h from my build
directories, but still had the "undeclared" issue.  I then
noticed I had an instance of av_permissions.h in my source
directory, so I removed it, but then got:

../security/selinux/nlmsgtab.c:20:10: fatal error: 'av_permissions.h' file not found
   20 | #include "av_permissions.h"
      |          ^~~~~~~~~~~~~~~~~~
1 error generated.
make[5]: *** [../scripts/Makefile.build:194: security/selinux/nlmsgtab.o] Error 1
make[5]: Target 'security/selinux/' not remade because of errors.
make[4]: *** [../scripts/Makefile.build:440: security/selinux] Error 2

So I dug into the selinux Makefile and discovered there isn't a
specific rule to make av_permissions.h, but instead it is built
as a side-effect of creating flask.h.  So I removed all versions
of flask.h from my source and build directories, and now my
selinux build issues are gone.

Is someone going to followup on the comments in selinux/Makefile
about replacing the dependency rules?

# NOTE: There are a number of improvements that can be made to this Makefile
# once the kernel requires make v4.3 or greater; the most important feature
# lacking in older versions of make is support for grouped targets.  These
# improvements are noted inline in the Makefile below ...
...
# see the note above, replace the dependency rule with the one below:
#  $(addprefix $(obj)/,$(selinux-y)): $(addprefix $(obj)/,$(genhdrs))
$(addprefix $(obj)/,$(selinux-y)): $(obj)/flask.h
...
# see the note above, replace the $targets and 'flask.h' rule with the lines
# below:
#  targets += $(genhdrs)
#  $(addprefix $(obj)/,$(genhdrs)) &: $(obj)/genheaders FORCE
targets += flask.h
$(obj)/flask.h: $(obj)/genheaders FORCE
	$(call if_changed,genhdrs)

/jeff
/jeff


