Return-Path: <linux-kbuild+bounces-11695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFRoMcaHrmnKFgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11695-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 09:41:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C16823598A
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 09:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DE94300877B
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 08:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38F72D9481;
	Mon,  9 Mar 2026 08:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdsdnzuP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQlbtZwo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29BE238C0A
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 08:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773045682; cv=none; b=Dx0p4M/WXAor5fB3QFtqqNEOkahJCswi8yYIAS2CRrZ8P3Z0LTuZXHseSyHjJm7lGaEaFaOXR/YCJL+BnQkucOzZ+GnbnuJw6NiicX9w9WD7zHr65kSD6mX8Kk7n5Tv5IZQS/eKwViKN1sNYjpuNwarj+kSlJTM9zPUc6y+Hw3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773045682; c=relaxed/simple;
	bh=QmC/1aZi1KMAI8qInvYmgDZW0GLqK+zvjW6rUzsfpMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXwnNEYPbwCGkflAjBeaHkFUBcAMAWHHVhdRGilajwaw+1JLfIJYdS+/+TCdhN2puWkdEG+FgtAmUCBtucD0SrqF/o4wyKpdBqDEDi51chHLc10IE3ZVfu3/avyArfzlsncPi84b4aUv7otG+GgwytiZfefw5VyJDXJsGbdupD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdsdnzuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQlbtZwo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298Wch12663851
	for <linux-kbuild@vger.kernel.org>; Mon, 9 Mar 2026 08:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xEa3WzuEsGwlSu+tKPUtbqO0QxG3vgk+PmyiHeY+Zck=; b=SdsdnzuPVbNbaNE+
	W1d/LjZ27mcA+rlHb8qR7wYcsZhPHjwjUbo+SpJncaS3aMK/1HYPDbbI0LcwepaQ
	30GJpjWD+PkJVv2pScUeOl5aWUQbl9z++HUSnRjG66CpBHebZOgbWCXdYicZd1It
	iwM4OeGoSO5Xl9iKb5jKkifS8nh/lUEGu5E+EwK+Wacd6GAX+F3V/donu8lkQp0V
	Sa/ijwZcGApL/bfuueQ3N31nGnyw7JJBY1ikDiYQZY3SGTL9vUy3rF514Nt+rcXp
	nQK0esTLpI1LaVRUxRZwgsG7H5L+eXgLSMRKYF7M68zAJF2CCXXmvYJPvf6dc0u2
	gnNa5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpmvcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 08:41:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fec8d44so660403785a.2
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773045680; x=1773650480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEa3WzuEsGwlSu+tKPUtbqO0QxG3vgk+PmyiHeY+Zck=;
        b=bQlbtZwoYkK2UuwXiLhOB4YG+aekbjZkk8/6JPbtkTA8447mhi0St6zcOTbPPqwHWk
         aBKkeqHx7RgKoOsmWVbrY+S4/A5bMifcnBYskgLrGd+8hP/UYBKrcxFb+/QInmpGiwM5
         fbDoLbRfCtTLJb+7r0O37NTtXIQ9LD56Wb3v5OFFyYahpjxueVHKjbTj1WRrXuzW1egL
         mN26aFUhDzAcOdMCtVQrG1lHxmO0SYg043OrYGSwuPkJx9ZtSLY5uWSIL9X+YXquBkGd
         BW14wXNWIXOTYXVBzVonr0W9Atd6modCaBymlIhXvbMiVUcI9+LdCbo3gLcPU13JC6xC
         b5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773045680; x=1773650480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEa3WzuEsGwlSu+tKPUtbqO0QxG3vgk+PmyiHeY+Zck=;
        b=mZPoT/3Nd9JWQhf+Yxyi/Az8GEizAp4fZOwK7sF1KJUe4i763Q9hiOvsv6obBk/Lbw
         bat7WHC0H0RAgSK28VPYoUdfXWMbRchrcZXuF0hhbIIlPaWkhQu30vrlT2nbIBPwC4UW
         p0aapEQqOh5HzL9S6cVJaUpVZftth5yJjbbNqp8q9IR59f/CKDlcPgyOHmvIWKar9RII
         knfQoHxGGQ7aKh0HJT5RdXqst61VLZTKgziqTkjZgxN3iznAbI20eiww2l1HpuqcO1xL
         fvKeCnnChMosIVorJ5ur4ikIydkNw3dX6KuftP49chrHmr/i8UL58+RM6QE8xbHjpqco
         t0Ew==
X-Gm-Message-State: AOJu0YwXtdeTsa3uhNgoE8X5eWpC+CjobYKRSXtLokgaE0DRFkEgwSzR
	wEHoPumXMeTITJKwHUCf9coNjP0a8KeeRu7KIY2f34W+7xgEk5RPBniSg1mqBU0iTJ8rF50f+5Y
	VY8qL+mtyBm9Z6bx6AfAWfj9v1iLiXN5W/8LUoQrVJaprROw5VDhMYyAoGXwF4VtcmJE=
X-Gm-Gg: ATEYQzy3F+b7qwiuMuH7vVENR1dUnOs7xs6vOhx+POziXhfYiy4foAwZYuHy0ij5TKx
	6ZFHVQ1emZHG895YK+KFHmp2snUrj/zI8rao46ywV8zFF0QWKGoGx6QrFiL0QZdyre04JPIMBQ0
	q/pAyTeziIQE9PsNlevQBG4CbTPUxlu+4QXwwj6YScxlDrCSaQhVX4rH+j/lyPlMo2iNUiNBVm0
	qVIuC5BScfPLdB4QnbxLnga1JGL85wRxyPFo4mfYyOYJQG3YFWLCllAbyIM1MQJ691ONIZ+A5oF
	pFOuh9bccooifMb6KGh417uZZ4CSkow1nqEs9eRdYPmjK8uZRankDhAEsoS3ZDPqY5fveNzahCV
	kobjHerGvIfmCsM+YIan7hHMsoDRlCVomun7Ts9/n/47v+rasORSVioqL6nPi+dUBlkN2N80+4w
	nny3+yQ9/a
X-Received: by 2002:a05:620a:1707:b0:8cb:b062:c2e5 with SMTP id af79cd13be357-8cd6d386908mr1323664185a.27.1773045679957;
        Mon, 09 Mar 2026 01:41:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:8cb:b062:c2e5 with SMTP id af79cd13be357-8cd6d386908mr1323656285a.27.1773045679422;
        Mon, 09 Mar 2026 01:41:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a946978sm88693385e9.1.2026.03.09.01.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 01:41:18 -0700 (PDT)
Message-ID: <2ae5e4e5-a860-4f94-9655-67368d558f86@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 09:41:16 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/30] tools/thermal: Initialize CFLAGS before
 including Makefile.include
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
        Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau
 <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        William Breathitt Gray <wbg@kernel.org>,
        Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
        Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,
        Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, bpf@vger.kernel.org,
        linux-perf-users@vger.kernel.org
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-4-6477808123b7@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-4-6477808123b7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA3OSBTYWx0ZWRfX91AG3i3apXdz
 nynU0zRm14h0p4MxKSLlgCS946955/YL8IKJt1z8AD9MsQhrAcPvVRVdq6wFtBzWFlDwdKVJfXA
 X03MzNqZCNHFgchgybq4ncrUUXmReft1aDAWUJng2qLAsRpPsQexWSUbjJtkBRpYGsGvxKnNvsK
 hIKopyuWWVLrEkpqWUKP8GwJKsAvFZ/4ipjMIADo0Yt9+d3ezXjjj8geGXg5zy+bHXjTatvD5eA
 IPp4xt+HJFw+pEJYzpEzLPk3CuofvHVcW2VT2BNILsj9NmsD/lRsJh2r7FePfROBYHOzs1gqhVi
 nZ5O9FtUHhZEi1djQiVRW9d94hCNuVDFwK2uPr8P3tlEHrFfJPoBndTtReNY79zXso0MOAJrA6t
 RfJKEmbkxTbjytzG1BbVHLOLwGuT3tgXdHLP4fT+IYyJJtvbmtj4uAjv1Rltq3RGuzpty+1GZe/
 jX1WOPFltpbHG9duKPw==
X-Proofpoint-ORIG-GUID: RZh8RgCu3thRA5pX_skSzSfpgrlMxfic
X-Proofpoint-GUID: RZh8RgCu3thRA5pX_skSzSfpgrlMxfic
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae87b0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7CQSdrXTAAAA:8
 a=ZAywS_63PuHDt0GrRrsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090079
X-Rspamd-Queue-Id: 1C16823598A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11695-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[70];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


Hi Leo,

On 3/8/26 17:46, Leo Yan wrote:
> Initialize CFLAGS to the default value before including
> tools/scripts/Makefile.include.
> 
> Defer appending EXTRA_CFLAGS to CFLAGS until after including
> Makefile.include, as it may extend EXTRA_CFLAGS in the future.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/thermal/lib/Makefile | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/thermal/lib/Makefile b/tools/thermal/lib/Makefile
> index 056d212f25cf51cd8c02260fbe2ef28dda5e4acb..1890779f1574ebd9015f3001b9bb31d4bc0ae5ce 100644
> --- a/tools/thermal/lib/Makefile
> +++ b/tools/thermal/lib/Makefile
> @@ -23,6 +23,14 @@ INSTALL = install
>   DESTDIR ?=
>   DESTDIR_SQ = '$(subst ','\'',$(DESTDIR))'
>   
> +# Defer assigning EXTRA_CFLAGS to CFLAGS until after including
> +# tools/scripts/Makefile.include, as it may add flags to EXTRA_CFLAGS.
> +ifdef EXTRA_CFLAGS
> +  CFLAGS :=
> +else
> +  CFLAGS := -g -Wall
> +endif
> +

Sorry, I don't get the comment :/

Can you clarify the intended purpose with this change and the 'override' 
directive below ?


>   include $(srctree)/tools/scripts/Makefile.include
>   include $(srctree)/tools/scripts/Makefile.arch
>   
> @@ -39,13 +47,6 @@ libdir = $(prefix)/$(libdir_relative)
>   libdir_SQ = $(subst ','\'',$(libdir))
>   libdir_relative_SQ = $(subst ','\'',$(libdir_relative))
>   
> -# Set compile option CFLAGS
> -ifdef EXTRA_CFLAGS
> -  CFLAGS := $(EXTRA_CFLAGS)
> -else
> -  CFLAGS := -g -Wall
> -endif
> -
>   INCLUDES = \
>   -I/usr/include/libnl3 \
>   -I$(srctree)/tools/lib/thermal/include \
> @@ -56,6 +57,7 @@ INCLUDES = \
>   -I$(srctree)/tools/include/uapi
>   
>   # Append required CFLAGS
> +override CFLAGS += $(EXTRA_CFLAGS)
>   override CFLAGS += $(EXTRA_WARNINGS)
>   override CFLAGS += -Werror -Wall
>   override CFLAGS += -fPIC
> 


