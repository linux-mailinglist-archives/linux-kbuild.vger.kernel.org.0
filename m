Return-Path: <linux-kbuild+bounces-10796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJd3FbHocWkONAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10796-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 10:06:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB98364363
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 10:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DCA3B5E4706
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 08:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D7734A3D6;
	Thu, 22 Jan 2026 08:59:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A331D2DECCC;
	Thu, 22 Jan 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072362; cv=none; b=fXwJuDk/xI/2q9ps2Ko9HCWADiwVMFKoCZEQZzpygdU52Rkqr4uhjiaDp+lPN3Vi+mWGO95jKFnu5yrj5bkfyTuWEk7zbMIreSvsDfGWKkR4RMTKi3H3x7P1LgwWxs+YNlWQalCXD57PrrPjamqYq+Cz/hA5cK9fBqeidb9d7Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072362; c=relaxed/simple;
	bh=+rjpisjkzPUYIT2zRcWnlhYCkdHjvbFLRZNnCbfvx8Y=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XYYwG81/O5o9Zt1BEgY2qr22d3mg0qfZXjQ9BIIQ99RYgZL5EfqAlef/6XqWDUghJJS7HgzHpCAQWuGtXhXdrtblotE7cZ52rVuEkcoSi/TyYTV3wrsozIIBxm0T0zb+C6+GJpj3Cz3AjELBNgePX1gbRft1W0GhwdUDFOABlZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxisLf5nFpcHULAA--.37219S3;
	Thu, 22 Jan 2026 16:59:11 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxB8Hd5nFpdPYqAA--.6374S3;
	Thu, 22 Jan 2026 16:59:10 +0800 (CST)
Subject: Re: [RFC PATCH 2/3] kbuild: Make sure to generate config file
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260120123730.30487-1-yangtiezhu@loongson.cn>
 <20260120123730.30487-3-yangtiezhu@loongson.cn>
 <20260121234748.GA2137017@ax162>
 <1bb9876f-cb1f-e088-cb9d-f76032f0d395@loongson.cn>
 <20260122051558.GB3770486@ax162>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4a929e46-0c5e-196c-ff53-8bf2785b3688@loongson.cn>
Date: Thu, 22 Jan 2026 16:58:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260122051558.GB3770486@ax162>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxB8Hd5nFpdPYqAA--.6374S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFyDCF1rZrWfGr43CFWxuFX_yoW8CrWDpr
	WrA3WUKFs5tF1rAF4Yg3y09rWYvrs2gF15WFn5t342yr1YkryayFs3urWa9F1DZrZ3Gr4Y
	qFZYgayavFW0qagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
	VUUUUUU==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.26 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DMARC_NA(0.00)[loongson.cn];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangtiezhu@loongson.cn,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-10796-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[loongson.cn:mid,system.map:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: EB98364363
X-Rspamd-Action: no action

On 2026/1/22 下午1:15, Nathan Chancellor wrote:
> On Thu, Jan 22, 2026 at 09:14:07AM +0800, Tiezhu Yang wrote:
>> Currently, CONFIG_IKCONFIG_PROC is set by default on LoongArch,
>> the above error still exists, it checks /boot/config-* first,
>> here is the related code:
>>
>> tools/testing/selftests/bpf/unpriv_helpers.c:
>> static gzFile open_config(void)
>> {
>>          struct utsname uts;
>>          char buf[PATH_MAX];
>>          gzFile config;
>>
>>          if (uname(&uts)) {
>>                  perror("uname");
>>                  goto config_gz;
>>          }
>>
>>          snprintf(buf, sizeof(buf), "/boot/config-%s", uts.release);
>>          config = gzopen(buf, "rb");
>>          if (config)
>>                  return config;
>>          fprintf(stderr, "gzopen %s: %s\n", buf, strerror(errno));
>>
>> config_gz:
>>          config = gzopen("/proc/config.gz", "rb");
>>          if (!config)
>>                  perror("gzopen /proc/config.gz");
>>          return config;
>> }
> 
> Ah but it still falls back to /proc/config.gz though, right?

Yes, so no /boot/config-* seems not a big deal.

>> Yes, this works well for LoongArch. If there is no need to do this for
>> all archs, I will only touch arch/loongarch files.
> 
> Until there is a wider insistance on including these as part of the
> install target, I think it would be best to keep this in arch/loongarch,
> as that is the only architecture that would notice in this case.
> 
>> By the way, I do not know why it can not generate System.map by the
>> installkernel in practice, could you please check it?
> 
> Is installkernel a part of the kernel source? I am not sure where to
> begin to investigate that. Could be an inaccurate comment as well if
> installkernel's implementation has been updated.

installkernel is not a part of the kernel source, IIUC it belongs to
systemd:

https://github.com/systemd/systemd/blob/main/src/kernel-install/kernel-install.c

For now, please ignore this series.

Thanks,
Tiezhu


