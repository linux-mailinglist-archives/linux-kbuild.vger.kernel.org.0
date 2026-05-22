Return-Path: <linux-kbuild+bounces-13307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JQ4Ekt4EGoZXgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13307-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 17:37:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A01925B6FE6
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 17:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B59E530293CF
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2026 15:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399462D839C;
	Fri, 22 May 2026 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fm6vL8+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9O07exG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B686331
	for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463920; cv=none; b=lNXmh8W574ReCMDUxbg+6LVXMn/emMYmz1D7z52EF0c4roGYgYJFZtaW2UP18pNO2sTFiXECdDZKNvXupz/7K+S7bQPTSzNjY6f4tk56ze+pVC/Fp4eE4ev3fcHRurIMg2pbRZ/uu6dqIGPweZvQHDZ7FV0v3LTs+1tZJS+YJTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463920; c=relaxed/simple;
	bh=8Ot/0WsuhnbKVOahkOIW0lfMxtYNZMgx16RXzInlOfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEXbcCUBEeW9dLrqzQATkpOXoShbGeKXPtP+hnspAQGrG8bw8gJcwWJJ5L5bfB3U2F0AuftMaYmqykIy4DjoD4ZTYHPg21A+K0jABgJOZanekFYAfa3fS1Ao8gGPA0oIKGuVyPbNMzY+nRaRKEu4YGfKtgX3cebYnuNUolxJrHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fm6vL8+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9O07exG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9C5ZW3005097
	for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 15:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9KXtf266vJmz9A/cgG4Ca26t
	h7q6Y+F+qGMVIsUeo8o=; b=fm6vL8+2Zo0HS15g6J6tY+UzsRfLwp6+fQTqCI5P
	U5odKzd6msgkYYT4Rf3UmWSQT5Ggj6V2DCZ9BKlkUoS3nxuC73g2wY2W79p+3r+b
	wfeXHuvvOYMR4X8bAElYmX3X+Rf78/cBWp5yvj6igz7l8Q+mQjiJ6QMFiMes6czJ
	J9Rg2OI3hd704MWbq6ZM+UdqS5It7qORNUmsZbpCks5t2xzQ3KXn4L2iqLhj8tL+
	GEl+ocN0OTWCNGF52SjtfHW7CwHEwFUK20muUvt0fnUncAHLmJGMCRiX3Fu9MHE4
	888PSW16nz5Bn45h9fkfxCE0QVzN2Y8j3iFuymozPJ/aIw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtasc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 15:31:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so12398074eec.1
        for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779463917; x=1780068717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9KXtf266vJmz9A/cgG4Ca26th7q6Y+F+qGMVIsUeo8o=;
        b=X9O07exGl/HQG1870z1OPbqJBOMlsCgSMIUxVKa5djj0idtR1mVJ5furhRl36LBDbS
         ALUdYIObvN3FBtlvMpngWzzE8+x6xTVaFy3NotmBbh3jgrKxAYTFaPHMhWD9CwwDO3vA
         VkJ5Mb2Qmy8GoN/S3F+yY5L8MssgYiVx/+6dSblC36koSkXvAbOkG4EdrvQID8/p1IpV
         rU7v2bI7gVZmgop0GL89I2vjEWQvrXPCtNitlnO/iqQsB4Yw3w0GjU+8kiB1YHMq25+E
         y+utXfpa87JsWXZj3mX4pBqHrOYSABGoUjeN2x2id+vkjLaav1jj0AgSuxB8k04MDcEf
         u3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463917; x=1780068717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KXtf266vJmz9A/cgG4Ca26th7q6Y+F+qGMVIsUeo8o=;
        b=iWwtEFaQupLum3OWCl7QpARQW8LSFjBH+AXGIqqNUP4DjEcmeTRqELsASxajMVUCCr
         +ao0nmpUuWQYmUfkgunC5nNlR1PFuoqjWv8btaZkbgLp7h89r5oCa2CXK0B9tRJjvHT6
         ruHM6bI+FRpVXuuxOpP8oaked9PIcIDEdCwyQWRKnHuKO02HACJR9VMla5ynhhMzezUF
         WNognJRrdPQX/TSE42x1RK5CxgAuxmlMVdxGrRIq6yURWH7arVd/WJ7mfvXeHY7er5CM
         umyFB0fc+3gqV1/J99b9jLatgAMAmudcN7rfWpMe2WlLTHcqCXb6SzNxAWiRXFC4vi/G
         kT7A==
X-Forwarded-Encrypted: i=1; AFNElJ9sdVgZtOQyXKX33+4TkZhgE970W5M+8b0t7exC86mIQcJdU5o7RTMr6p3QN3EqKxome0yqT4vOnFP5Yw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKNI+vI+3e9cv1dFEIkh8sf0kzhyTrUQoYirVKAhelTfwOp+Fh
	REMDLsozH/IfIpdKg26v044I5ja83R0eKwgoHQq6Jb54jMyxkVJcICeRN9az199hhV5aNoH6pBw
	3xofnYSu7ADm7rLk3cdmZv6mpSD/fXHZaONYanRWjyOvNlf6RS0WR4GnVnFzMM7WeTEc=
X-Gm-Gg: Acq92OGyx701MCk/TG7Kk8vLOIUOb/owqXaAIf/3ErOsUod6UOe+Oos8i2kQRpnk2dV
	mwRSXptfwYYKBzuH+DQtKPGR5Rqx/PqgXFlqVKTdEY+sfV5thE8X/Bh30aXTfRav7LhU/LvH+Ps
	mX3eUHUqynlqtLI/N82tH0W5gWBxf5Ek5J1YmBWT50apbL1z7SSthtO8zdqU7tTHOpj/IpW2SO2
	bM3s6lFZDz0kRMbTu+4oMe9wlx9lvtium3Sh9XCgcv4Ymxkiq4RKY7i+RDob6oL7I2q29zNd1VU
	VEnWjsDFc5E3bn75kyykZ8/qjzIRsHAY9JERv1Rsu4617jTFTaZVWf8o2auZ5QxTgOskOlR1DWW
	Bf7s1T+2GAmrMU/9s96J6sHiJELMJgwN+cGqp3x62
X-Received: by 2002:a05:7022:626:b0:134:a731:e759 with SMTP id a92af1059eb24-1365fb626b5mr1543393c88.40.1779463917124;
        Fri, 22 May 2026 08:31:57 -0700 (PDT)
X-Received: by 2002:a05:7022:626:b0:134:a731:e759 with SMTP id a92af1059eb24-1365fb626b5mr1543375c88.40.1779463916508;
        Fri, 22 May 2026 08:31:56 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13669c6a2adsm1262626c88.0.2026.05.22.08.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:31:56 -0700 (PDT)
Date: Fri, 22 May 2026 10:31:54 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org,
        andriy.shevchenko@linux.intel.com, rdunlap@infradead.org
Subject: Re: [PATCH v3] kconfig: add kconfig-sym-check static checker
Message-ID: <7w3e3sgiqe4b7fjposkrhdtde5b2qikhoqghvmm2leieuyqyoj@qpkucbwepyz2>
References: <20260521204435.534773-1-andrew.jones@linux.dev>
 <f3eb96da-cbe2-4d07-a586-9eade3bf39cc@gmail.com>
 <numrmmjpnheiawifcjhc5zustrlk6bfv5wtr6ibdzbf7mq5o53@x6wf4zv7jhsg>
 <d42fa51e-8dce-4ef4-be23-0e6b0642414b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d42fa51e-8dce-4ef4-be23-0e6b0642414b@gmail.com>
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a1076ed cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=aq5bbyOFhsx15KWae34A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1NCBTYWx0ZWRfXzkOlNRJT4BEY
 egt+eVLC2I9lDHR2Hqr+scqEBuPM3XCjs1v4zCz5JGMdreLs3gJnKCY7j+fBzKdO0qpTS/dZC0f
 Ro9yjgwmBVZanNXoU2yjVeun4zJWruWiKSG9raIz/SXapZhiA4Ywv6xMRRMpC92qNJOc12pn2Su
 p3UBavS0/yoWpxyd1YAQtbUrCUfhb+uAWRf5vw8vWtBBjJUsB7nG9rVAvBuRNhUKb7Yn9NsoOdT
 Fx5mi6fHcmiPc+Ocx0S/+JTUUGmAyuFLYUt2XdpdT16uIlrpy9Y7TW9xIXl3HjfZp2P7yxy68Ro
 szdhdEe6shC0huUg7SmBXd12dYyN21mfK9cOdVKyDiG6d0HvD9mMlF324tmrbU4Fub3TLFUeQyn
 PQMum6ogvpvrvJ50CyKb3k9uAmNVFmj8me+S48TbYqKr+B8SuAkPBIlaX5oFqNHAOo/bJ+J4B2g
 e59q504CopqylGOcVvg==
X-Proofpoint-GUID: NPaTYUPyDgONZRTzqiPmJO4VFcEIFf4-
X-Proofpoint-ORIG-GUID: NPaTYUPyDgONZRTzqiPmJO4VFcEIFf4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220154
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13307-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.jones@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A01925B6FE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:08:38AM +0100, Julian Braha wrote:
> On 5/21/26 23:31, Andrew Jones wrote:
> > This script is looking for symbols, and symbols
> > should never be quoted.
> 
> Good point, out of scope.
> 
> It looks good to me otherwise, so:
> 
> Tested-by: Julian Braha <julianbraha@gmail.com>

Thanks! I'll also send a v4 of this patch to resolve the final sashiko
comment since it looks worth doing.

drew

