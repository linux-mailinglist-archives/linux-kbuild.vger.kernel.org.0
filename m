Return-Path: <linux-kbuild+bounces-11776-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENfyNEEcsGkJgAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11776-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 14:27:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F42503BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 14:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0C313457A58
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1833E92AD;
	Tue, 10 Mar 2026 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ay5JzxIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcgcvWcO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3DA39C007
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 12:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144044; cv=none; b=DTuUnQ14V9Je2PDd3/LELZBfvG9KkYhbFG248pXMZK/xWzI/w5Og4Feuj8Cojn3EOwzxgTqgvmpv7xuQ5n+UGeONzzJF2ao2G9Ya+P7kdbwG3j7YXde6Bht5xiHF0dOjqdD8k34GkX0+yLdfAHBO+5LPuzZE6mTwg7n0fM0vnaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144044; c=relaxed/simple;
	bh=D9iZSNFVB24G3xKDmALq4i98bet+bBZhXWdzP2XCqFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMh4KDJvyqE0F9suwM+TM2qBN2hvXj/2Ptf1KA2gJ8Uf4Lubzkn361gymKR8dPMRGyJsi2SDc30/CfHfx3mOk5VCuZs+lRj0P6SOIz7sMhkbYU2MuQMP4iFilc0eL8z0UmGh3qflr+eGn/bBLMsdJ0RKr6pGZw4bQ0TCXjQQEvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ay5JzxIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcgcvWcO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A96K912460634
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 12:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7PiBOFzuzqFI5tzekAPpBmjHMmBsUsnCV3nemX3vE3Y=; b=Ay5JzxIJ7B5VUt/L
	eRInS7bqeb6/zo5enAprotVYESxAGUW0uSwy/SyLW2Hkew7nbf2ecPNL1nVKyerT
	r3IBeU1sESVDJggMolkaiL2wRY2cJzmVM3lIhtelxRflxEqf5FRjT/pHBl38BAl+
	MVPMy23RDykeV+CisliL7/1udU4NaNqn005OtHah8YvQfGwVaE0LcTEkiul6oEGB
	yy8ftgIIoovni3QZdo3qPfSPdvaepqxFMWbI7vVI9k7dgsF8yAqCJaxQeu4frHcd
	x/FhVA/Vy1cWmBiJrisOo7U2rOkmMEcc30dinqof71SjW5Pw5MidAMJoZvzhqRea
	4Knt/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1c5c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 12:00:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77bc8186so3134341785a.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773144042; x=1773748842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7PiBOFzuzqFI5tzekAPpBmjHMmBsUsnCV3nemX3vE3Y=;
        b=gcgcvWcO6QIIhfhMNLjFXW1E2cSKxB1MzFQyaES7PPwnL72J5sQTcNA9uBva27zm3g
         bFVtaOscVVce5llMIEh9XOp4r/KRriLeMRmPeVdsdAHAEeIJCs+oh/gWI0K27rCGpkSt
         X1zfFqWCSF4jXIgt9h+Ixwb0pMCChOzcXQ8Z4IJ2P1Fo6kNpbUXCgi8b8M1/aPkVEMd6
         HCVZQFDUdlxS9unuzokn1l43WA6CdYzFWbE+PbbhnUaqCYG9WUsq5Llh4WNM+QE1/mQo
         BaHVyX6X53lBCmKyKwwivUK/VCFQjnIYIPsEiZgxw/PR+fCzl2a7lx0npH9OICe6JJed
         hgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773144042; x=1773748842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PiBOFzuzqFI5tzekAPpBmjHMmBsUsnCV3nemX3vE3Y=;
        b=uUJV3lbfsPYbDyWStqLfTS7/VL0YC7/kFlhPz28YNPQTBd1TqVuHY1+PQTVihLomBo
         OfX5V1U4rpu9Y5RD0Ua8ue53kvkdS2Pt4klCTMbTU/AH5ITy8v2INlUrbvZTyGuXITnr
         6HMaKC3IyeAH6tu8ZmFPAQY/6am5pUGgmM8Xo6tPUKAakFjCsxLDHyeXq29o/naChI1O
         +iaEwaEn2o4qE6qhRcD/Iha+P84imc1TaSSy2qVRUig1ystvlfzl0GlrhMUcu78QezWL
         OE9OOJqCQOSbQWVL7JMa15hDoIoiOVVkNLbEY62psvkyVQQaQ6hK3CVN2V8Y84hdceQz
         ookw==
X-Forwarded-Encrypted: i=1; AJvYcCXoTt5uo7V2Kbsa0zLULF7HffVDlhJdpSD6MRBKZACdk5rGWiVLa4PsWGKNIdfmfNTy8CFwT2VKECwo6bE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Nhk9K4rJHhHBMhSCZ0PH2X5ha+5G+QvPCxpJCZOzmGqf+337
	aeZU2PY2FOfgO+Feg0V5QvlY5RM1RBrYFU/gSBEjxWcMKnsVaRlPm5IiDnKAAAP0JhsypYAA3wP
	F/oOwsrlooFBIU3SRAklCp5AMP+jarhZDit7Pqr9zuv/aCVRKID6F0HpZQv0ifrN53Ac=
X-Gm-Gg: ATEYQzzE6VxE/i0XCi2/bg/c2D+8fWJMpLy53Mc9fGhKrKrYn/7xc4/mDrFFistZlKm
	Fjj57qXW16EwD5fsGcDCZUdwrku/Hp7/32kU8Yq6+2XJuUnNPD3R9FjzN9Om2jpsxlK83zWxX+S
	SSq1iP4ruE0Vhda23OzJgkNBoH7LXWlDOjy82k0BbukvTOlJbw06Kb1HRvDb/w8Z8p4KAvlU4ne
	KbKslO1eN9N1uN4ManVYrzCND68gxO805gQn1WvtQDlyMGdYmbxGYCJaWHPko7MBWClhQXpRkQZ
	q+VzreQPizwkZl0YvkaXmbZH4szKwQNzsNfiAUaPji5guzpPM6aCDNyxBEmVuTPzMsxTGEo4+Jo
	2Or+lHqjqHYlP/aoDNaRFcQIFZzVBek8gy9S7zTn9Uq5qV623OBlohthtGHMGA3B5c9BSPD00dB
	Lj9RzmT7/d
X-Received: by 2002:a05:620a:3713:b0:8cb:3df5:4b6b with SMTP id af79cd13be357-8cd6d4e9f2emr1884846785a.61.1773144041074;
        Tue, 10 Mar 2026 05:00:41 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:8cb:3df5:4b6b with SMTP id af79cd13be357-8cd6d4e9f2emr1884828285a.61.1773144040247;
        Tue, 10 Mar 2026 05:00:40 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246ed174sm176194055e9.5.2026.03.10.05.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:00:39 -0700 (PDT)
Message-ID: <be927e81-6931-4541-a927-4dc8bbc54169@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:00:37 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/30] tools/thermal: Initialize CFLAGS before
 including Makefile.include
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
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
        Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-4-6477808123b7@arm.com>
 <2ae5e4e5-a860-4f94-9655-67368d558f86@oss.qualcomm.com>
 <20260309100708.GN1098637@e132581.arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260309100708.GN1098637@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bThva8nmlEp7MBG0k5G6kx6LhWztHK9R
X-Proofpoint-ORIG-GUID: bThva8nmlEp7MBG0k5G6kx6LhWztHK9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwNCBTYWx0ZWRfX2455eeT50fdT
 nTDkYFCMyjZO+7VvmeItSpfN8VKCZvO1a3dDSR/kjqZITXDJxhMEMKQ3lAeFA+ifHOLi9Vrz8Qo
 bhR1LRzgUIyKN2FQvfiNtMulpizu3cd/nQAyZTKm4w2y3iNYOilc7xT2MmlAn7ISDLHg+ZR7eV5
 RwFirSNT+u6WtSYG/I2wOCtk1iYE0OUbaBoBqUE3H+ArbL4W3xBD77lX8jWZnyYjwAn+/4H0bka
 GZCLQBc1Ws/alM7aJu4Gy0jNi0vP9pXDmy7T/8jilRfz/efOpKhosSUyx3jB2b4yPGDF/I7CyFQ
 sdoClnTZqyMC0EwL5FrDq/F2+C9Vp6+LWQqeV+y5lHXQj/0ztyJsPnG49JAQvOHG8dfSc4KjsBs
 gS2bPs7xUzvijpIhI+Y77JKT6sC8CwEZiTICu/MvH0SJo1RTKVkoZ6rVzQWysc/qp8NUgTBDP4A
 ztDgRjtT2hexb/aFDqw==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69b007ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=cDDQTrPvQg6LDxInEB0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100104
X-Rspamd-Queue-Id: 390F42503BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-11776-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[70];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


Hi Leo,

On 3/9/26 11:07, Leo Yan wrote:
> Hi Daniel,
> 
> On Mon, Mar 09, 2026 at 09:41:16AM +0100, Daniel Lezcano wrote:
> 
> [...]
> 
>> On 3/8/26 17:46, Leo Yan wrote:
>>> Initialize CFLAGS to the default value before including
>>> tools/scripts/Makefile.include.
>>>
>>> Defer appending EXTRA_CFLAGS to CFLAGS until after including
>>> Makefile.include, as it may extend EXTRA_CFLAGS in the future.
>>>
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>> ---
>>>    tools/thermal/lib/Makefile | 16 +++++++++-------
>>>    1 file changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/tools/thermal/lib/Makefile b/tools/thermal/lib/Makefile
>>> index 056d212f25cf51cd8c02260fbe2ef28dda5e4acb..1890779f1574ebd9015f3001b9bb31d4bc0ae5ce 100644
>>> --- a/tools/thermal/lib/Makefile
>>> +++ b/tools/thermal/lib/Makefile
>>> @@ -23,6 +23,14 @@ INSTALL = install
>>>    DESTDIR ?=
>>>    DESTDIR_SQ = '$(subst ','\'',$(DESTDIR))'
>>> +# Defer assigning EXTRA_CFLAGS to CFLAGS until after including
>>> +# tools/scripts/Makefile.include, as it may add flags to EXTRA_CFLAGS.
>>> +ifdef EXTRA_CFLAGS
>>> +  CFLAGS :=
>>> +else
>>> +  CFLAGS := -g -Wall
>>> +endif
>>> +
>>
>> Sorry, I don't get the comment :/
>>
>> Can you clarify the intended purpose with this change ?
> 
> Sure. Since this series sets EXTRA_CFLAGS in Makefile.include (patch 05).
> Without this patch, the init behavior of the thermal Makefile may change.
> 
> For example:
> 
>    make -C tools/thermal/lib/
> 
> Before this series, the Makefile initializes:
> 
>    CFLAGS := -g -Wall
> 
> If _only_ patch 05 is applied, EXTRA_CFLAGS is implicitly set in
> tools/scripts/Makefile.include to work around compiler bugs. The
> Makefile would initialize:
> 
>    CFLAGS := $(EXTRA_CFLAGS)
> 
> This patch preserves the original initialization of CFLAGS, but changes
> the sequence:
> 
>    CFLAGS := -g -Wall
>    CFLAGS += $(EXTRA_CFLAGS)
> 
> If $(EXTRA_CFLAGS) is set by Makefile.include, it will be appended.
> Otherwise, if $(EXTRA_CFLAGS) is empty, the behavior remains unchanged.
> 
>>   and the 'override' directive below ?
> 
> The override directive is used to override any CFLAGS set on the make
> command line.  This patch does not introduce the directive; it simply
> follows the existing style.  As you can see, the following lines
> already use the directive when appending options.

Thanks for the clarification

Acked-by: Daniel Lezcano <daniel.lezcano@kernel.org>



