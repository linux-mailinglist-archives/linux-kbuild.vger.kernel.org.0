Return-Path: <linux-kbuild+bounces-13729-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1YZiK2m6K2p5DQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13729-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:51:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 477236776F6
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I5SEIU8T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="b/fD+se7";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13729-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13729-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADCF63011785
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 07:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B603E3156;
	Fri, 12 Jun 2026 07:50:56 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B173E1717
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 07:50:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250655; cv=none; b=g0NPWp8NPTFY8RrOGmzb5HyNUDYZ+ERJzIcRM3DPdIOdUmnDAgiOdV1dfGNGttaKu/BkUZLEH4UbA8bEvIXu25Wi3bGyQ19oBN0vZOCV2B3JF0VSIOTSjRMAkIs0SSrbLkmaL+JAJODKQVz9pgTcZrS6wppMasgaHDkzMjQ5s7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250655; c=relaxed/simple;
	bh=XtBD7I/wcbfYFMlmpNh0CZUl/vymWdbw1dvgjEpRpE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgwGWVUCLnLMKAMKxybHQm7rlxzeWU6avgR8jOanoqbDDiECwMqh1gfJIlAg2MwBS2bsLSEjMXpCg2Huui4pTn1V5J3f4yce+SLAB7d4WtElmU/oaDBvas4VA9oq4COrcvm0O5FT9MFKv6ePQrc2P777UnlviUZvtwjMRG0kxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5SEIU8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/fD+se7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39emd2516223
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 07:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zFFhwvPhE9ToJAkALCoRS5tzqSMrukK5siAZ9HiB+88=; b=I5SEIU8T6owUNrWo
	7lurTImZJii/gc5Mf0jzvxW7UqhsFA5cVrnBaqFBPSjaY06gqzKZTB+4SdfruYUC
	kMYRJEE3l52lRmxqI+W3GSv5/WouxM3m1tAt5AM+nxQXr5i0zBRHk3Jtkp2v9RYV
	Yscf3ql3ztSfnVNMFMLjEtU/wfTrGL2L7DZstLvXHQdNyMbzbvEYHyU09ZBiit8C
	B8HIjZjsKXjLkJN82bcUSfA2Ebu32GssC2VGL3oepHtcMH70SmyWRs5VJbLr4/WQ
	BoayNG+aQYgmnPJlmquSgnd7HWQ/vzksBMqZcUaqZw5vYpv0TIKZ7laa0ne5UkSY
	GiEFuw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r724qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 07:50:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7eabc83so569102241.3
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 00:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250649; x=1781855449; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zFFhwvPhE9ToJAkALCoRS5tzqSMrukK5siAZ9HiB+88=;
        b=b/fD+se7Furt1IGKi47J9FXtXkcYT1hzxe+1xtiODsTad9jB+6NZCeTer2UT9CRjdV
         ymWcbuFwpih/OyywB1SX22PSM+IJozgNO43zEjPT+NwV/5eIB0EW+z4WtpUcldrxfyFN
         mNyvsDeo4ua0uCOTqgSFM2dXlU71flYbdoMBT1vFSAVLp4LCCGqMWu0uS5oOugJW2yd6
         RuLrSWqI/cQk2QDeX/0llUkP4OC65grntKgR5kkHPzZHXvWQ/WXgH91y2a3UOT0qYQuW
         xa5u67gGOBAOs1JwgQaLGvy6/E5EgoPx8D7UioESfylwF84ytmcO+YFaOhAvJP2mVWnN
         Q1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250649; x=1781855449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFFhwvPhE9ToJAkALCoRS5tzqSMrukK5siAZ9HiB+88=;
        b=Zj3Za+6TxsRqkgQrNhMXabxBpRxd5HApeuSlb/UEENMUZV4f0kEbZvkHYL6nUTZH2n
         scwif0PiZ6M3bbVnnyUCO2bB64tJ8xhRJfdpd4lpcMC0XaQ76aflzBSswsguz7q+tkr/
         nAcPke6b+cLvO+7xRUBtBvpAIlStuh+5Am5c5TUo6LzywRS399dMI0Irtq/D6y+McIc5
         sJh5L/OqdWtkcoAyy9cpiuXULI0XDWf/5DwdJfVLp/Faz13q+BAE+EKV6PLKf0Le5RPh
         AUrkBTfdcl2hC+0Rbu3NVMQk9gfAa8LXsYp2FCzN0h6ofHIh9def7WjaDWzcSu+kJiMb
         Lwzg==
X-Forwarded-Encrypted: i=1; AFNElJ906/83S8dNtCux0v9JzzX05bSWjX34zuXjn+lGLiWM6pihWHrxHsy3vTjNzKjY/5SpcmYHR3srF2T3+6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrnSBj1GEOmDMgi4Mh1iEza7eMBfI4jyIH5FrRu8ze9iccQ3xa
	zb4HHnqR0EVL/Ai1Cq+t/Nt/Srrv7QIB8GcMhSVXrjggKSw0HkCoO9abiV8xdcJ/Pzf5w8wLufx
	sFhLfY3Bfpdf/vM1cNDraq6DuwBzrAaFDnuqlIT06SVOUXa9DConldDC2Rr3KV5lz8wgJ8GUBZa
	M=
X-Gm-Gg: Acq92OHiUmAccMKVGGPVrAuxjcm2zoXcZp0VliYVv/etEY/SRtJWWmB3/oa+o+FHAoG
	2BeWR5ox4JOwI/9Vh73NIHccgrnxoTa206sfqTbZEUJDZtWI4deEhbM6khuvOPuxTELCAG5Ndhu
	LUPJh2Z6o4LTdEwfcBGYtfjOORkn/QPSpB4w9ZbkOZg1U3VeiZnBlcOlhJlzAijj4MOGD0yWlLQ
	xJ+4D/Qw0D7JuTw8wGoqbKz4mnb2lLmeM2x6VuZC29W3BmiS8xPAsmEoLtWqPfpXcqOWQZerXWc
	hhzTN6N2xTmmHkeF2rFh6LeMWMQ8RMLBzwwAr+LyiiKXZKeDdXm3cWfaOu0GdHV8hcP6bcGdmL5
	3Z8UANnIbVBhQGtpcXu01oRxRdVX1XGKdPamRhkCzbH0VKhfwJl6g03s/W8DuNT75gWt+6JVW+z
	cg1dbOkxVk9wE3fNUgB18gmC2pwXQv/Z1cME0=
X-Received: by 2002:a05:6102:5e88:b0:631:4580:6a46 with SMTP id ada2fe7eead31-71e88c4f8c1mr731825137.17.1781250648980;
        Fri, 12 Jun 2026 00:50:48 -0700 (PDT)
X-Received: by 2002:a05:6102:5e88:b0:631:4580:6a46 with SMTP id ada2fe7eead31-71e88c4f8c1mr731821137.17.1781250648555;
        Fri, 12 Jun 2026 00:50:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c6c9f7sm3928361fa.18.2026.06.12.00.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:50:47 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:50:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        Rob Herring <robh@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        "Derek J . Clark" <derekjohn.clark@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Subject: Re: [PATCH v6 6/9] dt-bindings: connector: m2: Add M.2 1620 LGA
 soldered down connector
Message-ID: <ttik5qwtbdqgtuu2hsnqsuok75ofs5itlnkzevawazw7lckuem@l5ogmc4b4u42>
References: <CAL_JsqJXrHCJt770bJkMmAUhirSF3kHjYwSzkG7cXp7-eys8Rg@mail.gmail.com>
 <6aef3xxjjd4nbgrfx6jc6jt6rpqmttoui6hil5zqgdpas2j6gj@ie6j72orenou>
 <fsvmmgoe5wslmxebhrrwmdg2ldcmhzvj53gjkdfnfg2m2rz2lw@dcfboaakz7ae>
 <bguhzabwryayyqkv4ilzwr3ixwv6bzxncblo3ircz2wm3fs52k@66zvcrfcb4oe>
 <blhm4csjyw6r667cleljgzd6rpwagttjo5rau7wjrlnjakq2qm@ekyhc4jvwmwf>
 <m44mupdmg7kgco62n4evcviagqo7wwgyt3gybugbxwesd4ekjz@o24r6v4tpezc>
 <3faffec9-dc9d-4eec-a652-a84d30d85c96@app.fastmail.com>
 <cvqdbqnzjmzoowxkvz2lyv4avropu5jw7h2r6zng3ecf245hgg@fsysjqflqd35>
 <acv2f1qbqu4PlSL1@linaro.org>
 <eftahohsx3bbvmgxuciofjjcrybnsm2qc752hwyt65rb2uwaon@h32nh5fcpo7p>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eftahohsx3bbvmgxuciofjjcrybnsm2qc752hwyt65rb2uwaon@h32nh5fcpo7p>
X-Proofpoint-ORIG-GUID: tyvC5BfjN9s2-2CYw9dGYtcB4Cr3tgwx
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2bba5a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=GUbesZiWAAAA:8
 a=VwQbUJbxAAAA:8 a=XDz2VUyccH_bepKxGScA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=-cUrBSrepuC47jtK_ZRV:22
X-Proofpoint-GUID: tyvC5BfjN9s2-2CYw9dGYtcB4Cr3tgwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfXwo4G5ebz6iTP
 t4Zm+y9pq+blJ1yy+FSrt13KzAIOvzrt2VCpb/aZZxAc30oQ+tTwX4L59yFbqPHtiswWuIVlSnX
 HAJbfpAwNioNqcZym7Ez7wAxFUABtG/1n706Yt+JvjdVqZ2EO1aGr/JlIa276bKPXEYJsT1tfiH
 ROFDR6UPQ/5ZfPIlHcA1+SMEfEvbBptWB03XsK4IoblOfNURSavCIPk4OWdOfUwQDQz8PQ/lUhR
 bkvJIATlbFhEJYjWNjbxGTN9mQluVtHG9JU/drPhY+LTDcK4tsaO0Tggq5PNpx78RwPQ8wJIKNv
 fccQ1MtxmIWcRzJviawE9yPfFRR4Gi28KQrTfy+nTNPKuS5CFe2A5do/mcrsO6Q5gcx6pyQKr4p
 p3vkLkGi0K22qRu+/TFRXRE3zRWZpA2P+Ij+EGvXtFXV6fUQbuUTtE9vKkZy0k+/sWjcw6BOF1T
 qkoqKPeLikuoZOLVS5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2OSBTYWx0ZWRfX/YdJ4D1m0d6t
 U8VsWYsCjQGxJfpbNq0z1dRtUpX+r0rJtQBP+cKTT5sCqYNtC39LO207i2BgXJWMObPvoofRQEJ
 0In9xl/fsnYlRvHn2hc2f6d0pmyWcgQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13729-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:mpearson-lenovo@squebb.ca,m:robh@kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:nathan@kernel.org,m:nicolas.schier@linux.dev,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:derekjohn.clark@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:brgl@bgdev.pl,m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:linux-serial@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:derekjohnclark@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,squebb.ca,kernel.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,linux.intel.com,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,l5ogmc4b4u42:mid,sparklan.com:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 477236776F6

On Wed, Jun 10, 2026 at 06:44:59PM +0200, Manivannan Sadhasivam wrote:
> On Tue, Mar 31, 2026 at 06:29:51PM +0200, Stephan Gerhold wrote:
> > On Wed, Mar 25, 2026 at 05:36:08PM +0530, Manivannan Sadhasivam wrote:
> > > On Mon, Mar 23, 2026 at 01:23:07PM -0400, Mark Pearson wrote:
> > > > On Mon, Mar 23, 2026, at 12:52 PM, Manivannan Sadhasivam wrote:
> > > > > On Mon, Mar 23, 2026 at 06:45:15PM +0200, Dmitry Baryshkov wrote:
> > > > >> On Mon, Mar 23, 2026 at 09:26:04PM +0530, Manivannan Sadhasivam wrote:
> > > > >> > On Mon, Mar 23, 2026 at 05:14:30PM +0200, Dmitry Baryshkov wrote:
> > > > >> > > On Mon, Mar 23, 2026 at 07:14:25PM +0530, Manivannan Sadhasivam wrote:
> > > > >> > > > On Mon, Mar 23, 2026 at 08:39:55AM -0500, Rob Herring wrote:
> > > > >> > > > > On Mon, Mar 23, 2026 at 7:16 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > >> > > > > >
> > > > >> > > > > > On Sun, Mar 22, 2026 at 06:37:13PM -0500, Rob Herring wrote:
> > > > >> > > > > > > On Tue, Mar 17, 2026 at 09:59:56AM +0530, Manivannan Sadhasivam wrote:
> > > > >> > > > > > > > Lenovo Thinkpad T14s is found to have a soldered down version of M.2 1620
> > > > >> > > > > > > > LGA connector. Though, there is no 1620 LGA form factor defined in the M.2
> > > > >> > > > > > > > spec, it looks very similar to the M.2 Key E connector. So add the
> > > > >> > > > > > > > "pcie-m2-1620-lga-connector" compatible with "pcie-m2-e-connector" fallback
> > > > >> > > > > > > > to reuse the Key E binding.
> > > > >> > > > > > >
> > > > >> > > > > > > What is LGA?
> > > > >> > > > > > >
> > > > >> > > > > >
> > > > >> > > > > > Land Grid Array
> > > > >> > > > > >
> > > > >> > > > > > > If not in the spec, is it really something generic?
> > > > >> > > > > > >
> > > > >> > > > > >
> > > > >> > > > > > Good question. Yes and No! LGA is not something that Lenovo only uses. Other
> > > > >> > > > > > vendors may also use this form factor. PCIe connectors are full of innovation as
> > > > >> > > > > > the spec gives room for hardware designers to be as innovative as possible to
> > > > >> > > > > > save the BOM cost.
> > > > >> > > > > 
> > > > >> > > > > innovation == incompatible changes
> > > > >> > > > > 
> > > > >> > > > 
> > > > >> > > > Yes, I was trying to sound nice :)
> > > > >> > > > 
> > > > >> > > > > > This is why I do not want to make it Lenovo specific. But if you prefer that, I
> > > > >> > > > > > can name it as "lenovo,pcie-m2-1620-lga-connector".
> > > > >> > > > > 
> > > > >> > > > > Depends if you think that s/w needs to know the differences. Hard to
> > > > >> > > > > say with a sample size of 1.
> > > > >> > > > > 
> > > > >> > > > 
> > > > >> > > > Sure. Will add the 'lenovo' prefix then.
> > > > >> > > 
> > > > >> > > Is it really Lenovo? Or is it some other module vendor, whose LGAs are
> > > > >> > > being used by Lenovo?
> > > > >> > > 
> > > > >> > > I remember that DB820c also used some kind of a module for the WiFi card
> > > > >> > > (which might be M.2 compatible or might not, I can't find exact docs at
> > > > >> > > this point).
> > > > >> > > 
> > > > >> > 
> > > > >> > I don't know. These kind of designs might be reused by several vendors. But
> > > > >> > considering that we should not make it generic, I'd go with Lenovo as that's
> > > > >> > the only vendor we know as of now.
> > > > >> 
> > > > >> ... and later we learn that other vendors use the same idea /pinout,
> > > > >> then nothing stops us from still telling that it's a
> > > > >> "lenovo,pcie-m2-something-lga". 
> > > > >> 
> > > > >
> > > > > How do you possibly know whether a single vendor has introduced this form factor
> > > > > or reused by multiple ones? Atleast, I don't have access to such a source to
> > > > > confirm.
> > > > >
> > > > I've not really been following this thread/patchset in detail; but want me to try and check with the T14s platform team if this device is specifically made for us (Lenovo) or not?
> > > > I doubt it is - we just don't do that usually, but I can go and ask the question if it will help resolve this (with the caveat that it could hold up the review for a bit and I may not be able to get a straight answer)
> > > > 
> > > 
> > > I can drop this specific patch in the meantime.
> > > 
> > > > My vote (for what little it's worth) would be to make it non-Lenovo specific. Then when the same part causes issues on another vendors platform I won't get asked questions about why Lenovo is breaking <other vendor> :)
> > > > 
> > > 
> > > Even if Lenovo prefix is used, it won't break other vendors. Just that we will
> > > end up adding more compatibles.
> > > 
> > > Anyhow, I'll wait for your reply and drop this patch for next revision.
> > > 
> > 
> > If you need a vendor prefix, I think "qcom," would be more appropriate
> > than Lenovo. This form factor is used by most vendors for recent
> > soldered Qualcomm-based wireless cards, not just Lenovo:
> > 
> >  - Dell XPS 13 9345 has exactly the same soldered M.2 card, I assume
> >    there are several other vendors as well.
> > 
> >  - https://www.sparklan.com/product/wnsq-290be/ is a third-party
> >    (Qualcomm-based) M.2 LGA 1620 card, in the block diagram the
> >    pinout is called "QM.2 1620 LGA 168pin".
> > 
> >  - If you press F9 while booting the ThinkPad T14s, you should get to a
> >    screen with "Regulatory Information". For the T14s, this screen says
> >    "Contains FCC ID: J9C-QCNCM825". This is the WiFi/BT module in the
> >    soldered form factor. If you look that up on the FCC website, the
> >    applicant for this module is "Qualcomm Technologies, Inc.". This
> >    seems to be some kind of "modular certification" that vendors can
> >    reuse/adapt without going through the whole process again.
> > 
> > Perhaps you should ask around inside Qualcomm? :-)
> > 
> 
> Sorry for getting back after this long. I did ask around, but our HW folks are
> saying that Qcom is not the first one to use LGA M.2 modules. They claim that
> other vendors also do that.

I think, the idea was that there is no single standard for LGA modules
(please correct me if I'm wrong, I haven't checked the latest PCIe
standards).

> 
> But for this specific card, it should be fine to use the 'qcom' prefix as
> apparently the module was supplied by Qcom.
> 
> I'll submit the bindings patch together with DTS change for T14s.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
With best wishes
Dmitry

